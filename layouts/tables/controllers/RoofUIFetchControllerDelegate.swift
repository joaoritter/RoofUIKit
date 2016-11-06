//
//  RoofUIFetchControllerDelegate.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 6/11/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RoofUIFetchControllerDelegate: NSObject, NSFetchedResultsControllerDelegate
{
    private var _deletedSectionIndexes: IndexSet? = nil
    private var _insertedSectionIndexes: IndexSet? = nil
    private var _deletedRowIndexPaths: [IndexPath]? = nil
    private var _insertedRowIndexPaths: [IndexPath]? = nil
    private var _movedRowIndexPaths: [(IndexPath, IndexPath)]? = nil
    private var _indexPathsNeedingReload: [IndexPath]? = nil
    
    private var deletedSectionIndexes: IndexSet? {
        get {
            if _deletedSectionIndexes == nil {
                self._deletedSectionIndexes = IndexSet()
            }
            return self._deletedSectionIndexes
        }
        set {
            self._deletedSectionIndexes = newValue
        }
    }
    private var insertedSectionIndexes: IndexSet? {
        get {
            if self._insertedSectionIndexes == nil {
                self._insertedSectionIndexes = IndexSet()
            }
            return self._insertedSectionIndexes
        }
        set {
            self._insertedSectionIndexes = newValue
        }
    }
    private var deletedRowIndexPaths: [IndexPath]? {
        get {
            if self._deletedRowIndexPaths == nil {
                self._deletedRowIndexPaths = [IndexPath]()
            }
            return self._deletedRowIndexPaths
        }
        set {
            self._deletedRowIndexPaths = newValue
        }
    }
    private var insertedRowIndexPaths: [IndexPath]? {
        get {
            if self._insertedRowIndexPaths == nil {
                self._insertedRowIndexPaths = [IndexPath]()
            }
            return self._insertedRowIndexPaths
        }
        set {
            self._insertedRowIndexPaths = newValue
        }
    }
    private var movedRowIndexPaths: [(IndexPath, IndexPath)]? {
        get {
            if self._movedRowIndexPaths == nil {
                self._movedRowIndexPaths = [(IndexPath, IndexPath)]()
            }
            return self._movedRowIndexPaths
        }
        set {
            self._movedRowIndexPaths = newValue
        }
    }
    private var indexPathsNeedingReload: [IndexPath]? {
        get {
            if self._indexPathsNeedingReload == nil {
                self._indexPathsNeedingReload = [IndexPath]()
            }
            return self._indexPathsNeedingReload
        }
        set {
            self._indexPathsNeedingReload = newValue
        }
    }

    private weak var tableView: UITableView?
    var onUpdate: ((_ cell: UITableViewCell, _ object: Any) -> Void)?
    var onFinish: (() -> Void)?
    var ignoreNextUpdates: Bool = false
    
    init(tableView: UITableView?) {
        self.tableView = tableView
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
       if ignoreNextUpdates { return }
        NSLog("\nBEGIN")
    }
    func controller(controller: NSFetchedResultsController<NSFetchRequestResult>, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        
        if ignoreNextUpdates { return }
        switch type {
        case .insert:
            self.insertedSectionIndexes?.insert(sectionIndex)
        case .delete:
            self.deletedSectionIndexes?.insert(sectionIndex)
        default:
            break
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        if ignoreNextUpdates { return }
        
        switch type {
        case .insert:
            guard let insertedSectionIndexes = insertedSectionIndexes,
                let newIndexPath = newIndexPath else { return }
            NSLog("\ninsert -- ip")
            NSLog(newIndexPath.description)

            if insertedSectionIndexes.contains(newIndexPath.section) {
                // If we've already been told that we're adding a section for this inserted row we skip it since it will handled by the section insertion.
                return
            }
            self.insertedRowIndexPaths?.append(newIndexPath)
            
        case .delete:
            guard let deletedSectionIndexes = deletedSectionIndexes,
                let indexPath = indexPath else { return }
            NSLog("\ndelete -- ip")
            NSLog(indexPath.description)
            if deletedSectionIndexes.contains(indexPath.section) {
                // If we've already been told that we're adding a section for this inserted row we skip it since it will handled by the section insertion.
                return
            }
            self.deletedRowIndexPaths?.append(indexPath)
            
        case .update:
            guard let indexPath = indexPath,
                let cell = self.tableView?.cellForRow(at: indexPath) else { return }
            
            NSLog("\nupdate -- ip")
            NSLog(indexPath.description)
            self.onUpdate?(cell, anObject)
            
        case .move:
            guard let insertedSectionIndexes = insertedSectionIndexes,
                let deletedSectionIndexes = deletedSectionIndexes,
                let indexPath = indexPath,
                let newIndexPath = newIndexPath else { return }
            NSLog("\nmove -- from:to:insertedSections:deletedSections")
            NSLog(indexPath.description)
            NSLog(newIndexPath.description)
            NSLog(insertedSectionIndexes.description)
            NSLog(deletedSectionIndexes.description)
            if !insertedSectionIndexes.contains(newIndexPath.section) && !deletedSectionIndexes.contains(indexPath.section) {
                self.movedRowIndexPaths?.append((indexPath, newIndexPath))
                self.indexPathsNeedingReload?.append(newIndexPath)
            }
            else {
                if !insertedSectionIndexes.contains(newIndexPath.section) {
                    self.insertedRowIndexPaths?.append(newIndexPath)
                }
                if !deletedSectionIndexes.contains(indexPath.section) {
                    self.deletedRowIndexPaths?.append(indexPath)
                }
            }
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        defer {
            // nil out the collections so they are ready for their next use.
            self.insertedSectionIndexes = nil
            self.deletedSectionIndexes = nil
            self.deletedRowIndexPaths = nil
            self.insertedRowIndexPaths = nil
            self.movedRowIndexPaths = nil
            self.indexPathsNeedingReload = nil
        }
        
        guard !ignoreNextUpdates else {
            ignoreNextUpdates = false
            return
        }
        
        guard let deletedSectionIndexes = self.deletedSectionIndexes,
            let insertedSectionIndexes = self.insertedSectionIndexes,
            let deletedRowIndexPaths = self.deletedRowIndexPaths,
            let insertedRowIndexPaths = self.insertedRowIndexPaths,
            let movedRowIndexPaths = self.movedRowIndexPaths,
            let indexPathsNeedingReload = self.indexPathsNeedingReload else {
                return
        }
        
        let totalChanges = deletedSectionIndexes.count +
            insertedSectionIndexes.count +
            deletedRowIndexPaths.count +
            insertedRowIndexPaths.count +
            movedRowIndexPaths.count
        
        OperationQueue.main.addOperation {
            [weak self] in
            
            if (totalChanges > 5) {
                self?.tableView?.reloadData()
                return
            }
            
            self?.tableView?.beginUpdates()
            self?.tableView?.deleteSections(deletedSectionIndexes, with: .fade)
            self?.tableView?.insertSections(insertedSectionIndexes, with: .fade)
            self?.tableView?.deleteRows(at: deletedRowIndexPaths, with: .fade)
            self?.tableView?.insertRows(at: insertedRowIndexPaths, with: .fade)
            for moveOperations in movedRowIndexPaths {
                self?.tableView?.moveRow(at: moveOperations.0, to: moveOperations.1)
            }
            self?.tableView?.endUpdates()
            NSLog("\nEND")
            self?.tableView?.reloadRows(at: indexPathsNeedingReload, with: .none)
            self?.onFinish?()
        }
    }
}

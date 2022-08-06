//
//  FIRFirestoreService.swift
//  TablePractice
//
//  Created by Mariano Martin Battaglia on 31/07/2022.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FIRFirestoreService {
    private init() {}
    
    static let shared = FIRFirestoreService()
    
    let productsReference = Firestore.firestore().collection("productos")
    
    func configure() {
        FirebaseApp.configure()
    }
    
    private func reference(to collectionReference: FIRCollectionReference) -> CollectionReference {
        return Firestore.firestore().collection(collectionReference.rawValue)
    }
    
    // MARK: - CRUD: Create, Read, Update, Delete
    func create<T: Codable>(for encodableObject: T, in collectionReference: FIRCollectionReference) {
        do {
            let json = try encodableObject.toJson(excluding: ["id"])
            reference(to: collectionReference).addDocument(data: json)
        } catch {
            print(error)
        }
        /* Must call as:
         FIRFirestoreService.shared.create(for: parameters, in: .collection)
         */
    }
    
    func read<T: Decodable>(from collectionReference: FIRCollectionReference, returning objectType: T.Type, completion: @escaping ([T]) -> Void) {
        reference(to: collectionReference).addSnapshotListener { (snapshot, _) in
            
            guard let snapshot = snapshot else { return }
            
            do {
                var objects = [T]()
                for document in snapshot.documents {
                    let object = try document.decode(as: objectType.self)
                    objects.append(object)
                }
                completion(objects)
            }catch{
                print(error)
            }
        }
    }

    //https://www.youtube.com/watch?v=24ef-Zwz2v8
    
    func update<T: Encodable & Identifiable>(for encodableObject: T, in collectionReference: FIRCollectionReference) {
        do {
            let json = try encodableObject.toJson(excluding: ["id"])
            guard let id = encodableObject.id else { throw MyError.encodingError }
            reference(to: collectionReference).document(id).setData(json)
        } catch {
            print(error)
        }
    }
    
    func delete<T: Identifiable>(_ identifiableObject: T, in collectionReference: FIRCollectionReference) {
        do {
            guard let id = identifiableObject.id else { throw MyError.encodingError }
            reference(to: collectionReference).document(id).delete()
        } catch {
            print(error)
        }
    }
    
}

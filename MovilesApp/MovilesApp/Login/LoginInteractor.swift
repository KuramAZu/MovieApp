//
//  LoginInteractor.swift
//  MovilesApp
//
//  Created by Domingo on 27/Feb/2023.
//

import Foundation
import UIKit

public class LoginClass{
    var sucess = false{
        didSet{
            isActiveDidChange?(sucess)
        }
    }
    var isActiveDidChange: ((Bool) -> Void)?
    func hacerLogin(user: String, pass: String){
        self.getToken(user: user, pass: pass) { response in
            print("el response es...\(response)")
        }
    }
    
    func getToken(user: String, pass: String, completion: @escaping (Result<TokenLoginEnt, Error>) -> Void) {
       // Crear la URL de la solicitud
       guard let url = URL(string: "\(baseUrl)/authentication/token/new?api_key=\(apiKey)") else {
           completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
           return
       }
       
       // Crear la solicitud
       let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
           if let error = error {
               completion(.failure(error))
               return
           }
           
           // Convertir la respuesta a un objeto TokenModel
           guard let data = data else {
               completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
               return
           }
           
           do {
                     let decoder = JSONDecoder()
                     let tokenModel = try decoder.decode(TokenLoginEnt.self, from: data)
               print("el token es \(tokenModel.token)")
                     // Utilizar el token para hacer inicio de sesión
               self.login(user: user, pass: pass, token: tokenModel.token) { _ in
                  // print("se pudo")
                 
               }
                 } catch let error {
                     completion(.failure(error))
                 }
       }
       
       // Iniciar la tarea
       task.resume()
   }

   func login(user: String, pass: String, token: String, completion: @escaping (Result<LoginRequestResponseEnt, Error>) -> Void) {
           let modelo = LoginRequestEnt(username: user, password: pass, request_token: token)
           guard let url = URL(string: "\(baseUrl)/authentication/token/validate_with_login?api_key=\(apiKey)") else {
               completion(.failure(URLError(.badURL)))
               
               return
           }
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           do {
               request.httpBody = try JSONEncoder().encode(modelo)
           } catch {
               completion(.failure(error))
               return
           }
       // Enviar la solicitud de inicio de sesión
       let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
           if let error = error {
               completion(.failure(error))
               return
           }
           print("el request fue: \(request)")
           print("el modelo fue \(modelo)")
           // Comprobar la respuesta
           guard let httpResponse = response as? HTTPURLResponse else {
               completion(.failure(NSError(domain: "No HTTP response", code: 0, userInfo: nil)))
               return
           }
           
           if httpResponse.statusCode == 200 {
               self.sucess = true
            print("Inicio de sesion exitoso")
            
           } else {
               // Error en el inicio de sesión
               print("Login error")
               completion(.failure(NSError(domain: "Login error", code: httpResponse.statusCode, userInfo: nil)))
           }
       }
       
       task.resume()
       }
}


//
//  SearchVC+Extension.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 18/10/2021.
//

import UIKit

extension SearchVC: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    pushFollowerListVC()
    return true
  }
}

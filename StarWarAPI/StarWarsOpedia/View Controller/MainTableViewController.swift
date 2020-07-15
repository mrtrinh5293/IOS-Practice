/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import AlamoFire


class MainTableViewController: UITableViewController {
  @IBOutlet weak var searchBar: UISearchBar!
  
  var items: [Displayable] = []
  var films: [Film] = []
  
  
  // store current selected film to this property
  var selectedItem: Displayable?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchFilms()
    searchBar.delegate = self
  }
  func searchStarships(for name: String) {
    // 1. set url
    let url = "https://swapi.dev/api/starships"
    // 2. set key value parameters that you will send to the end point
    let parameters: [String: String] = ["search": name]
    // 3
    AF.request(url, parameters: parameters)
      .validate()
      .responseDecodable(of: Starships.self) { response in
        // 4. assign the list of starships as the table view's data and the table view
        guard let starships = response.value else { return }
        self.items = starships.all
        self.tableView.reloadData()
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    //get table view to show the content
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
    let item = items[indexPath.row]
    cell.textLabel?.text = item.titleLabelText
    cell.detailTextLabel?.text = item.subtitleLabelText
    return cell
  }
  
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    
    // taking the film from the selected row and saving it to selectedItem
    selectedItem = items[indexPath.row]
    return indexPath
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let destinationVC = segue.destination as? DetailViewController else {
      return
    }
    
    // sets the user' selection as the data to display
    destinationVC.data = selectedItem
    
  }
}

// MARK: - UISearchBarDelegate
extension MainTableViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let shipName = searchBar.text else {return}
    searchStarships(for: shipName)
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = nil
    searchBar.resignFirstResponder()
    items = films
    tableView.reloadData()

  }
}

extension MainTableViewController {
  // 1. Alamofire uses namespacing, so you need to prefix all calls that you use with AF. request(_:method:parameters:encoding:headers:interceptor:) accepts the endpoint for your data. It can accept more parameters
  /* 2. From top to bottom
   -> request end point
   -> validate the response by
     +> ensureing the response returned and HTTP status code in the range 200-299
   -> and decode the response into data model
  */
  func fetchFilms() {
    AF.request("https://swapi.dev/api/films")
    .validate()
    .responseDecodable(of: Films.self) { (response) in
      guard let films = response.value else { return }
      self.films = films.all
//      print(films.all[0].title)
      // assign all retrieved films to items and reloads the table view
      self.items = films.all
      self.tableView.reloadData()
    }
  }
}

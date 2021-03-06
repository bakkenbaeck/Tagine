import UIKit

class DemoTableViewController: UITableViewController {

    let tags = ["Superlong tag","Shorter tag","Normal size","Extremely long tag view","Short","This one too"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(DemoCell.self, forCellReuseIdentifier: DemoCell.reuseIdentifier)

    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = DemoCell.heightForTagView(forTags: self.tags)
        return height
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DemoCell.reuseIdentifier, for: indexPath) as! DemoCell
        cell.tags = tags

        return cell
    }

}

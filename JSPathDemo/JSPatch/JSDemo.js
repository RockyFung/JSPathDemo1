/**
 * Created by rocky on 16/12/14.
 */

// 用到的类写在这里
require('DetailViewController,NSString,UITableViewCell,UIColor')
defineClass('ViewController', {
            // 点击cell方法
            tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {

            self.setDataArray(["aaa", "bbb", "ccc"]);
            var row = indexPath.row()
            if (row > self.dataArray().count() - 1) {
            return;
            }
            var title = self.dataArray()[row];
            self.pushVC("第"+row+"页");
            },

            // 返回cell方法
            tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
            var cell = tableView.dequeueReusableCellWithIdentifier("cell");
            if (!cell) {
            cell = UITableViewCell.alloc().initWithStyle_reuseIdentifier(3, "cell"); // 枚举类型直接写数字
            }
            var row = indexPath.row()
            cell.textLabel().setText(NSString.stringWithFormat("我是第"+row)); // 字符串拼接遵循JS方法
            cell.textLabel().setTextColor(UIColor.blueColor());
            cell.detailTextLabel().setText("abcdefg");
            return cell;
            },
            
            // 返回row数量方法
            tableView_numberOfRowsInSection: function(tableView, section) {
            return 10;
            },
            
            // 新添加的跳转方法
            pushVC: function(title) {
            var detailVC = DetailViewController.alloc().init();
            detailVC.navigationItem().setTitle(title);
            self.navigationController().pushViewController_animated(detailVC, YES);
            },
            
});

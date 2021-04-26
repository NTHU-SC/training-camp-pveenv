# training-camp-PVEenv

## 用途
這是用來批次創建超算訓練營虛擬機叢集的 Script。
快速建立「學習安裝 Linux 叢集」的環境。

每組規格為：
- 1 叢集包含 2 節點：`head` and `work`
- 兩節點預先放入相同系統之 ISO 光碟
- 兩節點之網路「假想接線」如下圖：
![](https://i.imgur.com/d608wU1.png)

## 安裝
跑以下 Script 前，需要在 PVE 內，先創立至少一種系統的叢集樣本。
舉例來說如下建立一組 Ubuntu 叢集：

| VMID | Name | 附註 |
| -------- | -------- | -------- |
| 2021001 | ubuntu-head-temp|Ubuntu 叢集的 Head node 的樣本 |
| 2021002 | ubuntu-work-temp|Ubuntu 叢集的 Work node 的樣本 |
> 其中：
> - 2021：年份（無特別意義的 suffix，但請保留）
> - 00：這是第 00(Ubuntu)組的樣本
> - 1 or 2：這是 head or work node


## create-sc.sh
`./create-sc.sh <VMID suffix> <start> <end>`
在範圍 `[start, and]` 建立 `end - start` 組 `<VMID>` 類型的叢集。

- VMID suffix：除了末碼以外的全部數字。例如：202100
- start：起始的叢集編號。
- end：末端的叢集編號。

該指令會以 `21TTX` 作為 VM 的 VMID，TT 代表組，X 為 1 或 2 分別代表 head or work node。

>使用方式：
`./create-sc.sh 202100 1 3` 可以建立 3 組 Ubuntu 叢集


## adduser-sc.sh 
`./adduser-sc.sh <start> <end>`
為範圍 [start, and] 的叢集新增對應權限的使用者。

- start：起始的叢集編號。
- end：末端的叢集編號。

>使用方式：
`./adduser-sc.sh 1 15` 建立 15 組擁有對應 VM 權限的使用者

## start-all-vm-sc.sh

`./start-all-vm-sc.sh`
預設啟動所有 21 開頭的 VM，意即啟動所有叢集

>使用方式：
`./start-all-vm-sc.sh`

## update.sh
`./update.sh <VMID suffix> <start> <end>`
修正用的 Scipt，可自行改寫 qm set 後的內容，批次更新群集。

- VMID suffix：除了末碼以外的全部數字。例如：202100
- start：起始的叢集編號。
- end：末端的叢集編號。

下圖為將所有叢集設定為自動開機、`12*2` 個 CPU、32G 記憶體。
![](https://i.imgur.com/CDm6XUt.png)

>使用方式：
`./update.sh 202100 1 15`

## deluser-sc.sh
`./deluser-sc.sh <start> <end>`
刪除範圍 `[start, and]` 的使用者。

## remove-all-vm-sc.sh
`./remove-all-vm-sc.sh`
完全刪除「所有」21 開頭的虛擬機。

## usbip.sh
`./usbip <VMID> <RemoteIP> <BusID>`
將遠端 `<RemoteIP>` 上指定之 `<BusID>` 的 USB 裝置，插入 `<VMID>` VM 內。

>使用方式：
`./usbip 2021001 10.121.123.123 1-1.3` 將該 IP 的 USB 裝置 Passthrough 到 2021001 裡。

## 建置完成
![](https://i.imgur.com/qttrBeb.png)

更多相關資料可以參考 sc22 訓練營統一入口網站：
https://hackmd.io/@NTHUSC/note


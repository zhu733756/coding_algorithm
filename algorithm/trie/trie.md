## 1 结点本身不存完整单词;
## 2 从根节点到某一节点,路径上经过的路径连接起来,为该节点对应的字符串;
## 3 每个节点的子节点路径代表的字符都不相同;
```
class Trie:

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.trie_dict = {}
        self.end_char = "#"


    def insert(self, word: str) -> None:
        """
        Inserts a word into the trie.
        """
        if not word:
            return 
        node = self.trie_dict
        for char in word:
            node = node.setdefault(char,{})
        node[self.end_char]= self.end_char


    def search(self, word: str) -> bool:
        """
        Returns if the word is in the trie.
        """
        if not word:
            return False
        node = self.trie_dict
        for char in word:
            temp = node.get(char)
            if not temp:
                return False
            node = temp
        return node.get(self.end_char) == self.end_char

    def startsWith(self, prefix: str) -> bool:
        """
        Returns if there is any word in the trie that starts with the given prefix.
        """
        if not prefix:
            return False
        node = self.trie_dict
        for char in prefix:
            temp = node.get(char)
            if not temp:
                return False
            node = temp
        return True
```
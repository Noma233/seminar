#include<bits/stdc++.h>
using namespace std;

int main() {
        set<int> a = {1, 2, 3, 4};
        set<int> b = {4, 3 , 1, 1};
        if(a == b) {
                cout << "correct" << endl;
        }else {
                cout << "false" << endl;
        }
}
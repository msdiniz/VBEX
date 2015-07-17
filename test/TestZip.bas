Attribute VB_Name = "TestZip"
'@TestModule
Option Explicit
Option Private Module
Private Assert As New Rubberduck.AssertClass

'@TestMethod
Public Sub EmptyZip()
    Dim z As List
    Set z = Tuple.Zip(List, List.Create(), List.Create())
    Assert.areequal CLng(0), z.Count, "Empty ZipList is Empty"
End Sub
'@TestMethod
Public Sub NonEmptyZip()

    Dim z As List
    Set z = Tuple.Zip(List, List.Create(1, 2, 3, 4, 5), _
        List.Create("a", "b", "c", "d", "e"))
    Assert.areequal "Tuple", TypeName(z(1))
    Assert.areequal CLng(2), z(1).Count
    
    Assert.areequal 5, z(z.Count).Item(1)
    Assert.areequal "e", z(z.Count).Item(2)
    
End Sub
'@TestMethod
Public Sub UnEvenZip()

    Dim z As List
    Set z = Tuple.Zip(List, List.Create("a"), List.Create(1, 2, 3))
    Assert.areequal CLng(1), z.Count, "uneven took size of list A"

    Assert.areequal "a", z(1).Item(1)
    Assert.areequal 1, z(1).Item(2)
    
End Sub
'@TestMethod
Public Sub UnEvenZipTakesSmallest()

    Dim l1 As List
    Set l1 = Tuple.Zip(List, List.Create("a"), List.Create(1, 2, 3))
    Assert.areequal CLng(1), l1.Count
    
    Dim l2 As List
    Set l2 = Tuple.Zip(List, List.Create(1, 2, 3), List.Create("a"))
    Assert.areequal CLng(1), l2.Count
    
End Sub


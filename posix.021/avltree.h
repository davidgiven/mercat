/* avltree.h
 * Include files for a generalised AVL tree routine
 * (C) 1998 David Given
 */

/* Represents a single node of the tree */

typedef struct AVLNode_s {
#ifdef DEBUG
	int32 magic;
#endif
	void *data;
	struct AVLNode_s *subtree[2];
	int balance;
} AVLNode;

/* Various callbacks */

typedef int (*AVLComparisonFunc)(void*, void*);
typedef void (*AVLCallbackFunc)(void*);

/* Prototypes */

extern void* AVLTree_Search(AVLNode* root, AVLComparisonFunc comparefunc,
	void* target, int cmp);
extern void* AVLTree_Insert(AVLNode** rootp, AVLComparisonFunc comparefunc,
	void* item, int* change);
extern void* AVLTree_Delete(AVLNode** rootp, AVLComparisonFunc comparefunc,
	void* item, int* change, int cmp);
extern void AVLTree_Nuke(AVLNode* root, AVLCallbackFunc deletefunc);
extern int AVLTree_Validate(AVLNode* this, AVLComparisonFunc comparefunc);
extern void AVLTree_Traverse(AVLNode* node, AVLCallbackFunc displayfunc);

#ifdef DEBUG

/* Node recognition magic number */

#define AVLTREE_MAGIC (0x11AA2233)

/* Function to display the value of a node */

typedef AVLCallbackFunc AVLDisplayFunc;

/* Prototypes */

extern void AVLTree_Dump(AVLNode* node, AVLDisplayFunc displayfunc, int level);

#endif

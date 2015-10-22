//
//  ViewController.m
//  OrderedList
//
//  Created by Ronald Hernandez on 10/19/15.
//  Copyright © 2015 Evernote. All rights reserved.
//

#import "OrderedListVC.h"

@interface OrderedListVC ()


@end

@implementation OrderedListVC

/*ASSUMPTIONS:

 1. text property represents a string from a file document. I wasn't sure if reading from the file was part of the requirement. If it is please let me know and I can modify my code. For now text will represent the text obtain from the textfield.
 2. Use of Standard data structures and associated methods
 3. Need to remove puntuation
 4. Need to convert all words to lower case
 5. Need to print words in order based on frequency until maxCount (size of the array returned)
 6. We only need to print each word once (no repeated words)
 7. We also need to test our function reading form a file (medium and large) which are included in our resource. 
 8. We also need to retrieve data (text string) from the web.
 */


/* In the viewDidLoad, we will initialize the text which represents our "file". We will initialize our words dictionary and we will call our method which we will provide two paramenters. 1) text String and 2. maxCount
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //A. Text stored as a propertly (small)
    NSString *text = @"Katniss Everdeen, who tells her story in the first person, wakes up. It is the day of the reaping. She sees her little sister, Prim (short for Primrose), asleep in bed with their mother across the room. Katniss puts on her clothes to go hunting. The area where she and her family live is called the Seam, and it’s part of District 12. They are at the edge of the district, which is enclosed by a high fence, and Katniss often crawls under the fence and enters the woods outside, where she forages and hunts. Her father taught her these skills before his death in a mine explosion when she was eleven years old, and she uses a bow he made. Though trespassing in the woods and poaching are illegal, nobody pays attention, and Katniss even sells meat to the Peacekeepers who are supposed to enforce the laws. Most people in the district, she explains, don’t have enough food.She meets her friend Gale in the woods. They discuss running away, but both are the caretakers of their families. They catch some fish, then stop by the district’s black market, called the Hob, to trade for bread and salt. They go to the mayor’s house to sell strawberries they collected and talk to the mayor’s daughter, Madge, whom Katniss is friendly with at school. Madge is dressed for the reaping in case she’s chosen, and Gale becomes angry because of the injustice of the reaping process. Katniss explains that, at age twelve, your name is entered into the drawing once; at thirteen, it’s entered twice; and so on up until age eighteen. But you can choose to have your name entered again in exchange for a tessera, a year’s supply of grain and oil for one person. Poor people often need tesserae to survive, so the children of the poor end up having their names entered numerous times. Katniss, who is sixteen, will have her name in twenty times, and Gale, who is eighteen, will have his in forty-two times. Katniss’s sister, Prim, is only twelve and has taken no tesserae, so her name is only in once. Katniss returns home, and after she gets ready, goes with her mother and Prim to the town square. That’s where the reaping, which is televised and treated like a festive event, takes place in their district.";


        NSLog(@"List of most frequent word for hard coded string %@", [self mostFrequentWordsFromString:text maxCount:9]);

    //B. Test file with medium size string
    //1. Get file path to large file.
    //2. Get the content of the file and store it as a string
        NSString *filePathMedium = [[NSBundle mainBundle] pathForResource:@"mediumText" ofType:@"txt"];


        NSString *mediumSizeString = [NSString stringWithContentsOfFile:filePathMedium encoding:NSUTF8StringEncoding error:nil];


        NSLog(@"List of most frequent words for small text file: %@",[self mostFrequentWordsFromString:mediumSizeString maxCount:10]);


    //C. Test file with a large size string.
        //1. Get file path to large file.
        //2. Get the content of the file and store it as a string.

        NSString *filePathLarge = [[NSBundle mainBundle] pathForResource:@"largeText" ofType:@"txt"];

        NSString *largeSizeString = [NSString stringWithContentsOfFile:filePathLarge encoding:NSUTF8StringEncoding error:nil];

         NSLog(@"List of most frequent words for large text file: %@", [self mostFrequentWordsFromString:largeSizeString maxCount:10]);

    //D. Text retrieved from the web from textfile.com - we will used http://textfiles.com/holiday/santa1.fun for our url.

    NSString *textFromWeb = [self getContentFromWeb:@"http://textfiles.com/holiday/santa1.fun"];

    NSLog(@"List of most frequent words in text retrieved from the web: %@ ", [self mostFrequentWordsFromString:textFromWeb maxCount:10]);



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/* Function takes two paramenters:
 1. a String representing a text document
 2) an Integer providing the number of items to return.

 Result: The function returns a list of Strings ordered by word frequency, the most frequent occurring word first. The solutions should run in O(n) where n is the number of of words in the document.

 Plan of Attack
 1. check if the "file" is empty.
 2. Convert all words to lowercase
 3. Remove puntuation
 4. Convert the resulting string to an array of strings.
 4. Convert string to NSDictonary and keep count of the their frequency.
 a) If the word exist, simply update the frequncy of the word for that particular key.
 b) if the word does not exists, you need add it to the dictionary and increment the requncy by 1.

 */


/* ANALYSIS:

 1. Remove punctuation => (Assumption) Goes word by word to find any punctuation and removes it. => O(n)
 2. Convert to lowercase => (Assumption) Goes word by word to convert to lowercase. => O(n)
 3. Convert string to array of n words. => Goes through ever word in the string and adds it an array. O(n)
 4. Iterate through the wordsArray n times O(n) check if str exists in the the wordDictionary, if not add it O(1). Therefore => O(n) + O(1)
 5. Remove any empty strings from wordsDictionary => O(1)
 6. Sort by keys by thier Values. Will use keysSortedByValueUsingComparator: Definition:  Returns an array of the dictionary’s keys, in the order they would be in if the dictionary were sorted by its values using a given comparator block. 
    Assumption: O(n) might be better, but couldt not find information about it's running time :/ 
  
O(n) + O(n) + O(n) + (O(n)+ O(1)) + O(1) + O(n) => O(5n) + O(2) => O(n)



 */
-(NSArray *)mostFrequentWordsFromString:(NSString *)text maxCount:(NSUInteger )maxCount{

    NSArray *sortedList = [NSArray new];

    //check if the text is empty..if so.. provide a message.
    if ([text isEqualToString:@""]) {

        NSLog(@"the text file was empty");

    }else{

        //First we need to remove puntuation. Also need to convert the words to lower case so all words can be evaluated equally.
        //Additionally, we need to sore the words into an array.


        NSArray *wordsArray = [[[[text componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet]invertedSet]]
                                 componentsJoinedByString:@" "] lowercaseString] componentsSeparatedByString:@" "];
        NSMutableDictionary *wordsDictionary = [NSMutableDictionary new];

        //iterate through the array of words
        for (NSString *str in wordsArray){

            //if the word does not exists in the dictionary, we need to add it to the dictionary and set it's initial value to @1;

            if (![wordsDictionary objectForKey:str] && ![str isEqualToString:@" "]) {

                [wordsDictionary setObject:@1 forKey:str];

            }else{
                //get the value for that key
                int value = (int)[[wordsDictionary objectForKey:str] integerValue] + 1;

                //then overide the current value withthe new value.

                [wordsDictionary setObject:[NSNumber numberWithInt:value] forKey:str];

            }
        }

        //remove any empty strings
        [wordsDictionary removeObjectForKey:@""];

        NSLog(@"%@",wordsDictionary);

        //We want to sort the list of words based on their values (frequencies). Additionally we want to reverse the order so highest frequency is first.

        sortedList = [[[wordsDictionary keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {

            return [obj1 compare:obj2];
        }] reverseObjectEnumerator] allObjects];
    }
    
    //We only want to return the number of items based on the maxCount.
    
    return [sortedList subarrayWithRange:NSMakeRange(0, maxCount)];
}

#pragma mark - Helper Method 
-(NSString *)getContentFromWeb:(NSString *)urlString{

    NSURL *url = [NSURL URLWithString:urlString];

    NSStringEncoding usedEncoding;
    NSError *error;

    NSString *text = [NSString stringWithContentsOfURL:url usedEncoding:&usedEncoding error:&error];

    return  text;
}
@end

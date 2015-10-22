//
//  OrderedListTests.m
//  OrderedListTests
//
//  Created by Ronald Hernandez on 10/20/15.
//  Copyright © 2015 Evernote. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OrderedListVC.h"

@interface OrderedListTests : XCTestCase
@property (nonatomic) OrderedListVC *vcToTest;


@end

@implementation OrderedListTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

    self.vcToTest = [OrderedListVC new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
-(void)testEmptyStringForMostFrequentWordsFromString{

    XCTAssertNil([self.vcToTest mostFrequentWordsFromString:@"" maxCount:2]);


}
-(void)testExpectedNumberOfWords{

    NSString *text = @"Katniss Everdeen, who tells her story in the first person, wakes up. It is the day of the reaping. She sees her little sister, Prim (short for Primrose), asleep in bed with their mother across the room. Katniss puts on her clothes to go hunting. The area where she and her family live is called the Seam, and it’s part of District 12. They are at the edge of the district, which is enclosed by a high fence, and Katniss often crawls under the fence and enters the woods outside, where she forages and hunts. Her father taught her these skills before his death in a mine explosion when she was eleven years old, and she uses a bow he made. Though trespassing in the woods and poaching are illegal, nobody pays attention, and Katniss even sells meat to the Peacekeepers who are supposed to enforce the laws. Most people in the district, she explains, don’t have enough food.She meets her friend Gale in the woods. They discuss running away, but both are the caretakers of their families. They catch some fish, then stop by the district’s black market, called the Hob, to trade for bread and salt. They go to the mayor’s house to sell strawberries they collected and talk to the mayor’s daughter, Madge, whom Katniss is friendly with at school. Madge is dressed for the reaping in case she’s chosen, and Gale becomes angry because of the injustice of the reaping process. Katniss explains that, at age twelve, your name is entered into the drawing once; at thirteen, it’s entered twice; and so on up until age eighteen. But you can choose to have your name entered again in exchange for a tessera, a year’s supply of grain and oil for one person. Poor people often need tesserae to survive, so the children of the poor end up having their names entered numerous times. Katniss, who is sixteen, will have her name in twenty times, and Gale, who is eighteen, will have his in forty-two times. Katniss’s sister, Prim, is only twelve and has taken no tesserae, so her name is only in once. Katniss returns home, and after she gets ready, goes with her mother and Prim to the town square. That’s where the reaping, which is televised and treated like a festive event, takes place in their district.";

    NSArray *testArray = [self.vcToTest mostFrequentWordsFromString:text maxCount:6];

        XCTAssertEqual(6, testArray.count);

}

-(void)testMostFrequentWord{
    NSString *testString = @"As Prim walks up to the stage, Katniss, in a panic, rushes forward and shouts that she is volunteering as tribute. A volunteer is allowed to take the place of the person whose name is drawn, but this never happens in District 12. Katniss and Prim embrace, and Gale has to pull Prim away from Katniss. Katniss fights back any sign of emotion because crying will make the other tributes think she’s weak. Effie Trinket asks for a round of applause, but the crowd remains silent and offers only a gesture of respect to Katniss. Haymitch falls off the stage while offering his congratulations. The name of the boy tribute is drawn and it’s Peeta Mellark. Katniss thinks about her interaction with Peeta years earlier. Her father had just died, and her mother fell into severe depression. They had run out of money and food—starvation is common in District 12, she says—and Katniss had wandered into the lane behind the shops of the wealthier townspeople. She searched the trash bins but found nothing. Suddenly a woman was screaming at her to leave from the back door of the bakery. Peeta, who was in Katniss’s grade, was there, and he and the woman (his mother) went back inside. There was a commotion, then Peeta returned with two burned loaves of bread, his mother yelling behind him to feed them to the pigs. He had a welt on his cheek where his mother had hit him. He cautiously threw the loaves to Katniss instead. Katniss brought the bread home and fed her family. It made her hopeful they wouldn’t starve, and she wondered if he had burned the bread on purpose to help her, despite knowing his mother would hit him for it. Later, she saw Peeta at the same time that she saw the first dandelion of spring. Recalling that dandelions are edible, she realized she would have to use the skills her father taught her to keep herself and her family alive, and she associates this realization with Peeta.";


    NSArray *testArray = [self.vcToTest mostFrequentWordsFromString:testString maxCount:6];

    //NSString *mostFrequent = testArray.firstObject;
    XCTAssertEqualObjects(@"the", (NSString *)testArray.firstObject);


}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.


    }];
}

@end

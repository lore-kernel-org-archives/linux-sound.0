From: Heitzso <heitzso@growthmodels.com>
Date: Fri, 03 Mar 2006 20:21:21 +0000
Subject: Re: maudio  audiophile 24/96
Message-Id: <4408A541.2060101@growthmodels.com>
List-Id: <linux-sound.vger.kernel.org>
References: <43E42B45.2060301@growthmodels.com>
In-Reply-To: <43E42B45.2060301@growthmodels.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

envy24control was the solution to my problem.  It allows
reasonable control of my 24/96 audiophile card.   I'm
recording straight into audacity and cleaning the individual
tracks from there.

Thanks

>
>> I'm trying to convert my collection of cassette tapes over to CDs.
>> I purchased two nice used tape decks off ebay.  The nicer of the
>> two is connected to my computer, which is a recent model
>> athlon64 3000+ w/ 1G RAM.
>>
>> Sound was very rough captured with 'arecord' through the
>> computer's built in sound chip so I bought a
>> maudio audiophile 24/96 from newegg to get a clean dac.
>> But my common Linux mixers don't know what to do with the
>> maudio and I feel I may have purchased a fancier audio card
>> than I know what to do with (most mixers certainly don't know
>> what to do with it).
>
>
> I don't see an answer, so I'll note that I have done many tapes and 
> records by using "rec" from the "sox" package, using CD sampling 
> rates, and saving each side of a tape or record to a single wav file. 
> Then I use "audacity" to find and split off each track, do any 
> required processing, always normalize the volume, and save.
>
> At that point I can use lame for mp2, create ogg files, write .inf 
> files to burn CD (usually won't fit), and I personally run shorten on 
> the original wav files (lossless compression) and save them to DVD in 
> batches.
>
> My experience has been that I am able to get most pleasing results 
> doing the best rip I can without mixing, then editing the output as 
> needed, and being able to go back to the first rip if I don't like the 
> ouput, or find a better tool.
>
>>
>> kmix does a reasonable job of picking up and labeling the
>> inputs/outputs/controls.  But I don't know how to use them.
>>
>> I'd appreciate being pointed to:
>>    email list
>>    forum/irc
>>    doc url
>> that might help me out.
>> THANKS
>> -
>> To unsubscribe from this list: send the line "unsubscribe 
>> linux-sound" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
>


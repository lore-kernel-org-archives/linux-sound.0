From: Gerald Teschl <gerald.teschl@univie.ac.at>
Date: Wed, 05 Jun 2002 17:16:51 +0000
Subject: Re: ad1848 driver and opl3sa2 cards
Message-Id: <marc-linux-sound-102329744123366@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102329130416241@msgid-missing>
In-Reply-To: <marc-linux-sound-102329130416241@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Zwane Mwaikambo wrote:

>On Wed, 5 Jun 2002, Gerald Teschl wrote:
>
>  
>
>>Why does the ad1848 driver try to use the opl3s2 sound card. Is the card 
>>supposed to
>>work with this driver as well? Here it does not work since it fails to 
>>find the card
>>(isapnp_find_card returns null). Where this is no big deal (one working 
>>driver is
>>sufficien;-),  it still causes problems since automatic configuration 
>>tools like sndconfig
>>from RedHat will fail, since they use the ad1848 which is the first one 
>>listed in
>>    
>>
>
>ad1848 handles the "Microsoft Sound System" aspect, the opl3sax cards are 
>MSS compatible.
>
This I am aware of, but why has it the YMH0021 listed as supported 
device? Both mss/opl3sa2 mixers
work fine so it looks like everything works ok even tough the ad1848 
does not find the card. So
removing the YMH0021 entry from ad1848_isapnp_list[] should be save.

I would like to do this such that sndconfig can configure this card 
correctly.
Would anybody from RedHat (Bill or Alan) care to comment on this one? If 
you search this and other lists for
opl3sa2 you will see that this will make numerous newbees happy!

Gerald





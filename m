From: Zwane Mwaikambo <zwane@linux.realnet.co.sz>
Date: Wed, 05 Jun 2002 16:21:14 +0000
Subject: Re: ad1848 driver and opl3sa2 cards
Message-Id: <marc-linux-sound-102329592521638@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102329130416241@msgid-missing>
In-Reply-To: <marc-linux-sound-102329130416241@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 5 Jun 2002, Gerald Teschl wrote:

> Why does the ad1848 driver try to use the opl3s2 sound card. Is the card 
> supposed to
> work with this driver as well? Here it does not work since it fails to 
> find the card
> (isapnp_find_card returns null). Where this is no big deal (one working 
> driver is
> sufficien;-),  it still causes problems since automatic configuration 
> tools like sndconfig
> from RedHat will fail, since they use the ad1848 which is the first one 
> listed in

ad1848 handles the "Microsoft Sound System" aspect, the opl3sax cards are 
MSS compatible. I sent in a patch to fix the detection sometime in 
2.4.19-pre or so, can you try a newish -ac kernel?

Cheers,
	Zwane

-- 
http://function.linuxpower.ca
		


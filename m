From: flatmax <flatmax@cse.unsw.EDU.AU>
Date: Tue, 11 May 1999 14:14:46 +0000
Subject: Re: Couple of questions 1 real stupid - sorry
Message-Id: <marc-linux-sound-92643651130127@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92643155626678@msgid-missing>
In-Reply-To: <marc-linux-sound-92643155626678@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 11 May 1999 georgek@netwrx1.com wrote:
> Hello:
> 
> First an apology for the really stupid question I'll start with...I'm
> just drawing a complete blank here.
> 
> System Info:
> Gateway 9100XL Notebook
> 	Pentium 350MHz
> 	384 MB RAM
> 	8.1 GB Hard Disk 
> 	all Linux with 768MB of Swap partitions (6 x 128)
> 120MB SuperDisk Drive
> Xircom CE 10/100 Ethernet PCMCIA Adapter
> Caldera OpenLinux 1..3
> kernel 2.0.35
> 
> First the stupid question....
> 5) What type of sound drivers do I need to get that working here...I
> haven't tried to address this much up til now but since I'm
> asking.....
> 
> Thanks,
> George
> 
> ==[George R. Kasica]==        +1 414 541 8579
> President                       +1 800 520 4873 FAX 
> Netwrx Consulting Inc.          West Allis, WI USA 
> http://www.netwrx1.com

For sound you will need to try two methods :
a] No fuss newbie OSS method :
	Go to www.4front-tech.com and grab a self extracting menu driven
	sound driver
b] Super learning trip to interstellar source :
	compile a kernel setting the correct options for sound.
	www.kernel.org (I think) has kernels. Latest is linux 2.2.x
	Hint : compile it as a module first !
c] Check out the other drivers - heard of one called ALSA - don't know
	much about it at this stge though 
	Someone else with a website ref:

Matt
__________
reverse ...
backwards needs forwards
want backwards - first go forwards
viva

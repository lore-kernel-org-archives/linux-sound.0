From: Eric Mitchell <emitchell@altaira.com>
Date: Fri, 03 Mar 2000 14:19:50 +0000
Subject: Re: Playing Multiple Audio streams
Message-Id: <marc-linux-sound-95209407604059@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95205421910517@msgid-missing>
In-Reply-To: <marc-linux-sound-95205421910517@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Thomas Zimmerman wrote:
> 
> Jeff McBride wrote:
> >
> > Hello,
> >
> > Are there any good ways to play several audio sources simultaneously? If
> > an application wants to be playing say, several wave files overtop of each
> > other, does it have to mix them itself and then play one stream. Or are
> > there other drives, or possibly a daemon of some kind to do it?
> >
> > And how about multiple applications that are unaware of each other playing
> > at the same time?
> >
> > Thanks for any help,
> >
> > Jeff
> 
> EsounD deamon is what you are looking for. However, the apps need to
> know to use ESD to play...

Or, as long as the application doesn't memory map the 
sound card DMA buffers (like quake), you can run:

	esddsp program args

to reroute audio device calls to the esd server.  For example:

	esddsp realplay somefile.rm
	esddsp vmware winamp.exe somefile.mp3

-- ebm (ricdude at work)
+=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
| Eric B. Mitchell         mailto:emitchell@altaira.com |
| tel: (301) 809 - 3534    Altair Aerospace Corporation |
| tel: (800) 7 - ALTAIR    4201 Northview Dr. Suite 410 |
| fax: (301) 805 - 8122    Bowie, MD  20716             |
+=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
              ,___
          /"\  / o=\  /"""---==/
         /   \_/  \__/   ---==/ 
         |    //\   || /""TT""/ //\   || ||""\
         |   //  \  ||    ||   //  \  || ||__/
         |  //--=\ |L--/ ||  //--=\ || || "=,
          \      ---==/
           \____---==/

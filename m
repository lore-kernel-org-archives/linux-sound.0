From: Nicholas Robinson <npr@bottlehall.co.uk>
Date: Thu, 13 Aug 2009 04:29:53 +0000
Subject: Re: Command line utility to detect sound
Message-Id: <1250137793.2490.4.camel@elm.bottlehall.co.uk>
List-Id: <linux-sound.vger.kernel.org>
References: <24940295.post@talk.nabble.com>
In-Reply-To: <24940295.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-sound@vger.kernel.org

Hi Jörn

Thank you very much for your reply. I will follow up your suggestions.

Best Wishes

Nick

On Wed, 2009-08-12 at 19:16 +0200, Jörn Nettingsmeier wrote:
> NickRob wrote:
> > Hi
> > 
> > I would like to find a command line utility that will detect sound above a
> > certain volume and do something like terminate with a status or issue a
> > signal that can be trapped by another process. I haven't been able to find
> > anything, but using the words sound and detection together in google leads
> > inexorably to sound card detection!
> > 
> > Alternatively, which library/app would be the best one to start with if I
> > need to adapt something? I'm an experienced programmer, but not with sound.
> 
> check out the linux audio developers' mailing list. for your particular
> application, grab the swh ladspa plugin set, check out the compressors.
> they contain code for envelope followers, which will compute the energy
> of a sound signal using the root-mean-square method. rip it out (it's
> gpl) and add some C glue around it to tie into your shell scripts or
> whatever it is you want to do.
> 
> best,
> 
> jörn
> 
> 


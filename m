From: Ruben Safir <ruben@mrbrklyn.com>
Date: Thu, 30 Sep 2021 03:01:33 +0000
Subject: Re: ALSA kernel projects - for academic purposes
Message-Id: <20210930030132.GA24271@www2.mrbrklyn.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+i=3NDuxK2rZZY6N18=OTbkna3VMVpx4nNgF0vyq3JmQA@mail.gmail.com>
 <CAFSeFg8UJtt1mUSE+ue8kjh5y=yR68g4SuwAcDrRGNXHHMsi=Q@mail.gmail.com>
In-Reply-To: <CAFSeFg8UJtt1mUSE+ue8kjh5y=yR68g4SuwAcDrRGNXHHMsi=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>
Cc: Muni Sekhar <munisekharrms@gmail.com>, alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

Bingo 


Correct Answer


On Wed, Sep 29, 2021 at 10:11:33PM -0400, Aruna Hewapathirane wrote:
> On Fri, Sep 24, 2021 at 10:05 AM Muni Sekhar <munisekharrms@gmail.com>
> wrote:
> 
> > Hi all,
> >
> >
> > What small projects would you suggest to a novice with the ALSA
> > kernel. The aim is to develop a familiarity with the ALSA kernel
> > source code, and also to submit it for academic purposes.
> >
> >
> > --
> > Thanks,
> > Sekhar
> >
> 
> 
> 1. Read the documentation for the Linux Sound Subsystem :
> https://www.kernel.org/doc/html/latest/sound/index.html
> 2. Then try to understand the the ALSA Driver API
> 3. In your kernel source tree under the sound folder/directory you will
> find lot's of useful source code.
> 
> If you open the /sound/x86/intel_hdmi_audio.h file at the very top you will
> see what is below:
> 
> // SPDX-License-Identifier: GPL-2.0-only
> /*
>  *   intel_hdmi_audio.c - Intel HDMI audio driver
>  *
>  *  Copyright (C) 2016 Intel Corp
>  *  Authors: Sailaja Bandarupalli <sailaja.bandarupalli@intel.com>
>  * Ramesh Babu K V <ramesh.babu@intel.com>
>  * Vaibhav Agarwal <vaibhav.agarwal@intel.com>
>  * Jerome Anand <jerome.anand@intel.com>
>  *
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  *
>  *
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  * ALSA driver for Intel HDMI audio
>  */
> 
> All the authors you will notice are from intel and seem to be all south
> asian :-))) pure coincidence ? I somehow
> do not think so.
> 
> Muni in my experience what I have learnt  over the years is there will be
> times when you ask a question and
> you will get very negative or straight-up demoralising and demotivating
> toxic remarks and comments. My advice
> to you is this:
> 
> Have a deaf ear to the obstacles and negative comments, rather use them as
> motivation to achieve your goals.
> 
> *Lesson to take away:*
> 
>    1. Alas! We can’t have a deaf ear to the negative comments that we
>    receive so abundantly from people all around us.
>    I mean even those who don’t usually give advice, would try to stop you
>    from doing something you so eagerly wanted to do,
>    even when they themselves don’t know anything about it. But we can,
>    however, avoid them or use them as a motivation
>    to prove them wrong. Yep, use their words to prove them wrong!
> 
> Good luck - Aruna

> _______________________________________________
> Kernelnewbies mailing list
> Kernelnewbies@kernelnewbies.org
> https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies


-- 
So many immigrant groups have swept through our town
that Brooklyn, like Atlantis, reaches mythological
proportions in the mind of the world - RI Safir 1998
http://www.mrbrklyn.com 

DRM is THEFT - We are the STAKEHOLDERS - RI Safir 2002
http://www.nylxs.com - Leadership Development in Free Software
http://www2.mrbrklyn.com/resources - Unpublished Archive 
http://www.coinhangout.com - coins!
http://www.brooklyn-living.com 

Being so tracked is for FARM ANIMALS and extermination camps, 
but incompatible with living as a free human being. -RI Safir 2013

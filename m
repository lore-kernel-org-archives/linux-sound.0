From: Kadinger Andras <bandit@freeside.elte.hu>
Date: Sun, 29 Nov 1998 13:32:52 +0000
Subject: Re: equalizer application in software?
Message-Id: <marc-linux-sound-91234750129748@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91233787226861@msgid-missing>
In-Reply-To: <marc-linux-sound-91233787226861@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello Derrick,

On Sat, 28 Nov 1998, Derrick J Brashear wrote:

> I don't suppose anyone's done an equalizer application in software, e.g.
> not a controller for a hardware equalizer as in an AWE? Presumably this
> would be something between the audio source and the audio device, or a
> library which could be used by applications desirous of such
> functionality.
> 
> (I assume no such application exists)

I think there might be some audio multiplexing libraries (that takes
audio output of different apps and mixes them together into one stream to 
send to the audio hardware); GNOME/Enlightement at least has one, called
esd or esound I think. Since audio multiplexing is a very good feature, so
is an equalizer, therefore I think building the two together (or at least
making connecting them together simple) is worth the effort.

They also have a wrapper library one can preload to provide this
functionality to 'normal' apps.

Sincerely,
Andras Kadinger
bandit@freeside.elte.hu

From: Miles Lane <miles@speakeasy.org>
Date: Fri, 24 Mar 2000 15:48:04 +0000
Subject: Re: Clicking Crystal
Message-Id: <marc-linux-sound-95391518903046@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95389484719205@msgid-missing>
In-Reply-To: <marc-linux-sound-95389484719205@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Christoph,

I have had this problem with my cs4232 forever.
Is this something you plan on addressing in your
current wave of sound driver cleanup?

Thanks!
	Miles

Bungle wrote:
> 
> Hi.
> I have a Dell pc with on-board sound card in the form of Crystal CS4236 chips. I get a
> clicking noise at the beginning of sounds. Not allways - only if there is a period of silence
> first. For instance, if I am playing an MP3 and I do something in X that generates a sound
> event, the sound is hear fine with no clicking. But if there is no sound playing and a new
> sound is played, you get a click whose volume is proportionsal to the amount of time it's
> been silent for - ie longer silence gives a louder click.
> 
> If it was an analogue device, I would suspect a faulty decoupling capacitor, causing DC to
> build up on the output. But it's digital and only happens in Linux (not Windoze). This implies
> it is a driver thing.
> 
> Does anyone know a fix for this?
> Paul
> Unix techy
> Walton

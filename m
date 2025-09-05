Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A634AAFB
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 11:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073095; cv=none; b=EvQJXuaGaZVKnHNL6KumpJQGhNr3MtB8dRWDaHpAluxtO/o5B0D4RIben9Kjm1P1hEzvs6H/1YEAs77kGUXp94USKAVRtqLlawwKWhKyY7zQqtOpLrpmOMVW9yrS+jSWRnCVXdSE01r/X6JbytdTp3ukOg6gt1w5VcSCqoNiIMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073095; c=relaxed/simple;
	bh=qJw4gR+821N79DHSQ2dhdsnJy+U3hHc/4flpI4ucUbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8z2vuqXcVAWMzMwAIYs57d9uBw8s3D5V3aaVAzfZ8Jkm31BefZZXvDaLObaboEEU3K91K3AtCm7JqWUnX9Y4v3e3GB6gDir5YxWfkVcixBInrMe4sI0+c7Kv2LDm+KT2U5dyk7l3hhYw/4di+wQjqYEH4mMjYxzaT62OPCrMHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=kg8T1sFS; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="kg8T1sFS"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 2562366ECDE9; Fri,  5 Sep 2025 21:21:28 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 2562366ECDE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1757073088; bh=ZsBYoKNNpj3BxtjtN1WyrTauUKvowCpbxcYD+ikPhEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kg8T1sFSpz6z7dgXfHp6f3zk26CEP8F1u1vUf+6sCLlD/xtB7DVFICt1gzrTnp3/6
	 vX8nhxkN8fIm1QGWSJC5lf1F1yqylFj0TefB0cRgpS0s5hNcByac2UbB9/LIsgCAfI
	 99p99rd8NV65xCDkFUGXgX4vyoLYmkjg6dGnHeWJfCq7TGVWM8ewGM0RI8Q14i1g2+
	 a6A57k336NyAmGpRKnTiYfKdC7bZ3GL52PK5FOgLhMtWncZ4wAdI+9TRjBSpFcWQRq
	 hLCX6nOscL3s+D6ZqTglt7cnFTzNNv+IK8zaxuBCMwXq0H0SY680G3nebnIIlK5toZ
	 HiWGw2hrF3EsQ==
Date: Fri, 5 Sep 2025 21:21:28 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Add Vocaster speaker/headphone mute
 controls
Message-ID: <aLrOwOb+6vhdzJzS@m.b4.vu>
References: <aLm2Dy6+O/eLTGVn@m.b4.vu>
 <87y0qtqos3.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0qtqos3.wl-tiwai@suse.de>

On Fri, Sep 05, 2025 at 10:36:28AM +0200, Takashi Iwai wrote:
> On Thu, 04 Sep 2025 17:53:51 +0200,
> Geoffrey D. Bennett wrote:
> > 
> > Add support for the speaker and headphone mute controls on Focusrite
> > Vocaster interfaces. Unlike other Focusrite interfaces, these mute
> > controls are per-output, not per-channel.
> > 
> > Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
> > ---
> >  sound/usb/mixer_scarlett2.c | 97 ++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 96 insertions(+), 1 deletion(-)
> > 
> > diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
> > index e762d6110b1a..f2446bf3982c 100644
> > --- a/sound/usb/mixer_scarlett2.c
> > +++ b/sound/usb/mixer_scarlett2.c
> > @@ -10,8 +10,9 @@
> >   *   - Solo/2i2/4i4 Gen 4
> >   *   - Clarett 2Pre/4Pre/8Pre USB
> >   *   - Clarett+ 2Pre/4Pre/8Pre
> > + *   - Vocaster One/Two
> >   *
> > - *   Copyright (c) 2018-2024 by Geoffrey D. Bennett <g at b4.vu>
> > + *   Copyright (c) 2018-2025 by Geoffrey D. Bennett <g at b4.vu>
> >   *   Copyright (c) 2020-2021 by Vladimir Sadovnikov <sadko4u@gmail.com>
> >   *   Copyright (c) 2022 by Christian Colglazier <christian@cacolglazier.com>
> >   *
> > @@ -75,6 +76,9 @@
> >   * to many LinuxMusicians people and to Focusrite for hardware
> >   * donations).
> >   *
> > + * Support for Vocaster One and Two added in Mar 2024 (thanks to many
> > + * LinuxMusicians people and to Focusrite for hardware donations).
> > + *
> >   * This ALSA mixer gives access to (model-dependent):
> >   *  - input, output, mixer-matrix muxes
> >   *  - mixer-matrix gain stages
> > @@ -364,6 +368,21 @@ static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
> >  	"Mute Playback Switch", "Dim Playback Switch"
> >  };
> >  
> > +/* Vocaster One speaker/headphone mute names */
> > +static const char *const vocaster_one_sp_hp_mute_names[] = {
> > +	"Speaker Mute Playback Switch",
> > +	"Headphones Mute Playback Switch",
> 
> Usually "XXX Playback Switch" indicates that it's a switch for
> mute/unmute, hence we don't put "Mute" here.
> 
> Actually, having a "mute" switch makes difficult to judge how it
> behaves: when the mixer switch is "on", is it muted, i.e. the sound
> goes off?  It's a contradiction to other mixer controls.
> 
> 
> thanks,
> 
> Takashi

Hi Takashi,

Calling it "XXX Mute Playback Switch" distinguishes it from the other
"XXX Playback Switch" controls created by the scarlett2 driver which
are not mute controls, and it also follows the existing pattern for
the other switch controls in the scarlett2 driver.

Some examples:

$ grep 'Playback Switch' *.state
...
[actual mutes:]
Clarett Plus 2Pre.state:                name 'Line 01 Mute Playback Switch'
Clarett Plus 2Pre.state:                name 'Line 02 Mute Playback Switch'
Clarett Plus 2Pre.state:                name 'Line 03 Mute Playback Switch'
Clarett Plus 2Pre.state:                name 'Line 04 Mute Playback Switch'
Clarett Plus 2Pre.state:                name 'Mute Playback Switch'
...
[other boolean controls, not mutes:]
Clarett Plus 2Pre.state:                name 'Dim Playback Switch'
Scarlett Gen 3 Solo.state:              name 'Direct Monitor Playback Switch'
Scarlett Gen 3 18i20.state:             name 'Talkback Mix A Playback Switch'
...
Scarlett Gen 3 18i20.state:             name 'Talkback Mix L Playback Switch'
Scarlett Gen 4 16i16.state:             name 'Speaker Switching Playback Switch'
Scarlett Gen 4 16i16.state:             name 'Speaker Switching Alt Playback Switch'

I have been consistent since I first added mute support in
0c88f9db1910 ("ALSA: usb-audio: scarlett2: Add mute support") in the
use of the terminology "XXX Mute Playback Switch" and the clear logic
of:
- mute on means that it's muted (no sound).
- mute off means that it's not muted.

I think usually "XXX Playback Switch" in other drivers is more of an
"enable audio" boolean rather than a "mute" boolean, so there it makes
sense that off = muted, on = not muted.

On the capture side in the scarlett2 driver, it is similar:

$ grep Switch V*
Vocaster One.state:             name 'MSD Mode Switch'
Vocaster One.state:             name 'Line In 1 DSP Capture Switch'
Vocaster One.state:             name 'Line In 1 Mute Capture Switch'
Vocaster One.state:             name 'Line In 1 Phantom Power Capture Switch'
Vocaster One.state:             name 'Line In 1 Autogain Capture Switch'
Vocaster Two.state:             name 'MSD Mode Switch'
Vocaster Two.state:             name 'Line In 1 DSP Capture Switch'
Vocaster Two.state:             name 'Line In 2 DSP Capture Switch'
Vocaster Two.state:             name 'Line In 1 Mute Capture Switch'
Vocaster Two.state:             name 'Line In 2 Mute Capture Switch'
Vocaster Two.state:             name 'Line In 1 Phantom Power Capture Switch'
Vocaster Two.state:             name 'Line In 2 Phantom Power Capture Switch'
Vocaster Two.state:             name 'Line In 1 Autogain Capture Switch'
Vocaster Two.state:             name 'Line In 2 Autogain Capture Switch'

alsamixer removes "Switch" and "Capture" from the name and displays
e.g.:
- Line In 1 DSP
- Line In 1 Mute
- Line In 1 Phantom Power

For each of those, off means function disabled and on means function
enabled, so the naming in my patch maintains consistency with all the
existing device controls. It also reflects the hardware where they are
called mute controls, and 0 = not muted, 1 = muted.

Does this address your concerns? The alternative would be to rename to
"XXX Playback Switch" and make off = mute. I think that would make it
more consistent with other drivers, but less consistent with the
existing device controls.

Regards,
Geoffrey.

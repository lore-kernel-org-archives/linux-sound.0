Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C58CB674
	for <linux-sound@vger.kernel.org>; Mon,  1 Jul 2024 02:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719802299; cv=none; b=Dz9sHlBMLuebrqVX3CKQ5Veg0KsorwXERGkj7tGD9q1neNGA/EeiFk+rjRkwdi5QdCCyc6armpLMEJFebPAAXEk2fUZNYQ4FTIPwcMiU2hWfB5rnXUwAull/SK20hA31wJk0Dhl6Qf8sUm3GQICD5ERQkQERwGo/f4JSqMrLqsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719802299; c=relaxed/simple;
	bh=T+3QnOE1arN4m86oKGlpqiNveo+rq531LTN9zwAwCYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzpVaR3hMUTCz6tZ6zFzQB7bS37M71/+TyRtikNUUi5/EDhwgHl3ZyDRmbmq0WG9ZeaZVm/9qNKIqum4lslnW29qCSwSyJ48R+9e6kfTI0uF5uxhDxtnzwc6jQ6p6S7qBax06aABj/t5bZBK+NaI/j7rf3p5f89egaCgT9wF4LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=Mam3VS2P; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="Mam3VS2P"
Received: by m.b4.vu (Postfix, from userid 1000)
	id F0BFF60076C6; Mon,  1 Jul 2024 12:15:41 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu F0BFF60076C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1719801941; bh=XPGvHpTa6O0lJhx0PEo3ZlDgLpN7Ol9w+Fc3Zy2w1mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mam3VS2Pq9+neyJXeKQiIF7TP611434uXKT2cZwZ6oAKFWPjLCyNEvItuRXpxdN2t
	 13s3RgXDmDdn8d5HhllTlKru770jbLWZG6jE7JO6ZVcggsyJ/sVWF8xMactv+ovuDF
	 cgmGgf/m4D+lp1Sgxrx+X42LInWo/KVvZe+bV1twgI4gJCzUAhyuq8kY7yO5pxPECU
	 g4LwF74+3HunndMqALrLoJ93Ox6Ht2HUXynufouhLWjdAs2zjWMtJqvTpM6Xl/vsM0
	 U/g7JcfeR0qSiHMx6aAuhM8JE2aw7qo65rpvc8BNxxwQB5RsfauQ8292OC7AxAZDTj
	 bc9fAhsETPKFw==
Date: Mon, 1 Jul 2024 12:15:41 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Asahi Lina <lina@asahilina.net>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: Handling complex matrix mixers in ALSA
Message-ID: <ZoIYVVB+zDP78Apd@m.b4.vu>
References: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>

Hi Lina,

On Mon, Jul 01, 2024 at 01:04:41AM +0900, Asahi Lina wrote:
> Hi,
> 
> I'm reverse engineering and implementing support for the RME Digiface
> USB, which is an ADAT interface with a non-class-compliant interface
> (probably similar to other RME interfaces like the MADIface, but I don't
> have any others to test). The basic audio streaming works fine with an
> entry in quirks-table.h and a format quirk to set the system sample rate
> in quirks.c. Now I need to figure out how to implement the mixer controls.
> 
> Currently I have the snd-usb-audio driver claiming only interface #0
> (streaming) and I use a Python script to control the mixer/settings
> directly with libusb (control transfers and interface #1). This works
> fine and there's some prior art for this in the firewire world (for
> example, snd-dice doesn't do any mixer control stuff and you have to use
> ffado-mixer to control everything from userspace) but I assume it's not
> really the best way to go?

I'm the developer of the Scarlett2 driver. Doing as much as possible
through ALSA mixer controls has worked well in my experience; as you
say, being able to do save/restore with alsactl is useful.

> The problem is that the device has a 66x34 matrix mixer, with up to 2048
> cross points enabled at once. Exposing each cross point as an ALSA mixer
> control (similar to how mixer_scarlett2.c does it) would mean 2244
> controls just for the mixer... which seems like a bit too much.

Note that mixer controls may have more than one value. So I think you
could have 66 controls with 34 values or 34 controls with 66 values or
1 control with 2244 values.

> On top of that there is also VU meter feedback for all the
> inputs/outputs, as well as general fader controls for each output and
> global output configs and status. I'm not sure about the VU meters, but
> everything else sounds like it would map fine to normal mixer controls.

I handle the VU meter feedback in the Scarlett2 driver with a
read-only volatile control that contains multiple values (see
scarlett2_meter_ctl).

Regards,
Geoffrey.

> Is there some recommended way to expose this kind of matrix mixer
> interface to userspace? I think for something like this you pretty much
> have to rely on device-specific tools to make the UX manageable, so
> maybe hwdep... but at least exposing everything as an ALSA control would
> have the advantage of supporting save/restore with something like
> alsactl. So I don't really know what's the way to go here.
> 
> System settings/general status/output faders go via control transfers,
> while interface #1 has an interrupt IN endpoint (streaming state
> feedback, not very useful) and two bulk endpoints (matrix mixer control
> out, VU meter data in). There's another pair of bulk endpoints in
> interface #2 which I'm guessing are for firmware updates (I haven't
> looked at that part). So in principle it's not crazy to expose all the
> system controls/output faders as mixer controls in ALSA and leave
> interface #1 entirely unclaimed so a userspace program can directly
> configure the matrix mixer and access VU meter levels. There is a global
> mixer enable bit (controlled via ctl transfer), so if that is exposed as
> an ALSA control and disabled by default the interface will operate as a
> 1:1 in/out interface without needing any custom userspace to configure
> the mixer.
> 
> There's one other quirky thing: it also needs a way to set the sample
> rate as a mixer control, because you need to be able to configure the
> rate even when the PCM device is not open (since that affects
> stand-alone mixer operation). I imagine the right logic here would be to
> have a selector control for the system sample rate, and automatically
> change it and lock it when the PCM is opened with a given rate?
> 
> Any thoughts welcome ^^
> 
> ~~ Lina

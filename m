Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66952D605
	for <linux-sound@vger.kernel.org>; Thu,  4 Jan 2024 23:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bernhard-seibold.de header.i=@bernhard-seibold.de header.b="h1CI9EDG"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4T5jlR0Wzbz9sTV;
	Fri,  5 Jan 2024 00:41:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernhard-seibold.de;
	s=MBO0001; t=1704411667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3d9drTXgTBPvucpXXCPH34AI9ExU+9OLjsdXubybxqg=;
	b=h1CI9EDGxdMvK2fEhs+FDYANjO+wNWOBJjLWllI+xlSJpf6x4EZUdeFFrS8VsxchqIJu77
	oFy0nPjHs1j6Dm9zU/72XyH0CR8HkpcAXzU6G/PYyYDlml9WlcokY3RRIZzib8jpUeoIQY
	BQJ29EKDmxrWgP1zreBn0baTNokuWGFmGClLbe7nmvhi3OQlfUB80Ln/UOF5foRGIpnxno
	ujfzcXrKlFOmPNzWBJxqD2Pk1pBxP2SU/ZN8ckfwgMxHucaCn2zFagNwstBcizcmBkXQxT
	NAiqNtJwx6agv2+2NDM8rfNPxatrjpl8g9GodogUFW5jVq1acvUAGi02DcR94Q==
Date: Fri, 5 Jan 2024 00:41:04 +0100
From: Bernhard Seibold <mail@bernhard-seibold.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mark Brown <broonie@kernel.org>
Subject: Re: Re: [PATCH] ALSA: hda: generic: Always add LED controls
Message-ID: <quafrf7nulmb6gwap5hu3qzkpx4ihyae4nuko7vff5ouohooub@ntpvfuf2bv6u>
References: <20240104155838.7514-1-mail@bernhard-seibold.de>
 <871qaxkq43.wl-tiwai@suse.de>
 <3253emuy3njov4thaognxfb4c4e32e2cj5xr25k4wjd4iewfl5@cz6sf4nhxdv7>
 <5aa91315-1f14-473f-877e-5d6b1aa3327a@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5aa91315-1f14-473f-877e-5d6b1aa3327a@perex.cz>

On Thu, Jan 04, 2024 at 10:46:04PM +0100, Jaroslav Kysela wrote:
> On 04. 01. 24 20:14, Bernhard Seibold wrote:
> > On Thu, Jan 04, 2024 at 05:41:48PM +0100, Takashi Iwai wrote:
> > > On Thu, 04 Jan 2024 16:58:38 +0100,
> > > Bernhard Seibold wrote:
> > > > 
> > > > LEDs for mute and microphone mute can be added to any system via the
> > > > audio-mute and audio-micmute triggers, e.g. via USB HID devices.
> > > > Therefore, add the LED controls unconditionally.
> > > 
> > > Hmm...  Won't your change lead to the sysfs entries always,
> > > i.e. creating sysfs entries even if the device has no LED at all?
> > 
> > This patch is not affecting create_mute_led_cdev, that function is still
> > only called for some special systems via fixups, to create the actual
> > LED classdevs that are present on there.
> > 
> > What I'm trying to change is to have the led-ctls always available. They
> > serve as input to the audio-mute and audio-micmute triggers, and these
> > triggers should work on any system with HD Audio, not just a few.
> > 
> > It would be even better to move the whole functionality into the sound
> > core so that it works with other drivers as well, but since yesterday was
> > the first time I even looked at sound code, I wouldn't even know where
> > to start.
> 
> You can attach controls using sysfs for special use cases. If the system has
> audio LED driver controlled in other code, the HDA driver should be notified
> somehow to create triggers, otherwise the default (current) functionality is
> fine in my eyes.

I've got a USB keyboard that has LEDs for mute and for microphone mute,
and these currently do not work as expected. I'm not sure how special
that use-case is, but I don't think expecting users to manually fiddle
around in sysfs to get their keyboard LEDs working is a good solution.

Regards,
Bernhard

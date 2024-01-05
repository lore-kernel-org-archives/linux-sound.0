Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7192D78A
	for <linux-sound@vger.kernel.org>; Fri,  5 Jan 2024 13:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bernhard-seibold.de header.i=@bernhard-seibold.de header.b="Fmv9Ua90"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4T64Vz3x99z9sst;
	Fri,  5 Jan 2024 14:46:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernhard-seibold.de;
	s=MBO0001; t=1704462395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rtQ8u+1Gn6XvupJWXcx5P1mq23+PDEIr1alhYvyS/Ec=;
	b=Fmv9Ua90fFQHwexbQowVVgIClEFO55b3YIflvV8TVpwNc6xhF66Cuv2CFrrKcRRMTDpq2O
	MRdrt3xZkw2eBKE70sargrDkSQfdzpRd+BxRtLfp6XID274ZF4hoAFsZQ9HEDwCa+FXzEq
	6podDXYSiv5nG459D34JXoYe7I60EnR5NawuS4h3WnVR/lXO3WQ3OC0vNxoXefw4LmMdqm
	5dnW2iT0wkntZQyP6K7BooWJ9irkgNLBJ2cNR22irnVgKxwflsUIBUEtBpGjo83c/1Mtak
	JWeTnnXvf555/QKdgB0G+c6DXas09p5fIOFrWeTQDxd1MKStyDK+JH0tlD/zvQ==
Date: Fri, 5 Jan 2024 14:46:32 +0100
From: Bernhard Seibold <mail@bernhard-seibold.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mark Brown <broonie@kernel.org>
Subject: Re: Re: [PATCH] ALSA: hda: generic: Always add LED controls
Message-ID: <bqj4ijbyb5rj5ut6rr5ze3fv7lv4pb3satnxjiv3sodxan5emr@sf3t5rpoujog>
References: <20240104155838.7514-1-mail@bernhard-seibold.de>
 <871qaxkq43.wl-tiwai@suse.de>
 <3253emuy3njov4thaognxfb4c4e32e2cj5xr25k4wjd4iewfl5@cz6sf4nhxdv7>
 <5aa91315-1f14-473f-877e-5d6b1aa3327a@perex.cz>
 <quafrf7nulmb6gwap5hu3qzkpx4ihyae4nuko7vff5ouohooub@ntpvfuf2bv6u>
 <4a85b80e-8df2-464c-b744-cad325d31603@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a85b80e-8df2-464c-b744-cad325d31603@perex.cz>

On Fri, Jan 05, 2024 at 10:27:52AM +0100, Jaroslav Kysela wrote:
> On 05. 01. 24 0:41, Bernhard Seibold wrote:
> > On Thu, Jan 04, 2024 at 10:46:04PM +0100, Jaroslav Kysela wrote:
> > > You can attach controls using sysfs for special use cases. If the system has
> > > audio LED driver controlled in other code, the HDA driver should be notified
> > > somehow to create triggers, otherwise the default (current) functionality is
> > > fine in my eyes.
> > 
> > I've got a USB keyboard that has LEDs for mute and for microphone mute,
> > and these currently do not work as expected. I'm not sure how special
> > that use-case is, but I don't think expecting users to manually fiddle
> > around in sysfs to get their keyboard LEDs working is a good solution.
> 
> I see your point (and tracked your name to hid-lenovo.c which creates
> mute/micmute LED drivers for Lenovo keyboards). The question is, if the
> audio triggers should be enabled blindly (all time) or when a LED driver
> exists and is active (runtime). In later case, this can be covered using new
> udev rules. Obviously, no manual configuration from users is expected.

That would require a rule for every keyboard or other HID device with a
mute or micmute LED. I don't think this is a good idea when it could
just work out of the box.

The HID specification defines "usages" for these LEDs, so any HID device
can contain one, and this works also without device-specific drivers.

For "mute", an LED classdev is already being created by the input-leds
module. The default trigger is not yet set correctly, but I have a patch
for that. Support for "micmute" is still missing, but I'm working on
that as well.

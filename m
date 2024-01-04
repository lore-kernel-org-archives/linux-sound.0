Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D5424A1D
	for <linux-sound@vger.kernel.org>; Thu,  4 Jan 2024 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bernhard-seibold.de header.i=@bernhard-seibold.de header.b="QGaU2ekm"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4T5brP04sjz9sbM;
	Thu,  4 Jan 2024 20:15:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernhard-seibold.de;
	s=MBO0001; t=1704395701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VKD3lErB/WkHlz1WpEd3ulUFw1Gp2jSe6l5o6hQVcj4=;
	b=QGaU2ekmRX9IyCbcn8+LtKUXborRxDO7OQvaixCAGQsRKJ3FgIh00neUD7ddfjA5/fGJVM
	9/oSbZCJ0qAFLtsbLY1ct++HSv/ZBNDQz+sIhKmrNS9YAZCGQMBz06Y3AdA3otbjryO7DY
	tR1ZxyP1jmhxXlogUeK3yjSSFOcJscaSdmq3lzZWKVUMQ7/ysXhPIpy3BDLyiCd8YRQuGL
	3zaqExbq2QmB5/l9at1DSiBSiN+fiefIDVB6kN3CCfRKV+uZY3JK/yOuJhIoq5UG0UCGXV
	2lyssbxOdPaBZK7DhfBY+aryE9eqVBPrFsqExPsb/ijiMcuPXmC1Y2A5OAIjNg==
Date: Thu, 4 Jan 2024 20:14:58 +0100
From: Bernhard Seibold <mail@bernhard-seibold.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>
Subject: Re: Re: [PATCH] ALSA: hda: generic: Always add LED controls
Message-ID: <3253emuy3njov4thaognxfb4c4e32e2cj5xr25k4wjd4iewfl5@cz6sf4nhxdv7>
References: <20240104155838.7514-1-mail@bernhard-seibold.de>
 <871qaxkq43.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <871qaxkq43.wl-tiwai@suse.de>

On Thu, Jan 04, 2024 at 05:41:48PM +0100, Takashi Iwai wrote:
> On Thu, 04 Jan 2024 16:58:38 +0100,
> Bernhard Seibold wrote:
> > 
> > LEDs for mute and microphone mute can be added to any system via the
> > audio-mute and audio-micmute triggers, e.g. via USB HID devices.
> > Therefore, add the LED controls unconditionally.
> 
> Hmm...  Won't your change lead to the sysfs entries always,
> i.e. creating sysfs entries even if the device has no LED at all?

This patch is not affecting create_mute_led_cdev, that function is still
only called for some special systems via fixups, to create the actual
LED classdevs that are present on there.

What I'm trying to change is to have the led-ctls always available. They
serve as input to the audio-mute and audio-micmute triggers, and these
triggers should work on any system with HD Audio, not just a few.

It would be even better to move the whole functionality into the sound
core so that it works with other drivers as well, but since yesterday was
the first time I even looked at sound code, I wouldn't even know where
to start.

Regard,
Bernhard

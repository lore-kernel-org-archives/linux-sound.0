Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620D01E5B63
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 00:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781830175; cv=none; b=M6Bip4H0R+IH9eSx5OhEm9JsbFlT1k0V5sbv3XFrJ43mc/TRFDEvc1RbFLXVPXMZiv1Daus8rmWO220hmSZTU/0AHDBeeBZTJmA7ftMoU/r3rPyPFLJSi5zSMXKp5A/0IaaOm5kKKti1n/KZWCqTBSbx2ER4yNokJs6P2qajoIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781830175; c=relaxed/simple;
	bh=lky/TpuqVBKzALzIWcQJ6cXcCmPilJlHtV5IpOZspSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iONguvoWy78OcxI7kbfqXzjqAg76UZbSNEfy3AvJLYAFMs/pofVGr5ra2/M4hKv7Ok0NKR0lM9XFi9fpYOkvgbO8TykUul21r2nhZKQ2MulN/WVmzDV00F+AxrkeS1ywSRWYa+sG1voo9y6annSeQW5co0GJGKtbHTngbiPwWXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e93Xsev6; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e93Xsev6"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7e8b45dfb3dso21601607b3.3
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 17:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781830173; x=1782434973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/RB/K7FxSQzWmkVYnvLUNnh004Ndikk6luBUSZ26eNE=;
        b=e93Xsev69R57LuETrnHvtJr0FS4ZTUCIeW/TQyi1p+eI7PMbN5yQiA9L64czdht/Dp
         I0+m9RU5tyqH0WkZ7U1BCcr8RAY/StTx28Ewo+wJIBMTgReMrfI6KMN+I2jVhSGxbQfB
         g8qdxrryiZrNcQdYys+BAddUE5LU1Db57scaIzIkP9ZpWP2D3qQQWw24KFLavhfTJwjk
         dtDC8+2pxaXOwRfxihTS+ZgppOZhAoArRfwi5OqmHeUL+6r6rtj96uwFmRGBpF3G/gk3
         FCb1cEB2Fe4chxA79DaZXgWydTZTtzXMfa+9O6RklieYg7TFBTmnVX6cbCxXmBGM9dS2
         nq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781830173; x=1782434973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/RB/K7FxSQzWmkVYnvLUNnh004Ndikk6luBUSZ26eNE=;
        b=BRzh0H3T5T3RlnHjwSQruAQUf8SgeE+IhvKfR02SX/DRqQgR5gQggjHNw4Z/noCR9o
         9QIiavJaSVLVebTG/OFiF7GLdo1AnNJbqkHSXo4sMIlvXrtkwMZ2nOlLUD+qfL0lf5hL
         B8dJTUvLSRdbGzcpyEwehDDANWf2uFdMhJozG8ehpVkRim3YKOP2VoocgUF3rnM7eqnP
         n+640sxCfB60mc5sxjlpuJXFiym8ByOA1OSrwwp3VqJLd6VGk2AK7MX4uVbMbTQ1Jsfk
         7kjjjqL4ywPryU6xuxMu04rRqPCrK2NgkNy8rj9idpmktxx31sQc8/1oFi6WHLclhjk/
         suWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLXv6hKfVe+dHwpilu6DKBB/B+6+GghiSeSoUA9c++1fUXQFBrAfrXnRAP468XjYzYzspm5FLhrnkRhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqzgdyuwaRhDeRlpus72hAdhJeSpjZWwH8xtkCMPFKOkuc9VE9
	Fzuy2U/+clMDTTn/VAxIY2qjGDl6+8ObUo9S747H++EOjTcCCuhLRwxcQ7VURbII
X-Gm-Gg: AfdE7cnkcefGCgRsQi1SEaTbWXsE696NcYkG8cgLZL8/gTGYzpOnCCwEpp09b/mK78m
	XLyOqaneZT6RNIvhr4ejG/czMIKCalAKai4WB1Yz9U2khkdL3zrrwiXvBIbZviA1gTq2RrZSuWO
	qJtO+qTjvB4AV5Eu2orXuFQRCW8Kv7a0kBXGAKEn2sWqXF/IHifJjt6sioXYQs0UmKdxmpnYIKN
	fTvWCbvsUveshEnEdIgtaFCrw92Li551/oh5pMhU3v1EdATr7hY4rnX4wXDyogVH8L4aYePVF4E
	By8rRmwm+jR/P7kwmZMg5h5P/tAmQDDpk5NYsPBO7sMrNPeQ+TFbrS8LXOnWTzlDVKSQavk8fhr
	5BAoKeeX7Eaf1pQCAGAA7LnDIjU7gomDkuqH+1sepAuZZQ5sgwpoi8GnDvK2snqlUGtWiRIcD4w
	LttHfqH9QJgI8pGzgW1K6hF9i596KeW9Z+poyVbLZ31fix+AgmgKy8LeAiYyQEq+FI6wfanC3JL
	fMwG7MI4GtsatVb
X-Received: by 2002:a05:690c:dc1:b0:7fd:4ef9:e5a4 with SMTP id 00721157ae682-80133503a1amr13468777b3.29.1781830173035;
        Thu, 18 Jun 2026 17:49:33 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.74])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8011cf186c9sm5501597b3.25.2026.06.18.17.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 17:49:31 -0700 (PDT)
Date: Thu, 18 Jun 2026 20:49:29 -0400
From: Frank van de Pol <fvdpol@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, ramiserifpersia@gmail.com, rmxpzlb@gmail.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] ALSA: usb: Add support for Reloop Jockey 3 DJ
 controllers
Message-ID: <rlr4sq25ldq576b76krj3fskbcp4y7mvxql4ghpb32vt7y425s@4tq42u6fc5ya>
References: <20260617203937.1273852-1-fvdpol@gmail.com>
 <20260617203937.1273852-2-fvdpol@gmail.com>
 <87h5mzkgul.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5mzkgul.wl-tiwai@suse.de>

On Thu, Jun 18, 2026 at 05:28:50PM +0200, Takashi Iwai wrote:
> On Wed, 17 Jun 2026 22:39:37 +0200,
> Frank van de Pol wrote:
> > 
> > Introduce a dedicated repository subdirectory and driver for the Reloop
> > Jockey 3 Master Edition and Reloop Jockey 3 Remix USB DJ controllers.
> > 
> > Because these devices utilize a non-standard, proprietary Ploytec USB
> > framing protocol instead of standard USB Audio Class (UAC) mechanisms,
> > they require specialized handling outside of standard quirks.
> > 
> > This driver provides:
> >  - 24-bit multi-channel (6x4) audio capture and playback.
> >  - Support for 44.1, 48, 88.2, and 96 kHz sample rates.
> >  - ALSA RawMIDI input and output mapping for the integrated control surface.
> > 
> > The custom Ploytec encapsulation and streaming format was successfully
> > reverse-engineered via USB protocol analysis and is isolated cleanly into
> > a local hardware-independent codec abstraction.
> > 
> > Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
> > 
> > Updates based on the feedback from code review
> > 
> > address issues from code review, further optimization
> 
> Just a few nitpicking below, in addition to Sashiko reviews.

:-) Thank you, it is these kind of nitpicking that help improve the code
quality and maintainability, so more than happy to look into these.

> 
> > --- /dev/null
> > +++ b/sound/usb/jockey3/Kconfig
> > @@ -0,0 +1,19 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config SND_USB_JOCKEY3
> > +	tristate "Reloop Jockey 3 support"
> > +	default m
> 
> Drop the "default m".

Done
 
> > +static void jockey3_playback_callback(struct urb *urb)
> > +{
> ....
> > +	if (urb->status) {
> > +		if (urb->status == -ENOENT || urb->status == -ECONNRESET ||
> > +		    urb->status == -ESHUTDOWN)
> > +			return;
> > +
> > +		/* Fatal error: stop resubmitting to prevent interrupt storm */
> > +		dev_err(&chip->intf0->dev, "Playback URB fatal error: %d\n", urb->status);
> > +		set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
> > +		return;
> > +	}
> 
> This code pattern appears repeatedly, so it can be factored out as a
> common helper.

Agreed, we have similar error handler logic for the playback, capture, and
midi-in callbacks; good opportunity for a common helper function.

> 
> > +	if (unlikely(test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags)))
> > +		return;
> 
> Also this check appears very frequently, and can be a form that is
> easier for readers, too.
> 

Good point; I moved the test_bit(.....) logic into a small helper functions
jockey3_is_disconnected() and jockey3_is_stopping().  Resulting code is much
easier on the eye:

	if (unlikely(jockey3_is_disconnected(chip)))
		return;

> > +static int jockey3_pcm_open(struct snd_pcm_substream *substream)
> > +{
> ....
> > +	runtime->hw.rate_min = 44100;
> > +	runtime->hw.rate_max = 96000;
> > +	runtime->hw.buffer_bytes_max = 1024 * 1024;
> > +	runtime->hw.period_bytes_min = 64;
> > +	runtime->hw.period_bytes_max = 512 * 1024;
> > +	runtime->hw.periods_min = 2;
> > +	runtime->hw.periods_max = 1024;
> 
> Maybe worth to mention that those are some sane software limitation
> you chose, not about the hardware limit.
> 
> > +
> > +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> > +		runtime->hw.channels_min = 4;
> > +		runtime->hw.channels_max = 4;
> > +		chip->playback_substream = substream;
> > +	} else {
> > +		runtime->hw.channels_min = 6;
> > +		runtime->hw.channels_max = 6;
> > +		chip->capture_substream = substream;
> > +	}
> 
> The substream assignment should be done better with the spinlock, and
> set at last, for avoiding the potential race?  Otherwise...
> 
> > +	scoped_guard(mutex, &chip->rate_mutex) {
> > +		if (chip->active_streams > 0) {
> > +			/* Force the new stream to match the existing hardware rate */
> > +			ret = snd_pcm_hw_constraint_single(runtime,
> > +							   SNDRV_PCM_HW_PARAM_RATE,
> > +							   chip->current_rate);
> > +			if (ret < 0)
> > +				return ret;
> 
> ... here the substream is still set and left.  It might be no serious
> problem, but still better to be cleaned up.

Ok, will look into these.  Getting the concurrency handling correct is quite
hard, since many subtile ways to mess it up.  Thank you for the guidance.
 
> > +static int jockey3_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
> > +{
> > +	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
> > +
> > +	dev_dbg(&chip->intf0->dev, "PCM trigger stream %d, cmd %d\n", substream->stream, cmd);
> > +
> > +	if (test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags))
> > +		return -ENODEV;
> > +
> > +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> > +		guard(spinlock_irqsave)(&chip->playback_lock);
> > +		if (cmd == SNDRV_PCM_TRIGGER_START)
> > +			chip->stream_running = true;
> > +		else if (cmd == SNDRV_PCM_TRIGGER_STOP)
> > +			chip->stream_running = false;
> > +	} else {
> > +		guard(spinlock_irqsave)(&chip->capture_lock);
> > +		if (cmd == SNDRV_PCM_TRIGGER_START)
> > +			chip->capture_running = true;
> > +		else if (cmd == SNDRV_PCM_TRIGGER_STOP)
> > +			chip->capture_running = false;
> > +	}
> 
> Better to implement SNDRV_PCM_TRIGGER_SUSPEND, too.  It can be just as
> same as the stop operation.  Then the suspend/resume would be
> supported, at least.

Hope to flesh out the v3 of this new driver this weekend.

Thanks,
Frank 

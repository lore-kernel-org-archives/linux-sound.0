Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D026F1C862D
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781796535; cv=none; b=gTnnpwyNpYGkL+IV7dm/hJLwBlFFW6inELGyYx17LVdHQr4qyhKZ10r1OWdtnkbIaR2IBuoBakyHuRN27jW6G1YHGkFwJuHKZfj2KWnwYRl2DUIjPkTTN0I1T/BU++wJD4vkCZT1ilfmZHCjSchfTB0LJcSOkRcWy2xYWz3t9n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781796535; c=relaxed/simple;
	bh=gxBIubiQ6uAurP4C9S45vzu5dGgCDA/RJMSapnnMawo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IVwaBFC+V2AJTHhpk4jBaFEXiERwjl7a7xdwvp+FL8/JLbxx4+6ofKL6jQhJOWG4s7HPZTY2EVGYsXxSvcmY22jPXqLuZqyEXFTSgrQ0WCssxW7LOD6lCfJmO7HNkaHfvZiXeitTqfX2gcONOHQeJkWpO/Fr0e2DXUZCeWWtKYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tcy1tXXN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SW8L3xvE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tcy1tXXN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SW8L3xvE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tcy1tXXN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SW8L3xvE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tcy1tXXN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SW8L3xvE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2A5BC75F32;
	Thu, 18 Jun 2026 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781796531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=axBUWVxHphdjRJDPv83NlkzBIj928HOCKMNv6Pr6M8w=;
	b=tcy1tXXN9ZySVvo9Gs7rDF1JpkvuPagQX8ZenfdR1ewXIGmA9ZLHz1ExzIrvIxRZDv/02U
	V6ySWM/Mk3PxGGWnXIuZWoUZypFy/qMf8+YMdbvKwf0bHDQ3pDaXIkc6jPOv3kIyuvNgV9
	yq9LPzVKd2F37XtIaz9KaJqdJ5ekx0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781796531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=axBUWVxHphdjRJDPv83NlkzBIj928HOCKMNv6Pr6M8w=;
	b=SW8L3xvEUh6OCqEZd+s6Cnir16c4GoJ6Vwa9rXM0fM80znwxYXrSsnQOX4nkMBShvp7Rtg
	VYVIfyd+H2XbACBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781796531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=axBUWVxHphdjRJDPv83NlkzBIj928HOCKMNv6Pr6M8w=;
	b=tcy1tXXN9ZySVvo9Gs7rDF1JpkvuPagQX8ZenfdR1ewXIGmA9ZLHz1ExzIrvIxRZDv/02U
	V6ySWM/Mk3PxGGWnXIuZWoUZypFy/qMf8+YMdbvKwf0bHDQ3pDaXIkc6jPOv3kIyuvNgV9
	yq9LPzVKd2F37XtIaz9KaJqdJ5ekx0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781796531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=axBUWVxHphdjRJDPv83NlkzBIj928HOCKMNv6Pr6M8w=;
	b=SW8L3xvEUh6OCqEZd+s6Cnir16c4GoJ6Vwa9rXM0fM80znwxYXrSsnQOX4nkMBShvp7Rtg
	VYVIfyd+H2XbACBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E67E2779A8;
	Thu, 18 Jun 2026 15:28:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D3IYN7IONGowWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Jun 2026 15:28:50 +0000
Date: Thu, 18 Jun 2026 17:28:50 +0200
Message-ID: <87h5mzkgul.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Frank van de Pol <fvdpol@gmail.com>
Cc: tiwai@suse.de,
	perex@perex.cz,
	ramiserifpersia@gmail.com,
	rmxpzlb@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] ALSA: usb: Add support for Reloop Jockey 3 DJ controllers
In-Reply-To: <20260617203937.1273852-2-fvdpol@gmail.com>
References: <20260617203937.1273852-1-fvdpol@gmail.com>
	<20260617203937.1273852-2-fvdpol@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -3.30

On Wed, 17 Jun 2026 22:39:37 +0200,
Frank van de Pol wrote:
> 
> Introduce a dedicated repository subdirectory and driver for the Reloop
> Jockey 3 Master Edition and Reloop Jockey 3 Remix USB DJ controllers.
> 
> Because these devices utilize a non-standard, proprietary Ploytec USB
> framing protocol instead of standard USB Audio Class (UAC) mechanisms,
> they require specialized handling outside of standard quirks.
> 
> This driver provides:
>  - 24-bit multi-channel (6x4) audio capture and playback.
>  - Support for 44.1, 48, 88.2, and 96 kHz sample rates.
>  - ALSA RawMIDI input and output mapping for the integrated control surface.
> 
> The custom Ploytec encapsulation and streaming format was successfully
> reverse-engineered via USB protocol analysis and is isolated cleanly into
> a local hardware-independent codec abstraction.
> 
> Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
> 
> Updates based on the feedback from code review
> 
> address issues from code review, further optimization

Just a few nitpicking below, in addition to Sashiko reviews.

> --- /dev/null
> +++ b/sound/usb/jockey3/Kconfig
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config SND_USB_JOCKEY3
> +	tristate "Reloop Jockey 3 support"
> +	default m

Drop the "default m".

> +static void jockey3_playback_callback(struct urb *urb)
> +{
....
> +	if (urb->status) {
> +		if (urb->status == -ENOENT || urb->status == -ECONNRESET ||
> +		    urb->status == -ESHUTDOWN)
> +			return;
> +
> +		/* Fatal error: stop resubmitting to prevent interrupt storm */
> +		dev_err(&chip->intf0->dev, "Playback URB fatal error: %d\n", urb->status);
> +		set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
> +		return;
> +	}

This code pattern appears repeatedly, so it can be factored out as a
common helper.

> +	if (unlikely(test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags)))
> +		return;

Also this check appears very frequently, and can be a form that is
easier for readers, too.

> +static int jockey3_pcm_open(struct snd_pcm_substream *substream)
> +{
....
> +	runtime->hw.rate_min = 44100;
> +	runtime->hw.rate_max = 96000;
> +	runtime->hw.buffer_bytes_max = 1024 * 1024;
> +	runtime->hw.period_bytes_min = 64;
> +	runtime->hw.period_bytes_max = 512 * 1024;
> +	runtime->hw.periods_min = 2;
> +	runtime->hw.periods_max = 1024;

Maybe worth to mention that those are some sane software limitation
you chose, not about the hardware limit.

> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		runtime->hw.channels_min = 4;
> +		runtime->hw.channels_max = 4;
> +		chip->playback_substream = substream;
> +	} else {
> +		runtime->hw.channels_min = 6;
> +		runtime->hw.channels_max = 6;
> +		chip->capture_substream = substream;
> +	}

The substream assignment should be done better with the spinlock, and
set at last, for avoiding the potential race?  Otherwise...

> +	scoped_guard(mutex, &chip->rate_mutex) {
> +		if (chip->active_streams > 0) {
> +			/* Force the new stream to match the existing hardware rate */
> +			ret = snd_pcm_hw_constraint_single(runtime,
> +							   SNDRV_PCM_HW_PARAM_RATE,
> +							   chip->current_rate);
> +			if (ret < 0)
> +				return ret;

... here the substream is still set and left.  It might be no serious
problem, but still better to be cleaned up.

> +static int jockey3_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
> +{
> +	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
> +
> +	dev_dbg(&chip->intf0->dev, "PCM trigger stream %d, cmd %d\n", substream->stream, cmd);
> +
> +	if (test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags))
> +		return -ENODEV;
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		guard(spinlock_irqsave)(&chip->playback_lock);
> +		if (cmd == SNDRV_PCM_TRIGGER_START)
> +			chip->stream_running = true;
> +		else if (cmd == SNDRV_PCM_TRIGGER_STOP)
> +			chip->stream_running = false;
> +	} else {
> +		guard(spinlock_irqsave)(&chip->capture_lock);
> +		if (cmd == SNDRV_PCM_TRIGGER_START)
> +			chip->capture_running = true;
> +		else if (cmd == SNDRV_PCM_TRIGGER_STOP)
> +			chip->capture_running = false;
> +	}

Better to implement SNDRV_PCM_TRIGGER_SUSPEND, too.  It can be just as
same as the stop operation.  Then the suspend/resume would be
supported, at least.


thanks,

Takashi

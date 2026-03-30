Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE2B314D13
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856487; cv=none; b=F/fCaYgmuZAaLUBTZN37qWjmFBdA30VWthiNXHH4mJOX0nQNfnN3+3yPukqZriivKwZbmR2emRvbazSrkYC17GZl1d7O+CtKiyrMvo+nBmqNcKpYfTJVwubXFZkbH4C+DaCNhN1NEMFkAVJq0e1kwQf5GEaTJEamEk+jP+Q3Wsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856487; c=relaxed/simple;
	bh=gjsTF+rru2s+VjSAqpikfezc0zod/PfZ65rYWrfkzDE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NauZ96Lyoieo2j1T0fCK74aZPvSEqq272XU90k8rDpOEDf2b94QVHi9ukr6cjxqpcVhdM47yPZzbRoyTtDZUb2dWLJpTa7sB5sJfd693K8iuMjzcqeRxnHe1ORIoGOyUPYFm7xNPLOm20j93Y0N0bDBcHW/oFw3Q6LRzMHldJHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wIOvl/gm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A5e199Po; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wIOvl/gm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A5e199Po; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wIOvl/gm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A5e199Po";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wIOvl/gm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A5e199Po"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 841445BE85;
	Mon, 30 Mar 2026 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774856484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2RWkKvOjmC1KM4uWc4cjVIAL7yCIkii/kvwRSHEdYFY=;
	b=wIOvl/gmKBnBoThj1I4T5VQD8mNzeJnBNK2sPAURucseDVXG63/t28JNcx9GuyZHebc4Rq
	5HR8CeHWT/JKh2k3jlYPHRbadYY26xfJSntysJC5DYH5l91wCh13udpZmCMnso9BqTxs5v
	mQKF5Q0qUpwUrCvNyHNA+f6OSPnFV0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774856484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2RWkKvOjmC1KM4uWc4cjVIAL7yCIkii/kvwRSHEdYFY=;
	b=A5e199PoJrKqh/UTSASBSraN1uGN/a2/SkAVf6wBcqJ6UYHqcVsiKxev76AffcJGjsd9rU
	5WYG5Qyu1fIswvCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774856484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2RWkKvOjmC1KM4uWc4cjVIAL7yCIkii/kvwRSHEdYFY=;
	b=wIOvl/gmKBnBoThj1I4T5VQD8mNzeJnBNK2sPAURucseDVXG63/t28JNcx9GuyZHebc4Rq
	5HR8CeHWT/JKh2k3jlYPHRbadYY26xfJSntysJC5DYH5l91wCh13udpZmCMnso9BqTxs5v
	mQKF5Q0qUpwUrCvNyHNA+f6OSPnFV0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774856484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2RWkKvOjmC1KM4uWc4cjVIAL7yCIkii/kvwRSHEdYFY=;
	b=A5e199PoJrKqh/UTSASBSraN1uGN/a2/SkAVf6wBcqJ6UYHqcVsiKxev76AffcJGjsd9rU
	5WYG5Qyu1fIswvCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 42E2F4A0A2;
	Mon, 30 Mar 2026 07:41:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rPkADiQpymlBLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Mar 2026 07:41:24 +0000
Date: Mon, 30 Mar 2026 09:41:23 +0200
Message-ID: <87mrzpu5lo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <monstr@monstr.eu>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [RFC][PATCH] ALSA: pcm_dmaengine: Use more shorter periods for SEGMENT granularity PCM DMA
In-Reply-To: <20260327143014.54867-1-marex@nabladev.com>
References: <20260327143014.54867-1-marex@nabladev.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.de:mid]
X-Spam-Flag: NO

On Fri, 27 Mar 2026 15:29:43 +0100,
Marek Vasut wrote:
> 
> The segment granularity PCM DMA updates PCM pointer at the end of every
> segment. In case the segments are too long, which happens with pipewire,
> it may happen that pcm_lib wait_for_avail() will time out while waiting
> for PCM pointer update and playback will fail with IO error.
> 
> In case of SEGMENT granularity, use 8 shorter segments over the default
> 2 long segments set in dmaengine_pcm_set_runtime_hwparams(). That gives
> the DMA engine some chance to update the PCM pointer every once in a
> while and prevent the timeout.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: linux-sound@vger.kernel.org
> ---
>  sound/core/pcm_dmaengine.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> index 1306b04be171a..092ce958e1aee 100644
> --- a/sound/core/pcm_dmaengine.c
> +++ b/sound/core/pcm_dmaengine.c
> @@ -424,6 +424,10 @@ int snd_dmaengine_pcm_refine_runtime_hwparams(
>  			hw->info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
>  		if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
>  			hw->info |= SNDRV_PCM_INFO_BATCH;
> +		if (dma_caps.residue_granularity == DMA_RESIDUE_GRANULARITY_SEGMENT) {
> +			hw->periods_min = 8;
> +			hw->period_bytes_max /= 8;
> +		}

Overriding with the hard-coded values at hw_params refine doesn't look
like a right way.  Those values are set and dealt by the drivers in
general, as they are pretty hardware-specific.  You can't guarantee
this magic number 8 working on all available hardware.


thanks,

Takashi

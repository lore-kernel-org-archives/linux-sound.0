Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E3324707
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 08:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763540126; cv=none; b=RLCS+4hQe9uvtsI+1b0dVaT2gQa56kSVc9Ie3ZxLt2GNVNMj+pnZDSJKROBXH5FlETx4QUeEmworeqmRfJ1AoXAa8ARvXZdUEeb/9UrvOAxiDIyJg65kntgVLq/mkrjL6PhW/SWLKaHTJtLPhco/sjt8xNqFHThNAahIwcjwta8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763540126; c=relaxed/simple;
	bh=U38q3bQzYZxlPKqPBjY8WJGK2vAIi8v2GFLUZneYrDE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rin543Mx2YrxhPNm6TT7Cs7BxWijS+OrfyTBv4p19T3MTHHbAXDyAV14I25mSN0Stn1/DHw/ewylL3qvQBSbx7nJVyxf0mJDOEK7JtClQoSUqLZqj+Zb4enx/N9UCv5yd2E/1cpVkGzPK7HzV1S9bbUyOwcEb98ASLxFTod8hM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kwcjDv1d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LUptNvOz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iV/OwwwJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z7izlDxG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kwcjDv1d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LUptNvOz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iV/OwwwJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z7izlDxG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DA4B6211D3;
	Wed, 19 Nov 2025 08:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763540118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AbB/G6BpUKesLPCrROlvA17FK9thnropM116YGSa9PQ=;
	b=kwcjDv1dNsgL7ftilW7s7tB3DIXZbi5SanNQmYa+93/MvwSNT94MgdxWRTudnXB5Uu1yvr
	hB8WiUNGjM+hk7GQIaPzCgrm21mqCVH/7Tg8sUi3reYgB0QMAd1eUkzqwyPgoH4zLswNTG
	juEdckNu8JLqQOAU1mnHOzL3yVczR08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763540118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AbB/G6BpUKesLPCrROlvA17FK9thnropM116YGSa9PQ=;
	b=LUptNvOzJxk3idoHH3JGNZoIVAv/DRoJeKSIYsqsUDoPi6Vc0deOwG+jSwcfrKHXgUdBdN
	2uMPrNayxBQq3qCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763540116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AbB/G6BpUKesLPCrROlvA17FK9thnropM116YGSa9PQ=;
	b=iV/OwwwJq8PEw8seTCm6GL9w8E2LTp1Xjz8yjBR8qOgdusULj1NX2Bi4Ccxu0cfJ+Hz06A
	5hM6ydVQj4gcQZlX2EmzuK3iFWF4rIso1IahzHoTioQqgc6+Nl0Bd2T22r7LzAJa1WH8nW
	VS9jff59RrbEvJ5idHi+ESPdV9xwnFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763540116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AbB/G6BpUKesLPCrROlvA17FK9thnropM116YGSa9PQ=;
	b=z7izlDxGXGx4dxZHpD3g/ce6U6uycnscRjCaHs9iqWsvaa0Aqh6+z8/Exz+cdYQJdPr/uo
	lNbiJye2mJVigIAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FD8F3EA61;
	Wed, 19 Nov 2025 08:15:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ap/pIZR8HWnMCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Nov 2025 08:15:16 +0000
Date: Wed, 19 Nov 2025 09:15:16 +0100
Message-ID: <87tsyqcuaz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/conexant: Implement resume function
In-Reply-To: <20251119072416.120937-1-wangdich9700@163.com>
References: <20251119072416.120937-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,intel.com,vger.kernel.org,lists.infradead.org,kylinos.cn];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Wed, 19 Nov 2025 08:24:16 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> During S3 sleep state, if headphones are unplugged, we need to re-report
> their status during the wake phase to ensure proper headphone presence
> detection after system resume.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Are you sure that this change is mandatory?
The common S3 resume via hda_call_codec_resume() already calls
snd_hda_jack_report_sync().


thanks,

Takashi

> ---
>  sound/hda/codecs/conexant.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> index 5fcbc1312c69..146ff65ccc30 100644
> --- a/sound/hda/codecs/conexant.c
> +++ b/sound/hda/codecs/conexant.c
> @@ -264,6 +264,13 @@ static int cx_suspend(struct hda_codec *codec)
>  	return 0;
>  }
>  
> +static int cx_resume(struct hda_codec *codec)
> +{
> +	cx_init(codec);
> +	snd_hda_jack_report_sync(codec);
> +	return 0;
> +}
> +
>  /*
>   * pin fix-up
>   */
> @@ -1277,6 +1284,7 @@ static const struct hda_codec_ops cx_codec_ops = {
>  	.init = cx_init,
>  	.unsol_event = snd_hda_jack_unsol_event,
>  	.suspend = cx_suspend,
> +	.resume = cx_resume,
>  	.check_power_status = snd_hda_gen_check_power_status,
>  	.stream_pm = snd_hda_gen_stream_pm,
>  };
> -- 
> 2.25.1
> 

Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF73331A6B
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542931; cv=none; b=hDnlxg2R6v/ZUDfliiFECuJkYYTLCvuGlaAhb/39nvkKM5J1VMktbsdknchTna5ly4Zcebi+/epP45rHxJSY2wsj36Y7T1ZC6nAi2egMqMORkyFSrvbuaquDGKcalLXIsl+46BotqSUPcGR4KNDbDh46M6q206H2+Vf4uDeZaD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542931; c=relaxed/simple;
	bh=4WYHmt9rgo+H2JPiROGi21th1jBiH5IKyMbrvKh0CX8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=udvNsJXXWVW+m6eB1UUBa3YABEF62cRhlkia3/pBOqH/LB/bdHKwtWBYXLEQTiajAu0CmHxiAxfBnBbAioc41cMXEln+lMZJnNl7P5RmIHdxH4++0CyMmESk9fIKrIkM2xd5RoqAD61kXCL8PI4U+ugP5YIav8LhR4AR40s/HTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J9PXH68T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sPWZXHQP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k7E9GM5f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kq6SICtr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J9PXH68T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sPWZXHQP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k7E9GM5f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kq6SICtr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9910A20350;
	Wed, 19 Nov 2025 09:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763542927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ToDdAdg9C2SVcxT2uDfdI7BQPgK+8uFH1OMxwx07Dx4=;
	b=J9PXH68TqQoEV113rZqnL4s0d+nXAzfxebxGJNVyB+/5QrtFt/sFrt85ZShe2GRmBXdRxO
	TsjcwvJMI5VnqzCO1qvo0yno1/WndUI3Ig6+9w86qSKxvbgGv6thgXF446bBOKQStUp8qf
	TZEk26Z4N5eu9zj96isn0WuN8jzk0zE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763542927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ToDdAdg9C2SVcxT2uDfdI7BQPgK+8uFH1OMxwx07Dx4=;
	b=sPWZXHQPcGLcn/108jQi8kZzI8YuddKihnmixbxocGGuUR0CoW0vWQCmjR2ft7MY9/QWt+
	5M5Mf7axurH9BdBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763542922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ToDdAdg9C2SVcxT2uDfdI7BQPgK+8uFH1OMxwx07Dx4=;
	b=k7E9GM5feH2x/ar8CrCIQzFcYXLf6VzNikamhQcDahHrIMDuiVsBtrZy3VAZRuGm5QeJ03
	y7SCg+ttaUdePqCi8a/Z2qA/3Sds41ZrFIRfumHU5uPr/qLOHVL+JiVlnNTgxky71zDXj/
	33HMmvwlWiBCwzeJ9+4xsu7hAhRzFY0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763542922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ToDdAdg9C2SVcxT2uDfdI7BQPgK+8uFH1OMxwx07Dx4=;
	b=kq6SICtrft07bBeJYKcTPJQbFO/B5hGGn9fNcOuOhvnWSAppBNPEiLnRtDrXL8J2CeEzUu
	+5wkOVq5xX2fyzAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54DFD3EA61;
	Wed, 19 Nov 2025 09:02:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XCZ7E4qHHWk+NgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Nov 2025 09:02:02 +0000
Date: Wed, 19 Nov 2025 10:02:01 +0100
Message-ID: <87o6oycs52.wl-tiwai@suse.de>
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
Subject: Re: [PATCH V2] ALSA: hda/conexant: Implement resume function
In-Reply-To: <20251119085345.141850-1-wangdich9700@163.com>
References: <20251119085345.141850-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,intel.com,vger.kernel.org,lists.infradead.org,kylinos.cn];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,kylinos.cn:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 19 Nov 2025 09:53:45 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> During S3 sleep state, if headphones are unplugged, we need to re-report
> their status during the wake phase to ensure proper headphone presence
> detection after system resume.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
> 
> v1->v2:
> Problem: No audio output device after S3.
> Cause: The audio driver misses re-initialization upon resume,
> resulting in stale jack status (remaining in the pre-sleep state),
> which prevents the system from finding the correct output device.

Again, please double-check what is the really cause.

snd_hda_jack_report_sync() *is* called already in
hda_call_codec_resume().  So snd_hda_jack_report_sync() is just called
twice with your patch, which must be superfluous.

The other significant difference with your patch is that you dropped
snd_hda_regmap_sync().  So it must break something else.


Takashi

> 
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

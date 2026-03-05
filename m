Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BEF31E823
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772710518; cv=none; b=a8/WKETiVyDvSdtwvcKhwdeqBoi920rpwjFDzHoV9dEX5Ly5Qf2FjZ/rhZHMzMCs3PgvjNQm8NhEC7HRjazjM/AdJ3JCKb9pVcWHZDOX1E8iUhc3A70T1BaV1mvGsWUH74YuANOi8AIeoDdPMDj+7YcdBgCbSA7wAsQg7Fi5yv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772710518; c=relaxed/simple;
	bh=BuwW9B3geaqsVOfeqecmvElI+j9e+HXgRTGFkYPfHM4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A6gZRH1x6gr/s9jj5W4bFneyQtdBzh8w+0huDPydzY3wlfMRhkHG3k+SP3oM/Nh070YFmYG854eh1qUB2yJxsgWVUkmHO5EagRSNCb1RWSK20DPWd5PkPP989+PoFuAyaX5Ep/W8zHvpjjs8OzYQtb+5+hvfiIHFU2inz79I/+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FXrSMwHG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XBHajYE/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FXrSMwHG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XBHajYE/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FXrSMwHG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XBHajYE/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FXrSMwHG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XBHajYE/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 460B83F802;
	Thu,  5 Mar 2026 11:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772710515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VdDkK5mWwmfGY4zCDlamp7ZRct/DFWL/c6cVJq3Qr/c=;
	b=FXrSMwHGSG09S7GNa3eu37RVuOje9EUene0PY2t5dblFcB3EGnNA6mmaXRbfCYZ+rnoncC
	NrJGUnK3CVDtQPR4Nj1sqib8dPUSpkvfNHygBV1r8Iod0qKHVMbVbzqXVn5hKivkCfNr29
	s1SEKO8h8fKXZ5H1wYVcVXHSv4NLels=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772710515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VdDkK5mWwmfGY4zCDlamp7ZRct/DFWL/c6cVJq3Qr/c=;
	b=XBHajYE/FQxX1kLWLAn/KiZXBhh9I9SxNOwYHepMPOTlYfr1anQaFJo0XvqFRPZVydgnoV
	dqX6y8eTwpBm7BBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FXrSMwHG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="XBHajYE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772710515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VdDkK5mWwmfGY4zCDlamp7ZRct/DFWL/c6cVJq3Qr/c=;
	b=FXrSMwHGSG09S7GNa3eu37RVuOje9EUene0PY2t5dblFcB3EGnNA6mmaXRbfCYZ+rnoncC
	NrJGUnK3CVDtQPR4Nj1sqib8dPUSpkvfNHygBV1r8Iod0qKHVMbVbzqXVn5hKivkCfNr29
	s1SEKO8h8fKXZ5H1wYVcVXHSv4NLels=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772710515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VdDkK5mWwmfGY4zCDlamp7ZRct/DFWL/c6cVJq3Qr/c=;
	b=XBHajYE/FQxX1kLWLAn/KiZXBhh9I9SxNOwYHepMPOTlYfr1anQaFJo0XvqFRPZVydgnoV
	dqX6y8eTwpBm7BBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CBDF3EA68;
	Thu,  5 Mar 2026 11:35:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id a+nAAXNqqWn5NwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 11:35:15 +0000
Date: Thu, 05 Mar 2026 12:35:14 +0100
Message-ID: <87eclyy0el.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH 2/4] ALSA: hda/senary: Implement proper resume callback
In-Reply-To: <20260305032728.235630-1-wangdich9700@163.com>
References: <20260305032728.235630-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[163.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 460B83F802

On Thu, 05 Mar 2026 04:27:28 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> The SN6186 codec requires register re-synchronization after resume from
> S3 state.

When no resume callback is set, regcache_sync() is called via
snd_hdac_regmap_sync(), but after snd_hda_codec_init().

So this looks superfluous to me.  Please check whether something
really missing or not.


thanks,

Takashi


> The current driver lacks a resume callback, which may lead to
> loss of hardware state or audio malfunction after system resume.
> 
> This patch adds a resume callback that:
> 1. Syncs the regcache to restore register values.
> 2. Re-applies the vendor-specific hardware init verbs.
> 3. Reports jack status to update the audio path.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
>  sound/hda/codecs/senarytech.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
> index f9a389df3a17..8ebd974817ac 100644
> --- a/sound/hda/codecs/senarytech.c
> +++ b/sound/hda/codecs/senarytech.c
> @@ -205,6 +205,18 @@ static int senary_suspend(struct hda_codec *codec)
>  	return 0;
>  }
>  
> +static int senary_resume(struct hda_codec *codec)
> +{
> +	/* Re-sync registers */
> +	regcache_sync(codec->core.regmap);
> +
> +	/* Re-run init verbs to restore hardware state */
> +	senary_init_verb(codec);
> +
> +	snd_hda_jack_report_sync(codec);
> +	return 0;
> +}
> +
>  static int senary_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  {
>  	struct senary_spec *spec;
> @@ -286,6 +298,7 @@ static const struct hda_codec_ops senary_codec_ops = {
>  	.init = senary_init,
>  	.unsol_event = snd_hda_jack_unsol_event,
>  	.suspend = senary_suspend,
> +	.resume = senary_resume,
>  	.check_power_status = snd_hda_gen_check_power_status,
>  	.stream_pm = snd_hda_gen_stream_pm,
>  };
> -- 
> 2.25.1
> 

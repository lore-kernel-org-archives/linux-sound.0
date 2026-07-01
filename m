Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F033B7772
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782891446; cv=none; b=hZhE4DPJF5/qEBWGp0re+vqn7kKKRY3urhoKNuBElz6wYFGEI9LQnvqGV9xGF2SXxYKRpKDozSDUkhe3l8Voc9EDweyRS9KPsL8Oi36xwgomgM7RzZuVar35jWNQECRVgE3CagsIxWwj8WS8pttqP+ftr5TenufBoxQllvmP24E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782891446; c=relaxed/simple;
	bh=qwRMZybapf+FQa4g4Z+m5PwmNLdcPwxxBxAVLMjsZCA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l8CTnihDQxQWRedwUhCtUNda7JCH4xyq/emQ/WYbUyEmGZj38679boLmtbOfmlr+JNH+D1lJkHNW7SLK8PRu8bF7mQRkAN5Hkwn0DG/ddL2DDKvyYJfhU8TQBXDtyUrusHDtFvqxroNapYmj3/5jvJerb6u+2+HO7FOKcTGC4kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CocPU2nP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mR2cN+Iq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CocPU2nP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mR2cN+Iq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CocPU2nP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mR2cN+Iq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CocPU2nP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mR2cN+Iq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 336B7759BC;
	Wed,  1 Jul 2026 07:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782891443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cs27xci25YTZZGqVi8bFQafrNLGwr7UR7sFsUi1gdtg=;
	b=CocPU2nPGP4TQrja1Nvfxgn53L+H2o6svahgn9E8VzYvkNFV2g/pyZndMJVghpmNLc/kti
	huExw8LqAWcrDWlkjjSwI9utcIHK7I20oD91f23s/XGBmGJOSc+S09Lte0BrMMPfvTVywF
	9iJb4L0cDvEd/hSwB0XX7+eT5rnWabI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782891443;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cs27xci25YTZZGqVi8bFQafrNLGwr7UR7sFsUi1gdtg=;
	b=mR2cN+IqqhxUdelC4O1XUi/51CYUchHhCfaK90OeaHb7YQ7pffmm2nIL8gp8smGcbuPE2Y
	L0dNVh8igBcft8BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782891443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cs27xci25YTZZGqVi8bFQafrNLGwr7UR7sFsUi1gdtg=;
	b=CocPU2nPGP4TQrja1Nvfxgn53L+H2o6svahgn9E8VzYvkNFV2g/pyZndMJVghpmNLc/kti
	huExw8LqAWcrDWlkjjSwI9utcIHK7I20oD91f23s/XGBmGJOSc+S09Lte0BrMMPfvTVywF
	9iJb4L0cDvEd/hSwB0XX7+eT5rnWabI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782891443;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cs27xci25YTZZGqVi8bFQafrNLGwr7UR7sFsUi1gdtg=;
	b=mR2cN+IqqhxUdelC4O1XUi/51CYUchHhCfaK90OeaHb7YQ7pffmm2nIL8gp8smGcbuPE2Y
	L0dNVh8igBcft8BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3F27779AA;
	Wed,  1 Jul 2026 07:37:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id llwWOrLDRGrCHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 Jul 2026 07:37:22 +0000
Date: Wed, 01 Jul 2026 09:37:22 +0200
Message-ID: <87se63upn1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: dengxiang <os_dengxiang82@126.com>
Cc: tiwai@suse.com,
	bo.liu@senarytech.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/conexant: Fix microphone mute after power-on reboot
In-Reply-To: <20260701065533.72517-1-os_dengxiang82@126.com>
References: <20260701065533.72517-1-os_dengxiang82@126.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[126.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[126.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Wed, 01 Jul 2026 08:55:33 +0200,
dengxiang wrote:
> 
> Some devices have mute settings in their firmware set by the factory.
> This is to stop popping noise when the devices turn on. But this setting
> makes the microphones unable to record sound properly. This patch
> solves this problem and is compatible with conexant chips.
> 
> Signed-off-by: dengxiang <os_dengxiang82@126.com>

Hmm, this doesn't look like a right solution.

Is it only the problem after the boot?  Or is it an issue after the
runtime PM suspend?  The amp value must be restored by the runtime
resume, and if this doesn't work expected, it's a thing to be
addressed there, not in the PCM hook at all.


thanks,

Takashi

> ---
>  sound/hda/codecs/conexant.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> index 3d92262763f6..3229f9ef5969 100644
> --- a/sound/hda/codecs/conexant.c
> +++ b/sound/hda/codecs/conexant.c
> @@ -1184,6 +1184,24 @@ static void add_cx5051_fake_mutes(struct hda_codec *codec)
>  	spec->gen.dac_min_mute = true;
>  }
>  
> +static void cxt_fixed_mic_boost(struct hda_codec *codec, hda_nid_t node_id)
> +{
> +	struct conexant_spec *spec = codec->spec;
> +	unsigned int value = 0;
> +
> +	value = snd_hda_codec_read(codec, node_id, 0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
> +	snd_hda_codec_amp_stereo(codec, node_id, HDA_INPUT, 0, HDA_AMP_VOLMASK, value);
> +}
> +
> +static void cxt_capture_hook(struct hda_pcm_stream *hinfo,  struct hda_codec *codec,
> +			       struct snd_pcm_substream *substream, int action)
> +{
> +	struct conexant_spec *spec = codec->spec;
> +	hda_nid_t mux_pin = spec->gen.imux_pins[spec->gen.cur_mux[0]];
> +
> +	cxt_fixed_mic_boost(codec, mux_pin);
> +}
> +
>  static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  {
>  	struct conexant_spec *spec;
> @@ -1271,6 +1289,9 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  	if (err < 0)
>  		goto error;
>  
> +	if (spec->gen.pcm_capture_hook == NULL)
> +		spec->gen.pcm_capture_hook = cxt_capture_hook;
> +
>  	/* Some laptops with Conexant chips show stalls in S3 resume,
>  	 * which falls into the single-cmd mode.
>  	 * Better to make reset, then.
> -- 
> 2.39.5
> 

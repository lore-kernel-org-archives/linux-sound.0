Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D952B29D294
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599838; cv=none; b=OeUQ6IqB39vZa9AYZzJwxUbNYanuVnapieIPiUZbFxV5CCMvE4+3JgPwF4Yfbyd8Wk8SPi21k55YQ5gT46qJMnncVec/P5IBNcKvGOSv4mGWDpkVMbG+lGSTe1HhMuUtN9OiMyYKf1zPkViZxbDeOFcigr+xTUTvxK9jRMTnwlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599838; c=relaxed/simple;
	bh=+XyrWaffhCNYY7djC78dJYDTmyVw/JrZH3Kg1f91S4M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhJn6de97VkDqOhsQE6m5IOKjbHGU9VC/vu7K8YMSGBffJeq/mQz4k+PURFxXy6s+wibtTEEJ7h0HjXm9bxNMT++MdYZxkmWoHSrs5p+Na/YCU+jMOVoSeggVCFzE9cLJEWru5T72YpihY+R8G5c/CkpJ2O3J/zMfEYaiF1gRiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0m3RbAMw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Rt54FSb3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sxNDwFNG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kKa+BGSd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0m3RbAMw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rt54FSb3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sxNDwFNG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kKa+BGSd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BCA7E1FB13;
	Mon, 28 Sep 2026 12:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790599830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CVer9cC4Hyogm3h3Cl31/bbTBa1oNTjsSIiGznoYb44=;
	b=0m3RbAMwRvdNzjxI3yLNOY1voWo+NTnQ0HPGwtgz7mJyHlruCeWv4MFd5wSr4JsYIygedW
	qYESFSorDNxH+SAilDOWUXLvCPV+1ZY6j9pau1W+DngFPPA7Rcqa0pCkmFsx21sh2aH/Fl
	mYIs6zuhH9oKOnIdsKpblFVYfjudWB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790599830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CVer9cC4Hyogm3h3Cl31/bbTBa1oNTjsSIiGznoYb44=;
	b=Rt54FSb3GywnYvdWwOe3At6Gl6qtetYOUbMA/2n3HwD/RV22MmQZTKvxAvtF7gohugVMhn
	1wqf5825uLuNFvCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sxNDwFNG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kKa+BGSd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790599826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CVer9cC4Hyogm3h3Cl31/bbTBa1oNTjsSIiGznoYb44=;
	b=sxNDwFNGpn74Krdn14y180H0A4llKKczJcS7oPgDuwCqSkow4idrPnvhemiyC26cCkJGFO
	oNlb7M4qPCb/sU/+GiTGFVAcvpnr8OoPzuqIOaWI+G2eGvNVKOKqWmkEYGuFZbEHDDBy0V
	IKPywgIiSDjtiQqMn2pA8UiQyDivhI0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790599826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CVer9cC4Hyogm3h3Cl31/bbTBa1oNTjsSIiGznoYb44=;
	b=kKa+BGSdLBF3pd0OkFbuGN4LnwMoKLme0CjuURr9LIFTrkRwcY9RQBKk93uizuIdZSV3Qp
	XlyrsvibZaLmejCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 736E2133F1;
	Mon, 28 Sep 2026 12:50:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5gbEEpJiumodEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 12:50:26 +0000
Date: Mon, 28 Sep 2026 14:50:25 +0200
Message-ID: <8733ut5ylq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zeyu Li <13776528859@163.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kailang <kailang@realtek.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add ALC235 support for headset mode
In-Reply-To: <20260926140336.27896-1-13776528859@163.com>
	<20260926135800.27347-1-13776528859@163.com>
References: <20260926140336.27896-1-13776528859@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BCA7E1FB13
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sat, 26 Sep 2026 15:58:00 +0200,
Zeyu Li wrote:
> 
> The ALC235 (0x10ec0235) is registered as the ALC255 codec variant in
> patch_alc269(), but the headset mode functions were missing a case
> for it, so the CTIA/OMTP jack type detection and routing never ran
> on this codec. As a result, a plugged-in headset is detected (jack
> presence works) but the microphone signal is never routed, leaving
> the capture stream permanently silent.
> 
> Verified on an ASUS M5451GA laptop (HDA:10ec0235,10431814): with the
> ALC255 coef sequence applied, the headset microphone works correctly.
> 
> Signed-off-by: Zeyu Li <13776528859@163.com>
> ---
>  sound/hda/codecs/realtek/realtek.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
> index db365a746..bc5226fad 100644
> --- a/sound/hda/codecs/realtek/realtek.c
> +++ b/sound/hda/codecs/realtek/realtek.c
> @@ -1292,6 +1292,7 @@ static void alc_headset_mode_unplugged(struct hda_codec *codec)
>  	}
>  
>  	switch (codec->core.vendor_id) {
> +	case 0x10ec0235:
>  	case 0x10ec0255:
>  		alc_process_coef_fw(codec, coef0255);
>  		break;
> @@ -1407,6 +1408,7 @@ static void alc_headset_mode_mic_in(struct hda_codec *codec, hda_nid_t hp_pin,
>  	};
>  
>  	switch (codec->core.vendor_id) {
> +	case 0x10ec0235:
>  	case 0x10ec0255:
>  		alc_write_coef_idx(codec, 0x45, 0xc489);
>  		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
> @@ -1562,6 +1564,7 @@ static void alc_headset_mode_default(struct hda_codec *codec)
>  		alc_process_coef_fw(codec, coef0225);
>  		alc_hp_enable_unmute(codec, 75);
>  		break;
> +	case 0x10ec0235:
>  	case 0x10ec0255:
>  		alc_process_coef_fw(codec, coef0255);
>  		break;
> @@ -1663,6 +1666,7 @@ static void alc_headset_mode_ctia(struct hda_codec *codec)
>  	};
>  
>  	switch (codec->core.vendor_id) {
> +	case 0x10ec0235:
>  	case 0x10ec0255:
>  		alc_process_coef_fw(codec, coef0255);
>  		break;
> @@ -1780,6 +1784,7 @@ static void alc_headset_mode_omtp(struct hda_codec *codec)
>  	};
>  
>  	switch (codec->core.vendor_id) {
> +	case 0x10ec0235:
>  	case 0x10ec0255:
>  		alc_process_coef_fw(codec, coef0255);
>  		break;
> @@ -1881,6 +1886,7 @@ static void alc_determine_headset_type(struct hda_codec *codec)
>  	}
>  
>  	switch (codec->core.vendor_id) {
> +	case 0x10ec0235:
>  	case 0x10ec0255:
>  		alc_process_coef_fw(codec, coef0255);
>  		msleep(300);

I'm not sure whether it's 100% safe to apply this, and I'd like to
hear from Realtek.

Kailang, could you check it?  Can ALC235 be fully compatible in this
manner?


thanks,

Takashi

Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EE6288C3F
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 16:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769186131; cv=none; b=KjjHCCyvKvI8H9r0gybIjZ5q03AUgqntpWGqLIRvUIVsPBKcYMNY6q05vzjpWIlx7CShx0qnh8tGmiLt89Wkj05AIxJP1q7TynTn4gtrici8NiYhH1y+7cGvwg9RYyviHdLChzi8h195NUcq3vWjI38iKUmYflX+HrhgsKymkS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769186131; c=relaxed/simple;
	bh=u7w8Nd4Ro9xNDx051i3CoPeJzzG/yWky42DDeR0CduY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A5w2tpAAMHBzQ4l7KRuQCaCSVfZCXJIGNMdbaEGW2lhdW4hre9Qkyxud18HwRJT1cOXyz3TD3hqSUeir9Jh4eoduTX3HjSG9kKdtrO9EQDFQyIqNehE1B43ODMBLgUbTn6c7H9b2cfCQAKx3LNX8M8Zt1utoX9l8C6mG5fHEtak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JjQrBEA7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tDafa0aq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JjQrBEA7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tDafa0aq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JjQrBEA7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tDafa0aq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JjQrBEA7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tDafa0aq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9708E5BCE2;
	Fri, 23 Jan 2026 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769186127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YWyfmOA1uf9YCYoh9Gb13MHeode9kEOtT68esnZAW5k=;
	b=JjQrBEA7tHHL1E0Z2PpfBYSz6wQw1U7GVaHVziPyHlodJtxq9JwckALf181gfpzwxoXnJJ
	+tIGssvhMzuPwEr5nOUaI1Wmwh8y230zCC8vnEyOU9hM3gv8ZAchseRSE0bJCx+ZFld34f
	LxMiSbW1Vkz9AwHqHfEMSUn/SWUXE6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769186127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YWyfmOA1uf9YCYoh9Gb13MHeode9kEOtT68esnZAW5k=;
	b=tDafa0aqNEeI17q/c5foZcqQ4I7+b57CwU8JgzXg/5zV9sOcz2nSiBeMF5iXb94SKum9yx
	sYL9B1AsRUIsqhBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JjQrBEA7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tDafa0aq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769186127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YWyfmOA1uf9YCYoh9Gb13MHeode9kEOtT68esnZAW5k=;
	b=JjQrBEA7tHHL1E0Z2PpfBYSz6wQw1U7GVaHVziPyHlodJtxq9JwckALf181gfpzwxoXnJJ
	+tIGssvhMzuPwEr5nOUaI1Wmwh8y230zCC8vnEyOU9hM3gv8ZAchseRSE0bJCx+ZFld34f
	LxMiSbW1Vkz9AwHqHfEMSUn/SWUXE6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769186127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YWyfmOA1uf9YCYoh9Gb13MHeode9kEOtT68esnZAW5k=;
	b=tDafa0aqNEeI17q/c5foZcqQ4I7+b57CwU8JgzXg/5zV9sOcz2nSiBeMF5iXb94SKum9yx
	sYL9B1AsRUIsqhBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63D851395E;
	Fri, 23 Jan 2026 16:35:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QY75Fk+jc2nEKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Jan 2026 16:35:27 +0000
Date: Fri, 23 Jan 2026 17:35:27 +0100
Message-ID: <871pjge180.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Damien <damien.dagorn29@gmail.com>
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/1] ALSA: hda/realtek: fix LG Gram Style 14 speakers
In-Reply-To: <CAN59QMUSiJjGrpVzW2czHqdbVUf4yshxUFdKQPws2Fe8veSsdQ@mail.gmail.com>
References: <CAN59QMUSiJjGrpVzW2czHqdbVUf4yshxUFdKQPws2Fe8veSsdQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: 9708E5BCE2
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Wed, 21 Jan 2026 14:12:09 +0100,
Damien wrote:
> 
> 
>   Hi,
> 
>   The LG Gram Style 14 (14Z90RS-G.AD77F, SSID 1854:0490) with Realtek ALC298
>   shows normal routing and volume changes, but internal speakers remain silent
>   unless a userland HDA-verb workaround is applied.
> 
>   This patch adds a dedicated quirk for the LG Gram Style 14 that programs
>   the codec coefficient sequence used by the known workaround and enables
>   the speaker amps only during playback.
> 
>   Tested-by: Dams <damien.dagorn29@gmail.com>
>   Tested: speaker-test -D hw:0 -c 2 -t wav -l 1 (front left/right OK)
> 
>   Please find the patch series attached.
> 
>   Thanks,
>   Damien

Thanks for the patch.  Unfortunately, the patch looks created somehow
in a not ideal way.  First of all, the useful information like:
> 
> From 113b13ace8671a18c8f3820b007d5757df43dd36 Mon Sep 17 00:00:00 2001
> From: Dams <damien.dagorn29@gmail.com>
> Date: Wed, 21 Jan 2026 14:06:38 +0100
> Subject: [PATCH 0/1] ALSA: hda/realtek: fix LG Gram Style 14 speakers
> 
> The LG Gram Style 14 (14Z90RS-G.AD77F, SSID 1854:0490) with Realtek ALC298
> shows normal routing and volume changes, but internal speakers stay silent
> unless a userland HDA-verb workaround is applied.
> 
> This patch adds a dedicated quirk for the LG Gram Style 14 that programs
> the codec coefficient sequence used by the known workaround and enables
> the speaker amps only during playback.
> 
> Tested-by: Dams <damien.dagorn29@gmail.com>
> Tested: speaker-test -D hw:0 -c 2 -t wav -l 1 (front left/right OK)

... those should be put rather in the description of the patch itself.
You've put it in 0/1, that is a cover letter, which won't be included
in the git commit.
(And in general, there is no need for splitting to a cover letter if
it's only a single patch; describe it right in the patch itself or
not.)

Secondly, a valid Signed-off-by tag is mandatory for upstreaming.
It's a legal requirement.  And for the Signed-off-by tag (also the
From line as the author), you should provide a full real name.

Now about the code changes:

> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -1814,6 +1814,161 @@ static void alc298_samsung_v2_init_amps(struct hda_codec *codec,
>  	spec->gen.pcm_playback_hook = alc298_samsung_v2_playback_hook;
>  }
>  

Maybe it'd be better to have some comments about the quirk.
It's no trivial code, hence it's worth for explanation.

> +struct alc298_lg_gram_style_seq {
> +	unsigned short verb;
> +	unsigned short idx;
> +	unsigned short val;
> +};
> +
> +static void alc298_lg_gram_style_coef_write(struct hda_codec *codec,
> +					    unsigned int verb,
> +					    unsigned int idx,
> +					    unsigned int val)
> +{
> +	snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_COEF_INDEX, 0x23);
> +	snd_hda_codec_write(codec, 0x20, 0, verb, idx);
> +	snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_PROC_COEF, 0x00);
> +	snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_PROC_COEF, val);
> +	snd_hda_codec_write(codec, 0x20, 0, 0x4b0, 0x11);

Use AC_VERB_SET_PROC_COEF for 0x400.  It's equivalent with
	snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_PROC_COEF, 0xb011);

Could you try to resubmit with the corrections above?


thanks,

Takashi

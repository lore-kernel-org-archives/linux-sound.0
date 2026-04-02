Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099C330F7F8
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775146134; cv=none; b=rTQmLAl9cXKpHvla5uZL4zXyag0fbiV/dSNhYEN3yZbdXmGJXQVTvzjYnq53pasrXDqGCuoFhZrKawZvZeslrZ/HXZ4Th/FnTupJR4XisSsx4AdQnq4brnCjQYxJLbatCZlHDsVhUEmRhdKQH8YXWh8xAiSUFcU61FAMd92nR7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775146134; c=relaxed/simple;
	bh=oDAYQhKme2xvQewZ8H3bbvmPQJQEgTk4CIPoR0P2ZRE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FP925Vgguy7ahaHwMByKAUAZJq3me30mdxh3Q4ebSjxlFVaZYcxTT/otcvmjLGuaEgz73B2s0TkC47A8G4kbYDbiT83zxsHM651d3QDNLUoW6yVvI6f72LCFjbPYHWh1/bTCTlMxGghkxq8rJoFoBx369nympZzOc2vXA03mpTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zpEqEzce; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o/KlAdaQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zpEqEzce; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o/KlAdaQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zpEqEzce";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o/KlAdaQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zpEqEzce";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o/KlAdaQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 157A75BE0E;
	Thu,  2 Apr 2026 16:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775146130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZAYoykp8uNrWsZYQQibGhPNP/ibYcfGocShY9e05bQ=;
	b=zpEqEzceDxnEEKNUIr3YRuVHZTSd7IexYzMYW7xT1VF31KP0frGCcrmJn9AY32v/mOAF2C
	32A+XTs1c6uEBnwMqH5YhzgUAy77T9kam4Vha2zk+VTMKKer3R1UjEy3Vnjqqt9jiwcryo
	Uwzc3dFq2gA6IiZeKNJuTn1j4QTrDjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775146130;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZAYoykp8uNrWsZYQQibGhPNP/ibYcfGocShY9e05bQ=;
	b=o/KlAdaQV+QsyBFdvnWtFWxwrf1GuPVmaZINrO3x74xx/tfxWS3/klYItLCEevcT6CuS4f
	2uuPh4VcJoGst4Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zpEqEzce;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="o/KlAdaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775146130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZAYoykp8uNrWsZYQQibGhPNP/ibYcfGocShY9e05bQ=;
	b=zpEqEzceDxnEEKNUIr3YRuVHZTSd7IexYzMYW7xT1VF31KP0frGCcrmJn9AY32v/mOAF2C
	32A+XTs1c6uEBnwMqH5YhzgUAy77T9kam4Vha2zk+VTMKKer3R1UjEy3Vnjqqt9jiwcryo
	Uwzc3dFq2gA6IiZeKNJuTn1j4QTrDjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775146130;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZAYoykp8uNrWsZYQQibGhPNP/ibYcfGocShY9e05bQ=;
	b=o/KlAdaQV+QsyBFdvnWtFWxwrf1GuPVmaZINrO3x74xx/tfxWS3/klYItLCEevcT6CuS4f
	2uuPh4VcJoGst4Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D12B04A0B0;
	Thu,  2 Apr 2026 16:08:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id R3OkMZGUzmmjfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 Apr 2026 16:08:49 +0000
Date: Thu, 02 Apr 2026 18:08:49 +0200
Message-ID: <87fr5dibu6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] ALSA: hda: Notify IEC958 Default PCM switch state changes
In-Reply-To: <20260402-hda-spdif-share-notify-v2-1-7c6584ecaa21@gmail.com>
References: <20260402-hda-spdif-share-notify-v2-1-7c6584ecaa21@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 157A75BE0E

On Thu, 02 Apr 2026 16:45:13 +0200,
Cássio Gabriel wrote:
> 
> --- a/sound/hda/common/hda_local.h
> +++ b/sound/hda/common/hda_local.h
> @@ -12,6 +12,8 @@
>  
>  #include <sound/pcm_drm_eld.h>
>  
> +struct snd_kcontrol;

No need for an extra declaration.

> +
>  /* We abuse kcontrol_new.subdev field to pass the NID corresponding to
>   * the given new control.  If id.subdev has a bit flag HDA_SUBDEV_NID_FLAG,
>   * snd_hda_ctl_add() takes the lower-bit subdev value as a valid NID.
> @@ -203,6 +205,7 @@ enum { HDA_DIG_NONE, HDA_DIG_EXCLUSIVE, HDA_DIG_ANALOG_DUP }; /* dig_out_used */
>  #define HDA_MAX_OUTS	5
>  
>  struct hda_multi_out {
> +	struct snd_kcontrol *share_spdif_kctl; /* cached shared SPDIF switch */

I'd put at the tail of the struct as it's rather an optional stuff.


thanks,

Takashi

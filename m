Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8810E3D47AA;
	Tue, 25 Aug 2026 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646189; cv=none; b=u39qapCah6qGSoArV8ROmV7CKnlpCWBndQDAF2YVY89tjsfnR+mY3aWeSDVmhLhgabplD2b6LhRvO5uR14n7bwji0qcPVBwZfKz5VD9t3b3CvUqKhW0wglGQSNewMEdCOAKW3RqBw9jbEY99Et52bVa4k3/Jdt1YDNMYnX1VE5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646189; c=relaxed/simple;
	bh=iRir5Y2X32/DlvSLyBdiJYCyNQ6RavhFSpX54pSsFtE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cE+u4jAGASe7Dcuud8S7UwSEPQWSsp7ZQ9owU2jkW1U/B+gi2GipBM4d95/sRvzn7HaXPAOZzWtvXLF1Jk+lYd33y9IxmNz7yJ6rpJAZqlIT+EWhoGgHxOHF6vA5Jp8jIIrp656gG53WIuGrGanLzlmZW2oKcnPNlYunJaILUCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rweGdF3Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4JxGcV1P; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b67PDkLW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+8yQrdNa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rweGdF3Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4JxGcV1P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b67PDkLW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+8yQrdNa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 64DFB86D5A;
	Tue, 25 Aug 2026 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787646181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RgUTuYEYetTfhpzkZVAqAjRopJP04QIEdaikLyS24RM=;
	b=rweGdF3YVr1VEoiOQ9vScCZbmhfxEmhN+kqOCl7QX2IiOclCboWUwds0E/1hkNDzB0jnHU
	u0Ndm0df2Q9w7pJQQzKnRaB69YC0/qJhHqic94IUPMYbk/uJw8JdiObWhntcZP0lDMRgtB
	SKLuzHuptJdaC7sjGeh6Ifb+X12LiM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787646181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RgUTuYEYetTfhpzkZVAqAjRopJP04QIEdaikLyS24RM=;
	b=4JxGcV1PpQG1ncmgM8hLTo/pmUTN/9H58KrUhBWwUpkuHUmp32TcTDqbT3SU2AKU8Eln+H
	/UlCGKG4ovTw2CBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787646177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RgUTuYEYetTfhpzkZVAqAjRopJP04QIEdaikLyS24RM=;
	b=b67PDkLW1UjXC1iUpx5pvIYMhtFPGrr+MargJ3w247WkWZ5qLRu8l70/Oednniq5ESfC/p
	d0WhFffFElCwn16C0em0Jg+Mpn38JOpq0wCv43Q6inNhfxhX2gxrWIMioyuVAWgUkgHJFZ
	pJmFdUKuQu9KnTuCuynkNC9NxkBIH4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787646177;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RgUTuYEYetTfhpzkZVAqAjRopJP04QIEdaikLyS24RM=;
	b=+8yQrdNaPr9eo9g9MSvL78ECYKyeSZJq9NyxLdPiZXZRAcfdKVBZnrqjr7M6Mxv+K+J/2Q
	WIKpXQ7WE/HCAvDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30F8313332;
	Tue, 25 Aug 2026 08:22:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /0pECuFQjWo5CQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 08:22:57 +0000
Date: Tue, 25 Aug 2026 10:22:56 +0200
Message-ID: <87cxv6txr3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/conexant: Set mic pin VREF to 0x24 on headset mic plug
In-Reply-To: <20260825023855.394959-1-songxiebing@kylinos.cn>
References: <20260825023855.394959-1-songxiebing@kylinos.cn>
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
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.989];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Tue, 25 Aug 2026 04:38:55 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> For 3-pole headset microphones, the mic pin VREF must always be
> configured to 0x24 regardless of the headset type, otherwise the
> mic will not be able to record audio. Move the setting of the mic
> pin widget control to a common path.
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>
> ---
>  sound/hda/codecs/conexant.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> index 40da2832ba66..a18091a2866f 100644
> --- a/sound/hda/codecs/conexant.c
> +++ b/sound/hda/codecs/conexant.c
> @@ -225,13 +225,12 @@ static void cx_process_headset_plugin(struct hda_codec *codec)
>  	val = snd_hda_codec_read(codec, 0x1c, 0, 0xcb0, 0x0);
>  	if (val & 0x800) {
>  		codec_dbg(codec, "headset plugin, type is CTIA\n");
> -		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
>  	} else if (val & 0x400) {
>  		codec_dbg(codec, "headset plugin, type is OMTP\n");
> -		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
>  	} else {
> -		codec_dbg(codec, "headphone plugin\n");
> +		codec_dbg(codec, "mic plugin\n");
>  	}
> +	snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
>  }


Hmm, it's a headset plug check code, and the fallback case you
modified was supposed to be a headphone jack, no microphone.  That is,
the state where a headphone is plugged without microphone into the
headset jack, and in this case, it's wrong to enable the mic pin --
you shouldn't be able to record from the mic at all in this particular
case.

So, there must be other case -- mic-only plug -- and that is where the
mic pin is set up, too.


Takashi

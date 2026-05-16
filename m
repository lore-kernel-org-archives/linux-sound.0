Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A09258EE0
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 13:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778937427; cv=none; b=iK8cSyyaM7CdK9COUa8F96qG3nQtAY5nzqeeFgBRvOTmnnOOsnYHyiXB/9n+A1QVDc4+Cdq2vPDmEgjlayIiHEn3/WSB4eoP1mSUBrX42BmlkFStA5liGYURUKMvxxCzirD5ZUaTYKL+hWmT8/q+J2BKaZ8CgSuvzNWxNu/0Di8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778937427; c=relaxed/simple;
	bh=yr8X8P0I4u7l4MNseZsFmG7/kudfOfCzQ9QpOw6aIPA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QN4SLBTDexOMRbKw1kG7emDuexi+UygiBdOgLfyo//MX6t5BmLemKf8sU6U09/kclo7lzG6UwCErTMnMBCft9gX/1Vs7gOVssEQTLxrGBlExaPPB1PN0V1RkkUJSAFoTB+7nzRFZ0hppS0eZOZuTyGt3M/R+1xpTvC0PDN5wWwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vx9TWK+U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qTtoK3/f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vx9TWK+U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qTtoK3/f; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vx9TWK+U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qTtoK3/f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vx9TWK+U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qTtoK3/f"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9FD955D15F;
	Sat, 16 May 2026 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778937424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0cjV7OM0sGwKPzLwgwVX1spoFAc38qoFRaDpuxoP5OU=;
	b=vx9TWK+UG6M/YVva+aQd/6dvVuhm/n8QV6PR4sIwJ8XBQ++fi2uuZNLuXfR9JLmW3RjaZr
	LRdgZeRzrwJaPqEBHipcGAcg/L0GQ1OfT1zuhUgqoD8r8ts3Au9LKx6HtNv3aswoGWZhto
	Iu8kd5uHh24CMfqZ28/kfQImbYaaTdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778937424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0cjV7OM0sGwKPzLwgwVX1spoFAc38qoFRaDpuxoP5OU=;
	b=qTtoK3/fKJZsWvRk2M1ZIIWVYraHfpI8yyYq7F33W4uk1yK8C7DgyW6x4OJEh/PN7Ct6I7
	cZ0/YtRXisW9I+DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778937424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0cjV7OM0sGwKPzLwgwVX1spoFAc38qoFRaDpuxoP5OU=;
	b=vx9TWK+UG6M/YVva+aQd/6dvVuhm/n8QV6PR4sIwJ8XBQ++fi2uuZNLuXfR9JLmW3RjaZr
	LRdgZeRzrwJaPqEBHipcGAcg/L0GQ1OfT1zuhUgqoD8r8ts3Au9LKx6HtNv3aswoGWZhto
	Iu8kd5uHh24CMfqZ28/kfQImbYaaTdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778937424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0cjV7OM0sGwKPzLwgwVX1spoFAc38qoFRaDpuxoP5OU=;
	b=qTtoK3/fKJZsWvRk2M1ZIIWVYraHfpI8yyYq7F33W4uk1yK8C7DgyW6x4OJEh/PN7Ct6I7
	cZ0/YtRXisW9I+DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70C8A593A8;
	Sat, 16 May 2026 13:17:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eYGxGVBuCGpnSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 16 May 2026 13:17:04 +0000
Date: Sat, 16 May 2026 15:17:03 +0200
Message-ID: <87y0hjxzn4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aryan Kushwaha <aryankushwaha3101@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kailang Yang <kailang@realtek.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Plus 14
In-Reply-To: <CAFUwA8W30uCAS+K9UaMQ=jaUB0J+6tR0tdwZk=N90Kg8uiy3dg@mail.gmail.com>
References: <CAFUwA8W30uCAS+K9UaMQ=jaUB0J+6tR0tdwZk=N90Kg8uiy3dg@mail.gmail.com>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 

On Fri, 15 May 2026 11:22:57 +0200,
Aryan Kushwaha wrote:
> 
> From: Aryan Kushwaha <aryankushwaha3101@gmail.com>
> Date: Sun, 10 Apr 2026 15:36:22 +0530
> Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Plus 14
> 
> The HP Pavilion Plus 14-eh0xxx with subsystem ID 103c:8a36 needs the
> ALC245 COEF bit mute LED quirk for the mute LED to follow the audio mute
> state.
> 
> Add the missing quirk entry.
> 
> Signed-off-by: Aryan Kushwaha <aryankushwaha3101@gmail.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c
> b/sound/hda/codecs/realtek/alc269.c
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7018,6 +7018,7 @@
>   SND_PCI_QUIRK(0x103c, 0x8a30, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
>   SND_PCI_QUIRK(0x103c, 0x8a31, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
>   SND_PCI_QUIRK(0x103c, 0x8a34, "HP Pavilion x360 2-in-1 Laptop
> 14-ek0xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
> + SND_PCI_QUIRK(0x103c, 0x8a36, "HP Pavilion Plus 14-eh0xxx",
> ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
>   SND_PCI_QUIRK(0x103c, 0x8a3d, "HP Victus 15-fb0xxx (MB 8A3D)",
> ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
>   SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)",
> ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
>   SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),

The patch can't be applicable due to the broken spaces.
Please fix mailer setup and resubmit.


thanks,

Takashi

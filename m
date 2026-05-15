Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9AE38CFE7
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778827775; cv=none; b=IiidljF7Fy9ShWfUBmPHFrKs8FrBc6+pxptd9cniGSNP5CLA1mpgPugGIx7HRyEMkkhmMoFLJR0Hd8vSN+N50I+9yFNvdETpC7wF7w9UsDClpPB+J4wg9AtvB9LMPckDNP0kUr7PomhplJzmmBxnBdbUw0fy1t1xGamMGGwhr8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778827775; c=relaxed/simple;
	bh=nr3wKpThhFoQRzKQo6RNeOvfCF1JH8e4UeHN65tC3Mg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CdRTP05fxpllK9+K4Rr8z+2NdajQ5ogBEOyp2DP++QnP0grL4X8ZB9UeQ12CeMAdEOi/NglMoSbANnqld6r6vb7NS0Rakdm5jAYDXyhhFFvbEb8gr21T7q1IbRqspCnckeUD5VtZhHPo0nlWPNTFamR+ya9B9LoBmwqNwlNDIbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pcYnTPBA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LTmcF0lU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pcYnTPBA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LTmcF0lU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pcYnTPBA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LTmcF0lU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pcYnTPBA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LTmcF0lU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 89C5367676;
	Fri, 15 May 2026 06:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778827768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e8NUnaDZlo+GyVifaqPyAi7GTKjic1sWT3L2IsC/iXI=;
	b=pcYnTPBAQtjBlMhDqq9ZWuEYjscFeSBpW+5TJY14T9DYkp4TBdJLehqvyaUtAJ+OTYV5Ef
	gaC/UpTffgUd6bI2mOSTocAT46lmOFxlMo2iybP6+pkBBSnIT96eR2k0Gp+0VU0VPEI5Pf
	tAaLUTq96vWa496Foo7lkhBc1yAigIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778827768;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e8NUnaDZlo+GyVifaqPyAi7GTKjic1sWT3L2IsC/iXI=;
	b=LTmcF0lUuljuSzaNCqQl5nXD/N+1ubr4+29dAgYnWvCcP3K+JZrmIcnsty0/Sx4eOJn5vy
	NcVgrc7FkOhdXuDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pcYnTPBA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LTmcF0lU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778827768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e8NUnaDZlo+GyVifaqPyAi7GTKjic1sWT3L2IsC/iXI=;
	b=pcYnTPBAQtjBlMhDqq9ZWuEYjscFeSBpW+5TJY14T9DYkp4TBdJLehqvyaUtAJ+OTYV5Ef
	gaC/UpTffgUd6bI2mOSTocAT46lmOFxlMo2iybP6+pkBBSnIT96eR2k0Gp+0VU0VPEI5Pf
	tAaLUTq96vWa496Foo7lkhBc1yAigIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778827768;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e8NUnaDZlo+GyVifaqPyAi7GTKjic1sWT3L2IsC/iXI=;
	b=LTmcF0lUuljuSzaNCqQl5nXD/N+1ubr4+29dAgYnWvCcP3K+JZrmIcnsty0/Sx4eOJn5vy
	NcVgrc7FkOhdXuDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 542FD593A9;
	Fri, 15 May 2026 06:49:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r6kcE/jBBmr1TAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 06:49:28 +0000
Date: Fri, 15 May 2026 08:49:27 +0200
Message-ID: <87h5o9upzc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aryan Kushwaha <aryankushwaha3101@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kailang Yang <kailang@realtek.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Plus 14
In-Reply-To: <CAFUwA8V+n0ewnk8uZkPm-DZ_EoB0XgBmp3YjOfO6wr815r5vJw@mail.gmail.com>
References: <CAFUwA8V+n0ewnk8uZkPm-DZ_EoB0XgBmp3YjOfO6wr815r5vJw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 89C5367676
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sun, 10 May 2026 12:13:55 +0200,
Aryan Kushwaha wrote:
> 
> 
> From: Aryan Kushwaha <aryankushwaha3101@gmail.com>
> Date: Sun, 10 Apr 2026 15:43:55 +0530
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
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/
> alc269.c
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7018,6 +7018,7 @@
>   SND_PCI_QUIRK(0x103c, 0x8a30, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
>   SND_PCI_QUIRK(0x103c, 0x8a31, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
>   SND_PCI_QUIRK(0x103c, 0x8a34, "HP Pavilion x360 2-in-1 Laptop 14-ek0xxx",
> ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
> + SND_PCI_QUIRK(0x103c, 0x8a36, "HP Pavilion Plus 14-eh0xxx",
> ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
>   SND_PCI_QUIRK(0x103c, 0x8a3d, "HP Victus 15-fb0xxx (MB 8A3D)",
> ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
>   SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)",
> ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
>   SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
> --
> 2.54.0

The patch has wrong spacing likely due to your mailer, so it can't be
applied cleanly via git-am.
Please fix your mailer setup and resubmit.


thanks,

Takashi


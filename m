Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C4A30DECE
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 07:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740542; cv=none; b=o370kHlmySnU5eXcOCaWRjvcUxOQfdd2OlMt2IIQn4FaVEqkWbKp9Lxrq2ENvm40Z31FlyEDp9NGwR7sRS+IEVUOUO8iPCDFenPwXirThxqyeh7jwLCCWTZqvhMLEM7CLA+6nGwHg1w/fQMPn5b6Dzdn4K3oeqdcH5NyoiB+soI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740542; c=relaxed/simple;
	bh=sAM3aTPJiCJSxrVZFRlBRUDjzEiFCZV21XWMN5nPQdo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zb1HDVbDE5I0C0q+bMv2MraCKSpRrixt/nqv/DEGjyHSxhx1CpGb1QxzKBiYgYx4JDtTNBTTFHUj0XR+1KmDD5XJERiC8qJMl/x2ie/PqkZsTV2xwa2uAmZfW8eViCBzBjc8vQCejJeqG+9eRtgkd2NQsC+mxHSW6fIko1YHAIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eiEnunf7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lplPVb4y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O02hU/qa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wsHTdS3j; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eiEnunf7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lplPVb4y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O02hU/qa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wsHTdS3j"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D70F7403D;
	Mon,  3 Aug 2026 07:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nyFJX9yKOOW6hL5g/LhsRSBmK5lEZRLgYqvW7P6E9o=;
	b=eiEnunf7kaxN4DVtV6utUKXmnQcKK/P5U+ennshs4v14REdSq+ihxrtvtke5JGw7KdQK3O
	MPbrIazEYtZARe4zT/TSLVGP8uyZiy5+n8iGPo0sjN3vM6yTyonrgK2bF24MyGgeeRYFjK
	9HnIMdYEkbwtDJrOADkwpWFjlqvL8Xg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nyFJX9yKOOW6hL5g/LhsRSBmK5lEZRLgYqvW7P6E9o=;
	b=lplPVb4yTVU0E1VWSz6gB67xaB8UeoUpwP0lgX8poQpescC/dSgANnb+wuGU+yU/+ShGbc
	sh7pS4z+waysrDCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="O02hU/qa";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wsHTdS3j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nyFJX9yKOOW6hL5g/LhsRSBmK5lEZRLgYqvW7P6E9o=;
	b=O02hU/qayHKCRJUT8zJJEnFT97pjZ1LNWQOP888yk2sW3yIGKMO1oGrzxeNimLPRLmdJCk
	ldPBJxvOGDaaSHyYo6LrXTkHv/Wlq7uzAq5Qw8ES44c/RewRtaXJqZEf4SymJ204800LSe
	4eGV/C4layAGdOFHLpn7OJcLiWvUxwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740530;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nyFJX9yKOOW6hL5g/LhsRSBmK5lEZRLgYqvW7P6E9o=;
	b=wsHTdS3jMmZDI4d4RtPDWzEC6V5e0BR+ZRxlXur5eYCGAv7VRI7VyqesB3HVaOIkdxkKl3
	z1V3/CQHgejTTuDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B816C779A1;
	Mon,  3 Aug 2026 07:02:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y21fK/I8cGqDCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 07:02:10 +0000
Date: Mon, 03 Aug 2026 09:02:10 +0200
Message-ID: <878q6nbsb1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?EUC-KR?B?uvuzqrTCyLK80g==?= <safenine@gmail.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for LG Gram 17ZD90R-EX79K
In-Reply-To: <CAJ79ZrGy5F0LwQ=xZBmZi+MnTybiATPg2FGbS-7NaMWvb_6syQ@mail.gmail.com>
References: <CAJ79ZrGy5F0LwQ=xZBmZi+MnTybiATPg2FGbS-7NaMWvb_6syQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.50
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D70F7403D
X-Spamd-Result: default: False [-3.50 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.19)[-0.969];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 30 Jul 2026 06:20:09 +0200,
ºû³ª´ÂÈ²¼Ò wrote:
> 
> From: Jabong Koo <safenine@gmail.com>
> 
> The internal speakers on the LG Gram 17ZD90R-EX79K remain silent,
> while headphone output works normally.
> 
> The machine uses a Realtek ALC298 codec with PCI subsystem ID
> 1854:048b. Existing LG Gram subsystem IDs 1854:0488, 1854:0489 and
> 1854:048a use ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS, but 1854:048b is
> missing from the quirk table.
> 
> Add the matching quirk for subsystem ID 1854:048b.
> 
> Tested successfully on Ubuntu HWE kernels 6.17.0-41-generic and
> 7.0.0-28-generic.
> 
> Signed-off-by: Jabong Koo <safenine@gmail.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c
> b/sound/hda/codecs/realtek/alc269.c
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7752,6 +7752,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1854, 0x0488, "LG gram 16 (16Z90R)",
> ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
>  	SND_PCI_QUIRK(0x1854, 0x0489, "LG gram 16 (16Z90R-A)",
> ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
>  	SND_PCI_QUIRK(0x1854, 0x048a, "LG gram 17 (17ZD90R)",
> ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
> +	SND_PCI_QUIRK(0x1854, 0x048b, "LG gram 17 (17ZD90R-EX79K)",
> ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
>  	SND_PCI_QUIRK(0x1854, 0x05bf, "LG gram 17ZD90S",
> ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
>  	SND_PCI_QUIRK(0x1854, 0x05c0, "LG gram 16Z90S",
> ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
>  	SND_PCI_QUIRK(0x1854, 0x05c1, "LG gram 14Z90S",
> ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),

The patch looks malformed (with wrong spaces), likely due to your
mailer, so it can't be applied cleanly via git-am.
Please fix your mailer setup, and resubmit the fix.


thanks,

Takashi

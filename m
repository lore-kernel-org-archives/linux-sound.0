Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A5F36308A
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 05:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776057870; cv=none; b=VaochvJsuv41X8Ro2NZV0LSmtSamCUeLH+7jPXGzp1nDu1a5GDPoIp5wsDixNDCa/2SasTFFIxK72F/3mD5LTOEZpgZO2z6ogwswTTjVXerNdN88OLYS+HbblknadSuptI5CzPsCtOJ0TU4iE9FuOFg/2euzqq2vY8cwj6IZiIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776057870; c=relaxed/simple;
	bh=oo8C4LzSikFTLpuF4skT+7hBMni8t2IxO6UhF3+Cqpo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=icTe5DWct7HPmJwPO5j5eJiEOrZDlp4Evm2J7sxRRwQne5CpeeJtLSzcpauRqdIO2Uw7WNk3AKvJfHBW6YaNVtoO33fNj2JMO5xBY39qDgORIjlhrnWcl+rzhnZy22yTvc3z91MBGH34HhNFW02EMxrcGAfMQbiLjd6JLN+YjCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h04Z5cvs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RvmgOT3B; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h04Z5cvs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RvmgOT3B; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h04Z5cvs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RvmgOT3B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h04Z5cvs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RvmgOT3B"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2A9475BCE2;
	Mon, 13 Apr 2026 05:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776057867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pg2BhUyjHYnkOmpeY8twnF3Lqw6aFWsV6FyKIT87zQg=;
	b=h04Z5cvsMbB0lr8rOSUG8biNzaNenM8PtXyu2IIdsJMF4uIpSqnG2aO+xav8q2OTj7QPgt
	uAZALoQl3gLAhEfnkfpPJcYXurF5GBSeKzAJ0cvL+E6m5opvAKC1jJ3k+T7FZu4hQfketb
	SC+yBB8/9yNNCxaslgskc1/lyVbBqg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776057867;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pg2BhUyjHYnkOmpeY8twnF3Lqw6aFWsV6FyKIT87zQg=;
	b=RvmgOT3B63cBUkbbiElSzwKXZgx6SAJ06oxCDDOx+/XCjDxS4Eptoz3o0q5tu528ZNKifT
	wlnmMkeRd7ntUqBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=h04Z5cvs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RvmgOT3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776057867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pg2BhUyjHYnkOmpeY8twnF3Lqw6aFWsV6FyKIT87zQg=;
	b=h04Z5cvsMbB0lr8rOSUG8biNzaNenM8PtXyu2IIdsJMF4uIpSqnG2aO+xav8q2OTj7QPgt
	uAZALoQl3gLAhEfnkfpPJcYXurF5GBSeKzAJ0cvL+E6m5opvAKC1jJ3k+T7FZu4hQfketb
	SC+yBB8/9yNNCxaslgskc1/lyVbBqg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776057867;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pg2BhUyjHYnkOmpeY8twnF3Lqw6aFWsV6FyKIT87zQg=;
	b=RvmgOT3B63cBUkbbiElSzwKXZgx6SAJ06oxCDDOx+/XCjDxS4Eptoz3o0q5tu528ZNKifT
	wlnmMkeRd7ntUqBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0A2C4AD01;
	Mon, 13 Apr 2026 05:24:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sEEZNQp+3Gn4VQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Apr 2026 05:24:26 +0000
Date: Mon, 13 Apr 2026 07:24:26 +0200
Message-ID: <87pl43whyt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hristiyan <hristian.anchev@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add support for HP ENVY x360 Convertible 15-ee0xxx
In-Reply-To: <20260412224316.29010-1-hristian.anchev@gmail.com>
References: <20260412224316.29010-1-hristian.anchev@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 2A9475BCE2
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Mon, 13 Apr 2026 00:43:16 +0200,
Hristiyan wrote:
> 
> The HP ENVY x360 Convertible 15-ee0xxx (PCI SSID 103c:876f) has a
> Realtek ALC245 codec with Cirrus Logic CS35L41 smart amplifiers
> connected via I2C. The BIOS does not provide the required ACPI _DSD
> properties for the amplifiers, causing the speakers to produce no
> sound under Linux.
> 
> Add an entry using ALC245_FIXUP_CS35L41_I2C_2 to enable the
> internal speakers on this device.
> 
> Signed-off-by: Hristiyan <hristian.anchev@gmail.com>

Please use the full name for From and Signed-off-by.
Also, doesn't it need a hook for the mute-LED like other quirks for HP machines?


thanks,

Takashi

> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 45f9d6487..d05c0c57a 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6919,6 +6919,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8756, "HP ENVY Laptop 13-ba0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
>  	SND_PCI_QUIRK(0x103c, 0x8760, "HP EliteBook 8{4,5}5 G7", ALC285_FIXUP_HP_BEEP_MICMUTE_LED),
>  	SND_PCI_QUIRK(0x103c, 0x876e, "HP ENVY x360 Convertible 13-ay0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
> +	SND_PCI_QUIRK(0x103c, 0x876f, "HP ENVY x360 Convertible 15-ee0xxx", ALC245_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x877a, "HP", ALC285_FIXUP_HP_MUTE_LED),
>  	SND_PCI_QUIRK(0x103c, 0x877d, "HP", ALC236_FIXUP_HP_MUTE_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8780, "HP ZBook Fury 17 G7 Mobile Workstation",
> -- 
> 2.53.0
> 

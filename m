Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7811C15B546
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 09:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743066348; cv=none; b=nViMXG/iYxhqaZkruvY6LlMsEKeX5jZcCgsgTJb6pEeo0070U4pCdzCYC0HQCp6185ZcyLY5FkCR+Tdlm8WYVnuCBm+/xDVchSJ6aytDmQCwCYPWMZbm9+Tud4sRrv1JNyJWYxVqqFCFeg6+k33KrYWxrVBn4qRkzlfHlmQoisw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743066348; c=relaxed/simple;
	bh=IJb42fEgV39cxnXSXgiYS+Z9F+jSWDy8zgOtExTomCM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iF50q+hD4hTK8yXBnyPIvGKuB7/4bzfNXmfJJNYLniR4gvQCg5KDU4rMUtOcf6TGLIFvMktlxwymJZeIoi8sXIf9FB0DjDSN3Klu92fy19QylJH8xGBeS2OJ3r4XPQ++jH3jQ9PW10i+l5a2v6kNOzH5WD9THP4IAqACXMnPmvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yCugvXY8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2eqnUZLe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yCugvXY8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2eqnUZLe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yCugvXY8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2eqnUZLe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yCugvXY8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2eqnUZLe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC68221163;
	Thu, 27 Mar 2025 09:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743066338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iE134nHcuziNgN9bbJ00hxDTGJCrnEpsrtkYXr84GSg=;
	b=yCugvXY8VxzFnUs2oK9MNq/W6ctBtthPxS/x7nrXh+OcS84N9yXpUmosJ2IEfZGftcs4Ou
	y1lO7nXtgHQxjT5S2A2DHtyFucPx9EVGN+aKMbHd9qDlXzUuRJsu6Em8S/2riHITbvVsbA
	KXMKnnST4Wn6aPOIe6Z0Ai0UfV1KDk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743066338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iE134nHcuziNgN9bbJ00hxDTGJCrnEpsrtkYXr84GSg=;
	b=2eqnUZLewSbSIEUNmiWC69AJNkS72gQgRgEXY7LqadFnia0Feons+fSrHyhFfg+zt/+GoX
	mwCF6m39jRsj13DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yCugvXY8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2eqnUZLe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743066338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iE134nHcuziNgN9bbJ00hxDTGJCrnEpsrtkYXr84GSg=;
	b=yCugvXY8VxzFnUs2oK9MNq/W6ctBtthPxS/x7nrXh+OcS84N9yXpUmosJ2IEfZGftcs4Ou
	y1lO7nXtgHQxjT5S2A2DHtyFucPx9EVGN+aKMbHd9qDlXzUuRJsu6Em8S/2riHITbvVsbA
	KXMKnnST4Wn6aPOIe6Z0Ai0UfV1KDk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743066338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iE134nHcuziNgN9bbJ00hxDTGJCrnEpsrtkYXr84GSg=;
	b=2eqnUZLewSbSIEUNmiWC69AJNkS72gQgRgEXY7LqadFnia0Feons+fSrHyhFfg+zt/+GoX
	mwCF6m39jRsj13DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8736B1376E;
	Thu, 27 Mar 2025 09:05:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1UDKH+IU5WeQeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 27 Mar 2025 09:05:38 +0000
Date: Thu, 27 Mar 2025 10:05:38 +0100
Message-ID: <87jz8a9731.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Enable speakers on further Samsung Galaxy Book2 Pro
In-Reply-To: <20250326201953.131948-1-benjamin@sipsolutions.net>
References: <20250326201953.131948-1-benjamin@sipsolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: AC68221163
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Wed, 26 Mar 2025 21:19:53 +0100,
Benjamin Berg wrote:
> Note that I didn't really manage to test this directly. Trying to do a
> reconfigure resulted in a hang and I didn't figure out how to use the
> patch= option with a firmware file.
> However, the machine does work fine when configuring the two speakers
> from userspace, so I am confident that this patch is correct.

FYI, the equivalent can be achieved with model option, too.
e.g. passing model=144d:c870 will apply the same existing quirk as
SSID 144d:c870.  If your target is the secondary codec, pass like
"model=,144d:c870" instead.

> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index c735f630ecb5..e4ea5ea5bb27 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10758,6 +10758,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x144d, 0xca06, "Samsung Galaxy Book3 360 (NP730QFG)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
>  	SND_PCI_QUIRK(0x144d, 0xc868, "Samsung Galaxy Book2 Pro (NP930XED)", ALC298_FIXUP_SAMSUNG_AMP),
>  	SND_PCI_QUIRK(0x144d, 0xc870, "Samsung Galaxy Book2 Pro (NP950XED)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
> +	SND_PCI_QUIRK(0x144d, 0xc01d, "Samsung Galaxy Book2 Pro (NP950QED)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
>  	SND_PCI_QUIRK(0x144d, 0xc872, "Samsung Galaxy Book2 Pro (NP950XEE)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
>  	SND_PCI_QUIRK(0x144d, 0xc886, "Samsung Galaxy Book3 Pro (NP964XFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
>  	SND_PCI_QUIRK(0x144d, 0xc1ca, "Samsung Galaxy Book3 Pro 360 (NP960QFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),

The table is sorted in PCI SSID order.  Could you try to put at the
right position?


thanks,

Takashi

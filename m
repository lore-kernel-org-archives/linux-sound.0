Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436B5270545
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 05:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169057; cv=none; b=IpXb71uKNcKof345xC7YOC+QYA2S3lHHarXAgC33KNrjK7qZ2Wr8aw7M9ZYZvDyPaSXxQFg5cTAmKoXEgVAkorfFDR9IlK+kNlk5SWDAajOAzQCwmHdTE6gNrbd1fe35EqO0ai5mGwwfR3z8wyeo0EFxBJsyMOwBqjh5UFClt5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169057; c=relaxed/simple;
	bh=8iqP2EyaLTTU2XehTNo61FsTJ7/2t42uPClY3j6ZcNc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HOmn1+s+5o1GHkFwlBBbqf1QQzfRJhNBf00Lpp+PjNErqqXovbwqOZmR3O2VQu96YIREY7rDxcAz5UNTd3EWH6h6MmazFuuuhWbX2sOFPDciYOYCwHvWtp069S4jS7rnHljy/arA6WskzkSXvuCN1Bzz8U9TrcNbYV/pXNELNy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qYupxHpw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HKyLnEMG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qYupxHpw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HKyLnEMG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qYupxHpw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HKyLnEMG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qYupxHpw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HKyLnEMG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 04421676D6;
	Tue, 19 May 2026 05:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779169049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KCdczYxBLj16F/eDtpAn+9fALhDSf9F67Kcmmh+Jjxs=;
	b=qYupxHpwFE4n8hLlLUuuBE0sifO80u7N0OjsezmKVnGAiM57Vi+JcfNa+EUrBwofM3Q3XG
	0yecItr4rzNs+5fhgvV5G0x7dQsae2wHWSX4pFGr/j33pmPgBcz0j5p2TlolluE35vP4zs
	GZ0PCTeNJWR5HDu3/xjNr89kjH6ff18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779169049;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KCdczYxBLj16F/eDtpAn+9fALhDSf9F67Kcmmh+Jjxs=;
	b=HKyLnEMGzFeU3oN8aqFNOk8XyC0awwN6yfgtBzWms6A2vsXI5HTmpAgi+T586kc58rZG/R
	2+WhkkjeVc4enqBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qYupxHpw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HKyLnEMG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779169049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KCdczYxBLj16F/eDtpAn+9fALhDSf9F67Kcmmh+Jjxs=;
	b=qYupxHpwFE4n8hLlLUuuBE0sifO80u7N0OjsezmKVnGAiM57Vi+JcfNa+EUrBwofM3Q3XG
	0yecItr4rzNs+5fhgvV5G0x7dQsae2wHWSX4pFGr/j33pmPgBcz0j5p2TlolluE35vP4zs
	GZ0PCTeNJWR5HDu3/xjNr89kjH6ff18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779169049;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KCdczYxBLj16F/eDtpAn+9fALhDSf9F67Kcmmh+Jjxs=;
	b=HKyLnEMGzFeU3oN8aqFNOk8XyC0awwN6yfgtBzWms6A2vsXI5HTmpAgi+T586kc58rZG/R
	2+WhkkjeVc4enqBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDB0F593A8;
	Tue, 19 May 2026 05:37:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3P8HMRj3C2r5YgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 May 2026 05:37:28 +0000
Date: Tue, 19 May 2026 07:37:24 +0200
Message-ID: <87fr3o3qp7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Aaron Erhardt <aer@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Fix noisy mic for Clevo V6xxAW
In-Reply-To: <20260518142034.65227-1-wse@tuxedocomputers.com>
References: <20260518142034.65227-1-wse@tuxedocomputers.com>
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
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 04421676D6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 18 May 2026 16:20:01 +0200,
Werner Sembach wrote:
> 
> From: Aaron Erhardt <aer@tuxedocomputers.com>
> 
> Add a PCI quirk to reduce the volume of the internal microphone to
> prevent extremely noisy signal.
> 
> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org
> ---
> V1->V2: Add cc stable
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 2f5d13032fd7a..b6b0237d79696 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7603,6 +7603,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1558, 0xa741, "Clevo V54x_6x_TNE", ALC245_FIXUP_CLEVO_NOISY_MIC),
>  	SND_PCI_QUIRK(0x1558, 0xa743, "Clevo V54x_6x_TU", ALC245_FIXUP_CLEVO_NOISY_MIC),
>  	SND_PCI_QUIRK(0x1558, 0xa763, "Clevo V54x_6x_TU", ALC245_FIXUP_CLEVO_NOISY_MIC),
> +	SND_PCI_QUIRK(0x1558, 0x6480, "Clevo V6xxAW", ALC245_FIXUP_CLEVO_NOISY_MIC),
>  	SND_PCI_QUIRK(0x1558, 0xb018, "Clevo NP50D[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1558, 0xb019, "Clevo NH77D[BE]Q", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1558, 0xb022, "Clevo NH77D[DC][QW]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),

The table is sorted in PCI SSID order, so please place the new entry
at the right position and resubmit.


thanks,

Takashi

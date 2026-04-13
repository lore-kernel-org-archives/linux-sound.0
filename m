Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844A45477E
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 05:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776058565; cv=none; b=AgsV67JzGRv4eNvEEJG2ixiVFz8DU/GnVdI0ZgeXaybZEICt3nggs1KH5fS5/79x0373Nw2wsfup9vGRh68rTaNVOI6yy6iPJ9joQdGyhY0H4iP5dvMpzj1lCysrD9Z51yLFKg66FXhzm5ZRVaQcg2oonmzXpcrSaAZh8pfFEd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776058565; c=relaxed/simple;
	bh=PG6gTqjJT52DFL2uQ58VBaOsZYoiBBQc6oI1TpnqKKo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lywpf0CbAcKST9E+oj/5G8UaNGnfZPOhZayCNFEZjT4IMQ0hrKlhxArR0WUA18E84yL0ikWI8mSixI6IZuCVxRXaqLkR3bJT78jrcixGvVOxl8uPVJ7myOcsLK5JhXZrDrIBMdTr29KfYlRvABTdSDyAIBZD533VLekhGJb3u2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GpgIDdc8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5V7erp9q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GpgIDdc8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5V7erp9q; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GpgIDdc8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5V7erp9q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GpgIDdc8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5V7erp9q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E281E6A893;
	Mon, 13 Apr 2026 05:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776058561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WLlxGWJhADFrjXWMZE+OK06QmzS6M8GjDms4YMDxDLo=;
	b=GpgIDdc8Y7xEGm19ZTYxMVKqHLHY1clkCpfY7Nw/SEfvTQ8rEcBZ/LVGXZ32KWzHwgvJkP
	ytVqa0N06QLwN+xv21QmPbZ3OS0TiHyRSRBumi4hnaMYcGk3yfdewwmgb9u4ze6JLumCyx
	HzNnqKCAqJasghJe3jpHO7h1ti4Cdpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776058561;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WLlxGWJhADFrjXWMZE+OK06QmzS6M8GjDms4YMDxDLo=;
	b=5V7erp9qWH39JGXE4IYXyevhx0rVaKAMZP3Pf45ZKHzboZviHChvaIjS9I68CGtxqbYFCG
	8AOIuvbiJ+/vsVBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776058561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WLlxGWJhADFrjXWMZE+OK06QmzS6M8GjDms4YMDxDLo=;
	b=GpgIDdc8Y7xEGm19ZTYxMVKqHLHY1clkCpfY7Nw/SEfvTQ8rEcBZ/LVGXZ32KWzHwgvJkP
	ytVqa0N06QLwN+xv21QmPbZ3OS0TiHyRSRBumi4hnaMYcGk3yfdewwmgb9u4ze6JLumCyx
	HzNnqKCAqJasghJe3jpHO7h1ti4Cdpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776058561;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WLlxGWJhADFrjXWMZE+OK06QmzS6M8GjDms4YMDxDLo=;
	b=5V7erp9qWH39JGXE4IYXyevhx0rVaKAMZP3Pf45ZKHzboZviHChvaIjS9I68CGtxqbYFCG
	8AOIuvbiJ+/vsVBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8A344AD0D;
	Mon, 13 Apr 2026 05:36:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aMZ8J8GA3GmfYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Apr 2026 05:36:01 +0000
Date: Mon, 13 Apr 2026 07:36:01 +0200
Message-ID: <87lderwhfi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Faye <faye.opensource@gmail.com>
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Acer PT316-51S headset mic
In-Reply-To: <20260413031259.30135-1-faye.opensource@gmail.com>
References: <20260413031259.30135-1-faye.opensource@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Mon, 13 Apr 2026 05:12:59 +0200,
Faye wrote:
> 
> The Acer PT316-51S (PCI SSID 1025:160e) with ALC287 codec does not
> detect the headset microphone due to missing BIOS pin configuration
> for pin 0x19. Apply ALC2XX_FIXUP_HEADSET_MIC to enable it.
> 
> Signed-off-by: Faye <faye.opensource@gmail.com>

Signed-off-by tag needs to be a real name (or a known identity) as
it's a legal requirement (and preferably From tag should be same,
too).

Also...

> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index cb39054..75466f4 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6689,6 +6689,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1025, 0x1534, "Acer Predator PH315-54", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1025, 0x1539, "Acer Nitro 5 AN515-57", ALC2XX_FIXUP_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC2XX_FIXUP_HEADSET_MIC),
> +	SND_PCI_QUIRK(0x1025, 0x160e, "Acer PT316-51S", ALC2XX_FIXUP_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
>  	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),

... the table is sorted in PCI SSID order.  Please put the new entry
at the right position.

Could you resubmit with the above corrections?


thanks,

Takashi

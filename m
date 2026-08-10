Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF1A3B9DAE
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 11:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361910; cv=none; b=JrMHMF7G5XZq7bE1bWPoUzZ0ttyNblUYOkFdLqfyZqsrg+wwZy/QJtNN6GnAZ6GM7ZgxNKvdAnx89T4C++gxTmvCeoK4wTvnjKt+2iD1nHxGzgctk0Y8tMDIU6D6khch1oFvnN69zkyMgON18prQP2ZwVcTpnifQVh0kLpZ90aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361910; c=relaxed/simple;
	bh=C9j2ZWM6ddWaapaUUWuXODeRBJoUre4ITgJJBzFrPEk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H+IJW1/x7mWubYERBdKdg/DQtwhUSwDdhdWz/qCdQe0UStTq8m7Vl4g+LvKTf0o8xUOcreIBBgtFce6uu0UVDFjfx16T4Ch9jjaaycOkOcyKze9zUmowjVH0TASpjUmB0do2CKm1wSSP7ySDW+3lQ+nhASdEgR/jaUMsdZvOXvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qQGV3BTD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8naBJIvk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ID1Gfh6p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EiBKykGv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qQGV3BTD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8naBJIvk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ID1Gfh6p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EiBKykGv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7C7213E0C;
	Mon, 10 Aug 2026 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786361902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/RnGlmU3WEKg/PJeM8+6mTLIAp2GUmTxPEiGl/8JCAk=;
	b=qQGV3BTD9+qgg5QxV4jVe7bDxRQTRufh809vugrzxL9tOxvvoT9bZNThtMX9iEPlsOTVgm
	V3v/VxRiDDWmvoNSryZfDxbIRa2gn289OpZven3kf7IXCqnTkknNW2qro/QJoLKZaG4Zmx
	2E2LveNZQZWb/P2kDumpNQmULIZmrNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786361902;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/RnGlmU3WEKg/PJeM8+6mTLIAp2GUmTxPEiGl/8JCAk=;
	b=8naBJIvkNcECciTFtmpBv5AqdtnhmsyyssAyGhHSMCs9midrDptiuAtMe4s3Ll+N5yAqQh
	s2dUuvSGvBknkqAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786361898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/RnGlmU3WEKg/PJeM8+6mTLIAp2GUmTxPEiGl/8JCAk=;
	b=ID1Gfh6pTr3i0T8DElcqPvcWOUMdh/kjTu5f5qzoAKgffyF34Cch1Qp0f2meoGo9AHXNsf
	Tv8dASJmCSbeN64EdVWXB305D7I/8nF+ydQGNVir59eOI9rgYIJdodtfU1iAFCrC5aIJAq
	irlndPEh9LxWsaHMV0uRP/6/Pc8mChQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786361898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/RnGlmU3WEKg/PJeM8+6mTLIAp2GUmTxPEiGl/8JCAk=;
	b=EiBKykGv+fzneH+2MHSMuJ+kShW7OF6Id9dpjc/8bzndYOXtI4t96aZsLO1QWb/hczKCgV
	vZzPEq0maMBfTdAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 568DC779BC;
	Mon, 10 Aug 2026 11:38:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gFndEyq4eWpvKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Aug 2026 11:38:18 +0000
Date: Mon, 10 Aug 2026 13:38:17 +0200
Message-ID: <87y0ee8aty.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Brian Koebbe <brian@koeb.be>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix quiet 3.5mm jacks on Beelink SER6
In-Reply-To: <20260810042425.1122213-1-brian@koeb.be>
References: <20260810042425.1122213-1-brian@koeb.be>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,koeb.be:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 10 Aug 2026 06:24:25 +0200,
Brian Koebbe wrote:
> 
> Both the front headphone jack and the rear line-out jack play back
> at a barely audible volume on the Beelink SER6 Max (ALC897, PCI subsystem
> ID 1f66:0202), even with all mixer controls at 0dB. GPIO2 on the
> codec gates an external headphone/line amplifier that the generic
> parser never enables. Add a fixup that asserts it. Verified fixed
> on both jacks.
> 
> Signed-off-by: Brian Koebbe <brian@koeb.be>
> ---
>  sound/hda/codecs/realtek/alc662.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
> index 2cf3664a35ff..2ce1b171337d 100644
> --- a/sound/hda/codecs/realtek/alc662.c
> +++ b/sound/hda/codecs/realtek/alc662.c
> @@ -324,6 +324,7 @@ enum {
>  	ALC897_FIXUP_HEADSET_MIC_PIN2,
>  	ALC897_FIXUP_UNIS_H3C_X500S,
>  	ALC897_FIXUP_HEADSET_MIC_PIN3,
> +	ALC897_FIXUP_BEELINK_SER6_AMP,
>  	ALC662_FIXUP_CSL_GPIO,
>  };
>  
> @@ -778,6 +779,14 @@ static const struct hda_fixup alc662_fixups[] = {
>  			{ }
>  		},
>  	},
> +	[ALC897_FIXUP_BEELINK_SER6_AMP] = {
> +		/* Beelink SER6 Max (Ryzen 6900HX) both 3.5mm jacks are very
> +		 * quiet without this: GPIO2 gates an external headphone/line
> +		 * amplifier that the generic parser never enables.
> +		 */
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_gpio4,
> +	},
>  	[ALC662_FIXUP_CSL_GPIO] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc662_fixup_csl_amp,
> @@ -788,6 +797,7 @@ static const struct hda_quirk alc662_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1019, 0x9087, "ECS", ALC662_FIXUP_ASUS_MODE2),
>  	SND_PCI_QUIRK(0x1019, 0x9859, "JP-IK LEAP W502", ALC897_FIXUP_HEADSET_MIC_PIN3),
>  	SND_PCI_QUIRK(0x1022, 0xc950, "CSL Unity BF24B", ALC662_FIXUP_CSL_GPIO),
> +	SND_PCI_QUIRK(0x1f66, 0x0202, "Beelink SER6 Max 6900", ALC897_FIXUP_BEELINK_SER6_AMP),
>  	SND_PCI_QUIRK(0x1025, 0x022f, "Acer Aspire One", ALC662_FIXUP_INV_DMIC),
>  	SND_PCI_QUIRK(0x1025, 0x0241, "Packard Bell DOTS", ALC662_FIXUP_INV_DMIC),
>  	SND_PCI_QUIRK(0x1025, 0x0308, "Acer Aspire 8942G", ALC662_FIXUP_ASPIRE),

The table is sorted in PCI SSID order.  Could you try to put the new
entry at the right position, and resubmit the corrected patch?


thanks,

Takashi

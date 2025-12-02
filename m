Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E4F3148D5
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764681983; cv=none; b=PeVtnD56fu3Xb8Z+WulDcVHbhoYmbcZIqINheCH4iD/SSK86gfAGqfKWTXiQuJV9LaVZ42sE54I3eDEM46L2pmKhd6oSLtUCmYjNtIACC7fH7+D+LjFg6lA/qt1jejVaXP+FQ2smC9LK7vvNitM7iP98SvQyu3sVkEpNnB3YRdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764681983; c=relaxed/simple;
	bh=S9DD1CGtG0QkLq/nkPv2zMW4py7zYMUS5b9mDfMK1cg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JnmA+a/PtgUmaVQe51MA197ZcblOOzBC8La4nbKHq8Exnz/xNIOSia8Rwq9H4eB/u/DKDuYXfT0mnnIpRWqNMbJGN6BNgCt39tnDKoOJL+opNSNRaqV+TMkkV4/O2V926DdzY2z9Hftgf4aM3dedx43sDBbr92HumFtdKL/dt6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lQvmLdg9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ooeGogmT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GqwKD9Vz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f5DQ8V4l; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lQvmLdg9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ooeGogmT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GqwKD9Vz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f5DQ8V4l"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3BE235BCF8;
	Tue,  2 Dec 2025 13:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764681972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMCjLu9e+y0K61hrEMdu8xR3tRjv3cfiCOsfBr9LBPs=;
	b=lQvmLdg981gkOZgR3amYdGG+1RvBXenTIS8C1o0Jn83m+h0DicDTpG2VjVJ5uZQL9xgkpi
	dDKWFmu7sTQcrtR5Kl7Zfsp/TiCa3Rt6asw71frGOUlqXGpEM3LN+qvijEtDT3jqC8/hIJ
	0TiO1bzTGa/XQ7pvMId0/Bh4qcLaOI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764681972;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMCjLu9e+y0K61hrEMdu8xR3tRjv3cfiCOsfBr9LBPs=;
	b=ooeGogmTX7gQQUC5zjwFBQJmerO3jF4FBWfbB343BWKaZkWKDhrkJkJuI/rKLUSSXZkc/R
	ZLFZ9DJZP2at0MCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GqwKD9Vz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=f5DQ8V4l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764681971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMCjLu9e+y0K61hrEMdu8xR3tRjv3cfiCOsfBr9LBPs=;
	b=GqwKD9Vz9+4E2gzZL3tEPol/8Yl5RZNu4hYm5/+j1UJUncrIDfUj7iiu8q9/ggL8o/5nz8
	QyrvfA2DyrPCGQ943eaa9Yx4fw++Bf4d2yWtMq099e3COpFv7lifq5i9Kne9tHQSMajL8+
	7eyRT6Zn9yWl2qBMjrN2+EjVlrzb11Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764681971;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMCjLu9e+y0K61hrEMdu8xR3tRjv3cfiCOsfBr9LBPs=;
	b=f5DQ8V4luHBgYSeI/g8VhAx49RCdFvCXf45UprO9KN2fc/MDTbNE8UhhlHR8vL+k9qJad+
	re2huzOdIUe0K2DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 260D73EA63;
	Tue,  2 Dec 2025 13:26:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XV29CPPoLmkAPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Dec 2025 13:26:11 +0000
Date: Tue, 02 Dec 2025 14:26:10 +0100
Message-ID: <877bv5uia5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ilyas Gasanov <public@gsnoff.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add codec IDs to HP ProBook G8 fixups
In-Reply-To: <20251202131508.56184-1-public@gsnoff.com>
References: <20251202131508.56184-1-public@gsnoff.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 3BE235BCF8
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-hardware.org:url,gsnoff.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Tue, 02 Dec 2025 14:15:08 +0100,
Ilyas Gasanov wrote:
> 
> According to amixer output, as well as the result value of the
> GET_SUBSYSTEM_ID HDA verb, the codec's own subsystem ID may differ from
> that of the HDA controller.
> 
> The snd_hda_pick_fixup() function specifically inspects just the codec's
> subsystem ID, ignoring that of the controller, which causes mismatch on
> machines where the above is the case, unless the codec's subsystem ID is
> also covered.
> 
> For reference:
> 
>  - https://linux-hardware.org/?probe=9829e4ea09&log=amixer
>    (HP ProBook 440 G8, MB 8A74, codec 10ec0236,103c8a7a)
>  - https://linux-hardware.org/?probe=5b2ca9b826&log=amixer
>    (HP ProBook 450 G8, MB 8A75, codec 10ec0236,103c8a7b)
>  - https://linux-hardware.org/?probe=228aee06a5&log=amixer
>    (HP ProBook 440 G8, MB 8A76, codec 10ec0236,103c8a7c)
>  - https://linux-hardware.org/?probe=1cd4bf968d&log=amixer
>    (HP ProBook 450 G8, MB 8A77, codec 10ec0236,103c8a7d)
> 
> Signed-off-by: Ilyas Gasanov <public@gsnoff.com>

The primary matching is with PCI SSID, not the codec SSID.
Do they have the same numbers on those machines?


thanks,

Takashi

> ---
>  sound/hda/codecs/realtek/alc269.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 4efc16ae6b5d..d34a196158aa 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6599,6 +6599,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8a75, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
> +	SND_PCI_QUIRK(0x103c, 0x8a7a, "HP ProBook 440 G8 (MB 8A74)", ALC236_FIXUP_HP_GPIO_LED),
> +	SND_PCI_QUIRK(0x103c, 0x8a7b, "HP ProBook 450 G8 (MB 8A75)", ALC236_FIXUP_HP_GPIO_LED),
> +	SND_PCI_QUIRK(0x103c, 0x8a7c, "HP ProBook 440 G8 (MB 8A76)", ALC236_FIXUP_HP_GPIO_LED),
> +	SND_PCI_QUIRK(0x103c, 0x8a7d, "HP ProBook 450 G8 (MB 8A77)", ALC236_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)", ALC236_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)", ALC236_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8aa8, "HP EliteBook 640 G9 (MB 8AA6)", ALC236_FIXUP_HP_GPIO_LED),
> -- 
> 2.51.0
> 

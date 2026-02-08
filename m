Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734AB5FDA7
	for <linux-sound@vger.kernel.org>; Sun,  8 Feb 2026 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770539542; cv=none; b=m0CF3O+BWMQH+VQqistkDuSrTaa3+f8nd5wdGzapSyZT3IpRNE1u9UDjXLQX4oHIMU5747ngpapppo5JXfdp9DbJblJw2J4aOK9UUmEls5jWU1HJpizl4KSE79DPFE0XUqSLWymjuQV5Ugv094HSPAzf/bsyiDrXo8Ah2Ov9KaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770539542; c=relaxed/simple;
	bh=hHEOy9LrADks+sMUS+GSQGb2CCwnCjnxkbuyM45D4kE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o5XXSvikP0vwa3fLrBAIDTnReMdZKJU/C04avmWyMHwtR99vjSzAoaMWhXjqVv/S25jwPM9PDBK68y+EiPgrDcOVd5EGUONtyij1K9vRFvjpQ/F8oE6sEIsNjOWQULYCMfZ971AV+9VHNZ1s0LRfgXcviA8RsEc7PVM12ImVe7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FcDwo7bw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YOLcAJLJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FcDwo7bw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YOLcAJLJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FcDwo7bw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YOLcAJLJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FcDwo7bw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YOLcAJLJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A32B05BCC4;
	Sun,  8 Feb 2026 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770539540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JnvfukynJpFpRT/Jfq9RjBV3bstBZ0diX0wWK0zZs7A=;
	b=FcDwo7bwsoGbOQ+u7nRMhY/g7Qjq5DvLVi0UgOvAlILn5J+9dg6/4uvy2J+nDjP/IJg23J
	bt4smUWWLUbPZfwu1bIvyYK586BcTwQ8tq0RxSyRYwxZ/pSZ0qQdESXkpLI/25U2mi1eAb
	0EtLDJtL7a/YL4O4Q8HfwsMB61p0hwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770539540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JnvfukynJpFpRT/Jfq9RjBV3bstBZ0diX0wWK0zZs7A=;
	b=YOLcAJLJO17gMdVQI7NHCKanTcelWipcvw3cA1Yi3nO/UT7F7u6x91Wl4AyhfqUUx8pERX
	ttH2xmSnI8ShqyBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770539540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JnvfukynJpFpRT/Jfq9RjBV3bstBZ0diX0wWK0zZs7A=;
	b=FcDwo7bwsoGbOQ+u7nRMhY/g7Qjq5DvLVi0UgOvAlILn5J+9dg6/4uvy2J+nDjP/IJg23J
	bt4smUWWLUbPZfwu1bIvyYK586BcTwQ8tq0RxSyRYwxZ/pSZ0qQdESXkpLI/25U2mi1eAb
	0EtLDJtL7a/YL4O4Q8HfwsMB61p0hwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770539540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JnvfukynJpFpRT/Jfq9RjBV3bstBZ0diX0wWK0zZs7A=;
	b=YOLcAJLJO17gMdVQI7NHCKanTcelWipcvw3cA1Yi3nO/UT7F7u6x91Wl4AyhfqUUx8pERX
	ttH2xmSnI8ShqyBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 680883EA63;
	Sun,  8 Feb 2026 08:32:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0bsNFxRKiGlJHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Feb 2026 08:32:20 +0000
Date: Sun, 08 Feb 2026 09:32:20 +0100
Message-ID: <87wm0n7i0b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Kamil Kozar <dkk089@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC] Fix speaker/mic mute LEDs on HP OmniBook 7 AI 14-fr0220nw
In-Reply-To: <20260207211219.769419-1-dkk089@gmail.com>
References: <20260207211219.769419-1-dkk089@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sat, 07 Feb 2026 22:12:07 +0100,
Daniel Kamil Kozar wrote:
> 
> The OmniBook seems to be reusing PCI SSIDs from the HP Agusta, but it uses the
> ALC245 codec instead, so the current quirk cannot work on this machine.
> Using ALC245_FIXUP_HP_X360_MUTE_LEDS makes the mute LEDs work properly without
> any loss of audio functionality.
> I'm aware that this patch cannot go in as-is as it possibly breaks the Agusta
> , but I wasn't able to work out what kind of extra data can be used to
> distinguish these two machines.
> Please let me know if you need any extra information.

I suppose your machine has a different codec SSID.  Please check
/proc/asound/card*/codec#* file whether "Subsystem Id" field shows
0x103c8e3b or not.  If it's a different value, you can put an entry
with HDA_CODEC_QUIRK() with that codec SSID just before the existing
SND_PCI_QUIRK() for HP OmniBook.

See an example in the commit 1386d16761c0 ("ALSA: hda/realtek: Add
quirk for Lenovo Yoga 7 2-in-1 14AKP10").

OTOH, if it has the very same codec SSID, we'd need a different
solution.  Please show the output of alsa-info.sh (with --no-upload
option).


thanks,

Takashi

> ---
>  sound/hda/codecs/realtek/alc269.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index b66965a52107..84ea1ae7b36b 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6821,7 +6821,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8e36, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8e37, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8e3a, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
> -	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
> +	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP OmniBook 7 AI 14-fr0220nw", ALC245_FIXUP_HP_X360_MUTE_LEDS),
>  	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
> -- 
> 2.53.0
> 

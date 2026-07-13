Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2623D9530
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937398; cv=none; b=g00UYgj6DiKxnFTjQ4rhi03EVpU4U6OHrTUZzotmPExQJAXbpR36X09XNM/Gsqe0r4i5lxKiEdQoX4pukvTPxevel9jCwmOnB3YMBm1F9wLn1GBfzfwUrCRFNHVj62W4fR3rx8IciqzTWmmvsO2sT2LzKqsjIltszpvc4K4LG8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937398; c=relaxed/simple;
	bh=IIKxR7q7BHByer9iEkhmO7bVROshm9e4tTbRSG7I9+o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bsEpRZfqhN+Nun4vk3x4VK8vmVrQSX/WqMx3l3UbstoniIemyo59HwFlVHlFGAdJ1Be5PTL/BYPQBuv2NX/QORXLnsKEzwXeRxKD78PGYhrhdIhaaAAhzLtZ26g4XIGUx7nrgDxjnP/Kms6n9pnPkTVdydpwqE2S0DEgFApu03o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JG+zK6hg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JxW+iZPB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JG+zK6hg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JxW+iZPB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JG+zK6hg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JxW+iZPB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JG+zK6hg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JxW+iZPB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 09477774BD;
	Mon, 13 Jul 2026 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783937395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wi9TKgfqQm9H1D8cpD5/0JpKZ8yNX5N9MzSCe1TjbeQ=;
	b=JG+zK6hgly9EFnthAEQu7RIEa4krnSPDUlNNf1G9XvTwh21JmkpHV4Ae0A3QpRXVtH23bN
	26GFE6przWDuw6dAoWDT3Y+vs7E9WsHYZ/OCm4n8RXRqTwe2kL39/2339FGDznd/lYtu/P
	0Dj7WeWZok/ZkEHyAAbnhrGPw8POEAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783937395;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wi9TKgfqQm9H1D8cpD5/0JpKZ8yNX5N9MzSCe1TjbeQ=;
	b=JxW+iZPBHpGpNHUrJ1r+sr22peU2U1T2dgo4RGqZCdCjpup49PBkPo6YVIZnoAedCLNgLG
	JIjYCbqFDA3NfCBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JG+zK6hg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JxW+iZPB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783937395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wi9TKgfqQm9H1D8cpD5/0JpKZ8yNX5N9MzSCe1TjbeQ=;
	b=JG+zK6hgly9EFnthAEQu7RIEa4krnSPDUlNNf1G9XvTwh21JmkpHV4Ae0A3QpRXVtH23bN
	26GFE6przWDuw6dAoWDT3Y+vs7E9WsHYZ/OCm4n8RXRqTwe2kL39/2339FGDznd/lYtu/P
	0Dj7WeWZok/ZkEHyAAbnhrGPw8POEAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783937395;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wi9TKgfqQm9H1D8cpD5/0JpKZ8yNX5N9MzSCe1TjbeQ=;
	b=JxW+iZPBHpGpNHUrJ1r+sr22peU2U1T2dgo4RGqZCdCjpup49PBkPo6YVIZnoAedCLNgLG
	JIjYCbqFDA3NfCBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5F1A779AE;
	Mon, 13 Jul 2026 10:09:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wG8CL3K5VGrhIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Jul 2026 10:09:54 +0000
Date: Mon, 13 Jul 2026 12:09:54 +0200
Message-ID: <87qzl7yzd9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add inverted LED quirk for HP ZBook 8 G2a
In-Reply-To: <20260713020839.3822602-1-chris.chiu@canonical.com>
References: <20260713020839.3822602-1-chris.chiu@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 09477774BD
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
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
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,canonical.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 13 Jul 2026 04:08:39 +0200,
Chris Chiu wrote:
> 
> HP ZBook 8 G2a 14 and 16 (SSIDs 0x103c:0x8f94, 0x103c:0x8f95) use
> Realtek ALC245 codec with TAS2781 amplifier via I2C. These models
> require inverted speaker mute LED handling compared to the existing
> ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED quirk.
> 
> The existing quirk produces opposite LED behavior: when speaker is
> muted, the LED turns off (should be on), and when unmuted, the LED
> turns on (should be off). This patch adds a dedicated quirk that
> properly handles the inverted LED polarity.
> 
> Code flow explanation:
> - With HP pin (hp_pin != 0): Uses standard HDA LED framework via
>   alc245_fixup_hp_mute_led_coefbit() for full control interface
>   support, enabling both manual control and direct hardware updates.
>   
> - Without HP pin (hp_pin == 0, speaker-only laptops): Registers
>   direct vmaster_mute hook (alc245_hp_spk_mute_led_update_inverted)
>   to control LED during mute operations, ensuring LED feedback
>   without headphone jack detection capability.
> 
> Both paths use inverted LED update logic to correct polarity and
> maintain backward compatibility with existing systems.

So there can be multiple models with the same SSID and they have
different hardware configurations?

> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index b26ed9c1f09f..e04b5adce075a 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -3776,6 +3776,15 @@ static void alc245_hp_spk_mute_led_update(void *private_data, int enabled)
>  	alc_update_coef_idx(codec, 0x0b, 0x0c, val);
>  }
>  
> +static void alc245_hp_spk_mute_led_update_inverted(void *private_data, int enabled)
> +{
> +	struct hda_codec *codec = private_data;
> +	unsigned int val;
> +
> +	val = enabled ? 0x04 : 0x08;	/* inverted: 0x04 off, 0x08 on */
> +	alc_update_coef_idx(codec, 0x0b, 0x0c, val);
> +}
> +
>  /* JD2: mute led GPIO3: micmute led */
>  static void alc245_tas2781_i2c_hp_fixup_muteled(struct hda_codec *codec,
>  					 const struct hda_fixup *fix, int action)
> @@ -3804,6 +3813,42 @@ static void alc245_tas2781_i2c_hp_fixup_muteled(struct hda_codec *codec,
>  		alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
>  	alc285_fixup_hp_coef_micmute_led(codec, fix, action);
>  }
> +
> +/* Inverted LED version for HP ZBook 8 G2a models (SSIDs 0x8f94, 0x8f95)
> + * This fixup handles systems where the speaker mute LED polarity is reversed
> +/* Inverted LED quirk for HP ZBook 8 G2a (SSIDs 0x8f94, 0x8f95)

The comment block unbalance, you forgot to close the previous comment
line, or starting a new comment line mistakenly?


thanks,

Takashi

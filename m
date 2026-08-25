Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890AB3D648C
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 07:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644759; cv=none; b=t4/zIPQKOuPkGQ4cyxJI74G8B3iSFBOzwTZX2SB8N5+4nCjWMAivjRHVOaviXxeSs5VA1F8Y9oaexKDCOuSt2B1akGjs7Brmt8VMyAVzMZ2PHKdYJtmkU7WoXApQmfR6n0dmS7zm8evAJt9JrgzyNe+FO1BFqdteDIvwzTfqjdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644759; c=relaxed/simple;
	bh=xWtaWC64IcHuC0Wkm7oh+alVlvSwds1BSDMSukgILW4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lUkb2n2NgvzjZngTRInFOKmNdjbMTUDlSYDD6wvT2VIc6pV8CM1FB9Hih1fgq6w1pv7gJ2fr01JxCyAnbtanHujNkFuoggSoHolG9hH59h3YzdSP8HlI8XnHWPK6Qw9ZTcZL12UM58RIYy3yrahiYmEz2GVyWaQJ5WO6ec6y89s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dzlCQ3Gz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/epkEQOs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vsteqs7j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QtJxQguN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dzlCQ3Gz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/epkEQOs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vsteqs7j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QtJxQguN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 348CC1F78B;
	Tue, 25 Aug 2026 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787644735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09YSDPPs+gAAsXa+RQimZvLD5+OxnKfd8Qhwhzr3pPc=;
	b=dzlCQ3GzVZwBWe4ZGNG9b3CrUQwVP9VhbkalRaZFI61ilfUYW0FZwjxaWf3VUtxvLHVryO
	Ts3XB9aQXI9PG7TQRXRl5sC9KCj4UxbFh/y8qI0F6oLyqb2aCb3l7BghCxk/OCTminT80U
	5QS5VXMmcAu6hEdI2l3E8YpQb5lGr8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787644735;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09YSDPPs+gAAsXa+RQimZvLD5+OxnKfd8Qhwhzr3pPc=;
	b=/epkEQOsWONv69lzDOwTRCo4ntvi2SeAUtjnw9Wlt8m1eczFU47o7b99AU83vKNhdWxEZc
	N0HLBWJ3rMlFO5DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787644731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09YSDPPs+gAAsXa+RQimZvLD5+OxnKfd8Qhwhzr3pPc=;
	b=Vsteqs7jhGnRZHnlMYf0ggDvkYL6cEeldJUdqd0lU4VeKMvYRwdaZrINkCsZJsrizyLwPT
	W3W4D+rVbH4KXOgQj87WV2QjIJ1t5cbVOe29zfSH5+VZ33Z5xNbwRt5ix1f4/DDfkOalHo
	wQh9yH73hRHdk07OzzZaNrqicZWbY5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787644731;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09YSDPPs+gAAsXa+RQimZvLD5+OxnKfd8Qhwhzr3pPc=;
	b=QtJxQguN/BpzfkrR4eTZ1w4wiC4SeeQB1ZUKinJvv7canoToLGt9VPF3r+XAUfF7HJuKY3
	czv/9FhTx9/n+gDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EABF913332;
	Tue, 25 Aug 2026 07:58:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SNjpNjpLjWrHbwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 07:58:50 +0000
Date: Tue, 25 Aug 2026 09:58:50 +0200
Message-ID: <87jypetyv9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Habil_Eren_T=FCrker=22?= <habilerenturker@gmail.com>
Cc: perex@perex.cz,	tiwai@suse.com,	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,	Habil Eren =?ISO-8859-1?Q?T=FCrker?=
 <habilerenturker@hotmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker mute LED for HP Laptop 15-fd0039nt
In-Reply-To: <20260824094256.3758-1-habilerenturker@hotmail.com>
References: <20260824094256.3758-1-habilerenturker@hotmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,hotmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,alsa-project.org,vger.kernel.org,hotmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Mon, 24 Aug 2026 11:42:28 +0200,
Habil Eren Türker wrote:
> 
> HP Laptop 15-fd0039nt (SSID 103c:8bb6) needs a quirk to control the
> speaker mute LED via VREF100 on NID 0x1a (active-high).
> 
> This patch replaces the previous ALC236_FIXUP_HP_MICMUTE_LED_ONLY
> with ALC236_FIXUP_HP_15_FD0XXX, which covers both mic mute (GPIO0)
> and speaker mute (NID 0x1a) LEDs.
> 
> Use spec->no_shutup_pins instead of a custom shutup hook, as suggested
> by Takashi Iwai.
> 
> Fixes: e711ebfadc9a ("ALSA: hda/realtek: Add quirk for HP Laptop 15-fd0039nt")
> Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>
> Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 51 ++++++++++++++++++++++++++-----
>  1 file changed, 43 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 01b87267f..a2a3341c3 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -1364,14 +1364,49 @@ static void alc269_fixup_hp_gpio_led(struct hda_codec *codec,
>  	alc_fixup_hp_gpio_led(codec, action, 0x08, 0x10);
>  }
>  
> -static void alc236_fixup_hp_micmute_led_only(struct hda_codec *codec,
> -				const struct hda_fixup *fix, int action)
> +/* Patch for HP 15-fd0xxx (8BB6) Speaker Mute LED & Mic-Mute LED */
> +
> +static unsigned int hp_8bb6_power_filter(struct hda_codec *codec,
> +					  hda_nid_t nid,
> +					  unsigned int power_state)
> +{
> +	if (nid == 0x1a)
> +		return AC_PWRST_D0;
> +	return snd_hda_gen_path_power_filter(codec, nid, power_state);
> +}

Better to give a bit more comment about this power filter, as it's not
clear why keeping the power of NID 0x1a.

Also, the patch contained trailing whitespaces.
Please run scripts/checkpatch.pl before resubmission.


thanks,

Takashi

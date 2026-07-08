Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A667D425CCB
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508022; cv=none; b=GzhyXCWkyzfGD5Bwikp6LZ3jvGCIpxqiEZCyD0YeG8RXJnbiKPvoxZItxh7OY7iO37LSt3G59Ro9Xabv5xnp4WtbPLALccIF0bBpRV7cuu4hxd/nZSo3anJCB5/XvvYakC9+fiuTyBpT0omHb9trdc1SAai7FXJrBnTQBKkOIS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508022; c=relaxed/simple;
	bh=5a4Qi6a20+GQAaCQOXVZHjvkWOlGcsFACsIiG4x0/08=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pd3Dg2IkBVSoSD5uyuZAclej5fe+US6hlCmTHgcFoY6VL15TaZs2n+vmbagtay2nb6cPgR1AYLEFswuJRFHHtmcP6CQlVZ6lZVX/lpk+EAICaLg89mWdGS0S1Vm2ZaLASplWMsqhA33+cz0KrRCivxRViD2eI7MUZdCPqXKHoB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ncg1r5sp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ecExEJvN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ncg1r5sp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ecExEJvN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ncg1r5sp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ecExEJvN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ncg1r5sp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ecExEJvN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2513C75BDE;
	Wed,  8 Jul 2026 10:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783508012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Mo2ROlzvN4eiDFOF5qovOCFDMg3RTfdr/zV03psFUU=;
	b=ncg1r5spNGFQTmcWereL1HBKwSuZ+C3a6qTwKTvAcR7DIAtLHgpfJiWz2/L+stEYo302TZ
	L2rIvbr5Y906gKo4kK0Nwb25Tg6PDwEGdRxngMSWi3CnUanP7inaI0drB1nThUFQs/C34K
	+Pmdka10yXdDujEVNFjqM/LM3sXrSHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783508012;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Mo2ROlzvN4eiDFOF5qovOCFDMg3RTfdr/zV03psFUU=;
	b=ecExEJvNHO6cl2LHS3Wll1im7/QZdoLu4cOBGcgOREWNbDvV8wZU/AN90nd7NaZBQEpwWZ
	5H/w6+K4gr6hEnBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783508012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Mo2ROlzvN4eiDFOF5qovOCFDMg3RTfdr/zV03psFUU=;
	b=ncg1r5spNGFQTmcWereL1HBKwSuZ+C3a6qTwKTvAcR7DIAtLHgpfJiWz2/L+stEYo302TZ
	L2rIvbr5Y906gKo4kK0Nwb25Tg6PDwEGdRxngMSWi3CnUanP7inaI0drB1nThUFQs/C34K
	+Pmdka10yXdDujEVNFjqM/LM3sXrSHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783508012;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Mo2ROlzvN4eiDFOF5qovOCFDMg3RTfdr/zV03psFUU=;
	b=ecExEJvNHO6cl2LHS3Wll1im7/QZdoLu4cOBGcgOREWNbDvV8wZU/AN90nd7NaZBQEpwWZ
	5H/w6+K4gr6hEnBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA5EA779AE;
	Wed,  8 Jul 2026 10:53:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uVhzNCssTmpzKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Jul 2026 10:53:31 +0000
Date: Wed, 08 Jul 2026 12:53:31 +0200
Message-ID: <87v7ap4us4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add inverted LED quirk for HP ZBook 8 G2a
In-Reply-To: <20260708024757.2400766-1-chris.chiu@canonical.com>
References: <20260708024757.2400766-1-chris.chiu@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Wed, 08 Jul 2026 04:47:57 +0200,
Chris Chiu wrote:
> 
> HP ZBook 8 G2a 14 and 16 (SSIDs 0x103c:0x8f94 and 0x103c:0x8f95)
> require special handling for the speaker mute LED with inverted
> behavior compared to the existing ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED.
> 
> Add a new dedicated quirk ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED
> to address the inverted speaker mute led issue. This ensures the LED
> behaves correctly on the new HP ZBook models.
> 
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 44 +++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index b26ed9c1f09f..07f5adce075a 100644
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
> +	val = enabled ? 0x04 : 0x08; /* inverted: 0x04 led off, 0x08 led on */
> +	alc_update_coef_idx(codec, 0x0b, 0x0c, val);
> +}
> +
>  /* JD2: mute led GPIO3: micmute led */
>  static void alc245_tas2781_i2c_hp_fixup_muteled(struct hda_codec *codec,
>  					  const struct hda_fixup *fix, int action)
> @@ -3804,6 +3813,34 @@ static void alc245_tas2781_i2c_hp_fixup_muteled(struct hda_codec *codec,
>  		alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
>  	alc285_fixup_hp_coef_micmute_led(codec, fix, action);
>  }
> +
> +static void alc245_tas2781_i2c_hp_fixup_muteled_inverted(struct hda_codec *codec,
> +const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	hda_nid_t hp_pin = alc_get_hp_pin(spec);
> +	static const hda_nid_t conn[] = { 0x02 };
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		if (!hp_pin) {
> +			spec->gen.vmaster_mute.hook = alc245_hp_spk_mute_led_update_inverted;
> +			spec->gen.vmaster_mute_led = 1;
> +		}

Is there a case without HP pin at all?  Those are laptops, right?

> +		spec->gen.auto_mute_via_amp = 1;
> +		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
> +		break;
> +	case HDA_FIXUP_ACT_INIT:
> +		if (!hp_pin)
> +			alc245_hp_spk_mute_led_update_inverted(codec, !spec->gen.master_mute);
> +		break;
> +	}
> +
> +	tas2781_fixup_txnw_i2c(codec, fix, action);
> +	if (hp_pin)
> +		alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
> +	alc285_fixup_hp_coef_micmute_led(codec, fix, action);

Hmm, the code flow depends on hp_pin, and it isn't explained why you
have to do it in that way.  Please give either more comment or
description to understand better your changes.


thanks,

Takashi

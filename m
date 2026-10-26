Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001552;
	b=ahGB5DxLgk+r2uKL6YQCBRCuGJu2G3aQmzwVEMNY75f3lLUoSZ0G8g+SNHm7fgPKToDS
	 sooJoy1hIJ6JtW0uOH+HRuMFmIogY0qqghoyXU+toL7kHVUAH37G8KQeva/zl2eJnMNCH
	 pm8RhQ2FyRX4qOYYQigU3JuXHgoe4XWc05l+LFf+CzIFG3qLkeqYgDqiMTRhleG0xiD94
	 GLgA+X8SJ+pR2JBvi7T7ncZgFF10YzHHMPcCCdFAnDbjqiKpIPKGysnQnXG6Obm/ahXbZ
	 coJPcVP3ZZzo5DXLfiyMJftgn25DRsuJMMwE82qqLzEP5QBBJzBzovzMsUWp9e7KI9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001552;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=AXZdh7Ax0/H01mBJZCzn/iPzbLM18Y56a056zyYuzgQ=;
	b=hLI50zEMP18IkerW7912hSyZSKCkKunvSbkO0WnJzzQL0Y9uBHFSU9FkIODTWQGuw0s8
	 ixYBntBi+g4C5RaljsU3VaSls/cGNytRaw/lC9b9KX6IEi2bLWqsM/yTBhCxJ+SeA3y7i
	 FSF6QkjZ/fv3WR6d8eUW3EEGDvlM7UedH5nBHtND6H/9ZnXav30Hvd4gUSW6txGcWLSCh
	 sZiEcxo6TWWNQTwkvzZ5ZhiDBTecXUzLF67MI9slZM0tDfeErPeVObiVb7fLB5+btS4+G
	 Iyih0aq8qCA0PYpJQU5RwQL1ZANyyDYFt5CCaf9fRWd+P90cwfps9whe/jygtTSyFyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bm5nS1JY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lW8cmBEn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bm5nS1JY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lW8cmBEn;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F2B606A31A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 07:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71F2B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bm5nS1JY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lW8cmBEn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bm5nS1JY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lW8cmBEn
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4C7E122317;
	Mon, 26 Oct 2026 07:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793001549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AXZdh7Ax0/H01mBJZCzn/iPzbLM18Y56a056zyYuzgQ=;
	b=bm5nS1JYc3+II53X9UDRicJtctt1ngLj1F1JjDXWgzxwjQNC4MySxAShS6hF8Mewd1AY0t
	DzCNAtKTGCQMUbe8AOItnbqp5g0XbKE0LvJ0U7XDyyLJMVE6nl+/0yrM9i81iQZ4VXAvXu
	3oBo3b02++Qephe6NcYwMO9WtN8o8hg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793001549;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AXZdh7Ax0/H01mBJZCzn/iPzbLM18Y56a056zyYuzgQ=;
	b=lW8cmBEnap8Xv0q6sy0ZnaTfcwDx289Ye96iF3Bh1zheuRWEdxA7jMYj3xviCDisr2CugW
	y2CoMkhgnbDxreCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793001549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AXZdh7Ax0/H01mBJZCzn/iPzbLM18Y56a056zyYuzgQ=;
	b=bm5nS1JYc3+II53X9UDRicJtctt1ngLj1F1JjDXWgzxwjQNC4MySxAShS6hF8Mewd1AY0t
	DzCNAtKTGCQMUbe8AOItnbqp5g0XbKE0LvJ0U7XDyyLJMVE6nl+/0yrM9i81iQZ4VXAvXu
	3oBo3b02++Qephe6NcYwMO9WtN8o8hg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793001549;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AXZdh7Ax0/H01mBJZCzn/iPzbLM18Y56a056zyYuzgQ=;
	b=lW8cmBEnap8Xv0q6sy0ZnaTfcwDx289Ye96iF3Bh1zheuRWEdxA7jMYj3xviCDisr2CugW
	y2CoMkhgnbDxreCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B10313319;
	Mon, 26 Oct 2026 07:59:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p0HvNEwI32rOGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 Oct 2026 07:59:09 +0000
Date: Mon, 26 Oct 2026 08:59:08 +0100
Message-ID: <87y0bk6gfn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: root <davide.gironi@gmail.com>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ASoC: ice1712: add TerraTec PHASE 88 support
In-Reply-To: <20261024112700.3634-1-root@debian.lab.local>
References: <20261024112700.3634-1-root@debian.lab.local>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80

On Sat, 24 Oct 2026 13:27:00 +0200,
root wrote:
> 
> From: Davide Gironi <davide.gironi@gmail.com>
> 
> Add board-specific handling for the TerraTec PHASE 88, which shares an
> EWS88MT device ID but uses different external hardware.
> 
> Use the write-only expander at 0x42 for AK4524 chip selection, initialize
> its second register, and add the measured Line/Mic 7/8 control. Correct the
> EEPROM-reported AC'97 codec and MIDI UART configuration, and guard consumer
> capture open when AC'97 initialization failed.
> 
> Tested on two PHASE 88 racks with kernel 6.18.55; built against Debian
> 6.12.111. The patch applies to 6.18.58.
> 
> Assisted-by: Pi:gpt-6-luna
> Signed-off-by: Davide Gironi <davide.gironi@gmail.com>

The Subject prefix should be "ALSA:" instead of "ASoC:" :)
About the code changes: mostly it looks OK, just some nitpicking.

> +/*
> + * PHASE 88: Line/Mic select of the four analog input pairs
> + *
> + * The Terratec mixers of the original operating systems offer a "Line/Mic
> + * 1/2 ... 7/8" switch for every pair of the AK4524 codecs; the setting is
> + * kept in the second register of the chip select expander.
> + *
> + * With a microphone on input 7 the level of that pair rises by roughly
> + * 30 dB when bit 4 (0x10) of this register is set, while bits 5 ... 7 do
> + * not change anything that could be measured on the other pairs - only the
> + * pair with the microphone attached could be verified.  The register is
> + * write-only, so the bits are assumed to be ordered from the last pair to
> + * the first one: 0x10 selects the microphone of pair 7/8, 0x80 the one of
> + * pair 1/2.
> + */
> +static int snd_ice1712_phase88_linemic_info(struct snd_kcontrol *kcontrol,
> +					    struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
> +	uinfo->count = 1;
> +	uinfo->value.integer.min = 0;
> +	uinfo->value.integer.max = 1;
> +	return 0;
> +}

This can be replaced with snd_ctl_boolean_mono_info; i.e. pass
snd_ctl_boolean_mono_info to ".info = ..." below.


> @@ -458,9 +578,37 @@ static int snd_ice1712_ews_init(struct snd_ice1712 *ice)
>  		}
>  		snd_ice1712_6fire_write_pca(ice, PCF9554_REG_CONFIG, 0x80);
>  		break;
> +	case ICE1712_SUBDEVICE_PHASE88:
> +		err = snd_i2c_device_create(ice->i2c, "CS8404",
> +					    ICE1712_EWS88MT_CS8404_ADDR,
> +					    &spec->i2cdevs[EWS_I2C_CS8404]);
> +		if (err < 0)
> +			return err;
> +		err = snd_i2c_device_create(ice->i2c, "Output expander",
> +					    ICE1712_PHASE88_OUTPUT_ADDR,
> +					    &spec->i2cdevs[EWS_I2C_PCF2]);
> +		if (err < 0)
> +			return err;
> +	spec->pcf8575_data = ICE1712_PHASE88_OUTPUT_INIT;

The wrong indent level?

> diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
> index 376df1a..86ecf7b 100644
> --- a/sound/pci/ice1712/ice1712.c
> +++ b/sound/pci/ice1712/ice1712.c
> @@ -768,6 +768,9 @@ static int snd_ice1712_capture_open(struct snd_pcm_substream *substream)
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct snd_ice1712 *ice = snd_pcm_substream_chip(substream);
>  
> +	if (!ice->ac97)
> +		return -ENODEV;

It's suboptimal to do it.
The problem is likely because your model doesn't override the EEPROM
content before creating the PCM streams where the consumer PCM streams
are skipped when AC97 is not present via ice_has_con_ac7() check.

That is...

>  	ice->capture_con_substream = substream;
>  	runtime->hw = snd_ice1712_capture;
>  	runtime->hw.rates = ice->ac97->rates[AC97_RATES_ADC];
> @@ -2290,12 +2293,45 @@ static int snd_ice1712_chip_init(struct snd_ice1712 *ice)
>  	outb(ICE1712_NATIVE, ICEREG(ice, CONTROL));
>  	udelay(200);
>  	if (ice->eeprom.subvendor == ICE1712_SUBDEVICE_DMX6FIRE &&
> -	    !ice->dxr_enable)
> +	    !ice->dxr_enable) {
>  		/*  Set eeprom value to limit active ADCs and DACs to 6;
>  		 *  Also disable AC97 as no hardware in standard 6fire card/box
>  		 *  Note: DXR extensions are not currently supported
>  		 */
>  		ice->eeprom.data[ICE_EEP1_CODEC] = 0x3a;
> +	} else if (ice->eeprom.subvendor == ICE1712_SUBDEVICE_PHASE88) {
> +		/*
> +		 * The EEPROM of the PHASE 88 advertises a consumer AC'97
> +		 * codec, but the board does not carry one - the AC'97 link
> +		 * does not answer even after a cold reset (every register
> +		 * reads back as 0xffff).  All converters of this card are the
> +		 * AKM codecs on the multitrack I2S interface, and the original
> +		 * Terratec driver does not touch the AC'97 link either.
> +		 * Without this quirk the probe wastes two seconds in the
> +		 * AC'97 reset and creates consumer PCM devices that have no
> +		 * codec behind them.
> +		 */
> +		ice->eeprom.data[ICE_EEP1_CODEC] |= ICE1712_CFG_NO_CON_AC97;
> +		/*
> +		 * The rack has two MIDI interfaces - one on the front panel, one
> +		 * on the rear - but the EEPROM advertises only one UART, so
> +		 * without this the rear connector stays dead.  Terratec's own
> +		 * driver exposes both: "[PHASE88.Interface.Midi1]" and
> +		 * "[PHASE88.Interface.Midi2]" in ews88wdm.inf, "PHASE88 MIDI Port
> +		 * 1/2", the changelog naming the second one "Mic28 Extensions
> +		 * (Midi 2)".  Both UARTs are inside the Envy24, so claiming the
> +		 * second one is only a matter of setting the bit the EEPROM
> +		 * should have carried.
> +		 *
> +		 * Verified on a PHASE 88 rack: with a loopback cable in the rear
> +		 * connector, a SysEx frame written to the second UART came back
> +		 * on it byte-exactly, and the first UART (front connector) kept
> +		 * working as before.  With the second UART enabled and both ports
> +		 * idle the card raised no interrupt on its IRQ line for 10 s,
> +		 * so an unconnected input does not generate traffic.
> +		 */
> +		ice->eeprom.data[ICE_EEP1_CODEC] |= ICE1712_CFG_2xMPU401;
> +	}

... we should add eeprom_init() to snd_ice1712_card_info() and move
the model-specific code to each file, instead, then EEPROM setup could
be done initially at snd_ice1712_create().  This move should be done
as a preliminary patch, though.


thanks,

Takashi

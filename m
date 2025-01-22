Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74F188721
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737535317; cv=none; b=rpw+3YPeWefQFZny6Cb1SYlfdTQli0glcdZrQL4zUpD3c3PIGVB+qEmhog1UcHNVJpgXMr3IpsZLI6pT4OnEI7p2lw5BZ3arf+oPJlsviQj00wF7nTnr3Bwad0Q1U/p7yNq4VRnuT1THR6z5hRIXTGOTwLuAwJM0/pUQOWUiMNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737535317; c=relaxed/simple;
	bh=19BblTQBsZVghYCMwhVktwNkWBQu/qQ+s75ADmUnoNo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxfqZ04MNWPlt6Z4D3ISWmnTBPhtfEp35pEan8GCkqM2abWuWtZW8RvzBpFbSo6FJTEuaw1H3GgW2GTO+Vm+dKrGifTWTuLx0ocqTWB8/CelXiKteFXp7SP/ktez6tW5Tljq0xIlQUB8FUUd6DA0Be4Hvj+V4bu76V8Gn1j3iAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QSJIB4F2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ergl424S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QSJIB4F2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ergl424S; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QSJIB4F2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ergl424S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QSJIB4F2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ergl424S"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6DF272124C;
	Wed, 22 Jan 2025 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737535313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlXvqKC09c8rYis2koUgFjH69NFiksHVA1NlvRgnEQo=;
	b=QSJIB4F2P6WEp7xWdRGE20gZZgSs1KN9sD72zWDk5ZDw1V3XlLe+Q8KdMhOXz5wKGKqfOg
	0VrxIQm7HqYkXGoWdUrygZVPA771pWASPDYi53u8dtv1xSl8HLZJVzBKz0/K4YQMNEFXCB
	DsSN9pobpzGZ3p27IlLxcULzPpzVLP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737535313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlXvqKC09c8rYis2koUgFjH69NFiksHVA1NlvRgnEQo=;
	b=ergl424S0wqpHI09/vET7WAQIahdXL1OIQXhFYB8HrxgEjfoBsR5cGcTAJVfw0vNulc3Av
	bc/CAD4RyXSzksAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QSJIB4F2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ergl424S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737535313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlXvqKC09c8rYis2koUgFjH69NFiksHVA1NlvRgnEQo=;
	b=QSJIB4F2P6WEp7xWdRGE20gZZgSs1KN9sD72zWDk5ZDw1V3XlLe+Q8KdMhOXz5wKGKqfOg
	0VrxIQm7HqYkXGoWdUrygZVPA771pWASPDYi53u8dtv1xSl8HLZJVzBKz0/K4YQMNEFXCB
	DsSN9pobpzGZ3p27IlLxcULzPpzVLP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737535313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlXvqKC09c8rYis2koUgFjH69NFiksHVA1NlvRgnEQo=;
	b=ergl424S0wqpHI09/vET7WAQIahdXL1OIQXhFYB8HrxgEjfoBsR5cGcTAJVfw0vNulc3Av
	bc/CAD4RyXSzksAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D8C4136A1;
	Wed, 22 Jan 2025 08:41:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b+ibEVGvkGfKZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 Jan 2025 08:41:53 +0000
Date: Wed, 22 Jan 2025 09:41:52 +0100
Message-ID: <871pwv8ckv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org
Subject: Re: [bug report] ALSA: hda/tas2781: Add tas2781 hda SPI driver
In-Reply-To: <ae5fcd48-58ac-49a8-a434-5f779bad0fb7@stanley.mountain>
References: <ae5fcd48-58ac-49a8-a434-5f779bad0fb7@stanley.mountain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 6DF272124C
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 22 Jan 2025 07:22:17 +0100,
Dan Carpenter wrote:
> 
> Hello Baojun Xu,
> 
> Commit bb5f86ea50ff ("ALSA: hda/tas2781: Add tas2781 hda SPI driver")
> from Dec 16, 2024 (linux-next), leads to the following Smatch static
> checker warning:
> 
> 	sound/pci/hda/tas2781_hda_spi.c:1107 tas2781_hda_spi_probe()
> 	warn: missing error code here? 'devm_kzalloc()' failed. 'ret' = '0'
> 
> sound/pci/hda/tas2781_hda_spi.c
>     1092 static int tas2781_hda_spi_probe(struct spi_device *spi)
>     1093 {
>     1094         struct tasdevice_priv *tas_priv;
>     1095         struct tas2781_hda *tas_hda;
>     1096         const char *device_name;
>     1097         int ret = 0;
>     1098 
>     1099         tas_hda = devm_kzalloc(&spi->dev, sizeof(*tas_hda), GFP_KERNEL);
>     1100         if (!tas_hda)
>     1101                 return -ENOMEM;
>     1102 
>     1103         spi->max_speed_hz = TAS2781_SPI_MAX_FREQ;
>     1104 
>     1105         tas_priv = devm_kzalloc(&spi->dev, sizeof(*tas_priv), GFP_KERNEL);
>     1106         if (!tas_priv)
> --> 1107                 goto err;
> 
> No error code.
> 
>     1108         tas_priv->dev = &spi->dev;
>     1109         tas_hda->priv = tas_priv;
>     1110         tas_priv->regmap = devm_regmap_init_spi(spi, &tasdevice_regmap);
>     1111         if (IS_ERR(tas_priv->regmap)) {
>     1112                 ret = PTR_ERR(tas_priv->regmap);
>     1113                 dev_err(tas_priv->dev, "Failed to allocate regmap: %d\n",
>     1114                         ret);
>     1115                 goto err;
>     1116         }
>     1117         if (strstr(dev_name(&spi->dev), "TXNW2781")) {
>     1118                 device_name = "TXNW2781";
>     1119                 tas_priv->save_calibration = tas2781_save_calibration;
>     1120                 tas_priv->apply_calibration = tas2781_apply_calib;
>     1121         } else {
>     1122                 goto err;
>     1123         }
>     1124 
>     1125         tas_priv->irq = spi->irq;
>     1126         dev_set_drvdata(&spi->dev, tas_hda);
>     1127         ret = tas2781_read_acpi(tas_hda, device_name,
>     1128                                 spi_get_chipselect(spi, 0));
>     1129         if (ret)
>     1130                 return dev_err_probe(tas_priv->dev, ret,
>     1131                                      "Platform not supported\n");
> 
> Should this be a goto err?
> 
>     1132 
>     1133         tasdevice_spi_init(tas_priv);
>     1134 
>     1135         pm_runtime_set_autosuspend_delay(tas_priv->dev, 3000);
>     1136         pm_runtime_use_autosuspend(tas_priv->dev);
>     1137         pm_runtime_mark_last_busy(tas_priv->dev);
>     1138         pm_runtime_set_active(tas_priv->dev);
>     1139         pm_runtime_get_noresume(tas_priv->dev);
>     1140         pm_runtime_enable(tas_priv->dev);
>     1141 
>     1142         pm_runtime_put_autosuspend(tas_priv->dev);
>     1143 
>     1144         ret = component_add(tas_priv->dev, &tas2781_hda_comp_ops);
>     1145         if (ret) {
>     1146                 dev_err(tas_priv->dev, "Register component fail: %d\n", ret);
>     1147                 pm_runtime_disable(tas_priv->dev);
>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Duplicates the cleanup done in tas2781_hda_remove().
> 
>     1148         }
>     1149 
>     1150 err:
>     1151         if (ret)
>     1152                 tas2781_hda_remove(&spi->dev);
> 
> This error handling doesn't work.  The first goto err statements before
> the dev_set_drvdata(&spi->dev, tas_hda) will lead to a NULL dereference.
> That kind of thing is typical for this style of error handling.  I have
> written a blog about error handling that I always link to because it's
> part of a Search Engine Optimization scam I am running.
> 
> https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/
> 
>     1153 
>     1154         return ret;
>     1155 }

Indeed those error handlings with "goto err" are all bogus --
basically all above should just return immediately.  And, the runtime
PM enablement and the component_add() call should be swapped.  Then it
can return immediately as well, and we can drop the call of
tas2781_hda_remove() from there.
Last but not least, the unmatched spi device name must be handled as a
proper error, too.

I'm going to submit a fix patch.


thanks,

Takashi

Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F223D413F
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 06:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009384; cv=none; b=RxQ7ad7FJ17ccdto1XemnYQRnPKf+pUdc5eA80rJLyUAAxqjmx7PFE6xffZ4vBiwbfLKbrSzEtTzxilh4lqIv6cJTUwcEMZ3iM2SgRAJmFMsqeGXZNjQUTqCIYT7pAqb/mwYevvhlsYCM4jfx3g1bb3F1n+j2xRyV6dqf7bz/2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009384; c=relaxed/simple;
	bh=a85EeJ40ZOE7YbMSLUUmEgSF4NsNuFFtKQUNkqFzum8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fQ/91boEb4kpbAs60lxGejSLdBkMN1Iu8u/q8mftk6X4+OYtCFjG80dx9a7XHl0KpAWtSqaNKg8gujCbVxnpmoRdpTeWU+pZp8oTJGEu2p5Sc4vJNCxX5gczaYgwqxbq7fmtZvQ8HRXyv3FTG+8iggeQGWF1UjpzUYTWzTsnWJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Lqy0DpTc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vvBw1V3U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Lqy0DpTc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vvBw1V3U; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lqy0DpTc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vvBw1V3U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lqy0DpTc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vvBw1V3U"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1EFB73E24;
	Tue, 14 Jul 2026 06:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784009381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Clc7DK9WXxvjwE9xbT+lWHrygHld2I2ne84I3e9m0lI=;
	b=Lqy0DpTcVfREP8TRI1Lv5vHiPQEyv0UX07L6WZggKVLgdOmixcdOUz13OACXyRhktkSIIn
	j0q0F3f8dvuncifhXnXeV6CrzOBoFXrFgQ8ISsBAu4PVfAC+xTXwBg3Z7GzhvBepj2wTPF
	nSJu9Ev8VBv2QzdTAt8J1KGf724G26Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784009381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Clc7DK9WXxvjwE9xbT+lWHrygHld2I2ne84I3e9m0lI=;
	b=vvBw1V3UTHxn2B1vgBQNTjiOjLu3VebWnFaZi4I3dB9MYTisJWuj2bXxofclsQguJWSU2R
	U7voHDsb8V34dJDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784009381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Clc7DK9WXxvjwE9xbT+lWHrygHld2I2ne84I3e9m0lI=;
	b=Lqy0DpTcVfREP8TRI1Lv5vHiPQEyv0UX07L6WZggKVLgdOmixcdOUz13OACXyRhktkSIIn
	j0q0F3f8dvuncifhXnXeV6CrzOBoFXrFgQ8ISsBAu4PVfAC+xTXwBg3Z7GzhvBepj2wTPF
	nSJu9Ev8VBv2QzdTAt8J1KGf724G26Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784009381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Clc7DK9WXxvjwE9xbT+lWHrygHld2I2ne84I3e9m0lI=;
	b=vvBw1V3UTHxn2B1vgBQNTjiOjLu3VebWnFaZi4I3dB9MYTisJWuj2bXxofclsQguJWSU2R
	U7voHDsb8V34dJDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E74D6779AE;
	Tue, 14 Jul 2026 06:09:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5wZLN6TSVWqWJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jul 2026 06:09:40 +0000
Date: Tue, 14 Jul 2026 08:09:40 +0200
Message-ID: <87mrvuje57.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: tiwai@suse.com,
	david.rhodes@cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH v2 2/3] ALSA: hda/cs35l56: Use scoped_guard() for irq_lock in cs35l56_hda_fw_load()
In-Reply-To: <20260710084009.665814-3-wangdich9700@163.com>
References: <20260710084009.665814-1-wangdich9700@163.com>
	<20260710084009.665814-3-wangdich9700@163.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Fri, 10 Jul 2026 10:40:08 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Replace the manual mutex_lock/mutex_unlock of irq_lock with
> scoped_guard(). This lets the compiler guarantee the lock is
> released on all exit paths, eliminating the err label that
> previously existed only to reach the unlock call.

The combination of gotos in different scopes have risks, so I'm not
thrilled by this change.  As you noticed, the locking scheme there is
complex, hence just replacing with guard() doesn't improve the
readability well.  If any, better to re-design the code and locking.


thanks,

Takashi

> 
> No functional changes.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
>  sound/hda/codecs/side-codecs/cs35l56_hda.c | 104 ++++++++++-----------
>  1 file changed, 51 insertions(+), 53 deletions(-)
> 
> diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> index a0ea08eb96a9..4f74397ea06f 100644
> --- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
> +++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> @@ -625,74 +625,72 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
>  		goto err_fw_release;
>  	}
>  
> -	mutex_lock(&cs35l56->base.irq_lock);
> +	scoped_guard(mutex, &cs35l56->base.irq_lock) {
> +		/*
> +		 * If the firmware hasn't been patched it must be shutdown before
> +		 * doing a full patch and reset afterwards. If it is already
> +		 * running a patched version the firmware files only contain
> +		 * tunings and we can use the lower cost reinit sequence instead.
> +		 */
> +		if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
> +			ret = cs35l56_firmware_shutdown(&cs35l56->base);
> +			if (ret)
> +				goto err_powered_up;
> +		}
>  
> -	/*
> -	 * If the firmware hasn't been patched it must be shutdown before
> -	 * doing a full patch and reset afterwards. If it is already
> -	 * running a patched version the firmware files only contain
> -	 * tunings and we can use the lower cost reinit sequence instead.
> -	 */
> -	if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
> -		ret = cs35l56_firmware_shutdown(&cs35l56->base);
> -		if (ret)
> -			goto err;
> -	}
> +		ret = cs_dsp_power_up(&cs35l56->cs_dsp, wmfw_firmware, wmfw_filename,
> +				      coeff_firmware, coeff_filename, "misc");
> +		if (ret) {
> +			dev_dbg(cs35l56->base.dev, "%s: cs_dsp_power_up ret %d\n", __func__, ret);
> +			goto err_powered_up;
> +		}
>  
> -	ret = cs_dsp_power_up(&cs35l56->cs_dsp, wmfw_firmware, wmfw_filename,
> -			      coeff_firmware, coeff_filename, "misc");
> -	if (ret) {
> -		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_power_up ret %d\n", __func__, ret);
> -		goto err;
> -	}
> +		if (wmfw_filename)
> +			dev_dbg(cs35l56->base.dev, "Loaded WMFW Firmware: %s\n", wmfw_filename);
> +
> +		if (coeff_filename)
> +			dev_dbg(cs35l56->base.dev, "Loaded Coefficients: %s\n", coeff_filename);
>  
> -	if (wmfw_filename)
> -		dev_dbg(cs35l56->base.dev, "Loaded WMFW Firmware: %s\n", wmfw_filename);
> +		/* If we downloaded firmware, reset the device and wait for it to boot */
> +		if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
> +			cs35l56_system_reset(&cs35l56->base, false);
> +			regcache_mark_dirty(cs35l56->base.regmap);
> +			ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
> +			if (ret)
> +				goto err_powered_up;
>  
> -	if (coeff_filename)
> -		dev_dbg(cs35l56->base.dev, "Loaded Coefficients: %s\n", coeff_filename);
> +			regcache_cache_only(cs35l56->base.regmap, false);
> +		}
>  
> -	/* If we downloaded firmware, reset the device and wait for it to boot */
> -	if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
> -		cs35l56_system_reset(&cs35l56->base, false);
> -		regcache_mark_dirty(cs35l56->base.regmap);
> -		ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
> +		/* Disable auto-hibernate so that runtime_pm has control */
> +		ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
>  		if (ret)
>  			goto err_powered_up;
>  
> -		regcache_cache_only(cs35l56->base.regmap, false);
> -	}
> +		regcache_sync(cs35l56->base.regmap);
>  
> -	/* Disable auto-hibernate so that runtime_pm has control */
> -	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
> -	if (ret)
> -		goto err_powered_up;
> -
> -	regcache_sync(cs35l56->base.regmap);
> -
> -	regmap_clear_bits(cs35l56->base.regmap,
> -			  cs35l56->base.fw_reg->prot_sts,
> -			  CS35L56_FIRMWARE_MISSING);
> -	cs35l56->base.fw_patched = true;
> +		regmap_clear_bits(cs35l56->base.regmap,
> +				  cs35l56->base.fw_reg->prot_sts,
> +				  CS35L56_FIRMWARE_MISSING);
> +		cs35l56->base.fw_patched = true;
>  
> -	ret = cs_dsp_run(&cs35l56->cs_dsp);
> -	if (ret)
> -		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_run ret %d\n", __func__, ret);
> +		ret = cs_dsp_run(&cs35l56->cs_dsp);
> +		if (ret)
> +			dev_dbg(cs35l56->base.dev, "%s: cs_dsp_run ret %d\n", __func__, ret);
>  
> -	/* Don't need to check return code, it's not fatal if this fails */
> -	cs35l56_hda_apply_calibration(cs35l56);
> +		/* Don't need to check return code, it's not fatal if this fails */
> +		cs35l56_hda_apply_calibration(cs35l56);
>  
> -	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
> -	if (ret)
> -		cs_dsp_stop(&cs35l56->cs_dsp);
> +		ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
> +		if (ret)
> +			cs_dsp_stop(&cs35l56->cs_dsp);
>  
> -	cs35l56_log_tuning(&cs35l56->base, &cs35l56->cs_dsp);
> +		cs35l56_log_tuning(&cs35l56->base, &cs35l56->cs_dsp);
>  
>  err_powered_up:
> -	if (!cs35l56->base.fw_patched)
> -		cs_dsp_power_down(&cs35l56->cs_dsp);
> -err:
> -	mutex_unlock(&cs35l56->base.irq_lock);
> +		if (!cs35l56->base.fw_patched)
> +			cs_dsp_power_down(&cs35l56->cs_dsp);
> +	}
>  err_fw_release:
>  	cs35l56_hda_release_firmware_files(wmfw_firmware, wmfw_filename,
>  					   coeff_firmware, coeff_filename);
> -- 
> 2.25.1
> 

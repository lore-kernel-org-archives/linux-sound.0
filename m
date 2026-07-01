Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA593EEAD0
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 10:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900207; cv=none; b=kRkvj4kWXCv3oFfJCtLqX09u4fmz1hgC9npQkg3xb4cIGnarP+fWZHgQM5J7sIJQODE0iV1SYnipHZ9GJ23zUeYBh/CliU8FBycO553EXH67f/sYfVt65JFX5kZozqNUVoZAgEpAnDiKqJMSAdEY3Bb7SO7juj+GPtOE07/pRv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900207; c=relaxed/simple;
	bh=oR9PMCifHmYzIvF1f/TeSoP6QtSM378Nlq0Xd4jrnl8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H4xm0EnD45FhrgvaTdIzxUGfS9ODQQwaN4weCOcQj4TUl17mSiZnMxh2Cgmh4CC3+xlNLZThRAeWYsZtIj5+1nHYs9OQWC1vqLcwH/wDhVtnuAoNld+8jFTCI90Iw0spZZjtmM1uYI6hFV5ud6HHkuJmN3zJXVwptPT4nLtlgsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JubSgTko; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nyPcNsLH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W8uUJi2I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=01PxVXRh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JubSgTko";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nyPcNsLH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W8uUJi2I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="01PxVXRh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C5F6C75F59;
	Wed,  1 Jul 2026 10:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782900203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=le31d2tbOy5TJIvSiv+6y6dMNVk5perAPFF83mCDD1Q=;
	b=JubSgTko0bICHgO8TZ4PR1A3mLWT87/E/UBqEPg2xmkYrfYrH0UD4UlR5h1n4lWHAfF41y
	4J+Tii4ZQlzXsJ51wbgdeqY2sw+tw5kRYoAMUVKJ0gXqRJJH1yourTKIiytScVVyAnsCAI
	Ez6ORcqeSly6OsloSZnQwwY3U3jMQzw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782900203;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=le31d2tbOy5TJIvSiv+6y6dMNVk5perAPFF83mCDD1Q=;
	b=nyPcNsLHpT9N1z82DTx58cD79GvLQxkqpm/9i67YwPpMxXb3xLBJUUH2nSmXZvjGnXs66k
	H7KRHc6zkPpZjXCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782900202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=le31d2tbOy5TJIvSiv+6y6dMNVk5perAPFF83mCDD1Q=;
	b=W8uUJi2IY10NtB42LYjSZyXj+dHGKkxXmPC7KPzg5a1c2PdAX1cHQVNks5hYN0/Ry00YKA
	UCcrJQyqjtTCObDM3z2mjfMHyXLF7BGeyQ5YmwshGQbGhu435v+iZ+oI+OF2O5zCB3Pcz+
	+bq+AkxOwKnXdTApp42Whr34lgbf8MQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782900202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=le31d2tbOy5TJIvSiv+6y6dMNVk5perAPFF83mCDD1Q=;
	b=01PxVXRhqup5WmycK7hlEl0wI8E7Lu+INRZbS6lpCRWnLUx9xGogYZDEoZiU71GTW0PgsI
	GC/CuWXidheEQ6Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87918779AA;
	Wed,  1 Jul 2026 10:03:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PfrIH+rlRGqMNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 Jul 2026 10:03:22 +0000
Date: Wed, 01 Jul 2026 12:03:22 +0200
Message-ID: <87cxx7uivp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: wangdich9700@163.com,
	perex@perex.cz,
	tiwai@suse.com,
	wangdicheng@kylinos.cn,
	david.rhodes@cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ALSA: hda/cs35l56: Use scoped_guard() for irq_lock in cs35l56_hda_fw_load()
In-Reply-To: <32d2c13a-25f1-4783-ab53-b59ff41940a8@opensource.cirrus.com>
References: <20260701065108.596046-1-wangdich9700@163.com>
	<20260701065108.596046-3-wangdich9700@163.com>
	<32d2c13a-25f1-4783-ab53-b59ff41940a8@opensource.cirrus.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[163.com,perex.cz,suse.com,kylinos.cn,cirrus.com,opensource.cirrus.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,kylinos.cn:email]
X-Spam-Level: 

On Wed, 01 Jul 2026 11:46:18 +0200,
Richard Fitzgerald wrote:
> 
> On 01/07/2026 7:51 am, wangdich9700@163.com wrote:
> > From: wangdicheng <wangdicheng@kylinos.cn>
> > 
> > Replace the manual mutex_lock/mutex_unlock of irq_lock with
> > scoped_guard(). This lets the compiler guarantee the lock is
> > released on all exit paths, eliminating the err label that
> > previously existed only to reach the unlock call.
> > 
> > No functional changes.
> > 
> > Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> > ---
> 
> Is this fixing any bugs?
> 
> This is a lot of code churn to fix nothing.

IMO, as a cleanup, such a change *may* be acceptable.  Dropping the
manual locking calls can reduce the mistakes and makes the code better
maintained.

Most of changes are due to the indentation, and you can ignore them
via -w option of git-diff or git-show.  (It's difficult to do it in
the review of manual patches, though.)

But, one thing still needs to be clarified: such changes must be
verified with clang W=1 build, at least, too; the combination of
guard() and goto aren't always good.


thanks,

Takashi

> 
> >   sound/hda/codecs/side-codecs/cs35l56_hda.c | 104 ++++++++++-----------
> >   1 file changed, 51 insertions(+), 53 deletions(-)
> > 
> > diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> > index a0ea08eb96a9..2d9d75053293 100644
> > --- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
> > +++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> > @@ -625,74 +625,72 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
> >   		goto err_fw_release;
> >   	}
> >   -	mutex_lock(&cs35l56->base.irq_lock);
> > +	scoped_guard(mutex, &cs35l56->base.irq_lock) {
> > +		/*
> > +		 * If the firmware hasn't been patched it must be shutdown before
> > +		 * doing a full patch and reset afterwards. If it is already
> > +		 * running a patched version the firmware files only contain
> > +		 * tunings and we can use the lower cost reinit sequence instead.
> > +		 */
> > +		if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
> > +			ret = cs35l56_firmware_shutdown(&cs35l56->base);
> > +			if (ret)
> > +				goto err_fw_release;
> > +		}
> >   -	/*
> > -	 * If the firmware hasn't been patched it must be shutdown before
> > -	 * doing a full patch and reset afterwards. If it is already
> > -	 * running a patched version the firmware files only contain
> > -	 * tunings and we can use the lower cost reinit sequence instead.
> > -	 */
> > -	if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
> > -		ret = cs35l56_firmware_shutdown(&cs35l56->base);
> > -		if (ret)
> > -			goto err;
> > -	}
> > +		ret = cs_dsp_power_up(&cs35l56->cs_dsp, wmfw_firmware, wmfw_filename,
> > +				      coeff_firmware, coeff_filename, "misc");
> > +		if (ret) {
> > +			dev_dbg(cs35l56->base.dev, "%s: cs_dsp_power_up ret %d\n", __func__, ret);
> > +			goto err_fw_release;
> > +		}
> >   -	ret = cs_dsp_power_up(&cs35l56->cs_dsp, wmfw_firmware,
> > wmfw_filename,
> > -			      coeff_firmware, coeff_filename, "misc");
> > -	if (ret) {
> > -		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_power_up ret %d\n", __func__, ret);
> > -		goto err;
> > -	}
> > +		if (wmfw_filename)
> > +			dev_dbg(cs35l56->base.dev, "Loaded WMFW Firmware: %s\n", wmfw_filename);
> > +
> > +		if (coeff_filename)
> > +			dev_dbg(cs35l56->base.dev, "Loaded Coefficients: %s\n", coeff_filename);
> >   -	if (wmfw_filename)
> > -		dev_dbg(cs35l56->base.dev, "Loaded WMFW Firmware: %s\n", wmfw_filename);
> > +		/* If we downloaded firmware, reset the device and wait for it to boot */
> > +		if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
> > +			cs35l56_system_reset(&cs35l56->base, false);
> > +			regcache_mark_dirty(cs35l56->base.regmap);
> > +			ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
> > +			if (ret)
> > +				goto err_powered_up;
> >   -	if (coeff_filename)
> > -		dev_dbg(cs35l56->base.dev, "Loaded Coefficients: %s\n", coeff_filename);
> > +			regcache_cache_only(cs35l56->base.regmap, false);
> > +		}
> >   -	/* If we downloaded firmware, reset the device and wait for it
> > to boot */
> > -	if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
> > -		cs35l56_system_reset(&cs35l56->base, false);
> > -		regcache_mark_dirty(cs35l56->base.regmap);
> > -		ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
> > +		/* Disable auto-hibernate so that runtime_pm has control */
> > +		ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
> >   		if (ret)
> >   			goto err_powered_up;
> >   -		regcache_cache_only(cs35l56->base.regmap, false);
> > -	}
> > -
> > -	/* Disable auto-hibernate so that runtime_pm has control */
> > -	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
> > -	if (ret)
> > -		goto err_powered_up;
> > -
> > -	regcache_sync(cs35l56->base.regmap);
> > +		regcache_sync(cs35l56->base.regmap);
> >   -	regmap_clear_bits(cs35l56->base.regmap,
> > -			  cs35l56->base.fw_reg->prot_sts,
> > -			  CS35L56_FIRMWARE_MISSING);
> > -	cs35l56->base.fw_patched = true;
> > +		regmap_clear_bits(cs35l56->base.regmap,
> > +				  cs35l56->base.fw_reg->prot_sts,
> > +				  CS35L56_FIRMWARE_MISSING);
> > +		cs35l56->base.fw_patched = true;
> >   -	ret = cs_dsp_run(&cs35l56->cs_dsp);
> > -	if (ret)
> > -		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_run ret %d\n", __func__, ret);
> > +		ret = cs_dsp_run(&cs35l56->cs_dsp);
> > +		if (ret)
> > +			dev_dbg(cs35l56->base.dev, "%s: cs_dsp_run ret %d\n", __func__, ret);
> >   -	/* Don't need to check return code, it's not fatal if this
> > fails */
> > -	cs35l56_hda_apply_calibration(cs35l56);
> > +		/* Don't need to check return code, it's not fatal if this fails */
> > +		cs35l56_hda_apply_calibration(cs35l56);
> >   -	ret = cs35l56_mbox_send(&cs35l56->base,
> > CS35L56_MBOX_CMD_AUDIO_REINIT);
> > -	if (ret)
> > -		cs_dsp_stop(&cs35l56->cs_dsp);
> > +		ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
> > +		if (ret)
> > +			cs_dsp_stop(&cs35l56->cs_dsp);
> >   -	cs35l56_log_tuning(&cs35l56->base, &cs35l56->cs_dsp);
> > +		cs35l56_log_tuning(&cs35l56->base, &cs35l56->cs_dsp);
> >     err_powered_up:
> > -	if (!cs35l56->base.fw_patched)
> > -		cs_dsp_power_down(&cs35l56->cs_dsp);
> > -err:
> > -	mutex_unlock(&cs35l56->base.irq_lock);
> > +		if (!cs35l56->base.fw_patched)
> > +			cs_dsp_power_down(&cs35l56->cs_dsp);
> > +	}
> >   err_fw_release:
> >   	cs35l56_hda_release_firmware_files(wmfw_firmware, wmfw_filename,
> >   					   coeff_firmware, coeff_filename);
> 

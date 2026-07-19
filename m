Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB84637B417
	for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 08:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784448124; cv=none; b=UEy8+OZqHHUL8oNrrQFeNglhKCJneFk2SMAX2kzC091MLoLhmeocq0kX3rKxNfL4g8atoGQCynyvG3bYc1wmZL/FO2L3fmwmB0hkT44FF7dZamy1VtpA9rBEQ3sTY/mtGlAtOVWWZd71u/0Mo8Eo8R4pqmmLr2B6C/xG5V4YcOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784448124; c=relaxed/simple;
	bh=JAGNtttv9RF4D0YFf4uoBDfeLBRBM6eXr6ChDk57BwU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mm9o3sDi6uzrVjRf01tnVINkT5aj0+UQw9XBtQJDboibrAeUK8E1SjMwgT8fsIK/ninuhketX0iUrNXh7cl+0uSqLcFdhbEFJ/yU1jQKX0k81xrAw9e5YasXU6L9E6VVT9GBwIA56BZh2YJ0oDWb0G6qtJdYeZk4iOM3xPqP8mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KS9ehc75; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=apFVyR4E; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L4hcYU8w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b5lENbkp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KS9ehc75";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="apFVyR4E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L4hcYU8w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b5lENbkp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9C72C79885;
	Sun, 19 Jul 2026 08:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784448118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rYanGSIYjIClMYBHE92D/ysAD0vMZUhrXPUc05lfvoQ=;
	b=KS9ehc751R9R8SOmRbgCDy726pSqH05UX8e3GNQ0h2YY6in6gsAa1csewBDY8YGyCPMm9m
	tDv84bPqrYXITaTzLPUCSgvYrZum1YbgQ1nBZH2cL9ZQueE14sYYd0hLJ8BOWQ7lG2RZAF
	TRyEuDWF9TvtR1VYszLYbaM4YjX+IZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784448118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rYanGSIYjIClMYBHE92D/ysAD0vMZUhrXPUc05lfvoQ=;
	b=apFVyR4EenTgz61bxAazpEaSD2IOMsQHgMy33Yarp6CxI1aQDOxNAMVyuAW18r+tHpj35B
	eJlR2oVPBLap3YBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784448117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rYanGSIYjIClMYBHE92D/ysAD0vMZUhrXPUc05lfvoQ=;
	b=L4hcYU8w5J59CCZopmVMK9yOq08CPk0Z6Q9ifiMrNOpe8SYQnEwdI35KWC6jU1DSbBcs/c
	lKsP0b83AW14S1CU5EPUT8adhXXRFoGx/fNy2g2fEOzO7b76KGfOcAl7lf0i/PIBT4NU4Z
	qxDVNDZQsACd0ys7PNYxCZHpvVeyZno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784448117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rYanGSIYjIClMYBHE92D/ysAD0vMZUhrXPUc05lfvoQ=;
	b=b5lENbkpt14yBMJNrPcGNJ3tMSbE5vUfm8slMOp+KK3gse1NX8OJuRsmMYfapK0iPUjs9y
	dttSW1Ilb9cmBzCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72C64779AA;
	Sun, 19 Jul 2026 08:01:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4Aa1GnWEXGqHIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 19 Jul 2026 08:01:57 +0000
Date: Sun, 19 Jul 2026 10:01:57 +0200
Message-ID: <87h5lvs8zu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Steven 'Steve' Kendall <skend@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
In-Reply-To: <20260718-fix-headphone-plug-cirrus-dell-v2-1-f88121570d62@chromium.org>
References: <20260718-fix-headphone-plug-cirrus-dell-v2-1-f88121570d62@chromium.org>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,imap1.dmz-prg2.suse.org:helo,suse.com:email,jack_detect_work.work:url,suse.de:mid,perex.cz:email]
X-Spam-Level: 

On Sat, 18 Jul 2026 04:05:41 +0200,
Steven 'Steve' Kendall wrote:
> 
> On some models like the Dell Inspiron 15 3520, jack
> detection does not work. This patch switches to
> delayed work to fix jack plug on Chrome OS.
> 
> ---
> This patch switches to a delayed work method for a
> specific Dell machine (Inspiron 15 3520). This fixes
> jack detection for this model.
> 
> Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
> ---
> Changes in v2:
> - Changes from v1 have been removed.
> - New approach uses delayed work and also solves the issue on this machine.
> - I'm now using the latest release of b4. Hopefully this addresses the formatting issues I was having!

Hmm, not really.  You've put the foreword separated with '---' again,
hence git-am picks up only the foreword, not the actual patch
description.  In general, there is no foreword in the patch.  And,
your foreword texts are obviously a part of the patch description, so
don't use foreword at all.

Please try once to submit to yourself, apply the patch via git-am
locally, and check that everything works as expected, then submit to
the upstream.

About the code change -- there is too little information in the patch,
both as descriptions and comments.  Please elaborate more.  Especially
about why a delayed work is needed and why you use different values
(100 and 2000 msecs) for the delay.  It looks like you picked up
something from the unsol event handling, etc and open-code in the
delayed work, and this should be described, too.


thanks,

Takashi

> - Link to v1: https://lore.kernel.org/r/20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org
> 
> To: Jaroslav Kysela <perex@perex.cz>
> To: Takashi Iwai <tiwai@suse.com>
> Cc: linux-sound@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  sound/hda/codecs/cirrus/cs8409.c | 32 ++++++++++++++++++++++++++++++--
>  sound/hda/codecs/cirrus/cs8409.h |  1 +
>  2 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/hda/codecs/cirrus/cs8409.c b/sound/hda/codecs/cirrus/cs8409.c
> index c43ff3ef75b6e..785946e29ce30 100644
> --- a/sound/hda/codecs/cirrus/cs8409.c
> +++ b/sound/hda/codecs/cirrus/cs8409.c
> @@ -56,6 +56,10 @@ static int cs8409_parse_auto_config(struct hda_codec *codec)
>  }
>  
>  static void cs8409_disable_i2c_clock_worker(struct work_struct *work);
> +static void cs8409_jack_detect_work(struct work_struct *work);
> +static void cs42l42_run_jack_detect(struct sub_codec *cs42l42);
> +static int cs8409_i2c_read(struct sub_codec *scodec, unsigned int addr);
> +static int cs8409_i2c_write(struct sub_codec *scodec, unsigned int addr, unsigned int value);
>  
>  static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
>  {
> @@ -69,6 +73,7 @@ static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
>  	codec->power_save_node = 1;
>  	mutex_init(&spec->i2c_mux);
>  	INIT_DELAYED_WORK(&spec->i2c_clk_work, cs8409_disable_i2c_clock_worker);
> +	INIT_DELAYED_WORK(&spec->jack_detect_work, cs8409_jack_detect_work);
>  	snd_hda_gen_spec_init(&spec->gen);
>  
>  	return spec;
> @@ -115,6 +120,27 @@ static void cs8409_disable_i2c_clock_worker(struct work_struct *work)
>  	cs8409_disable_i2c_clock(spec->codec);
>  }
>  
> +static void cs8409_jack_detect_work(struct work_struct *work)
> +{
> +	struct cs8409_spec *spec = container_of(work, struct cs8409_spec, jack_detect_work.work);
> +	struct sub_codec *cs42l42 = spec->scodecs[CS8409_CODEC0];
> +
> +	if (spec->init_done && spec->build_ctrl_done && !cs42l42->hp_jack_in) {
> +		int reg_ts_status = cs8409_i2c_read(cs42l42, CS42L42_TSRS_PLUG_STATUS);
> +
> +		if (reg_ts_status < 0)
> +			return;
> +
> +		if (((reg_ts_status & (CS42L42_TS_PLUG_MASK | CS42L42_TS_UNPLUG_MASK))
> +			>> CS42L42_TS_PLUG_SHIFT) == CS42L42_TS_PLUG) {
> +			cs42l42_run_jack_detect(cs42l42);
> +		} else {
> +			/* Make sure Tip Sense interrupts are unmasked */
> +			cs8409_i2c_write(cs42l42, CS42L42_TSRS_PLUG_INT_MASK, 0xF3);
> +		}
> +	}
> +}
> +
>  /*
>   * cs8409_enable_i2c_clock - Enable I2C clocks
>   * @codec: the codec instance
> @@ -953,6 +979,7 @@ static void cs8409_remove(struct hda_codec *codec)
>  
>  	/* Cancel i2c clock disable timer, and disable clock if left enabled */
>  	cancel_delayed_work_sync(&spec->i2c_clk_work);
> +	cancel_delayed_work_sync(&spec->jack_detect_work);
>  	cs8409_disable_i2c_clock(codec);
>  
>  	snd_hda_gen_remove(codec);
> @@ -1025,6 +1052,7 @@ static int cs8409_cs42l42_suspend(struct hda_codec *codec)
>  
>  	/* Cancel i2c clock disable timer, and disable clock if left enabled */
>  	cancel_delayed_work_sync(&spec->i2c_clk_work);
> +	cancel_delayed_work_sync(&spec->jack_detect_work);
>  	cs8409_disable_i2c_clock(codec);
>  
>  	snd_hda_shutup_pins(codec);
> @@ -1198,7 +1226,7 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
>  		spec->init_done = 1;
>  		if (spec->init_done && spec->build_ctrl_done
>  			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
> -			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
> +			schedule_delayed_work(&spec->jack_detect_work, msecs_to_jiffies(100));
>  		break;
>  	case HDA_FIXUP_ACT_BUILD:
>  		spec->build_ctrl_done = 1;
> @@ -1209,7 +1237,7 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
>  		 */
>  		if (spec->init_done && spec->build_ctrl_done
>  			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
> -			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
> +			schedule_delayed_work(&spec->jack_detect_work, msecs_to_jiffies(2000));
>  		break;
>  	default:
>  		break;
> diff --git a/sound/hda/codecs/cirrus/cs8409.h b/sound/hda/codecs/cirrus/cs8409.h
> index be1714a84fff4..19ea0affb9764 100644
> --- a/sound/hda/codecs/cirrus/cs8409.h
> +++ b/sound/hda/codecs/cirrus/cs8409.h
> @@ -339,6 +339,7 @@ struct cs8409_spec {
>  	unsigned int i2c_clck_enabled;
>  	unsigned int dev_addr;
>  	struct delayed_work i2c_clk_work;
> +	struct delayed_work jack_detect_work;
>  
>  	unsigned int playback_started:1;
>  	unsigned int capture_started:1;
> 
> ---
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> change-id: 20260710-fix-headphone-plug-cirrus-dell-5e3b49da5f52
> 
> Best regards,
> --  
> Steven 'Steve' Kendall <skend@chromium.org>
> 

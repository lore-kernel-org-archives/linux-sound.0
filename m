Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E98146D65
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 10:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728039327; cv=none; b=gyQlggt4ktERLGcV7JQWP5rB7DVW0KZv73gKZAN3uLG9ZuzDCpeZtDZ7Us+kFNQwRT8qka3OxRG9nSZPoqbN8w4baNvSlQOMUKcNzTf9DhiQdKJjyR5Fgi2lee3lLquhxA9brufay8auivK+Xxyk2kSvyShnMDvLyrofRJHwYs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728039327; c=relaxed/simple;
	bh=MbG3WUxQc7qCXQaZe3Bwwqw5ud6f4WFzoEhPw5aelJY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZ2eaCrjHzlWWJ8jmY2GeaLTmTQ7eMZ16NPRci61Nq7aU40wp2DeFgnxfLq3vB3D7G87SOAL6V7W/hAHyUqx8QET/dT8D86rL8ztE5fDCQoHek9iIbtN77EnStVjBrdSDlu0VTWtzamSGSuHRN70e/hNurszyjcAWIOjx1d1ADw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W3GOKQ9O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pldwQPPb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W3GOKQ9O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pldwQPPb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W3GOKQ9O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pldwQPPb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W3GOKQ9O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pldwQPPb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 088F121EA3;
	Fri,  4 Oct 2024 10:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728039324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYReMKAWADxj3m46LheX2qaiqoYzJZ0nt4e0DCuvdPY=;
	b=W3GOKQ9OJr3t5vdlDvQg8AvYOORQBU8htUauSr2/nrdT14ncqa2go85eG5p85pcwGTbvrw
	MLMpyJk30FfKONkUcF3dpbSRnz+m88zBD87EUqL8z3XPFn29XpqK874TsB7MjV0k1maCxo
	QnY1lNOpvbh/ZcXZj8E+H6zY+Wzb5hA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728039324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYReMKAWADxj3m46LheX2qaiqoYzJZ0nt4e0DCuvdPY=;
	b=pldwQPPbIjR+sIrShJLI51/Em/rI5oSAqrggt3Onc2MuYunaN3mqILj/8CRKx5ovI9Vgyq
	4XeQPNJTU0iCgVCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728039324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYReMKAWADxj3m46LheX2qaiqoYzJZ0nt4e0DCuvdPY=;
	b=W3GOKQ9OJr3t5vdlDvQg8AvYOORQBU8htUauSr2/nrdT14ncqa2go85eG5p85pcwGTbvrw
	MLMpyJk30FfKONkUcF3dpbSRnz+m88zBD87EUqL8z3XPFn29XpqK874TsB7MjV0k1maCxo
	QnY1lNOpvbh/ZcXZj8E+H6zY+Wzb5hA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728039324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYReMKAWADxj3m46LheX2qaiqoYzJZ0nt4e0DCuvdPY=;
	b=pldwQPPbIjR+sIrShJLI51/Em/rI5oSAqrggt3Onc2MuYunaN3mqILj/8CRKx5ovI9Vgyq
	4XeQPNJTU0iCgVCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A111013A55;
	Fri,  4 Oct 2024 10:55:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P7FkJZvJ/2buJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Oct 2024 10:55:23 +0000
Date: Fri, 04 Oct 2024 12:56:17 +0200
Message-ID: <87o740kuge.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	bo liu <bo.liu@senarytech.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Gergo Koteles <soyer@irl.hu>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 48/51] ALSA: hda: Switch to __pm_runtime_put_autosuspend()
In-Reply-To: <20241004094145.114167-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
	<20241004094145.114167-1-sakari.ailus@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 04 Oct 2024 11:41:45 +0200,
Sakari Ailus wrote:
> 
> pm_runtime_put_autosuspend() will soon be changed to include a call to
> pm_runtime_mark_last_busy(). This patch switches the current users to
> __pm_runtime_put_autosuspend() which will continue to have the
> functionality of old pm_runtime_put_autosuspend().

Many of those calls are with pm_runtime_mark_last_busy().
(Actually the only one without it can be an oversight, it's better to
be with *_mark_last_busy(), too).

Wouldn't it be better to keep without converting and rather drop the
superfluous *_mark_last_busy()?


thanks,

Takashi

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  sound/hda/hdac_device.c         | 2 +-
>  sound/pci/hda/cs35l41_hda.c     | 8 ++++----
>  sound/pci/hda/cs35l56_hda.c     | 2 +-
>  sound/pci/hda/hda_intel.c       | 2 +-
>  sound/pci/hda/tas2781_hda_i2c.c | 6 +++---
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
> index 3fbb9793dcfc..0cac8e008ff9 100644
> --- a/sound/hda/hdac_device.c
> +++ b/sound/hda/hdac_device.c
> @@ -582,7 +582,7 @@ int snd_hdac_power_down(struct hdac_device *codec)
>  	struct device *dev = &codec->dev;
>  
>  	pm_runtime_mark_last_busy(dev);
> -	return pm_runtime_put_autosuspend(dev);
> +	return __pm_runtime_put_autosuspend(dev);
>  }
>  EXPORT_SYMBOL_GPL(snd_hdac_power_down);
>  
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index d68bf7591d90..50d5b1e86d8d 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -805,7 +805,7 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
>  		 * This ensures no amps are playing back when we start putting them to sleep.
>  		 */
>  		pm_runtime_mark_last_busy(dev);
> -		pm_runtime_put_autosuspend(dev);
> +		__pm_runtime_put_autosuspend(dev);
>  		break;
>  	default:
>  		break;
> @@ -1232,7 +1232,7 @@ static void cs35l41_fw_load_work(struct work_struct *work)
>  	mutex_unlock(&cs35l41->fw_mutex);
>  
>  	pm_runtime_mark_last_busy(cs35l41->dev);
> -	pm_runtime_put_autosuspend(cs35l41->dev);
> +	__pm_runtime_put_autosuspend(cs35l41->dev);
>  }
>  
>  static int cs35l41_fw_load_ctl_put(struct snd_kcontrol *kcontrol,
> @@ -1463,7 +1463,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
>  	unlock_system_sleep(sleep_flags);
>  
>  	pm_runtime_mark_last_busy(dev);
> -	pm_runtime_put_autosuspend(dev);
> +	__pm_runtime_put_autosuspend(dev);
>  
>  	dev_info(cs35l41->dev,
>  		 "CS35L41 Bound - SSID: %s, BST: %d, VSPK: %d, CH: %c, FW EN: %d, SPKID: %d\n",
> @@ -1992,7 +1992,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
>  	if (ret)
>  		goto err_pm;
>  
> -	pm_runtime_put_autosuspend(cs35l41->dev);
> +	__pm_runtime_put_autosuspend(cs35l41->dev);
>  
>  	ret = component_add(cs35l41->dev, &cs35l41_hda_comp_ops);
>  	if (ret) {
> diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> index e3ac0e23ae32..fe482e4367e0 100644
> --- a/sound/pci/hda/cs35l56_hda.c
> +++ b/sound/pci/hda/cs35l56_hda.c
> @@ -91,7 +91,7 @@ static void cs35l56_hda_pause(struct cs35l56_hda *cs35l56)
>  			  BIT(CS35L56_ASP_TX3_EN_SHIFT) | BIT(CS35L56_ASP_TX4_EN_SHIFT));
>  
>  	pm_runtime_mark_last_busy(cs35l56->base.dev);
> -	pm_runtime_put_autosuspend(cs35l56->base.dev);
> +	__pm_runtime_put_autosuspend(cs35l56->base.dev);
>  }
>  
>  static void cs35l56_hda_playback_hook(struct device *dev, int action)
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index b4540c5cd2a6..a462b0745c16 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2351,7 +2351,7 @@ static int azx_probe_continue(struct azx *chip)
>  	if (azx_has_pm_runtime(chip)) {
>  		pm_runtime_use_autosuspend(&pci->dev);
>  		pm_runtime_allow(&pci->dev);
> -		pm_runtime_put_autosuspend(&pci->dev);
> +		__pm_runtime_put_autosuspend(&pci->dev);
>  	}
>  
>  out_free:
> diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> index 370d847517f9..7e89b27643c7 100644
> --- a/sound/pci/hda/tas2781_hda_i2c.c
> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> @@ -160,7 +160,7 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
>  		mutex_unlock(&tas_hda->priv->codec_lock);
>  
>  		pm_runtime_mark_last_busy(dev);
> -		pm_runtime_put_autosuspend(dev);
> +		__pm_runtime_put_autosuspend(dev);
>  		break;
>  	default:
>  		break;
> @@ -698,7 +698,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
>  	if (fmw)
>  		release_firmware(fmw);
>  	pm_runtime_mark_last_busy(tas_hda->dev);
> -	pm_runtime_put_autosuspend(tas_hda->dev);
> +	__pm_runtime_put_autosuspend(tas_hda->dev);
>  }
>  
>  static int tas2781_hda_bind(struct device *dev, struct device *master,
> @@ -741,7 +741,7 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
>  		comp->playback_hook = tas2781_hda_playback_hook;
>  
>  	pm_runtime_mark_last_busy(dev);
> -	pm_runtime_put_autosuspend(dev);
> +	__pm_runtime_put_autosuspend(dev);
>  
>  	return ret;
>  }
> -- 
> 2.39.5
> 

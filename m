Received: from mail-m19731119.qiye.163.com (mail-m19731119.qiye.163.com [220.197.31.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B3A27FB37
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 02:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786675273; cv=none; b=oEbOoT6HO4RlDOdxXBUywntj92WGL7SeKAoGpjXFkCN/UP73nRxQlnTx8QJOtfCnSx14106qazXJlCYuIjiT0EHf1JQMo9zzcbeFPhnqiOXB5gNgKeUZk2k9xBIrNRIVXmkgO0YieTmdrgDtgeQzzP91O4SSzILbXDb2R6yVU/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786675273; c=relaxed/simple;
	bh=SwRlw2ZyNjoxebvI5w2Hj58A1ak69TMReqs+UP4Dla8=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=MzUbagC+9CUp/OHAtRvt9eOebvtV5gNdCjQXCETe+5WoJaUWNCxEQUnvmXYiiMmcuoOK0umEhOk57PZeVKZJtQDRbTSv0XSZq3RiX+6MgyRT+V3FJK3tRFhc4GhmsV+Y77n9KCWw+j5RfTH7BX9sheMhjD6fClr4dUxgCeuCz0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=Wej4DbLy; arc=none smtp.client-ip=220.197.31.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="Wej4DbLy"
Received: from Wangqianghua (unknown [182.148.129.16])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49f21dab1;
	Fri, 14 Aug 2026 10:25:44 +0800 (GMT+08:00)
From: <qianghua.wang@senarytech.com>
To: "'Mark Brown'" <broonie@kernel.org>
Cc: <linux-sound@vger.kernel.org>,
	"'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.dev>,
	"'Bard Liao'" <yung-chuan.liao@linux.intel.com>,
	"'Liam Girdwood'" <liam.r.girdwood@linux.intel.com>,
	"'Peter Ujfalusi'" <peter.ujfalusi@linux.intel.com>,
	"'Kai Vehmanen'" <kai.vehmanen@linux.intel.com>,
	"'Cezary Rojewski'" <cezary.rojewski@intel.com>,
	"'bo liu'" <bo.liu@senarytech.com>
References: <20260813024527.42294-1-qianghua.wang@senarytech.com> <20260813024527.42294-2-qianghua.wang@senarytech.com> <e7c1f952-f7aa-4d3e-ac3f-7160ecb41e65@sirena.org.uk>
In-Reply-To: <e7c1f952-f7aa-4d3e-ac3f-7160ecb41e65@sirena.org.uk>
Subject:  [PATCH v2 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
Date: Fri, 14 Aug 2026 10:25:40 +0800
Message-ID: <009601dd2b94$352defa0$9f89cee0$@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad0rlDKA6NClfUjFQlyrhTHQ/8ambg==
Content-Language: zh-cn
X-HM-Tid: 0a9ffe16f22509d8kunm1c47c7c453a976
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEkYVklDSE5MS0tIHx4fH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpJQlVKTVlXWRYaDxIVHRRZQVlPS0hVQk
	JJTktVSktLVUpCS0JZBg++
DKIM-Signature: a=rsa-sha256;
	b=Wej4DbLyr0QhYzyRGajAjjyS5lxY+d+L2XR6z3br3uuRZy083hDJAY3lj+mMFaimiY+og7Tp2nEhFZkdVnvH2YqWYetaQaA0CX2VsW9A40WAmE/L1hMAtHQySt4zdA1WJbd9BcG539VFoHG0ymBRzor4QIXYmpan8FXE1De7HGk=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=45eq5eQwEcC4oKXq9w15K0SoxXbNr07DvG9T4ydkigc=;
	h=date:mime-version:subject:message-id:from;

Hi Mark:
	Thanks for the suggestion.
1.  this works but it feels like it'd be easier to just hold a runtime PM
reference so long as jack detection is active, the net effect would be the
same.
	Agreed that holding a runtime PM reference for the lifetime of jack
detection is clearer than repeatedly calling pm_runtime_mark_last_busy()
from the poll scheduler.
I will switch to that approach in v3: take a PM reference when jack
detection is enabled via set_jack(), and drop it when jack detection is
disabled / on remove, instead of refreshing autosuspend from
sn624x_jack_schedule_poll().

2.  There's a bunch of error paths that could leave us with remembering the
jack is set.
	Fixed in v3: take the runtime PM reference before assigning hs_jack,
so a failed get cannot leave jack detection marked as enabled.
3.  These errors...
	Thanks. Those Function Status / defaults failures were being logged
at debug and then ignored while still completing io_init. They are now
returned from io_init so the device is not marked initialized, and
update_status can retry on the next attach.
4. ...all end up reporting success after skipping some init?  That doesn't
seem right.
	Agreed - that was wrong. Those failures no longer skip ahead to a
successful io_init; they are returned so hw_init is not set and attach can
retry.
5. Are all the fields in these initialized?
	Good catch - stream_config.type was left uninitialized. Both configs
are now zero-initialized (= {}), then filled via snd_sdw_params_to_config(),
with only port_config.num set afterwards (as the helper documents).
6. That seems to require symmetric rates?
	Yes - writing both CS SampleFreqIndex controls on every jack
hw_params effectively forced symmetric rates. Only the direction being
configured is programmed now (OUT for playback, CAP for capture).
7. I'm not seeing anything that marks the cache as dirty in the event of a
power loss or reset (eg, over suspend).
	Good point - without marking the cache dirty after a power
loss/reset, regcache_sync() would skip restoring clean entries. We now mark
the cache dirty on suspend (clock-stop / power loss) and again on re-io_init
after a bus re-attach.
Best regards
Qianghua Wang
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Re: [PATCH v2 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver

On Thu, Aug 13, 2026 at 10:45:25AM +0800, Qianghua Wang wrote:
> Add a SoundWire SDCA driver for Senary SN624x multi-function codecs 
> (jack, speaker amp, and DMIC). Program SDCA SampleFreqIndex in 
> hw_params, keep SDCA jack IRQs masked with poll-based detection, and 
> extend the Senary MAINTAINERS entry for the new codec files only.

> +static void sn624x_jack_schedule_poll(struct sn624x_sdca_priv 
> +*sn624x) {
> +	if (!sn624x || !sn624x->hs_jack || !sn624x->slave)
> +		return;
> +
> +	mod_delayed_work(system_power_efficient_wq,
&sn624x->jack_detect_work,
> +			 msecs_to_jiffies(SN624X_JACK_POLL_MS));
> +
> +	/* Keep poll alive across autosuspend (3s default) when idle */
> +	if (sn624x->component)
> +		pm_runtime_mark_last_busy(sn624x->component->dev);
> +}

This works but it feels like it'd be easier to just hold a runtime PM
reference so long as jack detection is active, the net effect would be the
same.

> +static int sn624x_sdca_set_jack_detect(struct snd_soc_component
*component,
> +				       struct snd_soc_jack *hs_jack, void
*data) {
> +	struct sn624x_sdca_priv *sn624x =
snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	sn624x->hs_jack = hs_jack;

There's a bunch of error paths that could leave us with remembering the jack
is set.

> +static int sn624x_sdca_io_init(struct device *dev, struct sdw_slave 
> +*slave) {
> +	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(dev);
> +	int ret;
> +	unsigned int jack_func_status, dmic_func_status;
> +
> +	if (sn624x->hw_init) {
> +		SN624X_DBG(dev, "io_init: skip (hw_init already true)\n");
> +		return 0;
> +	}

> +io_init_next:
> +	ret = regmap_read_bypassed(sn624x->regmap,
> +					SN624X_REG_DMIC_FUN_STATUS_CTL,
> +					&dmic_func_status);
> +	if (ret < 0) {
> +		dev_dbg(dev,
> +			"sn624x: io_init: DMIC FUN STATUS read failed
(%d)\n",
> +			ret);
> +		goto io_init_end;
> +	}

These errors...

> +io_init_end:
> +	pm_runtime_set_active(dev);
> +
> +	sn624x->hw_init = true;
> +	sn624x->first_hw_init = true;
> +
> +	pm_runtime_put_autosuspend(dev);
> +
> +	SN624X_DBG(dev, "io_init: complete (hw_init set), jack %s\n",
> +		   sn624x->hs_jack ? "registered" : "not registered yet");
> +	return 0;
> +}

...all end up reporting success after skipping some init?  That doesn't seem
right.

> +static int sn624x_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
> +				     struct snd_pcm_hw_params *params,
> +				     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct sn624x_sdca_priv *sn624x =
snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config;
> +	struct sdw_port_config port_config;

Are all the fields in these initialized?

> +	if (dai->id == SN624X_DAI_JACK) {
> +		regmap_write(sn624x->regmap, SN624X_REG_JACK_OUT_RATE_SEL,
> +			     sampling_rate);
> +		regmap_write(sn624x->regmap, SN624X_REG_JACK_CAP_RATE_SEL,
> +			     sampling_rate);

That seems to require symmetric rates?

> +regmap_sync:
> +	slave->unattach_request = 0;
> +	regcache_cache_only(sn624x->regmap, false);
> +	regcache_sync(sn624x->regmap);
> +
> +	return 0;
> +}

I'm not seeing anything that marks the cache as dirty in the event of a
power loss or reset (eg, over suspend).


Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C843A545F
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 20:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777580726; cv=none; b=vEiC32ixMC6RJqwzrg6LRmkqE+F1LguxanqSWTmZCtIu1jn9DL/yA6fWAzhvH2vG5GOXri76X541SqH2tOYRJVr53B2BRPXPaRdi8xGnCZsMzHl6o8wn0XR+yp4Zu5Q1kjb1V60+HPc4tfv7Z1Hz8nLbD6Vc9zt46p0rynibhco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777580726; c=relaxed/simple;
	bh=bmPy3ZRVp/H0bcihQUgkeYXQuEalsPU5su/A+GKbNvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElduhUnaixBVOC07LmBSpsjyZFTYNGe/3M7DNJ6Y5PuS7T7q96FRo1IOc/WXsKyEXHHfvRASJewC95EiHLSUc4QR7yRmXqhD4Z39m4G4c7F4K+jtbIy59VidcJ/4KoGzWjakHy2Y1DBPzat7TKj0wX/md9ms0WbWS9qIzthGNdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qRunL9Bt; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qRunL9Bt"
Message-ID: <1ad635b4-4641-4244-b07b-26e414df79ec@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777580721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M4V9M1wjXwWb76hyS0103H8zfHWuJk3Hci67pNxEBxA=;
	b=qRunL9BtspRQubewijXBAuxg35VSlrJ7XG2+67JovvlflPk7edmloBG0wJJYkiD9jg6Rzp
	C3Hbje25ADhVUxDaNOlEGisi/H/LpTZG86XIc1MLq//EU1ofCwcltiOF887XxdUFdccMIK
	Ky02v4a2TH0SZeOsBYFXXmyjs5Balng=
Date: Thu, 30 Apr 2026 22:24:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v14 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, baojun.xu@ti.com, shenghao-ding@ti.com,
 sandeepk@ti.com, v-hampiholi@ti.com
References: <20260430144554.1335-1-niranjan.hy@ti.com>
 <20260430144554.1335-3-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260430144554.1335-3-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/30/26 16:45, Niranjan H Y wrote:
> Add codec driver for tac5xx2 family of devices.
> This includes the support for
>   1. tac5572 - DAC, PDM, UAJ and HID
>   2. tas2883 - Amplifier with DSP
>   3. tac5672 - Similar to tac5572 with feedback
>   4. tac5682 - Similar to tac5672 with Amplifier DSP.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---
> v14:
> - Resending complete series (v13 1/4 was accidentally sent alone)
> - rename the first_hw_init to first_hw_init_done for readability.
> - drop uaj_lock to make it simiar to other drivers
> - move the pm_runtime_enable to probe and keep only
>   pm_runtime_set_active for first attach case.
> - call pm_runtime_get_sync and pm_runtime_put_autosuspend in
>   .set_jack
> - handle early call to .set_jack when is it called
>   before first "attach"
> - remove tac5xx2_sdw_clk_stop as currently it is dummy
> - nit-pick in .hw_free to use xmas tree

starting to look good, see a couple of relatively minor comments below - and one important one on the component probe.

> +static int tac_sdw_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config = {0};
> +	struct sdw_port_config port_config = {0};
> +	struct sdw_stream_runtime *sdw_stream;
> +	struct sdw_slave *sdw_peripheral = tac_dev->sdw_peripheral;
> +	int ret;
> +	int function_id;
> +	int pde_entity;
> +	int port_num;
> +	u8 sample_rate_idx = 0;

nit-pick: reverse xmas-tree on the last variables.

> +static int tac_interrupt_callback(struct sdw_slave *slave,
> +				  struct sdw_slave_intr_status *status)
> +{
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&slave->dev);
> +	struct device *dev = &slave->dev;
> +	int ret = 0;
> +	int btn_type = 0;
> +	unsigned int sdca_int2, sdca_int3, jack_report_mask = 0;

nit-pick: reverse xmas-tree.

> +static s32 tac_component_probe(struct snd_soc_component *component)
> +{
> +	struct tac5xx2_prv *tac_dev =
> +		snd_soc_component_get_drvdata(component);
> +	struct device *dev = tac_dev->dev;
> +	struct sdw_slave *slave = tac_dev->sdw_peripheral;
> +	unsigned long time;
> +	int ret;
> +
> +	/* Wait for SoundWire hw initialization to complete */
> +	time = wait_for_completion_timeout(&slave->initialization_complete,
> +					   msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT_MS));
> +	if (!time) {
> +		dev_warn(dev, "%s: hw initialization timeout\n", __func__);
> +		return -ETIMEDOUT;
> +	}

are you sure this is needed? Or if this even works, if the card creation happens after the bus goes to clock-stop, then you will always timeout here.

If you look at commit 011e397 "ASoC: codecs: soundwire: call pm_runtime_resume() in component probe" it's simpler to force the bus+codec to resume, no?

> +
> +	if (!tac_has_uaj_support(tac_dev))
> +		goto done_comp_probe;

Is this really the case that you only have controls+routes for the UAJ function?

> +	ret = snd_soc_dapm_new_controls(snd_soc_component_to_dapm(component),
> +					tac_uaj_widgets,
> +					ARRAY_SIZE(tac_uaj_widgets));
> +	if (ret) {
> +		dev_err(component->dev, "Failed to add UAJ widgets: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_dapm_add_routes(snd_soc_component_to_dapm(component),
> +				      tac_uaj_routes, ARRAY_SIZE(tac_uaj_routes));
> +	if (ret) {
> +		dev_err(component->dev, "Failed to add UAJ routes: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_add_component_controls(component, tac_uaj_controls,
> +					     ARRAY_SIZE(tac_uaj_controls));
> +	if (ret) {
> +		dev_err(dev, "Failed to add UAJ controls: %d\n", ret);
> +			return ret;
> +	}
> +
> +done_comp_probe:
> +	tac_dev->component = component;
> +	return 0;
> +}

> +static s32 tac_init(struct tac5xx2_prv *tac_dev)
> +{
> +	s32 ret;
> +	struct snd_soc_dai_driver *dai_drv;
> +	struct snd_soc_component_driver *component_driver;
> +	int num_dais;

nit-pick: reverse xmas-tree.

> +static s32 tac5xx2_sdca_dev_resume(struct device *dev)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
> +	unsigned long t;
> +	int ret;
> +	bool had_unattached = false;

nit-pick: reverse xmas-tree.

> +
> +	if (!tac_dev->first_hw_init_done) {
> +		dev_dbg(dev, "Device not initialized yet, skipping resume sync\n");
> +		return 0;
> +	}
> +
> +	if (!slave->unattach_request)
> +		goto regmap_sync;
> +
> +	had_unattached = true;
> +	t = wait_for_completion_timeout(&slave->initialization_complete,
> +					msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT_MS));
> +	if (!t) {
> +		dev_err(&slave->dev, "resume: initialization timed out\n");
> +		sdw_show_ping_status(slave->bus, true);
> +		return -ETIMEDOUT;
> +	}
> +	slave->unattach_request = 0;
> +
> +	/* Detect and set jack type for UAJ path before playback.
> +	 * This is required as jack detection does not trigger interrupt
> +	 * when device is in runtime_pm suspend with bus in clock stop mode.
> +	 */
> +	tac5xx2_sdca_headset_detect(tac_dev);
> +
> +regmap_sync:
> +	regcache_cache_only(tac_dev->regmap, false);
> +	if (!had_unattached) {
> +		regcache_mark_dirty(tac_dev->regmap);
> +		ret = regcache_sync(tac_dev->regmap);
> +		if (ret < 0)
> +			dev_warn(dev, "Failed to sync regcache: %d\n", ret);
> +	}

can you explain why you have this extra test with had_unattached and if this is really useful?
I don't recall having seen this before on any other driver.

> +static void tac5xx2_fw_ready(const struct firmware *fmw, void *context)
> +{
> +	s32 ret = 0;
> +	u32 fw_hdr_size;
> +	size_t img_sz;
> +	u32 offset;
> +	u32 num_files = 0;
> +	struct tm tm_time;
> +	struct tac_fw_hdr hdr;
> +	struct tac_fw_file *files;
> +	u8 *buf;
> +	struct tac5xx2_prv *tac_dev = context;

nit-pick: reverse xmas-tree.

> +static int tac_download(struct tac5xx2_prv *tac_dev)
> +{
> +	int ret = 0;
> +	u32 i;
> +	struct tac_fw_file *files = tac_dev->fw_files;
> +	u32 num_files = tac_dev->fw_file_cnt;

nit-pick: reverse xmas-tree.

> +static int tac_io_init(struct device *dev, struct sdw_slave *slave, bool first)
> +{
> +	int ret;
> +	u64 time;
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);

nit-pick: reverse xmas-tree.


> +static int tac_update_status(struct sdw_slave *slave,
> +			     enum sdw_slave_status status)
> +{
> +	int ret;
> +	bool first = false;
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&slave->dev);
> +	struct device *dev = &slave->dev;

nit-pick: reverse xmas-tree.



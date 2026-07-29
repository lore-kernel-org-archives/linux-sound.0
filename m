Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DB74756A3
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 11:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785324886; cv=none; b=RLvtGhwyrklQZ589tA/mxjhXjckI7wGaw82XfP97Fe60gceYo82WV3FvB7YlzqtI5PLDWlPq3SmD4Ju+WDfo8ht0R9PWxJXyBqaOccIssW6rOsuTEMbxd1A0fdssiHHPuNJL/8yQYiiRud4ueD1LOAlMkn3NTgpiApJ+AAc5je0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785324886; c=relaxed/simple;
	bh=nEPx9E5impsDPcZMyWdMRdAlTpvRV8eM2K+fWz7+m2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2wyu3/jkdXVIth0i5KAnsQBGLOFUc9GRGg8BFzCNM3qA0HOaZhEe6B17u+h58z4fUGRhyl9LyhndQzizNnAjxK9T0PV6/ieDHg/oy64+hK+fF1VX5xi38KlErgtXbTMOQFzJTAu34vFwANbY293dAQ3Jh4qhjHIWYsVIksyrpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ab/QC3bA; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ab/QC3bA"
Message-ID: <40c7a0c9-de85-4b11-86fc-53b48e42462c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785324882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5qNCJH22qm7cfEdh/HVFrum6obb4H9CNKJl/CnAEcG0=;
	b=ab/QC3bAcqdwhrmsZRO3j9IxBI79qYESa7COWqFzkJs54+oHK2aOoR1/kgXR4lMxXsdU4N
	7Fuw35QVamscKQBSeXei3YAKDFCp3WgbfoVgWeaO8hU1sRn50au+I8RpZemkpDgmQ6QvWB
	CaSwXSx4aB5O6a/Qi52U8L7yQrIsy2s=
Date: Wed, 29 Jul 2026 13:33:22 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] ASoC: codecs: wcd9378: add TX/capture codec driver
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Julian Braha <julianbraha@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260729000649.263426-1-jorijnvdgraaf@catcrafts.net>
 <20260729000649.263426-3-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260729000649.263426-3-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Looks mostly good, I only have comments on confusing explanations
related to the two-peripheral split and pm_runtime support, see below.

On 7/29/26 02:06, Jorijn van der Graaf wrote:
> The Qualcomm WCD9378 is the audio codec found on SM7635 boards such as
> the Fairphone 6. It pairs a WCD937x-compatible analog core with SDCA
> function blocks (SmartMIC0/1/2, SmartJACK, SmartAMP) whose built-in
> sequencers perform the analog power-up/down autonomously: capture is
> started by programming the ADC usage mode, requesting power state 0 on
> the function's power domain entity and letting the sequencer ramp the
> ADC and the mic bias selected through SMx_MB_SEL.
> 
> Like the other codecs of the family the WCD9378 presents two SoundWire
> slaves (manufacturer 0x0217, part 0x0110); a platform device created

same part with two different unique_id or two different parts?

> from the codec DT node acts as component master over the two slave
> devices, reusing the wcd-common helpers. Unlike the older family
> members, all control registers - the SDCA function blocks and the
> analog core alike - live in a 32-bit paged SDCA control address space
> accessed through the TX slave, so the slave regmap needs
> prop.paging_support (on Qualcomm controllers this in turn needs SCP
> address paging support in the controller driver). The sequencers clock
> off the SoundWire bus clock and stall without the SCP bus-clock
> base/scale indication; the slaves declare prop.clock_reg_supported so
> the core programs those registers at enumeration (on Qualcomm
> controllers this in turn needs the controller driver to declare the
> bus clock in prop.mclk_freq).
> 
> Compute platforms wire the same chip as a single aggregated SDCA-mode
> slave instead; probe declines nodes marked qcom,compute-mode, so an
> SDCA class driver for that presentation can share the SoundWire ID
> table with this driver.
> 
> Two hardware behaviours deserve a note:
> 
>  - The SDCA function engine does not survive SoundWire bus clock-stop.
>    Every register keeps its value (so a regcache sync restores
>    nothing), but the sequencers ignore all subsequent power requests,
>    including forced trigger and soft-reset writes; only a codec reset
>    revives the engine. The downstream stack sidesteps this by marking
>    the TX SoundWire master "qcom,is-always-on" in its devicetree; do
>    the equivalent and hold a runtime PM reference on the TX slave for
>    as long as the codec is bound. 

The write-up seems to suggest that the manager and peripheral devices
remain pm_active and the bus clock is never stopped then? IWO there is
no pm_runtime suspend support for this SoundWire link.

> +static const struct sdw_device_id wcd9378_sdw_id[] = {
> +	SDW_SLAVE_ENTRY(0x0217, 0x0110, 0),
> +	{ },

presumably it's the same part_id for RX and TX, so there must be a
unique_id to make the difference between RX and TX.

> +static int wcd9378_sdw_runtime_suspend(struct device *dev)
> +{
> +	struct wcd9378_sdw_priv *wcd = dev_get_drvdata(dev);
> +
> +	if (wcd->regmap) {
> +		regcache_cache_only(wcd->regmap, true);
> +		regcache_mark_dirty(wcd->regmap);
> +	}
> +
> +	return 0;
> +}
> +
> +static int wcd9378_sdw_runtime_resume(struct device *dev)
> +{
> +	struct wcd9378_sdw_priv *wcd = dev_get_drvdata(dev);
> +
> +	if (wcd->regmap) {
> +		regcache_cache_only(wcd->regmap, false);
> +		regcache_sync(wcd->regmap);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops wcd9378_sdw_pm_ops = {
> +	RUNTIME_PM_OPS(wcd9378_sdw_runtime_suspend, wcd9378_sdw_runtime_resume, NULL)
> +};

not able to reconcile the definition of those pm_runtime routines with
the earlier assertion that a pm_runtime reference it takes to prevent
the bus clock from suspending.


> +static int wcd9378_bind(struct device *dev)
> +{
> +	struct wcd9378_priv *wcd9378 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Give the SDW subdevices some more time to settle */
> +	usleep_range(5000, 5010);

you may want to describe what those values refer to, experiments or
actual time expected from the documentation.

> +	ret = component_bind_all(dev, wcd9378);
> +	if (ret) {
> +		dev_err(dev, "Slave bind failed, ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	wcd9378->rxdev = of_sdw_find_device_by_node(wcd9378->rxnode);
> +	if (!wcd9378->rxdev) {
> +		dev_err(dev, "could not find rx slave with matching of node\n");
> +		ret = -EINVAL;
> +		goto err_component_unbind;
> +	}
> +
> +	wcd9378->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd9378->rxdev);
> +	wcd9378->sdw_priv[AIF1_PB]->wcd9378 = wcd9378;
> +
> +	wcd9378->txdev = of_sdw_find_device_by_node(wcd9378->txnode);
> +	if (!wcd9378->txdev) {
> +		dev_err(dev, "could not find tx slave with matching of node\n");
> +		ret = -EINVAL;
> +		goto err_put_rxdev;
> +	}
> +
> +	wcd9378->sdw_priv[AIF1_CAP] = dev_get_drvdata(wcd9378->txdev);
> +	wcd9378->sdw_priv[AIF1_CAP]->wcd9378 = wcd9378;
> +	wcd9378->tx_sdw_dev = dev_to_sdw_dev(wcd9378->txdev);
> +
> +	/*
> +	 * As TX is the main CSR reg interface, it should not be suspended
> +	 * first. Explicitly add the dependency link.
> +	 */
> +	if (!device_link_add(wcd9378->rxdev, wcd9378->txdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink TX and RX\n");
> +		ret = -EINVAL;
> +		goto err_put_txdev;
> +	}
> +
> +	if (!device_link_add(dev, wcd9378->txdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink WCD and TX\n");
> +		ret = -EINVAL;
> +		goto err_remove_link1;
> +	}
> +
> +	if (!device_link_add(dev, wcd9378->rxdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink WCD and RX\n");
> +		ret = -EINVAL;
> +		goto err_remove_link2;
> +	}
> +
> +	wcd9378->regmap = wcd9378->sdw_priv[AIF1_CAP]->regmap;
> +	if (!wcd9378->regmap) {
> +		dev_err(dev, "could not get TX device regmap\n");
> +		ret = -EINVAL;
> +		goto err_remove_link3;
> +	}
> +
> +	/*
> +	 * The SDCA function engine dies when the TX bus enters clock-stop
> +	 * and only a codec reset revives it - registers keep their values
> +	 * so a regcache sync or a FUNC_ACT re-toggle does not help. The
> +	 * downstream stack sidesteps the same problem by marking the TX
> +	 * SoundWire master "qcom,is-always-on"; do the equivalent and
> +	 * keep the TX slave (and thus its bus) runtime-active while the
> +	 * codec is bound.

So in practice only the RX peripheral can do a pm_runtime suspend?

> +	 */
> +	ret = pm_runtime_resume_and_get(wcd9378->txdev);
> +	if (ret < 0) {
> +		dev_err(dev, "could not resume TX device\n");
> +		goto err_remove_link3;
> +	}
> +
> +	ret = snd_soc_register_component(dev, &soc_codec_dev_wcd9378,
> +					 wcd9378_dais, ARRAY_SIZE(wcd9378_dais));
> +	if (ret) {
> +		dev_err(dev, "Codec registration failed\n");
> +		pm_runtime_put(wcd9378->txdev);
> +		goto err_remove_link3;
> +	}
> +
> +	return ret;
> +
> +err_remove_link3:
> +	device_link_remove(dev, wcd9378->rxdev);
> +err_remove_link2:
> +	device_link_remove(dev, wcd9378->txdev);
> +err_remove_link1:
> +	device_link_remove(wcd9378->rxdev, wcd9378->txdev);
> +err_put_txdev:
> +	put_device(wcd9378->txdev);
> +err_put_rxdev:
> +	put_device(wcd9378->rxdev);
> +err_component_unbind:
> +	component_unbind_all(dev, wcd9378);
> +	return ret;
> +}
> +
> +static void wcd9378_unbind(struct device *dev)
> +{
> +	struct wcd9378_priv *wcd9378 = dev_get_drvdata(dev);
> +
> +	snd_soc_unregister_component(dev);
> +	pm_runtime_put(wcd9378->txdev);

pm_runtime_put_sync() to make sure the idle routine is called
immediately and not later?

> +	device_link_remove(dev, wcd9378->txdev);
> +	device_link_remove(dev, wcd9378->rxdev);
> +	device_link_remove(wcd9378->rxdev, wcd9378->txdev);
> +	component_unbind_all(dev, wcd9378);
> +	put_device(wcd9378->txdev);
> +	put_device(wcd9378->rxdev);
> +}

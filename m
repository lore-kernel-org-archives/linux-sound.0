Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22746351C14
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535977; cv=none; b=SZOH7PyzPUF4ThZt/1XtE3rvaa16hjbCBQj4cNauuzZh5mdUUxLMMoGn8ID3xnaomDubqWr9L+g5Zs52aftxXwzWXsTvW/QIVdqv4eJ7FmShHcTRkuhvXn3O5yO1jZsa5SNO3WqEY3XXX/Fd3OBuhCcD8ioe5W/jaWXL1lSfEJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535977; c=relaxed/simple;
	bh=Qb7e/ZezYp3QGqXovcYuPUubAztS9Ep20FKZdAc0amo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=He09XD6rNzOUqqknhJzB5kFBsZ/T9G/qCzsz+kQE18shAsvzGnCkrQiBpv9njoCxz1hjLye7I9o9RhGFWD9tOfWzBqEeYyH49o4+eXs7797DNr00gVcwwf5DEX7QKYS2mKZumJLJ9AAzBs9/Kaze0P//njO9IFYvwuZo3ckedrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=t3j9qnhb; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="t3j9qnhb"
Message-ID: <892253fc-92da-4c60-af3a-5f7f331bec61@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777535962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1DmkNUq37MZ0rGy13xiiupoE0HRwTKd9vqYo1pyCto=;
	b=t3j9qnhbk4nH5UjIg2UK2GpfYa9UPy68t4PAfCSUzOGsc/2EwQl6Q62/qAJM9U2rCYTJU1
	Jr9zBIuKvrraUna/7IKeeBcv95ndpbkS5M8jNfaMmkn/+gpLN37KB0dpnfReZiJXVefPPA
	lvH/xBjAlEo0q64r8i5nBOgp2lXk8Aw=
Date: Thu, 30 Apr 2026 09:59:14 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v11 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
To: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "Xu, Baojun" <baojun.xu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>,
 "Kasargod, Sandeep" <sandeepk@ti.com>,
 "Hampiholi, Vallabha" <v-hampiholi@ti.com>
References: <20260427082401.2118-1-niranjan.hy@ti.com>
 <20260427082401.2118-2-niranjan.hy@ti.com>
 <7137df6a-5e49-4516-a356-3414f7d14c33@linux.dev>
 <d624812fe0f54563a2e628dbf1a428e3@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <d624812fe0f54563a2e628dbf1a428e3@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/29/26 06:06, Holalu Yogendra, Niranjan wrote:
>> On 01:28-20260429, Pierre-Louis Bossart wrote:
>> Subject: Re: [PATCH v11 2/4] ASoC: tac5xx2-sdw: add soundwire based codec driver
> 
>>> +struct tac5xx2_prv {
>>> +	struct snd_soc_component *component;
>>> +	struct sdw_slave *sdw_peripheral;
>>> +	struct sdca_function_data *sa_func_data;
>>> +	struct sdca_function_data *sm_func_data;
>>> +	struct sdca_function_data *uaj_func_data;
>>> +	struct sdca_function_data *hid_func_data;
>>> +	enum sdw_slave_status status;
>>> +	/* serialize potential concurrent uaj detection in .hw_params
>>> +	 * during playback session and .interrupt_callback.
>>> +	 */
>>> +	struct mutex uaj_lock;
>>
>> is this uaj_lock really needed, if you look below at hw_params there's nothing
>> that looks even remotely tied to jack detection...
> 
>  I think comment needs update to remove the hw_params related description here. ...

ok, but still see below...

>>> +static int tac_sdw_hw_params(struct snd_pcm_substream *substream,
>>> +			     struct snd_pcm_hw_params *params,
>>> +			     struct snd_soc_dai *dai)
>>> +{
>>> +	struct snd_soc_component *component = dai->component;
>>> +	struct tac5xx2_prv *tac_dev =
>>> +	return ret;
>>
>> so as I said above there's nothing here that might conflict with the interrupt
>> callback?
>> What am I missing?
> 
> ...  uaj_lock is still needed to handle potential race condition  in case .set_jack is called with jack as NULL
> (potentially to disable the jack functionality ) when the interrupt is being handled.
> This was suggested in earlier review comment and it made sense to me as well 

This isn't the first jack codec we've reviewed, and so far none of them have such a lock.
There is in some cases a lock to make sure the calibration is only done once, but that's different to your explanation.
So either everyone was wrong or this is unnecessary. Please double-check.

And in addition this driver is missing the pm_resume_and_get() that's present in most implementations to avoid races between set_jack and resume.

see e.g. commit e02b99e "ASoC: codecs: rt700/rt711/rt711-sdca: resume bus/codec in .set_jack_detect"

>>> +static struct pci_dev *tac_get_pci_dev(struct sdw_slave *peripheral)
>>> +{
>>> +	struct device *dev = &peripheral->dev;
>>> +
>>> +	for (; dev; dev = dev->parent) {
>>> +		if (dev_is_pci(dev))
>>> +			return to_pci_dev(dev);
>>
>> I find this surprising, what is the purpose of going up in the device hierarchy to
>> find a PCI device?
>> Why would this driver care?
> 
> For Speaker protection modules running on the firmware based devices, we need to have 
> different firmware for different projects as there are firmware differences.
> We need a way to uniquely identify firmware for each of these projects.
> Currently this is done through the  "subsystem id" which is part of the pci device.
> So we find the pci bus and then identify the subsystem id.
> 
> I see similar changes in class driver as well sound/soc/sdca/sdca_fdl.c.

ok, now I get it.

>>> +static int tac_update_status(struct sdw_slave *slave,
>>> +			     enum sdw_slave_status status)
>>> +{
>>> +	int ret;
>>> +	bool first = false;
>>> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&slave->dev);
>>> +	struct device *dev = &slave->dev;
>>> +
>>> +	tac_dev->status = status;
>>> +	if (status == SDW_SLAVE_UNATTACHED) {
>>> +		tac_dev->hw_init = false;
>>> +		tac_dev->fw_dl_success = false;
>>> +	}
>>> +
>>> +	if (tac_dev->hw_init || tac_dev->status != SDW_SLAVE_ATTACHED) {
>>> +		dev_dbg(dev, "%s: early return, hw_init=%d, status=%d",
>>> +			__func__, tac_dev->hw_init, tac_dev->status);
>>> +		return 0;
>>> +	}
>>> +
>>> +	if (!tac_dev->first_hw_init) {
>>> +		pm_runtime_set_autosuspend_delay(tac_dev->dev, 3000);
>>> +		pm_runtime_use_autosuspend(tac_dev->dev);
>>> +		pm_runtime_mark_last_busy(tac_dev->dev);
>>> +		pm_runtime_set_active(tac_dev->dev);
>>> +		pm_runtime_enable(tac_dev->dev);
>>
>> I suggest you look at other codec drivers, all the pm_runtime configuration is
>> done in the .probe callback and only set_active done upon a change in status.
> 
> I thought I will keep it here so that all pm_runtime_* initializations are in one place.

well that's well intended but not so good.

You want to have a symmetric handling of pm_runtime_enable() and pm_runtime_disable() in .probe and .remove driver callbacks.
With your implementation the pm_runtime_enable() is only done if/when the device attaches.

And then you do want to take a look at other drivers where there's this big fat comment..

	/* set autosuspend parameters */
	pm_runtime_set_autosuspend_delay(dev, 3000);
	pm_runtime_use_autosuspend(dev);

	/* make sure the device does not suspend immediately */
	pm_runtime_mark_last_busy(dev);

	pm_runtime_enable(dev);

	/* important note: the device is NOT tagged as 'active' and will remain
	 * 'suspended' until the hardware is enumerated/initialized. This is required
	 * to make sure the ASoC framework use of pm_runtime_get_sync() does not silently
	 * fail with -EACCESS because of race conditions between card creation and enumeration
	 */

> 
>>> +
>>> +static int tac5xx2_sdw_clk_stop(struct sdw_slave *peripheral,
>>> +				enum sdw_clk_stop_mode mode,
>>> +				enum sdw_clk_stop_type type)
>>> +{
>>> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&peripheral->dev);
>>> +
>>> +	dev_dbg(tac_dev->dev, "%s: mode:%d type:%d", __func__, mode,
>> type);
>>> +	return 0;
>>
>> this looks rather useless, no?
> 
> Yes, currently only required in case of debugging. 

the clock stop is logged at the host level, this seems useless to me, even for debugging.


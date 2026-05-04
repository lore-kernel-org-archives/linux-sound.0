Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844673E3D89
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 17:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916538; cv=none; b=JDwKQbBhr4m5ou9IoQK4wuQPooaRrIw4PKO+dXfbcZmXsY6seYELUPPMrZnS0YeecmgT6MI6mzw3Hbry+pUnU6XmahvDhgUwuQ0tm0MQmlBeteEruCGUET12f+ipvMXSli+Awi8W/x6ah+bM7bstPt018Er0L6ozsLywzDZm8fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916538; c=relaxed/simple;
	bh=TLFe9e+m/Adfcw5V7vL/GE5pmVgoE++YKHZTERDgrz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhZQm49up3vcu9b6Dz0QiOqdZYAIg3w7R+bvKoPGw/NvN7c6YV3SoCh7pOoz4jUlltZuckzGTQjqUtm1TlpgGFFEFQr3LsUNtv30ueeqm9Y2mO9PBD4oI/z03U0uXRZAXzCLp2uGM0C7/keqqhPwTNTz+OPSM31ImZ+ulbsZTOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rGi8rLGB; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rGi8rLGB"
Message-ID: <71f22f63-c772-42c5-86e2-2703be7fb056@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777916534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4TLfGWVfhqC57BuGOBVo7iY2juLYG/+URMiLha4qfQ=;
	b=rGi8rLGBwPsOxVjh/C492Jt3KCPwijOPu4NLlq53FuVAmaWImaIs71HWYzmt0P6sKQmzDA
	zh9b+3BKij2Sxg8yM0ADYaVSk7BHYzhqW0Id1g7prAdSmuOz7TKeyE/UAf/W8IfxQCHS9T
	91gqo2XTRN456vfw166tRtoEY0ns7DY=
Date: Mon, 4 May 2026 19:41:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v15 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
To: Mark Brown <broonie@kernel.org>, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, baojun.xu@ti.com, shenghao-ding@ti.com,
 sandeepk@ti.com, v-hampiholi@ti.com
References: <20260504125716.2015-1-niranjan.hy@ti.com>
 <20260504125716.2015-3-niranjan.hy@ti.com> <afikt0VzLDHrTjvM@sirena.co.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <afikt0VzLDHrTjvM@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/4/26 15:52, Mark Brown wrote:
> On Mon, May 04, 2026 at 06:27:14PM +0530, Niranjan H Y wrote:
>> Add codec driver for tac5xx2 family of devices.
> 
>> +static s32 tac5xx2_sdca_dev_resume(struct device *dev)
>> +{
>> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
>> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>> +	unsigned long t;
>> +	int ret;
> 
>> +
>> +	/* Detect and set jack type for UAJ path before playback.
>> +	 * This is required as jack detection does not trigger interrupt
>> +	 * when device is in runtime_pm suspend with bus in clock stop mode.
>> +	 */
>> +	if (tac_has_uaj_support(tac_dev))
>> +		tac5xx2_sdca_headset_detect(tac_dev);
>> +
>> +regmap_sync:
>> +	regcache_cache_only(tac_dev->regmap, false);
>> +	regcache_mark_dirty(tac_dev->regmap);
>> +	ret = regcache_sync(tac_dev->regmap);
>> +	if (ret < 0)
>> +		dev_warn(dev, "Failed to sync regcache: %d\n", ret);
> 
> We do the jack detect before we reinitialise the registers, meaning the
> device is still in cache only mode and volatile reads will all return
> -EBUSY.

Indeed, and there's also another set of initializations that won't happen in the io_init.

It's a bit complicated because we have to deal with device attachment and suspend-resume, and the two parts aren't necessarily equivalent.
- when resuming the bus the codec will also be resumed
- but the device can go to runtime_pm suspend while still attached on the bus (e.g. if another device is active on the same bus).

Other drivers have regcache_cache_only(tac_dev->regmap, false); in the two paths (io_init and resume) to make sure both cases are handled.

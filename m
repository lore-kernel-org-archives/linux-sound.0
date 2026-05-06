Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7071946DA
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 12:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071642; cv=none; b=efvEM7sgaug2YXORZuwBjVXEoHCbCmix4bjrspfTkgRT5DJm//HZzxgRT5ZAzEbbW+Z3h7CNfUDsE7tMI52R+bxrwolMelc9foJLUrMjit3FvDwVTzFgMxpbE9YVeqjCHUuzRw8m004QxnrIrgG2V72lTllYeYQvJFHRvdy+/JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071642; c=relaxed/simple;
	bh=IE6Rjvj4+N6Yes9GE5wwFUeUxlLk0SW8zuKWT0UTt/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PBl0C+RzRueaPIPpqYfUsVvo7jH7MBA7H04amKwQ8YVq4bxbRb4JP3ejr4quHOIw+DX3YzQEkJDiH8YqPXFSEcMU9OZUd5isKm6mZqLlNuxQdTdyaR7z/qNP9dX+tK0Jfq4Uk2X9ROyML8LQiAvvGV68DFaZCLg3rzJayCXKY0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DSLgbBoM; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DSLgbBoM"
Message-ID: <9c0c1749-aaea-427d-a3c5-76174efa1102@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778071634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKUB0OUtdWSf8ugGZAt5RcLMjIri22U11y8H/0X4OLM=;
	b=DSLgbBoMBLPFe5pUstguXRncVBTCitzrlHfRqyovIQM4/VYcFYDYTYO/lqtVigDJa4dhs5
	WuFg12HilNdABM5eMuGIevG53m+MSsGuE7Amovjje+I0M5Ic6GYs0i0zdQcHm2zQnYMsqo
	IwgdlXtAfzl8CrfYUaZ+/f3K2R+VrIU=
Date: Wed, 6 May 2026 14:46:22 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v16 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, baojun.xu@ti.com, shenghao-ding@ti.com,
 sandeepk@ti.com, v-hampiholi@ti.com
References: <20260505111806.2280-1-niranjan.hy@ti.com>
 <20260505111806.2280-3-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260505111806.2280-3-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/5/26 13:18, Niranjan H Y wrote:
> Add codec driver for tac5xx2 family of devices.
> This includes the support for
>   1. tac5572 - DAC, PDM, UAJ and HID
>   2. tas2883 - Amplifier with DSP
>   3. tac5672 - Similar to tac5572 with feedback
>   4. tac5682 - Similar to tac5672 with Amplifier DSP.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>



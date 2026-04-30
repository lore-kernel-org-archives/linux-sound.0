Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95058304BB3
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 08:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536945; cv=none; b=ZPZBEYyNYd4DrMTh8p8LzSk5roji1cFLNV/105kX31m0JaKiPihRUnEW2ijWqhaRo69fBXj8pdsMbTplm7BbH9Ul5KXhApXo50p3hsw8kbNXuvid+A47ck8BgTqgbR7isI5QufF8qrfn1LaZD0bFu7VLigzd+8aPks2xfP3+5ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536945; c=relaxed/simple;
	bh=5nKvUHZ18phJczvz3/OzHed68jejBdxG9lmgZnIuUnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arcpcV8rWfNXJ/xszMk5IuJVPM1izaDbcYf/ELs4ZhfHjZZ2ipBNWIoiMIgBcP4wMJ8caSF4DBt687h4JvfqZrBgiHKPQxL/UMNVtNldVrZJWkMdrb0rp4kSUseGQIFGda556OV92RvQW5sdYJEeBR/d0sDwh/WGJE3OTthOh68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qmficIZD; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qmficIZD"
Message-ID: <389f14b7-77ef-41c2-9bb3-8b0ec786ef5e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777536942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LbHZkj4cXCgkb8qwo8+UdRFEzKvc7thZBFWDIuoNYw=;
	b=qmficIZD/FZqFoptNsn9PrDQDzWucBmeOsm3YUjOSFnL2pL1G+OIlDK5u1AxsaOfwOsoug
	YjkUBF3v84MEkZj6IpxoMjMboYHq34bIFoit+DZSyU3PNhBkSbQmIsLCatYy/TJhmBGsrF
	xh4Cnc3yYtay7LHHg1/ZwAIGeU8NBRs=
Date: Thu, 30 Apr 2026 10:13:49 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v12 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, baojun.xu@ti.com, shenghao-ding@ti.com,
 sandeepk@ti.com, v-hampiholi@ti.com
References: <20260428162911.2372-1-niranjan.hy@ti.com>
 <20260428162911.2372-2-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260428162911.2372-2-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/28/26 18:29, Niranjan H Y wrote:
> Add codec driver for tac5xx2 family of devices.
> This includes the support for
>   1. tac5572 - DAC, PDM, UAJ and HID
>   2. tas2883 - Amplifier with DSP
>   3. tac5672 - Similar to tac5572 with feedback
>   4. tac5682 - Similar to tac5672 with Amplifier DSP.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>

please check my comments on v11, you still have issues with pm_runtime and set_jack. Thanks


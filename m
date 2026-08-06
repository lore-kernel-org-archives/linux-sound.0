Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EF92DCBF8
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006079; cv=none; b=QYYdLaihZG1TBqSNSAw/Bp6uLpJras5SSvSLtl/xxMaGm4xDvgIN2R/m8oColBSr7VwYOGd2Wf2nIneQP7hL13le00CsxbMgu5ANAKCwY+G86WlR7CbgZ+h7hjzAAU/Ti15uHb88qZCt6ieQawfH+f0rLD/3e3F1O1a4pIKdxUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006079; c=relaxed/simple;
	bh=/RwhpA1pEfHvcUpqYW8j0Xx5phHch4j7bhmE4lNLuY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Wx5TiqrOxKB4n3FAdnuQ4mSbO3I7zlwZg5tlnrxak2MpxfnFezmscRRI9bjCQ/ZwbFH0QwskAr1FwrluThPGj0wNdzjthFOHG3I9bn0Qd/Q5d/QjOcle+S15SwPT+AprxvmRsNsFrbR5POIZwirHc12upTBkQTN45v1HMNUcQnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G6GD3Wdz; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G6GD3Wdz"
Message-ID: <02f2cd9c-519c-4154-be58-9065f34c6001@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786006075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7tbZ6AzJPVKp62uoxqJCimSi6CiBIXlts7NZivKGmIM=;
	b=G6GD3WdzTaorOOk/MCfbrG2oxf7f0fwBwh/E/gp52lMTe63SsDpVVT4qeQmLS20CZdVt3Q
	kxWqyn6JYUp//lnCeXKjHcaHMnL1XO18gc0deN62MUY5uCi20TCBexs+0gsCmVN5O1p42a
	hSAcoQhxa3dG+9OiZnIXMLQrsOLX7XQ=
Date: Thu, 6 Aug 2026 10:47:49 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [BUG] ASoC: tas2783-sdw: every amp on the link selects the same
 channel, so a two-amp board plays mono
To: Robin Everaars <robineveraars@pm.me>, Shenghao Ding
 <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Niranjan H Y <niranjan.hy@ti.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sound@vger.kernel.org
References: <20260805183517.8665-1-robineveraars@pm.me>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Content-Language: en-US
In-Reply-To: <20260805183517.8665-1-robineveraars@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> Confirmed fix, measured on this hardware
> ========================================
> 
> Writing PPU21 selector 0x10 per amp does fix it. I derive the value from
> component->name_prefix, so tas2783-1 and -3 get 0x01 (Left) and -2 and -4
> get 0x04 (Right), matching the mapping asoc_sdw_ti_spk_rtd_init() already
> applies in sound/soc/sdw_utils/soc_sdw_ti_amp.c.

you mentioned a two-amp board but the wording seems to describe 4 amps?
Also not sure what mapping you are referring to, I looked up the code
and couldn't connect the dots between the last sentence and the code.

> Acoustic result on the same measurement rig as above, right channel only:
> 
>   before   +0.4 dB over the noise floor, i.e. silence
>   after   +70.7 dB, and the left/right imbalance is 0.3 dB
> 
> It also survives an s2idle cycle, which matters here: a driver re-bind re-
> runs tas2783_init_seq and would put 0x01 back, so the value has to be re-
> asserted rather than written once. I do it from the POST_PMU path for that
> reason.

This may work but that isn't the intended role of the PPU (Posture
Processing Unit). The spec says

"
PostureNumber (PPU)
This Control is provided in the PPU for selecting the pre-defined
mapping between input Channels and output
Channels and applying any Posture-related processing.
"

In theory the *same* posture number should be given to both amps, and
they shall modify their input to output mapping accordingly.

For aggregated amps (which is the case here), the spec also says the
PostureNumber register needs to be dual-ranked for synchronous changes
but that part isn't managed by the SoundWire/SDCA core just yet.



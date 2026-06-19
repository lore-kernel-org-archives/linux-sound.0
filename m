Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B71278161
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781876547; cv=none; b=kNu+4lODdDh4jEKHFMMhvSImIeZJ4wQe5G/c0Qqwyj4epuhbgqZrqlZmCd9ooSefwtFWXsAfg38NtuOzhbdYEIEyxcpt1lSOp3tl7o/zIcxq6cISS2vPlP7lgHdP+Tw88fr2Sl2ZwPYe2k5B2jQQNwvSalgs4HRBH2xgp4fCP4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781876547; c=relaxed/simple;
	bh=Zrl1wOMoOgmqzdTlUagiOko2coepMWkdVl+x/HpvvBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtmFmOcmppDQynt4fZ/vKwLGsOKLqKdfkEnMvY1XaiDVtfI3t41gCgaIsYCuIk4Pj+/EiDT/aETAogTSI4T5ukm0aEIUtMGWXGVXXUuif+wg6K3Q8Mt4EiBQK9Ds8fT4HsM1H41ixcPu/YvMU+tT/U+TTEMZyYAEL+esCN9wioI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u3kRRVtG; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u3kRRVtG"
Message-ID: <7466d545-85e0-4dab-aa3d-79c8e3a9cbda@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781876534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uj+34lCOzaDBkdO/bp8/xj6EAViL47S5OKUJ18GAU00=;
	b=u3kRRVtGyo2myHKBAsNqi+QRWO7R0QsWz7L1AZILvsRe5g6ktaFfrmaQcLdEU/EBkYul6N
	934H4xgm4NxLijJmhkAq3l79VKa/0D0nAc7Bj7w54nN+2/QyDAxtKzeu0TNI2j0k6z93Qe
	149MJzMsohBS239zjsVitMG35/2Z1z8=
Date: Fri, 19 Jun 2026 15:41:44 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/10] Expand SoundWire enumeration helper coverage
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
 vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com, jack.yu@realtek.com,
 shumingf@realtek.com, srini@kernel.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> The patch series in [1] added a new helper to remove common boiler plate
> waiting for a device to enumerate on SoundWire, however, many devices
> also wait for enumeration during probe. This series updates things to be
> suitable such that we can call the same helper at probe time when the
> unattach_request is not valid.

So if we are no longer testing for unattach_request, should this be definition and its use be removed?
Looks like there were multiple evolutions since the initial patch
"soundwire: sdw_slave: track unattach_request to handle all init sequences",
is an additional cleanup needed?

> There is one final step outstanding which is to add a core helper
> that waits for a device to drop off the bus. This is not include
> in this series and should be the last step of this process.

Humm, I am not following why the core needs to wait for a device to drop off. 
If there's a bus reset or device reset, it's almost immediate.
It the devices loses sync then the core wouldn't wait either since it's not expecting the device to drop-off.



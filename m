Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF0D3793B0
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184643; cv=none; b=oC9hdlfzMsHn27auNDRl59XqAslik/p2/exJeTNLv6Q5i9NNoCw5UFAUsvfBQ+/3N6oSiOM539N2hsmGaHBPtvvimmhoFDZejt5UIN0ACmse814zmgSQFLYFbGtGCKDp6c21Tt7lRJZx7IfEp9en2B/2NJxR2i/q6rvVBq2QzKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184643; c=relaxed/simple;
	bh=jfJBMFQ0lzzLEvzicZbiwAYON6suZdIO/31jsKebsNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=q3Inw1J1u+xLvY2zLtXU5L8wZBKaOs3uuqsRI4qG+ZPx0XblPmd1kRFz7V0ENnhLWa9X9WYFNVAc/AQjXouphr6lVuyK91RnfZUHyBgMThEBI9N+VSJJ5iEmhicifCORem4WFAZKaxyZwMYOw4ko4tVvcuRSpzPWG8pqh0sqS3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=g9vvWPw5; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="g9vvWPw5"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261005071713euoutp01ffb5df8f4ae2ca9fe342236dffba77af~bkO8V6A7E3276232762euoutp01X
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 07:17:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261005071713euoutp01ffb5df8f4ae2ca9fe342236dffba77af~bkO8V6A7E3276232762euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791184633;
	bh=tDyMIJt9GEHG1O+FdMTw5VRypdxdwWrDlpY2GuSi1Uw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=g9vvWPw5n9X25pMGic+LneE/2VM2zhon1lc/j3kwThwPp6oScEjxNzK6BtFyipD09
	 tDKPpJ6Scli1yG1tP+m+BkIxqroLp/CkSXxh0Zh4vbTQwUgfudNSnISGhnVHGcOH6u
	 IksTissuSIdnsKIrALzcdth9yo9OZxv4Cn6d9oVA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261005071713eucas1p1130def3b0abe5a5583ad25765dfa2528~bkO8KQ0BO0628806288eucas1p1K;
	Mon,  5 Oct 2026 07:17:13 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261005071712eusmtip212456241e657ea6fa877cd9cb12b264e~bkO7hEuV90330403304eusmtip2G;
	Mon,  5 Oct 2026 07:17:12 +0000 (GMT)
Message-ID: <5ccae82f-42fc-4424-9a7a-d1592260756b@samsung.com>
Date: Mon, 5 Oct 2026 09:17:11 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] ASoC: soc-generic-dmaengine: don't request default
 channels from dma_dev
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: linux-sound@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Liam
	Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAABR9nE9zGHbABn2+=+zOsGTvDbLsCYp6RWMkK0RyJF6c74ooQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261005071713eucas1p1130def3b0abe5a5583ad25765dfa2528
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261002092341eucas1p106b159afbbb9f78eb1a7f9bfaf2ff376
X-EPHeader: CA
X-CMS-RootMailID: 20261002092341eucas1p106b159afbbb9f78eb1a7f9bfaf2ff376
References: <CGME20261002092341eucas1p106b159afbbb9f78eb1a7f9bfaf2ff376@eucas1p1.samsung.com>
	<20261002092336.585546-1-m.szyprowski@samsung.com>
	<CAABR9nE9zGHbABn2+=+zOsGTvDbLsCYp6RWMkK0RyJF6c74ooQ@mail.gmail.com>

On 03.10.2026 02:42, Bui Duc Phuc wrote:
> Hi Marek,
>
> Thanks for the fix.
>
>> Fixes: 9167f260477b ("ASoC: soc-generic-dmaengine: Handle DMA channel request failures correctly")
>> Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Note that the bogus "rx" request predates 9167f260477b;
> the failure was just silently ignored before, and my commit
> only exposed it. So the Fixes tag might better point to
> the commit that introduced the dma_dev usage for
> the secondary DAI.
Thanks for pointing this. It was commit 194c7dea00c6, which added dma_dev support and that
time there was no error reporting, so the fallback to default channel names was harmless.
I think the most accurate would be tag this patch with two 'Fixes' tags: 

Fixes: 194c7dea00c6 ("ASoC: dmaengine: add custom DMA config to snd_dmaengine_pcm_config")
Fixes: 9167f260477b ("ASoC: soc-generic-dmaengine: Handle DMA channel request failures correctly")

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


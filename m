Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6F33A453B
	for <linux-sound@vger.kernel.org>; Sun,  9 Aug 2026 19:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786302850; cv=none; b=CoxXkFH0JSDOc9+Rdl4efcdxJ7MJfYh8nTs9rj/49LNns0f7OAo4glvCSBYj1AZWVqkGqmx4gLs2YXA8PpmSRWfS5vLPd4QSfjX1YOt5d1RjV6sC+z97lU0jfpwAZsyxmtisLb20jEa/0xh3GfGGTu8CNs8XkExiz8qle3g52iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786302850; c=relaxed/simple;
	bh=e/9vvsTJVKVZFPYo2QTYQayngoUsuF2tWwDl5Poy+UI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2Y3tAEmF7xSSy0XGOjBtXZOzru7msWErCxBaHDeUY/wdlCduKZnjynS7pLIYhqML/KL15+SbRRTF34iJ1SgqL7QHvoZR1+7qwZI3CXR/lFmmbNSt73qN4YNsZnl8YV37m91kHNK8Tm1ScMh9LmpnA8lye49N664WBeqdQLJx+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bNvXCkmD; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bNvXCkmD"
Message-ID: <b2ae6045-6f8c-431f-978c-63158d3a4e9d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786302831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ROJLtfWfkWbQkaoSvTu2uuaIzMI91J1WeRYlRsawSVs=;
	b=bNvXCkmDi2gubwaT2w/VIMz4R0rT/HSed78AIFPjQ9TRVhDAjsD5ERIF2aYwPKb/RgmsmF
	OocH1cM6JnTM8OU94AdXppYb9xs0WgvBrmI3X0mEn1nqGb5t5WOOcMH7W14uRdlw8bhLAn
	n1tGGiG/ke2hC10sjy0BToRxghKAkWw=
Date: Sun, 9 Aug 2026 21:13:48 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ASoC: tas2783: let regmap-sdw-mbq poll for deferred
 transactions
To: Ville Saarinen <wiza@saarinenkoti.fi>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20260809101541.4969-1-wiza@saarinenkoti.fi>
 <20260809101541.4969-2-wiza@saarinenkoti.fi>
 <413bdfd6-e0b6-4a64-9e60-cfe25ac684be@linux.dev>
 <51a70023-9eaf-4d50-8b87-60fdb73cf08a@saarinenkoti.fi>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <51a70023-9eaf-4d50-8b87-60fdb73cf08a@saarinenkoti.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> Thanks for taking the time to review this. I am a bit of a kernel noob, 
> but I completely agree with you and the spec: FUNCTION_STATUS cannot be 
> deferred.
> 
> I think my commit message caused a misunderstanding. The patch doesn't 
> defer the status read:
> 
> The hardware is actually returning COMMAND_IGNORED for the UDMPU23 
> Cluster Index write, which is the only control tas2783_sdca_deferrable() 
> flags as true.
> 
> I only added FUNCTION_STATUS to mbq_size to expose it to -> 
> readable_reg(). Without that, regmap_sdw_mbq_poll_busy() considers the 
> status register unreadable, skips checking the busy bit for the deferred 
> UDMPU23 write, and instantly fails.

I think your patch exposes a problem in the initial implementation of
regmap_sdw_mbq_poll_busy(). FUNCTION_STATUS is a readable register by
default, not sure why we would ever need to test if it's readable.

Adding Charles for additional comments, this part looks questionable
with a possible register side-effect.

reg = SDW_SDCA_CTL(SDW_SDCA_CTL_FUNC(reg), 0,
		   SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);

if (ctx->readable_reg(dev, reg)) { <<< are we testing the correct reg?


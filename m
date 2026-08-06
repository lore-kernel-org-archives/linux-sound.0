Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71E23F482E
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 09:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006999; cv=none; b=ntDcSbd3mcdZe5EbfDDPqeZT3d2g1hh0ganYGyJ3rFLtwyXDSCCQfkyaOlYuSO5rqCxmankAMlbeFbzb1nIXSYeDWhvVFXeY4g0SkwOyYPxtehNvHnSQlPGu6vi+a96zHlTvOE55u2fI6PiWBXDBIPvboaf6utZwXUqz0a7sthM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006999; c=relaxed/simple;
	bh=JRw0fR3R+lHtuwrJriqnpcu5wJXandoJrD7Cmo53RA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XrAzocjI31MjoXgRnK8j6pZdKVAyY0ZjYqUlAWzY508283mPd4j9Iml2gQ4A7elksisXeRjDIefVdbwzGaxl/+V5sC85VAfh0RQ8rspeuce+2ILhE7uG9c3fwRPTwAWNXFXh0vXmAuKNK2nBdRa52+5YgPyte3nP7HpAEXwv+jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=S3EObt8a; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="S3EObt8a"
Message-ID: <db6666af-8051-4c7d-92d5-ac5714d0c70a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786006984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5wfbAvYAm10lGW8r5BMlHstDQmWSH3/UNl2w/lopS4w=;
	b=S3EObt8a6+pyb1SuDjg428nb4sDwk0UPMTusfaDI2OKleCIaMw6MIjYFX6UKhUffbOCWI9
	rhw/ngetSMvIeNwLEszeA/FkdtfgoyWqPG3xQcQEltTXRak3uv4ah8Btan/103NKWnCDQd
	lVeMZKqAnKQyynsPhm9wql6mcuHZ8Mc=
Date: Thu, 6 Aug 2026 10:57:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/8] Reword the SDCA HID code
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com,
 niranjan.hy@ti.com, oder_chiou@realtek.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 8/5/26 14:41, Charles Keepax wrote:
> This series reworks the SDCA HID code, the primary goals being to no
> longer store runtime HID data in the DisCo data structures and remove
> the need to pass the soundwire device into the ACPI parsing code.
> 
> To achieve this the HID device registration is moved to the IRQ work
> flow rather than the ACPI work flow.
> 
> Also a few small issues are fixed up along the way, some formatting,
> some missing cleanup/docs.
> 
> Thanks,
> Charles
> 
> Charles Keepax (8):
>   ASoC: SDCA: Tidy up error message
>   ASoC: SDCA: Remove unused dev pointer argument
>   ASoC: SDCA: Move HID registration to IRQ time
>   ASoC: SDCA: Move HID descriptors to function
>   ASoC: SDCA: Update HID DisCo parsing
>   ASoC: SDCA: Add missing destroy for HID device
>   ASoC: SDCA: Add missing HID kernel doc
>   ASoC: SDCA: Pass swft table through sdca_dev_register()


LGTM

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>


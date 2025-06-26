Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D9C1E9B04
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 12:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750940429; cv=none; b=KySF7q/OqPEXMj6cmy3KgJSIrfXRcGiTuCkaEhkRN0FxPy60m8uFmRaAf+kz6F8bZi1IMgGkb5RWWJTYe5HUstRmfg1asU81bGAIe9i2ydseWRh0lZN9XtnjaJLJ6MDwrpvFe6be5Tr29z4i4PF6L6wOzleOFzAMicvWscRwkJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750940429; c=relaxed/simple;
	bh=i3KNWlSi2iRl0flcSU6yS9fg9vQUwRtKOLS8m080i74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DzidFRIprOPy8WOcfMFxmkzcJXTiExS7Jj6sTgWxZjMiNJlhFBJWR/EZE77Ax0GmpTylp6fVrdUSx+vUywRJVOv7IigQ9u52LKAE1Ha7G3IemqLKixuUP9wqWHPWgvG2GoGWQLsMobmcrBMqEtPcmQ4uK3ZvemdUd6w4eGFG2i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qjoHWaKj; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qjoHWaKj"
Message-ID: <f94e3e3a-7175-4d59-9ebf-12d26fd57223@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750940425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMFkS5gzU6Wvj9OEUyYZJ3ZpJYj226IDu1QN7UCG4qg=;
	b=qjoHWaKjoFQXDHMxXdcBPh2t9zWzdn6UOldtvwGlzsbB7K5tMHtCZ1oQPgFyu6fHadGiPY
	R0ORzZ4mx+wFlQU1RY2JJBaaSXtu0Rm97fQfJNwE5SIZ7v44cStOYlCDGN41TbdNplt54A
	u4kOUiK1E8MgL6gzc3CgdMJtooclT9E=
Date: Thu, 26 Jun 2025 14:00:17 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/7] Add SDCA IRQ support and some misc fixups
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org
References: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/24/25 14:28, Charles Keepax wrote:
> Add a maintainers entry for SDCA, do a couple of small fixups for
> previous chains, and then adding the beginnings of the SDCA IRQ
> handling. This is based around a regmap IRQ chip and a few helper
> functions that can be called from the client drivers to setup the
> IRQs.
> 
> Thanks,
> Charles
> 
> Changes since v2:
>  - Just a rebase to avoid a conflict with the recently merged SDCA HID
>    stuff.

For the series:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> Charles Keepax (6):
>   MAINTAINERS: Add SDCA maintainers entry
>   ASoC: SDCA: Add missing default in switch in entity_pde_event()
>   ASoC: SDCA: Fixup some kernel doc errors
>   ASoC: SDCA: Minor selected/detected mode control fixups
>   ASoC: SDCA: Add flag for unused IRQs
>   ASoC: SDCA: Add some initial IRQ handlers
> 
> Maciej Strozek (1):
>   ASoC: SDCA: Generic interrupt support
> 
>  MAINTAINERS                      |  11 +
>  include/sound/sdca_function.h    |  11 +
>  include/sound/sdca_interrupts.h  |  78 ++++++
>  sound/soc/sdca/Kconfig           |   7 +
>  sound/soc/sdca/Makefile          |   5 +-
>  sound/soc/sdca/sdca_asoc.c       |  19 +-
>  sound/soc/sdca/sdca_functions.c  |   2 +
>  sound/soc/sdca/sdca_interrupts.c | 439 +++++++++++++++++++++++++++++++
>  8 files changed, 564 insertions(+), 8 deletions(-)
>  create mode 100644 include/sound/sdca_interrupts.h
>  create mode 100644 sound/soc/sdca/sdca_interrupts.c
> 


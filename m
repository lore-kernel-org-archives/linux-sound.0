Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192E366DD7
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 11:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771931237; cv=none; b=SaMSpofkv/oNSt8sUq89hZZIFGBQad9qstTEOiH0r+h4T4y2I5zB4GczmzSGUgNRT6OLsrDvg8vAJCSg395HZGeo06IwB+mggTkmYs990+fSCb4g/rflSTRMfYtrjYlaBxm2NmXGwlk29f+aMIaY+p8OwMFuCmKX0d1mdL6ZlUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771931237; c=relaxed/simple;
	bh=qxohOrAqVWMMsALZvrsw9xhh6JFD+3y9qm2HVyiH/lE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYbutpnX8yTAYWfUfCw7H0/sQPYGibUem1xgY4KL7dlDwVk0qXn+PSXXttFsloaoV3BDtbte+XV1QjZXK6wSXVKoxgtY+owhh4zlbLFP9T0v88waVqwoeIgMRrnQr4n2/MDV9KpAplY92a+pahZp4OxZOv8nX+9PMft1XjunQDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vtnrxgPu; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vtnrxgPu"
Message-ID: <e8e4beca-6540-4004-a3c0-08ff2bf40608@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771931234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=16I03AwjMWAg/CXkdkqR5JnghY4c6fuKDEO9x7+KZ6Q=;
	b=vtnrxgPuqaf825H4Vrex948HVqawpIEQV1aO6gCz2Qx/eBGGwoUDeD/h3b/XdEqsShEdFw
	Lfl9rl+dehOVTolE5Tq8KqsDY3dyyppL2GTu/0b6u3yZDdgbrQskNWxMWZjJx5nrzdcUaT
	2zhI5WJ9SbGn/8PVz7W4TeAsMFATcjE=
Date: Tue, 24 Feb 2026 12:01:22 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] ASoC: SDCA: Initial support for Cirrus Logic CS47L47
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 vkoul@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260223150256.326143-1-rf@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260223150256.326143-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/23/26 16:02, Richard Fitzgerald wrote:
> The CS47L47 is a SDCA smart codec with UAJ (headset, jack detect) and DMIC.
> This series adds the initial support for the Cirrus Logic CS47L47 codec.
> 
> The soundwire patch can be taken separately from the two ASoC patches;
> there aren't any build dependencies.
> 
> Richard Fitzgerald (3):
>   soundwire: intel_auxdevice: Add CS47L47 to wake_capable_list
>   ASoC: soc_sdw_utils: Add device info for CS47L47
>   ASoC: SDCA: Add CS47L47 to class driver

LGTM

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> 
>  drivers/soundwire/intel_auxdevice.c   |  1 +
>  include/sound/soc_sdw_utils.h         |  2 +
>  sound/soc/sdca/sdca_class.c           |  1 +
>  sound/soc/sdw_utils/Makefile          |  1 +
>  sound/soc/sdw_utils/soc_sdw_cs47l47.c | 80 +++++++++++++++++++++++++++
>  sound/soc/sdw_utils/soc_sdw_utils.c   | 36 ++++++++++++
>  6 files changed, 121 insertions(+)
>  create mode 100644 sound/soc/sdw_utils/soc_sdw_cs47l47.c
> 


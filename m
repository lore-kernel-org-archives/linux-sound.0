Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE332213E77
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736532816; cv=none; b=D5CyykfY5SmTFpIKFnFHz6QFJimPpKRpZ25JXw2oRuX6XJQ4MB5D8Yio81oh/SEsx7nm4guYeS2SKB4zSFP/sBspukOpBytH9xGTUUL8KHSjX7HCXRtZrdDkhoXHF60NfLsuIcMNNsfrW9hlKjEXIVNOJCNO2OlTjN4g2ccCwLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736532816; c=relaxed/simple;
	bh=40a5uDnTUrlXXF6WhHeKIhh8ASbskGyn8JuMzqfjrNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gC/i4zWVpgdrPsLHS0lwytSrrM7/jb1PtItpxQaGlrK1rpoMI7CncvUUrf+F/oecR+xOPYoKuZaIsiqsnKa7xUnP9MBoSQeyYCCsnC2xM/vzl7+sSNfaY7Dzf4sHKN0eQwB/LiuLl8vY0xD3RbAPZJvQ9qXy+1IVRHSysWpvEBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XMcyp3wR; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XMcyp3wR"
Message-ID: <7c857d1f-e520-4fde-9b84-19b071fd8390@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736532809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=40a5uDnTUrlXXF6WhHeKIhh8ASbskGyn8JuMzqfjrNQ=;
	b=XMcyp3wR3KGN1X2+IRKjreLi5axGofGCvgWEcN9dMD0NsVjsG0ibRw5x7y6P+2z4AKbmTe
	pflmRYANConjqswckc2qG3CRptEopWtVEzH1C6jgpTBqtT1Yikz2+o2ZUlkGQxW8KvShrt
	uYqSqxxYrNepGa/4GCuoWaXtz1DPPa0=
Date: Fri, 10 Jan 2025 12:09:17 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 07/13] ASoC: Intel: avs: Add MODULE_FIRMWARE to inform
 about FW
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
 amadeuszx.slawinski@linux.intel.com
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
 <20250109122216.3667847-8-cezary.rojewski@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250109122216.3667847-8-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +MODULE_FIRMWARE("intel/skl/dsp_basefw.bin");
> +MODULE_FIRMWARE("intel/apl/dsp_basefw.bin");
> +MODULE_FIRMWARE("intel/cnl/dsp_basefw.bin");
> +MODULE_FIRMWARE("intel/icl/dsp_basefw.bin");
> +MODULE_FIRMWARE("intel/jsl/dsp_basefw.bin");
> +MODULE_FIRMWARE("intel/lkf/dsp_basefw.bin");

Lakefield? Is this really a supported platform? It was EOL'ed a year after launch, wasn't it?

> +MODULE_FIRMWARE("intel/tgl/dsp_basefw.bin");
> +MODULE_FIRMWARE("intel/ehl/dsp_basefw.bin");
> +MODULE_FIRMWARE("intel/adl/dsp_basefw.bin");
> +MODULE_FIRMWARE("intel/adl_n/dsp_basefw.bin");

If you start listing the variants of ADL, then shouldn't you also list the variants of TGL?
Same for CNL, there are multiple variants, not to mention different signing keys.


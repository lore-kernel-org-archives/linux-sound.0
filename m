Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66612FDC4F
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 12:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333686; cv=none; b=XeBKM87Z8fqzvndF1GeyrLUCempTEjtfK2GUYuEIjwLDXnOPEwsUKNhkuRatbWzwXRhLeN80l060OAyl4Y5Y16Btfb9Mx6E7p0ud86fdZeEWoLeZxENZMY1Q5fqXyjy8ZYUKfmsj+gPlTdrYm43PA2OnkGOoCk3CsYjNW/hs4Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333686; c=relaxed/simple;
	bh=pvFw0RHzkhQLEmYiRk8mqpiavFIwxnqOqutVRh6QtVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EByEZaDCZzVB25V/EqyQa7zkR9e8uH+yU50QwzK2qGD+CDaLnu1N0oBxcfrby0Vnct4/J6Amu3CzgzgJNTb+3kTKKL/jxSpJqIAirKYv46H/gC3Lwec6F/VDx7d/lfuE2CItTyrZaRk4C54X8Sd9O+oxvRjNRxsMUrRwcALKqWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XNd2DO0j; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XNd2DO0j"
Message-ID: <9504c1fc-d65f-40ad-afd6-cc4bbb880b23@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757333682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vZWJx8boWdrTLlQ7bdeenKa99UFtskS7m/2AOeloExI=;
	b=XNd2DO0jXcY8mtSka0HQbyyvyTU3tlpYJo6lshdADVweFkx1xktm3LQ3ISJ8RhAE/2YYSP
	9RTlhnChn2RLHB4GTrbyF6YzzCyFTBNvWKec/QsC5BSyL3fCJp5GCOquGHd6EYYpsHCxIg
	CljF12qT4ucfgeBe3rUpgyqFDoK4kvI=
Date: Mon, 8 Sep 2025 14:14:00 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 11/15] ASoC: SDCA: Add FDL library for XU entities
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-12-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250905143123.3038716-12-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

 
> +config SND_SOC_SDCA_XU
> +	bool "SDCA XU support"
> +	depends on SND_SOC_SDCA
> +	default y
> +	help
> +	  This option enables support for the MIPI SDCA XU Entity driver.
> +

I completely agree on the need for a common library for file download. But that functionality happens to be part of the XU scope. Other things might be added by vendors for secret-sauce controls.

IOW, this isn't XU support per se but FDL support only. An actual vendor-specific XU driver would rely on the FDL library and add more things of top.



Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5B32797A3
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 20:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758140550; cv=none; b=a5cb5CYuUHgtvDkQOS3EQVO+8TCRdm969HNbskrQ1cM5WLmTWY70rXNgWpa6z2nchnj8M1UyufYRoAcX+GwASym6QaDe18jxBoN1xNPVnP+WgHPpbwugZbDX63yAbqtTAKllcMH8krvkjsh49fVUP9oz2mCBrWUiA8XK013/Sbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758140550; c=relaxed/simple;
	bh=fkVD6/Dkx5ZmPkfVNphd2pXxWxij5VFj4NtT7mXHbVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=feT/bzYFSnMYpKq1+kFmNWVNYgEVCj3NLAW6AhNhqZ6jSvyc+OlhYlCXq8pE1172+cV8q9PkoT49482zMM0CTJZv6gssFKpzT2YH98/phzL86/lCmX01IuqXHpxWxLG2ayXfnfvPBFFE9sTwWIkF2SuNoBnCUzXAtR1eqmwew64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RlrM3x3n; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RlrM3x3n"
Message-ID: <3fdabc7d-b937-435d-b644-152a9635ba18@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758140544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HC59sexiN5oGSdJ01D1lEc9II6F1uzTukaovjegeBIs=;
	b=RlrM3x3nZy2DCg+7Bc2Y+F1zslL6Or9sCfWs8jf3Kz2FbIo1Ec9+UFrm+04RHYZPK6LvAu
	mKaM1PQeYtylQPHQfrRiag/dLrY6DHB7hQc+ymYX9U6QoMV3cMyYi9SoWNaqTgJdsKqcv+
	sn99KxnCXPffLBACge/DMTpyEtgNWtM=
Date: Wed, 17 Sep 2025 20:49:17 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 07/19] ASoC: SDCA: Factor out a helper to find SDCA IRQ
 data
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-8-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250912103504.2679226-8-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +static struct sdca_interrupt *get_interrupt_data(struct device *dev, int irq,
> +						 struct sdca_interrupt_info *info)
> +{
> +	if (irq == SDCA_NO_INTERRUPT) {
> +		return NULL;
> +	} else if (irq < 0 || irq >= SDCA_MAX_INTERRUPTS) {
> +		dev_err(dev, "bad irq position: %d\n", irq);
> +		return ERR_PTR(-EINVAL);
> +	}

Checking for the range isn't bad but could this be improved with the 'mipi-sdca-control-interrupt-position' DisCo properties?
When parsing the DisCo data, we can probably come-up with a mask of valid interrupts, no?


Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377B73FCB2B
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 14:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968626; cv=none; b=OXjOIEuCLrgCQGryioybNL/MP4VgwN4cnGdtv17ieQ3WqS5a8V/eQ07zHQFo0KH2RC3P6eMCStZTw9t5bXdAsHMpx0FSPG11lfIDP7zQ7mryuLu/vne8t+zr0+2T26qBviL/Rv83iyXVZYehwPSTO2NkFYCgTqUwkxl5lV6dSiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968626; c=relaxed/simple;
	bh=gUxB+Af1mMhjvQqSMuC+ymcm81VsvVn0igIzZZ5g59A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5fdczvhnKIZrmAKgvuvbW3iMZ9PfFlvElWLJC2y+JM1rwDVZeXBucawJJa/e8nMvDORcEWBpXL7RK7/sv9hu7nmHqgH2RVzpIHfbm0D/+f9QlRb88RO8oBCi6kNSfxbnb538HbHYgbyeUZz14T/IIeeJoiKyU1TrMs7E9qOwhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=a3UAw2XX; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="a3UAw2XX"
Message-ID: <b44fd63b-3052-4333-8c2b-3d6056d6fef4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774968623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hAFmF6AcA9k/LlSxFqvnfnE1nxWEC4MuIEHywbfiSfY=;
	b=a3UAw2XXWLKhUneQjHovn4myiYhqPexNRvfAoM3OekIUPgQgU6YcbJpNa6I3JRU1klqzT4
	mrhfnHQ8S3nbamrt9yTO20I224Z3DaP0s3y+j5FEweUCO9loauK2cA2xtCoNakv5ye9ARn
	GuXZGyb9k/nB0LlxTk20FAIYRegrg7M=
Date: Tue, 31 Mar 2026 16:48:16 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 5/6] ASoC: Intel: soc-acpi: arl: Add es9356 support
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20260327095954.3465-1-zhangyi@everest-semi.com>
 <20260327095954.3465-6-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260327095954.3465-6-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +static const struct snd_soc_acpi_link_adr arl_n_mrd_es9356_link0[] = {
> +	{
> +		.mask = BIT(1),

link0 uses BIT(1)?

One of the two is incorrect, which is it?

> +		.num_adr = ARRAY_SIZE(es9356_adr),
> +		.adr_d = es9356_adr,
> +	},
> +	{}
> +};

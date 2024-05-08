Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D8173183
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715160142; cv=none; b=E9SOObrKo/hjvD5wmnf1GI1Qd9HLZor1oR1Iab4gm8Kl7G73SeAfWUiWxOLSYsfNwJaKaRGnUxHbFlhWsBN/z02WfcefPmM6Ix+M0RwVbO8htwHfOU6arktEQkLx8Hc6YF/5ywZ1Ne2GL0MGfViT+8uAtfAGz6OIAPa3jcuOdcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715160142; c=relaxed/simple;
	bh=sH79F0RuQ//HzIYaGFHaCrPhL3TDdae+O2jUomdL18Q=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=t7jyANrN9T+r/21LVHprmVe2fnhQqMGCkOiqmuI0Mn/Vq3sr2QP1llt5l1z8vzCiEBWowauvwXvmI5YsuSU/iMIr4eNFU3AcJKsr0NUarH5ZP2OgBTYMXKjf35SXHx8778dXHpep8cp6AbVe6BpRWI/EBv0nBgMKc9WSu8PhHYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=KYGGNtCq; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="KYGGNtCq"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1715160137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q26GzFC34vSonfrXi9DC7pdfahs4v04MqdWJsbYXTL0=;
	b=KYGGNtCq9s75oi/EfH3NRmvvMMvEubzUqHPB2nHNWuVdaU8XHqFg+Pir1QADenIzxmh7wH
	a6TTlnCjHRoyxYwMwFDc0UnCb2kE9QiWJMCpgzYGFDkltAavBmpKxoswcWtsI6RojWbb9F
	maT4kIcq58p3lbUH2Jct3lPZHWcVKFemf6egsQB4NjfgfDuep7aiRfMmpf8FRM1x5EoRLp
	pB1rLpxKA3sZ5IQfYWXJ51AJpJQ8eNTe8JDjM+6RM/P7MxLKrhFWtcMIuS25d1YNh0XJ8h
	HNLO0U0fr/4vajB+iZqXYnkzkaZZJlivPSKZR4Q+JqUDhpdQy1V6ULYEy8qVTQ==
Date: Wed, 08 May 2024 11:22:17 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/7] ASoC: Add missing module descriptions
In-Reply-To: <20240508091909.27062-1-tiwai@suse.de>
References: <20240508091909.27062-1-tiwai@suse.de>
Message-ID: <4d19f9665b32507f4da08d886dab3898@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2024-05-08 11:18, Takashi Iwai wrote:
> here is a trivial patch series to add the missing module descriptions
> to ASoC drivers, as make W=1 starts complaining the lack of
> MODULE_DESCRIPTION() since recently.
> 
> The whole sound/soc/sof/* are untouched as there are too many files
> involved, and I left SOF people to address them.

The changes are looking good to me.  Thus, please add for the
entire series:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> ===
> 
> Takashi Iwai (7):
>   ASoC: ab8500: Add missing module description
>   ASoC: sigmadsp: Add missing module description
>   ASoC: qcom: Add missing module descriptions
>   ASoC: dmaengine: Add missing module description
>   ASoC: topology-test: Add missing module description
>   ASoC: ux500: Add missing module description
>   ASoC: xilinx: Add missing module descriptions
> 
>  sound/soc/codecs/ab8500-codec.c       | 1 +
>  sound/soc/codecs/sigmadsp.c           | 1 +
>  sound/soc/qcom/common.c               | 2 ++
>  sound/soc/qcom/qdsp6/q6dsp-common.c   | 2 ++
>  sound/soc/soc-generic-dmaengine-pcm.c | 1 +
>  sound/soc/soc-topology-test.c         | 1 +
>  sound/soc/ux500/ux500_msp_dai.c       | 1 +
>  sound/soc/xilinx/xlnx_formatter_pcm.c | 2 ++
>  sound/soc/xilinx/xlnx_i2s.c           | 1 +
>  9 files changed, 12 insertions(+)

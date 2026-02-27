Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB74828504D;
	Fri, 27 Feb 2026 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772188460; cv=none; b=gwL4ZkvDTRNuGyEYvHnZ8VuT7kBsJ06VhW1OO0VeshJUlKv5y7pMemAm1fjPNOlZAAtnZlptDIVwk7Hn1OaLPcnOPhNt/TdOa9SqZLWPEvcE2417A2xSU7IsBEBvhBQ9WBCLSqFc37qkJMo4EWlrZk3a004drcQr+O4V66qkgfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772188460; c=relaxed/simple;
	bh=ZgKp1a3iUGuBTAN/u8cz90dwlDW6LCeWl1Nbbkp62dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKFphZ7nXLUgwsMadT/xWYtj/RPDPTnIhxvfjVUT/oDyE8AzzIBtWmvLZ0M2EwiBigG+dFC4uIVLZcCqUsD5ME2MWX6PWn7eZE8Z6K7sRe0e1DE8pLBlNag5WPI+Tv7rpjdONbyiBOeVo2jiA2dlE09U1Wk+ddSp2PqqV75oS0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7BTaY5B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7BTaY5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC209C116C6;
	Fri, 27 Feb 2026 10:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772188460;
	bh=ZgKp1a3iUGuBTAN/u8cz90dwlDW6LCeWl1Nbbkp62dE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7BTaY5B+nLXJwJf1b2ht1E1Ot5G6I34tJ7Rc4S7xT9H3gNxvZwitgTdxDwnvsWJX
	 e7zzZtnLNpABSfCd0UxKxEHONaVn9WhT87VGfE7M6CKCZGy/wUHPsVOfXlJdiAqk/q
	 vs7l5KQyNrL3Gvuc5vEhgO24HevoBeawQERDC1/VnFJzjCR3WZuQS4m0EzI3cimsjI
	 BfQWHFLFM391yWOvTivibAegSuBWgasrmuvcUBeLFRFrN9s7UkuHZM0UAR+PZSWpNN
	 tnSMWXoTfVYhrukBtuRHjFyebInNlLYeggTnWRC/cfoAo2OU+95v6xN+m8nzzKlf1a
	 /s5W5UdYlFnpA==
Date: Fri, 27 Feb 2026 11:34:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, andriy.shevchenko@linux.intel.com, 
	13916275206@139.com, shenghao-ding@ti.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, k-yi@ti.com, henry.lo@ti.com, 
	robinchen@ti.com, will-wang@ti.com, jim.shil@goertek.com, toastcheng@google.com, 
	chinkaiting@google.com
Subject: Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
Message-ID: <20260227-ubiquitous-dashing-copperhead-b2c6a0@quoll>
References: <20260226075737.405-1-baojun.xu@ti.com>
 <20260226075737.405-2-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260226075737.405-2-baojun.xu@ti.com>

On Thu, Feb 26, 2026 at 03:57:37PM +0800, Baojun Xu wrote:
> TAS5832 is in same family with TAS5827/28/30.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  include/sound/tas2781.h        | 1 +
>  sound/soc/codecs/tas2781-i2c.c | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
> index 7c03bdc951bb..c9152a950483 100644
> --- a/include/sound/tas2781.h
> +++ b/include/sound/tas2781.h
> @@ -131,6 +131,7 @@ enum audio_device {
>  	TAS5827,
>  	TAS5828,
>  	TAS5830,
> +	TAS5832,
>  	TAS_OTHERS,
>  };
>  
> diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
> index 41b89fcc69c3..9228b3b6383b 100644
> --- a/sound/soc/codecs/tas2781-i2c.c
> +++ b/sound/soc/codecs/tas2781-i2c.c
> @@ -119,6 +119,7 @@ static const struct i2c_device_id tasdevice_id[] = {
>  	{ "tas5827", TAS5827 },
>  	{ "tas5828", TAS5828 },
>  	{ "tas5830", TAS5830 },
> +	{ "tas5832", TAS5832 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, tasdevice_id);
> @@ -144,6 +145,7 @@ static const struct of_device_id tasdevice_of_match[] = {
>  	{ .compatible = "ti,tas5827" },
>  	{ .compatible = "ti,tas5828" },
>  	{ .compatible = "ti,tas5830" },
> +	{ .compatible = "ti,tas5832" },

So it is fully compatible with tas5830 and most of the changes here are
not needed?

Best regards,
Krzysztof


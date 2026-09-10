Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B33D31E834
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047155; cv=none; b=ACBkQbcCCF9vUtDWIwBSS+LT+YJKjY1N8mvejBTT4R9cN293+jvyF73SorpI+ecQrfStMgG/lWVnH/w1rB29O7DKU5rpMYBVng4VeblC7BmzwDk7pMus2hHOyN66q/s+vZxq0gzf/a5af70pBbcSrBuigAQLTQkl2Jl3eWvylDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047155; c=relaxed/simple;
	bh=1ZAbLGJDahc9vWPqXs1jafCsPa7Y1HqblW4CXPxbgTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEAEEP0i0FdV6qg9+OdgyTI7CF5F176TEXkAbvBV7Rg3dWNqDRj5go1lK4m4WXjtQJ7tOn/YBxv627eqBB5Mrg70Yd70LrmaCUEOPrWGtlyUnhzoFFahKg1Zco8vBRv0Lf+1zeWfClq9/EGs6toMUpsFY6qsO3LFaEyqLv++VVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTl+bHdu; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTl+bHdu"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6249b76a8so2315910a12.2
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 06:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789047150; x=1789651950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ndI1o0tF4rBbBQihF/KpyjTjK7B3nvas+X0LJj+FFg=;
        b=MTl+bHduE7Bru3C0NQVEW2Ea2lM+Xbbq8aNkviNnz/nhAlu0Y/iAv477jDrHMYvcfW
         kkZn7goqBBpR95S/Tv7bJO61oYRSBdJ+QrFgRVpqg0TNwceDEExrKpaWAFDMCoNEiqWr
         V6cbFbD/nMFEzTFukbFo6pk+ExCZxOmYObhKNVHUd7KIHh5c79Sq3hOY2RwTVu/B0LP/
         Z762AI9jjFyfNVrlIRRRnCxWi51TqyH61aQzXv1B4RpFNXXtP52EQYdgF7LGs0ZwKMjA
         mhXU9f/gnpK6UJkkXvXOXbgP4ABp7XV5GojbeehdCjcWkA534nFgUfp4WOf4lA1SKrx+
         BO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047150; x=1789651950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ndI1o0tF4rBbBQihF/KpyjTjK7B3nvas+X0LJj+FFg=;
        b=P9Ha64ZqYLhVXgsIXki6hu6eUtGHj6xV1c3MXmwGHuq+tC/5tRYGbDogP/HmWemq1E
         xqjCTz4NwD9obyUWPwCxH3w2hv0euVud6aDfm7aV+3r0/wuq03zImIir2Ij9B8Q3po7y
         KuOOy9YFmkx4CWDmjesCQE3JI3KLPlvVWcEWtYORR6WxM0Nd0Q/FGVtTXbv5skaRl1zH
         f1trpo9pjEJd9PsLDOWRtJ1ErDX5j1/jLkv5SASeN1pLKWfEi2X5y6sNTLeZ2gRHhrgJ
         qCh7m95vd1AHoDRqDdRTFBPgo1VqJO9hY6qR641cqJtyGhnNjoVNoF180hUr0ie0gsjL
         mmBg==
X-Forwarded-Encrypted: i=1; AKwUvBzTP1pWWQHx0IArutCpJVi9eX8Ei2q9qXWidnTQGVMsBB+ap4D2bqoMA2AOsmW8u4xk8XAZMSZEguB+Ww==@vger.kernel.org
X-Gm-Message-State: AFuF++nB3Y/jYI05+/Vi3IlxhSHDmR128FjFBxdTMqNL/A7PQml504Bv
	42suf1LD5lF3ymHIhY9n763WLhcW63Ldn5u6jUbuipI8i7YkDmnXgaMg
X-Gm-Gg: AYBFou05zOPyUZyFzgmwXC6C6P51FU1aJR9NTHnR3pE5Sa8Gu3RrHm6jjkrqW6gl+st
	kq9UUwVoyoXXARYJpmrGdI9jPDE5miaUa8ehTpPRrYo579M2oJ3SOLrHQXEC344uWEAx4kglhfo
	uVqsSiycvHXYw90elhHkCFDM3RSKfdD19JG5U1aE8Ceh4nAPKvvH27QWvZN+5ZlvJ1glZAToc0e
	aQSr3kMRTOAUObS4FhaJR4fARvSXgTKZyMohQmystIPzZWcSEaJXA8RSLaooE8i7OHPsVIE2hfu
	+FKQ8I8HeUFdeyYcqswVbyiSi4JDtJ6Ik88Ag+DFy/Ceja6xr4tBC6bvfY9lljZ4lSmVMVBMeDF
	LGKCIXygQ/3fWZf7I878qlhZAekRFiGW+3ZZQRRmVDMaqpNROvcnV6Qe8efFTJIAfzq+YQ+P7lm
	go8v8186Tb8BuwN98om1sHPfZDtn5HKWWJBDhPCSM23hVhrKrtqPR0w1rEuAjI2efa5RU=
X-Received: by 2002:a17:906:99cb:b0:c25:62db:772b with SMTP id a640c23a62f3a-c2941868ad6mr336284266b.7.1789047149946;
        Thu, 10 Sep 2026 06:32:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d581f51sm945616266b.42.2026.09.10.06.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:32:29 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:32:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/13] ASoC: mediatek: mt8189: Propagate APLL enable
 errors
Message-ID: <aqKxadkfX9Tqx8JR@stanley.mountain>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-3-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910125742.150902-3-phucduc.bui@gmail.com>

On Thu, Sep 10, 2026 at 07:57:31PM +0700, phucduc.bui@gmail.com wrote:
>  sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 78 ++++++++++++++++------
>  1 file changed, 56 insertions(+), 22 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> index 63e03a40dbbe..a901be97e75f 100644
> --- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> +++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> @@ -454,30 +454,47 @@ int mt8189_apll1_enable(struct mtk_base_afe *afe)
>  
>  	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
>  	if (ret)
> -		return ret;
> +		goto err_apll1_ck;

I shouldn't complain about this, but I am going to...  I don't like
ComeFrom label names at all.  Imagine if we named functions that
way, there would be a thousand functions named called_from_probe().
We already are looking at the goto so we know where the goto is, but
what we want to know is what the goto does.

Better to name it err_clear_mux_setting or something.

>  
>  	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
>  	if (ret)
> -		return ret;
> +		goto err_apll_tuner1;
>  
>  	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
> -	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> -			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
> -			   UPPER_BOUND_MASK_SFT,
> -			   (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
> -			   (3 << UPPER_BOUND_SFT));
> +	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> +				 XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
> +				 UPPER_BOUND_MASK_SFT,
> +				 (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
> +				 (3 << UPPER_BOUND_SFT));

Since you can't test it, it's a bit risky to start caring about
errors.

regards,
dan carpener


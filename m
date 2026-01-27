Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE43C35F8A1
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526693; cv=none; b=nCtkqMwqdwc0GkqWHlsTqlgrpkfOCHlXgeaDoy9EU9kig+BjYvryzYzq6f83hH38xfBuGOSq7c0VuGo2YrYrKGv4oIUs64VK6vs+989OVtFdF424G8ONPD/WaF8Ju1ltHpJsMK1NgznHRqsbIpB0Km8gpNpvc+Zlz605JXysTkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526693; c=relaxed/simple;
	bh=Blyg8N4zeGue27HmsSmO/bdRk6JHhRMc1NUiP/XT1BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPfphMyiXJpHKtBHdbeo93fo1KCf5Meddv22ziHAw699TzF9DTdsltHWc1vZUZ+cX6Gh2/ezX3+cOTVuDuAHpSYYZrDrrLoHWpCyQNFUaKeXHrP0bDX24mG8jFDEP7aSAq97Nz43hrywtvWCf4Lk5wi82J/MN5EiqyOyVtux4ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaI65I1w; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaI65I1w"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso7669875e9.2
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 07:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769526690; x=1770131490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiYOJIssOgLGJ3sqVKfxdywenJ86qmXkRu/RSeqz5RI=;
        b=UaI65I1wJEdhdhHNY5g4yd/swGFeeaVU5zSXxy4UlJZkQhQsSJjxT1ryKyL7NYsVUG
         vzhzUAQHljHgvTBgjeLUp3BUiKXqlHNpWkXyRSU6Qsybs9Cu9pc3mt9Y2OKkkHIIMf0b
         9Vz3akvxXe5oV9u2bbccyc+4E84//bs9PPDQu9uOYzVFKhQVTECEtgHF7qTyQP4/iWXn
         63vLNVd91YXvWryyJcQ5csQn8DJ4ZQe9XaC4SERr+OIl58PC3QkNDRMlATBlaFxjKGIU
         oiXOe4MuJXuOKIbw9+ASmIaHmisJk1UGWDL3dSwzmtni8RaskJd5Ts54h1lotns5b+5V
         n/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526690; x=1770131490;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiYOJIssOgLGJ3sqVKfxdywenJ86qmXkRu/RSeqz5RI=;
        b=JmYrCe0z8sbvuh0Q2uSMbrXakGl5KEH/Ldupg+5AXdYVmT9GKTEBwXD4bXU84KKMxS
         fp2h53s+msJxTNNZ+/jgP3K75LRkTsqcKk86/fg4T1uh+vW/yu/ZVrOHeeygjnDMaiOb
         wkUakLuSzZ6M5vazpWxMNPrwL5g8hhL5jpBX/2VJxnEip+k+czrC4Er4H6cphH/fT+oq
         8ItZF00tjWulOa10uBE/Y6CHmYR/G8K+YxVft+kugvnHCPmDm69bZVQ9cXLyLh5byZ5M
         OhTSUXJu7A5N865jnxhb2UfwKHnmvDyJptLLYxT9Zh5xly1IjVAgokZthtS3CQk7xzA1
         /U2w==
X-Forwarded-Encrypted: i=1; AJvYcCXdrDpL8X8YKr9uqVXZl9slIjnAPemZibCLLpnrfF2mP6Y0x/Hth3doCTY7yacueY1W2TzHBzCGudkS+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDz69+DSN1EaCn6DxuXbB0wMTx5kOr+OnLbLW2/ztskQoiEaMF
	gMxuPGi4bViyFPd4fvSWIzz0U54Xs/fAa4lt+M/z8MFfZR2hrIa1kRJP
X-Gm-Gg: AZuq6aJqkv1PLqAQbR8/4K0nazNLFTly4ljOteAFOB4AQl0NNw+Uq98AB8Aw/edhFKL
	0nPKwXb7ahF3PVADbMT9lRg8mHp3bby98mMMDM4z/zZjMv5EO/Qru5dyShu95VjoAzt8X1qTfBf
	PO9u272I+QvV+dXWTOaVMDVqb29IAsPnN6sa+p8tht0AKjZ6q+zfEeR1EMGhoDezOXktMptM+yO
	0aXIrQY3w5h9RASwc5AR84Hz8h0hjN/AxoE3J+8yF2XM9bhdJSv4If8cyh+dSW165A2rh9C19Au
	LFsG65ymmdu0OUr+Z0bi3fo7TwBnivBiq1xJ9qACV3g6TKcAQq4v6/3x2aMnzSm6jroWhEg89xc
	ZSS1YOG5ghBORo01EkZ8sxbzNvgbiWbXR73F3xo1Yg6YNfozXCgcx6pecwDN8O2GRrXjk8PuR7g
	i7+1TbNqDvW4IH9EHAq9XYBepLX8X+eoHX3SO5Z8wIFFfMuu8fmqHfCtc=
X-Received: by 2002:a05:600c:8211:b0:480:4c45:aff5 with SMTP id 5b1f17b1804b1-48069c755e6mr25187715e9.34.1769526689995;
        Tue, 27 Jan 2026 07:11:29 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7623sm63589915e9.2.2026.01.27.07.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:11:29 -0800 (PST)
Date: Tue, 27 Jan 2026 19:11:24 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC codec
 driver
Message-ID: <aXjRx12yPA7QflaF@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
 <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>

On Tue, Jan 27, 2026 at 12:49:52PM +0400, Mark Brown wrote:
> On Tue, Jan 20, 2026 at 11:06:07PM +0400, Anton D. Stavinskii wrote:
> 
> >  	help
> >  	  This driver provides an ASoC codec DAI for capture and basic
> >  	  control of the RXADC registers.
> > -
> >  	  Say Y or M to build support for the Sophgo CV1800B
> >  	  internal analog ADC codec block (RXADC).
> >  	  The module will be called cv1800b-sound-adc
> 
> Extra change here.
Will fix, thanks. 
> 
> > +static int cv1800b_dac_hw_params(struct snd_pcm_substream *substream,
> > +				 struct snd_pcm_hw_params *params,
> > +				 struct snd_soc_dai *dai)
> > +{
> > +	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
> > +	int ret;
> > +	unsigned int rate = params_rate(params);
> 
> > +	cv1800b_dac_mute(priv, false);
> > +	/* minimal decimation for 48kHz is 64*/
> 
> Nothing ever mutes the DAC so this is a bit redundant.  The mute should
> probably be a mute_stream() operation.

I'm not sure here. DAC mute feature was not implemented because I don't know how
exactly do that. The public documentation is very weak for my taste. 
This call added here to be sure that override flag is
not set (override feature replaces the output by setting it to constant 
value and ignoring the input, so it is some kind of mute from my understanding. 
So ensuring this off is needed be sure that DAC will output our I2S data). 
What do you think will be better to do here? 
I'm sure that is needed, but may be better to move 
it to some early stages, like probe function. 


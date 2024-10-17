Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B661D54E9
	for <linux-sound@vger.kernel.org>; Thu, 17 Oct 2024 22:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729203890; cv=none; b=i1ZESRSKvPtZAUP/jhy7yQPyLmi2FPwR6ppDdrJi4s+Ra56CUkFXRPJvEvh+/aXmozrQmjA+vnW3NuKbJY6RnkvLHdi7ax5QbxiIjcDVHez7uaxXPK6+lCJFOA2/N7nPbAI7b0LIFfQx4AqrJpgnXpiYnfwvUfa3wsTZB5t1FOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729203890; c=relaxed/simple;
	bh=hJcKXZZqP1q18W3w7Qs8TRcql16FNs7FzZ3BFU+kkYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+H0lsqahuVgFywupjq81vR2x9pEZX6ZkUYk4mlvchMFpWQagkLX/jSE2UrUEmYZ1U+O27NZXGBpKYPpCE2HdmzAuKUdToeWuWx6B10+F6Xrgsvn85tpLfl+fHdJSPfYF32O0h7kasdXj1iJaWfy5wBE4cD6eDWqVSIRxuEIKuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NEk70zN1; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NEk70zN1"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f7606199so1793248e87.0
        for <linux-sound@vger.kernel.org>; Thu, 17 Oct 2024 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729203884; x=1729808684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VocsO7a9C7Q0Qui7xbnKUaUO0s/uFElHeUCAM0fdE+E=;
        b=NEk70zN1wvuWqpNDnzS6XQ651DatKCqOHdJH5LZjIQmvjND9pnLpEBB74kWD8Ma/1w
         jeBZfBtwukGOSale24yyRbofHKfRmxDu9PiWzjE2jBdAQYEteGl+ZX5L5bzj4E0bzQpG
         J8twK02jOsd94RWjCDKijVA39AthvsGl9eUTfDs/3UQeqR7ZRfoXAd5bqJxh5v3lCfqo
         vZNdjqfEb8CLtoasAgs8wYv2nMPCu95lgfJQqRNTHuspkx/6PmzSww/MRv8wXuoHS3h/
         lgBe6MQDWUjABWwi2mN12YmS7T7hAF9RE1wWmppq+scq76nkeCkaruhd27uFIf7aOVMa
         QTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729203884; x=1729808684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VocsO7a9C7Q0Qui7xbnKUaUO0s/uFElHeUCAM0fdE+E=;
        b=SS6Kkrw5lKirK763bvYLYndm0LyE3ARP08DWfSNyKVZF850ZjJdgVNhnkuTKrnP3H4
         KZCVWw7D9RZB7NW+RyCrNe0sBWJHUk2C4+7NBUYmd/f94b+57XpEsG1DZ8YPLIoKORPH
         w36IfxSDCZRFdM1fmWJD0LDRoC0Skk1pbg9Zi6+XfInSFRyyt+8wxVm1ufKGGaz+OHKq
         yT6ywtmjRAKKnbAr7OfY6SPsMcO7XEAWcbpPO3gShh5EZ039dKzlO3X1DftF9JjnYWkh
         8bH+Bphseh9fvFL/71XV+BgU+uHgkNo3nHWf0TUPY5GNtDqvvBBUYzHb239KBjA6D6cI
         c3VA==
X-Forwarded-Encrypted: i=1; AJvYcCXSLIT3YIYTPBvnL9gz8PS4BFpAxkDLKC7QY4iV7RHBscAOP6qo4adRQIxOsLHELvTQ8tG5dIPV7Om+Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTLMP8VGq9pZ1SkgMPScjCzZ3191sBUW3tpHrtzPgFSr0hT+XG
	1mf4MllJ37WTRGZ+mBwbmaWN5l6IFi1AEyUxDJKMSPMoSKf1LCbjZ4SbsRooo9U=
X-Google-Smtp-Source: AGHT+IEa6anJV3E0K7CppiPuZYQbyLcF3shfaKC5Kb78/SiQ3aJxOxbLaEaE05j/Agx5EYEUizZnhg==
X-Received: by 2002:a05:6512:b06:b0:539:e1ea:c298 with SMTP id 2adb3069b0e04-53a15218cdbmr264581e87.22.1729203883984;
        Thu, 17 Oct 2024 15:24:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211bbcsm44012e87.284.2024.10.17.15.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 15:24:43 -0700 (PDT)
Date: Fri, 18 Oct 2024 01:24:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, a39.skl@gmail.com, 
	linux-sound@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	tiwai@suse.com, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org, vkoul@kernel.org
Subject: Re: [PATCH v2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n) macro for
 DSM_CTL and SEC7 regs
Message-ID: <nhpeyezvodnww4m4hou3of5xy7lbvme5jydpprpmj3yzr7yarj@thiyvzume4bo>
References: <20241016221049.1145101-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016221049.1145101-1-alexey.klimov@linaro.org>

On Wed, Oct 16, 2024 at 11:10:49PM +0100, Alexey Klimov wrote:
> Turns out some registers of pre-2.5 version of rxmacro codecs are not
> located at the expected offsets but 0xc further away in memory. So far
> the detected registers are CDC_RX_RX2_RX_PATH_SEC7 and
> CDC_RX_RX2_RX_PATH_DSM_CTL.
> 
> CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n) macro incorrectly generates the address
> 0x540 for RX2 but it should be 0x54C and it also overwrites
> CDC_RX_RX2_RX_PATH_SEC7 which is located at 0x540.
> The same goes for CDC_RX_RXn_RX_PATH_SEC7(rx, n).
> 
> Fix this by introducing additional rxn_reg_stride2 offset. For 2.5 version
> and above this offset will be equal to 0.
> With such change the corresponding RXn() macros will generate the same
> values for 2.5 codec version for all RX paths and the same old values
> for pre-2.5 version for RX0 and RX1. However for the latter case with
> RX2 path it will also add rxn_reg_stride2 on top.
> 
> While at this, also remove specific if-check for INTERP_AUX from
> rx_macro_digital_mute() and rx_macro_enable_interp_clk(). These if-check
> was used to handle such special offset for AUX interpolator but since
> CDC_RX_RXn_RX_PATH_SEC7(rx, n) and CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)
> macros will generate the correst addresses of dsm register, they are no
> longer needed.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A03221FDD
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 06:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794813; cv=none; b=L0b9rlJOnPNon7InrlGk6PleOZGDovmUPAMXM9Jsf84igpbAuKm9CY4pPU2M0MJxAZa/bAQGnj02Hvf3aIhcnhgPCSDscS1IPKjtYPvJyKpQIaxB6UNmbKAtRi+yZ50clkw8hCmP2Ps6iH81+/dQ1q4Req09TcvZ1CcAqFgXbXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794813; c=relaxed/simple;
	bh=OmgqGRS9lpyTrEFn41VfN0D8+8Pt7MBlL94ZsnDQY2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aG0iuTubTRFzVyMModID7A1CsY7s2hFPYGZRl9YPO4ifH4/EuCTe1cKXj/x8jx95XpWq9ajsc4FEvCaMQCYtScjMirzBfTT6mJUQiK6WAWbNfbIlZgsAqVkVuT+ZFM4QtGuqbg29Xc8caM9dqyVBA+qcs9lrCDUzvtzypAjCeRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZkWJCfAe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZkWJCfAe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3d1bf79d75aso809344f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 23:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756794809; x=1757399609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pZyWSfEXmR6en5hSqVkcdSusIQHGptuPDvKtOGXyj7g=;
        b=ZkWJCfAeAxmEpER8eSZHZbcBIUeyNMDxW6NNe3+OamKom9IPoiHjOFIe7rhF2d9vO2
         V5pu3ctbboXjATPh12YCDy5qf8LD1WFYB0nz/eGGtXim9h1hnqOJ50xKF41YtMrNwv6M
         RWYMmv4D6GldExrinUcZvMu4SLzcjkW9e1ZMy89IlX59JHSGYIUYlN69WQGnseJM5Omg
         qe5KA01zOx8lzDQaiPzhvCtrQRZvR/XDPCXhzGqhFqsGTKs4wEsnh2fweh1uI3zc4unN
         zh+18gV+cfPwDkjAJJIO9Yzym5JQjZPoT4CkIZ+t8oOggNC6ddCjU7FkHj1OLPeL0qyv
         KiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794809; x=1757399609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZyWSfEXmR6en5hSqVkcdSusIQHGptuPDvKtOGXyj7g=;
        b=u38R09XOAQeWd0427U8C7uBZvdWyFrcC4yhpz/HiQstUItOWSf9NgvIscRw2lKP3sl
         B2siaY0MLWw/RjAFipjz7na4ut9RsaIrcbEyPEoPc8Nxe7ZLJTCGZpYLOW6WKSAIdmJg
         HzVPhF6sgsz3Ppzq+DUPlkVfkolG3XZONTIhpF4BdAq78Vb6snPDvVFSKDCjGlNEciKW
         Eh150FW0VLgBUOBNbJAZtSyyKgivBeL+uCE0gGVXOX8/LLbfLY9cOPj+W1mO7yFIyXC5
         CjUGMKXYQtfXJrr+NEzVZRwwhDDzTqB/uNJvWZm6tQUWmwwXBBiBYXAFuvqv9+U7wYs0
         bwdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKMbkPwppfAVZ4q3b33e+H4Kqkp95i46ryjEZFkLk6xObd3QnfEV0ISZACAXkzQwZOHsOb13w/una+nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Z98mcj74oAPFFZOsizTxvwLZMFzNOmLLEeqnj8hJYuMphEcC
	j3GIkFuQoLMGGpxidKnZzX+EGwSdBw0h0XE3DqfbDGnPffi9opkrtYNawPfCiWNTdLM=
X-Gm-Gg: ASbGncvMNv6WTdm3R7GsjOVxopccfwAT0+XphtDHiKUfkAXRMZM6QvVxJII/+n3w1df
	TsIFZT6OB4n8g5r3lYKYegiL4y7ZgD9Z0VBOJgz/kNQs+MjSr42bPCVH8Bh+Q0JfUZpkIfClPc1
	jCbq+HxZ6MChBKXkIUVlOULXMG1r0fgaKeM19uMvcGusBBYIL40QY+VdLb7VcgUoqyIXnDOM/HT
	LSV75ewpnc9xhl2lAmThFm6DRM8vGfY0pgScqXlr17TRP88nTQkaWRCyItJJ7XwAM1paP3onpAK
	dJ/zjdh0fOmbuDnOa9EsoXbCydR8a2g70cgkkx3RTPPDtDqe6ty9wPIxl90fGvw9/PA2Eb+WWcx
	L+6SGOOLAWAG6Kjw6SRTWoI/8Bzo=
X-Google-Smtp-Source: AGHT+IHKIWGa/m0pamORceoT/ghQw4RmChJ+ED2prLmd/mL7KJlk1waSR7kGX/s+IgenapL9sr29cg==
X-Received: by 2002:a05:6000:18af:b0:3d9:c661:88ec with SMTP id ffacd0b85a97d-3d9c661934emr1225669f8f.13.1756794808924;
        Mon, 01 Sep 2025 23:33:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf33fba9fbsm18284186f8f.50.2025.09.01.23.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:33:28 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:33:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Frank.Li@nxp.com, robh@kernel.org,
	laurentiu.mihalcea@nxp.com, waqar.hameed@axis.com,
	festevam@gmail.com, kernel@pengutronix.de, lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: Re: [PATCH] ASoC: SOF: imx: Fix devm_ioremap_resource check
Message-ID: <aLaPtf-eZ6sM47yV@stanley.mountain>
References: <20250901151513.286454-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901151513.286454-1-daniel.baluta@nxp.com>

On Mon, Sep 01, 2025 at 06:15:13PM +0300, Daniel Baluta wrote:
> devm_ioremap_resource does not return NULL on error
> but an error pointer so we need to use IS_ERR to check
> the return code.
> 
> Fixes: bc163baef570 ("ASoC: Use of_reserved_mem_region_to_resource() for "memory-region"")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/sof/imx/imx-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
> index 40debc541bf9..b3248c65215d 100644
> --- a/sound/soc/sof/imx/imx-common.c
> +++ b/sound/soc/sof/imx/imx-common.c
> @@ -316,7 +316,7 @@ static int imx_parse_ioremap_memory(struct snd_sof_dev *sdev)
>  		}
>  
>  		sdev->bar[blk_type] = devm_ioremap_resource(sdev->dev, res);
> -		if (!sdev->bar[blk_type])
> +		if (IS_ERR(sdev->bar[blk_type]))
>  			return dev_err_probe(sdev->dev,
>  					     -ENOMEM,

It's annoying that I didn't catch this bug.  It's because the error
pointer was stored in an array instead of a a "simple" variable.
Smatch does actually have a lower quality warning for this but I
wasn't reviewing them since that check had too many false positives.

I've done a little hack around, so this bug will be caught in the
future and it found a few other similar bugs which I've fixed as well.

regards,
dan carpenter


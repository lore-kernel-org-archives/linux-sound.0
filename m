Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A5818DB1F
	for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 20:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779569918; cv=none; b=ROJnaSbqr2sFbdFvU5kZyqK21MPgb+qZ24CHuapf0ep9ASOUN5ZtMMzlxnb7HgMXtE2Bud4nmI2YBJ0jATMTsn5/gtxNwjU3hYpnNSqm0PtM1HUngGKUxQiFAG+RE7J1qrFXAGo0211rAYNXmBGXPQSEdbz6IDJOXvs8pyOGCiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779569918; c=relaxed/simple;
	bh=J++FtPY4eIlPHScS+iuo04i9QahISmodTrX9YmBF3kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIgHk/TSmsSM/rJgKKNAIV3cbfRuUQXkQHbH3SNEEM5g+WPQeqwYVKipVoOu/ae85qFCOFWHSh2khw8sAiLJvT8N6i7yrp8wMztuT4FrYLj9MXi6MbE1GYXTkUbMQwEAnzHI8HXNIxvXEYo+9F9aVIS+yMDw9I9AqzeeDoZ69lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtMfn/LX; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtMfn/LX"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-575320e6f2aso6818669e0c.0
        for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 13:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779569916; x=1780174716; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/QnsxPNfa/QU/x2TfZYW3mTlWPPyQH2Ds56kZ7L8H+k=;
        b=NtMfn/LXlAI40oGu2/nOkFPwMBC7BSZrKvbDdPg4wZ8o5/WKJGWv7QdetPV851Ga5I
         aV4ih1B7Mi714YHHrbHHRblAUAOvBfiTd+sMF3t0yo/DbNSepe7kM11NvoCosDavp1I1
         BNGWeuk5K2g1usYGDkO+H3t/wgOPFEBsazzESUbpmlaVGRpSCZea1uTOVAVRhWw0auSB
         LGVrDThxsfptkp83/gswrIsD83RQp3jnJBu+LtfEOV5JEZgS2tzasdr0DJup0ULCLK1x
         A0Ho01SGCCtq5yKzTJAWaKio3I/tlDcxTwv1raLCbH4GeOY1k4t9E1m1Eydn3bC3XIXl
         CQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779569916; x=1780174716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/QnsxPNfa/QU/x2TfZYW3mTlWPPyQH2Ds56kZ7L8H+k=;
        b=j8A9czyGtqCuyBKzZP9BJu+KIdeXWQuNLuhhbnNvapWq4pPmPiQATxQcweCHIxnRVL
         30TxH1ewxvIdHAmvPe5bwwi5K0DwIAARu0xbxuD3h3sertvAnusXLIkbCIZkLjsJ3j1Y
         GJysDyGdukGStHWfSd0+b2uDkq4MtlYt2x08CRI0qJKG1A4MLZI2s9I71duHgphcO0Ho
         y3CxiSuXTUH/BQ5M3MbM+n2uIPYnkmlCBBgRptvxdfBuz0UCcZpIMoihYPGX3XTyxYK1
         u2rmAXqfytArbuyiGEJGWQK/46RGH/1Ee+pppPMJg1k0A3ezl9noHHxHAOWwpATgLLeh
         AKpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QlOFKmNMP2obEXvsXazAW9fxgWcvkBG2rlPA3iF0OCPQyA4ym9o91LI0bohJFw/Y2MZKcv0ovDPQR3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ7EHPtApH4FoFuzVdKS5ENmTuZOtm4A7d02QIK98mNGYnV0Cw
	rby21F65IWJrJFUQr7qzUXs+yfLpLIw/HsTdRM/J+4Fo2AxFveFuW8Ld
X-Gm-Gg: Acq92OHF5AgtXx7BgieyRzQfN/0UEuLVn12tVidINE3qiwiP+tfi1O6KnLnjGgWkYg6
	z3tUZNwDWvYLVvApqYjnxYprFHB0qNKwvxvDpS+X6zqG3HcMF2VUxRYUSCJsoIbx37jTaRQPgxL
	uVRMxdJHCy9Dg7qW8xhHooLGHUmlExnEl8J8pDY11cJ4hm3ep1JETAi5Cn5+1MEEHVnUAFGtPKI
	MARphdOoLWmAsopw0a1KGsbTTD6xhU0SLkljsMSBeITKrqIlbI78Z7TBY3VNggN64ZW1ESRs00+
	6ZnYcEUlR4vlgXcsc+E039+tzmwlR1CF4hO06EFt4a8Da8yYW9nnIBoa7eVrjDQI4IVxPrVEgC6
	1/kmx7LmBnpifxHJgKc2P0EmMpUUJE0HVn34HtXv/CbQbW0bz9QyMDcefwlNboBnalu1dU7yAV1
	Mh9iXAKFCEmQ==
X-Received: by 2002:a05:6122:1796:b0:577:48e1:8aff with SMTP id 71dfb90a1353d-5866347ff35mr5236375e0c.11.1779569916305;
        Sat, 23 May 2026 13:58:36 -0700 (PDT)
Received: from geday ([2804:7f2:800b:15c7::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f2f791d1sm6807030e0c.5.2026.05.23.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 13:58:35 -0700 (PDT)
Date: Sat, 23 May 2026 17:58:29 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: =?utf-8?B?Sm/Do28=?= Miguel <jmiguel.ghp@gmail.com>
Cc: Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	=?utf-8?B?Sm/Do28=?= Miguel <joaomiguel.sapientia@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Enable internal mic on MSI Bravo 17 C7VF
Message-ID: <ahIU9X2DizdyQVR8@geday>
References: <20260523163652.18499-1-jmiguel.ghp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260523163652.18499-1-jmiguel.ghp@gmail.com>

Hi João Miguel,

On Sat, May 23, 2026 at 05:36:52PM +0100, João Miguel wrote:
> From: João Miguel <joaomiguel.sapientia@gmail.com>
> 
> the board's internal DMIC is on the ACP6x and isn't detected without a DMI quirk entry; this adds it.
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>

While the patch itself looks OK, you're missing the required
Signed-off-by tag, which should contain your legal name with surname
(I'm assuming Miguel is not your surname, correct me if I'm wrong).

Also, please wrap the commit message at 72 characters. The way it is
now makes a very long line hard to read in standard terminals.

Thank you,
Geraldo Nascimento

> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 7a637d6b5..a93a7fd48 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -794,6 +794,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "M7601RM"),
>  		}
>  	},
> +	{
> +		.driver_data = &acp6x_card,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
> +			DMI_MATCH(DMI_BOARD_NAME, "MS-17LN"),
> +		}
> +	},
>  	{}
>  };
>  
> -- 
> 2.54.0
> 
> 

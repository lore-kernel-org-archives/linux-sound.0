Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFE3212D7C
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 22:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778450939; cv=none; b=NLQ7jfk84DvfOP2ZVU6i7mfiEGjKYRn+nvlsMBa5Ru+AYCaNuajOmC2+mW3654g1R/O8LySEWXWt3fPHk45yA2Be+BWPuqXzAeypqNuLqCSH9BMvquavY2eqU/SAMVMCvr7NcvlAa2jnNwCkjH2NXdLzHdj9d8X3LG1JTQSrwbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778450939; c=relaxed/simple;
	bh=S0fBVOIRGgL2UwTdfget9IwI+UC9G84Hp0ApLSLI1Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Puf/81au1vMBLI+jm8wkPTm+neyYMUTi3pnILIiFNoZcBrOlBwfU/alb1+o8X+dX0yfNB2befQ2lO4vARZ7pl2ufPdQVU2rBikbJ9Q+ZSxYvOjH44tTDLjcGY70t2sHSabqdizcf/ULrXKr2m1REbrHQnBqe6DpiEJBGUvT+u5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDJMv0HD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDJMv0HD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4526a8170ceso1953649f8f.2
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 15:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778450936; x=1779055736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfH7VWnYyQuxcDxu34msfwSVF+In7u16HxC4K0jD2RU=;
        b=SDJMv0HD1m79t7uLDCuiQEHeG66QjqUpZrlLayuQlXAzfZRZb8ExqXGW7g+GRlU7/L
         p6j5x6jy06AMSbzi7nFCOIdr0CWMGONZDVCVvc+G9BtfTiNgFcIyRyAHh7UO/aKc1n/x
         wammJQD2l4gbTCWpeKHvYvsGK1eLC9pcZ/a8ggZZSFp+bJxG3vLTQBxa8vGqcrpkerB3
         8Sd0/GVrT+68q8AZlinzwEtaIlFkdEka4sbvfkh2hBlL+m5s3RUgYCCUdUdVb2i6ecI3
         EATVLQQKE4vT+HHQ+z5pvMWlL/wTV6l4fo/4mtJBwyWeAgpwZ2h3Bix1fsK1e3qMdWKJ
         v6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778450936; x=1779055736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sfH7VWnYyQuxcDxu34msfwSVF+In7u16HxC4K0jD2RU=;
        b=lvHsLSbtf2SJDgsqC/pB5FbtSK+AVdpdl1EOOTMx62dWb8NaDHzdM+xmvAgOdxApq9
         4VPEsXfD+Y3qfHVUEFma1Rj+oh8zaes1c+4R3MGErYBVw6bq/jG0Cf1Xq69ZaSOVAoK0
         wGY38AwPcaYLgaJYj6BJrwx1DUF0UC1sGNADf2G0foLKv4DdrISntnXi71XH01MWp2B5
         XmfmGxJIUn9VwnTSn+sou4powPeVlFebdi8EhA9ktqPtm1CzUbzSUKqqCA3nt2DCPaM1
         PhK1p4GPC2ir2LR5yfAFD53peTLgwMjO0g/leGLMkOXTRLua2cgT9w4/UHHMl4CfjXZX
         ORTg==
X-Forwarded-Encrypted: i=1; AFNElJ9Z94hFHP8JD3RU1S/D6s0lJ4RGg0PQ2GYkxsRn4vxyfxkT4F3OTCHAPysGE3eZcCGb45JkSfz5hsKLbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyucKgAGbwJVTWFxm0U8yzZ3vAEmi8cWtFkCNogi3Ch2srqUicz
	Dqt4FHOikTeknXPoZZEfTSKeQizC1pUtldIJf43hknlEqIdR1ru4XScG
X-Gm-Gg: Acq92OFP2Ljw7nnL3xCO/Ohn9j2ulfggsYsS5DzjT1fGfN50rfvBFkBp833vUWdlpMO
	MsVCoZvq7emr7zdirj1/d12UxXv6M8aqZtTE+xK4G9R30RcjXZIuCUOkX9/lolqSN5JkH+FvPwY
	ESjuKlxorUqVb7D+Y5Poieuf60WejGFtCzxDRVbSlxb7pGkwhlsnljXjm4B7imu2W9FmbwGukuu
	RwFWMQqnLJ92mDSIpdagSaTcf3L11aJ42wLlMrB1q7OLxKOinNQcGH72PW3VGTqGCuOYIS1fFlD
	qf/iZ2jQzVe8RLMm+L+YUr/Q5lgWctbmHXmgEv4x4AguvRq9Co4sl00MIuM32X8a23XlfCWwqT6
	N776xY4LROXJMw2LWp/0NZdeBCDrLgR8H+X02Niu/VgV3gjcJMnPfhUzXifeWxLblnvMAcWyc41
	jY/6mQlMF7j2sydPiAvfFEA/a8rpsC9Z69vVKtoA0c7JsgAE9ggMlpXgYLTb55HhyxLgH0EYw=
X-Received: by 2002:a05:6000:4201:b0:43d:7a97:78c0 with SMTP id ffacd0b85a97d-4568e51ca7fmr9950836f8f.36.1778450935641;
        Sun, 10 May 2026 15:08:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6cd75sm19908276f8f.16.2026.05.10.15.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 15:08:55 -0700 (PDT)
Date: Sun, 10 May 2026 23:08:53 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Borislav Petkov
 <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Kees Cook
 <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Nick Li <nick.li@foursemi.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-edac@vger.kernel.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
Message-ID: <20260510230853.154050a2@pumpkin>
In-Reply-To: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 10 May 2026 20:24:41 +0200
"Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:

> In the changed files, strings were copied like this:
> 
>      strscpy(DST, SRC, strlen(SRC));
> 
> A buffer overflow would happen if strlen(SRC) > sizeof(DST).
> Actually, strscpy() must be used this way:
> 
>      strscpy(DST, SRC, sizeof(DST));
>      strscpy(DST, SRC); // defaults to sizeof(DST)

Nak.

This is test code and deliberately doing things 'wrong'.

-- David

> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>   drivers/edac/versalnet_edac.c | 3 +--
>   drivers/misc/lkdtm/fortify.c  | 6 +-----
>   sound/soc/codecs/fs210x.c     | 2 +-
>   3 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index ec13155824..daa140f4db 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -728,8 +728,7 @@ static int rpmsg_probe(struct rpmsg_device *rpdev)
>   	pg = (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
>   	chinfo.src = RPMSG_ADDR_ANY;
>   	chinfo.dst = rpdev->dst;
> -	strscpy(chinfo.name, amd_rpmsg_id_table[0].name,
> -		strlen(amd_rpmsg_id_table[0].name));
> +	strscpy(chinfo.name, amd_rpmsg_id_table[0].name);
> 
>   	pg->ept = rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
>   	if (!pg->ept)
> diff --git a/drivers/misc/lkdtm/fortify.c b/drivers/misc/lkdtm/fortify.c
> index 7615a02dfc..9a9159a120 100644
> --- a/drivers/misc/lkdtm/fortify.c
> +++ b/drivers/misc/lkdtm/fortify.c
> @@ -174,11 +174,7 @@ static void lkdtm_FORTIFY_STRSCPY(void)
>   	/* Restore src to its initial value. */
>   	src[3] = 'b';
> 
> -	/*
> -	 * Use strlen here so size cannot be known at compile time and there is
> -	 * a runtime write overflow.
> -	 */
> -	strscpy(dst, src, strlen(src));
> +	strscpy(dst, src);
> 
>   	pr_err("FAIL: strscpy() overflow not detected!\n");
>   	pr_expected_config(CONFIG_FORTIFY_SOURCE);
> diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
> index e6195b71ad..eda716f817 100644
> --- a/sound/soc/codecs/fs210x.c
> +++ b/sound/soc/codecs/fs210x.c
> @@ -968,7 +968,7 @@ static int fs210x_effect_scene_info(struct snd_kcontrol *kcontrol,
>   	if (scene->name)
>   		name = scene->name;
> 
> -	strscpy(uinfo->value.enumerated.name, name, strlen(name) + 1);
> +	strscpy(uinfo->value.enumerated.name, name);
> 
>   	return 0;
>   }


Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FCC3FE7
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 01:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757555128; cv=none; b=kbRw47XqsIXBBHS0ZlbtVs64wbLsA8xOIc1SN98hy27CVwVjTXfv5DS/iR2VVKmHaQJBnhK2qqXccC3oEls33diXxWl8wN4frsLmMsJRdvSQByOeUSFxALeDuzXH9w+UVSFi1Ixr1ZZRtlldlS1NQMa9nIrU9bsvKEDeXX+EN5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757555128; c=relaxed/simple;
	bh=/ybA8rV1EJNP2W7n4pc0WrgmP7vGzSXVOSvxu8gV984=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qxfiiWjhsDv1fq7kMjfUDvF/cg2c9b+//2/elhwi4a6nmG1A60MwUY00sPrzdw4Lo1CAIUAfB+oe0VnU1GZm6fTgj1xedx9kFJ1yfnJR9ZpNK49+VRkxtLTJYDdluPNGrbcLRR5e58XisKvZcS190nZU30lKnpaW1U6EQ17d2mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DI0iCh/z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DI0iCh/z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45de60d39b7so1313995e9.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 18:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757555124; x=1758159924; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/d3COCVOI2+CAvfRN1DBcCvbUT4aDWnGnI7OhpJdo8=;
        b=DI0iCh/zjBsPg9Zf5gIIBs8oo0R6WNy4/3pXrWpcxhEJsimM02G8gjTWtIn7pQveJf
         K2qEiSQK97uXsGfpC0NhnL8TTQpjNI0mAN3Z+f6M70mh+7NiudxTzf3LLgui8YOTOyic
         AaoQFUfAN+wilkKF4cTO8FEf2gb8VDDlT8I/rU2a/0ewPZwh/zQvabCjHJrqoK60BD6j
         slmOgVy2Svk+5KIQ7ErOWegrGeO/GBrpLirMCzjooZ6GedZTPyOk12gGosvtTqV+bPWE
         Lwk7Yd5biCuhZOKqpvAhuqHPog7+jZebre5D8byehh3S6opiMHeTSs9GvVgJi3J4ryl0
         qpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757555124; x=1758159924;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M/d3COCVOI2+CAvfRN1DBcCvbUT4aDWnGnI7OhpJdo8=;
        b=CJoZqDt5oSUXTtEY3NKG9enlnXGVx1COJxqVviTQlEIkRGiF3nVuuGPlqQWPaOU32Z
         nzAgFH3COYtZ7rJvdf1PDOu9L272hBw5SWj23Zc6lyd/+BeZDLyztOP3qY70TVkUJW68
         mfVmevGd6BBn90QHNgQluu94v1V6+LWrq91FBrvmHJL6raVOgNAFaHOOqoYIGmaINZdI
         Q5H97GTbxU62axRMgxwLZYjbunYhY9hZ+84YU1QsQXMCypQ1hr4eRWAhqNVQBHIP9Tw2
         JQG+/sLnKwoaexT/zygP9RGzpY/6V1TevNPul+ByEF/uv16jDAFZGmb3WYyZp5IcT/tw
         ADIA==
X-Forwarded-Encrypted: i=1; AJvYcCW15wvBc/X50V78M/snNRKihovhxkO7a1jNZLVoYYb7sRoZgmqodLiZAXYs/MTINZWh+gPHFtuO4rqzVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtH6UycX86Xb8aTMCecFDNhmVcEtjzc2z0kOtBARhet86Vs3FH
	a8KUjODuJVKwWJFzpynwcSTXe6kk3WHUOz+0Xv2jCpRnsaCYFlcx9DH2dBlmmPK0jYw=
X-Gm-Gg: ASbGncv3yH81601Jr89rLLPwPY1C3lBlq7EtgVKJXR55O1g842PK3tH4CbrWu9HtyFC
	aMAV5OT8CS/AGji3uYafsqOoVTIPudb85W0wvz9kmaYl7lPJkvxRJ3QgD0E0Y/vA1sFMXdS3l1L
	N8CCNwDNwnSAP10L0/F1OlII/We5xXmU/32T9FH/UHx4ZLDCxr7zObfH1PqEw8YrLDBReoUscAA
	ZLO9bBUny6TFN5Rhe9P3nxLXIcLYIzVdDRQwmFYBslpfZjZt2SICdYFSYM8z3jjMLYLcb+rY4Wn
	9ISPPhx61uRxkugxlcODu9Pe7ACjGA4GQBUyRZaiJ5h3SbyATcrV0Hkqz0r8MkTwIIcPgeam7BW
	WxYfSSuHrQQu7iKnXX8+J1GyBafh45LCIqg04+A==
X-Google-Smtp-Source: AGHT+IH4eMVXJCTPangdeJtchrAmKu6Lteh/vHgi48PICpOXu0flxxJARIoGuHWpxATLSXYCQLGOzA==
X-Received: by 2002:a05:600c:1c8b:b0:45d:f81e:6258 with SMTP id 5b1f17b1804b1-45df81e6532mr38124815e9.29.1757555124017;
        Wed, 10 Sep 2025 18:45:24 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:a727:6a46:52e3:cac2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607870cfsm480074f8f.19.2025.09.10.18.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 18:45:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 02:45:21 +0100
Message-Id: <DCPLAK9BYI9D.256FT1VOPLSW3@linaro.org>
Cc: <lgirdwood@gmail.com>, <tiwai@suse.com>, <vkoul@kernel.org>,
 <srini@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.dev>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-sound@vger.kernel.org>, <Stable@vger.kernel.org>
Subject: Re: [PATCH v5 01/13] ASoC: codecs: wcd937x: set the comp soundwire
 port correctly
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250909121954.225833-2-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250909121954.225833-2-srinivas.kandagatla@oss.qualcomm.com>

On Tue Sep 9, 2025 at 1:19 PM BST, Srinivas Kandagatla wrote:
> For some reason we endup with setting soundwire port for
> HPHL_COMP and HPHR_COMP as zero, this can potentially result
> in a memory corruption due to accessing and setting -1 th element of
> port_map array.
>
> Fixes: 82be8c62a38c ("ASoC: codecs: wcd937x: add basic controls")
> Cc: <Stable@vger.kernel.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>


> ---
>  sound/soc/codecs/wcd937x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
> index 3b0a8cc314e0..de2dff3c56d3 100644
> --- a/sound/soc/codecs/wcd937x.c
> +++ b/sound/soc/codecs/wcd937x.c
> @@ -2046,9 +2046,9 @@ static const struct snd_kcontrol_new wcd937x_snd_co=
ntrols[] =3D {
>  	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
>  		     wcd937x_rx_hph_mode_get, wcd937x_rx_hph_mode_put),
> =20
> -	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
> +	SOC_SINGLE_EXT("HPHL_COMP Switch", WCD937X_COMP_L, 0, 1, 0,
>  		       wcd937x_get_compander, wcd937x_set_compander),
> -	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
> +	SOC_SINGLE_EXT("HPHR_COMP Switch", WCD937X_COMP_R, 1, 1, 0,
>  		       wcd937x_get_compander, wcd937x_set_compander),
> =20
>  	SOC_SINGLE_TLV("HPHL Volume", WCD937X_HPH_L_EN, 0, 20, 1, line_gain),


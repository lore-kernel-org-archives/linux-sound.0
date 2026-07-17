Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED83423D283
	for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 08:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275461; cv=none; b=JJf1EJUXy2orHDm4J+48U5GISaP/XENX0Ox5ZlAUJcbfJZHGHDUFSf+/SPtJbFhfDCeAI/bfpHTeAMIILL0pOoxvGivUhmQnlegi9jyqdoIlPClR+cmGzF6EqJbTev0iT48lLM09OZOEp7wf7qrPgZsvu2gAT8qiKzGUtIpuTZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275461; c=relaxed/simple;
	bh=bCSGhR4DxbYBnc1MiMyq1DyDQDRo3jRJWoVzeOkDWWM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WYDYywVtqNqyFknKT1InW1+8adMuq0gAXms0bqB3d7BcR3VKVbOO3qwzDiWA/HXiFt5cNvjAJAnjobQd7nX/qPhJWAhugGQ27zQsWTkS45kUCHbhYTRhW3H7rkV7gCDrwNmjAxTV709xjEUq8J2USYuav2WWFBDSCSLxAe+BDb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFdZB3+C; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFdZB3+C"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so3319705e9.3
        for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 01:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784275458; x=1784880258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4OAkmNxhp6Rm8jcMCdidsG/dyC+Qqj5a9o/3Z1ag28=;
        b=iFdZB3+Cm2GpWNpsuUM1eDhlXJOxRFsPqYIUJ/tQ+vdcqBQEeCYMkWHX8hsMy8Am+2
         FJWlK5GW+m82eM1d35ziLpuWT1bTTMPP6aXVbLGANLEHmfUkTdht4Zy8L2GhR66neilc
         ywrjWwc0Q8N/cdeQ+jkmrrbYnyAnstq95HOD0md4UfY1+TyRGSmYetP8qW8Yvq83xkvr
         aDC5R4ZsGHqAe4XiJnTmtjX0+B4/N5h9H/f1GQ7ISSSgkQzPca5Ipn6IPZF4lxO6ILZz
         xBvG10++OdT0sqdW2c2bpGeVvg6er7FAn60NAQ6rAMyVuujmUz1yqKUgLRtbd+Xbh/d9
         8LBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784275458; x=1784880258;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4OAkmNxhp6Rm8jcMCdidsG/dyC+Qqj5a9o/3Z1ag28=;
        b=WsZ+ehSwKEWiO0wrINrXLJMyve9RI7zlAs38T2iGW3ASLTn4bQO0po8SlmF+Rmj2bU
         aMLqBI4OMeDY7+ouARSuFeYX5gebE+nHom/E4RIPH8R5DbBv3oIjvTHC3oB2Rc2aiBLt
         TFNh/NJn/LfLPHWHUTXYelI1jDQwc6Is0/FDoimVkQlNc7h+yn/IS1UBl2owQCxhTFaT
         OjWVD30OOiN2EcrnCtEMi5USBWE+7Cd8DdZGelr2rmM1SxMk/pnAK55DKz94GvnnAb8W
         q1o7YzVZJYowOWmgAWvm1ixAS0UyM90izXzdsWcNrxgXfpwk5h4x4uBEFnA3Bf2JaKRr
         MqgA==
X-Forwarded-Encrypted: i=1; AHgh+RrAtOsfY+w9OTgpr9ceMTrhprMt/HPDMQ5DidnDYCly3BTR65QgZ2IlxEp0XXtQpm60jzZZDNURRDsQUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1M9DaSTTJLSveMu4t1etfDKC1VAAReK5vFbiUwE8hb4V2pmAD
	sbxJB/ZDBuvjTyqqtH0pzaOFbBglyndqJuEsHfY4Ojnlaa49YIhWFfPs
X-Gm-Gg: AfdE7clXsaXqw8W7BN46qps7g3Df3FWxEwi5uQe5jngv9wAUhuoCJV8PKGoN+DencqN
	mKtLZpF20l9FJp9aOc8APGFuFXrRj2flQjiEgEuzFugtUh02Iw67p1lAKbkblmUV6et/Uh8CqNQ
	oSU4+lt2kjTBoM6ppE2r6PmIBD6QPDCEwUBjx/c8L4FVJ++1WfXvaHRmEflx5Zz3pVcX+Ts4SR3
	QlhGSKgcimdyvVexZAIqN5f9KYS6P0fHsjBE2+0RnMN2yQz2OP9UKbQLAdJHGIw0GUgZM+fBA+t
	30aycG4S+djXh8WcG3fCPkqtgv3bsst0ibyQa05vzfoY59jYF1NpHcUFK38pHhf0ihXRtBjLBUr
	0l4nHYGPDZuWVECl/AhchhSbF4UWojCiT5QNm+SBx2fjZJEpJN6pOwS+xSbU7NE9PUv6aRk23DF
	stAcyPZAB/QZb7jdU/D1iulMDpkbkA99gLrIyPDVs=
X-Received: by 2002:a05:600c:4e88:b0:493:ee4d:5c5d with SMTP id 5b1f17b1804b1-4954a40be25mr16065435e9.31.1784275457797;
        Fri, 17 Jul 2026 01:04:17 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2f210csm30955275e9.15.2026.07.17.01.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:04:17 -0700 (PDT)
Date: Fri, 17 Jul 2026 09:04:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: wangdich9700@163.com
Cc: tiwai@suse.de, broonie@kernel.org, wangdicheng@kylinos.cn,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: fsl_easrc: Use div64_u64 for 64-by-64
 division
Message-ID: <20260717090415.07b0e46c@pumpkin>
In-Reply-To: <20260717070252.525545-4-wangdich9700@163.com>
References: <20260717070252.525545-1-wangdich9700@163.com>
	<20260717070252.525545-4-wangdich9700@163.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Jul 2026 15:02:51 +0800
wangdich9700@163.com wrote:

> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Fix a compiler warning about do_div() truncating a 64-bit divisor:

It's not a compiler warning.

> 
> sound/soc/fsl/fsl_easrc.c:2061:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> do_div() truncates the divisor to 32 bits, but val1 is u64 and may
> exceed the 32-bit range after (u64)in_rate << frac_bits >> 12 with
> frac_bits up to 39. Use div64_u64() to perform a proper 64-by-64
> division and avoid potential truncation.
> 
> Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
>  sound/soc/fsl/fsl_easrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index 114a6c0b6b73..d0bbe9f71e36 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -2058,7 +2058,7 @@ static int fsl_easrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buff
>  		/* right shift 12 bit to make ratio in 32bit space */
>  		val2 = (u64)in_samples << (frac_bits - 12);
>  		val1 = val1 >> 12;
> -		do_div(val2, val1);
> +		val2 = div64_u64(val2, val1);

Are you sure the domain of val1 can exceed 32 bits?
There is a comment in the patch block that implies otherwise.

	David

>  		out_samples = val2;
>  
>  		out_length = out_samples * out_width * channels;


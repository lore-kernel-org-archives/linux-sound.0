Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F82346E55
	for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275628; cv=none; b=j6P6eHO1iuPLCCkQeJFSbEGZJOHP4TsHB1WZub8T2fipbLmds6ZdnE1Fq1uz81i7aCwtijn6zYztHX2Qyp1PGm1WfJhQqllUG8ObcsoLu3yd1JPBydos1LZOLsvxit2HQe/XoMGS0sUaQ23FyYn4CrSf5oPchyXiTj9wX1Dt8Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275628; c=relaxed/simple;
	bh=t79G/LYMwsAfhRbBxWdx/4uZ2p2LpvRja3Ft/eWpBlw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P38xkfn+VVE0Chva5IeDpm5r8V5vAPeaVwkuGUkow+72lscALotm6HIyMczcihgFE1LE0mGIkHBgND9w+V3W4ztVZzRHD8njlJ8ZxfS/dbcd/hsR337Tvbe8915/7dDMQxwt2TZRNHhSd1icg5gGgC2sPeinaZBe9w5mMPp2Q80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5cr6cRz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5cr6cRz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so21416545e9.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 01:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784275614; x=1784880414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hku7lsn7Y8coCKFT6sYY6u36fZf6kr/SG26MYxf+TCk=;
        b=e5cr6cRzz5e4GI/zlKWasQxmrWohH2YvDzAhuA7NCIZt+i2LmOKMF/0ke42iLicACl
         rY6nOO2dF2K9IVDe/9tHytKkPP+J8H+35Dqtc8xQD/9CE0sQZQL2V/W/dTAlnr6mrw87
         dRhK3wzu8mIma4SUoZPzgmDBGrixOfgV/pZPAOokH5ZcmwETbshOodnuggtKhaSIjuLV
         rW0+SliaExGfe+PVkFAvtt+y6Tj897ef1BvymqyR8PSsMtaUUR9CQgNKZIXFvlTFKIAJ
         WZnCe7ToWbXQz3++ueYZIBBgkLC5xSkhmbfGCWuteFGIdKDStVqjOfkthJTf2Aox7Vd9
         i7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784275614; x=1784880414;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hku7lsn7Y8coCKFT6sYY6u36fZf6kr/SG26MYxf+TCk=;
        b=eH59kUEB6Zz1c2GgEjPIl0nf82uAchQn5woYQcpFKodGTpbi1t2ogpYIDMvWNL2C1n
         7uNsnAQahVaJuRLeym+6u+f8hGJ3LITd0+ACoTlE/LiL0FWzqhlfM3B3zW1lv5QVBC9w
         7v51mqgas6Z/sWZK0Updcf0krloUsUsN5MlNvISpm3XZcH6gNxSzMwDc67k0pkAL/8am
         BnWZvR/3BA0SL4J07jie7baACj6eXHovcfkrsp7O+DEcCFpg2f6/3rPkyoWWDkjF7AAC
         Ibl70TBPxM4sWJAiaNghmntcAkPQMudShxYUIIFexR1ADICjHz7X5EMcV5O3V8IQ2eV2
         O7bA==
X-Forwarded-Encrypted: i=1; AHgh+Rqs6QFPYVWfsQcHO4xB1exZLDkYhj1lpvsN8u12h9/VpHUr02fn6Fkf2sk1CygUJSSwljNAknUwMxXsUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk9SNO+/UNdSSqMo1hwGn4lszrrFueORtYRke3xu2GNsB4DdT9
	DqfSO8hYfDjCJZi30Vb7qZm3AgBCvuyOmigqX5rYEa9WbfcLV/AdYfil
X-Gm-Gg: AfdE7cnw57ig9asw0+EeNlh+cqSvIHj0m+iJfhBin9K2s0v+k40wUQPFqrVtYWqD9Tg
	zL+TIVbMzn5f7lXgJ6tw+kOMYDosRKJMQ8UFd6FOq3isPC+aSyKa8NqQzcqQAzbe0/ySRmvdVUa
	WqnI2st+RBsFwEnvrdyPJUzgdK2GqWDItUoaBwmYniXqdM4r7FqQr0brP9KLHgc15HPUkumO0wn
	dqqwkKOXwgZBYB2TgiHqLoNA1uKjiYepKPvuhVWsEHFD9qz0qPzni4Kuzvo+Z7VOv1U0I4uuDlj
	5PeDOSq6qyxWwCCDOXl5/yZ1AyJ5FFgXFh7MOa7/9qR6WHLjhoHqDsLVISARW8yodVCYh+pa5ob
	a9MxreiJg64o+I+NsVMkMIem5Jd+QBY7W+7Q2O4w9XoXNdEIeNLu10NB7kny3q6fX1YZHs0MdU2
	QTYBOkkXDJTRP2U8Vpt9ESXI0Glu20WlyDG1qf+Qc=
X-Received: by 2002:a05:600c:4753:b0:493:bc4b:b8c with SMTP id 5b1f17b1804b1-4954a413024mr16451125e9.38.1784275613708;
        Fri, 17 Jul 2026 01:06:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a47e64sm38939555e9.8.2026.07.17.01.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:06:53 -0700 (PDT)
Date: Fri, 17 Jul 2026 09:06:52 +0100
From: David Laight <david.laight.linux@gmail.com>
To: wangdich9700@163.com
Cc: tiwai@suse.de, broonie@kernel.org, wangdicheng@kylinos.cn,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: tlv320aic32x4: Use div64_ul for division by
 unsigned long
Message-ID: <20260717090652.6fccc633@pumpkin>
In-Reply-To: <20260717070252.525545-5-wangdich9700@163.com>
References: <20260717070252.525545-1-wangdich9700@163.com>
	<20260717070252.525545-5-wangdich9700@163.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Jul 2026 15:02:52 +0800
wangdich9700@163.com wrote:

> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Fix a compiler warning about do_div() truncating an unsigned long divisor:
> 
> sound/soc/codecs/tlv320aic32x4-clk.c:169:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
> 
> do_div() truncates the divisor to 32 bits, but parent_rate is unsigned
> long which is 64-bit on 64-bit platforms. Use div64_ul() to correctly
> handle the unsigned long divisor across all architectures.

And the code has to process the same values on 32bit.
So the value must fit in 32bits and do_div() is fine.
Doesn't 'fix' anything.

	David

> 
> Fixes: 514b044cba66 ("ASoC: tlv320aic32x4: Model PLL in CCF")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
>  sound/soc/codecs/tlv320aic32x4-clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
> index 5c0a76a4a106..9359492051ad 100644
> --- a/sound/soc/codecs/tlv320aic32x4-clk.c
> +++ b/sound/soc/codecs/tlv320aic32x4-clk.c
> @@ -166,7 +166,7 @@ static int clk_aic32x4_pll_calc_muldiv(struct clk_aic32x4_pll_muldiv *settings,
>  	 * math in the kernel.
>  	 */
>  	multiplier = (u64) rate * settings->p * 10000;
> -	do_div(multiplier, parent_rate);
> +	multiplier = div64_ul(multiplier, parent_rate);
>  
>  	/*
>  	 * J can't be over 64, so R can scale this.


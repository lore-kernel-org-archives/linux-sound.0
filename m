Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779B985937
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376710; cv=none; b=f+xx7a3E+A/foGAfLILjcgaP3kGsu71/xluRk4hr2QNGC3NaBTgIAnIIZZA4y0XTle1YMniXxPQnfunXGzLuc76YwtZYX/FmlB5Du/DAhy7H4Eg3nOyTV8nBf5IekNk2Ey93BOfmYk8rs9JpdWRs+rQivmbXXzSxfGDZc2uyQ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376710; c=relaxed/simple;
	bh=+MeltPZVNKwDT4s9LWJGLhPwYg6oTgYBzKVCn15VZsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0WzdcSQ7e884lN6GKE1cvXihfK6dfoDs5JnJKruPb8Kp3dG8ZFIhI8kIUe1iUV/SQJgEkLmbja1bxAnmu4aRs9unxPjrh4QQEU5DofFYi9numlib4EViHrqAhZOMRrWH7I1huEjSAsC7vfJJ3oaUJbhTs2sh26uU5xrTS6PXMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhxvnGY1; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhxvnGY1"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-513d717269fso5505964e87.0
        for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711376706; x=1711981506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O3PUtNY4boQ+ipy4wQYd09otPfOvXLpDaCkOQ9UXG84=;
        b=hhxvnGY1pu+otW6Yd/0JGjmzbva5HqMncBVKvci/73gkV2z6H+efQDQXzGMIV2XISZ
         jJF8mP3YVIpGKtbpdbfxywzfT79JbH0+hVju3cqQY7KL5cjuWiEDjnW3OzPN0cmSy1cI
         lsH292aWVY19lCEV03oHbzl07vXKOOI2dCO39ioWj5Cxi7hbEoZZaVMqjUl4T1GI88H2
         VmsSRjN/fBIGUF2lqdFhyUOLfoAjeI55+9ukbfX7N3OcV7WOFP5Uq/O67ffH8cig9Jxt
         p2kXx2XX6x8WXKO8er+1/Nw2bs1Ewdg3fT8v0Zu0sAspKSInI36DCTOIPjEB7ahm/bNj
         tq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376706; x=1711981506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3PUtNY4boQ+ipy4wQYd09otPfOvXLpDaCkOQ9UXG84=;
        b=fJQEIkdomH8FbQhffsISDIQB3y9iA3iSW4DfL/nnO81OUVXpFPU7u+oQoVYKuGmrpA
         HinW1DrJFblf13xRQAfMZUwDspMf/9e+wQvMHFenU/sircgyoQDL9yhVU5C0y7ni7m0W
         wu0/7yWYvPJPIFyzggZszmsEQGmyGa0TNTZK+YfZH6OT76O7Ka1ZxqRyjMXQW7Ijm1lN
         8A3o2sa359aH8+t3a3vI901lw0mour6mizXIaXlbxK6T3HyCDSETOwUPCDPscxJUcxln
         yk8vuptpTFHxVyi2hcgfa0A3SYvnZj9ULqXCBPshqRaAwvGt5wKXzdCDmzhXQ2EUYu0h
         0CIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIIFgD05tbjmLj/qGhsJFIbeFiBZwKbD7PKjG2akrDP9Be10B/rlyyMy+DwnieDy9Lvvw5pdJnUI1WTyc++OtyP88++J4OKUn79LU=
X-Gm-Message-State: AOJu0YyVxD5apgLhfOZomoPMEGsb/rdBK85QU17R1ZFubUppgBFcy7zb
	/1va5E+5R35cjnxvVxgdjwVHxgqZyEfy4y+ugSTpbCwWZUqn3WAWrkVbabeL5Lc=
X-Google-Smtp-Source: AGHT+IEFidCgty+v00DMTxMPtnXdVdXzQmlAggnT/0h5fv4Uf17UIa5tj3pq//IwqDLEoDELOZO2Xw==
X-Received: by 2002:a19:ca14:0:b0:513:23be:e924 with SMTP id a20-20020a19ca14000000b0051323bee924mr4375709lfg.59.1711376705571;
        Mon, 25 Mar 2024 07:25:05 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l12-20020a1709062a8c00b00a45f39b2d16sm3104885eje.200.2024.03.25.07.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:25:05 -0700 (PDT)
Date: Mon, 25 Mar 2024 17:25:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: arnaud.pouliquen@foss.st.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: sti: uniperif: fix the undefined bitwise shift
 behavior problem
Message-ID: <5d850276-a872-45fb-9df2-2b72479787be@moroto.mountain>
References: <20240325034032.1031885-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325034032.1031885-1-suhui@nfschina.com>

On Mon, Mar 25, 2024 at 11:40:33AM +0800, Su Hui wrote:
> Clang static checker(scan-build):
> sound/soc/sti/uniperif_player.c:1115:12: warning:
> The result of the left shift is undefined because the right operand is
> negative [core.UndefinedBinaryOperatorResult]
> 
> When UNIPERIF_CONFIG_BACK_STALL_REQ_SHIFT(ip) equals to -1, the result of
> SET_UNIPERIF_CONFIG_BACK_STALL_REQ_DISABLE(ip) is undefined.
> 
> Here are some results of using different compilers.
> 		1UL >> -1	1UL << -1
> gcc 10.2.1	0x2		0
> gcc 11.4.0	0		0x8000000000000000
> clang 14.0.0	0x64b8a45d72a0	0x64b8a45d72a0
> clang 17.0.0	0x556c43b0f2a0	0x556c43b0f2a0
> 
> Add some macros to ensure that when right opreand is negative or other
> invalid values, the results of bitwise shift is zero.
> 
> Fixes: e1ecace6a685 ("ASoC: sti: Add uniperipheral header file")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  sound/soc/sti/uniperif.h | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sti/uniperif.h b/sound/soc/sti/uniperif.h
> index 2a5de328501c..1cbff01fbff0 100644
> --- a/sound/soc/sti/uniperif.h
> +++ b/sound/soc/sti/uniperif.h
> @@ -12,17 +12,28 @@
>  
>  #include <sound/dmaengine_pcm.h>
>  
> +#define SR_SHIFT(a, b)		({unsigned long __a = (a); \
> +				unsigned int __b = (b); \
> +				__b < BITS_PER_LONG ? \
> +				__a >> __b : 0; })

The code definitely looks buggy, but how do you know your solution is
correct without testing it?

I don't like this solution at all.  This is basically a really
complicated way of writing "if (b != -1)".  Instead of checking for -1,
the better solution is to just stop passing -1.  If you review that
file, every time it uses "-1" that's either dead code or a bug...

sound/soc/sti/uniperif.h
   132  #define UNIPERIF_ITS_UNDERFLOW_REC_DONE_SHIFT(ip) \
   133          ((ip)->ver < SND_ST_UNIPERIF_VERSION_UNI_PLR_TOP_1_0 ? -1 : 12)
                                                                      ^^^^
This is dead code

   134  #define UNIPERIF_ITS_UNDERFLOW_REC_DONE_MASK(ip) \
   135          ((ip)->ver < SND_ST_UNIPERIF_VERSION_UNI_PLR_TOP_1_0 ? \
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
because the version is checked here.

   136                  0 : (BIT(UNIPERIF_ITS_UNDERFLOW_REC_DONE_SHIFT(ip))))

Just delete UNIPERIF_ITS_UNDERFLOW_REC_DONE_SHIFT() and use 12 directly.

[ snip ]

   988  #define UNIPERIF_BIT_CONTROL_OFFSET(ip)  \
   989          ((ip)->ver < SND_ST_UNIPERIF_VERSION_UNI_PLR_TOP_1_0 ? -1 : 0x004c)
                                                                       ^^^
Negative offsets seem like a bug.

   990  #define GET_UNIPERIF_BIT_CONTROL(ip) \
   991          readl_relaxed(ip->base + UNIPERIF_BIT_CONTROL_OFFSET(ip))

regards,
dan carpenter


Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470F3195FEA
	for <linux-sound@vger.kernel.org>; Fri, 11 Oct 2024 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660768; cv=none; b=RasHG9rEJyTvvtSnUS1+a7v5FBuFI1pmAGQjHsqYgsDsu4tAkjBET0lXsUM1gj55d3Ss3Qclv4XQWROR9PU1gMF0CVwhMKif2qa6jTbcF18PZ355XScjJUBPBdqsb1abnoKGzYw6DK70gBgGC0DcwQ9Cly1oFAL3jywLCvbdFGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660768; c=relaxed/simple;
	bh=bRJ4Y1/jdFojuUij4IeYNNekIWbJ2nzLiEuafUuGJn8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cKp7VIMfbtOW7+2LsPwJB/xwIIf/nlt8AGGmECXa4zKe1kBYWxagVxRpOehZ9FjaKo7gnYlqeUpDS8Vtr720VQsYy5iIE4LSUBgceWTQBXQcLNSPiNFndOumQeVbMZz1QUqTWanpBvIp5CgmfPlJch/gD6qhZPm4Z+UrBaXXKH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G7vfvnhP; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G7vfvnhP"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c928611371so3009183a12.0
        for <linux-sound@vger.kernel.org>; Fri, 11 Oct 2024 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728660765; x=1729265565; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Rat4MPBAsLDnNiR+W9/KxSukyb9q48U+Dl9neWjYf0=;
        b=G7vfvnhPR+1WBPKyio3JrSyJ52wjfu/6z3FP2FHzp2HY+d5NdOIHgU6LhY+pFCMIM2
         jnrCRYSSolupvAOFRuULP5hp0SJt039ORqaiUloFg6wTRlUIIrr56cQ3DzkW6k/yYkT7
         NjnNalltEPMuonFbSm6+QXI0qofrBrfSQUhIn3+CmSZMwJG7QpK6yl56sTaJhoJaRaPz
         piy051V0uMa5MpYPD6r0oJ/pAUwOPcj5BXUpOvcrJjTg/dZiiOpiu4gYZGpwsKq3pcHE
         FuQ7kI9/DLbPPJ+Gdgvcu/k8OdDAILuADbVhd/zRqyDb+DuPmmZOuV0KbRTnrDn8H3Ux
         03Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660765; x=1729265565;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Rat4MPBAsLDnNiR+W9/KxSukyb9q48U+Dl9neWjYf0=;
        b=FVgE1QTvugBhvZmQk9LY5O48Ze1tzWB0K8R4iuZ9tvi8tTXYYmQxOSFNVcekPaFie7
         DQg8h/AFn8cafWvNXVePd4v9EwaLb83yNrQpxx3YvMrx+vEFiZxYNdS8/DiXD8FCuQ5h
         IA7IUwv7Sxk7bnw8xO4GrGga+L8anE4avU3pwkUBtZ78KiEawE8nwk/JZuKrhkNN6Mml
         PkL9Tpal8AcdlgZA1kjmNABWEQSDwC9BrIbgVFQHWji0Aia2S0aW6QnBwMB/WOqC4Xo7
         L1uycMNKfZ5DSADAFiusd/j58mgRuwsVl0ez6iY9mlSDwp8a9Zd6uQhMr/KlWhYD08mW
         eFyw==
X-Gm-Message-State: AOJu0Yze+/4GiLY2010P5Wp1exfrCbS+tEmCfhBzstrxRDkeRfQyBIRb
	CtaLwGO3hPdADmZzREdWaHZ7pTAVDfkUb+kq033C4xYIvAZgUhafLh75KwhyKnc=
X-Google-Smtp-Source: AGHT+IG2RSuYoUetJ32zLi/kp0cBZ33Kg6Bh/AWm4gP1CZLAPGxS//Bmvvsy9YjdHMWJKgnFnWy8sw==
X-Received: by 2002:a05:6402:348e:b0:5c8:8381:c308 with SMTP id 4fb4d7f45d1cf-5c948c8831fmr2027670a12.5.1728660764556;
        Fri, 11 Oct 2024 08:32:44 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c93711adacsm2049796a12.37.2024.10.11.08.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 08:32:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Oct 2024 16:32:42 +0100
Message-Id: <D4T33J6B5SPK.25S50D16VMDRI@linaro.org>
Cc: <linux-sound@vger.kernel.org>, <srinivas.kandagatla@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <stable@vger.kernel.org>,
 <broonie@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <krzysztof.kozlowski@linaro.org>, <pierre-louis.bossart@linux.intel.com>,
 <vkoul@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: qcom: sdm845: add missing soundwire runtime
 stream alloc
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Steev Klimaszewski" <steev@kali.org>
X-Mailer: aerc 0.18.2
References: <20241009213922.999355-1-alexey.klimov@linaro.org>
 <CAKXuJqiK3BHT-=3zyT1tbunpNF1b_gyZUAd4EE2FY2r7TbaXug@mail.gmail.com>
In-Reply-To: <CAKXuJqiK3BHT-=3zyT1tbunpNF1b_gyZUAd4EE2FY2r7TbaXug@mail.gmail.com>

Hi Steev,

On Thu Oct 10, 2024 at 1:33 AM BST, Steev Klimaszewski wrote:
> Hi Alexey,
>
> >
> Thank you so much for tracking this down!  Was experiencing the same
> thing on my Lenovo Yoga C630, and testing with this patch, I no longer
> see the null pointer and also have working audio.
>
> Tested-by: Steev Klimaszewski <steev@kali.org> # Lenovo Yoga C630

Thank you for testing! I didn't know that this affected more than one
board but I was told that it was long-standing bug.

Best regards,
Alexey

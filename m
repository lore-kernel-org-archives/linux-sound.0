Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5C33939B
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716684; cv=none; b=ttbCNJEFj8f1e9jubS6HfrigM91JreBniReW6USeLLNe5m/chV6T7nJb06kCw8o7DD/kIDfT9wr2M8rq0yD44mVo85u6KriRi3xPjWNJhJM4S6Bt2A2hOVMa2K1sZUp5aGfZLNBLqqqbbUdFbYS4avXHjPcuLTuySlpjvLim1/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716684; c=relaxed/simple;
	bh=VfPcQNB4zjsVSd2TPRs1QxZs/yJrY5PGJosUGRLu2jA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6Lb8k9d1QG3SgVjDrQEiQCki/GL/qJvrZfyn+T4P93VIM2nPU7MMIOIm+HANaH4XiHWgZOFDQfgevAUmrKl8v8IcDWoY8ecaKt3paWF64oKSewalnlQ9ewd4x03zjJjvplsGEyUBrrFfP/OHRovHi5+z027cpsi3A3o7MsTUlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOdXNXki; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOdXNXki"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49553515a8bso45395185e9.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 03:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784716680; x=1785321480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lCysCzTEUEBvOeVy0VePsNIZ83v965Z0gzU2Gk56mFk=;
        b=lOdXNXkioB3anyhjQAmkPrbF0Op6YXsugTDaMLuxh0ZV/VOvdsDghbxWZfkgrI5x+9
         ImabycIzFpg8Hevpxf/gOgRygXQ+6/GJvMi1lBeCI4iNiXe+a2iME8R/aF+IoQOZb+Vc
         wVOsX5RiQNj+grMhfHvUCkWo934CClALNeFOdKFaf55+vHz87zSvyrwhrjYBu6flqXZT
         tMuv8aqp3IA3rnjXtGr56ckZDweMbwWxPCAQUhxheLaj8fkUH/xxZ7BSrb2gLCOIr7nx
         fqPoOaitumk3ICUusH3pUdE86qar7131wqPXU0LPG0HHa9sjEEPysLRTGOFwtWsSjyYZ
         QTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784716680; x=1785321480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCysCzTEUEBvOeVy0VePsNIZ83v965Z0gzU2Gk56mFk=;
        b=oHWKmpn1Tk2VmPmZIjjoOwyLaCxsiFCltlA0vr4cTWB2zP5I1u5yQIJnQehwwbtRlh
         dUYR7C9xGiwEHDs2X03LQFfqzgN1oJ7572j9TVyYins4PUW4ZKq+pUfBPO946iOMRjj7
         syCEtyE6SIAoAwanBifbmWqvxRMcqe8OAgOtDt/xAkHephLzRfLXksPJUVpt3tS6mUmv
         NrgHt/lzfJxnj09lDk8QDEusqW7QDwGolxAmF15l4YVdEDZT43aYukGzThmyQ0heDLlz
         YMh4tICuPY5KlS1guMTpyKz6vK6jt05Rok4djVMI2LrDYFvmamouo2F/SxtO1KrVb6h3
         ooow==
X-Forwarded-Encrypted: i=1; AHgh+RoXS+8em132JKVL6nFGXuiSPPMXY/r0TBtZK9aKN4eWBnTNTQNbl7sBCA70oSpmZieRrpslDTzFoTU3Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBjP/x4Jt2yNuopTWj8yTBeny7KIdlLrzgyuGl/Vv+XRHXKcLG
	t0vvREz0yMVR7mTOHZFLi2fH8bi0fjKpGn1ghEfC404Vj0acOQ8F84Mz
X-Gm-Gg: AR+sD112pj6lSk8Wn74f6kNNRF5eiSk17YzTp86kq+sdMW7YbMkMGCHEULZfc2mDYet
	JA2kcetzyFEU7k5Z+5ZM2DpdW+oJuB6h52X4C110K+I/0eXFd4R6XrN9ntfMd1rXgbvgvXW2pvO
	SE1tRL4iy8tpdWvgRSWC1kLUNodIzwNthKn890q8bc03eKeyK4QgkqGUYfJCwkhNN/d/qlxlQ9L
	SdlXd6bUrrtVcZgawWOYQx939F2rGdDg49yAFgH2ns3eQgYvXdET0O+LPWAT6zhVj9dlogpVMQy
	w+56qWSeq5zOULkDjCQp0fm4IG1n1cJBqq8nlBQUg/ByyGeUfoUeDceDMPIf8QlVbWrbOB6hTTY
	Q0+0DgsfWH9VV7Pn41T7KVaiBHnHTyWCyTyjePURnvQskDV3tACPGU0O3uU32W7WOpz0LoFSa5J
	B/tUEEwbdfNmh4NlPU8jPfa3PeB/8478YZvqd5ZqEXkYPxiDZW7E2NBxqjmA==
X-Received: by 2002:a05:600c:a44:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-4954a40c014mr237056015e9.32.1784716679886;
        Wed, 22 Jul 2026 03:37:59 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bfed7sm148687275e9.11.2026.07.22.03.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:37:59 -0700 (PDT)
Message-ID: <6a609d87.87c5160c.1accad.0f33@mx.google.com>
X-Google-Original-Message-ID: <amCdg_gCgyMs-TDv@Ansuel-XPS.>
Date: Wed, 22 Jul 2026 12:37:55 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
 <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com>

On Wed, Jul 22, 2026 at 10:00:34AM +0200, Konrad Dybcio wrote:
> On 7/21/26 8:12 PM, Dmitry Baryshkov wrote:
> > The Storm board machine driver targets Google's IPQ806x-based Storm
> > reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
> > has no upstream device tree, no active users and has seen no functional
> > changes in years, so the driver is dead weight.
> > 
> > Remove the driver together with its Kconfig entry and Makefile rule.
> > 
> > Assisted-by: Claude:claude-opus-4-8
> 
> Using AI to `git rm` is definitely tokenmaxxing!
> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>

Honestly I'm pretty angry about the latest changes on ipq806x. First the
dtsi just because there weren't device (it's ok and understandable) now we
are starting to remove driver...

There are godzillion situation where there is a driver but absolutely no
dtsi. Lets remove the dwmac driver, usb phy, pcie and everything else at
this point and treat this soc like it's a 80-90 code...

I will post dtsi with actual device for the SoC but really I'm not
following all this hurry in cleaning code for device that still gets used
and actually some company even produced new one (even if it's EOL)

-- 
	Ansuel

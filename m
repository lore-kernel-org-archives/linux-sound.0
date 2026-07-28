Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D694740EB90
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 08:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228459; cv=pass; b=Igm4dpw1jGOoaH+5vrt1HqBMyftD6bVidFDC3diSNGRlQ0FDjzRwOnJjPtUZ/7Q1qfOSX3fpoG+qXwJiZOIw/YD0fY08Pi9fg43u8hNtJiAQ/XJGgUMCZlOJoPR+uBOsivTLMX6LvqCNrasc9px9ifLiSyS8yNjy2kI4DKokBlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228459; c=relaxed/simple;
	bh=nUgiWHj8M6EMlChF6xF1PPicJdCJitqgYqZHMNHadU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WjoVmiq0YwlNmed9tHZoTmuPv820BblZ7TyojUXQEed3Tsd5zxnJd3a6yCtcUhkI95b6EqQBLjfBWk9hzFhZA4qsIHpYVL89ngn+ex2CJfhN9U8YIXbJqo0ehmT1qIvJFafV3j/ljeH48msH6S4Ao/tzEhlhxq0h6W/zCqyfsTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sisXdLhS; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sisXdLhS"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso2159360a12.1
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 01:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785228457; cv=none;
        d=google.com; s=arc-20260327;
        b=WvcbwU0tRCKOq8REsfmgxSiBtTIZJFRnYJq5+zNphSJoxweEBY9AeFkAAQQHkfIVPV
         fDLEOaQsU7FFnbp2/56EN/hS3AX2kP8hFmKnEBKR+3ZGSixIugshcUYkHkqp1AaS7Xxz
         plhs0+f6gtl5kx1l/uvjorP4xVZZ7+SKGO9aK1DzqMAaBy7attBrIMQfAyBYRFFuf//Y
         s+D891AHLE7qBmdxvOnX18ERlKisyx7G8lavtpvCveGIn02mWV/7ql8Ripln+yV+9YVa
         L+ruHx2v2hgrKHT3MG/0LUMmR0zPJI6/FtmTxxnGcXg39GTVtfBgs53FSgncZJ3F0xak
         LX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nP4HsBZ2ryd+aoQiuxtPx8gYqpKC2rpWoi75NWLmBGw=;
        fh=Bo4L7LHuHJGjKx1G03GkNLKkAe+mKFfl0peE7fWutxk=;
        b=avmRZ/49hUyROHZlOOP7Q9VGlcRGovfni/pEQ6moFUILHjLYQssGgaWsTiTNkEFzCj
         JKSxuDyo4F1rxKYlxve9geduGWNShpnITOWJhQeDW+DeAvib0zykEMAIzhjvUiPkCPbV
         8fk7L//h2si0dUcOSBJUo+8npgGMwPAVIJ2aIsuOld6SqA8oWMYAywisZkjpiQBqGczA
         dZ/MM5jRK+pvU1RIwFWwZ8JTcoYOUI2ZsgQAMRqo3fWo1hBGLvoP3R3eNm65kOtosPtR
         vn2RJJKgRE+XARl8r7hs8mUw4ma7LctrWAby0zlCiAH68riMaN6yDA+m9gp9GtzpKi8p
         OEEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785228457; x=1785833257; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nP4HsBZ2ryd+aoQiuxtPx8gYqpKC2rpWoi75NWLmBGw=;
        b=sisXdLhSczWQzlW+TRlvAm3N3dz+K3pe4ZQ65TU8RTQTDkOmhGW4rsjAY60HVtJ3ai
         b7nq24PfhLYkHARFySBBOZbC1g5mMhkYSAOPywWE9yz19wtN5zc9+D1RjrIQu4g/xTfT
         l5k7gsRb4cAupRtjpt9YGSoSSiRWJuQQYoXD7TxPMaeK3X8CEjoV+cJTYxm/v1QKGDQy
         0ySR5M3Mwh7WOF14kfNAaWBQ4iPEUM+8ReR1sjuqHSMwFdTBBJJijhH05VzuQpByyA6s
         gI+pw1sUiqs++HK4bxY7fwg1kJK2QPPJpaUJgirBen+CwgcPeYukMcLfMDr42XBwnXa+
         bi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228457; x=1785833257;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nP4HsBZ2ryd+aoQiuxtPx8gYqpKC2rpWoi75NWLmBGw=;
        b=IlVbWB4TUSXGReRfp8lkdAjxXR/Tcj83nNXIZAPOIu6K6nu0KJePM9hw92tiwW+sjK
         g5J5XZyChVdVxLYD32iS3U58LIw05G/oggDJBGNC8YW99BaAibgPrukgivPiJk530c10
         IcMSgklH5ESF9FxbzVkgQjhBr2CNiQyhRHU0vqIK+yvIpgAMAw7F1vwjCLpbX4uikyLn
         fjTe9BzdOgDbzzK7modQ8bgqYE4PrnKOnRFuJUK4jRSknY7yC6AtL//1Ll1RU0oQbCpa
         xwsK/TD4aMxr/kLk4t4eSnk5azADVOmBwZkFasfMoEqazJTDeI9BGQe+IRe7RnI978/c
         Bo1A==
X-Forwarded-Encrypted: i=1; AHgh+RqfsX3HyQjiavfFGrWpgBvqswmZ96h0Zfk0NBe6Lk28kdKlmX6Shg5uqMbWPiFZlOBKEWqj5Jxe8g5BIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd2pi0vyB5s3xF3/BQLH2z9WBn27eZk12zi8Y5ufpwshQyFIRP
	1urteguKjTxsoxLorzeNsWtQ/B1baGgrcY65wJ1m6kFUCEmN/RzTuruQkDSJu00PFG30HFu8K+M
	pZPhxxqCbBAhc3qckwd1p1t1nWiRIunk=
X-Gm-Gg: AR+sD10pWFNdz+Z7/O/QaoeGoiG5gr7Fjo+hIwK19SXhRixvzACkGaXL5FUjmBgux45
	QlZDZ+vQIo6YZ5gR83qKQ0rja+CkMQ/tW0t1FFSojfwuTNN/wWgO6tejEPkXpKGcfRV5pwzj3Zg
	5AxD1W/Ph+pKCZykFNjK3o7xZ6Br05WNicfwYNO4G+zQxezIbC5YR7NHrgV0Y5WBeYNCPPQx1tc
	kwiXm/V22JZ8/aurogXzL7HxC3ZcPTkIs4Nd8LBVm0LMymi206Ex8SurnXXBO3thJfhcjMCyQmZ
	MNp9XWd+hPHv41OpWKnygb9Y1DPC05Wo64AkRuTW8QVbFGyfkDGGwMWKazCbYqrttIQZsz1UdA=
	=
X-Received: by 2002:a05:6a20:4324:b0:3b4:669c:ee32 with SMTP id
 adf61e73a8af0-3c8ba5bab93mr1940413637.37.1785228457200; Tue, 28 Jul 2026
 01:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728081251.23783-1-phucduc.bui@gmail.com> <87zezb7bnw.wl-tiwai@suse.de>
In-Reply-To: <87zezb7bnw.wl-tiwai@suse.de>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 28 Jul 2026 15:47:26 +0700
X-Gm-Features: AUfX_mzjf7hHxHzNgmmUa25C-Vjdf5iyYFAw_RuAyF8oGstvfjOr0X49VE1I33Y
Message-ID: <CAABR9nGfs65V76G8w4jEdMKtE5o37YqOe1XUqh=o1TLwKJk-Lw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: core: Update snd_card_new() documentation
To: Takashi Iwai <tiwai@suse.de>
Cc: cassiogabrielcontato@gmail.com, Takashi Iwai <tiwai@suse.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Kees Cook <kees@kernel.org>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Takashi-san,

Thank you for your review.

>
> Well, from the API documentation POV, it doesn't matter which function
> is used internally.  The main point is that it does
> zero-initialization.
>

I understand now.
Should I keep the function parameter indentation fix?

Best regards,
Phuc

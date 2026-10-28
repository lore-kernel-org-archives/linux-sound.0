Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793182515;
	b=37bMgMxQNwsKK8NT4x/LW88wfjw3qESgsCmDFbG0nlAftjK74yIt+elM3u+ZJaZzABsH
	 yzhFN/wlWVs/w9KwRmRf+Eukw/Ms5qVD25I1AzdpQQEuAX+6+/+vI/MDGj0Y0y30UOvku
	 jnjhZ4PR244lLlB1nNGXGm7XFOWp3JQUW2Fuhc5WRMfL6Emo+c4XcJEKqSMDA0A+ASfTi
	 ESf6+aATjFXKBgSU58THyrQb/mqJymVJ+c8G/S+8R7zshLcGobQxdaePuuVyw5XrGx8RU
	 BG7mT4v7PtEzWvB+I2gh3FQAqlcL4SnA+Y+Dy4ULJahmulQeaqzzye2agvv6DIUIwdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xASf3H34vKfEdpWHAlxf1Qg2aZTjpgUXhsOYbYP9MTQ=;
	b=qS04OHif3HXpofY+9SU52AzODcTajQEvm9gqf/IyuzbxypNaOgW7n+A6HrkjNPFTRRtR
	 fu91wJO2CtS3oLWiE7F2LPj3JIgOiuVP6qxp4iAL+6pMusJiLsTa41WcpkVeD096TISO1
	 ib7pZKEA405J1yJIFV+D+c/gzjKR7dA1u/oUDQw1kqnOgVlbnTYOaLRgIVWRMuAU5I4HF
	 AyUNh/5glWnic+RsUbhKnN6s8hvdPOOPvNrrIqVtwEmVj147rDdv8mcvsQ/5UOZlrFpGg
	 La6vCNacAsAbLU7pgsA0Oh1myttqTG7YrntbpT9FV46R+H0Oi8qo0Vae35HzzYbjrmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nz3SFcA4;
	arc=fail smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA58606A31C
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nz3SFcA4
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a07078200fso390475b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793182514; cv=none;
        d=google.com; s=arc-20260327;
        b=s8e33U+VXjvH6SsjZ2vfFpwQg5tUpqUJUVRxs7SyEpW8B6nFs9yctvWAJ6TLtidlsb
         XCOgCvyi2/lvnbg/QAgRbGoaGKJVK/I0WeHa8QKhlRk4y0Qm2sBKRFPjVowrSItDYm49
         vPDO2HCuzq/PFonySB+P/3XldVnSm8+RMsNopJeww0DnkhI0zSxVcZPXocS3FOa8xe1B
         1BKFxSDdzz0Pu1SUtjs1PKXeAy0z6p4+/D6e4bXVJ2uDe2P3388UtvgSzU6/3+PYZyTa
         y2F/lQXMOcQhXz+mVIf0naFpgz/Cqq9xbxJRnSVatT5TVFErN58wFaTt7uy6brd32hjH
         Zhcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xASf3H34vKfEdpWHAlxf1Qg2aZTjpgUXhsOYbYP9MTQ=;
        fh=R8GnkHx+PbVuwmPSQdVYKS5I7/gt+mWqFbmltVwCTwE=;
        b=garxTdYJDqwiiJxBBVhPtqp9VpJAXi8rUTDEHWP1KIVRG7E2BGe4teKHmBitLc044m
         GwSvkqf0veTZ7OSuekUucjOueI4QlhFNihHQtX2fEFzA5n5HrAvCMbe+vlUBDiSX63XD
         4J4fbD9QkWyvRC08YG0kHLdoGikVA64suSSEDqSFbS2kvX5C11SPqY4g+dS9y/9WwZHk
         5BGL1+RjJP9cyurExcYonqfTEXcQOIcLVMyu5Sq/QjAozepiDNAy6JGlwGOUxOPgDrQl
         tV4hc7rr0SBQI2S5tmmcZE0ileQP2hL8XJxPQay+CzHOsOTPepDWq+wUVsuYGJWljQ0g
         2ywA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793182514; x=1793787314; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xASf3H34vKfEdpWHAlxf1Qg2aZTjpgUXhsOYbYP9MTQ=;
        b=nz3SFcA4MmVd99ZXvkipFGVwU6TdNvdytyOiM1yxBoDxp65tUVl23fs6lhGrvTkDkH
         SrgxhF/ZmBkpIWlZgXEggbeKEoBu+YR0+BEAK34LUZSFGWkiWd6BxSJxP6h6PIg7C4Nt
         SC2wLmR24TO4SX29RYWvxWumHng4gmQx9a+qWbgDUiKXk7jSY9drCX/pgjAzXomrfEQx
         97UcETJ4hLF99asBgtmCYoLh3Wzw6S92GaiFKZVJ6z0dRF69CzfUUFeLZUtTObgevuSV
         pxvrp6QScx8DP1uOnoNbXX5kOqAqpOTJ/WXSxVCVfZNoICwBMlrhxcYML9fA18m5rtaN
         ymSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182514; x=1793787314;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xASf3H34vKfEdpWHAlxf1Qg2aZTjpgUXhsOYbYP9MTQ=;
        b=O2HLDwm68YYajaHhEwew1MkRnKWxIOObnBnwpzKygrAD4bLb33AU+eqqynSdFMRHFG
         IYu2liTHwrusc/RJyl5JpjmJitWw1v1Wn74VuHvsJISuxfQfkVVIsuYRuAunBLzlRTY3
         1IpzXRRNCq2Bq3mKcBjWwyLN/WCKEpVBiXZj2MCvuX24e/el0LJI35GldQiPJRZ+CJuQ
         4KUx7UIl0KIou2IMd9/K3rwLOaOMLcTrSFPZpASV1XAMSDzjxTcKKG7Hn8iu9UhX2RqQ
         txh/VnK4rTENKfkn3YxlIRt1a2LuT424m27ENAjJb0TitI+RcZWtRl15N8F1o1vUwXbs
         dtbA==
X-Forwarded-Encrypted: i=1; AKwUvBxBbYx/uDnhwTKm53QRisY0zDuCIzf+OFqv0f2nk8hqPsznn4edQQy7Yz90IEsMylb+ssdstHDjuTBWRA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKhtHlGwKpAKW6OI1Q6OgmOtjJS4n7e0GOgFXvGk+mSh4BI+kP6
	qhH4CtdRyfdoKAZDhd78inxXS+B8O3eo5Z8KjfRwkT+YELcJlQdR4Trhl0WroxGtCBNUEezcEfO
	Y3EckGke3Bdft66XRObqAXpMUFg7ELu0=
X-Gm-Gg: AYBFou3haSgs2FSaCgYNE6rD9syeLAW8pVhkxSOzF4jVDAOpnJ60JZyIpY3hS0oJp1X
	ogQneDzHxU6Y71dZHL8YM3mCR1sEpzHx+szzEFdguXjs64qZ1MsKKnIAlXMJsvHwcDiI6UhwCf8
	qqJ3xQgCtQ/EjjblrJbKq3NBTYgIarkA6WQPRHy4HiG4BtcXmg3csgz/JdJw2gnwmweEq91BgCk
	h8PsmgRveqGa1CMtRNfTgeZqBwjpDv55+UxYk+GHJQSK5CpZh6kaPp+e5izq5A2LMyRiHSEx6SS
	uTij6/jN5Jh2n+QYbhnk4Su347ot1s8hz7GaZyzlQM5QVtx56QRPIjUN11Sdc2SbI6hgC4h8OAV
	ZZIRyj6v6ARMX25GPgBXobPxvuJrttS3eBcFyA7CbtBoSjm0ObjmpnGWy9Qmm6RgqZpWSICC9Pf
	aLzuwEnfEwyuupvcEcfIZIjbhwh4fr+Hf1NhLP1tT0vagyOFDU/A==
X-Received: by 2002:a05:6a21:6f17:b0:3da:15a9:a18e with SMTP id
 adf61e73a8af0-3e902291f4fmr1507666637.23.1793182514538; Wed, 28 Oct 2026
 03:15:14 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022084040.31181-1-phucduc.bui@gmail.com> <20261022084040.31181-2-phucduc.bui@gmail.com>
 <CAMpQs4LpM1C6diap6JKYgLTYLoaC=W5wEsp=Y9DAj0Mwg-q7BQ@mail.gmail.com>
In-Reply-To: <CAMpQs4LpM1C6diap6JKYgLTYLoaC=W5wEsp=Y9DAj0Mwg-q7BQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 28 Oct 2026 17:15:02 +0700
X-Gm-Features: AclHuK98SBr74OryFpSWxRN0Z3YHcvuo8TePrT044k44OXomYiT9ECiHc01N7CA
Message-ID: <CAABR9nEhqWP9rbT5o0sa=KUoRgbRGynratygQRaOoq600FdvGg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] ASoC: loongson: Fix IISConfig0 update in
 hw_params for rev 1
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Yingkun Meng <mengyingkun@loongson.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi  Binbin,

> > On revision 1 controllers, loongson_i2s_hw_params() reads LS_I2S_CFG
> > and ORs the new LR_LEN, BCLK_RATIO and RES_DEPTH values into it
> > without clearing the old ones.
> >
> > The first stream after boot is configured correctly, but any later
> > stream with a different rate or sample width ends up with a mix of
> > old and new bits, so it may run with the wrong rate or sample width.
>
> I tested this patch on a Loongson-2K0300 and Loongson-2K2000 board
> (LoongsonASoC sound card).
>
> I ran consecutive playback and capture tests alternating between
> S16_LE/44100 Hz and S24_LE/48000 Hz, both in stereo. After applying
> this patch, switching between different sample formats and rates, works
> correctly.
>

Thanks for testing this on both boards!

>
> One minor suggestion: would it be possible to define these bit fields via
> macros, or use FIELD_PREP()/FIELD_GET() with GENMASK(), instead of
> open-coded shifts and masks? For example:
>
> #define LS_I2S_CFG_LR_LEN_MASK          GENMASK(31, 24)
> #define LS_I2S_CFG_TX_RES_DEPTH_MASK    GENMASK(23, 16)
> #define LS_I2S_CFG_BCLK_RATIO_MASK      GENMASK(15, 8)
> #define LS_I2S_CFG_RX_RES_DEPTH_MASK    GENMASK(7, 0)
>

I'll update the bit-field definitions as suggested and also apply the
same approach
to CFG1 and rev 0 to keep the code consistent in hw_params().

I'll send v2 soon.

Best regards,
Phuc

Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437A91487FA
	for <linux-sound@vger.kernel.org>; Sun, 29 Dec 2024 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735467015; cv=none; b=aWJXl1Twj05WOfuijzjAbrF4txprgOkpY8jeDc3C3sZNCYF7R+Wkb2DOsGoOgLTtgDV5N+/cvQZ4e1fFiX+WCtw4Uuvr6nxbk49OUv3cKXR1cEZsHerHVngUAM3v5Dy4k1eOZHfNTnPipIhjtI2BLopLMpNxeWk91/Z7wXNQIo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735467015; c=relaxed/simple;
	bh=WL8Ny7Z67ccjmsSgCVQ1xohVJKkGxyxoZXIu5HuhE9M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A9u5Km76sPEkov1NEMeCpVp64NBpFBWZX0l3Vmwg22eSDJFHPUVPmK3pqaiSTCfG8fDLr8wTKo26ML3uFKH7Eo8YjfICSevN5tPQAlvYCAMV8rtrUSKp81Rve9O6OIE8zwCwbHvNIa4jH75rNHXW1Y26+Dys+kPkDbW9s7JYWkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f2MOFMTl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f2MOFMTl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43616bf3358so12774455e9.3
        for <linux-sound@vger.kernel.org>; Sun, 29 Dec 2024 02:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735467011; x=1736071811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo0lFH0D7L1OyRrRi/rC2RixuHioaZMR/O4UKhCo6m0=;
        b=f2MOFMTl1jFNNnAvYCXkd3/llDPLgX5NrlaDdP2fgyEPSD7JDJBlhjO8Pl1PyYbIpp
         vTt83JNYBVke6Mlk1OlR5RCKnWUjMUuYLBkVsdthgw4/21yyE3QWMQJaHG+m1JbFX78P
         z5LFiOWU6jnO/xWEoqGUqhNoraWb6n7EFRCvLJYQm61wzXqHNRSJPZd2u+LCJuAdx4Av
         wPG3DLrH7mOw0Jj4dvHX+Q8HPxL3Oe2usvo+Fu7C5fvjvhwOOZ3MjZLJooPza2fLvJR8
         dPnxPoyIVYaPjKLNPsR9POditxy3pw0T3jrnC50yAzvss17J4Su8vgRU3Lhvpt6HUhzJ
         e0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735467011; x=1736071811;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo0lFH0D7L1OyRrRi/rC2RixuHioaZMR/O4UKhCo6m0=;
        b=tdD62PFo/iS711lkwXli1ZqNqI6jL1mBfQI2Xu4o+FFNlGZRPZzvSlajyNJuFYTuOO
         OBNY27u2k9Q4RQlBxnbuprWqViOeekKsVRFymUSjAEgeHrYfTX24xP2MFSN3cJ5A4qKS
         b1xuHNqa1xkuovmonL7WZtXCFtqygCJfYEgOn/phlGgLORGsENO3dmor4KBKoItdxRk1
         b80qWo7vb3SZNi01dARD1LjwN2pf14Qk6ILepSOeRAC411PcPh7ZFBihnovfxEwySQ5F
         ndHoaB4tUoYmuHD8R/JDzvLueuM0gQAIp8PfjHLn+9YWdfjofq7ISL2YqJAIpnlMR7am
         pOYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfhPbnHBeIjj8ZAV097OanWPdHbqTd5iyT9OOlotN+UtrNWpoEAaQNuL1HQETWszKStmj89Yf5VtncIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygVhsO798gX10qF5xn8dpN3ielJgY0IxoV6KFNM+YmJXQJeuYM
	P6tKxVhKuJuWD10aub0cLjiflNSfKn/TI+oi/25QVVopHny/BVyvcr48hAz2B+E=
X-Gm-Gg: ASbGnctMpHCToa9IgzTfd4y7q6QmouExHFppmBFdsq1DMhxLMzIbfdlwMOee/vPW3Wa
	77Ljni4ZO9ZmILUxNeHhPV+O0aKUXIWXNHT5D545IKhdvpcayILa+VH6aPNxy80sex/YOaLH7Bn
	HW1Bh2aYpNzNOuZA4FJGsmu2hmBlmm2Q2PFpTj4rmZt85yH1dwibvaMcWlb0V+nA167ph5bh4ov
	OiVdKNQkAWbICUM227WiARPh4WyNH3qB5LxaQ8UDZ+DR/fxA8sYLRGZeBgdPUAF2/Z2QcQr
X-Google-Smtp-Source: AGHT+IHP1vNO4pX8rCVSoOO8ZA/PKbzvByEOcpImjWXAjaOwj9hxfLF/KNxyi+EPgVTvKCoXvpRUbw==
X-Received: by 2002:a05:600c:1e23:b0:434:f335:85c with SMTP id 5b1f17b1804b1-43668b7b619mr106181145e9.6.1735467011606;
        Sun, 29 Dec 2024 02:10:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea40csm320505375e9.1.2024.12.29.02.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 02:10:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Artur Weber <aweber.kernel@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
References: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
Subject: Re: (subset) [PATCH RESEND v2 0/6] ASoC: samsung: midas_wm1811:
 Separate compatible for tab3 + fixes
Message-Id: <173546701025.10606.6645019448209371865.b4-ty@linaro.org>
Date: Sun, 29 Dec 2024 11:10:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 16 Aug 2024 09:50:57 +0200, Artur Weber wrote:
> This is a follow-up to "ASoC: samsung: midas-audio: Add GPIO-based
> headset jack detection"[1]; it appears to have been silently merged
> except for the DTS parts, this patchset is a resend of the DTS patches.
> 
> Besides the DTS changes necessary to enable headset jack detection
> for the Samsung Galaxy Tab 3 8.0, it also adds a new compatible for
> the Tab 3 (samsung,tab3-audio). This is done so that we can set up
> different requirements in DT binding (Tab 3 does not have main/sub
> bias regulators), and drop the main/sub mic bias dummy regulators
> from the Tab 3 DTSI.
> 
> [...]

Applied, thanks!

[3/6] ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      https://git.kernel.org/krzk/linux/c/2c3c373555460b79a6a201c87230d32b211f8323
[4/6] ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      https://git.kernel.org/krzk/linux/c/d15cc681ba79fdc722d4aa7a83e572850cf5f64a
[5/6] ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec
      https://git.kernel.org/krzk/linux/c/acd33b48ce663c7e293b11cd77df7ea702ca34f6
[6/6] ARM: dts: samsung: exynos4212-tab3: Drop dummy mic bias regulators
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177833148C2
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 21:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778102535; cv=none; b=q5wZVpJ3v04D9owuFMOyZg4pAJ5adKQ8d4wJKx3M5fg23l/6reaGZRp42561fMMEand+NujQSzu07bUVHTYOmMuawFpnRtQxHYJwxiRnfK2v1EZmbbcOtCQlsAHL7ub0U3l27JIr6+KFdmMHe8fe9KmXIgXq/MV56eApeu9K1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778102535; c=relaxed/simple;
	bh=TDFlAyJw1nUODGr7CJgiZNIw/mOTrHdvnPgaxqyWrIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H8S7jdriM1hWjX1fXNJqh/09I8C7KFoi1SoHi1PMIqfBJTPqOy0pTP4tQXA84lmCkPH8UrVDcDdiwG2CPqXHLABYHwa77vnia6VQb3rxjL3GSXK4cvGdq3Rsx4cJAr49mbAMrruGTvbwTG3qoBKLtUX7Sygg0eWeE3neGb1Npoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=GXpETEK6; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="GXpETEK6"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-364d72f2986so106280a91.3
        for <linux-sound@vger.kernel.org>; Wed, 06 May 2026 14:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778102533; x=1778707333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+3kkHmTsm2rX61tkHXl0gWLDyLZTSYok7GwmcKQ3fQ=;
        b=GXpETEK6PSp8V4gOKJ2seojB66tCYausMgQiarlrQpA8DfAVRX+xxFgQrNhA8Qtzgf
         gpy8xp4WRYD5R3NGt98Pa3urG/Y5Ugy4DY7LcuoafImQl1E6n74lRZ9rDAW3mkuEJDre
         tOpMMZcHlvmhAQohMVNVztCoIAR1XYVREuBxHe5mMHnaiLE+rhBaWycN/Cbk8GnAi2bs
         CNy5pWS9tZBGxA4zcii+CHBW3Zh/P+0sXmVCZun8lK4CWdxCVgWbFNUABfveOXds34A5
         k8J2Yz9/ZnRY+5MgSJ4l0rWLEdv0/Qj8iIVzT1gcbSjew6eebMsFAmYUhtNqHuiCZFB9
         4lUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778102533; x=1778707333;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E+3kkHmTsm2rX61tkHXl0gWLDyLZTSYok7GwmcKQ3fQ=;
        b=cDYp8MBkJtXXJYiuwMfDwttYgGts+yY5WuqPAyMqmmldYXQOWO91S0gz0tAb5UdgP9
         bWzR3FSrhHXtZdBC47C3K7Wj8BUFaG52p6g1aLId//jjMVK/wQq+biCsFvKc2wf8Z9cD
         2CQ+PgffxNMra7CuBMeQ9f+UzjCCClPQG859VY/vQ4/10QgaqYqnPjzfU9HOFVXPEkNm
         YKY1WJ/Ix6X6OW/4ki5TQ5aqPq3EygCu+cKqVzNTcFPNiDLq2wyjRjAmcgYFmZSDYUck
         uNaSpi9lOSShEAKm9g9C4HE0KuVMgpPj6nGEtHLoAFHNSL44eE4BYWuLq50+FZ3h3qVY
         6fMA==
X-Forwarded-Encrypted: i=1; AFNElJ9Xp7E9Curgc9CSIr2CVi6EwkHkPq/MHOG59jYwD4cmeKRCsQCrVLkmA2X6yNvFMd7aBaqy149mvQS/Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Cfdf1fAEVnlBOW7DDV3pM/4TuYnEFxMwAajql1p0W0pn0cxQ
	r6YlJ9AAsmmZTW4naR/qe2YUtktaEZKayzhb9GxHuBqSaSnDn6uKOmGu2Ig4s0XVQKI=
X-Gm-Gg: AeBDieueYcUicdE0/v35X6kfVeqxshg0MpF6ozPLXPL2PSElRR281D7bQG3IlnmZ7BB
	8Zcn1q9+DM+nZAlyuI6rFHui+mXWC8yQWmkaE+WMEp/pLIlejc5J73gyTl0TRU4MtpPjnbzqsIV
	cU+e28aGC/iIN1qQKc9Xh3ex+BaVIXS6f+t9n1yxj2rkCRMldEpinOVdeKOivuSji/V7gTXVb0c
	6KoOawXE3mGUhMTr+9gf9RMQ8la0IE7/NvagS4Xiodp4tCzw+jFQFPCRJrvbc018YNo9dBo9uKV
	EjZ6Ed6xgMzUnsG/7m1MDLUVX1XKznN9WYDrxXovO2fq9IxjYsLtzF9WAZQc2+G45Z06kxUxBPA
	dNTM4zY0v9Sb31afrHmmP34Xniu1gg8yvd4vPl6+BUHGredFtXCaDwx+4UTbfke0ADq3UDD9BZN
	7t9Dt+x2pGPtXHzXQE4u2KIRfgGgj4NA==
X-Received: by 2002:a17:90b:548d:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-365ab9b8c53mr4534954a91.5.1778102533545;
        Wed, 06 May 2026 14:22:13 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-365b08feeb0sm2272665a91.2.2026.05.06.14.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 14:22:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
References: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
Subject: Re: (subset) [PATCH v2 0/5] ASoC: cpcap: Implement jack headset
 detection
Message-Id: <177810253253.236754.5359911875458195041.b4-ty@b4>
Date: Wed, 06 May 2026 14:22:12 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 22 Jan 2025 18:41:24 +0200, Ivaylo Dimitrov wrote:
> cpcap audio codec found on cpcap PMIC supports headset detection
> and PTT button through its 3.5 mm jack. This series implements
> support for those capabilities.
> 
> Changelog:
> v2:
> - cpcap.c: fix a typo
> - dt-bindings: fix interrupts description and alignment
> - motorola-cpcap-mapphone.dtsi: fix interrupts alignment
> 
> [...]

Applied, thanks!

[1/5] arch: arm: dts: cpcap-mapphone: Set VAUDIO regulator always-on
      commit: 009f64641db3fbfecf92dee910c57a41c3e77a4b
[4/5] arch: arm: dts: cpcap-mapphone: Add audio-codec jack detection interrupts
      commit: 164f88cd7e0c0fcb950e8b4ba5d8c26404334c88

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


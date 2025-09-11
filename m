Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DC6192D8A
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 01:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757554146; cv=none; b=OQ88142BQJQcYv7kaVbktWEQEmQEiXYictzIGijfsZtLke4LCAdMRkaIO1EQqKNps3Egvo6748883YxThFxYIyKXJmtJ0L4bhjcqxoGPFchxvbQ5YLxWoV5XITmQA4J+JF4Hv+SvsiKI5nV4bVhgPhUPs2kPeRRcJWE11bkw8j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757554146; c=relaxed/simple;
	bh=pbx9CJKc7axWAeDhhMzHI08am0iyRkygI0vfKsokbPU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=Jmhbjvu8/GQuUP1wiRUmBTkt5vpRR18fUihBLwUwK/K9BEQDSk+RNXrqvt3FzlSew+Es/nAONgYAANurtNn0Ce7NbhGTfs7jG54gO7vZDQlgji5fzsDX78qI3fDofb82qcUUj7irymaL7340rvFrHU4rFabare2HcsxWFXp9wIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CQXY/4FT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQXY/4FT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45df09c7128so1228565e9.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 18:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757554143; x=1758158943; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHYUQTMOk4dJ87X5RQiMHCWDgvXiiQtLLT2XJqAjiYc=;
        b=CQXY/4FTERuyHPJDONGTYbglxequOCl3GyQgJ/cSLiXHzN5JOiTZgs6tsjNOEri9yA
         uN25JcRcy8nz6uPwxRcn3J2fthUYomHJMGiSHst6PTOwKu9v65g+zy0nJIjmF+fO5dVE
         3WcNnzueoxsZeiyEnia7YZPIJ24vVdf0NmD8f1ynNXeMyxa/2WYjsk9nPx9jwU0uYoOY
         wFJb9k+nbyj6IDRYF22Aj6KNowtyT3Og22uIArzvFk9bBlxFaXj4an4bqD8KiwVkUSOa
         StXGKtp6YHMEE6nF7mPCezZ8ZDPSuNRKitD+F0TW769X9D6cwerytrfQXHT+VEqnyFRf
         doFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757554143; x=1758158943;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jHYUQTMOk4dJ87X5RQiMHCWDgvXiiQtLLT2XJqAjiYc=;
        b=QkTz7oIRXc/+Ej6GHc/gDnb/jmstRrIouBZ7ImLvxnLnf27kjs+SF3JBuFNVyHlXWt
         9tzls4lTnGbMQl6+2w7/ZMcWj8ROX7HUfwQTXqcOl1agNnqCwpKMA9QOhGcLi8Y9f4wf
         1fkJcrGnUKK+HMJexjNM+uhII8DkBVOYCPN/Gdr/hXExRbgdCH8ZanLuJzlKka/Bt77Z
         9dYBpiqYH3HC52D7OSAIh18b08ifoUt5ScHjjpZ/LlJtoerzAL5cOzNZSfKsmJPXhIFP
         Eql7skVOleOgYQohYShh+X5MSlRb63kVFjE7A+CGdXQ30uyqDzWI1Pq8CjCCvjkf3qwg
         mcmA==
X-Forwarded-Encrypted: i=1; AJvYcCVTtky9SYQ7uV/RWmUZ7y5TdX3RguquGKUZI2ko3NkunwTz0IUW0VPaax8w3M7IPrCdHGbsDLpiR+Vd8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx31FyHhGUPvYIrSeFFScrk0Xhmm3/B3kAG4BU20E9qlXI7iVer
	mZ/7rVK9ECi6gFx9ZpGj8wM9swC5fqeaoNX/SE3pGMzLT4Y++x4Uu+Mw1i3YNPAMFq4=
X-Gm-Gg: ASbGncvfjVDHUZderh4QvsCixSniTXqcOc3a/gE/h8cDoDuG82LSi38sEEBED7ZIiVr
	GyQvh052zLO58mCMFGZiG6CWL/Qi8QBUfMCg+fyaR/078Zc8Fh5NtKbmbf8kRaeo+M7xa0jC/bj
	KRGfq2jFlCQiPSnuRCRrSrjEk1WCDDzAusZNpMXZNhGmlq1cBKzAnWsfjMM/YhUmMaF+bL2zY6s
	d7CeYlBIPtGEnrQlwS4sSlgd3q3PZaTWKO4fing1U8AME0ZgnCQTZD+OCzbuA4hF6q+X9BkaOGi
	/ygcgIcTu9USnLP6nbcW2Bl1uObLbj/E38BkU16zVmVv2G07DrRoW2BspgsYQP4yvJHI8bA7eFV
	jPROEvvo8hnR860JAitQq7oliaLU=
X-Google-Smtp-Source: AGHT+IHN9v4zGixZCD8v12S2CL9xgTL8XJHDo1lrrR0rUDFompRjHV21wwHe9bU6LTLmvxJxRTsOMQ==
X-Received: by 2002:a05:600c:c3cf:b0:45b:8b95:7119 with SMTP id 5b1f17b1804b1-45dfd5c0dc5mr7309475e9.8.1757554143119;
        Wed, 10 Sep 2025 18:29:03 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:a727:6a46:52e3:cac2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037b9ebbsm3680935e9.11.2025.09.10.18.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 18:29:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 02:29:02 +0100
Message-Id: <DCPKY2GED44G.I2DSV6ZBXYAQ@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: Fix speaker quality
 distortion
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250831151401.30897-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250831151401.30897-2-krzysztof.kozlowski@linaro.org>

On Sun Aug 31, 2025 at 4:14 PM BST, Krzysztof Kozlowski wrote:
> Commit bb4a0f497bc1 ("ASoC: codecs: lpass: Drop unused
> AIF_INVALID first DAI identifier") removed first entry in enum with DAI
> identifiers, because it looked unused.  Turns out that there is a
> relation between DAI ID and "WSA RX0 Mux"-like kcontrols (which use
> "rx_mux_text" array).  That "rx_mux_text" array used first three entries
> of DAI IDs enum, with value '0' being invalid.
>
> The value passed tp "WSA RX0 Mux"-like kcontrols was used as DAI ID and
> set to configure active channel count and mask, which are arrays indexed
> by DAI ID.
>
> After removal of first AIF_INVALID DAI identifier, this kcontrol was
> updating wrong entries in active channel count and mask arrays which was
> visible in reduced quality (distortions) during speaker playback on
> several boards like Lenovo T14s laptop and Qualcomm SM8550-based boards.
>
> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> Fixes: bb4a0f497bc1 ("ASoC: codecs: lpass: Drop unused AIF_INVALID first =
DAI identifier")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Reported via IRC.
> Fix for current v6.17-RC cycle.
>
> I will be investigating rest of lpass macro codecs a bit later.

Any updates on other lpass macro codecs? Is something still broken there
or are they fine? So I guess the changes for wsa and rx macro were applied.
va, tx?

FWIW, I understand that I am late to the party but I tested this one anyway
on sm8550 and it seems to fix the distorted sound and unstable volume.
Sorry for delay. Just confirming.

Thank you,
Alexey


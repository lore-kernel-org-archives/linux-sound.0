Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665340;
	b=f2FZYhIsATHLM1LBNGc9lBftsoMESNKBwIYAk5RlOAm1WRGdpipJCfgNfS455RsDlGl9
	 8wDGwPrACXqcUYXtrETQnVnj/OEGLIqxIq1s8sJ92rZZOkCFuP0sJY2anZgKZJGGRHacV
	 3LeWV8AH+p5YmkiEWsnF3gznwcdLlE5cQ1IqzlaNbPs+OQuXaqoZW5DV/4H1PaWs6dnHV
	 zzmInATPoLwgaqaKzAsMwxeeruhlKlnz1gAGXy9yuoG+n+idEZ/hO/nDQLlj8bK3ScKLy
	 hsmi11a5gunfxh+FXiyBapVfvnrDJngBXPElwDQLQdRxye/W2BVNCAHvzn41c0okj+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tjCe/C21ycUvCHGAx37nFv572V9SXkb5hmDpSktqSgU=;
	b=MEDDrm+sv24X88QhhB9p5ALonaFVuuPi/c1eqFTgXc503VlPDytcpOjU+OE4Ur0K9fTp
	 OOC54c/rfVo7J+351vqjr5xeOBhp0BxWpTgN5CAOg0BkyUKa+gJZjMOaMTR4JeBjd/2/V
	 zaqKyRsa8JNZ9/hVaWQir04lcz1y0ExC0v6nbFF7dCKgC+xp2YK1yVJr0KsY1jVDIbJuO
	 1jUPX/1ZSfQBBHDTEi3U+us0uRpornJYmCDiX08PmGf9RUnjSNU7xidfeGgqyt1W4bfc+
	 Bg/zGIa5tiHTNUGgLTpAutCXzRiw3uN6dEXYxhxpabpzJASH4LvQaBxG853M8qamNyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPismLtF;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B865B606A31E
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 03:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B865B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPismLtF
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdebab6fdb3so453049a12.2
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 19:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795665339; x=1796270139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjCe/C21ycUvCHGAx37nFv572V9SXkb5hmDpSktqSgU=;
        b=WPismLtFq5Vzdw8Nn3x6+EU4wIRclxtaK1grWHOPmfnwoDAUZzfXUDY4nq9NAKCLMj
         GANIvj9Y+FG28A4kXgbmKtWCNMIpcvYZaienVronBs5N3qZ4bo1tguMF7frVTREuTtyv
         fb5fzAuumNzc3XJwPZjidpRPRYH78Av7k7lkgw9d8WYkpYqrI/TJTmZb63Qne4izOLYO
         pgNmZByACdJHj5GMwEwH/FZIx4fZlnAiJGnzisoJvAcP8kZwXBXSTGtJrC55kFFdx1a6
         YwNpePuveMVYnzZ5mQbz9t2LsQOD/clS1vuZIOrz/ZqZvTE1kahiiSnis3MG2byNyVMW
         qJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795665339; x=1796270139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjCe/C21ycUvCHGAx37nFv572V9SXkb5hmDpSktqSgU=;
        b=mi3K48Mw7Zz/2BSheauwK4QOkYXj9Y+I5yCFb0hIIuO5XVoZgOiQZ2Hoio2SwRrxKF
         97hcaSgpJynoQ8cjyB3Itk3esEcGPmmFnryTQqgl3tIj9+KF6K0hsdsXz68Z7bgdnIPl
         ajrIbL8Uwn770u17gUvNRC6OrR6fdJFxPMNIQT3T9J/kUsBXflySrjl7N3+rXp+hs3XX
         suCSAXG/qujpS6OhDBaKYLSYi4Av5t6i6D6Zcw9D/7Ay4g8szg8ZdRtIPODwhy/2mTIn
         arWbCvQKMtYHzZFjaZgcllYCJevPxJivXUg6ycBj+V7GJQmA91t1918b4dQ3AAqT11l0
         2XcQ==
X-Forwarded-Encrypted: i=1; AL+hErEgTwG3gMubSGH/1qQcc31wWAEczMQIxpaKA+GGbILZIA+QCAuqXyp287ZTltMRau4aOkVnRyTNitfJPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZaWk7enUq2uk6XtoFI7cM/Wv7pd4wTdlGsUByzwKUCWxm0znU
	u0MrsI6yAC8Fvo5c1tmQJM6vUPA1/UkXmdVrs22dA4NigXbS4Q+ExmAd
X-Gm-Gg: AZFdTZflSgPH7kAPcFkA4rnKnOaijujEFxof6LbgKihYDgnZl+VVRi5Cs95aYdVQl8c
	m/YO8daGtUqJiBULC7mtxHwnp7hUKjMZSDyf1QqqKmGqXoRpgZT38tPSWYJuKwiwO037UsZIEH1
	avXiLYdAvxByIbxJCHDftPzkIt3aQDmc73vS85wvq0DhDEeOk/nseN5xsTI1PHUFrM1oig6HU2J
	hZNyB+2hVZnbv/dgtD77B9v1wfh1SweK90bZqqKXEtnHIm7b1B5Y5hCMoY6Qr49UFJDnzCRrAXg
	+YXLVrYqFHNGZFi9wpDLMh47jGe1xK72Z2Ngp81wfLJ240y4w6oT//zGbegLylwSMjorsPS9UHI
	OgqlCuUTKIvMF16VDdkKkqkafYkJeA6PfjTu/PWt0DXxsKk+YF6NhBJmEo/l6P5VAe8e7dTsyzx
	teGxYxjAN/LCy2KGXFOd1yFXRnP/y1JRG95Hnp7EYboqc5an3eAAVQIs2dPDG/K68U2uPa3tfR1
	MCM6NhSfa6PmaYRMRr//WPtLc9gPuMX75bDzsvIGHF80dti8jg71CwITmYvR1iAg7OYejgJjKe6
	k+1jRZIZKofNRFvE7XDM/ByaLmR4RteSW9AGkZvulwCl20VyeQi5QRLSMl2cKl8THYDWFjlVNtg
	KC31kUnaKf397V3zv0hYVmE3V6Aljy5xFq9jBpj7JKIcsesSY7izPumfvzhfQrg==
X-Received: by 2002:a17:90b:57c4:b0:3b0:9cc6:62ba with SMTP id 98e67ed59e1d1-3b41caead33mr17622224a91.38.1795665339096;
        Wed, 25 Nov 2026 19:55:39 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm30295729a91.15.2026.11.25.19.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:55:38 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Ben Copeland <ben.copeland@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 1/2] selftests/alsa: Add a config file for the test-only options
Date: Thu, 26 Nov 2026 12:55:24 +0900
Message-ID: <20261126035526.1779288-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126035526.1779288-1-sammiee5311@gmail.com>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the ALSA selftests need kernel options that a normal config does
not enable. test-pcmtest-driver needs the pcmtest driver, seq-ump-test
needs CONFIG_SND_SEQ_UMP, utimer-test needs CONFIG_SND_UTIMER, and
aloop-test needs snd-aloop. Without them these tests skip.

CI systems build their kselftest kernels with make kselftest-merge, which
merges the config file of each selftest directory, and alsa has none. On
the KernelCI arm64 kselftest kernel all four options are off, and every
test-pcmtest-driver case skips.

Add a config file with only these options. mixer-test and pcm-test check
whatever sound drivers a system has, so no drivers are listed.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/config | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/config

diff --git a/tools/testing/selftests/alsa/config b/tools/testing/selftests/alsa/config
new file mode 100644
index 000000000000..67fa26a87217
--- /dev/null
+++ b/tools/testing/selftests/alsa/config
@@ -0,0 +1,6 @@
+CONFIG_DEBUG_FS=y
+CONFIG_SND_ALOOP=m
+CONFIG_SND_PCMTEST=m
+CONFIG_SND_SEQUENCER=m
+CONFIG_SND_SEQ_UMP=y
+CONFIG_SND_UTIMER=y
-- 
2.43.0


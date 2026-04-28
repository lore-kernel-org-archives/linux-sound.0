Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A865226E165
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 19:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777404191; cv=none; b=niBvgqRAGmVy7SIbTtXBdNxAyaUrr/vxNeDQQsGJg3myDZPrGmdaPyTfIU+CsOukaRQ+KphjMkjKQ49dlnftoWZ+YNMzMfOYgv95+S+dpl6iaShrrPD4owYD7aFUNEPAVIhRtPgzXHVy78Q6emFLIrze1qxJYcYHADhdAxf/YyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777404191; c=relaxed/simple;
	bh=3ZbE5hn1FKWp4uyDf/VqWOhsipf2DuR3eyZUn9plDbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mzEKuk1GdvlrkHwpJx0N7gOEoqSZkOxgn2nEFy7uj1kvKUFPgAhnK0F+O7tQvpRRJ+CcQBQHf8NS1BUCAzDhw1z2vMcXxYpnT4eKTgtSdud4wcNkd4ElJpdguvGSppMWASGplnsZ/RVBt9ZzoXg8rNjC/PKd4KnMlRB9OLfUoFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=xe4hSwEK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="xe4hSwEK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso162757645e9.3
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 12:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777404186; x=1778008986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=buwfV7nzrBAN1kj2Pp8gFNe2wiVV0p+sFgaZu6iecRY=;
        b=xe4hSwEKRAqQ1+jdFqMwfDSQ2ndSTcxIen2DXXERZqjq7uBh78oDB1j1ASw8b6fEl4
         jbNBGjBcoZpyKO2N6wce/JFgMWETVENi1y/RdeWeDaP4CsRW69QlyvF231Ph3dINipd9
         FOufVmc/UiS3bH8radOPXL2LaoLDsF4UvO+V0oMxFD64n2CrsHYjTmc2yfRKbHuPTfWq
         YrAHvAW9wjS7tWl8hLF1785U/0TuTNXgsfctNsllx6DVArQmcGBia2jfj8pC0dHJ4Rw8
         5FBqlZXFLJ+3N9H22sukdIGTdY2DXktV4tH5MeomqXu9a+J/EbJ5rx6QM4FNk2Ngi9cx
         /BPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777404186; x=1778008986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buwfV7nzrBAN1kj2Pp8gFNe2wiVV0p+sFgaZu6iecRY=;
        b=Z0YgGI69hMy8UhlDf+iJZOiFLfQlSdkuI/9ejYAMf4cuuA0EcaIADmKB+S/qe9Y8Ky
         5OoaMblhP2luoUJhIherJF+wNxhjvi7MJq6B45m5u5qvgpCMgImF0lk98WmUF56AUfgP
         6KalE9LXfFLKrgTQ7vAc5Zgk67IKSbtTBpyenwciACMT9wFcFsE+SJbrmrWMKMFWovPt
         hjpw74ZOC+/j7IEx7Vha4mk8N+p5lRHdxF4P1S8O4bApmivmRTKhMseyx2czbQWqv4gd
         2ro20y8BKWTZeq0OetEQNi5HH+g1nS/bCRkW6INOupvLSnQx9ptUDAe6duSQw1nGQ+nB
         MCCg==
X-Forwarded-Encrypted: i=1; AFNElJ++Gg9/+53TGPQaLYS/rHoL4+WOiawLRUrKQcpbFhwWsa4wIxLeN8Aq5B2b2NVP7SqakPJJUxFRz5gjsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUj6Wi78Xq4zsMnN1GsCfH7DTtXbTzRGhl1xazUNAh8rULPDEk
	j9UqdANcbEq1UMg3xnDEBDaTRIi9GvfCH8TaT10m7Jz4SZeI06YTUwgEtORI3o59fyo=
X-Gm-Gg: AeBDievIGKEq0sbTZX1LVaateGfx/2Wz/EtluQ0DRRKExJsIGJ9+82mvQfDOzkY8PvD
	yvCq6/2dnKcReAkYl5+4yXvLQA7RoXpWUgP6lRWB9j3I5EUY2QnBHRaY4xHveoOafgwzZMDF94t
	1Lfsj3LB7ZO71LNDeuiGNp77fkwd8HUslQawFyaY3eJVabPD2wwctjtH4Oxrt6s9rg1jvE5KJmw
	//8PoU3Vk484/tQ9CXj1Rcd+11Wt8gAJK8BuIp+MElQrgFa62g8phzfB4b0z1LOVMIeQ5i369JO
	mBEv629on/6xfKjOGyFXhryYmEJCz9EytGbDNNj1Smaqt1WsYFk+sYObaTmF8uT2z6uZk3OcTKZ
	YyZA6iW5M/IgRJZXqtxHajU3a5bMzpESqefmdjq8JzS2AwgZbf0zBKf/7HjN1BZhVvVW6KZQp1H
	FwzhQNlW6knnS1yChP0fWNuCA3TT9bM3wJfKsBTIZBXaD32sRZCg==
X-Received: by 2002:a05:6000:2311:b0:43f:e791:a347 with SMTP id ffacd0b85a97d-44790191cfamr987888f8f.26.1777404186059;
        Tue, 28 Apr 2026 12:23:06 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-447b7ca64ffsm8837f8f.37.2026.04.28.12.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 12:23:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Ola Lilja <ola.o.lilja@stericsson.com>
Cc: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: ab8500: Fix casting of private data
Date: Tue, 28 Apr 2026 21:22:49 +0200
Message-ID: <20260428192255.2294705-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2019; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=4IHduTTlrzqZxMDlbKfFyIRuKuk5kBrb2i3V9qd7Lhk=; b=owGbwMvMwMXY3/A7olbonx/jabUkhsyPnPxf9f4W9Tax2ls477Q/aHnTweJnzQcOk107uwr7M vc9LLvUyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBFnNn/1yaEi19TrLbkPHPZ xCkj3dymZW3B4tmWPxVM/wsVWh5e4/vo4Nxe46NH+ZfcF5d8ecmIz2fmpWtPixuyvwTk+XAYbPE Xu/as3eSdSbq7uVfcH2a9MH3WlvyjNblBUeapqqmfwzQW6/4zLfRQ2X3TeMd2nRtHqky/5gYpfF xQs3W1vqQvq7L7JYFbcaEfbWLrbF9ZFpveOH1lq+dGBb/rR9rtbFX615vwqYeWFW9tUL+15Mo85 p+idaEpGfumcr4yX3op6+1LXUmPEMEQdcaovBdb1pysDmhPmO9suUSZMfogk1j5z8/ZfCGPF315 M1Hjf9nv7tD5XvbloaWtnwzf2a4N0Juv/qeZ95xCLAA=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>

ab8500_filter_controls[i].private_value is initialized using

	.private_value = (unsigned long)&(struct filter_control)
		{.count = xcount, .min = xmin, .max = xmax}

thus it's a pointer to a struct filter_control casted to unsigned long.

So to get back that pointer .private_data must be cast back, not its
address.

Fixes: 679d7abdc754 ("ASoC: codecs: Add AB8500 codec-driver")
Signed-off-by: Christian A. Ehrhardt <christian.ehrhardt@codasip.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

note this is untested on actual hardware and was found by Christian using
clang-tidy and code inspection. I'm a bit irritated how/if that driver was used
since it was introduced into v3.6-rc1 in 2012. Maybe this is a hint that the
driver is unused?

Best regards
Uwe

 sound/soc/codecs/ab8500-codec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index fdda1b747bf7..8ab2e60f80b4 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -2496,13 +2496,13 @@ static int ab8500_codec_probe(struct snd_soc_component *component)
 		return status;
 	}
 	fc = (struct filter_control *)
-		&ab8500_filter_controls[AB8500_FILTER_ANC_FIR].private_value;
+		ab8500_filter_controls[AB8500_FILTER_ANC_FIR].private_value;
 	drvdata->anc_fir_values = (long *)fc->value;
 	fc = (struct filter_control *)
-		&ab8500_filter_controls[AB8500_FILTER_ANC_IIR].private_value;
+		ab8500_filter_controls[AB8500_FILTER_ANC_IIR].private_value;
 	drvdata->anc_iir_values = (long *)fc->value;
 	fc = (struct filter_control *)
-		&ab8500_filter_controls[AB8500_FILTER_SID_FIR].private_value;
+		ab8500_filter_controls[AB8500_FILTER_SID_FIR].private_value;
 	drvdata->sid_fir_values = (long *)fc->value;
 
 	snd_soc_dapm_disable_pin(dapm, "ANC Configure Input");

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


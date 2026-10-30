Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381029;
	b=m2p9vnYgTKGoGu8h0J5MDqk9EIbM9F2YonURQy295EU/3uVJj6L6CN8+8mS471ga2XbR
	 LDzTwogGO/U5NU8or+HkdJG2XlL7mZKgJn26kpzmEQppUV2824shkVj73wjFxziO7j2zq
	 xli+mjWl1tpdU6mqoaH1gzC5Q+KOdoLf1rt7lYcHsWGrNtRW5zrvt18S8Mye3B5xxM75s
	 oi8zdt51zT0oDFYMeV3AemVye294ShakFq0vENEDUxZcX6BE9BX+mtKdVDd9Cr7SPb2H2
	 VInBAWMS5mRI74onzhNZ62I6mJmguWfR5Qq2Ru+MsrLdwr6iZZ1z5oFdQ2j7xeBGhvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=p5fsbr8zakmt2LaD3B1QD/vUAK+i4p9LYfhfMfto9I4=;
	b=2i/jbs9DLK7ZnoqnPpLKaQr7UMo9g5ZWPh2Jk9AFB/vrYqf2vbUr/t1+Hj2r/CcYaFa9
	 SPLAPqU5NIKg3xcdE/sKzFN75EvVL+utzJeN0HvO52IicP4pQOq3c6QPSEQrRRGsvHvHf
	 7989/F7xhnr2KVeHqMKylH6XdjKISSdh0JeYUjOCTVzh6+XfysvNGR+DQuq4KDozuK2+G
	 RBqmUnY8fvvNADn0bUNDLIqkEkCk8HJHX16KrTRzm8xw2vsiKNRojhvAKUlq3KpaPzOlV
	 tnkV8TetfipHJODHwpJrx8G3gNBwDnAgGqCDexmTQ4ktC8m0HU0hSBUSBSL7B+xl7Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bhHgymO6;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6941606A32F
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6941606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bhHgymO6
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so7362265e9.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 10:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793381027; x=1793985827; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p5fsbr8zakmt2LaD3B1QD/vUAK+i4p9LYfhfMfto9I4=;
        b=bhHgymO6MMnENdZkiHokMrGtGv7MvIJlxfivTq3iklWJlq6HyUCvrja7khiF4zaJzf
         4uvWy1T6z/2Y2vB7GYwxWnv8BDZitp9b5FkRruHRp5oDJ0H5boaR06krsojdYJ8svCPD
         QBgGIgKbMW9fZcNt6qVTWpYT3hUJyKbIxCGTb0xe0w+InGb20t0p3WlKQyhx634dhXJg
         KZ5YJ7OW25pH7oXD0iH2XXIinX8kV2Un26xPFdHiryW8LUqFYnx6tgEs9Q4Lw3D3Brjw
         HPqPAai3pwlPgjDc1JKT/A1RkaWQhjh/MAparoObdUzcd80WojCpChxUdM9eQSJCJo9t
         LYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381027; x=1793985827;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p5fsbr8zakmt2LaD3B1QD/vUAK+i4p9LYfhfMfto9I4=;
        b=rKOiokM9BnHaVIto/hotj91cjFk0m6QFxS0cUazXdX8hEeGpFFOQB9Bp67gJQi2TCJ
         EDqJMDxz9fZdStvc5GLJ41Xik6liFJL2v+aTtQvR3KtEXaBnqC+4F7l5cw8hTOxH0IX2
         B5ApXRfuxaGm2WDgObQiY0dCaeGA0Ncu3sk/BKfTz1KPFK0YX4Nv0P2cqM5ApvStIC2w
         hn3Iugz7XHyBXL40BNurHDR6tN0ih1c22BMLKZYBH82gL4cZ4AttwChBJjrUeC1El0fF
         8Ji286DHgbKdCR6CYgN7N+CiMjjzwINOHdFlN8FmOu64unjVCs6vEKwo7g6XFrMc9Ufz
         eCzg==
X-Gm-Message-State: AFq9FYLtREY7o7dEb653uy/6fbKIN/ujX9keMmvaaeSpf7CHj+Vdd4fn
	72nSNrxpaGr4oYztkeAlYQNLgGglYQ8xtko0Clvc2TQ2akuOyylEA3kdmlAsLuWw8z4=
X-Gm-Gg: AYBFou0yeM4wZGvZ2lzOYmf3jG/rV2aOaH/Zl/pcObXvd5JP/q+TYsVNymbAWKvatfh
	OlX9ZMWpgJDqIsYKwg8FrCpqd6L5X7u/U1eHWTrrnn0tvMiD+2l566fxlFSptzkgpcM+KOoO4AW
	Wxm0btOOlGfR2zG5+zbYUuwTNzOugQc8vb9w81mWUKyfAihyDgvaVAhE7J+67IgrhGopVc1jfoB
	cV+ww5RfbUpOrwuXMg4SxIPtqQWPIUPr6/AATcrdm4s3HUqPW9sPL/Hy/NdsAdJJvQV8CL04AHs
	+ASwE+SXYTJw6xRWhTaNffqnJsWD+lokIyR8SZhvfLkM87WsBgjYma69DHLMWLx1wREfxpbU7t1
	280a/jzb+jUly+hR2NZNP53Yg8Vlc3o/E+7uuKQuXYkfBwmg39eGKGHXigxCiEKJGrch0qSYthZ
	uesQKf5CbbQl1ecSjndWlFSbx70NoM4RnGGKKpphWVkdAkLCV1hp8e3YURspKm2B/su1rViRzVz
	k727IXKJjSe8fcYrvv9jwCIFV0z6MUEsPZRVFgiScUUkVoEmAn0m7LDpCdm8qul16v2QTS6g7Sd
	4g9mFvpdbLfXcJxqlsPNUTZE725Q9W+f4qUGAurBB0coHdV5
X-Received: by 2002:a05:600c:348f:b0:4a2:be6:60aa with SMTP id 5b1f17b1804b1-4ac17d16b14mr69175235e9.10.1793381027072;
        Fri, 30 Oct 2026 10:23:47 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a66caefsm56949685e9.5.2026.10.30.10.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:23:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 30 Oct 2026 18:14:56 +0100
Subject: [PATCH] ASoC: meson: axg-fifo: request the irq with the clock
 enabled
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBCF4auQWTtJS2MlXIW4qOMUBw2FjhoSw
 t2tsPyS9/4VlLOwQlutkPkrKmkssKcK6BHGnlHuxVCb2lvjDAZNhGHpMUpMKHlGeiV6oi2LS3N
 23jsD5T1ljrLs5e56WD+3gen9z8G2/QAPnbFrewAAAA==
X-Change-ID: 20261030-asoc-axg-fifo-irq-clock-120278536630
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2821; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=oVESQqWI9ddX5fwFsFHblshua3jUvLRhTVEHMsN3Hq8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPLs0rq1z+7l7V64M1PfXPE/revDg4b9F/g8NHP62zy
 jn3KePV6o5SFgYxLgZZMUWWGu5q8XeSWl9mTde5DTOHlQlkCAMXpwBMJNSLkeGoU2L32W9tq7bH
 Txd/uUK8zPlqU9Z9J8OVa27YP/vQJfSLkWHGX29VWemkFcHHeO6Evzt8ZuvSQt8lSlPN/x+xWLt
 amp0PAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The fifo irq handler accesses registers which need pclk, but the irq is
requested before pclk is enabled on open and freed after it is disabled
on close.

Request the irq after enabling pclk and masking the fifo irqs.
Free it before disabling pclk.

Fixes: 6dc4fa179fb8 ("ASoC: meson: add axg fifo base driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-30e88a8a-f33a-40f0-92aa-9ea62c5b7299
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 75909196b769..edf43b7fb5cf 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -244,17 +244,10 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	/* Use the threaded irq handler only with non-atomic links */
-	ret = request_threaded_irq(fifo->irq, NULL,
-				   axg_fifo_pcm_irq_block,
-				   IRQF_ONESHOT, dev_name(dev), ss);
-	if (ret)
-		return ret;
-
 	/* Enable pclk to access registers and clock the fifo ip */
 	ret = clk_prepare_enable(fifo->pclk);
 	if (ret)
-		goto free_irq;
+		return ret;
 
 	/* Setup status2 so it reports the memory pointer */
 	regmap_update_bits(fifo->map, FIFO_CTRL1,
@@ -271,17 +264,24 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	/* Clear any pending interrupt */
 	axg_fifo_ack_irq(fifo, FIFO_INT_MASK);
 
+	/* Use the threaded irq handler only with non-atomic links */
+	ret = request_threaded_irq(fifo->irq, NULL,
+				   axg_fifo_pcm_irq_block,
+				   IRQF_ONESHOT, dev_name(dev), ss);
+	if (ret)
+		goto free_clk;
+
 	/* Take memory arbitror out of reset */
 	ret = reset_control_deassert(fifo->arb);
 	if (ret)
-		goto free_clk;
+		goto free_irq;
 
 	return 0;
 
-free_clk:
-	clk_disable_unprepare(fifo->pclk);
 free_irq:
 	free_irq(fifo->irq, ss);
+free_clk:
+	clk_disable_unprepare(fifo->pclk);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(axg_fifo_pcm_open);
@@ -295,12 +295,12 @@ int axg_fifo_pcm_close(struct snd_soc_component *component,
 	/* Put the memory arbitror back in reset */
 	ret = reset_control_assert(fifo->arb);
 
-	/* Disable fifo ip and register access */
-	clk_disable_unprepare(fifo->pclk);
-
 	/* remove IRQ */
 	free_irq(fifo->irq, ss);
 
+	/* Disable fifo ip and register access */
+	clk_disable_unprepare(fifo->pclk);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(axg_fifo_pcm_close);

---
base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
change-id: 20261030-asoc-axg-fifo-irq-clock-120278536630

Best regards,
--  
Jerome


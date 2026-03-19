Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1DA3ACEE1
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 08:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773909902; cv=none; b=AvbMY370mCF300bdgSFT0g08ghms6KVa/kJcZoeDqEO8D3YL200vYtEIjY/SX75BFRiBFcpCKE/FsSYeRxlewjokfQMlvZEJWZK0K7gKLqXI/Kyvd+qrWil87CccxlqLy8GAa5ixJWE/qRXX2PlAf8kp9jgkGJ+YNxQQ0+6sK1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773909902; c=relaxed/simple;
	bh=gxLBEZqdXaKc856agQwhtmyN5sTi6Yx6xfnEKXHzg5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G7m/+RSoErPQje7z6OZnkSgoAA4RxRdPiFulPZmYvimbgSVcefx05WXu8ojm6jmbjYpT2JrIuIO4sWvHtQW0D1aMolSSBljLCe6VMReTDZqIzinKATC5tDLcL9r3CKuG1d1xxwlNfQAYjXBnLj223/Ks6MIhZK21D8s5AsXnlMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w2FOyMnD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w2FOyMnD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so8896445e9.2
        for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773909897; x=1774514697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CSYKzBrwIsqKKLO2G7NMhCI1+z9REObNSxdVlwMMyGA=;
        b=w2FOyMnDG3jt0mHYKcsIGpcWDzwqIk8cCyDCGfF2jW22hKmUmQi5H43iJSRlCLG/Kq
         bdZH+h6pXlQ+h8o4RGgzR4jYiEP2utIxreuyoF1ZwbxA8CuEL/h+Xo5MA0lT1miqn1qu
         iw9ck1ifE78vwCE4wE5FYSyQEXcwwYXXi3FrBzq9gtPGk6ZkqaHHuqPVKKKB8Yhjaykk
         T9EpN3ZjZWWk9hfoe+LR9UIhiDQOgWmotsndYAXdruiH8yvpgQfZLQ6WFbZx4F+hekCc
         B6DYQCy+pwJyjRmtZ16nvTCZxjhX6Akt5yb4dfnmKAmB8Aw7oceIhJYImh12spHzlxS1
         nZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773909897; x=1774514697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSYKzBrwIsqKKLO2G7NMhCI1+z9REObNSxdVlwMMyGA=;
        b=FSidGAG2V68ESKGru8L1IyaZkNXwB1hI++a5UDKRZtJ3T3DkSR4sIUDBFmpaq+NqwM
         CfEuWa0Wp8xMd3BTJet4quNJmaVderCrVZfVj9sLv7e8QclteS8uhjODl3LRtcLFTEJm
         EPjTZSrTQV2xyDqEE2xq2cENt67xiHkXvrEiq7gHgU7hsmBIlK0mVXGJyWGxdEKrIGbY
         wUZwloLxVpuipWlDFb8Wgvq67ckLe5UCsz4B0+h4HtSzT1K15VBqKCgD7GlKU/uuwFnq
         lxUgYpcc/AY+Co2H0IAFW2997SxW8HOfnAycIlN5hZZXpqY2eYnfwtK/+023uaKG83cS
         GmJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWJQSUvT5Zign+6UOhbnIz7agb7LSWwb1VtBZCvHLSd7bkMug8tDyEVk/YVhyNUTac08SpQSBtJZ1V0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMP84yvLPId6sNVYYG8t+tepIVvB4OXok17mY03GoEJRTquBHh
	4f/D0oZDHQzZBecgXMoWfA3myDkzAmVt58U4koT0Exp95t7Gvg82Dcgs8995k9bEDw==
X-Gm-Gg: ATEYQzwyFT7o4J8k4a8tJqV52tUphZxss/AW0IP+/yPCHQKDLpRSyoWj+MEq5BjAWiq
	rPVdADsu+O0YmpU2XWEJMOMKr4kjsVL/DXpKng002csgeMrA/GUdp72NZmbCZ349tdKUxXAlLJH
	/BP9i3siCz9MRdWFRMPpOxeqH0UOiPfq9RVvik4Yg7Hekaj09INbdvXWyZgGKqI4bMYR4UTPyh9
	iUc0zCvKNsDZoPuqbgUAB59eFfGJ1FqMtUv6RVrCMzE4V91uvFOq98UWmRg3EGY61hBcuYcbCLj
	EweBs9K2aF7QU3O321yziTzrwSjbnIrboTkKEEIbXc39l/zViirVaysyOswFGhD1BoJjPy0QYxk
	+rJ5s/5jhzl4U2t7NAJ39oyJ285sYsRUQBJcdSyepf1LLNOzMk8uXLw+XIbqXCBUnZtKtnLex8+
	Wi85gQRf/rhM43nwzPOtYCEJ91kLyHgPz3/lf+3nGRNiluVSTaITOydlA5MqOQCsV7N5XyewYjH
	HBnaT0a2iNJSp6zcBzRByQ=
X-Received: by 2002:a05:600c:630f:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-486f44384c9mr112835575e9.12.1773909897008;
        Thu, 19 Mar 2026 01:44:57 -0700 (PDT)
Received: from pickles.copeland.me.uk ([149.40.2.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fc61dd4asm12899015e9.14.2026.03.19.01.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:44:56 -0700 (PDT)
From: Ben Copeland <ben.copeland@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ben Copeland <ben.copeland@linaro.org>
Subject: [PATCH] selftests: alsa: add config for required kernel options
Date: Thu, 19 Mar 2026 08:43:47 +0000
Message-ID: <20260319084347.134744-1-ben.copeland@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The alsa kselftests are missing a config file to declare their required
kernel configuration options. This causes the utimer-test (timer_f.utimer)
to fail on kernels without CONFIG_SND_UTIMER enabled, as the
SNDRV_TIMER_IOCTL_CREATE ioctl returns -1.

Add the config file with the necessary sound configs so that
'make kselftest-merge' can enable them automatically.

Link: https://lore.kernel.org/linux-kselftest/0e9c25d3-efbd-433b-9fb1-0923010101b9@stanley.mountain/
Signed-off-by: Ben Copeland <ben.copeland@linaro.org>
---
 tools/testing/selftests/alsa/config | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/config

diff --git a/tools/testing/selftests/alsa/config b/tools/testing/selftests/alsa/config
new file mode 100644
index 000000000000..810cc31f09b3
--- /dev/null
+++ b/tools/testing/selftests/alsa/config
@@ -0,0 +1,7 @@
+CONFIG_SND=y
+CONFIG_SND_TIMER=y
+CONFIG_SND_PCM=y
+CONFIG_SND_PCM_TIMER=y
+CONFIG_SND_PCMTEST=m
+CONFIG_SND_UTIMER=y
+CONFIG_DEBUG_FS=y
-- 
2.53.0


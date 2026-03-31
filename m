Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA195423A9F
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 16:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975012; cv=none; b=c3MOlvaB4+TrKQyzKMqQ9UceYippx9H3XdHpZonTl8cNsph0B/R7lFmkHqS6cRaLK5z5+rCrkaH1XcwGeNNUuQnGoZAnoZphheGp5V3Paa4kNMW6sycGY8CT4GPobjxTQde3mPXPRYYLS9xU/FrWnQOJNK4dEjJQtySb1WuvBr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975012; c=relaxed/simple;
	bh=unhbzcpYk597C2G00Db/mvN00cDQeTpFowiN+h3Rrww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i48Vex8g2PuNHMA0bskpybKTJjAqkvpj8byXMKe/FC9ZMlBcBPvVIaZSlsEhRMGQtl84TriOQXpoCb9Pb5IOCIoNX2ui8+eKIRBgLnuvGJbSco1occiSyRI3KUyh7U35RCxtd4Jpy6cQquEJxPj19ZWq9JJfWECdJ5wc7VHk7FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2/hPJlb; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2/hPJlb"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so2759907a91.0
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774975011; x=1775579811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zYgkKc0haN8z/URfP0RW5IhHtINqX0yhqpPrwSnH5c=;
        b=D2/hPJlbUydAJdlkAadR8+YRYxOHANX6aOswYqgBlJUrtDC5v+rUklG8BlaOzEMERD
         whSr+b/EWHOyGv6KfgcRiJ7Qkq8ArpGiHE5z6+esxnlWp1vvFAhM3D4mjGeC9jQMZHsi
         QA2WhlOFy7StDfBm9bmcHQYuHCgAxCpCc0pbDOwlbTb+CxGA3w+zv/QKhoeCNz4u70ix
         UuA/LDOHtEsfXEcLvkGNWrKx4Me5oTVkKVYUXGWSpvvJ3bLKkGw21hWZftw4+BhvdGoT
         JAx+m2+Qxp9UZcge/Lf4CE9o6hbWZSq1NyhG661IMZUhcBmcluZFEwxp79axxsb60555
         sPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774975011; x=1775579811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3zYgkKc0haN8z/URfP0RW5IhHtINqX0yhqpPrwSnH5c=;
        b=e0rk67BB9DoS0a9dsrTdvzUIm7BZX9geeTrjYgCiVzLRdHgLOJOC07zxwOhDDcjxc7
         KnfDEkM7d03oXp5xqjlU7isB3iH8+jr37tBgW2aNVF2QcEw1JI4GYuXViiZJV1qzlHrt
         oSiLQh7w8Gsx4vsox66RLTNJVFvrcmgXcdqYTUJBStloQkucGU1ak04ZLp7+SXTrENmG
         OyK4MzGPdtFgLWws42DWQzGvXvCjf1DXJP5uOBmCdwoZ5mlprA+pjd7xz1PAwR78ZNZT
         1zNqJQ3uecnvMU525Av6YLxfQj09QySk2N8LVNLtlmC/Lk3xEl6ylTdSFB6Ivv+n/SWh
         YcYA==
X-Forwarded-Encrypted: i=1; AJvYcCXTpBbyqoVR0rk/xK3/64xGSlsIt1J4+j0FBX8ScwxrVXscIx+OqrVKuoCnPM2nGXbQepW4enwQHt1x4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoqwReJs7clgL88ggS90jgvcp+pZjHJbLGoq7dVnm4dn+jZ/vU
	CU0wMN2bhQB49HmifqbNrdBx40UXMxPOGb2r7uWQM4XgLT+QGkHs2Llm
X-Gm-Gg: ATEYQzxoQOKvaLxmpEXVRcZBSI3BfrxwtFQVdAs1cK/P/HBPpZlYh+BWdFvhbcF3Xnz
	6l+3MFJe6nUHJ7SZANLkUnbCQnEqdEtPGx3Oj3e3c2+Ful9U8ee83kCmVlpJsMlqfsYUXIm7AMC
	GlLXz8jyCBqa+qaQUglIATxe2U+ISbEewymxlHsN4jXDTIFs6kmJ3IgCwS7MEB0vegPDniSujno
	/5PyilwPabAa6xFMvw8uapD97FrHCg1O5BRaAKrF9m2Q6lHd1XjcV/EVoxg8c5iss/LBXQ6l/2O
	GbrhLl+7oJZtxUcMkkOXnGbVWXl7A4AD3sI4ZaDoeGodfrLWLa50Et1FdiyUW4vnUBmxrvoAqey
	iqJ73+1PbPt/OW/xDUqpuesTlnMrS15mh0caw+NAQKfEEsp77jtY71AmXig9ha8qcJ3XQh80+SS
	efLlkp7MBrODA+Y/fjBElRmxEloRXtrPsDWlJGMYZDHklt1sEq
X-Received: by 2002:a17:90b:268f:b0:35d:a9bb:1e33 with SMTP id 98e67ed59e1d1-35dc6eb9dd7mr26447a91.11.1774975011066;
        Tue, 31 Mar 2026 09:36:51 -0700 (PDT)
Received: from debian.killsync.com ([152.59.222.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24b02a11esm116069255ad.65.2026.03.31.09.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 09:36:50 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: broonie@kernel.org
Cc: cezary.rojewski@intel.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v5 1/4] ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control error
Date: Tue, 31 Mar 2026 12:36:32 -0400
Message-ID: <20260331163636.15238-2-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331163636.15238-1-aravindanilraj0702@gmail.com>
References: <20260331163636.15238-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

If byt_rt5640_prepare_and_enable_pll1() fails, the function returns
without calling clk_disable_unprepare() on priv->mclk, which was
already enabled earlier in the same code path. Add the missing
clk_disable_unprepare() call before returning the error.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 103e0b445603..cd611c0da4e1 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -285,10 +285,12 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		ret = clk_prepare_enable(priv->mclk);
 		if (ret < 0) {
-			dev_err(card->dev, "could not configure MCLK state\n");
+			dev_err(card->dev, "could not configure MCLK state");
 			return ret;
 		}
 		ret = byt_rt5640_prepare_and_enable_pll1(codec_dai, 48000);
+		if (ret < 0)
+			clk_disable_unprepare(priv->mclk);
 	} else {
 		/*
 		 * Set codec clock source to internal clock before
@@ -303,7 +305,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	}
 
 	if (ret < 0) {
-		dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+		dev_err(card->dev, "can't set codec sysclk");
 		return ret;
 	}
 
-- 
2.47.3


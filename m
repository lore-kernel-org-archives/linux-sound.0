Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B743DE45C
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895434; cv=none; b=lMKicthNEuWfcRtA5mvmzMvVUmGAcM0Es8Gw9RpMlNH5gfMqaFoG2CCLk9zCNt4zCWwHWF7tgUNtzL6Pkf6AyywTlNJcjRE5Bo9PTfSX6Gh0wQDD0Nxwz+SchAsPDc8ZZveuTurl6HF5N9SPUsbcolQxNLPyxT4D9weCgkGEiBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895434; c=relaxed/simple;
	bh=w0te3hTfrZVIIhV7OwHpsQXbSc0kSRbo09l3Nd3rK8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HiJPx+jGl+B43xrzYBvF1yh9W451xWZCGIyAXtheIdV+uAEH01c7Rh8O4CHTV0aUgTVdUJhiJklseev+EHwkbrKtn3sYj0gnvXHfLkCTdyO1VmoI8cwS5STh9kPE8YyO1hFxp3aexyICRLAygxdU2ckVNsa5edxvGbZnMuz/ldg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQ1P1ega; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQ1P1ega"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37d55e8d3e3so227259a91.0
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 01:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782895432; x=1783500232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8vY9CqWVGTyfDpNaPewk3sawwCCcX6z0ljhxWV3QdQI=;
        b=pQ1P1egaJ6MUoVn0OlyEXLhAHrg812awdLWJUewzqEFe8UQRgkbJcw8YPN2WEXSO2J
         dLOWxaZoSbMD/cokgtTdXvnXwK4CV8OGwJ7HcAdanMD8LhFqSIJs+zO3FC7liIr6xfeq
         B2GaxZtl/7L6Gbf1qfd0ng6MJW7rboSyXvq98OmR7nPka+6lg0N4uMen7W9TGBIYkWxi
         +btvrnjMV/CoiHE59Z4VdCeUsnMUJJXF4GcJWImuVaDmfkqjYgEpDBL0aWFm/VKDRgC0
         iVSL6+Zb1dMrVZEAw31foH/rl8eSX25Eu6yYZi7NupaBfPuwm5eQY6Df8FMT8zXBz13B
         CxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895432; x=1783500232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vY9CqWVGTyfDpNaPewk3sawwCCcX6z0ljhxWV3QdQI=;
        b=RGmVdqXeQyxrgIFTh1nixndK9rsQ6I/RlMvdxYu4r7G9TWeLuXEXieZVfTQ0Jxnk4u
         TDuGE+9axHQxnS/FvkUlTyAkgdgJYN7/CPPns6DcWAWrrilGqiIcXAdx4u4jB2NynlpZ
         vM23c/QeROIRfCK8zv+Y5SuV6V7GXPIxBQdoaTUvuaPCx+34SKOibrBph/CA0UjmaTyc
         jP70dxi2W1VwABqUCZEom/FGD0X1RqmlFqaTkt2LwWE02gkSvweFoajUyXUNbriRllh+
         etdwJqrHGpJGH6dbJOSJZPd30l9GRgVrFqVAqIkv+xkIHwUSBLhlNzm/snyaIPGxY6IR
         iMUA==
X-Forwarded-Encrypted: i=1; AHgh+RqsfebfkZ8kj58yCPce4tNN+0XOqSa4zpVZRk9dN6q1NGYKIJMy00qPC6uVFkuwKw0608BumXj8dbvevA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT/gfsbBhQURCTDiDwW+sCbzUdJ2BwdBvHCrEs7hG4Zimal6sA
	kONdxhs/XBDfUc08hcyErVUyTcrHTgENnE23/BELpHKtSzhMs4bBFlBm
X-Gm-Gg: AfdE7ckTeUQcV9YwZerK9JCaPElT4EPmcLmKQMcZclCmwgC5I9/wQZoEcuogfC+4SJE
	kGI2mW6vzhcJNNzf9mfmVmG+KJM0mur7PW/wvaVnCPPnaikBXGfmFoOudxU4qxkmB8IjTHkDLAh
	s2hmDbRIeqD9olQdVPjedvrz/mqaKqwQa+4gbkgvop4h2c+7V7RkaByw8mhfw1p7zeZkZM4hkbh
	QRFYMd7wUZjv1TyH54qBX4eOvd76iKKKwYhdf8SSzVbn2TTVNrRP/ygboXhgs7tbcIh9YbCs18q
	zeCAnJ8xR9wgBOg7jKHbWHtD5PEHwJvibhT07ElEPByDGzPrFqz0wGSB/O2y5RhN1gzlhoz0nah
	PWrLMxkaQNyPbZKN+N67Uzm8ID7B3QKMJT0etPTM6cPHXD+QO6P4+ZiAYxYBLV7DO+ZdfodDKps
	LpbMJu9YGUkUtis3Z+KD+3etHgTNzgkp4hQDfvBCDxrGqfX+k=
X-Received: by 2002:a17:90a:f943:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-38086d88420mr2107320a91.18.1782895432496;
        Wed, 01 Jul 2026 01:43:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm27965505ad.63.2026.07.01.01.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:43:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: samsung: i2s: Use dev_err_probe() for iis clock error
Date: Wed,  1 Jul 2026 15:43:36 +0700
Message-ID: <20260701084336.308886-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Switch the iis clock error path to dev_err_probe(). This folds the
dev_err() and return into a single statement and, when devm_clk_get()
returns -EPROBE_DEFER, avoids logging a spurious error on every probe
retry while still recording the reason in the deferred-probe debugfs.

No functional change other than the demoted log level on deferred
probe; the returned error code is unchanged.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/samsung/i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index f80f697a5d55..68fff67b9660 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1448,10 +1448,10 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	regs_base = res->start;
 
 	priv->clk = devm_clk_get(&pdev->dev, "iis");
-	if (IS_ERR(priv->clk)) {
-		dev_err(&pdev->dev, "Failed to get iis clock\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk),
+				     "Failed to get iis clock\n");
+
 
 	ret = clk_prepare_enable(priv->clk);
 	if (ret != 0) {
-- 
2.43.0


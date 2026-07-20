Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123DE4C6D
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 00:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784506258; cv=none; b=SzJeQkhlH3/xXhpPPtPhuQ43fSIiKmD1GUPwXUAUL/zWuv3Alz4K7ipSDB5u2RmkVerthWI3jtWiQl2FtAnp43BCwsM13UTQpVHDZAnFEwUNndGNet+mb1ItlHJTqlcbVzIJxyilkqtO953xJ1CEEWDsgaMvrAHcXQ5L2aPe9s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784506258; c=relaxed/simple;
	bh=XTw3AwFb1YcwTYZdYmPrrrNQJb6VvWRBt5MJz4ibYUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j/yrHq/Pe88pZRRv93kguY6nR3y2W561yRkjzdaXojMhFemcO2XEbVkppiz8GhcMR6cpGbaJrkZfsLSZYz/jiaf/hcDB0eB4eSPsiNStzYUpRRwStlA+dw+9jT3GXWMX4JruEzaWjbUwswUt6HZsRar/vzmfTuhH+RiODsDM/dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM+19RE3; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM+19RE3"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca7c1176317so6971793a12.1
        for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 17:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784506256; x=1785111056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcHvPzL38Wp+Wu9dffoXAEVAy0XziQJGzhqz3Hssx80=;
        b=NM+19RE3kPYhbwVsTK1jpJXCaj0qiWeqyNJSxuwO3xqrgVUYfG7BFQzmtfEY/FlgtD
         SS/Klh0c6sqlwcbnss52Fg5pgcpg1mqI8IyYvczkvrlA1B6Xy0rjxIw/Z13sOt3F7UI8
         mpVbbd80uW/D3pZGKTwKRQENkxy13UIUbMhTVWPoamMW5xzQkmfXJANVKlFoRkYJVaTU
         MWWqPRE53LRfze78eR0lWV857p3eZjMUN3WNd8xpE9GJNCR/XWGg1iU8KSN2HNSghRR2
         AtyzP8uKtFjyKJdHO9YTz77Vg9UlgFK4+hnSWX+HtZApnPPV9Sakv2kSzModMy41sO9Y
         PUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784506256; x=1785111056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcHvPzL38Wp+Wu9dffoXAEVAy0XziQJGzhqz3Hssx80=;
        b=Rqe0sEnBRttgvuh58n+YSONTLCiKOqBfbrP1BITdzFFWgumKKkgqLS2hLHQI9NEqDk
         /F5oDdKVMzVI5tKXWSBaqtkBd/xtPVmZVPVWSBOQn7COE9n5fjIHfb92urtxOhbDoNo7
         4allSrY3PRYBdGjMNpyXHkeOSsPB3iUJPIH/VGFrcU9KfnTFFaESjPoV1gLpkzZQ4ru1
         88J7JldRhZAygUd1cOs/U6C88TzeB+uJHlgCdwfWTWdzP5Ka+VvcdGXIYcedp8we5GW1
         TBWwFa/4eN0P9IJKQuWOzUVGXpzwGBU/y+ctQdROEdcTgpLz22ajxpbJ0qqdvJ/V1+o9
         wmpA==
X-Gm-Message-State: AOJu0YxaD1r+rKs1A5dJtPdkDTwIdApxJ1mwfAStqmCxtrBGrU3mE2M6
	qQF4X3quRad1Pw2UGt2sQ02bVm11R/q41GMw+ntBYgoaUY9UMDltec97K82CwA==
X-Gm-Gg: AfdE7cloKkvUzv2n17KjhHy3qro2dllPUuK9Em0tdVnr/obm5ZO/EZC2vuXKH/418VO
	/0voY4cCiDCYBCtaQ1JzP5Kn6BeLELqpZM7SLaqEuAElBMxInMvE5FPTW/1oCwsiSI3fiTLiGga
	L37yI0uD4Ywr/QsSlC46mRUSAGkxJOcJY4RLnO5Amdybs8L+SjLktSKmVe+yv+j5aiuVtCKESSO
	GiuPWKMIQUNnpiRGhTgDUUHlM5SgyRRXNegZk68FLMV6zpobZHg+JnLjEPCN9LPsGOilaWJAQwO
	UqYSq9BMMUYKzEdFGq4qBi8dl/vseoVkuK9RwQFziHpgFOgwOzGEXPOKLRRkeXm1RBNp0YtKm6E
	c8OjAlGSdlnEikyJb17dHQlFkcupgOr83pyko1Swy8tulGcoCfgL6xw54sV20tsyewzuiMopjWs
	h/Ti1VcW6Nof75BWm6XWXXEyqMrzlOseblMR3/VNXSuVoO02epQDpgJAUH+VwxWZ6gkBbBI8MzV
	+wM5nkmmvGcPYQY6Hjt4T5Lg7ysejSbWtoK9jnbOW2zKaZdnVPwpNNh5iytJKc/Dg==
X-Received: by 2002:a05:6a21:1404:b0:3c0:fab7:bee0 with SMTP id adf61e73a8af0-3c3ada77847mr12682703637.62.1784506256276;
        Sun, 19 Jul 2026 17:10:56 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517aada63sm3680944a12.3.2026.07.19.17.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 17:10:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: amd: acp: Use pcim_iomap_region() in acp-pci
Date: Sun, 19 Jul 2026 17:10:54 -0700
Message-ID: <20260720001054.1439409-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert acp-pci to the pcim-managed PCI life-cycle. Replace
pci_enable_device() with pcim_enable_device() and fold the
open-coded pci_request_regions() + devm_ioremap() pair into a single
pcim_iomap_region() call for BAR0, which reserves and iomaps the
register window.

This lets the driver drop the manual pci_release_regions() and
pci_disable_device() calls from the probe error path; pcim releases
the device and region automatically on detach or probe failure. The
error check moves from a NULL test to IS_ERR(), since pcim_iomap_region()
returns an IOMEM_ERR_PTR on failure.

The child platform devices only use devm_ioremap() on their sub-range
of BAR0 (no request_mem_region), so reserving the full BAR0 here does
not conflict with them.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/amd/acp/acp-pci.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index f83708755ed1..98771323eace 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -118,17 +118,10 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	if (!chip)
 		return -ENOMEM;
 
-	if (pci_enable_device(pci))
+	if (pcim_enable_device(pci))
 		return dev_err_probe(&pci->dev, -ENODEV,
 				     "pci_enable_device failed\n");
 
-	ret = pci_request_regions(pci, "AMD ACP3x audio");
-	if (ret < 0) {
-		dev_err(&pci->dev, "pci_request_regions failed\n");
-		ret = -ENOMEM;
-		goto disable_pci;
-	}
-
 	pci_set_master(pci);
 
 	chip->acp_rev = pci->revision;
@@ -161,24 +154,21 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		break;
 	default:
 		dev_err(dev, "Unsupported device revision:0x%x\n", pci->revision);
-		ret = -EINVAL;
-		goto release_regions;
+		return -EINVAL;
 	}
 	chip->flag = flag;
 
 	addr = pci_resource_start(pci, 0);
-	chip->base = devm_ioremap(&pci->dev, addr, pci_resource_len(pci, 0));
-	if (!chip->base) {
-		ret = -ENOMEM;
-		goto release_regions;
-	}
+	chip->base = pcim_iomap_region(pci, 0, "AMD ACP3x audio");
+	if (IS_ERR(chip->base))
+		return PTR_ERR(chip->base);
 
 	chip->addr = addr;
 
 	chip->acp_hw_ops_init(chip);
 	ret = acp_hw_init(chip);
 	if (ret)
-		goto release_regions;
+		goto de_init;
 
 	ret = devm_request_irq(dev, pci->irq, irq_handler,
 			       IRQF_SHARED, "ACP_I2S_IRQ", chip);
@@ -214,10 +204,6 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 
 de_init:
 	acp_hw_deinit(chip);
-release_regions:
-	pci_release_regions(pci);
-disable_pci:
-	pci_disable_device(pci);
 
 	return ret;
 };
-- 
2.55.0


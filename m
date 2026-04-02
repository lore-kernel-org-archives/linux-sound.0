Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E8CA6F
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 00:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775088652; cv=none; b=o3SIDqbe1pOb2ivZaUUpgXjex+jXlGOpWt+SLEwkVGFK5tCNGAUfecjGk22oh0EyyIy+8V+dS7HdOg97SeW7M2OwtU0mkObF4E724AZTuZNvnBhpz3U88kdOgeTwBWmxGip+Y1z5WLRpIwDUhi293ExSp0Q8uGOZDp40CYNrNBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775088652; c=relaxed/simple;
	bh=HekqW2dMqoMilDB42K1n5rR8BeYL/uqTucxSPG4HaKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uIzeNpYEfamFYiNO9iacIhf7ZLZzkWvJKnl/ObKoJGUTDRtfncAk3kRGDiF9iah6o4j4z77LOr9gfcdYCbRFf7tBerPw16epSmyleZvQYODILDuWaENtz94FaTdRrxjdsDOmtLNRa/AxiVkAoAB68EWU6VwMGX0PHiv9g5fQEY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fdma.com; spf=pass smtp.mailfrom=fdma.com; dkim=pass (2048-bit key) header.d=fdma-com.20230601.gappssmtp.com header.i=@fdma-com.20230601.gappssmtp.com header.b=P/axVogC; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fdma.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fdma.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fdma-com.20230601.gappssmtp.com header.i=@fdma-com.20230601.gappssmtp.com header.b="P/axVogC"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56d8365c1efso191346e0c.0
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 17:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fdma-com.20230601.gappssmtp.com; s=20230601; t=1775088649; x=1775693449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGFzi00RYMp+Jq/w2qL1ZxcIyjmAPG7vYyfYHwsSjjI=;
        b=P/axVogCcZslzWrH+kWI9toKpVSnfnLyKW946NXSdjikGFARWHeKvBI4aG/ZHnTFwg
         mlqkI/3yN0+jJOuZwAkBViXEl8Hg0KtG8rMhRMJHR0Il0dzBCZO1cSeULItrhQQxoDq9
         nNYAvSQLw45EZJxTw8fLFoKU1s6L6CIHTh4/gb2Vbu8YcdAMMM3DzJBEQZ98z0Pei+Hc
         jqipToUR44vx/QEyO3XZzo+1wfHI1mCEZ18A74OsLTHj8PBSNae/tEJZgF4zu/Lcvywh
         rghOfJhoL8Y+XCipvlAIWh4Bxnw9ai5X3w4ptFi8z4cYUwQ5zoWyZ+86w11xW55tIblu
         0NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775088649; x=1775693449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGFzi00RYMp+Jq/w2qL1ZxcIyjmAPG7vYyfYHwsSjjI=;
        b=Zud86xAhwRiAZML8uGo/IoR3ooQTAqPlIwAqYvloNGedLM85nFoybiEkoAg/YwgwHq
         7NhodAsAlGz9/JyOwa7s11FthanPDNl6B4wxtJYeQdxwkLOq95LQQkh/8CDc4BfFxWfK
         KzuXNsUx4Yz+p47AN+VCAZ4Y2Vg28rVAcr6CCF0Qd+W1RpU0auRvCCB1hqgEbiu3nU91
         n03vn6Pd53GvhErl3yN6uTRPfMFa5XZKgrq44lrrEJZ7jIvtiWxyLujjulJglVYwYfAs
         TfrWIn/3fjfPYfbs6I9UZZth37JqZQEXNeyfhRm6sQ5xR08BjcRirSUF338OPNVfWVf0
         Xbzw==
X-Gm-Message-State: AOJu0YztRnOhqq50FBF+zBMfy82eXLdXaQToedRD51upCUN3tVDHRauK
	5ZPAaCPmlokCcxl/epHntD8/giMoHTTxCexOSE7oWqKl+z2bpJwSwGcnuiGwOD5HfkqCCY4KHkd
	LYZm4OdmLOw==
X-Gm-Gg: ATEYQzyeDqGjRPfQIYRtD3WmevBImwjHWbHD4jXSCaToZeX9eR+FYYaUfRQlIdBdiNO
	gouhe9m+Qvs6nRHQvOQE3eo0X9SGBpmSOIxMbuP+d3wSVvgeIPT+X+v9kM+9PS2uWeVsR2bkUrQ
	MGpmBkS90rYH+rNvpE+5RmiXPqDr8u2k7n7jsUeMBgj8MUrvld2V2N20CgZOKcPOmwTugPPomxP
	JgLYrlOInwx79jAVSiA+zC91KXfpcG5eseI7XDyzCtsOIZ4LTdq/qnIjfGCjJs5SPo81puJPKZw
	cLTsW4nb3THBrgs5qE4hkEC2jcb7ODDotI9S4qtB3t7X7mha1tNSwKU/aBLZJGjZiWBYbYpsJvn
	UMdKDg1nBFPqdB735uwkzNFfoQFW/yCKWCsv2zi96b9sGLeVoiMD5jdxMvGRlOlJMayRc7yx1Vn
	kEWv2LQZaG1fMNvyPvkxlg+gwcHD/HuroyxXJCIOM5IEYvfQOX6npLCRPaqFdMeh4toP0mx1CVt
	4Ga359wp0VTdG8VWlugccvxLAgONaOza5mgrSmcvasmtrKZ+qo=
X-Received: by 2002:a05:6122:65a0:b0:56d:3451:4cc0 with SMTP id 71dfb90a1353d-56d9f16db1dmr113655e0c.7.1775088649611;
        Wed, 01 Apr 2026 17:10:49 -0700 (PDT)
Received: from cashxps.fdma.com (c-76-137-39-120.hsd1.fl.comcast.net. [76.137.39.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9bb4csm1529312e0c.10.2026.04.01.17.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 17:10:49 -0700 (PDT)
From: John Meyer <jmeyer@fdma.com>
To: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Cc: ckeepax@opensource.cirrus.com,
	rf@opensource.cirrus.com,
	david.rhodes@cirrus.com,
	John Meyer <jmeyer@fdma.com>
Subject: [PATCH 1/1] mfd: cs42l43: Add CS42L45 SoundWire codec support
Date: Wed,  1 Apr 2026 20:10:45 -0400
Message-ID: <20260402001045.16933-1-jmeyer@fdma.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CS42L45 is a SoundWire SDCA codec from Cirrus Logic that shares
register layout and firmware infrastructure with the CS42L43.  Add
support for it to the cs42l43 MFD driver.

Add the CS42L45 part ID (0x4245, mfr 0x01FA) to the SoundWire device
ID table so the kernel binds this driver to the hardware.

Add the CS42L45 DEVID constant (0x00042A45) and accept it alongside the
CS42L43 in the boot_work DEVID check.  Store the detected devid in
struct cs42l43 so downstream code can distinguish chip variants.

Handle an unexpected boot status on CS42L45: the chip reports a value
outside the normal stage 1-4 range when already operational (observed:
0x60c10609 on Dell XPS 14 DA14260 / Panther Lake).  Treat any
unrecognised boot status as "device ready" for CS42L45 instead of
returning -EINVAL.

Tested on Dell XPS 14 DA14260 (Panther Lake, kernel 6.18.20).

Signed-off-by: John Meyer <jmeyer@fdma.com>
---
 drivers/mfd/cs42l43-sdw.c        |  1 +
 drivers/mfd/cs42l43.c            | 10 +++++++++-
 include/linux/mfd/cs42l43-regs.h |  1 +
 include/linux/mfd/cs42l43.h      |  2 ++
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -189,6 +189,7 @@

 static const struct sdw_device_id cs42l43_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x4243, 0),
+	SDW_SLAVE_ENTRY(0x01FA, 0x4245, 0),
 	{}
 };
 MODULE_DEVICE_TABLE(sdw, cs42l43_sdw_id);

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -827,6 +827,12 @@
 	case CS42L43_MCU_BOOT_STAGE4:
 		return 0;
 	default:
+		if (cs42l43->devid == CS42L45_DEVID_VAL) {
+			dev_dbg(cs42l43->dev,
+				"CS42L45 boot status 0x%x, assuming ready\n",
+				boot_status);
+			return 0;
+		}
 		dev_err(cs42l43->dev, "Invalid boot status: %d\n", boot_status);
 		return -EINVAL;
 	}
@@ -918,6 +924,7 @@

 	switch (devid) {
 	case CS42L43_DEVID_VAL:
+	case CS42L45_DEVID_VAL:
 		break;
 	default:
 		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
@@ -936,6 +943,8 @@
 		goto err;
 	}

+	cs42l43->devid = devid;
+
 	dev_info(cs42l43->dev,
 		 "devid: 0x%06x, rev: 0x%02x, otp: 0x%02x\n", devid, revid, otp);

diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
--- a/include/linux/mfd/cs42l43-regs.h
+++ b/include/linux/mfd/cs42l43-regs.h
@@ -259,6 +259,7 @@

 /* CS42L43_DEVID */
 #define CS42L43_DEVID_VAL					0x00042A43
+#define CS42L45_DEVID_VAL					0x00042A45

 /* CS42L43_GEN_INT_STAT_1 */
 #define CS42L43_INT_STAT_GEN1_MASK				0x00000001

diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
--- a/include/linux/mfd/cs42l43.h
+++ b/include/linux/mfd/cs42l43.h
@@ -98,6 +98,8 @@
 	bool sdw_pll_active;
 	bool attached;
 	bool hw_lock;
+
+	unsigned int devid;
 };

 #endif /* CS42L43_CORE_EXT_H */
--
2.49.0

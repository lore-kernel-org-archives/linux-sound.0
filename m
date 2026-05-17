Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E6430C14C
	for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 20:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779050429; cv=none; b=ouz0W9ELMK+zl8SUGSHIqwBCpxY0OMocyFIa3l8OS3VwlFNmr6sO7Ei0mXDYhsMYOCYVg6YrnW9YgVJbUFT4nbQV4Q2Pox/AX5jkAxddRhVGFnv5fCbmLzxgZVtO0C3gvBzOYVJySL7fNnG7hyxzRQKGJJ5LNcyAtuxDPJp9zaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779050429; c=relaxed/simple;
	bh=/91xEHo09B4MpAyyMbTl2iKoyfC3jY8fQADRFfMO9Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B1+Mfnkj+3NwMZVehpM9FeZiBHzc9dGOv7P/Q32V9lch0ZzXjU+4MF+mW13XmUF0AnlbOz89nhUA/MNlFLLne7mId7nCXQql3rMG0A4rgTKTpHiIHY/zFsTyk/qnrmsj4rgPUH5E7smnbcKQXYHG6mGJXkoNEgJhBFGpvpKFhjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGJYEmft; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGJYEmft"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c824142c880so51392a12.0
        for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 13:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779050427; x=1779655227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPzpi+Ny6TJ1dvpLwb7zEeBl/HAG19Nf4ImcVOOaWvw=;
        b=eGJYEmft+6UQezWHit4TmddBETzV9WW3dfzTLyGBlxRDHjfQooEFTdubO1VbB4mJiF
         4S5tsNOfH7e3n4uxl2kImUqzFoG2B9vpZwfiBHFceHqDPSJJckV+AQ+8OQdXAXHg3x+d
         w7ZdwGQFEloHUzxFQlHZV6sVRD38ZpOp00fYrCB9Hhh8d5MRrFNNNOH8fODsDvrrapWK
         A+7g2PCDiHFt5e+q6aJkO833JHYLVzt2TdjgJVrecs67CU8HQQhLzOE7GtL8FYAgwLB7
         oU6/DrdpEqI0KhiQZSyW2+JxIuoU5vLhoSbDmoMT3W1sD9kfLvwFVHTuiDomeV2UHRCW
         Qu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779050427; x=1779655227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPzpi+Ny6TJ1dvpLwb7zEeBl/HAG19Nf4ImcVOOaWvw=;
        b=LWCIlC/HuJKyds2bzLgNhztk2JZDosUDsofXDZSPymZeP4NKRGZOrzw730MVqF84vL
         wc6ifao8e8BY3vTbU+p/D+3bB5FA9BMtOTSSDBIab+KSAET1Ivu4ZbXqyFvjzGKrJIHG
         2c8BPuzedQF+7zuxHs4FDX5njolPRRTUh+9Vqa/x9ZWH0FjgiLK+nOseW/BQSD0YNPJj
         pxz8ZCkJkZQqp6dEmvCiD/FPCaGoA2l6RUz/vvBGvGIj7P6U8vkWpxrciC2Z5eE4zZhx
         AXPPJ6APPzA5fdUCh5HpQl6VULM6Oq+KbrOjZK2PAWoxPcA1DxMoyiKKYubt4/29Ev1t
         Uoiw==
X-Forwarded-Encrypted: i=1; AFNElJ8pHx5/2PVhRIZzNMsNeOJDPdV+TA3R529hJJgUr93niMmAjtTcvJer3+PA3Dn+yszH886aCsOnlqXkXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk+ONQsnN9XIiGFyCpPtRKW74nT15lVr4rxj4Gwho0+ptS+Vci
	s1vfhh7s1qfM+up39DxtKY/JCa8LTYZYtzvggd1gyeN2+n3Skfl4313o
X-Gm-Gg: Acq92OFzQO0gZIJQFzlabMkFNSFX1Mjo4xx9lXRYmn6sQMfJPNR95sNKEkxRU7Zu+Od
	sqHX5w0+jqCKD34eqLCVAqxaze/V0+8bn1a8ESe/1SsVTzKgwOhAmf/qaLn5XoJpZODhcUXuVlz
	EHYlx7SCQjvVSx5g5+E6T1r04wZChBRnxL9uGPRHMuF/UQ7WI/VPRcdhEjZ7+oUeRjRVgnrNxr+
	mTTZrky9IAwHDDdl07f05B2KYWxx+Swy+3TWh/Axu8i+Pr4OkW0vwVII6THThiJWB1jnJ1lnmH8
	5Su8ddY/fdsPUSd12EB5pyL3op5PAGkXKq4vWXoosrnmjXAU8WyAz/XEEh+rdwUW4uZ3Cze+Q20
	TP+QO781KSx0QOSPCxpymkv8g4ZTlcKf+qmm/Gqela1ufvNFAblAxy5qBEbXUA9zBZlTUM3f0bY
	ZWeHCx/53DJQdGPrdMR467BVbygW3vfqxlQFaUHQQMrGSs
X-Received: by 2002:a05:6a00:9508:b0:83e:f208:b11d with SMTP id d2e1a72fcca58-83f33d95cacmr7164945b3a.6.1779050427449;
        Sun, 17 May 2026 13:40:27 -0700 (PDT)
Received: from nixos.golden-musical.ts.net ([122.161.241.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5ceb3sm12152542b3a.34.2026.05.17.13.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 13:40:27 -0700 (PDT)
From: Sidharth Sharma <wednisegit@gmail.com>
To: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sidharth Sharma <wednisegit@gmail.com>
Subject: [PATCH v2] ASoC: amd: ps: Add support for MSI Crosshair A16 HX
Date: Mon, 18 May 2026 02:09:55 +0530
Message-ID: <20260517203955.42490-1-wednisegit@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSI Crosshair A16 HX (D8WFKG) uses a Ryzen 9 8940HX processor,
which identifies with ACP PCI revision 0x62. This revision is currently
unlisted in the Pink Sardine driver, causing the probe to return -ENODEV.

Furthermore, the MSI BIOS lacks the necessary 'acp-audio-device-type'
and '_WOV' ACPI entries required to automatically route the internal
digital microphone array.

Add the 0x62 revision to the PCI validation switch block, and introduce
a DMI quirk table to manually force the PDM configuration flag for this
specific board, allowing the acp63-dmic-capture node to map correctly.

Signed-off-by: Sidharth Sharma <wednisegit@gmail.com>
---
Changes in v2:
- Moved ACP62_PCI_REV definition from pci-ps.c to acp63.h for consistency.

 sound/soc/amd/ps/acp63.h  |  1 +
 sound/soc/amd/ps/pci-ps.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 62cb6bef1..4f955a817 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -11,6 +11,7 @@
 #define ACP_DEVICE_ID 0x15E2
 #define ACP63_REG_START		0x1240000
 #define ACP63_REG_END		0x125C000
+#define ACP62_PCI_REV 		0x62
 #define ACP63_PCI_REV		0x63
 #define ACP70_PCI_REV		0x70
 #define ACP71_PCI_REV		0x71
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 9751cf078..561921d4b 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -17,10 +17,22 @@
 #include <linux/pm_runtime.h>
 #include <linux/iopoll.h>
 #include <linux/soundwire/sdw_amd.h>
+#include <linux/dmi.h>
 #include "../mach-config.h"
 
 #include "acp63.h"
 
+static const struct dmi_system_id acp63_dmic_quirk_table[] = {
+	{
+		.ident = "MSI Crosshair A16 HX",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Crosshair A16 HX D8WFKG"),
+		}
+	},
+	{}
+};
+
 static void handle_acp70_sdw_wake_event(struct acp63_dev_data *adata)
 {
 	struct amd_sdw_manager *amd_manager;
@@ -436,6 +448,12 @@ static int get_acp63_device_config(struct pci_dev *pci, struct acp63_dev_data *a
 	if (dmic_en && wov_en)
 		is_dmic_dev = true;
 
+	/* fallback for msi firmware lacking standard acpi audio routing flags */
+	if (dmi_check_system(acp63_dmic_quirk_table)) {
+		is_dmic_dev = true;
+		acp_data->is_pdm_config = true;
+	}
+
 	if (acp_data->is_sdw_config) {
 		ret = acp_scan_sdw_devices(&pci->dev, ACP63_SDW_ADDR);
 		if (!ret && acp_data->info.link_mask)
@@ -587,6 +605,7 @@ static int snd_acp63_probe(struct pci_dev *pci,
 
 	/* ACP PCI revision id check for ACP6.3, ACP7.0 & ACP7.1 platforms */
 	switch (pci->revision) {
+	case ACP62_PCI_REV:
 	case ACP63_PCI_REV:
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
-- 
2.53.0


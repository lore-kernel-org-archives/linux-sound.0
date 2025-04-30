Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE6021A458
	for <linux-sound@vger.kernel.org>; Wed, 30 Apr 2025 10:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008336; cv=none; b=T8lzOzidKeTioBGjiOLXZbhap6TN62hytd1HiWLuGZkgwPR7bXZU1G5IB86tMKcCsLpo7s5xn2Mi1BVClhdgj8rfSq/T9XZBejV+2PVncIAyR4Wn9lJ/BM4kx3YdesF1a5uSmFbsGPSo8PXA10rk8vkaExloa2mCkX2snd+8gUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008336; c=relaxed/simple;
	bh=XKD0PCksM5koRt9yVwLvgk25O1hShPA9dC6+DMXXpqU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tABj1I8HPJDqXB2Q9lsUDSEtmLBJChBBJBroShq5rSdEI7C0nWkRyc9b268x9doKe7d+wU0CluUTnT5JZUJVmKFBT3XrEO7vgYcC9rF4J1idwS6vql57WGTt27pecwN7P/FjRQ/MwJyVxdnIx22YO4DIgleya37GJz5eJE0WnRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=GEushoId; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="GEushoId"
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2C2453F2A3
	for <linux-sound@vger.kernel.org>; Wed, 30 Apr 2025 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1746008331;
	bh=tVEuiNCOW28XorGDVKTn4SAyImiaoHT4m0G5IE++oJE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=GEushoIdIGppyYTqRHKc97CnePGaqJsCyqsNT5aSrduMlwBurLuSwTp6IBZxRY6gR
	 wYfsIqkfnx8bnG/qfBibufYkGf5ycxT4jKiSAAZv+BKeNltUj6OYS9xwwtNkvOAnTI
	 siaa9wo8Pq9A4goHRxlnCy2MFPVtG0UBI2dpUagSwfrkAa2nU8hTY1YjXLoSWIpJUU
	 u8B5AWCiAO1xsI5uhcu/+s3XF3+Qxj+vxFI8LMvkGJV2DeW4L1M6yNZJYRJm3xn0mx
	 oFrBGhuMG4GNArBzFsTgMd/Cwz82hjnPcDSyxcPEdV6sj/m4mYbyl8u5RD+7i+yFaO
	 vlRWcs5FGujag==
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so9742758a91.0
        for <linux-sound@vger.kernel.org>; Wed, 30 Apr 2025 03:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746008330; x=1746613130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVEuiNCOW28XorGDVKTn4SAyImiaoHT4m0G5IE++oJE=;
        b=ogCCJ28NYRDFw4XUyLrrl9wjMX3aSa+6NL7J3lN2dMXTh2a0Kqf/Qu/xEM+E6us3NY
         d6E4sjB/dupZwdOT6mple09oJBfhz+iifB/lO7vg2Sx4qHhstNCnqv/0v9Eik3/TDbhF
         oGzlewkAs2r6YZLLOs/CM22ycJAiueSIIptEXQJL2nY95hTjrAb8TLGtl4vDJrVJ//WD
         ZoPyYnUFVl9CkVM5WRKXNr/pRfsZij1+4748L5+NPa3z7NPpo5LaHK/ec7Ae8PuZFhWF
         bzm+cudHsOjAWqlsET3bTQRsHv1WAzQOWrf32DYwKrHx46/osYEKWtpZ0pV13LALOkN/
         2GZw==
X-Gm-Message-State: AOJu0YzwaXrPgjMPHGHRGNrqngipj7XZOj2A8NasB1mdUPLnRvfgJnQ0
	khkk75P7xKxZ94h4cPWrOtUFeJAIeO2jolT6yTe4W0OuV6b3vMGnhPW0j8++ix30xXb8WkxF3/5
	m2Nhaqor5zIxxz6wI/lrsJ45VPjjiyNp+DC1flj4MNkczC5F3GG/UD8gFoHi0a2DBpk9FIKaq/u
	8E
X-Gm-Gg: ASbGncv7ylq8tW77DlBx26b5nY7ZjF0R9k0//aBLk2/+U/e9mGZUkgefwi5/8F2pFo+
	6w/pkKuL8pyc5CNvANpaqZL3CJ00XJqGpGGlmdSqxxgeePMUCTkCdntDHB68BtOlAy12ufJrLAT
	+YSRqQ99kTayDKF4+ODAMoGMiaVRYq5Ln8/7bWB20M4SsWAwY/XhXCEh+SWYHqLQZC8Nk9qrtOH
	wCaIiESwljMcSaeAQOgxbUKui9yht0+gLspelXe4VidRMvnoi7z3aQEV/NRnuB3928Plh/bAKmg
	LvYU9Bto5jhGftTIvCWrW/Y6n0uHnPZS4AMUPHX4BWQ1jT7eQD7jKj7tEum5qsf/HrIw34vXIRK
	zGLJpbF1wP2/lfIQACA==
X-Received: by 2002:a17:90b:3806:b0:2f2:a664:df20 with SMTP id 98e67ed59e1d1-30a343e80afmr3670414a91.7.1746008329720;
        Wed, 30 Apr 2025 03:18:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeL/tMtfO2t8GnWSPPOSEy8Dqh1At0ny/VZdUYYVFJjsUQk2ecHDqOWJSHod5AJKhfg9aE8Q==
X-Received: by 2002:a17:90b:3806:b0:2f2:a664:df20 with SMTP id 98e67ed59e1d1-30a343e80afmr3670372a91.7.1746008329293;
        Wed, 30 Apr 2025 03:18:49 -0700 (PDT)
Received: from u-XPS-9320.. (2001-b400-e173-1972-6944-c046-2d7b-f0bf.emome-ip6.hinet.net. [2001:b400:e173:1972:6944:c046:2d7b:f0bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a349e459dsm1323972a91.4.2025.04.30.03.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:18:49 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek - Add more HP laptops which need mute led fixup
Date: Wed, 30 Apr 2025 18:18:43 +0800
Message-Id: <20250430101843.150833-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More HP EliteBook with Realtek HDA codec ALC3247 and combined CS35L56
Amplifiers need quirk ALC236_FIXUP_HP_GPIO_LED to fix the micmute LED.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1799203af35a..6b5f54cd4030 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10863,8 +10863,11 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8de9, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8dec, "HP EliteBook 640 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8ded, "HP EliteBook 640 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dee, "HP EliteBook 660 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8def, "HP EliteBook 660 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8df0, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8df1, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfe, "HP EliteBook 665 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e11, "HP Trekker", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1


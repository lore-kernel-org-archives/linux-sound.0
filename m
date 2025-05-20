Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C4B241103
	for <linux-sound@vger.kernel.org>; Tue, 20 May 2025 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747285; cv=none; b=tBjMH8tuALWFv2FbpDyrg25WILVVgHMnwiyrnZrW+tXFHxF5pzADIWYxiwHEp768XZBgWfgp7JuIZeVWQTH2+qI1O/O9QkhOIYOHUT0QC6Hx/51Zy6nvYyDu/FioLB1YggIvRh2rRMjs2o3G/E11y15nCzm9jEYAKRxmp9SuS1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747285; c=relaxed/simple;
	bh=TpebAyLrTsQ2vqsgZRkoW+Df1Y0c/BPv7SfZDFMV6JY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KS7EQD/3V0TswZGADd0ovXY4dlxA4H5jmtbEGYECx00pWr6MvqpjqE5+mZvOSFdr1kwIO1nGZr9QiQpRTig0j/v9NvVzSXh86Reh5xm/w0TNLIIdGTMxHzrDUiNt9U3X+Q/hv4uB9MsiwLG04OMDvrayFE/UGzU/L9Y7lIF9kwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ls4MZ62/; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ls4MZ62/"
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A27833F366
	for <linux-sound@vger.kernel.org>; Tue, 20 May 2025 13:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747747280;
	bh=2YA0M25+OlDCkL3jnXx/NrhA1ZlWn4MZqkLcWvkoDXA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=ls4MZ62/E2pxH/MJbtyYgCyiG+rhDqk0adflIhpHwvCb+xmlr6LaEIAOfU0xmWgKS
	 VnSIZPii/iqbbytb8isfM/q8wfuLlpqpvjvsA+zDQYZyg0k8tBhbypC77j2nwmMgLu
	 kgLuHvv63OpiPSKcH1aDGFtFaKPQzmJsVdykinW5xdZK+KO5cLSBBUfbQ9Uvs6bVkK
	 PhKzXL+1O2bXlXlLiNEJraDp5p0gtpRfxX1OCz4JqAkaZbsN+oXDvXBbxedKiBidc9
	 EjlfrpqzlagWJr98ACj45a1KHiOQf0mXj0pJFk9hTMm7ympYwntcsGWB/BSX59Qrdj
	 Y9QR5n9QX7ZJA==
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af9564001cbso3688861a12.3
        for <linux-sound@vger.kernel.org>; Tue, 20 May 2025 06:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747747279; x=1748352079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YA0M25+OlDCkL3jnXx/NrhA1ZlWn4MZqkLcWvkoDXA=;
        b=mrSF1EVaJkGhM0ANJpKJpa9P4pvKm6QLZkkqVSIOk5W3WhVFypSEven/iYD4687W/p
         +eFp2HBHshHBcvNooyj64gll9JEzPr1etz47VbLgoMuj1g5nciOQ9GtLwUObPLvBQsp3
         wwf88bV71Ad0FjXB3SrjXX8OcJxRC7tUNvhHYhpwKmewb05DRoU30dpD/wgSotq0POCp
         iPz1pSt0V8CJxAprPhXa6Bc/XLwALO9EbV7ScSqUvku85YzHnkZ2NhZcl5ybMfO9xhKm
         cBd5MviRyv7MMjouLw6q1I1gZIroSmiddXbIrvWMgWVga8nqVRMc4GnbTpwCdlRv0UyW
         LYrA==
X-Gm-Message-State: AOJu0YylssWH6Kkv3WS0dW+u0eUVHUNt54pyivnY6IoC0KZ8KWC3ac5G
	lgMJ/4PWhMq+VUCefwEf5Z0YPSacKVApn/gXDDisrrpdpVzQgBN5xaaNJYjBNThuaOMEooB6G76
	CBPyWYpIr8fwxNkrN/hR0rCqp+1v3AWLCrPmDueVmYKhL3j+Al9pqAlarMh5zCqbHBoNiNh/8P8
	45h7gK
X-Gm-Gg: ASbGnctFzWyF+K0HmHxtqZQKsgeBu7OJvGQBFmUawxYJL6pcIJV8T6Ertv6FJgPHf6W
	XVRN11vPmpOPDaetwMaFQA5kCPLYEaLlAoIohaY62ONzLCJSykOh5/Baff6V09bzC2VRqNcng7q
	X6uZlXNT8N78Ihos3ntXvaFhURbnzyv0/i8Z/1X7/ryTCDDW1/SVBXQowg+XNbWXBqFVFwmgL7N
	UeCNMaieEfsrYXITZg8oxQUn/9o0kJ6wBrKaE+YL0gIQBJbDaSXI4R8j1w+azcUMp8nEBixNC0I
	QUUrhu0bKQ6BbXgLQZoG2QEoBlCiTxMnOazyKejyZqGxUkUB9bVEqT0dGg==
X-Received: by 2002:a05:6a21:999c:b0:210:1c3a:6804 with SMTP id adf61e73a8af0-216219f0430mr27053136637.31.1747747279307;
        Tue, 20 May 2025 06:21:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3Uk8VVEzFJdwamQAzEuxRNAeqlXcsa5LRVzwUT9hLQpcRSgf59fIJNIEMVtvNpIlyYlBWYg==
X-Received: by 2002:a05:6a21:999c:b0:210:1c3a:6804 with SMTP id adf61e73a8af0-216219f0430mr27053087637.31.1747747278881;
        Tue, 20 May 2025 06:21:18 -0700 (PDT)
Received: from u-XPS-9320.. (114-36-215-124.dynamic-ip.hinet.net. [114.36.215.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e589esm7890635b3a.9.2025.05.20.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:21:18 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com,
	simont@opensource.cirrus.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek - Add new HP ZBook laptop with micmute led fixup
Date: Tue, 20 May 2025 21:21:01 +0800
Message-Id: <20250520132101.120685-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New HP ZBook with Realtek HDA codec ALC3247 needs the quirk
ALC236_FIXUP_HP_GPIO_LED to fix the micmute LED.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8a2b09e4a7d5..13b1721365cb 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10882,6 +10882,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e1a, "HP ZBook Firefly 14 G12A", ALC245_FIXUP_HP_ZBOOK_FIREFLY_G12A),
 	SND_PCI_QUIRK(0x103c, 0x8e1b, "HP EliteBook G12", ALC245_FIXUP_HP_ZBOOK_FIREFLY_G12A),
 	SND_PCI_QUIRK(0x103c, 0x8e1c, "HP EliteBook G12", ALC245_FIXUP_HP_ZBOOK_FIREFLY_G12A),
+	SND_PCI_QUIRK(0x103c, 0x8e1d, "HP ZBook X Gli 16 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e2c, "HP EliteBook 16 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e36, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e37, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1


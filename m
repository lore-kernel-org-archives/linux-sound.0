Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1B145A16;
	Mon, 13 Jan 2025 08:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758339; cv=none; b=nN8j0m3vYQJ/jtaFxpjN0f9X+/7WrsZtlSZGdB7sv91OPe2GZXIpwMEtX4oe/S8GcbzK2vSzbKZAYvsSfwcWkIkBDil/+6QPcx5eYCCoNfMK9QZ+1PMHqKeIwjRRhFYn4tLW32eFtlc5fp9PYadHwAE4X7NLSv0I/7Nvgi/N7Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758339; c=relaxed/simple;
	bh=9hyjKs8iyKRE5gt8z1GpYpk9gBBTEGxMHq6iG2C03gE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KihGuc9zZvvaHDYtRjMlNzdoY88t6xVZ/f+X60RmsaHLUF7pHYTjzEr0DBhbxypc2yzCowMw0onklRhGKUpuyoCCpYBMATX7KJ2DjsaWpDpg0Pu8y+LQ2DqYIYTSTq4/RYJgeTpQroXS8+XcLOQ6OVdzKkxbF/lYh0/6DtyhKO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Axf5dshj; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Axf5dshj"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-21634338cfdso49005545ad.2;
        Mon, 13 Jan 2025 00:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736758336; x=1737363136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+GhzZqGjbVxoyE6ZO1kH+vxchnYcbgVkxsjfSQRWTw=;
        b=Axf5dshj6y/WmuZ5E1f8kgH1zMp0j+RdZKghVMOQ6c2PpaKAo5FazLCh6a9mkdXUcO
         ktw0qKJvF319QuWdCIgZ4/0UAAqxHqVCVJOwuYLK5He+k3Qg5pA3DroTG/qNAjUcGyIi
         FigCdlpBidSj3B15xkAdU2hvEW7m/gMtZOs/kP86NNwIMruQgaxb1Yz1Q8DqI2QLpsN+
         xgf0LG6RZGXdKYuAutt0ErWeIUzgC6GheLlq9YQSDL/jCP3j9hllvSrFFZ1VWAu2wDO0
         4NLvwrBT26c9UusZ9AYVaualOkZY74WgGn+rEygO6447KtXeHXTJjEssKDKqq9btZScq
         FZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736758336; x=1737363136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+GhzZqGjbVxoyE6ZO1kH+vxchnYcbgVkxsjfSQRWTw=;
        b=cQUXjMdqvWKO82MHz0LOtj+ZnRvL1WLvPuuld9bRDyQRDIYNmX+f+2qFB9TGy9mcv8
         veAN6kwAA1u8pGS45KL5PXXgBWoPJmiGjZ573kVdWnLKZakEOX+saun6uZ8/+GovM3u0
         NXjZXh0VdLv6NCI81qxOBj+UIfj6VMCoW15GcIt2ElrkfZ1FsOAE7EyY73Q5XO3Gtb3g
         UmOD4gDX3kKC0eGRi6qMQ4HLWqZGEd0DDceHkxXBS317E2GzVTd9CnBMe9yxUO1xVs3n
         FOsnvOdt+N9hR2tMUx9nsn4gtSPQHvsQmm/yzdBRdkoR6GGE5aEkWHRs38JUS0XA7b1e
         GWeg==
X-Forwarded-Encrypted: i=1; AJvYcCUHeXYmyLIyuRLdSRQnfn5GajWp+IvZQkvTCIhqwpviRrtrRb5pzwo7mKJVoCmBksrwxu6z2+OBSK2ARoU=@vger.kernel.org, AJvYcCVW2XZcUbBXcMmfaTxxAgSObLOn6T1oWLOqin3Ti74HVMnwZ+kJTP+fRDk4ZNlGxtsKcf08NV5DtOKvmc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO0xwibRAK7sgbCMLD2HFMqfqKsa8G5tb0KBptr8EuyOmYCM96
	zblNhibY6Wby9t7uKXvqL/ycE7rEA+a49ebtYczC5J/YWg75f8uVjg4M5PkEB+RDQg==
X-Gm-Gg: ASbGncvRCRDC5RLCOMK4iaJdvu1Lw6Bqc8+b8DwahQeghWLgkQc0B66jmaCFr3RLqFO
	v2az4NDUQuKkglmLF4Oo7P7pXUH/sVgV6+py8X1Jxxvmc9p03WyvuCCfwUqjdY01Ijbo9CC6uW8
	iMhw85uqXT48fS3BzA3ezS3uGo6IAVaKx61eayuId6AOV09IKVJJYzS58pCYHTeTwGEB4ef/ms5
	pUrIpn5nfAGQUQnZzc3dmI9zrAMc4Vsmz9QehaZVvG/gtIabR4CNHwdRs1mhj4akV9QPw==
X-Google-Smtp-Source: AGHT+IE9qD7/8k1vivvblRXgshE0qnGXbzlhPXu46LIXjZsaGBVrv/C7fgmBe07EnqmPeAIdcz3tnA==
X-Received: by 2002:a17:903:246:b0:216:4cc0:aa4e with SMTP id d9443c01a7336-21a83fded0amr258217665ad.47.1736758336475;
        Mon, 13 Jan 2025 00:52:16 -0800 (PST)
Received: from localhost.localdomain ([104.28.243.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f2516b0sm48472355ad.219.2025.01.13.00.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:52:15 -0800 (PST)
From: Yage <icoderdev@gmail.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yage <icoderdev@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix volume adjustment issue on Lenovo ThinkBook 16P Gen5
Date: Mon, 13 Jan 2025 16:52:08 +0800
Message-ID: <20250113085208.15351-1-icoderdev@gmail.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the volume adjustment issue on the Lenovo ThinkBook 16P Gen5
by applying the necessary quirk configuration for the Realtek ALC287 codec.

The issue was caused by incorrect configuration in the driver,
which prevented proper volume control on certain systems.

Signed-off-by: Yage Geng <icoderdev@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 61ba5dc35b8b..000dd85f9f21 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10930,8 +10930,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38e0, "Yoga Y990 Intel VECO Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38f8, "Yoga Book 9i", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38df, "Y990 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x17aa, 0x38f9, "Thinkbook 16P Gen5", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x38f9, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
+	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38fd, "ThinkBook plus Gen5 Hybrid", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
-- 
2.48.0


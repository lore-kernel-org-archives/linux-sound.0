Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C2D1A9FB0
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778942749; cv=none; b=LqjCV7XoHAepDuDyBJzevtWIzWKl8na/rk7mRLG7yEAahMpb6MWBjaKaAQqyewSeAdpRiA6iJaqilkw5G6xBBgLRtRfTb+hTd5Nt5u+zcTZNRut+Bw+ELfXuKpE2jcSPkJ3WKRIqa4QIBmf+yBhaMXYGXWlBVVpU5TCE9Gklzkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778942749; c=relaxed/simple;
	bh=ev52Xvz/H4l7BeQQcl3obkGu1lL61vY1G9zP+e83Fr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qQT3DEEmKx8QsVbG9oJq5pgaDBodB1WE87QOW38xEMfOpeieJs4/2SJGRmvYxBYnGBKrcfbg3lrh8D3nQGmtCocOmf+Rltis25rwYepL5SqWedpRsshAhx3Prvrt2V/ZbrrHMrmISifUXmD/ljHbynnGVtlLZCmLCHv7816pNZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=el2HajCV; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="el2HajCV"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36931e4f5e8so697442a91.2
        for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 07:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778942747; x=1779547547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKjZaScNCYCPTFLUvRpljMaklExB7Hqe8oJsc6GmIEc=;
        b=el2HajCVzMHy42/8VaF/XOsUVcxZmOuE2BXkraV6FmTZ0ar8u2fdddQ05dJvzk2ihy
         MVMhWhs1604ryuz6Bp8StJqcrM5V1+9sYvAMtQocKadLrL1hB9tnKKcCWf1Ani1rSPL+
         YKUI3xPRKzrK8kQFEhLoOx7oWLmB2MgNlAoecQ3LDpZtXezPkIui8Y4+N0HUf1Fs6JtW
         F6Fp0Vz8hrFsRoxkEAOPWyM1F6RfYbN8Bjry13+KC8EFzI2wjgNnpbsLsTwM108Jj2fp
         slfwazsfkwUopjn59LpJZxNJ40jWkuseU46sXU7b8bzRBdlb4gFkD1GPa2aCpqVMqbws
         Y+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778942747; x=1779547547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKjZaScNCYCPTFLUvRpljMaklExB7Hqe8oJsc6GmIEc=;
        b=jRjTMFQnJJ7/NuBXm4eC9nx1sZXliXheylNHMHFXXG32IsphWCfXjNy2Rc5++W/Rj1
         xZP7pvqH6CvBx4PNi0Xe1nmXJ3+dh2m0rwVNGQgDpnKB5UDl0ZOrNuE5e1CVdTKWDRnC
         pVp/BN7eSH1zg6gT+lLehFA8bYghUv2R1vPwAaPoN/N+a4AgaTl2snyzB0PScMErIF/b
         o/VHCT+lAvsI8WwiNGeuNcX2aIqpyQUu3rnWqDjSuf/lbrZcC7oIQj2HwdwNK+2oJ4n5
         3EfUCSw6UktPUn5g27cx4SqzaYWTl7pQZxCmHqzjYC/8krMshdTaz55PEatlp+zNcEHj
         8yKw==
X-Gm-Message-State: AOJu0Yy0/wQoj4QQSVr68kjtFWSL5pDrW3Mtrvd+Q+kad7wLCC9bkTXD
	N9asd/Ol4E/7F/8YfzVKJnyFi/LprPW5wNZlhjSXYD4w6kqj4U/EW09CW2i6lBulMy4=
X-Gm-Gg: Acq92OEQoQd78mZ3mFTAQrjqcIXykg9guj9tSSh8jVdiqCDVLOOx6aYAKsUUvuk2mPb
	ew6FwU37v17o96bZQ8PIaV0v6v6iMy6eoJuOYIO8y/x6S4O4n+L7Toa+nVRkxh/l38WdGX6jb9K
	b0SIuXMqBIiSyw75Zw47NaTUZitXA7Res+zwmB7ui3Jy6WO95oDFAzox4U5wZhRDDYBojrw6pcg
	9fv2wddkAGcFTmCOLyEg70v+FAgFEuz7P1+AEL27gzsZ5CeGU5MPc7ATg6GLwxGwCR0NgdteItU
	lF+NtaDk+awNejG0HaAfbxhckS+FrYlZgD263S3u8r7JN0EbhMoTg/iPYe8MDnPCfJpfVutDsIt
	tTLlj5lWEItJ003UYBbUt5il0GnY/0vmzlVUC7v5m75PTf9KTVISftCNzZLbx75U17dCDCxK+3h
	najHCBbNBgFgeM+fNC9fTbgN/TLsaMeP0PaggxbIIWtsCS87uTib6vnfKcgLzaCvSVei8aIjP6L
	ZvW2JpPc8eGtpTQCMm3nP4f6JfWhJJZODUxXrQnNfG98XtfhXnchyZ+uBKiEQ==
X-Received: by 2002:a17:90b:4c:b0:366:19da:832f with SMTP id 98e67ed59e1d1-36951b75e31mr8795114a91.17.1778942747070;
        Sat, 16 May 2026 07:45:47 -0700 (PDT)
Received: from archputer.local ([2405:201:401a:e270:e753:e5b:7e03:6295])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600c3sm91910995ad.29.2026.05.16.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 07:45:46 -0700 (PDT)
From: Aryan Kushwaha <aryankushwaha3101@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	Aryan Kushwaha <aryankushwaha3101@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Plus 14
Date: Sat, 16 May 2026 20:14:36 +0530
Message-ID: <20260516144436.35022-1-aryankushwaha3101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Pavilion Plus 14-eh0xxx with subsystem ID 103c:8a36 needs the
ALC245 COEF bit mute LED quirk for the mute LED to follow the audio mute
state.

Add the missing quirk entry.

Signed-off-by: Aryan Kushwaha <aryankushwaha3101@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7018,6 +7018,7 @@
 	SND_PCI_QUIRK(0x103c, 0x8a30, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a31, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a34, "HP Pavilion x360 2-in-1 Laptop 14-ek0xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8a36, "HP Pavilion Plus 14-eh0xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a3d, "HP Victus 15-fb0xxx (MB 8A3D)", ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
--
2.54.0

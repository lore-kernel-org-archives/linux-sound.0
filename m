Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E1721C16E
	for <linux-sound@vger.kernel.org>; Mon,  4 Aug 2025 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754320527; cv=none; b=RTaraUF+RD7QubT2lfOIRinaeLP0UGT0uxICrEJdHm11pMUjIoTbwfr+SyN7v5cvAEPWTb1RuuvH0L4Nc+zXTccOL0chGl4ywp2G7JIm9govzbOjeWORjxIVxtUbwPgnSbpYAK7BFYK4Qel8VEpqGhJUHw895fbqlXAt0+vmaoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754320527; c=relaxed/simple;
	bh=qSKxVCjxIITJ4xKVklaUQkKTrw08VY1isfSMm6QEyNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hJIWlQW8MPrntHL6kPqgH8HJjEQygUKn2JUeYQywycYKbJoZiWFVRUKKS06bquggRI5kZ5txPi/WVZqz3ncjU/NgOekwpHAvcPai30F4VG7ygmeckDY2Zn5XTSfTB5Hn+ne4vXwApsF78isqB0WgAoes4Zor/lCDjnUhSyLuLRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8G9qCCp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8G9qCCp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23ffdea3575so22803995ad.2
        for <linux-sound@vger.kernel.org>; Mon, 04 Aug 2025 08:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754320525; x=1754925325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4vncL8KQOq1ro/+ON1Zjm3KjDNk+SVozXfT0Y2z7/Ts=;
        b=A8G9qCCpqG0Oeo3fTzQ78YGD3NSguosEqrvlq6fmVNjTT4UWvUz+2iejCn+pwKwCYU
         QUImQG1sZvfmjPQshbvfzh7ybWGs49guE6MIisHS7QLRFyT1TXAVjUg26kSIEVxXZr/3
         dmO4R6TKkGoPvk0ZJBKRUc1DHIj1m03bKAZOqS8wl4D2uMaoFc8kTtyZXTRMlXEdp9tp
         xs7TjFxjc2gAu4ls869Lof4ZRjAboK3jnDDlO4sxUFy6+zePrX2680OilOURWb4WqNrC
         4HWPr6ksOEO0XXb05LjilndUbdvzZxf5mw6k3B8pvwISP5YZjCcsGzGBsGkITmmJIgBz
         2Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754320525; x=1754925325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vncL8KQOq1ro/+ON1Zjm3KjDNk+SVozXfT0Y2z7/Ts=;
        b=AoHv1BGmdhu+yl/4Hz1JrKDwniyXfuXDE7qpzZEpNFlQFA0tdxVlJgftMHmgOKaOws
         CaxavmW2Fw47/eITXYJXY9ivqCcdZnQjxC43qjN1K5f702a9AFm1A5g5gaUntCXk5FaC
         hZrimuwTx4gWNeMuDC0jjKm0Jh99Yixp0lI83m9U8DiOVuSINJiFLsjPgFN7f3ayptO/
         AQGB/YLHM0aDXhhAe5CHK2Sm5mDdISm41oavAGb/vk+XWWBJttUf+pCK345C0KrA/Ffk
         9RB8dDtl4IgltdIiEFqDlE5/sLgNbdn2+Xt0uXmrxwZC2g663VMUjCfga9WSaMcPR10j
         USkw==
X-Forwarded-Encrypted: i=1; AJvYcCVa/W+Ax8thAUn7xTZTvNAKswmr+p43TRPROH8UMSEYpuJ5MVj4gxQFzQlNzD6WxZUN/mT5UoDUVY3+cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaFsnyfkq2a9q81ODOO94aaJGmNInJOD5vTIK9US3EGt2xp7P2
	H1DDoRRlFPRPEh9O9N48S9NJdQpVW0dRWo/tSv3Sci0KiViW4spgO+equpC8Aw==
X-Gm-Gg: ASbGncthUMEkhSY5xLjYwYUJ2AfYcO0z9ixLNjl5O++Mcff4EQBGxn4dio6RIaKillw
	+SGBPiK/1mAbhB41+z6f42CAOJzgolnaF+VC2t62/lN+CTt9dtjgWfk753o4ZYNh9pRxUwjFUJy
	NZWmMefZuxmezflk7p3RKSBCOoIGF0bTl5J5L/GjqNzSA0hjzJmIJMYSTejxFW38Tl2I2JFsHeg
	4GzvjouWmbPFRccznOBvaxZ4CQECiz8s3lETjF54AOIKlqtS1bIA5vrYOMmvsJL+LpPuGgQSMTH
	bw5+ncvPTbubEmjPHA05aiqTCFFI7D/cCLYXUixnBvZEImALsgoQrsT+VE/ngCng6tv3JlZ5xI8
	da8nbf6i73SgzyyPPgpltz78n4S3wp9y8NmdVxz6l3tNaanU=
X-Google-Smtp-Source: AGHT+IH1OlL8/6WfERFBko84muxuVgLJzNHZ34teHfbfTpyVbYNxc866M9q3ct8vSpgCvA63GHTIpA==
X-Received: by 2002:a17:902:d4d1:b0:240:7753:3bff with SMTP id d9443c01a7336-2424701335cmr132407065ad.30.1754320525212;
        Mon, 04 Aug 2025 08:15:25 -0700 (PDT)
Received: from gram.taildfbe3.ts.net ([66.219.240.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0f576sm111530755ad.47.2025.08.04.08.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:15:24 -0700 (PDT)
From: Thomas Croft <thomasmcft@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Cc: Thomas Croft <thomasmcft@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: add LG gram 16Z90R-A to alc269 fixup table
Date: Mon,  4 Aug 2025 09:12:07 -0600
Message-ID: <20250804151457.134761-2-thomasmcft@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several months ago, Joshua Grisham submitted a patch [1]
for several ALC298 based sound cards.

The entry for the LG gram 16 in the alc269_fixup_tbl only matches the
Subsystem ID for the 16Z90R-Q and 16Z90R-K models [2]. My 16Z90R-A has a
different Subsystem ID [3]. I'm not sure why these IDs differ, but I
speculate it's due to the NVIDIA GPU included in the 16Z90R-A model that
isn't present in the other models.

I applied the patch to the latest Arch Linux kernel and the card was
initialized as expected.

[1]: https://lore.kernel.org/linux-sound/20240909193000.838815-1-josh@joshuagrisham.com/
[2]: https://linux-hardware.org/?id=pci:8086-51ca-1854-0488
[3]: https://linux-hardware.org/?id=pci:8086-51ca-1854-0489

Signed-off-by: Thomas Croft <thomasmcft@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 2554b42eeb0f..e27a36e4e92a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7110,6 +7110,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1854, 0x0440, "LG CQ6", ALC256_FIXUP_HEADPHONE_AMP_VOL),
 	SND_PCI_QUIRK(0x1854, 0x0441, "LG CQ6 AIO", ALC256_FIXUP_HEADPHONE_AMP_VOL),
 	SND_PCI_QUIRK(0x1854, 0x0488, "LG gram 16 (16Z90R)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
+	SND_PCI_QUIRK(0x1854, 0x0489, "LG gram 16 (16Z90R-A)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1854, 0x048a, "LG gram 17 (17ZD90R)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MACH-WX9", ALC256_FIXUP_HUAWEI_MACH_WX9_PINS),
 	SND_PCI_QUIRK(0x19e5, 0x320f, "Huawei WRT-WX9 ", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
-- 
2.50.1


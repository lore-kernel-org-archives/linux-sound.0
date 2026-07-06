Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C4321D596
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 01:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303090; cv=none; b=RpasuEdLZwE+XMAy1EfhhJd86LGnG+KAqEZTwinnC6Z5xlBKx+KiQSC0eJH1UJBbwBhF8znQBVRFcxCL7KvmlrJjH0zzFCLEXThlCJIQQjeYUHJjhlo6DES/B9g7yHlj4AwaFb7uHphRRDdfzo6ip7y6x+fErBZflJAPiBqidzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303090; c=relaxed/simple;
	bh=h+Xwx+prE3UPS04P9zLX5fmnmCboznRqtGYmq029uFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ff7maTAi5tWaFhxGL7UNl6dSr1vzFCQvy4hFaa1OLcz8H7opUA0DmsU5hDXccVLcjVumXfu/pSKGXlK3M3d+mk3NosGADcrAK46bzPoZVF7pvFggfLMAG3HmidBaz5Em9Ewk00DHMjSxWQkB9hDOv0fgSkJA9FSd4xCyTODlG6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9VE7TOh; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9VE7TOh"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so1174643a12.3
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 18:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783303089; x=1783907889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIeEA8OwT9hxrfkxjt8TSlvwE7JntsI4tFnXWy5t+pI=;
        b=F9VE7TOhofDT7pe9o11NdU64McvtBBSLQ1BstEby9f2Kx9WDZ4LDtLAIaG7FKxXNVl
         Rzh0TNRHzUoWWkEiBbeRC/FEnkkSIfU4zuqgGtqg+R2amkY8VO+pq92d/XRSU3A9CrL2
         crYyjnErtD/Y19x/a7r3n4OMm09ShIOwg3nILgeSm2WDa/lHQN5ZJvvfKmd4mvv9TJ+e
         I4E3J1RzN1SdhfHkLdhVY0l1SoKAua8A0NjybdCXjnPBFz1FdjGJXrJlhovW+Tr+tgj6
         X5Qqz1JLAc5lZMk6t8AFFbxde2S2cPf6rOFfMiSSPa5huT/OG31kGWwfLzVJ3SRPCw6P
         exbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783303089; x=1783907889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIeEA8OwT9hxrfkxjt8TSlvwE7JntsI4tFnXWy5t+pI=;
        b=LP6vdzvDdYibDRbvf8GcKu3s8LdS+rdv6VRdofsXcuzYg0bDrY1ehSw7LHxBYcsjQy
         XMSn+MpSmCYFPdN9RdMlzGpIqDgyImvz65e6NoX4FwxB9vfFZpj+kBJ/EZqKaxNZ4zN5
         yQ4OTZjPC5Vos87HCCQElsqtGcCHYsRQgilcNeYksONjl8TwflQyFSR3S23dMboeLWDH
         1sP7GCiesdDMQJpHZfP592Iv3V1HQ1EL/9l7q/3tiTrYnmneR9cKF/APE6/J2b8ckrrq
         H7o6Pp/15tlTi74tXtJoqq4otjY/+RqqJGsH7NbCEzQF20B10wuZCVsxeanAE/9wizhn
         KTnA==
X-Gm-Message-State: AOJu0YzQobkC/SJuRyRC0b0BG9iP3+gudxQtmtGuvQLLJh7cezc8F2Jx
	+sb87mXgT5MSj8bd8f2Et3LqOCMSthr/iSLaNA8Qh+Dsy95VsgDZsin77s7rOc5k3P4=
X-Gm-Gg: AfdE7cnfqtGhUpLdQHyLHZ7YfIpjn4qXh1SAxJYV2SsU38hvdAv/5NMq09Vv3oBuQI1
	3ZjJxR7k6PDqcwE+n+IvD4T/a7eKq/Ddpz0KzcDzMHIVIzViCo0Hktp5VRBHrzdUCsAz302kphp
	wlKNsOIDQ+FUacxY4m82cVDL3zS0BTjQYOhmeRo8yyp0DUD6OmX/T+Jk4v1yFTtPpA+cHJN8Etg
	usRLJl1TJEk76G8VWZsb39e3DIEKgCQqjBrVtdzSDYNSpIivEqpPNRAOJCt7YHr9AviGJ6pveoT
	GJauXLhB6Us+ldaI478+gxPxGCixIjVHVLDp23zKhtmtNqTHC8cQzob7NpB5JpQGgUgM6vAP+WH
	Z4N2An4tZSpsX7P+ZkSM2g881HIbsBuRac4Llk/8bi9YbGCL6NpbGSUCtYEW77rM0G1rHyourN6
	pqBJzkgn1J8G5e9wQs
X-Received: by 2002:a05:6a21:490:b0:3b4:85db:1bdc with SMTP id adf61e73a8af0-3c03e4b0ef5mr8137961637.34.1783303088892;
        Sun, 05 Jul 2026 18:58:08 -0700 (PDT)
Received: from TheYautja77.. ([177.23.117.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f38ee1333sm31550941eec.24.2026.07.05.18.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 18:58:08 -0700 (PDT)
From: Augusto Massotti <am.96138669@gmail.com>
To: linux-sound@vger.kernel.org
Cc: TheYautja <am.96138669@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ALSA: hda/realtek: Add ASUS E410MA to ALC256_FIXUP_ASUS_MIC_NO_PRESENCE
Date: Sun,  5 Jul 2026 22:56:05 -0300
Message-ID: <20260706015610.145528-1-am.96138669@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: TheYautja <am.96138669@gmail.com>

The ASUS E410MA (SSID 1043:10e2) needs
ALC256_FIXUP_ASUS_MIC_NO_PRESENCE for the internal microphone to
function correctly.

Without this quirk, the internal mic is not detected.
Adding the subsystem ID to the existing fixup table enables the
internal microphone

Signed-off-by: TheYautja <am.96138669@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f7700713dc62..b998847d69c0 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7355,6 +7355,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x10c0, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x10d0, "ASUS X540LA/X540LJ", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x10d3, "ASUS K6500ZC", ALC294_FIXUP_ASUS_SPK),
+	SND_PCI_QUIRK(0x1043, 0x10e2, "ASUS E410MA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1154, "ASUS TP3607SH", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x1043, 0x115d, "Asus 1015E", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1043, 0x1194, "ASUS UM3406KA", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.43.0


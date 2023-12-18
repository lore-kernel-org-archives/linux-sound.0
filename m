Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C251F101E2
	for <linux-sound@vger.kernel.org>; Mon, 18 Dec 2023 20:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5Qw+Q8U"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28b71490fbbso856658a91.0
        for <linux-sound@vger.kernel.org>; Mon, 18 Dec 2023 12:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702931893; x=1703536693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GRMF3211MpvQOQOjta+0t7pxxBEWQIDECRhw88TpeXo=;
        b=V5Qw+Q8UeezLSHs94VYgzeBk+Kv7mErsX8p3pRWuUYtAo86YVKeADpeWoBu7yn6sMQ
         5ErFABVxFelfq4nezcW5Lq3as0+keqZd2yEBGa4/IViEADUBjQuT+HAGCT4S6TDMjhVC
         x9Xg0Hj5ujm5ho12ktLnWxXgJN+0+H8tPIeQS5FqVxQG2sLQl+YblYI20y1OY5L4N0X0
         P8GDs+ao4NL6MWYnGLMUOc9JTpwLO4zVvpJb9bdC546GUIimYgt0fcKxrETqnN800ayX
         UGfWQw1uJy6Kn6rdpaDkB6vZTnakM25w6cHJVD+83p7zyvD/vi6DBTLzI7Nx2Aw0Wrmm
         AKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702931893; x=1703536693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRMF3211MpvQOQOjta+0t7pxxBEWQIDECRhw88TpeXo=;
        b=c4rbixaBJECvRwd3wW1QwFi8kEO9hyFbLF4ixjUme8ACIizudHXdOtXZKfJRBJbeei
         OgJuRsEwe5mFuBU8amvPYZlpKmdqPYxQewPoZLZOUOATP8N5Wszimxk5mIEJjncA7vKM
         1FUGFPzoc9Cj7nEUZz5MqMi+iEkADns8O0fdWT6nXMSpZS2qoORXeLoZ1iETTkPnlIWr
         CRH1e3MVQc3IP0uOGCd9TEQF/n5njhH5awDQGTiKXNmxNU7PAksgOPs5TKzw4gHFzNUG
         4ULYqWOdTNeEU5SEq4CnsqyLBJB9t2FFouqu47mkJAVkOA9lbHnSMt7GRy7lCOrdctD+
         rTOg==
X-Gm-Message-State: AOJu0YwLSK5zbtFZOzYbvUEUlijbprOPwoY5Bp7FrWctunaV6+jQhczJ
	LPMvBdTLpevkgnKMqaasPQCtPCy1kftxJxnb
X-Google-Smtp-Source: AGHT+IGfAOJR4DrwuCG0y+4KY1srkX1M4TzhTx8p8xwSsUzkQD+IdLteqC0fs8+kKNTK248qo1JPBA==
X-Received: by 2002:a17:90b:2407:b0:28a:f921:a424 with SMTP id nr7-20020a17090b240700b0028af921a424mr3506499pjb.68.1702931892803;
        Mon, 18 Dec 2023 12:38:12 -0800 (PST)
Received: from localhost.localdomain ([223.189.16.6])
        by smtp.gmail.com with ESMTPSA id 27-20020a17090a031b00b00286c1303cdasm22225115pje.45.2023.12.18.12.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 12:38:12 -0800 (PST)
From: opticXC <aabishmalik3337@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	opticXC <aabishmalik3337@gmail.com>
Subject: [PATCH 6.6.7 1/1] ALSA: hda/realtek: mute led fix for HP Pavilion 14 ec1xxx series
Date: Tue, 19 Dec 2023 02:07:00 +0530
Message-ID: <20231218203659.32948-2-aabishmalik3337@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Pavilion 14 ec1xxx series uses the HP mainboard 8A0F with the ALC287 codec.
It needs the ALC287_FIXUP_HP_GPIO_LED quirk to enable the mute led.


Signed-off-by: opticXC <aabishmalik3337@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e45d4c405..416cda983 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9881,6 +9881,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+    SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
-- 
2.43.0


Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E03B314A73
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687726; cv=none; b=Fh9MQtpdxFaSs4pMHQ3gED7e2+dcTwhT1R7PM578/hN4DzFyltWqgUMzB8cRemj+EwYgbho1pWLWPSfn37lBwN1PfhXJbNRzZeB5ZoVfSx3zdi/DiGYp8CMkxmE15BH2XKgF+6qBldBcpqCtZzwt7J8e5udj0hZjPRcMyDzkXj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687726; c=relaxed/simple;
	bh=q9XuyvTG0r99CnZ+eHQ0lb3eb001WjC4GHipuuoYe/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOG/m47l+EAE2AePECLmfDeDBEEE8gCU3gF6hVBFwiy2ewNEaAT5NVrX7OK/oE3wrm8nvxeUnwhsLEvKnuoNNg2J9Y/N2brzYaSd/CJlqKWdTgtofpTdvkmVw+cYvQRCY6hQdPwyyihzq8xEsYfv8Lbj+jui+H081w2W2q/T1gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=ftgPSUpt; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="ftgPSUpt"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bc85eda6b6so22281125ad.1
        for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 08:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1778687725; x=1779292525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4nQf4Tyv5AhVXIQKHFg2g5yXKygHvr+WnTS2iyiG1M=;
        b=ftgPSUptCmcRd592ccGH/qL2GCMqqGuNyx+SdTJR+ntoHtyhEyDv+eBt60JObz8Rmq
         cXoLJI2a1qg2m8NeXnWftd4bu5u2GxYNinRWGASmJ5hR/iCBKxHIduqVJIKM4r+niiyi
         ojZ1oX4LroQSJ3CdOkZSZ64TrBJFEyblEN6x4Epid7tTjcFT9UIOzwffZZWtJuvmkJNW
         cjaNRw0dAGZtrg4YuiOpc0/yza+L4P2sdp3MGFs/ou66/PViPpBrIlS2Bj9pvMNdGI4F
         1RsVVazwFhVUr7wajmwDO3eW/GEQIWevSkN3k5ppcE7GLc6hAOg7hctoUdzI6pAICp3M
         xjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687725; x=1779292525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4nQf4Tyv5AhVXIQKHFg2g5yXKygHvr+WnTS2iyiG1M=;
        b=BiRTdfvekNtH8lOcWeQwrQdd7KXojAO6OJ7oOCXlboNRmrS4uuXuJDlOTH404m+HfU
         6umoVYL1Q+Wn7PSI1I+kC8a2j3nFpXiFpZuA1uaJuGcubJdoSntmKwPDoWl12xdUnXNP
         d0glPLKS6JpKWC0Mtn0QmIwFHpMnqTvDs2fSCfFotuXGRU0326hfNjrrALRCNzt+zT9K
         +A+UiqkXfWbJSunoPDZaVrOeel7Z16MoB4h8x98hy3g+6CBeXkmArn55xoU6Cct192Df
         3BFxleXyYJd+z15d6ZrFeDUXDL3EvekNSuLyhXgRo/SNTyhPyS1RyERYOo5w5fJ5Ncyn
         VAQg==
X-Gm-Message-State: AOJu0Yx3t/okGmIkW46osZ50Z59LA8t8rOVoVUVVFBSGFMrOdUZ5yW4t
	3T9KX5NrFXxbGYYU2XTVaM63CnDy0jGf4Zz533gMQ9cRwnAhCoPV5hsLe/UYve39i5E=
X-Gm-Gg: Acq92OF6XYlKy8eBlHuJV295LmSrFWzPu2YlHD/dC6oN2Pl69vqtgjI1FhrgFKIlLTA
	dvm5WVFgnkrq71gfZSQoj6jny0oiS9BPCCLGoihW2Z/sehEpV5X2vaNuOdDYoIlKtPKqnpcARFg
	jLC87hnN0HN+ZXXJzsugBzHU3KX6to9BuFXLTsTzfNzL1sEmR+i1HDEFmphZ0a3LtE4YZSYJfzc
	k5jIE8xBJwCf5BaDD/2MefxB9UeEGBETldJMXDarF9zbrwVLAs6NC0KjBNQ9i6vXJzR3MPdAItQ
	AjkWKV4IIdPo+meSgalbP1TJQz0Rugt9SlSL7rdWsgm0FztQStuT2JX/QpYLF31Llr7kmftR35o
	tj3hjW1mdMxCGZgxjNGdjrgn7ZF4Hc2Qiw12JLcJg1KWCniVM30v/meT75UKgnobpR4TYz+MvAa
	fiJxkIMaNKxTVOb2NzijpZ0dLweiESLJ7Uinm6bvmcFaJKh9qcsqMQMt0Zoj+m/yedq/QuRVw6z
	KTzaWTjk6Hew8PPFsiaVQMhoa6LNh1e61xSdEJH6wpIe+CQc9G0OzZ4q0Qs66LaEiEcyuCQWzY5
	+w6HK6cmnIg=
X-Received: by 2002:a17:903:2410:b0:2ba:25ca:b49f with SMTP id d9443c01a7336-2bd271396a2mr40476135ad.17.1778687724524;
        Wed, 13 May 2026 08:55:24 -0700 (PDT)
Received: from nixos.home (2001-b011-0003-15ac-2dfb-ca83-41a0-3286.dynamic-ip6.hinet.net. [2001:b011:3:15ac:2dfb:ca83:41a0:3286])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ec7d35sm173477035ad.83.2026.05.13.08.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:55:23 -0700 (PDT)
From: Daniel Schaefer <dhs@frame.work>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	Daniel Schaefer <dhs@frame.work>,
	"Dustin L. Howett" <dustin@howett.net>,
	linux@frame.work
Subject: [PATCH] ALSA: hda/realtek: fix mic boost on Framework PTL
Date: Wed, 13 May 2026 23:55:13 +0800
Message-ID: <20260513155513.11683-1-dhs@frame.work>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In addition to the mic jack fix, also need to avoid boosting the
internal mic too much, otherwise >50% input volume clips a lot.

Also add a second SSID. We have one for the classic chassis/speaker and
one for the new Pro chassis/speaker.

To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: linux-sound@vger.kernel.org
Cc: Dustin L. Howett <dustin@howett.net>
Cc: linux@frame.work
Signed-off-by: Daniel Schaefer <dhs@frame.work>
---
 sound/hda/codecs/realtek/alc269.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index d720565db4aa..ee892039fae0 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4054,6 +4054,7 @@ enum {
 	ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED,
 	ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED,
 	ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE,
+	ALC295_FIXUP_FRAMEWORK_LAPTOP_LIMIT_INT_MIC_BOOST,
 	ALC287_FIXUP_LEGION_16ITHG6,
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
@@ -6296,6 +6297,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
 	},
+	[ALC295_FIXUP_FRAMEWORK_LAPTOP_LIMIT_INT_MIC_BOOST] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc269_fixup_limit_int_mic_boost,
+		.chained = true,
+		.chain_id = ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE,
+	},
 	[ALC287_FIXUP_LEGION_16ITHG6] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc287_fixup_legion_16ithg6_speakers,
@@ -7790,7 +7797,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0xf111, 0x0009, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x000b, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x000c, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
-	SND_PCI_QUIRK(0xf111, 0x000f, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0xf111, 0x000f, "Framework Laptop 13 Pro PTL", ALC295_FIXUP_FRAMEWORK_LAPTOP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0xf111, 0x010f, "Framework Laptop 13 PTL", ALC295_FIXUP_FRAMEWORK_LAPTOP_LIMIT_INT_MIC_BOOST),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
-- 
2.53.0


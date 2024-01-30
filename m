Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566C869DE8
	for <linux-sound@vger.kernel.org>; Tue, 30 Jan 2024 19:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706642752; cv=none; b=sMQ5WsICK2Gbgddga54pVq3K/sxrI1A34rmwluAF12QtqphzBqQH22STtonV6AeRbcl41GLeBpgpuD7zztA7lHT7/Cru+dBuDmd3EnIHXJKe1ieupyk0syscA487yXSmZ43WUOGiZi2oTeZk0uiq6jUEkLNJWCa/ya2gnsEQLrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706642752; c=relaxed/simple;
	bh=y7sKyH0SPS+OBne38MmgWqGPlM/4L8s9/P00IjCurwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jiqe3RQBxHhkX0ISTGnObS3UtNFj2BenEKbcUMWN0wfCpDlyd1rl52LH/msl4UjKwIQvag+nhmEvuHb9h+xhhS0sW6mQURnJq4T0DLf0Me9yUo8hrN/D/51xlC5vqA6jEfVJiuZzKTcXIzM0CUBTzFV4a6duGGLMCDYmchvCshY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtSTmlPy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtSTmlPy"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33afcfc40e2so523835f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 30 Jan 2024 11:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706642748; x=1707247548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fitVwU9NFH8ALfwqOPkqvEJCaIpXpcoNegj7fJ4FgfU=;
        b=mtSTmlPyFhzMf3JrUEr4YaO4XbraXk8Dxa7E3cOD2rP563buzs/6PoLXCfmcyHys6T
         cOl80LZ07/AwWfOYT0Rsi3Za3K5tSz9dNkGtPZ5n48OVPz7c0nFZVSzbj68iUUkin2Ok
         CvxixA/uJ7gZUSIS9NyEwo/FA15kE7bU4FJTP1JuocTSAgEwiW2rryDgJ2LsG0vfZuXf
         lsgJBa5stXb5lUySa+qwWA0cBsp77yrHMjpXh08P8UWIm4AEZvRkSfrRssXztC+8BWON
         Peu8HcS7UTSaQXJkbAT9CaJWPTEClXCF4sGDGEVkzrpfus+VHFpra1UqCNhv5XO+l9Fw
         bPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706642748; x=1707247548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fitVwU9NFH8ALfwqOPkqvEJCaIpXpcoNegj7fJ4FgfU=;
        b=m7V8QOwipGItJt+6BXdOkn8Sr7nRarwcCLN90DqS8LR0QqpCM9QXKtdV3P/3nDNt1E
         IeN+f2kNegS4qGjyvuHFGbNU8Mh+nmEuPM1tmaTvXbhboHP3yNss1HUa2KZwKNxYrWxv
         NZnPo7wMATe8ZxZEJO572bi2egVEeoElnul5gNXBcyUfAK5aIO53Zcc70MCn1z4tQmE4
         nsPYA/93cR2mBLNd7SkxD1zfEtKMO2HoER8WWaq5jnAjXNGhxBzOmIHVsXJjmZqlBG1N
         JaF1lO1sWTcGuynoub+xU6AyB2QCvUR93cNxFtSylq0kquuYrJexs+PfkAa5rCRwTF26
         uP1w==
X-Gm-Message-State: AOJu0YwzcNJt4vdP+l4zD0F1NGW3LHmnbNwclArOFPxR36BWZSi7Zyz3
	rviMrY/KvBy+pv9ywpuJ7Ymkhh9c/V5O0Gs1UKE5J7oXBV5WwulT
X-Google-Smtp-Source: AGHT+IGKtQ4O8NtcU8SOEhJtQNtZ6R+vZO6OKv35qHtOtGRQtbtypse1ngK3LTX7iZrTw8gdXnfjYw==
X-Received: by 2002:a5d:5981:0:b0:337:ab22:e1e2 with SMTP id n1-20020a5d5981000000b00337ab22e1e2mr8546879wri.37.1706642748403;
        Tue, 30 Jan 2024 11:25:48 -0800 (PST)
Received: from aquecedor-3-0.lan ([2001:818:e81c:ce00:7193:3bd:90d8:9d8])
        by smtp.gmail.com with ESMTPSA id ce2-20020a5d5e02000000b0033af4848124sm4611891wrb.109.2024.01.30.11.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:25:47 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Relvas?= <josemonsantorelvas@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	=?UTF-8?q?Jos=C3=A9=20Relvas?= <josemonsantorelvas@gmail.com>
Subject: [PATCH] Apply headset jack fixup for alc287 thinkpads
Date: Tue, 30 Jan 2024 19:25:36 +0000
Message-ID: <20240130192536.10298-1-josemonsantorelvas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thinkpads have a fixup for alc285 which enables headset media buttons, but not for alc287.
This patch removes the chain to the X1 gen 7 fixup in the alc285 headset fixup, making it applicable for models without bass speakers.
It then chains said headset fixup with every alc287 thinkpad fixup, making headset media buttons work for these laptops.

Signed-off-by: José Relvas <josemonsantorelvas@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c80e2f3acfcc..21d10c62964c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8796,13 +8796,13 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_thinkpad_x1_gen7,
 		.chained = true,
-		.chain_id = ALC269_FIXUP_THINKPAD_ACPI
+		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK
 	},
 	[ALC285_FIXUP_THINKPAD_HEADSET_JACK] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_headset_jack,
 		.chained = true,
-		.chain_id = ALC285_FIXUP_THINKPAD_X1_GEN7
+		.chain_id = ALC269_FIXUP_THINKPAD_ACPI
 	},
 	[ALC294_FIXUP_ASUS_HPE] = {
 		.type = HDA_FIXUP_VERBS,
@@ -9577,7 +9577,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs35l41_fixup_i2c_two,
 		.chained = true,
-		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
+		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
 	[ALC287_FIXUP_TAS2781_I2C] = {
 		.type = HDA_FIXUP_FUNC,
@@ -9604,6 +9604,8 @@ static const struct hda_fixup alc269_fixups[] = {
 	[ALC287_FIXUP_THINKPAD_I2S_SPK] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc287_fixup_bind_dacs,
+                .chained = true,
+                .chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK
 	},
 	[ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD] = {
 		.type = HDA_FIXUP_FUNC,
@@ -10206,8 +10208,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x224c, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
-	SND_PCI_QUIRK(0x17aa, 0x22be, "Thinkpad X1 Carbon 8th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
+	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_THINKPAD_X1_GEN7),
+	SND_PCI_QUIRK(0x17aa, 0x22be, "Thinkpad X1 Carbon 8th", ALC285_FIXUP_THINKPAD_X1_GEN7),
 	SND_PCI_QUIRK(0x17aa, 0x22c1, "Thinkpad P1 Gen 3", ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK),
 	SND_PCI_QUIRK(0x17aa, 0x22c2, "Thinkpad X1 Extreme Gen 3", ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK),
 	SND_PCI_QUIRK(0x17aa, 0x22f1, "Thinkpad", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
-- 
2.43.0


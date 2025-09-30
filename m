Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF862FD1DD
	for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759244979; cv=none; b=OQ9gJATz2qWCccH7i03infxmt8yvQwDwjfB/aMtbTP+wkayVI0LxURU5fO5Ior7wOEzvx7m7PIDTayWhtbN+X0/QDiCVMCXiXhYwLrGeJjjsHwRh4/vpupxRuxFKVo0jp1uuj1CBSlSPJVKV/2BP6ZHnF9h1+xRZH8wWPoau+sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759244979; c=relaxed/simple;
	bh=74QgIHtoCsDzemGWWCQBxeRlKKMa0fAtv1m4IHbss18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gD3Hl51iLPa607ABHGfmmjG7G5RJH9iEVdV28/KjujqEl9foQcOU9iF70KOklZoWoRMuJ24umK8M6E69k3rB+T7PWvikWhm75IXZBz0rfLUpCW4tVI0VwnNAD1srsdt0CgSOD09dLmy9m6djbZUqLerxcIki+nvatJC6SSmOAFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LY54hpLh; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LY54hpLh"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4db0b56f6e7so51704361cf.1
        for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759244976; x=1759849776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5FxuQpEwjlLjzFaZOq/ycB/lU8HlNjZWt21ev5aDg0=;
        b=LY54hpLhxda1aAdiI97mnXropJLc3wpTh9Bab6I9+aoTdCvIRUENc3KaU6kU184A+8
         tnAcE1ViQFMIuV7oI5JAD/pHul6djJE1+qafzG/J1yKLusbCdlDWEJk5SObzechem2g3
         fx7H1sUcLnw/irVzRaAy4N1fEbk0Dhf06jaWm/3VqNIilH8TMvZiZuQiVWySijJFHVJX
         7SOlS2p+AcDzNBz8tU98K9ReKY17lMScLhj6N9wWqvleuhoGjK5bC/u7si42nMnHHBBn
         8jOr8Y6u4PqulX+K3V9RC1JpUiBVtU6s708vMxyQhGN3BkoIOAgKlugCKygVJIjIjvnw
         Fr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759244976; x=1759849776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5FxuQpEwjlLjzFaZOq/ycB/lU8HlNjZWt21ev5aDg0=;
        b=k4IfAIaL2XhhoE38CS+JyimWQryIcUskOH0y8KK8TCKs6ZQxwZV1bc0RXudEwic7Lr
         NPk9pJ5/PWqkf7Q689FpYroAe+bZXjiDW/xhb0V7ALnfmB/Yznaj1g+ldaHSSoA1CjGD
         s8GegSVb8wLSdk3+4RsxQEvieqN6lsBp4tzzlIs21Qf2wSBdrZV1mKUXDFwMpFQcE5Bt
         0qNrnlVKD7lHfhzRxzCLCwhndqs/tRJtCUQRjPu6vL34uVTbndD6UICUfd6Ewypk9y88
         FuWyfwBONLLyt1y6f90fZ27o3mYm4ONyxu43zicsLke9i+jwDm//UiCblEFwqIJqQkli
         MM/w==
X-Forwarded-Encrypted: i=1; AJvYcCUzgaBg8UuUx5Xll14qC69+Is7yvVePJQ7JYIN4AymzaDfOzWKLEhhTJmbrB1dFjFZ3561ZA6KOLBkcVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJenC1ndzZeSAcApouEJ2PeW9eCoQB+LZEzI96KfV+1ArE6Au
	uPEpbhOKtvo36lYp30F1y6j163vr69QSLeV857S6cYkHunps+XY11wS8
X-Gm-Gg: ASbGncu9dTxn98Dd9T4dV7SkzdN5uIj2NTBCVS9RulXhds4kHIxl2rUUY2BuAcLVXo+
	Mp1Ksk9cYiQx7ooJr3B+v+3b8HW8j22utL+iAEVHPo0er8DdBHBj4358uXuG34+Voh6fDCnTolH
	frMFOjzvzCfDeAynoSC8YbOfH1zsq9j+ZIDqm5C8sBWux6gyzK8+vJNmrZp1w0goTgrIcCG4R0A
	sZeIJA1W/1tb6pGbRwTZO3gv/0pKGuof5qRyMGAc2ZB5umqipQxAzbbEYercCrb9nTU6BvktFqe
	IpgL8nIvtas9EkrQzeeeolgUDjwHx9sc9afOQReQ6GLQZDiK0cznhWV+EzhWmaMvICMwTt8H/Ln
	6ipk0WTqC+cuN5D+ntSj0qQnUMwFwpocN4b3u2HSKHWMu/iT527aZomboql4ls4cNVxT3cNNZ
X-Google-Smtp-Source: AGHT+IHBC9CAsd1xO28sLyIBEC0dLpq9cXyF1kuTaxuQs06z3bJXPhwp8yEnjtX96OB/LMtT5lmVJg==
X-Received: by 2002:a05:620a:c44:b0:827:ed1d:a2d1 with SMTP id af79cd13be357-8735db7dbe9mr34760485a.20.1759244975971;
        Tue, 30 Sep 2025 08:09:35 -0700 (PDT)
Received: from FUTILE3080-ARCH ([2607:fb91:14e0:c8c8:7e15:462b:c565:425f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c29dbf584sm1054092485a.29.2025.09.30.08.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 08:09:35 -0700 (PDT)
From: Adam Holliday <dochollidayxx@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Kailang Yang <kailang@realtek.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adam Holliday <dochollidayxx@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS ROG Zephyrus Duo
Date: Tue, 30 Sep 2025 11:09:14 -0400
Message-ID: <20250930150914.3103-1-dochollidayxx@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87wm5gjetc.wl-tiwai@suse.de>
References: <87wm5gjetc.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ROG Zephyrus Duo 15 SE (GX551QS) with ALC 289 codec requires specific
pin configuration for proper volume control. Without this quirk, volume
adjustments produce a muffled sound effect as only certain channels attenuate,
leaving bass frequency at full volume.

Testing with hdajackretask confirms these pin tweaks fix the issue:
- Pin 0x17: Internal Speaker (LFE)
- Pin 0x1e: Internal Speaker

Signed-off-by: Adam Holliday <dochollidayxx@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 3c42f66fe000..214eb9df6ef8 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3735,6 +3735,7 @@ enum {
 	ALC285_FIXUP_ASUS_GA605K_HEADSET_MIC,
 	ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1,
 	ALC269_FIXUP_POSITIVO_P15X_HEADSET_MIC,
+	ALC289_FIXUP_ASUS_ZEPHYRUS_DUAL_SPK,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6164,6 +6165,14 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE,
 	},
+	[ALC289_FIXUP_ASUS_ZEPHYRUS_DUAL_SPK] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x17, 0x90170151 }, /* Internal Speaker LFE */
+			{ 0x1e, 0x90170150 }, /* Internal Speaker */
+			{ }
+		},
+	}
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -6718,6 +6727,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x1533, "ASUS GV302XA/XJ/XQ/XU/XV/XI", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301VV/VQ/VU/VJ/VA/VC/VE/VVC/VQC/VUC/VJC/VEC/VCC", ALC285_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1652, "ASUS ROG Zephyrus Do 15 SE", ALC289_FIXUP_ASUS_ZEPHYRUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1663, "ASUS GU603ZI/ZJ/ZQ/ZU/ZV", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.51.0


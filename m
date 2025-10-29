Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B250355046
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 18:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761761539; cv=none; b=ltNP7mPzFNI3YLZ/STHGYeadi/QzVxBkuwkI3+i43YL1fFayw/pblqyfqjisRFyXnn6KnB9bNLA7ZgZcVkM+WzAKOhxyqN8pTZArWdNJxsxYoLNbznQAf5wb19V08kNmQy91WoASywMsTVUBItC1kwFNMYZtNQnPHbA7kKflqUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761761539; c=relaxed/simple;
	bh=0cHmfPpwQRUncw6ailNncA/HG4OJbBt0bXiKo1tivTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mcvcv9PgkCDrrIT0b6wTqZxj0/LrlXuUGXbSTBmakd9JQ5vZCwApN5FiHi9plNq+pkCWHGcSod8UYq+XkPjDJChfETs+IfluAvod/aEfeSuTYGp0V3Ye6+dHWQmt7sKD5rzYpjDbCFoXc6O5FufYFEvo3r1EB/1OwSjNVpY9ygQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFqVNPXI; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFqVNPXI"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a2738daea2so207151b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761761536; x=1762366336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4fM675FWHZG0xlF23ngbvLV+PkmWX/yNsjPmEemg5TU=;
        b=KFqVNPXIAnnjUaN5gsI+9Mlz8e0Hg+iMH2J0QQpCTyMREcI2in3rYtJJVD5aC1VQHQ
         Ot4jr/buP8bxDWbkBFgAShrYIcukAALXZMyYnX0aDmhWBbvDShU4g+A8NjxnM1GkhLuR
         8NxZdpVuPZnKcfM/2uX7rBQc/BJPz18A4cLJvyODhTcBBMNBOh06kCfqUiOqiYda+Tma
         itYCs56FAnuSIiauPhtFO8ExZ9SNEwkTwiVyQH1FwHgInteXU6w0cqSyqzkUDQSx3d0I
         dibvKx8iwsjItzU714bwW4bvXl5CF4mvg/vGe6Kj+Z4XaJEvJQEQWi0e/zgYym0IPASB
         T78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761761536; x=1762366336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fM675FWHZG0xlF23ngbvLV+PkmWX/yNsjPmEemg5TU=;
        b=Sr4V1CX7XRxt8G4+4nME6NQId5Y4IUBEx0kKpbCVxSIBTUXDhCbKx8FvCQqCc7v0zF
         BFeMfwvLFS/Egi03ExWug3aXLwYJzO9wVUEcK9RLgzq8onRI9FAzmfvU/7jGpcajG8PO
         r+xQNNtm9KXWTp0E/d81QcNzadzrcNx6DocxjpuIQ3cPsJf7DovnLExHI9yLPScqqgfk
         TAAu8Ek33nvwYJ3ppuVb2TxuwzualCThHruKkU+Lun6waXLdD/X8kc9fY+Gr3c0mKi6o
         15Xwj/ImL1jCb8E4+pJO589V+fmvfuqpia079Oec85RpHsgR3rIKCPzrYFi/5uuF+WGF
         MGPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZhfDFKVUmN4fZg2jyT35wrYdqzIpd+v/NQITVVVo8V9OOoHgmaS3DhOWro2Zvlk+0fMDhGsp2GxdXRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj+ZZHHmz/fmmJj5m6WDFEkIbAJj8kg+TG05fuewUllFJOwmBm
	f31nCH+tlufaMjX/pt1OBxsYLQkBTotkDUAxcrkM2EBgBTf3Sw422pMz0ekNk1WQ
X-Gm-Gg: ASbGncsQ8AXm7YQc9q1+s8LgcWEs6LMOFS7KrtYSWjaN4OHjAFJCIna2NgIbxmPYaXy
	GFedaAYsluBqDdUsGAXlmVdKrPnN53mOBKGA2ZLmNTTvYTzAhxUy4B2RTIsWoJlt9e5KTvvIuAq
	1U1q4gdbv/CH6AGpbKVzjhpbxbR8A+TiFKR9swzQIQMu2bTpzyFF8wjBFf8yKFghhaZtKjPCTMH
	r0FjRAbYrj6wG+mq7WLP+UpArJRHaJO/EaHCNsba14OG+mDvvQdjuTDpuJTLHb0kOaYFlarTSCV
	1LWVMd1CSrkiS29DeE+iqReQQzHn5/EghyJ5pfOd6AV/pp60yMvspCUhU51bz/wPUqpRw/Tp/rw
	3uiwx3nZzQccDmx0bdIGqpeW6Tnkwh7JMANDLNX0kvHC7IsE237tLDF8ptcU/COsn7fOpiCnNZV
	LkhvwqKC/8rL1tu7dbWw==
X-Google-Smtp-Source: AGHT+IF1iztqeEvlPkCmhJVVsUDNgxlyocxHM5e+Cao8IG24USp/FUjlf8iFINN3ikKQR8qFpw9rhg==
X-Received: by 2002:a05:6a20:3d86:b0:342:9cb7:64a3 with SMTP id adf61e73a8af0-34654af9f15mr4348450637.34.1761761535578;
        Wed, 29 Oct 2025 11:12:15 -0700 (PDT)
Received: from localhost.localdomain ([187.17.229.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712f0c1859sm14082250a12.35.2025.10.29.11.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 11:12:15 -0700 (PDT)
From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	chris.chiu@canonical.com,
	edip@medip.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	edson.drosdeck@gmail.com
Subject: [PATCH] ALSA: hda/realtek: Enable mic on Vaio RPL
Date: Wed, 29 Oct 2025 15:11:52 -0300
Message-ID: <20251029181152.389302-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vaio RPL is equipped with ACL256, and needs a
fix to make the internal mic and headphone mic to work.
Also must to limits the internal microphone boost.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 8ad5febd822a..cab4603c425b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3736,6 +3736,7 @@ enum {
 	ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1,
 	ALC269_FIXUP_POSITIVO_P15X_HEADSET_MIC,
 	ALC289_FIXUP_ASUS_ZEPHYRUS_DUAL_SPK,
+	ALC256_FIXUP_VAIO_RPL_MIC_NO_PRESENCE,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6172,6 +6173,16 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1e, 0x90170150 }, /* Internal Speaker */
 			{ }
 		},
+	},
+	[ALC256_FIXUP_VAIO_RPL_MIC_NO_PRESENCE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a1113c }, /* use as headset mic, without its own jack detect */
+			{ 0x1a, 0x22a190a0 }, /* dock mic */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
 	}
 };
 
@@ -6959,6 +6970,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x971d, "Clevo N970T[CDF]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xa500, "Clevo NL5[03]RU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xa554, "VAIO VJFH52", ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0xa559, "VAIO RPL", ALC256_FIXUP_VAIO_RPL_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xa600, "Clevo NL50NU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xa650, "Clevo NP[567]0SN[CD]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xa671, "Clevo NP70SN[CDE]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.47.3


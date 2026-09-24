Received: from mail-pj2-f35.google.com (mail-pj2-f35.google.com [74.125.227.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090953C3C06
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261211; cv=none; b=RNU9I4rRBDkgdP8uR1Cpe7hLMHVHcYnB14rfAOWiOhD4Nu5o3rUjLc+k6ageNr+Ik20UHuu/oKQtwaBrEIIEusfZAOU/0bZmn4R+KDnWzy9NrcAfNSCSAjur3gW12BOi7ON2fXDQzDE6Pz5e38+zX/9qgCFe8Hho7Tu4Hz1E1EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261211; c=relaxed/simple;
	bh=B+JoUJuIixBjDkxhNHcVdHhRksB6waDTN8P/UE6oveE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACb8XM8XqAk6FB9+NflclmlNl903n+jSMpuFVzDBqFxRculKtoZxUWl1X4Mcrf7XIFc9M5ttYGtPleZj3E085sK8414jvhy1Dh6ub3uwXoyOtp+Bt8io6vQuhXz1hmoV2ozBUcHd5q1y0wyREHqgsb/KpTIk9MPOVv/F8XzC+90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZeHv3/+; arc=none smtp.client-ip=74.125.227.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZeHv3/+"
Received: by mail-pj2-f35.google.com with SMTP id d9443c01a7336-2dd77300825so13425995ad.1
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 07:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790261208; x=1790866008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qvbp6E0aGuxVVQ2sKaEGsmFQZRaCvhSjNEbb/Y+XMg=;
        b=WZeHv3/+SDsc7pDhilGqCSm6FZZIN701KzX+vT1GKJRSfsjnHTOOGuC8siah6hhX39
         EePYD4F0yvXuuys08boYPrgVUO4v/V+FBAFUoBjw8sr1RiPJ/s1+BvXmIhTzUZAqn8QH
         jSYWgVZM2Yft7dLuiaT4qspXb8yhdwLT/LyFwGWGDEGp8mEf9aS/Lw5lUmx5KLMa+o9S
         P1lhVJELwYWy1ZhhyGCZCfthzkQi+gMSHSV/hJIhxFek+V/BxLzvCuIfQjlaU9Zl+Yyq
         OxTnvTMs/pg2QTEba5LrR9+MHOz7y6d+jQgumJ6SgUECcR0aEmnfjjZVrxQWRQUbwHDc
         swWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261208; x=1790866008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qvbp6E0aGuxVVQ2sKaEGsmFQZRaCvhSjNEbb/Y+XMg=;
        b=QeEjkjTY9C+y8PrepS1ED3Xt5fll6nM6sypOVrVMRT69wMIYHxWidg7wjjKDue972F
         eAkR6Z6cApd6BXCGRT2j4eElGCsV/HkWzigUU3v35n6L/GECRCSXu8lE0axIXbWpvJN4
         3qWf7X51x/2LMYSpHjnkoPTmiB83IzIYmQYmaI+yMGTYuCJmP79OBZ8mD1KijFSxDfHB
         GSVLBNPyJmQYq9nhoux4IHnhvVo+Ndzdu+JKcbp5XVnl2XxQ/bNZjWOolKaX9zpEFGRD
         EFdu57y/AZ1H2z4q0XltkEZck6nsnCoGLpNIrbFHpN1W2fwy/7I0UlkysnJMkHUSbbLI
         2jpg==
X-Forwarded-Encrypted: i=1; AKwUvBxtbGkRxGhm6/cRZj3eS2tYDkRMZHsgqwnVFNCsCRS6n05egZ/EAIrA1BxHCAO7d9FYCa/rzEsPExAscA==@vger.kernel.org
X-Gm-Message-State: AFuF++nqqkFu4a+nD+GIVPN4b3NDqloSNlqIM0I/VS9Tofv8VDOsAKjj
	yJ/ja2o3tBnifmy99HxInaW0gcVphZil7VwEgZGlQ01ymRJgHYqvWOST
X-Gm-Gg: AYBFou1ETSGZCi7luPuG3psCaBIMsR5D9xNrZkk29FcyYsfO5d77rcv6MwOne6FaiKm
	to6duVkL2SXT5N2bjY5/SJS3+RpmIvG4T8euDFqV8p05Bvo+TTrIcRQA2jE3bbBsMqp3fAvHXR+
	qxJUfM21v7PFEOrcyekaBUe937StNghA3xyb2AfsLKfP0mu6hQWdGy1rBOUsEKduFSVBpk/9tzl
	GktZWyECbgSph+2scaPL+EYQ6tWm7/OJVZgzQvCfhd8Dlh6W5kgdrvG8LgRBmhtKDg+lcMjAOXn
	hRK8x7VDxZicxamuxc0L3dE9OX8i6LNm7q+ijOUxAC7hTKMXiitdCnlnWV5dvV1FiazgNWjR5xm
	0ymS5ik3ENK+hjWLBxK598nu5kbTP1zrsS+2HH6MRWTXz3YzBVU5FiePv3THd05XUiBGItBX55Y
	he9xhlF6Whz+EzCKd7ZqRgjQk2IcpA23EVyJcoWvli/d4HY1stkNAl7LsmPfAtmshc2rX4/sP3D
	CM86IRo8QRy63jnSQ==
X-Received: by 2002:a17:903:390d:b0:2dd:c053:a6f6 with SMTP id d9443c01a7336-2df7dc49a92mr22097905ad.40.1790261208005;
        Thu, 24 Sep 2026 07:46:48 -0700 (PDT)
Received: from localhost.localdomain ([118.179.89.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f66b3sm28850275ad.73.2026.09.24.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:46:47 -0700 (PDT)
From: Muhtasham Nawr al-Mahmud <muhtaseem2005@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Kailang Yang <kailang@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhtasham Nawr al-Mahmud <muhtaseem2005@gmail.com>
Subject: [RFC PATCH] ALSA: hda/realtek: Fix speakers on ASUS PM3406CHA
Date: Thu, 24 Sep 2026 20:45:12 +0600
Message-ID: <20260924144512.3989-1-muhtaseem2005@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ExpertBook PM3406CHA uses an ALC256 codec with subsystem
ID 1043:1664. On Linux boot, the internal speakers are silent even
though playback is routed to the codec and the speaker pin is
configured for output.

The codec starts with coefficient 0x10 set to 0x1d20. Writing 0x7f20
to coefficient 0x10 immediately restores internal speaker output.

This was reproduced on the affected hardware from a fresh boot using
hda-verb. Reducing a larger initialization sequence showed that this
coefficient write alone is sufficient; no GPIO, EAPD, pin-control, or
other coefficient changes are required. After applying the coefficient
in userspace, speaker output also remains functional across suspend
and resume.

Add a machine-specific HDA fixup that writes the required coefficient.

The fixup has been compile-tested, but could not be boot-tested because
the affected hardware is no longer available.

Closes: https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/2162718
Signed-off-by: Muhtasham Nawr al-Mahmud <muhtaseem2005@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a111c59c..89679ed73484 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4384,6 +4384,7 @@ enum {
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN_HEADSET,
 	ALC285_LENOVO_DAC_RENAME,
 	ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1,
+	ALC256_FIXUP_ASUS_PM3406CHA,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -4481,6 +4482,14 @@ static const struct hda_fixup alc269_fixups[] = {
 			{}
 		}
 	},
+	[ALC256_FIXUP_ASUS_PM3406CHA] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x10 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x7f20 },
+			{}
+		}
+	},
 	[ALC269_FIXUP_SKU_IGNORE] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_sku_ignore,
@@ -7814,6 +7823,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1652, "ASUS ROG Zephyrus Do 15 SE", ALC289_FIXUP_ASUS_ZEPHYRUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1663, "ASUS GU603ZI/ZJ/ZQ/ZU/ZV", ALC285_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1664, "ASUS ExpertBook PM3406CHA", ALC256_FIXUP_ASUS_PM3406CHA),
 	SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x16a3, "ASUS UX3402VA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),

base-commit: f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
-- 
2.54.0


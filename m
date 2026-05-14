Received: from n169-112.mail.139.com (n169-112.mail.139.com [120.232.169.112])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEA6384CD0;
	Thu, 14 May 2026 15:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773387; cv=none; b=AmgZXSqmZXpUeH5rpA30n5fIOMQZ9nx7F2hYsjiPHiBofGUSU1YDFseJMIgd9sxNKh30aJ7e1dJHWxCVkfHbyL97oYBwatb1g9U/ucv7u6QycCVQRpPDHCMCQgqcTzng0wFQoR6tfUeNeHygsvNMFKmxj+TN3eR+5rEESiSd/xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773387; c=relaxed/simple;
	bh=bFwZNDldaYYkhRLc8OGTgiwqqwki+vjeX/sYLyNWUbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AJDnYbb20c4EPteI13IMtoTofhdgSJnUJ37TekLhcCanqZk5auNxoCjs2shM8Fptp31s3tv7uXZm+/NEtN+RWV5ApqSiDOae2us9l1UeaUCbr2N7NNaWv2baDhSVEewqdO/f9qEsB/C32SH8aDqfkrJ87/a7ni84Oi4YG4QSz+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b=VwnWeg//; arc=none smtp.client-ip=120.232.169.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b="VwnWeg//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=VwnWeg//Db8ezKyPPESXw7Rvdlr/Iezzur3fsxj4te+zLJj7Vw8/Pt+M3XipsF24IRZohBieV+A8W
	 cuqwXg7VQetTb1T4+WlaMXayMmfOZvlSuvhO8LwQFQRFxltRdOdkkwGqkQ5Rcj1oy5yf5plhXVuYEX
	 a3Esz+lPxWC8HjkM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from yoga-Yoga-Pro-7-15ASH11.. (unknown[2409:8A00:7873:2520:BA29:7DA3:3FB0:680D])
	by rmsmtp-lg-appmail-23-12026 (RichMail) with SMTP id 2efa6a05ecbc288-042dc;
	Thu, 14 May 2026 23:39:52 +0800 (CST)
X-RM-TRANSID:2efa6a05ecbc288-042dc
From: Jackie Dong <xy-jackie@139.com>
To: perex@perex.cz,
	tiwai@suse.com,
	zhangheng@kylinos.cn,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mpearson-lenovo@squebb.ca,
	Jackie Dong <xy-jackie@139.com>
Subject: [PATCH v2] ALSA:hda/realtek: ALC269 fixup for Lenovo Yoga Pro 7 15ASH111 audio
Date: Thu, 14 May 2026 23:39:40 +0800
Message-ID: <20260514153940.7320-1-xy-jackie@139.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ALSA:hda/realtek: ALC269 fixup for Lenovo Yoga Pro 7 15ASH111 audio

Volume control for the speakers on the Lenovo Yoga Pro 7 15ASH11 laptop 
doesn't work.
The DAC routing is the same as on the ThinkPad X1 Gen7 function, so reuse
the alc285_fixup_thinkpad_x1_gen7 to get it working.

Signed-off-by: Jackie Dong <xy-jackie@139.com>

---
Changes in v2:
 - Use ALC245_FIXUP_BASS_HP_DAC instead of creating a new quirk.

---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 11d0ea8ed859..ab0a1f68538c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7752,6 +7752,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38df, "Y990 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38f9, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
+	SND_PCI_QUIRK(0x17aa, 0x38fc, "Lenovo Yoga Pro 7 15ASH11", ALC245_FIXUP_BASS_HP_DAC),
 	SND_PCI_QUIRK(0x17aa, 0x38fd, "ThinkBook plus Gen5 Hybrid", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
-- 
2.43.0



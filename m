Received: from n169-114.mail.139.com (n169-114.mail.139.com [120.232.169.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5C4407CDF;
	Wed, 27 May 2026 13:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887064; cv=none; b=CYOY7o2bAmEwvYmqki/kQUnxxn/44G/2oRhixepKj1UJSc87KStvFZ0SeQ4Tt1hAxgKhuFLPBZK2ypRg91GxFHX/ig6uHozZyEg7cAV218kJtZKHnAlQyxeI55OIQEU1YT9WfBG5fKyaW8hu5VIV9x1L8T+EE1bOdNgicTk5AWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887064; c=relaxed/simple;
	bh=ZqokV35wZ9E+6xbkodByqy8x8zL0CVBl+mrOaEScrPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lwly3blgFQb1D8eSyuCRBoKBbOjL0k26C4tcegPKok3cT6dnMtaSqz5RAwyyWuuPyaKohEDZHBsl6XPwtGEYnR5Gp/bxjAjx5n1JdvYZlsA4b7n6otz5bxrz4ng4r+tpqQDq2yiYOH51CEqww6qkPacYRmOmZ4dQFgoOo58SIXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b=dXSMAnVc; arc=none smtp.client-ip=120.232.169.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b="dXSMAnVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=dXSMAnVcwaNNsBy1D+M4oROfpMYzA77UzbNQu6EfqIdTd9Nk0tPUgn7VZqSm9FopmNOyCzTBxs5Lh
	 dqS6Hc2CeND8drPLeFgiKnxvR0XoPSPWNLTvAovPycUA2MQck1iH45lnqfBDrbjuBaFy4tHdJnDKqo
	 g+xLdcIwQtyQFhyw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from jackie-ThinkPad-X13-Gen-2a.. (unknown[240E:404:1921:11EF:B530:2D7D:C5C6:5661])
	by rmsmtp-lg-appmail-42-12056 (RichMail) with SMTP id 2f186a16ebc13f2-0140c;
	Wed, 27 May 2026 21:04:15 +0800 (CST)
X-RM-TRANSID:2f186a16ebc13f2-0140c
From: Jackie Dong <xy-jackie@139.com>
To: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	zhangheng@kylinos.cn
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jackie Dong <xy-jackie@139.com>
Subject: [PATCH] ALSA:hda/realtek:ALC269 fixup for Yoga Pro 7 15ASH11 mic mute LED
Date: Wed, 27 May 2026 21:03:53 +0800
Message-ID: <20260527130353.5658-1-xy-jackie@139.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lenovo Yoga Pro 7 15ASH11 with AMD RYZEN AI MAX+ 388 (Strix Halo, ACP
7.0) uses Realtek ALC287 series codec. The ALC269_FIXUP_LENOVO_XPAD_ACPI
in alc269_fixup_vendor_tbl[] can load lenovo_wmi_hotkey_utilities module
by default in this laptop, but the driver doesn't control mic mute LED.
 
If users run below command and the mic mute LED can work normally.

$sudo echo 'Capture Switch' >/sys/class/sound/ctl-led/mic/card1/attach 

After added the SND_PCI_QUIRK quirk special for Lenovo Yoga Pro 7
15ASH11, the mic mute LED works well.

Signed-off-by: Jackie Dong <xy-jackie@139.com>
---
 sound/hda/codecs/realtek/alc269.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f180d6a72021..ea520cf20de8 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4076,6 +4076,7 @@ enum {
 	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
 	ALC298_FIXUP_LENOVO_C940_DUET7,
 	ALC287_FIXUP_LENOVO_YOGA_BOOK_9I,
+	ALC287_FIXUP_LENOVO_YOGA_PRO7,
 	ALC287_FIXUP_13S_GEN2_SPEAKERS,
 	ALC256_FIXUP_SET_COEF_DEFAULTS,
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
@@ -6101,6 +6102,13 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
+	[ALC287_FIXUP_LENOVO_YOGA_PRO7] = {
+		.type = HDA_FIXUP_FUNC,
+		/* Reuse the DAC routing selected for ThinkPad X1 Gen7 */
+		.v.func = alc285_fixup_thinkpad_x1_gen7,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_LENOVO_XPAD_ACPI,
+	},
 	[ALC623_FIXUP_LENOVO_THINKSTATION_P340] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_no_shutup,
@@ -7767,7 +7775,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38df, "Y990 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38f9, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
-	SND_PCI_QUIRK(0x17aa, 0x38fc, "Lenovo Yoga Pro 7 15ASH11", ALC245_FIXUP_BASS_HP_DAC),
+	SND_PCI_QUIRK(0x17aa, 0x38fc, "Lenovo Yoga Pro 7 15ASH11", ALC287_FIXUP_LENOVO_YOGA_PRO7),
 	SND_PCI_QUIRK(0x17aa, 0x38fd, "ThinkBook plus Gen5 Hybrid", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
-- 
2.43.0



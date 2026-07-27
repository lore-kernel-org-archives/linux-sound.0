Received: from n169-114.mail.139.com (n169-114.mail.139.com [120.232.169.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043773DDDDB;
	Mon, 27 Jul 2026 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139266; cv=none; b=Z+uZ7Jogdu1U3vNu/M68XSG97UzsOh1NLVvuMY/GFHZ1+blolbDnkG4xF8TnhlFYQlpVQtfxrVkOQLZLCViyrrXEM9Cz36jeK/uvQkyO00p3nwbHfsiBfLp1hVKF9+gG9foQxSNhra1+M/ll423YisVnSXjcLMyXEHKPjpHicms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139266; c=relaxed/simple;
	bh=b2xTlLV9OHAWAVGhQHwU+xY8B1ghth7TBEEWdgsN74M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hoqZXndCs8jsMDQBbfFsCMv/BtTp+5u1jkuW2eTztByyBP1zMzzySzUQPWtt+TZN+EMbrD48ikl8IZYzcAvYGf+lS0W21ObQVjQBSMwAzAhBrrjAiJoHPG3X1kHkaPG1qaUawStFuPSBUOWSC9veYKIkMpDkFup9hIisNZmtqL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b=xa/bxuOo; arc=none smtp.client-ip=120.232.169.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b="xa/bxuOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=xa/bxuOoaKCJ65MywmDmDWqNUNsG5/MuwId1PZnGR73TxGhpwsHuF0Xj5RvvpdTZMyifplJ2pjt8l
	 FFB0EChG2sGCDMMaSraA2LKMauMS57hsR6q1H9qJgiIgtPVHNNPA08is2A4ciJropvPaJqrkr1UifA
	 K3yww36rx97Fbjec=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from ud26-Legion-7-15ASH11 (unknown[240E:404:1910:7BB7:F6F0:CA25:7FAE:F475])
	by rmsmtp-lg-appmail-42-12056 (RichMail) with SMTP id 2f186a6710312c3-022f0;
	Mon, 27 Jul 2026 16:00:56 +0800 (CST)
X-RM-TRANSID:2f186a6710312c3-022f0
From: Jackie Dong <xy-jackie@139.com>
To: perex@perex.cz,
	tiwai@suse.com,
	zhangheng@kylinos.cn,
	kailang@realtek.com,
	damien.dagorn29@gmail.com,
	sean@starlabs.systems,
	chris.chiu@canonical.com,
	huanglei@kylinos.cn,
	dnaim@cachyos.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jackie Dong <xy-jackie@139.com>
Subject: [PATCH] ALSA:hda/realtek:ALC269 fixup for Legion 7 15ASH11 Mic Mute LED
Date: Mon, 27 Jul 2026 16:00:48 +0800
Message-ID: <20260727080048.13254-1-xy-jackie@139.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lenovo Legion 7 15ASH11 with AMD RYZEN AI MAX+ 392 (Strix Halo, ACP
7.0) uses Realtek ALC287 series codec. Its audio subsystem adopts a 
hardware design similar to that of the Yoga Pro 7 15ASH11.

It shares PCI SSID 17aa:38f9 with Thinkbook 16P Gen5. 
Therefore, use HDA_CODEC_QUIRK to apply ALC287_FIXUP_LENOVO_YOGA_PRO7 
for identification.  

After added the HDA_CODEC_QUIRK quirk special for Lenovo Legion 7
15ASH11, the mic mute LED works well.

Signed-off-by: Jackie Dong <xy-jackie@139.com>
---
 sound/hda/codecs/realtek/alc269.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 379e1458f4ac..92bf865c7dac 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7927,6 +7927,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38e0, "Yoga Y990 Intel VECO Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38f8, "Yoga Book 9i", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38df, "Y990 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
+	/* Legion 7 15ASH11 shares PCI SSID 17aa:38f9 with Thinkbook 16P Gen5;
+	 * use codec SSID to distinguish them
+	 */
+	HDA_CODEC_QUIRK(0x17aa, 0x395b, "Lenovo Legion 7 15ASH11", ALC287_FIXUP_LENOVO_YOGA_PRO7),
 	SND_PCI_QUIRK(0x17aa, 0x38f9, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38fc, "Lenovo Yoga Pro 7 15ASH11", ALC287_FIXUP_LENOVO_YOGA_PRO7),
-- 
2.53.0



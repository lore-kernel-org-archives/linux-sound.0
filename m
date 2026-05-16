Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B575355055;
	Sat, 16 May 2026 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778930172; cv=none; b=navEUW0eMxOyrulS83i3cwdqvdhaFbL35mapraRyHDTH01aZ8Rq9W2D9B0X0zXKJ5q1TS6TuyytVeiphlblq0QK4oDfXknMbSt3KGeItaXHa6n0FqjUMdFUdGXix5EO/eBAK16VzjapZOohiVH5oRnEdyweV0rxU+GPac0wdKnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778930172; c=relaxed/simple;
	bh=gQdECvcfLPQTdWKG0qtNSQoFcbvBn1eH/T+r1/r0W3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d3YxblUF+U6hH2Udtww1zNiwyXDkMIloT/2u27MBud63QPFAKuQoVR7kPTckrcfe/Mno56zFuAhc1oMsirE0zkTX4A+ew1fDApHCTam3fwhI0VMmAoMZDv1UnoEcWcYAuaTt2PfW5o2wL2cMWiIwDnut20/T6elliMaoPESzaa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=e0oyxW5w; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="e0oyxW5w"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A647128165F;
	Sat, 16 May 2026 13:15:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1778930163; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=dQh3OeWUlpeO1a1VZ4mDnDnZHxwNYjnkc5rFxzzmB5M=;
	b=e0oyxW5wb14poO8O0aVLfyrXnuMZPzNA4128hxTSazj3IFg4r0+HN2zu/UN4ImMGemuyic
	6IXeQa5CypZuxlmSPBtTWWj60d/ch4ZqazQnOfgdJkwDFiaEOqTnAXxtyKsNkJIXteMQ5O
	6gGHQpmDhFhaAdOT1bi4hFJqRWqLpblB5JPhyg6pAbiu4yiBfKSipHmOXyDRIdzp+o/Hdk
	0BflODtL85VjzYlyTRItzOT/BMHQTlWNcmlNOF8N1SQrucn1E+opKY85DHomXFhlzutsLS
	6mbyCEw1d7CDeeZUN3Mkg46sWzvrIcGQr5kJU2IXAoMdLf8o7wlRguvnJUY+kA==
From: Eric Naim <dnaim@cachyos.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Baojun Xu <baojun.xu@ti.com>
Cc: Eric Naim <dnaim@cachyos.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Use ALC287_FIXUP_TXNW2781_I2C for ASUS Strix Gxx5
Date: Sat, 16 May 2026 19:15:31 +0800
Message-ID: <20260516111532.111463-1-dnaim@cachyos.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

These devices were incorrectly using the ALC287_FIXUP_TAS2781_I2C quirk
leading to errors:

[ 18.765990] Serial bus multi instantiate pseudo device driver TXNW2781:00: error -ENXIO: IRQ index 0 not found
[ 18.768153] Serial bus multi instantiate pseudo device driver TXNW2781:00: error -ENXIO: IRQ index 0 not found
[ 18.768476] Serial bus multi instantiate pseudo device driver TXNW2781:00: error -ENXIO: IRQ index 0 not found
[ 18.768899] Serial bus multi instantiate pseudo device driver TXNW2781:00: Instantiated 3 I2C devices.

Use the ALC287_FIXUP_TXNW2781_I2C quirk instead to fix this and restore
speaker audio on affected devices.

Fixes: 1e9c708dc3ae ("ALSA: hda/tas2781: Add new quirk for Lenovo, ASUS, Dell projects")
Link: https://lore.kernel.org/59fd4aa4-76b9-4984-8db9-a60e55ec6e80@losource.net/
Closes: https://lore.kernel.org/CACB9z7kjs8rhLstEc8fV29BCTb5dd881JwGozoKdO5cwCb=YwQ@mail.gmail.com
Signed-off-by: Eric Naim <dnaim@cachyos.org>
---
 sound/hda/codecs/realtek/alc269.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

 Changelog from v1:
 - Touch up the commit description
 - Add a link

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ee892039fae0..ad62b9e7ef22 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7394,12 +7394,12 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x3e00, "ASUS G814FH/FM/FP", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x3e20, "ASUS G814PH/PM/PP", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x3e30, "ASUS TP3607SA", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x1043, 0x3ee0, "ASUS Strix G815_JHR_JMR_JPR", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x1043, 0x3ef0, "ASUS Strix G635LR_LW_LX", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x1043, 0x3f00, "ASUS Strix G815LH_LM_LP", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x1043, 0x3f10, "ASUS Strix G835LR_LW_LX", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x1043, 0x3f20, "ASUS Strix G615LR_LW", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x1043, 0x3f30, "ASUS Strix G815LR_LW", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x3ee0, "ASUS Strix G815_JHR_JMR_JPR", ALC287_FIXUP_TXNW2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x3ef0, "ASUS Strix G635LR_LW_LX", ALC287_FIXUP_TXNW2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x3f00, "ASUS Strix G815LH_LM_LP", ALC287_FIXUP_TXNW2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x3f10, "ASUS Strix G835LR_LW_LX", ALC287_FIXUP_TXNW2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x3f20, "ASUS Strix G615LR_LW", ALC287_FIXUP_TXNW2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x3f30, "ASUS Strix G815LR_LW", ALC287_FIXUP_TXNW2781_I2C),
 	SND_PCI_QUIRK(0x1043, 0x3fd0, "ASUS B3605CVA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x3ff0, "ASUS B5405CVA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
-- 
2.54.0


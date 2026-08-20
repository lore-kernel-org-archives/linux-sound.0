Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDFA440631;
	Thu, 20 Aug 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231226; cv=none; b=RzPqIagFrnnTtgG5CzO8czxq53IZX4C8uIeESlyuOifNjqEt/AN3dNZYa3nS7jHQriaMuyWhOitm4SIve73Sd32FeXX94bnAbRDu2F9SEcbv6H5Bzx9BFWoXkJyT8SUJcOhSjAR+D+ADHwuR/fWQc2JHEmqdOIOB21ZzFg9fAI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231226; c=relaxed/simple;
	bh=E4u+LZSyYe0ttngMxYIpmJtlhmKzS1UDsuQXZKN6h6M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t1XmzsWKjXjJWqMKE7NdppaVbo/UtV6+O0hxEOdofGluvb9Z5qNpqexsWtKYXj1UoB5aWG8tFhSOhhOJ32ChkjuDp8y/Bo8C7xjDRslHdvwqlLvWe9xflbZO08QXDe7mnxVvbNY3jCxiVsvS1roCq0zD2MBNK9wduofY/qMsMTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 055485269c9811f19a56ed5b684f684d-20260820
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:11bab289-5a18-4080-b212-e162c5fe27c5,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:8fc5a363874f8f09f51ddbed13336616,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|850|865|898,TC:nil,Content:0|15|50,E
	DM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 055485269c9811f19a56ed5b684f684d-20260820
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1423055428; Thu, 20 Aug 2026 21:06:56 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 2/2] ALSA: hda/realtek: Reorder quirk entries for Lenovo Legion Pro 7 16ARX8H
Date: Thu, 20 Aug 2026 21:06:44 +0800
Message-Id: <20260820130644.76093-2-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260820130644.76093-1-zhangheng@kylinos.cn>
References: <20260820130644.76093-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder the HDA_CODEC_QUIRK entries for 0x17aa:0x38a7 and 0x17aa:0x38a8
so that the AMD variant (TAS2781) is matched before the Intel variant's
PCI SSID (0x386f) which uses a different amplifier. This ensures the
correct fixup (ALC287_FIXUP_TAS2781_I2C) is applied to the AMD model,
restoring internal speaker functionality.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 750c5a58d022..4b3afc88ef5c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8058,8 +8058,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	HDA_CODEC_QUIRK(0x17aa, 0x386a, "Lenovo Yoga 7 16IAP7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x386e, "Yoga Pro 7 14ARP8", ALC285_FIXUP_YOGA_SPEAKER2_TO_DAC1),
-	HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
 	HDA_CODEC_QUIRK(0x17aa, 0x38a7, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
+	HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
 	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3874, "Legion 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.25.1


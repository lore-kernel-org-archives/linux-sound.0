Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C72F1C2AA;
	Tue, 21 Jul 2026 12:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784636183; cv=none; b=bB+xIk6I+ICovV3HgQkuLjNhOmdq6l1Tr04v/gFn04aR0WOFkoaQDBV9ZE/eZFBj0rVFBNxn+X4QY1pfOdt0Xz76wgNfmcH1T0b/p3ch4J68v142mVoaWC3OOjgb1MB4fYENZsEJd3bEiRrkOQfdIoQuh3ao/WM1sGwI2uSxZ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784636183; c=relaxed/simple;
	bh=BdIhcN+RUtpCmv1zlFMUIDEYlYH8Xi5rEHXcpmhipJE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rl/XXkWT+ZYrLE1WUAreTU2RH15O7Y2xDOrV3UDd74d3UNk+Re5chIqGthJXfan60MQp2MldDnIJlALeVKkL8DaZKDaQbjDo5HbarX4XfhrLcpW+xpkx3wxKJgpKUJZuXmOsjU5Rrp6kcnIqy0F+LYbH7cZebcGB17lB6mUwwdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f710945c84fd11f1aa26b74ffac11d73-20260721
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d154bdcd-47b7-4d52-a854-6f4531f53a5a,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:cef37cfc77b5f83c1db1273b0cceab69,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f710945c84fd11f1aa26b74ffac11d73-20260721
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1997723003; Tue, 21 Jul 2026 20:16:13 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 2/2] Revert "ALSA: hda/realtek: Add quirk for Lenovo Xiaoxin 14 GT"
Date: Tue, 21 Jul 2026 20:16:09 +0800
Message-Id: <20260721121609.337299-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 3a3e810e91080a5121170ee11554a55ed89a1c8b.

The fixup ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN is intended specifically
for bass speaker non-functionality issues, not for resolving hissing or
crackling noise problems. Applying this fixup to address noise would be
inappropriate.

I previously investigated a similar issue on the same codec (ALC287) where
both speakers and headphones exhibited noise. While I was able to resolve
the speaker noise by adjusting verb coefficients, the headphone noise
persisted because some coefficient writes did not take effect properly.
As a result, I did not submit a patch at that time.

Maintainers, please review this problem and advise on a proper solution.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221203
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 4589b748b0a3..07fc6c1deb07 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7975,7 +7975,6 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3911, "Lenovo Yoga Pro 7 14IAH10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
-	SND_PCI_QUIRK(0x17aa, 0x3912, "Lenovo Xiaoxin 14 GT", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x391a, "Lenovo Yoga Slim 7 14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x391f, "Yoga S990-16 pro Quad YC Quad", ALC287_FIXUP_TXNW2781_I2C),
-- 
2.25.1


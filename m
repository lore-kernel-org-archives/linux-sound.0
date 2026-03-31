Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E3F274B2B;
	Tue, 31 Mar 2026 03:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774928227; cv=none; b=dC7EkNVEVTvtKLyK4yZYjdy+FAn4JE3QEwyvb72d0EO7jpG9Izju96ZDAD5NqA65KXKj8BH7WdL7VhDjI1z5EHVnKt2i5n0H8RpgwKaQ8P2vQJJQdbgxu6ec3E5HfHB4T2l/lQwWzpUQW4Ko+Fac5Oa43fJWzyQfJz1FJ/8Z1SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774928227; c=relaxed/simple;
	bh=clr7YcDAci0tJCBeJxdSVBuWntoRoPjlSA0AV8YE9Gg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UeVRjFJoaYZwlI+C2m5Und+uoCW83NLHkJ5abocsWRDLc53S0YY2Qjv8VY0q/NSzYpyvF9c2rFQAfnWYqf9zj1azfBX590/Tt1HcBJrVxDtrquk95ya20yJdrJKVxygV+M5bFzYpKWKXCc5egBrwgONajukO86eoOzPwx4pyWk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: de018f282cb211f1aa26b74ffac11d73-20260331
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:98c32030-d8d3-4342-bf1d-c4490adc010d,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:07ea95a8388b76db4522a522e8d9fb5e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: de018f282cb211f1aa26b74ffac11d73-20260331
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 564700178; Tue, 31 Mar 2026 11:36:56 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn,
	Garcicasti <andresgarciacastilla@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga Slim 7 14AKP10
Date: Tue, 31 Mar 2026 11:36:50 +0800
Message-Id: <20260331033650.285601-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pin Complex 0x17 (bass/woofer speakers) is incorrectly reported as
unconnected in the BIOS (pin default 0x411111f0 = N/A). This causes the
kernel to configure speaker_outs=0, meaning only the tweeters (pin 0x14)
are used. The result is very low, tinny audio with no bass.

The existing quirk ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN (already present
in patch_realtek.c for SSID 0x17aa3801) fixes the issue completely.

Reported-by: Garcicasti <andresgarciacastilla@gmail.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221298
Signed-off-by: songxiebing <songxiebing@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b6a58852752a..e37cebd99287 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7657,6 +7657,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
+	SND_PCI_QUIRK(0x17aa, 0x391a, "Lenovo Yoga Slim 7 14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x391f, "Yoga S990-16 pro Quad YC Quad", ALC287_FIXUP_TXNW2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", ALC287_FIXUP_TXNW2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3929, "Thinkbook 13x Gen 5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
-- 
2.25.1


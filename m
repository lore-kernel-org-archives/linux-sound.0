Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966969;
	b=SsphIazmUp6Qigz3Vf9by84DT0U2sbdt7G5kY9gXmydVfFkf41cOiK1hTrTcv0mT3M3y
	 xFZh60dTrMJvbLBuSXtI/9rcxRsN+Bs5N4pgZgQL0+L90RmOXaL5o2WlDte4Fh1rztJDr
	 taAFO7YlT7/ougJFc9tKelTWhBy9mrvW/nZ65MO2pwezmFXmK4cgGv5mQEp1yXLpvRX+X
	 4w6oy4s1J7+5LbKkHb+Pslv/XRF444pd6k/RrzTiGcXJVLyOH6UdekEFWP752hBeKk5EN
	 hVxZVPysHfU4VcRnZ0n1oi22CwliOzQMrSAVNq1V6p42c+3ro3EiHkzLCYOqBMS3auw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966969;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cJpuGDlmdbnP47x2WyY7ZXMTIkoEUlLzmh4NMqiw8sk=;
	b=GdRD7C7bYXnW+O6G6nwqdCbg7jcB17zXWfCyQ0EXUp0u6W1LblMgRPjM9yQFn4j8NRz/
	 /jvhbPd7nc1fB33lLPz6vx4D4SzaXKdFvxdC1canudZL7Kyps2Lbop/zzXrHcTu42sEgq
	 myYy7KYMwMDDHRcEZNAm6PkHL2ZJI9ReKkIvKvTM75CejbHD4ZBUpOgcsZJ4hrMEhPazp
	 dyBgFzFhrFPRG6nAR/2N7sHqEIA4bXwS+a1+QC+KPgvsi7W7579I/mxZr1G7LgQ6gEmqO
	 jdybWwzYl1sZpTlCK/PYqbGIU1CnELLI0+b4G4vrm8pk5O3y9FqPxiBXcby94FStN1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79BB606A335;
	Wed, 18 Nov 2026 01:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A79BB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 34ebafd4e2f311f19a56ed5b684f684d-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:27de6cc4-2489-4c0c-9028-274ef28c1905,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:b2caecfad334484776a780bb1e4634b0,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 34ebafd4e2f311f19a56ed5b684f684d-20261118
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 714347037; Wed, 18 Nov 2026 09:56:01 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	jmoises <moises_gc97@hotmail.com>
Subject: [PATCH v2 2/4] ALSA: hda/realtek: Add quirk for HP Pavilion 15-cw1xxx
Date: Wed, 18 Nov 2026 09:55:50 +0800
Message-Id: <20261118015552.201306-3-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118015552.201306-1-zhangheng@kylinos.cn>
References: <20261118015552.201306-1-zhangheng@kylinos.cn>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Pavilion 15-cw1034la (ALC295, SSID 103c:8615) has silent internal
speakers with the generic fixup.  Add ALC295_FIXUP_HP_CW1XXX to set
COEF 0x0d=0xa023 and chain to ALC295_FIXUP_HP_X360.

Reported-by: jmoises <moises_gc97@hotmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221534
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 6d7bc33bd0d5..84b145fa4e4d 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4334,6 +4334,7 @@ enum {
 	ALC298_FIXUP_HUAWEI_MBX_STEREO,
 	ALC295_FIXUP_HP_X360,
 	ALC295_FIXUP_HP_PAVILION_X360,
+	ALC295_FIXUP_HP_CW1XXX,
 	ALC221_FIXUP_HP_HEADSET_MIC,
 	ALC285_FIXUP_LENOVO_HEADPHONE_NOISE,
 	ALC295_FIXUP_HP_AUTO_MUTE,
@@ -5835,6 +5836,16 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC295_FIXUP_HP_X360
 	},
+	[ALC295_FIXUP_HP_CW1XXX] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x0d },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xa023 },
+			{}
+		},
+		.chained = true,
+		.chain_id = ALC295_FIXUP_HP_X360
+	},
 	[ALC221_FIXUP_HP_HEADSET_MIC] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -7754,6 +7765,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8603, "HP Omen 17-cb0xxx", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x860c, "HP ZBook 17 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x860f, "HP ZBook 15 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
+	SND_PCI_QUIRK(0x103c, 0x8615, "HP Pavilion 15-cw1xxx", ALC295_FIXUP_HP_CW1XXX),
 	SND_PCI_QUIRK(0x103c, 0x861f, "HP Elite Dragonfly G1", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x864f, "HP Laptop 15-dy0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x869d, "HP", ALC236_FIXUP_HP_MUTE_LED),
-- 
2.25.1


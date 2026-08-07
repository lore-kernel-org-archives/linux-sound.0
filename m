Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404B0479898;
	Fri,  7 Aug 2026 12:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107590; cv=none; b=kPKlmO/N9bqCBjZaFzZazVa5ajHvTeGodJ15Qts7TUQdxTQrxs9sFf4beZnsY9+pxs8DT4+Kg/HaqkiCBYZUuOuchpwvLM+zAao302OO2SRa4n09pfc7poE9XZG/SPf48A1C+8Fu+NBNKhrAoAthgG0qR8urP3LNHfHefnyaH94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107590; c=relaxed/simple;
	bh=jzYV/mp4HJoaoGFv++KcLQQBWO0dD3BNU8rdhwOlkLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U1Dn5g56+AuxoXNQMQTKs7IM5JOT6ik/mS05YD0gyAupqd+Vf8Zfu1AKscVCmEqL0KE9pq2poW/OsrilCf7XSPms+aCVLVFSBQ6xFJV4LRr8KcbCH5X+3gZfoMBI+IOIf/cQJRSOoS21gDrDyGBbJruoC8miv+S+R8Azg9S5dBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c6ba5422925f11f1aa26b74ffac11d73-20260807
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:abc6b74f-b122-43ea-98ce-4899471cb8e7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:a17ce16e0aaf2b03b33357482ebee64b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c6ba5422925f11f1aa26b74ffac11d73-20260807
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1068877248; Fri, 07 Aug 2026 20:59:07 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 4/4] ALSA: hda/conexant: Add pin config quirk for Huawei Matebook
Date: Fri,  7 Aug 2026 20:58:57 +0800
Message-Id: <20260807125857.678297-4-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260807125857.678297-1-zhangheng@kylinos.cn>
References: <20260807125857.678297-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The headphone jack is not detected on this Huawei Matebook (Conexant
SN6140 codec). The BIOS incorrectly marks Pin 0x18 as [N/A], causing
the driver to report hp_outs=0 and no "Headphones" output appears.

Override the pin configuration for NID 0x18 to set it as a headphone
jack, which restores proper detection and audio routing.

Link: https://github.com/thesofproject/sof/issues/10687
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/conexant.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5ea4c74715c5..c2f9409b76ef 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -292,6 +292,7 @@ enum {
 	CXT_PINCFG_TOP_SPEAKER,
 	CXT_FIXUP_HP_A_U,
 	CXT_FIXUP_ACER_SWIFT_HP,
+	CXT_FIXUP_HUAWEI_MATEBOOK_HP,
 };
 
 /* for hda_fixup_thinkpad_acpi() */
@@ -1035,6 +1036,13 @@ static const struct hda_fixup cxt_fixups[] = {
 			{ }
 		},
 	},
+	[CXT_FIXUP_HUAWEI_MATEBOOK_HP] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x18, 0x03211020 }, /* Headphone */
+			{ }
+		},
+	},
 };
 
 static const struct hda_quirk cxt5045_fixups[] = {
@@ -1135,6 +1143,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo G50-70", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x397b, "Lenovo S205", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad/Ideapad", CXT_FIXUP_LENOVO_XPAD_ACPI),
+	SND_PCI_QUIRK(0x19e5, 0x3289, "Huawei Matebook", CXT_FIXUP_HUAWEI_MATEBOOK_HP),
 	SND_PCI_QUIRK(0x1c06, 0x2011, "Lemote A1004", CXT_PINCFG_LEMOTE_A1004),
 	SND_PCI_QUIRK(0x1c06, 0x2012, "Lemote A1205", CXT_PINCFG_LEMOTE_A1205),
 	SND_PCI_QUIRK(0x1d05, 0x3012, "MECHREVO Wujie 15X Pro", CXT_FIXUP_HEADSET_MIC),
-- 
2.25.1


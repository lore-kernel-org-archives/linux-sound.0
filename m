Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0924F440631;
	Thu, 20 Aug 2026 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231221; cv=none; b=uPoBoXMUhOnrsMlAJqAusJnZS8y9HRmyJNv4s4bGOapT4k4yLEdzhRT6IOdaR1a1WlfKkpD1cyo4aG8Rz/BZnlmCjSERIwQsXeYsClDp2owFvfaClEZT+Qb5v2EwUh0XyWClJLkLKYywQTQkskdTyUknYoOD4Me+YTsnFtrAc1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231221; c=relaxed/simple;
	bh=l0sLuh5WW7XH73BqINaK2oCSz5bozGKt3d+v/lb/Hxg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q9VmcDC+z5rybnqDu+U12UsBxCqO2Bf5taCxpZl2iQx4FsCg0PhfhqeZP8rGR0gtDn/5EEL5xWeb8W4D5bfnRvMqQreZSz1Jj9kUPg4AqKbkXNrC/Tg3255U2OEY8etF6BtF3pOxjngfj/N+P8RvolLZycCqCsIvHfFFSujkMoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 016fa13e9c9811f19a56ed5b684f684d-20260820
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b5c82010-b442-41cc-b48d-c36bfb88f858,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:56b8661c21a44f66a098cbfe2b78afc6,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 016fa13e9c9811f19a56ed5b684f684d-20260820
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 711025788; Thu, 20 Aug 2026 21:06:49 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 1/2] ALSA: hda/realtek: Fix bass speaker DAC routing for Lenovo Yoga Pro 9 16IAH10
Date: Thu, 20 Aug 2026 21:06:43 +0800
Message-Id: <20260820130644.76093-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Pro 9 16IAH10 (PCI SSID 17aa:3846, codec SSID 17aa:3920)
uses a TAS2781 smart amplifier driven via the ALC287 codec.  On this
machine the bass speaker pin (NID 0x17) is by default routed to DAC 0x03,
which has no volume amplifier capability, resulting in the right-side
woofer being barely audible while only the tweeter plays.  The Windows
driver configures NID 0x17 to DAC 0x02, which is shared with the main
speaker and carries proper amp control.

Currently this machine has no PCI SSID quirk, so it falls through to the
codec SSID fallback and matches the existing 0x17aa:0x3920 entry intended
for the Yoga S990-16, applying only the TAS2781 I2C init without the DAC
routing fix.

Add a dedicated quirk for PCI SSID 17aa:3846 that forces NID 0x17 to DAC
0x02 via alc285_fixup_speaker2_to_dac1() and chains to
ALC287_FIXUP_TXNW2781_I2C so the TAS2781 amplifier initialization is
preserved.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220540
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index cae327e1d90d..750c5a58d022 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4297,6 +4297,7 @@ enum {
 	ALC287_FIXUP_LENOVO_LEGION_AW88399,
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN_HEADSET,
 	ALC285_LENOVO_DAC_RENAME,
+	ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -7010,6 +7011,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_lenovo_dac_rename,
 	},
+	[ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_speaker2_to_dac1,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_TXNW2781_I2C,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -8031,6 +8038,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Lenovo Yoga 9i / Yoga Book 9i", ALC287_FIXUP_LENOVO_YOGA_BOOK_9I),
+	SND_PCI_QUIRK(0x17aa, 0x3846, "Lenovo Yoga Pro 9 16IAH10", ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1),
 	/* Yoga Pro 7 14IMH9 shares PCI SSID 17aa:3847 with Legion 7 16ACHG6;
 	 * use codec SSID to distinguish them
 	 */
-- 
2.25.1


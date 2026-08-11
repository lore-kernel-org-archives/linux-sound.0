Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EEA3264F1;
	Tue, 11 Aug 2026 06:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786429666; cv=none; b=D6SHTlSZaClr8FJVyC/+67pOTP+ksFE0mRQ3t/qEVB29dkmg8jD5pc95F0M5QszOXa5aKzOzu8kylI1Fyq8iRhnFfUGWC0j63xDeYuPPGmCcoeyDISzVz9PPQSv4VWZVFHhAwKs5JZomGGzcXXcbyMJgFPZLztJ0UXSPk9mOTCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786429666; c=relaxed/simple;
	bh=7AHiQQmie5Ux8Z6vTH1p3WQxEMISti4hHlAMqH9+Fpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y9QXlXvhE2Ezs8msaBXMVF187oRzlEMCWYQpcc7G7IN7Y9mJtK7dOu9xFarCNM/vRG8QbZ2J6AEmSgzk7i7RHK3ATy1/h/QJu8oT+SDxVJQ2afHtjAoG4yDdedagkzuu80IdSiaZdgBsYx+0VwRPnI8B4YhD68CdSn+UdeyZYzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bf83bd1a954d11f1aa26b74ffac11d73-20260811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:06c48c0d-09c6-4d54-88a2-4c9f25468e44,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:9c8749e05e5666fb28483a1d1d39a27f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bf83bd1a954d11f1aa26b74ffac11d73-20260811
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 818115433; Tue, 11 Aug 2026 14:27:38 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	Zhang Heng <zhangheng@kylinos.cn>,
	Branislav Klocok <branislav.klocok@orava.sk>
Subject: [PATCH v2] ALSA: hda/realtek: Rename Line Out control to Headphone on ThinkPad X1 Carbon 6th
Date: Tue, 11 Aug 2026 14:27:34 +0800
Message-Id: <20260811062734.400512-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87fr0lb2yg.wl-tiwai@suse.de>
References: <87fr0lb2yg.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ThinkPad X1 Carbon 6th Gen (ALC285, SSID 17aa:225c) has no physical
Line Out jack. The 3.5mm headphone jack is wired to the headphone DAC,
but the ALSA HDA driver names the corresponding control as
"Line Out Playback Volume" (node 0x02).

PipeWire's ALSA Card Profile (ACP) silences "Line Out" when headphones
are activated, which incorrectly mutes the headphone output.

Add a quirk to rename the control to "Headphone Playback Volume" via
alc285_lenovo_dac_rename().

Tested on openSUSE Tumbleweed (kernel 7.1.5):
- Control renamed successfully, no name collision with "Headphone Playback Switch"
- Headphone output works across multiple PipeWire/WirePlumber restarts
  and port switches

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221522
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
Tested-by: Branislav Klocok <branislav.klocok@orava.sk>
---
 sound/hda/codecs/realtek/alc269.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 6b36c730ce78..48d887d1324f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -2572,6 +2572,13 @@ static void alc282_fixup_asus_tx300(struct hda_codec *codec,
 	}
 }
 
+static void alc285_lenovo_dac_rename(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_BUILD)
+		rename_ctl(codec, "Line Out Playback Volume",
+			   "Headphone Playback Volume");
+}
 static void alc290_fixup_mono_speakers(struct hda_codec *codec,
 				       const struct hda_fixup *fix, int action)
 {
@@ -4289,6 +4296,7 @@ enum {
 	ALC287_FIXUP_AW88399_I2C_2,
 	ALC287_FIXUP_LENOVO_LEGION_AW88399,
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN_HEADSET,
+	ALC285_LENOVO_DAC_RENAME,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6998,6 +7006,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
 	},
+	[ALC285_LENOVO_DAC_RENAME] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_lenovo_dac_rename,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -7956,6 +7968,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x224b, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x224c, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
+	SND_PCI_QUIRK(0x17aa, 0x225c, "Lenovo ThinkPad X1 Carbon 6th Gen", ALC285_LENOVO_DAC_RENAME),
 	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x17aa, 0x2288, "Thinkpad X390", ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK),
 	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
-- 
2.25.1


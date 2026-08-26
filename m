Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1281E265606;
	Wed, 26 Aug 2026 01:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787708727; cv=none; b=SmifsD+uEkM0iWVgfQZO1E/YuCWv05buQGwbnxWiReGJ6DKYsGNl96XwNKzT7V8PGCMvSCuQbmRaEV07gOQZYgsp8yda1BFGmS4uB2qBpPBKbN0LD8b/YYKWcrjuqO/PDTJF2lgIDUEUHFB2EiW508ICyV0HT/0FmBLKEHjaI0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787708727; c=relaxed/simple;
	bh=nTjykYI+RPvXOhqi70my/upMeVS+sHZmQyC0do8hAwk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MXxC+USqIg+5ZpAmQCISL+8V1gCej3Z5YBxVCafGkr0HNNTFRhoKu1nbZ6nzfK8pEPSTSz6xMW75YMX2OaVtayt3Vsy+J+4fBezrUR7w1tf9OHr2bcuIAgCiF7MwHpHlMw+XXf8QhtXKIR+AwczlaGWqlCnnW1KrV+uHoK3z/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c9cd2894a0ef11f19a56ed5b684f684d-20260826
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a36c2bb4-8df8-4129-acb2-f35bb603e4d0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:51d3a1ebe12271c5a4fa3f70fbd9ae50,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c9cd2894a0ef11f19a56ed5b684f684d-20260826
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1432815253; Wed, 26 Aug 2026 09:45:16 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bob Song <songxiebing@kylinos.cn>
Subject: [PATCH v2] ALSA: hda/conexant: Refactor headset plug detection
Date: Wed, 26 Aug 2026 09:45:12 +0800
Message-Id: <20260826014512.221267-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260825023855.394959-1-songxiebing@kylinos.cn>
References: <20260825023855.394959-1-songxiebing@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

Rename cx_process_headset_plugin() to cx_process_headset_detect_plug_type()
to better describe what it does, and merge the duplicated CTIA/OMTP
branches since both select the same pin-widget control value for the mic
pin.

Move the AC_VERB_SET_PIN_WIDGET_CONTROL write into the caller
cx_update_headset_mic_vref() so that the mic pin control is applied
unconditionally while a mic is present, instead of only for CTIA/OMTP
headsets.

Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
changes in v2:
  - Optimize code logic and description
---
 sound/hda/codecs/conexant.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 40da2832ba66..6ad44cd9287c 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -207,7 +207,7 @@ static void cx_remove(struct hda_codec *codec)
 	snd_hda_gen_remove(codec);
 }
 
-static void cx_process_headset_plugin(struct hda_codec *codec)
+static void cx_process_headset_detect_plug_type(struct hda_codec *codec)
 {
 	unsigned int val;
 	unsigned int count = 0;
@@ -223,14 +223,11 @@ static void cx_process_headset_plugin(struct hda_codec *codec)
 		count++;
 	} while (count < 3);
 	val = snd_hda_codec_read(codec, 0x1c, 0, 0xcb0, 0x0);
-	if (val & 0x800) {
-		codec_dbg(codec, "headset plugin, type is CTIA\n");
-		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
-	} else if (val & 0x400) {
-		codec_dbg(codec, "headset plugin, type is OMTP\n");
-		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
+	if (val & 0xc00) {
+		codec_dbg(codec, "headset plugin, type is %s\n",
+			  val & 0x800 ? "CTIA" : "OMTP");
 	} else {
-		codec_dbg(codec, "headphone plugin\n");
+		codec_dbg(codec, "headphone or mic plugin\n");
 	}
 }
 
@@ -243,10 +240,12 @@ static void cx_update_headset_mic_vref(struct hda_codec *codec, struct hda_jack_
 	 * Check hp&mic tag to process headset plugin & plugout.
 	 */
 	mic_present = snd_hda_codec_read(codec, 0x19, 0, AC_VERB_GET_PIN_SENSE, 0x0);
-	if (!(mic_present & AC_PINSENSE_PRESENCE)) /* mic plugout */
+	if (!(mic_present & AC_PINSENSE_PRESENCE)) { /* mic plugout */
 		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x20);
-	else
-		cx_process_headset_plugin(codec);
+	} else {
+		cx_process_headset_detect_plug_type(codec);
+		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
+	}
 }
 
 static int cx_suspend(struct hda_codec *codec)
-- 
2.25.1


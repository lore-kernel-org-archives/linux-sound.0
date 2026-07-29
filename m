Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5803A35C180;
	Wed, 29 Jul 2026 06:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785307095; cv=none; b=RapZR1WMhprmMEXTwrThEBXSJhP1hR1AgcvfEJLJAjfEJv3PgrwUDNck7UIeh1kz2r7YwZ/j2nrzR/7WGY5Z4WCl28CFQ3laeCYy9CsAM2HWzEV+CjxZiuUpernXbNKsppUoG5SySY8EUSskqQGWdrKYTW89ZS8nDTBdAZYJqOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785307095; c=relaxed/simple;
	bh=v8hq821xa1P3+Auz71mRHrh5XyVx74m2EWjap6LpTEg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MAsf/8YelN/54Yl8qeDCTmeGAqNT5DceZmTYkzqT6R3NiOdbpMo+clriTdkUV7KqtoM6Gj0nNPKt4EiiwKj/erniJQH/opXzLQbqvjp62OgZMVEvqXb2zVcEtNs4f9RHKgAbuX09G8ySUSwLUwV4HoypTUcnMDFC6wNgFag9ta8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0ebc9f0e8b1811f1aa26b74ffac11d73-20260729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:2b175301-63cf-4c33-839a-cbe79e9d5e97,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:06616def195ab83187e08c29e005ba55,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0ebc9f0e8b1811f1aa26b74ffac11d73-20260729
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 193097255; Wed, 29 Jul 2026 14:38:06 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: [PATCH] ALSA: hda/realtek: add missing error checks in alc269 init/shutdown
Date: Wed, 29 Jul 2026 14:38:03 +0800
Message-Id: <20260729063803.1453980-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

alc_read_coef_idx() and alc_read_coefex_idx() can return -1 on error
via snd_hda_codec_read(). Several init and shutdown functions save these
return values and later write them back to hardware registers without
checking for errors, potentially corrupting COEF register state on a
read failure.

Add error checks in:
- alc282_init() and alc282_shutup(): check coef78 before write-back
- alc285_hp_init(): check coef38/coef0d/coef36 before update, check
  val before write-back, and break polling loop on error
- alc294_hp_init(): break polling loop on read error

Also add a missing NULL check for codec->bus->pci in alc269_probe()
before dereferencing it, consistent with the existing checks in the
same function.

Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 379e1458f4ac..d751e39529a2 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -296,7 +296,8 @@ static void alc282_init(struct hda_codec *codec)
 		msleep(100);
 
 	/* Headphone capless set to normal mode */
-	alc_write_coef_idx(codec, 0x78, coef78);
+	if (coef78 != -1)
+		alc_write_coef_idx(codec, 0x78, coef78);
 }
 
 static void alc282_shutup(struct hda_codec *codec)
@@ -333,7 +334,8 @@ static void alc282_shutup(struct hda_codec *codec)
 
 	alc_auto_setup_eapd(codec, false);
 	alc_shutup_pins(codec);
-	alc_write_coef_idx(codec, 0x78, coef78);
+	if (coef78 != -1)
+		alc_write_coef_idx(codec, 0x78, coef78);
 }
 
 static const struct coef_fw alc283_coefs[] = {
@@ -585,15 +587,19 @@ static void alc285_hp_init(struct hda_codec *codec)
 
 	alc_write_coefex_idx(codec, 0x58, 0x00, 0xf888); /* HP depop procedure start */
 	val = alc_read_coefex_idx(codec, 0x58, 0x00);
-	for (i = 0; i < 20 && val & 0x8000; i++) {
+	for (i = 0; i < 20 && val != -1 && val & 0x8000; i++) {
 		msleep(50);
 		val = alc_read_coefex_idx(codec, 0x58, 0x00);
 	} /* Wait for depop procedure finish  */
 
-	alc_write_coefex_idx(codec, 0x58, 0x00, val); /* write back the result */
-	alc_update_coef_idx(codec, 0x38, 1<<4, coef38);
-	alc_update_coef_idx(codec, 0x0d, 0x110, coef0d);
-	alc_update_coef_idx(codec, 0x36, 3<<13, coef36);
+	if (val != -1)
+		alc_write_coefex_idx(codec, 0x58, 0x00, val); /* write back the result */
+	if (coef38 != -1)
+		alc_update_coef_idx(codec, 0x38, 1<<4, coef38);
+	if (coef0d != -1)
+		alc_update_coef_idx(codec, 0x0d, 0x110, coef0d);
+	if (coef36 != -1)
+		alc_update_coef_idx(codec, 0x36, 3<<13, coef36);
 
 	msleep(50);
 	alc_update_coef_idx(codec, 0x4a, 1<<15, 0);
@@ -858,7 +864,7 @@ static void alc294_hp_init(struct hda_codec *codec)
 
 	/* Wait for depop procedure finish  */
 	val = alc_read_coefex_idx(codec, 0x58, 0x01);
-	for (i = 0; i < 20 && val & 0x0080; i++) {
+	for (i = 0; i < 20 && val != -1 && val & 0x0080; i++) {
 		msleep(50);
 		val = alc_read_coefex_idx(codec, 0x58, 0x01);
 	}
@@ -8843,6 +8849,7 @@ static int alc269_probe(struct hda_codec *codec, const struct hda_device_id *id)
 		spec->init_hook = alc256_init;
 		spec->gen.mixer_nid = 0; /* ALC256 does not have any loopback mixer path */
 		if (codec->core.vendor_id == 0x10ec0236 &&
+		    codec->bus->pci &&
 		    codec->bus->pci->vendor != PCI_VENDOR_ID_AMD)
 			spec->en_3kpull_low = false;
 		break;
-- 
2.25.1


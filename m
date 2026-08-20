Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7DD3B14B6;
	Thu, 20 Aug 2026 07:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211476; cv=none; b=sWeYRAINyXmCUu33w/8kYT8m2W6g4HNHHsc4hfYk1nZGMFKpE64BoFxei0fZoGTB0xz/ohgny5EZqT6c+aYmb8bqLhnD7dmCwKf28i5P+y76P3cbVFbeXQ8uqkQ1V7jDr5M6VuHa2nWv23c9bLFG3wj+5DRFDgF2HJY26IilN/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211476; c=relaxed/simple;
	bh=u31o5wy8nKbqO6S6N9yvC5VF4t6csWUGmEkX460EnD4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q0McNhKUj+KDn1KAYt1ych2pBSmX0gT3uQyPVhfksguotc10Nk7hLiMxqOtV/3w9P7vVANu+L6sVaM6oJUvXxe64Nw2pFwbSBklGGJt3hWUGnn1NuebRT2wGU3gNqV07wCvK6Zf0bZArbn1OI2pj9zfaBhPRY0yeHEVTELzOlxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0ad1aec69c6a11f19a56ed5b684f684d-20260820
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:fed09469-fa87-4109-a79b-57f3e876ddc5,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:52e3396b24d7d3bc6eb9f0277f7c8138,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0ad1aec69c6a11f19a56ed5b684f684d-20260820
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1372004173; Thu, 20 Aug 2026 15:37:48 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/conexant: Simplify headset plugin type handling
Date: Thu, 20 Aug 2026 15:37:44 +0800
Message-Id: <20260820073744.521680-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the CTIA and OMTP branches of cx_process_headset_plugin() write the
same value to the headset-mic pin, differing only in the debug message.
Merge the two branches into a single one, leaving the codec write
unchanged.

No functional change.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/conexant.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index c517334b56fd..8e950c796209 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -223,11 +223,9 @@ static void cx_process_headset_plugin(struct hda_codec *codec)
 		count++;
 	} while (count < 3);
 	val = snd_hda_codec_read(codec, 0x1c, 0, 0xcb0, 0x0);
-	if (val & 0x800) {
-		codec_dbg(codec, "headset plugin, type is CTIA\n");
-		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
-	} else if (val & 0x400) {
-		codec_dbg(codec, "headset plugin, type is OMTP\n");
+	if (val & 0xc00) {
+		codec_dbg(codec, "headset plugin, type is %s\n",
+			  val & 0x800 ? "CTIA" : "OMTP");
 		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
 	} else {
 		codec_dbg(codec, "headphone plugin\n");
-- 
2.25.1


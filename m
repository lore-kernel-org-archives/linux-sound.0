Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034C7285CBA;
	Tue, 25 Aug 2026 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787625546; cv=none; b=X01DLKaLZIfcj7mNvYFdykWE96eiAtVmPdie7hVKBv+t959w2wY/MlYLD+zTl3qwBS3FZ5bEAULj+inTaG7l0Tx9WDIEr2va5VzTZNAkXmdwZ0Cj8gonDlbPC7qVMxo7fZ263QlIkraQBy/zw+kag99DC5pV7aQzOhhwHH+gTqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787625546; c=relaxed/simple;
	bh=dEfPByvC9mF7RTgoTt9YSSjX4gOr+XYq8VXZHNXovLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DdG7j6WNbqYuKbC5Vpzy3FuVr/i86CA7pFI536Y1iZJuwYyEfjt8J/i1iC/7PEYDBYa2I8zkzWf37AkjUjlhk+plX7rLk7rv8KQvJQWHZrC0NWTAI2Eg+uoctCyxseDwWtMSCKyoSFyVEi+FaNa5bihsH6TYQnYgaQTcU6i+OjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1fd5f620a02e11f19a56ed5b684f684d-20260825
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ace71b58-8589-43d0-af36-3d1c2ad37cfc,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:967feefb50a0ac11231d438c43f9e447,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1fd5f620a02e11f19a56ed5b684f684d-20260825
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1622390094; Tue, 25 Aug 2026 10:38:58 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: [PATCH] ALSA: hda/conexant: Set mic pin VREF to 0x24 on headset mic plug
Date: Tue, 25 Aug 2026 10:38:55 +0800
Message-Id: <20260825023855.394959-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

For 3-pole headset microphones, the mic pin VREF must always be
configured to 0x24 regardless of the headset type, otherwise the
mic will not be able to record audio. Move the setting of the mic
pin widget control to a common path.

Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
 sound/hda/codecs/conexant.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 40da2832ba66..a18091a2866f 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -225,13 +225,12 @@ static void cx_process_headset_plugin(struct hda_codec *codec)
 	val = snd_hda_codec_read(codec, 0x1c, 0, 0xcb0, 0x0);
 	if (val & 0x800) {
 		codec_dbg(codec, "headset plugin, type is CTIA\n");
-		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
 	} else if (val & 0x400) {
 		codec_dbg(codec, "headset plugin, type is OMTP\n");
-		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
 	} else {
-		codec_dbg(codec, "headphone plugin\n");
+		codec_dbg(codec, "mic plugin\n");
 	}
+	snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
 }
 
 static void cx_update_headset_mic_vref(struct hda_codec *codec, struct hda_jack_callback *event)
-- 
2.25.1


Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2912F6931;
	Wed, 12 Aug 2026 03:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505433; cv=none; b=eurBw7kjElXn0huYG8SWM0ZUwVa+0QVuKx2VuOcCcoIv4VQNl4ei3Jml9hTZlBgN3nIc2q1ses9utuoZS9nMkfXBOSUzQxlWsBj8wn/ufl6e3tXp3w7tDQK1Bgl1kjN7L8R9Mckj3wY6tbL62B7OcwpquFtNiPRGlB3B2khytdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505433; c=relaxed/simple;
	bh=1wAliKLgoXpxrXcDT/cFxGySiZybJoA1gWhHjahafQE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KnlNwZNoY7aZ1ryupgKw/hkgNZ6WLSDRqwDvi30LB5jFnvWXVmat10DrjjCd4S66O1rhN4wDYN6zo3JkLGcU8MUy5fX4HaGhxtMno0HO1am/DdRqCkwFyD9Vdw4sBji5vN2JqGxi2oi9+NAe7Se+56rD6E8OF0/Slvzj8pRQmJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 27d8024e95fe11f1aa26b74ffac11d73-20260812
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:2d81e506-b7de-40dc-b647-5b1dfc47da47,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:1bb8a6b7aadd37918e701018a0318a5b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 27d8024e95fe11f1aa26b74ffac11d73-20260812
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1268528679; Wed, 12 Aug 2026 11:30:24 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: [PATCH 1/2] ALSA: hda/ca0132: set codec->spec to NULL after freeing
Date: Wed, 12 Aug 2026 11:30:19 +0800
Message-Id: <20260812033019.635010-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

ca0132_free() and dbpro_free() call kfree(codec->spec) without
setting codec->spec to NULL afterward, leaving a dangling pointer.
Set it to NULL.

Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
 sound/hda/codecs/ca0132.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index 3fe11983d6ca..424224ef4621 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -9634,6 +9634,7 @@ static void ca0132_free(struct hda_codec *codec)
 #endif
 	kfree(spec->spec_init_verbs);
 	kfree(codec->spec);
+	codec->spec = NULL;
 }
 
 static void dbpro_free(struct hda_codec *codec)
@@ -9644,6 +9645,7 @@ static void dbpro_free(struct hda_codec *codec)
 
 	kfree(spec->spec_init_verbs);
 	kfree(codec->spec);
+	codec->spec = NULL;
 }
 
 static void ca0132_config(struct hda_codec *codec)
-- 
2.25.1


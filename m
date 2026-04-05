Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE31274652;
	Sun,  5 Apr 2026 01:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775353340; cv=none; b=abpMzClorcnDhrF+/2jIFPdiBWxRV6s8XqkSoT9aacC0PDggBkIkqxYoIXo4uJrbm9GtIoom9Vv+Q4GjiFx8sAjZZ2XYnehIc2v81GTk0Q2d6Sr57khiSm5WtXPRUmFH7T0/puPuf2EFITTv6uI77vFdRh9XxskGCwA9FRZ3hds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775353340; c=relaxed/simple;
	bh=8qehztkW6ewYkOjOKeVExDWEqc9TTiy7qsn08YiZpq8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BmQOSlxm8w3Dgpvg8MdrQVacvlr44H9DqiN7/YkH37cPQzStfqJLMsDSTsv4I7mzs2tGCYIbJB9vdQ2SrvJdHQNrKeQIYECwFgbhEXjSYxLrzhPnhpwlLgdx4SvAWJu8sURnahBiBL28JNZKA0P4NXanSQ2DqdLbM1jjOieN8z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: aa293f98309011f1aa26b74ffac11d73-20260405
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d18051da-66f7-43c1-84f9-9cfd41b6f3c3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:c6c1c15b9d8cff2f92c4326a5f5be7b9,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aa293f98309011f1aa26b74ffac11d73-20260405
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 40707256; Sun, 05 Apr 2026 09:42:11 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: [PATCH] ALSA: hda/realtek: Fix code style error
Date: Sun,  5 Apr 2026 09:42:08 +0800
Message-Id: <20260405014208.167364-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Output of checkpatch shows error:
ERROR: else should follow close brace '}'
2168: FILE: sound/hda/codecs/realtek/realtek.c:2168:
+	}
+	else

So fix it.

Signed-off-by: songxiebing <songxiebing@kylinos.cn>
---
 sound/hda/codecs/realtek/realtek.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
index aad265c0a5b6..b240f13b0438 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -2164,8 +2164,7 @@ void alc_fixup_headset_mode_no_hp_mic(struct hda_codec *codec,
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		struct alc_spec *spec = codec->spec;
 		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
-	}
-	else
+	} else
 		alc_fixup_headset_mode(codec, fix, action);
 }
 EXPORT_SYMBOL_NS_GPL(alc_fixup_headset_mode_no_hp_mic, "SND_HDA_CODEC_REALTEK");
-- 
2.25.1


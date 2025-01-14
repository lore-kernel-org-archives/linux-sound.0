Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C027EC5;
	Tue, 14 Jan 2025 01:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736818148; cv=none; b=kIwD/ZzQ7dTdxr8iQDT5GOZbSAELWKvaRsWuSwiMuhYXwrkqw5aMxwc7r5wBgnQl3p2znovA+ZjIEtLuCGu1QR/ohJn18iB8wDOqgwqVhDEopEtVkSxVq+BvoeGzm1XFr7LZw/Xfq0xDfCveAkSh8N7yyZpGShHegOhaQRxMu5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736818148; c=relaxed/simple;
	bh=1UlJhYxr6VtX/iaReowcGCeIVIm6YAmLmKz8ACiefvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QeQWqcXAXiYwBYLR7wOHlfdfRBtqxYEFTsPv8xvm5xV8f48f1fShg8AQtqdQrQESYnwapioRdNjAxIJGVW3RhHLGN7BW6KlfJDkZ4WdZ3s9ytjgxK9LPSazUEV8ZkyjT7r2AKEia+EQYQ+khfT9ifT1LGqrAqEgdPqfikA8G/hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ee7ae8c4d21611efa216b1d71e6e1362-20250114
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:dadded99-070f-4658-94bd-c4ce72ddfc43,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:aa32a5bf060b5ed0c81bec31ab4ce20a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ee7ae8c4d21611efa216b1d71e6e1362-20250114
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1070888809; Tue, 14 Jan 2025 09:29:00 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 26CF6E00350B;
	Tue, 14 Jan 2025 09:29:00 +0800 (CST)
X-ns-mid: postfix-6785BDDB-8876254353
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id B602DE00350B;
	Tue, 14 Jan 2025 09:28:56 +0800 (CST)
From: Zhang Heng <zhangheng@kylinos.cn>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ASoC: SOF: topology: Use krealloc_array() to replace krealloc()
Date: Tue, 14 Jan 2025 09:28:53 +0800
Message-ID: <20250114012853.877331-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use krealloc_array() to replace krealloc() with multiplication.
krealloc_array() has multiply overflow check, which will be safer.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/sof/topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b3fca5fd87d6..b13b1dafa71b 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1269,8 +1269,8 @@ static int sof_widget_parse_tokens(struct snd_soc_c=
omponent *scomp, struct snd_s
 			struct snd_sof_tuple *new_tuples;
=20
 			num_tuples +=3D token_list[object_token_list[i]].count * (num_sets - =
1);
-			new_tuples =3D krealloc(swidget->tuples,
-					      sizeof(*new_tuples) * num_tuples, GFP_KERNEL);
+			new_tuples =3D krealloc_array(swidget->tuples,
+						    sizeof(*new_tuples), num_tuples, GFP_KERNEL);
 			if (!new_tuples) {
 				ret =3D -ENOMEM;
 				goto err;
--=20
2.45.2


Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466961B87C9;
	Fri, 17 Jul 2026 01:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784251492; cv=none; b=gP/xT7JtyVyFYiux4oyMGgntYxd0DendjOdyEjIOlKcemwjd8rFcXZ5mFnAA1y5lOOZuzXyBR1f8FBf/x7S5kaSrOdRxjSOolXeCjzxWkOF+xEuseHZUFLqS8+FqkmBBzReh3ow9Md+wwSeIu+qPef21PBXto6tx+IK6XGUMing=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784251492; c=relaxed/simple;
	bh=Ept7jZf9GFok1CoUECZdOLiAeyiX1CrTmKVq8KLTTUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YBbPEB+/T1yCeQ1clOtgpRgC15XQgaMbX7QyLwHntQO/ftCG4Foqdzkhg+M4MJ9zZPiVoSjC2pZAM2p5sS9OXu6quVkTxwUv6XBnpegIbKAMn7Dc3gg1aCHdoP59kZEz1jQ3mNWG+qOC2sJzR3uFEKKYtLlhG0Do3OMkYXeI1BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 482e9880817e11f1aa26b74ffac11d73-20260717
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:266998f4-54a9-4d8c-9379-97a3e12e18c4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:c7669a7dd51c54e72c32c1faefd4cd1e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|850|865|898,TC:nil,Content
	:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 482e9880817e11f1aa26b74ffac11d73-20260717
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1000324493; Fri, 17 Jul 2026 09:24:40 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH v2] ASoC: meson: Keep link pointers valid on realloc failure
Date: Fri, 17 Jul 2026 09:24:33 +0800
Message-Id: <20260717012433.1432285-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260716100939.1381759-1-lilinmao@kylinos.cn>
References: <20260716100939.1381759-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

meson_card_reallocate_links() grows the DAI link and private data
arrays with two consecutive krealloc() calls and updates the owner
pointers only after both calls have succeeded.

A successful krealloc() may move the data: it frees the old block and
returns a new one. When that happens for the link array and the second
krealloc() then fails, card->dai_link still points to the block that
krealloc() already freed, and the error path frees the new block too.
The probe error path then calls meson_card_clean_references(), which
dereferences card->dai_link and kfree()s it again, resulting in a
use-after-free and a double free.

Commit card->dai_link and card->num_links right after the first
krealloc() succeeds, so the pointer always refers to a valid allocation
that meson_card_clean_references() can walk and free. krealloc() with
__GFP_ZERO zero-initializes the added entries, so walking them on the
error path is safe. With both failure paths reduced to a plain return,
drop the goto labels and the error message.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
---
v2:
- also commit num_links together with dai_link (Jerome)
- drop the goto labels and the dev_err() (Jerome)
- comment the ldata failure path (Jerome)

 sound/soc/meson/meson-card-utils.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index cdb759b466ad..8617a4661a33 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -50,25 +50,20 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
 			 num_links * sizeof(*priv->card.dai_link),
 			 GFP_KERNEL | __GFP_ZERO);
 	if (!links)
-		goto err_links;
+		return -ENOMEM;
+
+	priv->card.dai_link = links;
+	priv->card.num_links = num_links;
 
 	ldata = krealloc(priv->link_data,
 			 num_links * sizeof(*priv->link_data),
 			 GFP_KERNEL | __GFP_ZERO);
+	/* meson_card_clean_references() will free the links on this error path */
 	if (!ldata)
-		goto err_ldata;
+		return -ENOMEM;
 
-	priv->card.dai_link = links;
 	priv->link_data = ldata;
-	priv->card.num_links = num_links;
 	return 0;
-
-err_ldata:
-	kfree(links);
-err_links:
-	dev_err(priv->card.dev, "failed to allocate links\n");
-	return -ENOMEM;
-
 }
 EXPORT_SYMBOL_GPL(meson_card_reallocate_links);
 
-- 
2.25.1


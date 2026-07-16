Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608223955EA;
	Thu, 16 Jul 2026 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196592; cv=none; b=pqYpqXk4XqVem17OLWj1DCJOEy4OZPc4uvhP3KogBQyxTq1yB+HmacTtBzs2NtJQP6D5wqAMctixAYY6mt82cIyL2PJEwsMpOqjmkMr8XpbEBb1KIDe22mE16BNqkl5Cic0aIcVNVFF+oSC3TLJTttfT8/pMaIbnK32XqrV3H6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196592; c=relaxed/simple;
	bh=Iu9Btq8Wze3EtNYr4+AEjcy9o3l63zinLcV2bfCt1Ls=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T3RNl72KbxkrSE1kRBM/COwrKugw3aehNPD40EXQrzr1qJrlKt4NcvONEZ62/sJmdcbrV5vzgXTtBK/6LSsE/CkS6kE6RYcpLJSjqxuSxmpv9Rj8HpS6SvsQ1F6+wO2DwOPMxwWgk76sHKK2UcEyz3LODStUM0L2BZqZE0z5HqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 77ac20b280fe11f1aa26b74ffac11d73-20260716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d3711d46-4afc-4338-ac37-b0cb538df76f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:cd41769162fe44a8f4903991eaa13158,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 77ac20b280fe11f1aa26b74ffac11d73-20260716
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 220007818; Thu, 16 Jul 2026 18:09:44 +0800
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
Subject: [PATCH] ASoC: meson: Keep link pointers valid on realloc failure
Date: Thu, 16 Jul 2026 18:09:39 +0800
Message-Id: <20260716100939.1381759-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

Set card->dai_link right after the first krealloc() succeeds and keep
the resized array when the second call fails, so the pointer always
refers to a valid allocation that the normal cleanup path can free.
card->num_links is still updated only on full success, which keeps the
cleanup limited to initialized links.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 sound/soc/meson/meson-card-utils.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index cdb759b466ad..38c1b2ae227f 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -52,19 +52,18 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
 	if (!links)
 		goto err_links;
 
+	priv->card.dai_link = links;
+
 	ldata = krealloc(priv->link_data,
 			 num_links * sizeof(*priv->link_data),
 			 GFP_KERNEL | __GFP_ZERO);
 	if (!ldata)
-		goto err_ldata;
+		goto err_links;
 
-	priv->card.dai_link = links;
 	priv->link_data = ldata;
 	priv->card.num_links = num_links;
 	return 0;
 
-err_ldata:
-	kfree(links);
 err_links:
 	dev_err(priv->card.dev, "failed to allocate links\n");
 	return -ENOMEM;

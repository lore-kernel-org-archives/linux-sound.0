Received: from cmccmta1.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DE11D3585;
	Fri, 25 Oct 2024 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729847404; cv=none; b=ByFFFbfRnKSWgG4C6uOXsghLIU+CVPjav0hheW8LN85BGXsRgnx3VNZQOngpYc2rZotKIJhnzH9Yh2Jw3XaLpFfk06Ah2u6Aw7BkoIhnkfDHhVEB+3Gf+7WeDrqxPsmb6Oaq7Ame/Eo5UosEZmG2MuHk9IlPv8MshlSLV8NKfs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729847404; c=relaxed/simple;
	bh=wGR3eFdBlvl9ARu2JKWmwycFcvtz9WY7vdyb45O3RT0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u+i/BoLvnHyAUL3fvLyAdY7QH0eJALn3yciYN/arGUqw2ph8QPQoTTv3SpBhvua5WfdhV7rSS1UQFDoKmmSuSL28Irt/oZo9GGfckizTir2cNXXzNPXnXUpP6mX91DF9b4lB6cQRgNOcSJaA3tJSoRzxVKhLKDaCJmj7Bc2g9aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee4671b6064529-4ce2a;
	Fri, 25 Oct 2024 17:09:56 +0800 (CST)
X-RM-TRANSID:2ee4671b6064529-4ce2a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from leadsec.example.com.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee1671b6061663-30edb;
	Fri, 25 Oct 2024 17:09:56 +0800 (CST)
X-RM-TRANSID:2ee1671b6061663-30edb
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] ASoC: mediatek: mt8183: Remove unnecessary variable assignments
Date: Fri, 25 Oct 2024 17:09:38 +0800
Message-Id: <20241025090938.3480-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the function mt8183_dai_i2s_register, the variable
'ret' is redundant, thus remove it.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 65e46ebe7..5cf559233 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -1036,7 +1036,6 @@ static int mt8183_dai_i2s_set_priv(struct mtk_base_afe *afe)
 int mt8183_dai_i2s_register(struct mtk_base_afe *afe)
 {
 	struct mtk_base_afe_dai *dai;
-	int ret;
 
 	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
 	if (!dai)
@@ -1055,9 +1054,5 @@ int mt8183_dai_i2s_register(struct mtk_base_afe *afe)
 	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_i2s_routes);
 
 	/* set all dai i2s private data */
-	ret = mt8183_dai_i2s_set_priv(afe);
-	if (ret)
-		return ret;
-
-	return 0;
+	return mt8183_dai_i2s_set_priv(afe);
 }
-- 
2.33.0




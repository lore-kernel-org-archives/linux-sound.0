Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A564;
	Thu, 30 Apr 2026 02:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777515884; cv=none; b=plmvhDRwSjHwUJyJ8y8MVT+M3pohIIUSyVoM/QQ19O/5OM8uNSqm1yTSZZvPk8YIEA5NCl/RKTy2LNJbbOjFclHq/stOPfe0vSx9io++GWuDVtLVoO9dQg61WzY0c1luYWpRY5zmLr81BZNs6xrXaeXdHKEDssKkVKQk3TsbPb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777515884; c=relaxed/simple;
	bh=rdg8N2WWiIOMfPyiUYNuSu7l6G+0ThKy6YJNvgGwfvk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GbiFUpHQm9mQnrr9JrafwGI8i/sPi5/LnsUTdWmFEqA4k539fM8zC4TWyHIyNkurl+taWXVXMyChHP55EIEN32v20qhofZQizptqNHsh27Gibm0CR5ew3g4U/HK6AR/cukqHwy3Haf8JuJdIOaorjfgqrBxq8XRiYEIcJavmpzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=MyQsMGXQ; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MyQsMGXQ"
X-UUID: b9ac2502443b11f19781c1a04af40193-20260430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wT5KayC1YhhYfVHBrtoS1Lhs8R+hRDVCsvhOb4nZ0nE=;
	b=MyQsMGXQWDgGjTxeW29w/QjiB1zNXuTTDLNgpG40IT62nbI/pkYvyNffa5KfMSRpEYm4cbl8+GpXakleOxoZrrPTqx/HJX/ho6bfK/i5NgCpTgtrUos35Czjbpjte+CWVC1XdOcEE4BGDJt1Bbzb0QLSTD8OyNu6u08iBahsufY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1e5f15b4-835b-47d4-bff9-08141cce0a8c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:dc01a8be-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b9ac2502443b11f19781c1a04af40193-20260430
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1933760688; Thu, 30 Apr 2026 10:24:33 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 30 Apr 2026 10:24:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 30 Apr 2026 10:24:31 +0800
From: Cyril Chao <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Cyril Chao <cyril.chao@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Darren Ye
	<darren.ye@mediatek.com>, Louis-Alexis Eyraud
	<louisalexis.eyraud@collabora.com>, Cyril Chao <Cyril.Chao@mediatek.com>
Subject: [PATCH v9 01/10] ASoC: mediatek: common: modify mtk afe platform driver for mt8196
Date: Thu, 30 Apr 2026 10:23:14 +0800
Message-ID: <20260430022417.32282-2-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260430022417.32282-1-Cyril.Chao@mediatek.com>
References: <20260430022417.32282-1-Cyril.Chao@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Darren Ye <darren.ye@mediatek.com>

Mofify the pcm pointer interface to support 64-bit address access.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Signed-off-by: Cyril Chao <Cyril.Chao@mediatek.com>
---
 .../mediatek/common/mtk-afe-platform-driver.c | 56 +++++++++++++------
 .../mediatek/common/mtk-afe-platform-driver.h |  2 +
 2 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index f2b39fc9ec81..477284e12396 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -87,29 +87,49 @@ snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
 	const struct mtk_base_memif_data *memif_data = memif->data;
 	struct regmap *regmap = afe->regmap;
 	struct device *dev = afe->dev;
-	int reg_ofs_base = memif_data->reg_ofs_base;
-	int reg_ofs_cur = memif_data->reg_ofs_cur;
-	unsigned int hw_ptr = 0, hw_base = 0;
-	int ret, pcm_ptr_bytes;
-
-	ret = regmap_read(regmap, reg_ofs_cur, &hw_ptr);
-	if (ret || hw_ptr == 0) {
-		dev_err(dev, "%s hw_ptr err\n", __func__);
-		pcm_ptr_bytes = 0;
-		goto POINTER_RETURN_FRAMES;
+	unsigned int hw_ptr_lower32 = 0, hw_ptr_upper32 = 0;
+	unsigned int hw_base_lower32 = 0, hw_base_upper32 = 0;
+	unsigned long long hw_ptr = 0, hw_base = 0;
+	int ret;
+	unsigned long long pcm_ptr_bytes = 0;
+
+	ret = regmap_read(regmap, memif_data->reg_ofs_cur, &hw_ptr_lower32);
+	if (ret) {
+		dev_err(dev, "%s hw_ptr_lower32 err\n", __func__);
+		return 0;
 	}
 
-	ret = regmap_read(regmap, reg_ofs_base, &hw_base);
-	if (ret || hw_base == 0) {
-		dev_err(dev, "%s hw_ptr err\n", __func__);
-		pcm_ptr_bytes = 0;
-		goto POINTER_RETURN_FRAMES;
+	if (memif_data->reg_ofs_cur_msb) {
+		ret = regmap_read(regmap, memif_data->reg_ofs_cur_msb, &hw_ptr_upper32);
+		if (ret) {
+			dev_err(dev, "%s hw_ptr_upper32 err\n", __func__);
+			return 0;
+		}
 	}
 
-	pcm_ptr_bytes = hw_ptr - hw_base;
+	ret = regmap_read(regmap, memif_data->reg_ofs_base, &hw_base_lower32);
+	if (ret) {
+		dev_err(dev, "%s hw_base_lower32 err\n", __func__);
+		return 0;
+	}
+	if (memif_data->reg_ofs_base_msb) {
+		ret = regmap_read(regmap, memif_data->reg_ofs_base_msb, &hw_base_upper32);
+		if (ret) {
+			dev_err(dev, "%s hw_base_upper32 err\n", __func__);
+			return 0;
+		}
+	}
+
+	hw_ptr = ((unsigned long long)hw_ptr_upper32 << 32) | hw_ptr_lower32;
+	hw_base = ((unsigned long long)hw_base_upper32 << 32) | hw_base_lower32;
+
+	if (!hw_ptr || !hw_base) {
+		dev_err(dev, "hw_ptr or hw_base = 0 err\n");
+		return 0;
+	}
 
-POINTER_RETURN_FRAMES:
-	return bytes_to_frames(substream->runtime, pcm_ptr_bytes);
+	pcm_ptr_bytes = MTK_ALIGN_16BYTES(hw_ptr - hw_base);
+	return bytes_to_frames(substream->runtime, (ssize_t)pcm_ptr_bytes);
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_pointer);
 
diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
index fcc923b88f12..71070b26f8f8 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
@@ -12,6 +12,8 @@
 #define AFE_PCM_NAME "mtk-afe-pcm"
 extern const struct snd_soc_component_driver mtk_afe_pcm_platform;
 
+#define MTK_ALIGN_16BYTES(x) ((x) & GENMASK_ULL(39, 4))
+
 struct mtk_base_afe;
 struct snd_pcm;
 struct snd_soc_component;
-- 
2.45.2


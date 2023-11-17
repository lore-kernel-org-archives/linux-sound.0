Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C9EC072A2
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 16:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjKQQKA (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 11:10:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbjKQQJ7 (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 11:09:59 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF2690;
        Fri, 17 Nov 2023 08:09:52 -0800 (PST)
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ehristev)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A8F966607391;
        Fri, 17 Nov 2023 16:09:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1700237391;
        bh=Ycelbx5JSmV5iz5PlGjQ6zsV56RiWxLVmAdDb6E+JqA=;
        h=From:To:Cc:Subject:Date:From;
        b=noF239htLY3Rc7NKTiCfgwk8Q2Qg/BvlDLF9eysEFV/nMDq3Y1aexudlP9w6a2xZK
         XUCzH0hyhixMR3AUMfDWVCMLwDKMlCTTkj3QJ52/0gasDX+ZXAr3U8WaHhNuQF1HqS
         e6OC9411fbUzvBRdXys7VPqcxXv9kPD76JsPDNjZbq7qT7n0Sl+/oK5ZrRROjov1oG
         coJrDZGHTD6tJIz4Wy26Hab73UQfyo84Rjt3BuT5wWSAfjtu9rYSlVrwrZS6Cm6FRS
         3Ie2UO+6cF3cuvWwEGNDj2UyyCiTGOV5E5dK/eTTqijOHHKOpt3RB1aynwAWroPsIL
         qmbPx989f6u6g==
From:   Eugen Hristev <eugen.hristev@collabora.com>
To:     linux-sound@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        angelogioacchino.delregno@collabora.com, kernel@collabora.com,
        Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH] ASoC: mediatek: mt8186: trivial: align code
Date:   Fri, 17 Nov 2023 18:09:14 +0200
Message-Id: <20231117160914.65341-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

No functionality change, squash some lines and align parameters for
function prototypes to 80 chars.

Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-control.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-control.c b/sound/soc/mediatek/mt8186/mt8186-afe-control.c
index 55edf6374578..dda648c1e8f8 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-control.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-control.c
@@ -181,7 +181,8 @@ static unsigned int pcm_rate_transform(struct device *dev, unsigned int rate)
 	return MTK_AFE_PCM_RATE_48K;
 }
 
-unsigned int mt8186_tdm_relatch_rate_transform(struct device *dev, unsigned int rate)
+unsigned int mt8186_tdm_relatch_rate_transform(struct device *dev,
+					       unsigned int rate)
 {
 	switch (rate) {
 	case 8000:
@@ -222,7 +223,8 @@ unsigned int mt8186_tdm_relatch_rate_transform(struct device *dev, unsigned int
 	return MTK_AFE_TDM_RELATCH_RATE_48K;
 }
 
-unsigned int mt8186_rate_transform(struct device *dev, unsigned int rate, int aud_blk)
+unsigned int mt8186_rate_transform(struct device *dev, unsigned int rate,
+				   int aud_blk)
 {
 	switch (aud_blk) {
 	case MT8186_DAI_PCM:
@@ -234,14 +236,13 @@ unsigned int mt8186_rate_transform(struct device *dev, unsigned int rate, int au
 	}
 }
 
-int mt8186_dai_set_priv(struct mtk_base_afe *afe, int id, int priv_size, const void *priv_data)
+int mt8186_dai_set_priv(struct mtk_base_afe *afe, int id, int priv_size,
+			const void *priv_data)
 {
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	void *temp_data;
 
-	temp_data = devm_kzalloc(afe->dev,
-				 priv_size,
-				 GFP_KERNEL);
+	temp_data = devm_kzalloc(afe->dev, priv_size, GFP_KERNEL);
 	if (!temp_data)
 		return -ENOMEM;
 
-- 
2.34.1


Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1326639022B;
	Wed, 15 Apr 2026 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776266639; cv=none; b=EdLWdq+T5Fv919xsEkXJPK21wvqH7zb0xl4NUR/kEzCaWYzmclChXbR8hMSbd3wjO4/YRi8Sf113MCCy4BZipgtxpxgcVcrWRzYC68SnAhEKrGLnlxaHvSnaYLhCx8/P+MDyTJW+h0NlLtVyqD++t2UdzdthlrGEmunjIRdi/n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776266639; c=relaxed/simple;
	bh=P3nV+zKFPumLd4imgT34FmQ6mLcM/VZMMhTfrEgx37c=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDMgKWke8qQYGWMr3tRD1HF+K++iajTtglCrQktTg63KqIwr5iSG7ajRkorFRcil4Bp+UEfX8nJ7RHAJdNJAP2s87QCrhRzDV9InZrdTqKNFQOBahXrWvJGAB4WNDPO75eFEu+jZ28helpiMfyrW9DOPzI1/qLE5V7P6zFZXdFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wD25o-000000002f8-11Fl;
	Wed, 15 Apr 2026 15:23:52 +0000
Date: Wed, 15 Apr 2026 16:23:49 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 4/9] ASoC: mediatek: mt2701: add optional HDMI audio path
 clocks
Message-ID: <4b703c4954996a21d8881b018516dbd5c402cef1.1776265610.git.daniel@makrotopia.org>
References: <cover.1776265610.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776265610.git.daniel@makrotopia.org>

The HDMI audio output path on MT2701/MT7623N is rooted in HADDS2PLL
and gated by the audio_hdmi, audio_spdf and audio_apll power gates.
Acquire these four clocks from device tree using devm_clk_get_optional
so that existing platforms which do not wire up HDMI audio keep
probing unchanged. Actual clock enable/prepare is deferred to the
upcoming HDMI DAI startup path.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../mediatek/mt2701/mt2701-afe-clock-ctrl.c   | 22 +++++++++++++++++++
 sound/soc/mediatek/mt2701/mt2701-afe-common.h |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
index ae620890bb3ac..5a2bcf027b4fb 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
@@ -95,6 +95,28 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 		afe_priv->mrgif_ck = NULL;
 	}
 
+	/*
+	 * Optional HDMI audio clocks. Platforms that do not wire up the
+	 * HDMI output (e.g. MT2701 devkits using only the I2S BE DAIs)
+	 * may omit these; in that case the HDMI BE DAI simply cannot be
+	 * enabled, but the rest of the AFE still probes.
+	 */
+	afe_priv->hadds2pll_ck = devm_clk_get_optional(afe->dev, "hadds2pll_294m");
+	if (IS_ERR(afe_priv->hadds2pll_ck))
+		return PTR_ERR(afe_priv->hadds2pll_ck);
+
+	afe_priv->audio_hdmi_ck = devm_clk_get_optional(afe->dev, "audio_hdmi_pd");
+	if (IS_ERR(afe_priv->audio_hdmi_ck))
+		return PTR_ERR(afe_priv->audio_hdmi_ck);
+
+	afe_priv->audio_spdf_ck = devm_clk_get_optional(afe->dev, "audio_spdf_pd");
+	if (IS_ERR(afe_priv->audio_spdf_ck))
+		return PTR_ERR(afe_priv->audio_spdf_ck);
+
+	afe_priv->audio_apll_ck = devm_clk_get_optional(afe->dev, "audio_apll_pd");
+	if (IS_ERR(afe_priv->audio_apll_ck))
+		return PTR_ERR(afe_priv->audio_apll_ck);
+
 	return 0;
 }
 
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-common.h b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
index 32bef5e2a56d9..7b15283d6351e 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-common.h
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
@@ -90,6 +90,10 @@ struct mt2701_afe_private {
 	struct mt2701_i2s_path *i2s_path;
 	struct clk *base_ck[MT2701_BASE_CLK_NUM];
 	struct clk *mrgif_ck;
+	struct clk *hadds2pll_ck;
+	struct clk *audio_hdmi_ck;
+	struct clk *audio_spdf_ck;
+	struct clk *audio_apll_ck;
 	bool mrg_enable[MTK_STREAM_NUM];
 
 	const struct mt2701_soc_variants *soc;
-- 
2.53.0

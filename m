Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA7721254B;
	Mon, 20 Apr 2026 01:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776647610; cv=none; b=rA+1vmZB7HO8O+BdoPt3qegEJJT4h+pniSbxxkNI+26lEUY2R7IPN0//lMKcZnQPa8g+h6BFebR9Al2Lq2i/3Lgca31rtZ7ZusKhz9PEBnXaTQBJ4bioeXvYAbcIYziUug62u3auX9g+9xYJiusu/EyXLBh4NusDqVvwZsliFUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776647610; c=relaxed/simple;
	bh=dBtgMeu18WT3V9vzV3s26LG2W1NP0pYN/GEkTTztyzc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ach4/Icj8aUBC7yj5Hn7aUpIlD1DR5rvwmj7Smjt3roFIVmeSus800K5LfK0uS7QtYUikft9mjgjo5oKcINYY3741fy5/7JOUzDtSyp3REHkZH/86KbV3DsU0Hb+Aa42HGgCfrjNR7B+asUvgC3hBb+1Ddg7Qqqa0RPSDh38Wo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEdCV-000000002Wz-1w23;
	Mon, 20 Apr 2026 01:13:23 +0000
Date: Mon, 20 Apr 2026 02:13:20 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/9] ASoC: mediatek: mt2701: add AFE HDMI register
 definitions
Message-ID: <29ec5ab993ddb0cd20dbf79f8244611e32baa88b.1776646435.git.daniel@makrotopia.org>
References: <cover.1776646435.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776646435.git.daniel@makrotopia.org>

Add register offsets and bit defines for the MT2701/MT7623N AFE
HDMI audio output path: the HDMI BCK divider in AUDIO_TOP_CON3,
the HDMI output memif control and descriptor registers, the 8-bit
AFE_HDMI_CONN0 interconnect, and the AFE_8CH_I2S_OUT_CON engine
that drives the HDMI TX serial link. These are a prerequisite for
adding an HDMI playback path to the mt2701 AFE driver and have no
behavioural effect on their own.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: no changes

 sound/soc/mediatek/mt2701/mt2701-reg.h | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/mediatek/mt2701/mt2701-reg.h b/sound/soc/mediatek/mt2701/mt2701-reg.h
index c84d14cdd7ae8..b7a25bfb58662 100644
--- a/sound/soc/mediatek/mt2701/mt2701-reg.h
+++ b/sound/soc/mediatek/mt2701/mt2701-reg.h
@@ -10,10 +10,17 @@
 #define _MT2701_REG_H_
 
 #define AUDIO_TOP_CON0 0x0000
+#define AUDIO_TOP_CON3 0x000c
 #define AUDIO_TOP_CON4 0x0010
 #define AUDIO_TOP_CON5 0x0014
 #define AFE_DAIBT_CON0 0x001c
 #define AFE_MRGIF_CON 0x003c
+#define AFE_HDMI_OUT_CON0 0x0370
+#define AFE_HDMI_OUT_BASE 0x0374
+#define AFE_HDMI_OUT_CUR  0x0378
+#define AFE_HDMI_OUT_END  0x037c
+#define AFE_HDMI_CONN0    0x0390
+#define AFE_8CH_I2S_OUT_CON 0x0394
 #define ASMI_TIMING_CON1 0x0100
 #define ASMO_TIMING_CON1 0x0104
 #define PWR1_ASM_CON1 0x0108
@@ -125,6 +132,34 @@
 #define AFE_MEMIF_PBUF_SIZE_DLM_BYTE_MASK	(0x3 << 12)
 #define AFE_MEMIF_PBUF_SIZE_DLM_32BYTES		(0x1 << 12)
 
+/* AUDIO_TOP_CON0 (0x0000) -- HDMI audio clock gating */
+#define AUDIO_TOP_CON0_PDN_HDMI_CK		(0x1 << 20)
+#define AUDIO_TOP_CON0_PDN_SPDIF_CK		(0x1 << 21)
+#define AUDIO_TOP_CON0_PDN_SPDIF2_CK		(0x1 << 22)
+#define AUDIO_TOP_CON0_PDN_APLL_CK		(0x1 << 23)
+
+/* AUDIO_TOP_CON3 (0x000c) -- HDMI BCK divider */
+#define AUDIO_TOP_CON3_HDMI_BCK_DIV_MASK	(0x3f << 8)
+#define AUDIO_TOP_CON3_HDMI_BCK_DIV(x)		(((x) & 0x3f) << 8)
+
+/* AFE_HDMI_OUT_CON0 (0x0370) */
+#define AFE_HDMI_OUT_CON0_OUT_ON		(0x1 << 0)
+#define AFE_HDMI_OUT_CON0_BIT_WIDTH_MASK	(0x1 << 1)
+#define AFE_HDMI_OUT_CON0_BIT_WIDTH_16		(0x0 << 1)
+#define AFE_HDMI_OUT_CON0_BIT_WIDTH_32		(0x1 << 1)
+#define AFE_HDMI_OUT_CON0_CH_NUM_MASK		(0xf << 4)
+#define AFE_HDMI_OUT_CON0_CH_NUM(x)		(((x) & 0xf) << 4)
+
+/* AFE_8CH_I2S_OUT_CON (0x0394) -- on-SoC 8-channel I2S that feeds HDMI TX */
+#define AFE_8CH_I2S_OUT_CON_EN			(0x1 << 0)
+#define AFE_8CH_I2S_OUT_CON_BCK_INV		(0x1 << 1)
+#define AFE_8CH_I2S_OUT_CON_LRCK_INV		(0x1 << 2)
+#define AFE_8CH_I2S_OUT_CON_I2S_DELAY		(0x1 << 3)
+#define AFE_8CH_I2S_OUT_CON_WLEN_MASK		(0x3 << 4)
+#define AFE_8CH_I2S_OUT_CON_WLEN_16BIT		(0x1 << 4)
+#define AFE_8CH_I2S_OUT_CON_WLEN_24BIT		(0x2 << 4)
+#define AFE_8CH_I2S_OUT_CON_WLEN_32BIT		(0x3 << 4)
+
 /* I2S in/out register bit control */
 #define ASYS_I2S_CON_FS			(0x1f << 8)
 #define ASYS_I2S_CON_FS_SET(x)		((x) << 8)
-- 
2.53.0

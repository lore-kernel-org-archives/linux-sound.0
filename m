Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADA1489FA2
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456053; cv=none; b=rPr637Bm4NKqvQmKPRJEcZpGs1B16l9JBE9klU8OzRrzASNn0Yl3RVgeuOUuJYmGy5NR4iQZgupakrQi3d22/S4yjjsf19bf+eN+I7pBOszSR4Q5n4ROEePSkX7nb5vJlST8x2jCt6/95iP0L03VVT7j7nF2SdUfRrFCuuFlr7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456053; c=relaxed/simple;
	bh=sAh2gdTD9duOj8WLvoGxiHxj5o2kOrdYeBV4NBuiVSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bo3bFv7YX+HJZ+vFF9mlBmZS2ZOu86XwkJviT5OI9pwomEhetJB1F5rvMALdmaE9SFQEAuPUOZ73BLg43UW4u5jM73FFyQaf6qSkgYOKntGVAe1TCkIcbxOfopro3KbjUZN0d2306pLuUWGdXwJvg/9GER52Ju8aH0LJG+OM3w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5Cfxy5m; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5Cfxy5m"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35120d43ecaso7720254eec.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456051; x=1792060851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3hFCOdGFcpARJPE61Pz7wx4lXLyiEMweFG5G2TuDs0=;
        b=O5Cfxy5mIDM8VmdPakK61HLiUvgqI+Gp3+lLOxj/cd0sCfTrDvMpdFI6ogQxuIq8XH
         Vdi3eEgcyRUK+LH4FbR1IdwdpmNtKK5yU6yldJyOFUe1PTHmanBZmOmWOjVUWUonCnNO
         gQTfYYn2l34y8ZVivQxY6QYgGM6sbAQ9dr4wIhXp6IibsLRzTWkA40LMaEce11NBsaN6
         /KZbcr0ioMroT4PD44mIezUxdy9oxMYi8cYWxvDAYsqQIPI/GG0S1WYoN9dh+11FiGoC
         ltyhheaKCTnp0bXTj8G9st6NLuVZnEYudEpINBFw+NnoEYaSe/eGs1i2CirtozcW1Hll
         5Tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456051; x=1792060851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3hFCOdGFcpARJPE61Pz7wx4lXLyiEMweFG5G2TuDs0=;
        b=l7lAZuJkxaqfrL0DxFA1EAhp6upFZ7UUJf7y8lZ5fashse2ujlMVCquHmpcHre1LXG
         oK6vSIRz0q0wtUlfvDfmfkdF1NhmjUNI2cT9NDWnGMFQjRCoitDn+2NNJBwi0NOIpKdS
         r/2mrdZHFScNEh7gN0XD75ao6+WMShn+AoVaAlx4rIHpBjKZ8NCyphpkU9jLdWOfRAI+
         eOO9P60vnRYW7PRGAPtjLj4+MFPUkl7XAL15mD90hZk3a4yU4fl8CFqQ/tdzBl+7oh6v
         L3GlLVjY82r4GIKEY9vB5w8Jf/1nlXnxb5EM+942uMBh26S8ZGhbPUjItssZqZhWknxU
         moLA==
X-Forwarded-Encrypted: i=1; AKwUvBwg7qDrf8y9E1LKIgQIalHUtSwh+GNrUkiVs99U4uIjPT6WupNOnE4fKELTzg5iuvOgAfyuQzZYwLLHeA==@vger.kernel.org
X-Gm-Message-State: AFuF++lOPEu8oFtLHURhWq9AIgEek+go9mTaq+c4y3+XEzeJP8OJq6rP
	iko7d2AEaHz+2gPjMo0PZb2Wi9B9f4QnY74myqhh5NxnjkOxB6q0nTFd
X-Gm-Gg: AYBFou3ND25K6Y1KlFsgakceqmBfYJq1sYjxN/TH7bG/CypEwE4rnOVYPtooVfQEsUX
	Q3ogzZb2qpJ8VbAZhE+QQLbYSbyyWYsWY20IImVrHUvCxQw8Z3bsNYKJcONvPy+VEDBMNnQm7tj
	tFqQYyBCZD/Okpza7mz6dA9Lw/cXkDAXKt1NvDsKHBuGrQ8yDDLb601SDH5eibscSapUwCNMhOh
	p0FENc9OJyJRaPhDcJkGotQHwUO5dQMV5dfjOswYTs8WdkDlmsfLSwFGldowBlIcMWZQfYohLGw
	ms/o43VYw4NGDS3WAXHJ00Qa3r/vT2QzEzhP2qv9dEl5eGckGvUVPhTsX391t53nskNodLKtnPa
	V4CnHo6jRQlZGn5wt2/1ZfXoMdl0pXdfT0E3DMEiyG6tV6VoEc7lFysKH4Z7CSb3oa9SIKN5n69
	5TpSrUMs8x7X+AxI0Y0JlG2mePnEzcDgWG6U5l/djLDV3ZLeImPonET3zqjDjP1AvSVfodxqAZw
	k368+C7iawAZBozWqREBU+JXnqww5+c9y4fR3zYou4aQYL5EWN+lR/UCj93Jv1++1nBGTHAK6oC
	ROk2v6rk7rJ4SdBvg2NYyEkx
X-Received: by 2002:a05:693c:41d2:10b0:351:62fe:62 with SMTP id 5a478bee46e88-35162fe0200mr5293677eec.19.1791456050997;
        Thu, 08 Oct 2026 03:40:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/24] ASoC: amd: yc: Fix acp6x_pdm_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:14 +0700
Message-ID: <20261008103831.542533-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp6x_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: ceb4fcc13ae5 ("ASoC: amd: add acp6x pdm driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/yc/acp6x-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 40c4d833f4ed..afa9f66533e3 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -209,7 +209,7 @@ static int acp6x_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp6x_base = adata->acp6x_base;
 	runtime->private_data = pdm_data;
-	return ret;
+	return 0;
 }
 
 static int acp6x_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0


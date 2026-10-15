Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3803E30BBB1
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028692; cv=none; b=Y6DDq2ZSnhCLvPhCMtg3EJsEj/VWRistVKLaaI7b1VMLgg7CqJA9+bRBrm+BFegJMxzGbL4xcN0sBxx5M9fhyiaw3/JhQGQoqEdn0ktvajF7WV9zStMfOrATUwE1/T8pezQf5ekt5wjVmdDefnBHQUpUaSiVeXWbKa7Swi8dIcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028692; c=relaxed/simple;
	bh=Km52EVNDvQaSKwDMYVVG/cG2sOqJGio6RIBlU/DT6nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTQkLBsbDP4mPV19jRmWcfV2jdZJKo2QXb1VgBdzpMQs11MDSu5YC9V8iTedfVwOtWdXV/GCtJIlpOXwEk2azP98WQZ0WcfeP9jOJSGP224Cqwmgum6lfmkfmOWwfd3HROWAgrMfnzFIGR+YTVhCmPl/lzkQLsdqwdDaFlqSgvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPEPY8oh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPEPY8oh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so25005955ad.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 18:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028690; x=1792633490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmTMAPFx5up6qhPC8f6eIWZ+fqRc0pF4DtGB7TtfWew=;
        b=EPEPY8ohDKviNzy7dfhjRCQ0o9Hot1Yw2Uf28WHydz54n4T2A5IpXM6X9KTK6569KA
         nfn432Ggo5eHnR3vWSzfg5sZuRRJ650YXWWQCnMI/XDSfGGOBUVd7tz2rl/4fNiGqcui
         y4nn+VXGwO2tSMxxdB97TAq1s2j+lgzs4JwpKM59MfKMf566+NHqf+R9I78n+Q4pTIf+
         4Li30fTygfPbCrD7GggYkgN9nuOE80FDFyNXcHd9C03yhZXT0Gv+/DVhwklNqprxLTgL
         bUJu9eMjwjzwI8gJWRx7MAM63jYn0HHHoSZRNCH/+aLt7e5BfMtw7VOyxSgKaSzKTaoW
         EdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028690; x=1792633490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmTMAPFx5up6qhPC8f6eIWZ+fqRc0pF4DtGB7TtfWew=;
        b=Y3U57rbcrFu1WwBAwr+i+nuU6niT1YYzwa3+/u+g/GmI4hiG3lBo76tl7tRKIjxoKQ
         BGb1fyZC19qseADSiYDyajIOMIfcZ/tKjOCf/TXBhsOwk9z0Zvr63pzAR2LjVY6dQHFJ
         rz4A1R5Km9KTGYGbmqqZYdnJBn0ktliwd6ezjLqfy6T4j40SxxaYcXsAEjd7jJFUcASa
         Ub33YvTZb9lpZmjrHzoy8CdU9QwBbCX9vFE9WlcXNfouaiiHnZdy0JPGB08r3BZhUQ5F
         i5P4QDccx6psGqH0b1uWL+UWb9foqCbIWKPQIqEymhvkGGpWV1FhT/vZ1T951EaOjfBc
         lfhg==
X-Forwarded-Encrypted: i=1; AKwUvBzo29S5+YLCzHTUHa71YxMTI1kQCHszG/zS1PS9YFQ/y3s2ahqsOCjLXkBRdv3RtWWdECKgr/9ZLMHibg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLeLcC+2K/QFA7msgafZzpw9jpGo30WpuqIOUBt8iOq/P70evv/
	syRFEQx1yr54cBsW1qJqqxMUPlnGbnbxmhUrqht9yBJz7YkNHlpKesQu
X-Gm-Gg: AYBFou1Ygd+hD9Ovli72M3JatrHoK6ja/8n7Apyrs4ottMomHXmUB2pOu7gjvXUKD3n
	5v7xYljDIlaEz+CxjwzAcZt9TfcfJR1bjhpNL6M7pfIcNfHz3my+RMw3Uwd9XS8FVwLcLTdzvKE
	R0pEA36rBXotuvdLm4ASRJGQZIB+W7NKk+9XGS8nX52QqajTOJigJxd3iwPvhr7++F3epa8ok/y
	fJtizHQ5NGbnxPhN8WYY+VUAuq9htJLh9oHDyUFhZkr50F091zlslU0Ze4w3hdfITYUrIXhT4tT
	UCTZJkiwKcxUXDwRB/w4C0c9wcP8Q1dFYgtItMLKT0xf5FUvrRB2NJ4sfLHqFNYlf7MQps0+znk
	+4zbxALpyi8Kf5QHra6R+v/bW6xCdMPDcXb5UGoPF2OdVE8BNmiOMWWsN+0GQi19+SVIwN2XesE
	vsXtM/ZWxWjJR/z5kAqDFHYnXGfkzY0vELC7DlHvxPgADPGawmV/qyurWBVetmOUfaCgeFAkLek
	uQbVGihXTnrhFdWTGSYIwpxT2jgHyeW+qvEF1XTgnADpmpvhqApjbE+Cm5bOSzZdiUSUcDcMsC2
	Urwb339ZovYFlg==
X-Received: by 2002:a17:903:3295:b0:2e8:dd9c:99e0 with SMTP id d9443c01a7336-2e8dd9ca60cmr47644535ad.40.1792028690053;
        Wed, 14 Oct 2026 18:44:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:44:49 -0700 (PDT)
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
Subject: [PATCH v2 02/25] ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:01 +0700
Message-ID: <20261015014324.5569-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp63_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 5137305662ef ("ASoC: amd: add acp6.2 pdm driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-pdm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 04c014349347..12c341e89bce 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -211,7 +211,13 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp63_base = adata->acp63_base;
 	runtime->private_data = pdm_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp63_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0


Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438C12C031E
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028748; cv=none; b=UlnW563XyUbAMfXUXR5hp0sOORQ6g/W9a/UXp2QEl1HIdF28ESyU+U8bbzkaZn/ET6knX49WSguyFzTZVN58k+Lm5+Y910/Ji8RBtyejqft9eQLSM9tALLo7dQuSnZugkXv6zqqmNqIOKJjmkuDWz04beVpCAHHt3YgV7bVWKW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028748; c=relaxed/simple;
	bh=Qod46+lJKzs2otcbuUwfMMYT23zkjG47R07TZKGmCbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sEsj5ffai9dkDpr7tihqV6egJeN6BfUPxeb9YyDLJmwKrIdiPhFFXThkXEhgzfSdojrXihs1WaxgGQGJDhDfcp9eHnn1kf9SyozLx3m/N0Z6rAQVa7wzG59XSssOy4i28d381Yo/2ii/Z0kt8wzCyLE7MCxOFdmeXjrL9t4mlag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9Y2tnK/; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9Y2tnK/"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2615698a12.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 18:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028746; x=1792633546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/n4smlFZhMXZJQElrsN5vEKX5hOiO4PseO+WVYrBqMc=;
        b=K9Y2tnK/pazHhyMYi6OmZxiUeduI0isMxu/n9o7AAjEbrFPvNe9pT9L0OXhzrJGHXT
         QEGA7D+ZD9d7Yx6ruBFLOj3JaRXbHnSPpsz3HRqMvT7YnYsgzzU53muoG9VV5uQVopEQ
         KtY4kKwm9sAvuVq4uX1qOrfBW8/lex2RbhUm2LOsJnzqbgmCXw39AkSNPLT9paxXn6Aj
         OXdmlui6S5tge8L93i2JiCnHFlbhQV6qJUPqq0Daj5zg3dW+XA6YCIhB5uVMhBU/MrjS
         1BaAD0g+toNflyvuaUQLW/XGZqY2uymabDaILmEQW0FOURWTe0VUhHMakOnHOt/Oi/ua
         V74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028746; x=1792633546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/n4smlFZhMXZJQElrsN5vEKX5hOiO4PseO+WVYrBqMc=;
        b=ViiO3GaGv9ywmxye7tR/G3EZlB2O1puD+9C9kRGFFkwTyaqzIat6781eftVcJ0Rph5
         OyijvKR8DxJ8+r7PX/1HS/1sf8qvo9DW8zp0tKGTVzL30y1XzUepxFBWmbjht6y9mw4B
         9d0VvoRJDtieTeaO262qrEl/hsz8lUbbF7W0h76q14l3tmoIyfyxKQBJv7BJG+OxxfVm
         FYOINH07nyq78vcEiovS1ssdWT6oqNlAqL6lK35hAuJnjaQA+Bd/4fBbLA4l8wJk/YY0
         x5g4UpNEx18i+V1EZhVgn+Ahva9ZIwCVbjOpdWu9naXN4+qmnA8menkcdrVH7rMbaeHJ
         Avdw==
X-Forwarded-Encrypted: i=1; AKwUvBzJAFy1esPEki4L7yPuHCRa6mOubUi/Tjci7oF/iUONS83WZlyikdkTiA+iB4s2PGSZKRN08CFZwWS1fQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKaKaNZpyr6B4aPf1A3ZHVMhdcdCIBSry5E5j13+G9w8gcDGsoF
	rn5F5ViYX3Ko1z+0ePdQnzH2uhyWNVBKE9RReEV6brBRswnWm4Hsyqc8
X-Gm-Gg: AYBFou0b/e3L86jkaezCdcPZ1TZO6i47pBcBHu8s0bHZqdrUvIVrZmiT6DZ5dU0DMR9
	3lz9DKM7bweQN0Uu06VyHXVciastGb/3HO+2icF57Lkr4yoYIEng41gZTEEF+hg//mBGTcmwKQE
	tYp2yxK3/ACvBwHTaLgCnEmw4kkecVqao2F51rOgdsWvRvKwgDeAARn03HbzEoUUJeIBj7Zn8Lo
	LGQKCkcIauMoqUzO7F2voDZ3V1haVZt2t/nejMifUNtM+qoe1QJa3N+2c4jrRKF7/HG2572brDk
	eNoPs7LsBY4cOrg/nvBT+dtL7iS0C3a81Nn/Ocz2rruh6Bzh7HMxJzvCn+v+YdlOvSniSiuO7RP
	+hcjtmFJT37z9ZTujCWrGbi2q6JV3YKutbIRdFfWVXWRWXinD/s75swm1Yn538Qye07BEJtGqYc
	Y8PdLQkfmniFaiw7Fgy+8OKd/CAC7mJyprOAB06K4KFlDJrb2elEIKMyRv4Ai4m25ZgFCwr0gi7
	kPs21tEeN3pzNOAJxKY6/bjDx29gnhw4jS+LwAuS21XWqkdrqFBsYM15Io7Nyua6RnaZndcdiQt
	MH/9UtejqxAfqw==
X-Received: by 2002:a17:903:1b70:b0:2e6:e9a:eb48 with SMTP id d9443c01a7336-2e842f2d257mr110492185ad.41.1792028745495;
        Wed, 14 Oct 2026 18:45:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:45 -0700 (PDT)
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
Subject: [PATCH v2 06/25] ASoC: amd: vangogh: Fix acp5x_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:05 +0700
Message-ID: <20261015014324.5569-7-phucduc.bui@gmail.com>
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
from acp5x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: cab396d8b22c ("ASoC: amd: add ACP5x pcm dma driver ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 831e30e9b042..72050fa2de80 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -231,7 +231,13 @@ static int acp5x_dma_open(struct snd_soc_component *component,
 	}
 	i2s_data->acp5x_base = adata->acp5x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp5x_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0


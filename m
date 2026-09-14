Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B683E6DF4
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370966; cv=none; b=lisddAdLlh0DB/SEL+qsbJY3vpIrLVydMmTnSEuIcIXZzD3L7CFOi+3cBq4zTfIf20o6bQ5bOg/pWJwfyzmLn/Y8kexENXIpn/mr9bT4/ff6276tO8+RcLFoEkPXjWQ7Yrd30ohqguaI8YZrS+ZCnRGoYhqLJtRCDeY/A/ubdNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370966; c=relaxed/simple;
	bh=9pAmcknMocG7ZfJT4xEzcIhxbh9fPeGRfGyQnurOpFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpNJThCdI8lRkTA3x3yudTxDVsaE+EPMIWJLwkhG6WrJzQDMJIv46Gvf6+kDaNNrRiwcGNXp0scXyhPWjgN9tEeiT/i9UanGbA/qh54Nfs3NeT8s4ijgpw2JX0yg2GPwXJmeeMSLrLr2EVK6zwpyhaOxqEw1Q3WeThs/wA/qH3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVGVuakI; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVGVuakI"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so1209680a91.0
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370964; x=1789975764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwh/9qTX2B9aSYEX0nJr57XNF2YmYT2AWRYwuXSA6iw=;
        b=XVGVuakIWIqbnkZ9zw4nZolswlM6LLELQIAVeBajv5o/PvN9kDQ2m61or3MtFDfsw/
         n1KEVzwdD56ouX1Sc/j+91kJqoybAqeksMFddrNO8r/E67XmPnHMShNyNl1CxccLqWsl
         jdWHSnClbJ/qDEIs6ljAHUyi7HcvMJjv5k2tHkbXesgBGPQoTgVT9l98wlJHEwQXzx+t
         hv74u5VBM39DWXSOhDTWibPppjhYtwnvni3C/fOwk95GOL690kRCOQIDY+rGp+L/3623
         C2qq79A1xFaxXMXPFqG6h6v8g23ztyScP0fBLHh337zqYx8TkJFDnbElG2Wak5dmIOod
         XV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370964; x=1789975764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uwh/9qTX2B9aSYEX0nJr57XNF2YmYT2AWRYwuXSA6iw=;
        b=s7QWvfvqYb4cKLqLI0gz0frZZL+mexXbJ59/m/IP00ucUYOVNGC0LO4WqfBw64cewv
         GJqBJsXsLBtJo03h41AwpOgr/y1L5wzdIrfQoiPw7jB2+b0aXKimdF9ucHkCpMdjLwuo
         QXB6iloSjEOTCnj+8c4VN9Jxi2a0mSNh4C6h3n5VlUVaitM33gRhTGkC6eo1QOEPVTFF
         3Z2TnSxtE7vjXaGDILbH6q5HJb10vUlY86Z4pKCdNwiNkvnous7yr6A9hTARmQKvU08l
         tFwYAwhEAawL2Sa/M/oigsK5KQ/YgHmoSHzSITtFuHUQbM6NnVLo1e9LB9BHPHdkJTIv
         539g==
X-Forwarded-Encrypted: i=1; AKwUvByndq0lNU8eOCP/kITJqw6Ju7mkfVpHHtaOx9E5lcNbwTPAPvQDYDm6hINCQ+jjYU+EmZvOug8YM8eP/g==@vger.kernel.org
X-Gm-Message-State: AFuF++nGWVASauAVFCR93Qex5bLnX5m3FpYvyEjHi6M0MJd9DyPPHrTT
	hg+1YJf0rSfVMdacfHr3h82/IvBMseB44dW2MeLRmaAfks1AE6bzVyd4pnq5sg==
X-Gm-Gg: AYBFou1xLaJ0QbLcOgDtLVf1D33lqeoigv/ui9t2ZnEAK8pa3X3l6BI/Qu03fiOT7mR
	miWOg9lLUTxmxRClP6g4Rn2BMpTtPhVTGgNva6vr3odGvKGiPKBUlYqC4E/Dd3ahpIMAs6tlosH
	EgmEFfTgz+gLciOYqlLqOuVbcxvVUbQwSHG2tm04X+gHR1SJziSMc0phTCcBzvqNjmQaEXWb6Kg
	eI8NY7PX1tj2fCQ64+JX0vP6idZubIBY/+V1nq4TtE5jWpSHiQpLJGMEGakYuJ0GsEpMYDNoY+V
	R6FUINRG3bQuDNTH3Qa2+3h1lmsvXHWeFb5oRLqCCh4wtstbY8c/yjWSB377UQfd4rVMbbCawUL
	EV1yMKbBg8MpBdLc7rT1JROS7vcRX+MFWFdMR5b+m6Cy1+u7mjemeDb3cly6F+hozPfYBxIlgYR
	000hUw5tMGC3Ivpzr1POzcs+ILlM+exlxHID3E8wgDFxRW5KeLGpSQsw3KowjSq8fukaNeQjQAx
	D+oC1IdrDOJqwFRf/MRwxUL8bC3fgzGyqMQoW/AD3kcKMex2Zvdh62scjEovIeTv2qk0aC1385F
	t2C7fxorLRGrz00=
X-Received: by 2002:a17:90b:2789:b0:39d:f2a1:2a with SMTP id 98e67ed59e1d1-39df2a103d6mr728290a91.19.1789370963956;
        Mon, 14 Sep 2026 00:29:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 06/13] ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
Date: Mon, 14 Sep 2026 14:28:35 +0700
Message-ID: <20260914072842.24420-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 173ee0709b16..3e7465c5b277 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -793,10 +793,9 @@ int mt8189_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8189_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	ret = mt8189_afe_disable_apll(afe);
-- 
2.43.0


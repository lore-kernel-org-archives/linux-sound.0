Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A073CDBAA
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880148; cv=none; b=cVDywWtzhrDfjlf3SU1ZFg+uQ7QrMfBZLMYzqyQZRQIaPZ4fr+tkTJAKECIxGnTP/O3PmDCBoKOOhrNDw0sAroIn6uJem2opCoVluoGzKGwKLfmXuZBwnHaKpgCH9FIZ62RO7AkOSCM9FQkd6Xc4yEMZST1/o0Vj5r+G11G/8ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880148; c=relaxed/simple;
	bh=kMBkAaHfXaz58m08vArU+hc+2lbzFG3sRy/QCWibQdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SgQbtFPwzFc43O5pb1WeSNJONd+JnjYZvMQWyO3ILin04/qOkI6Hwzg/DTYjOg8PAYSN7aRcRtWYj6/GhSc0+Fif4PjVGJ/UTXtVArzVWpKsD2VbVUP1/n27PNRs2+17fqF5PZTh6PBhKiPgWk/I0HqUUjLkojvtg8pghUwW1ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FI+a3251; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FI+a3251"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fdc579daso22626165ad.1
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880146; x=1790484946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAVOL9koiJ+YcQGa1QFT/np1LbpIAAvGvOBmeTVIdhA=;
        b=FI+a3251o47vrl9qhpBO9pRnUVmARw/dpGb6QXeAsUaxf8JWwC2U6py7UuzwTjKSpT
         8DneJxtc4/U5OGFg4ylGhVdrfcJzdnl+4rsSlnBpKvShj4qVnwbFy+uLlCj1C42TcZgP
         bfJKtAtA8d0+q4Lj5Ibkx07j04BwtRe+NV8vvYcVUC9YHNtRk2IDAWoTBAv/BPnf4O6X
         uWRMw9qaS/u4sdkmDNvIFOxtGtfqBgfNKHeVGeg2MuIUGa7yhUMxaYuCwOd+klSbsSCn
         NaepW2dklmjRRaPGspYfMPaGbzLAqvx9NNPY39rfS25i6jBt0enUDuZpamBvPK3+hkaa
         N8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880146; x=1790484946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAVOL9koiJ+YcQGa1QFT/np1LbpIAAvGvOBmeTVIdhA=;
        b=xjKo7dWP4g3aeD4XY8CxQjojgLMXslKz3HMjjFAF8yTVGFHQxec1tQDFMh3QyvGMlY
         PQsBKfcfpEP3KjvyPGdXBs0nyhPpYFIpOyffz/EonWubj//WdiyyqHZViThYGH++jg6a
         KX48FmYg1XSekKyIo7kxz1b7YNbtp/yMutdwswZHEV65RtN8VHhmRiEbPbTBRSvKPt3T
         1tLMOJim4Sb61Col+skcjnNShEEud2mJWL168+DEkZTBLlT9ta+UEeDbk4FQVDJmxYmd
         LE1KzqkaS14sDaDQgZq5EeHnC1IZiAoB4fu93kQZSIzMXseaTQen/DxBg7o2INNUYkZW
         Dx8g==
X-Forwarded-Encrypted: i=1; AKwUvBwohun9n9egzncksME+e3YNbcP/6XrwobsWnnEcDw7nSTzi0e/3Z88rs7SndU1DYR93UhfL6kGubM3e1A==@vger.kernel.org
X-Gm-Message-State: AFuF++kWuJsMqgQ0VKYz9cCky2a75PqhTJkG90usMuMdWHC+s1Km10Qh
	bYjbv+uNGW66klZWSEjl6t0Yq7q5Uxe0k7OhXvBvuCixF3k148W2InXW
X-Gm-Gg: AYBFou2gaQncjK+GZR34eCmeOD2gEuFxTaR7N4H7piaVWfKGmI6p226A6NNJx4YdQu6
	MFsE+tcX5Mb0y+lm3/YwO8s+iHWMj9VCFidjpFICIt5dR67eVtte+BZXcAb+dUl9Ck1Gtt0uv4s
	vYR9xqmgNtlUJzWRU0O3wHBTQUIs4E7wMQZUvOWQFCTt+N5vAOrc+HjAeiWE//lfSInF08utqGl
	E8r3trxnoCaaAuPCTYXBmwJyks/cAZmP576FSPoXHq+hiVdVWYyrDKbingKuenZWVKWafNtR3kL
	YFgOiMeMV+mcjHumi1yECDN8ao46pPhC/oauekrqgmvOsuguCRcbp+KRoassFPGKY+sjV0H6UtT
	puG8Prgp52pleUhdm7ygsje3j6UI/p5192Beb+2yD4hi7riATQ7BgPkPxcTLDIbG5wY+mAPttY5
	OzZ/4ooNQpU5gIE9AnIrjgzfqnq1HRsmuzLNQcvli0BMpj+gd32S82nQ4CNP1Y0jeVh/flUUFZS
	xAbddagkmTuQynvcAW4OyDzk7jtUZoIxGXlbQZDu0E5AmNjOlWsUaMEAafvbMv9rnccif8/Yz8g
	HLUF1VP6bEQuJB+ZPswX88aF/mx8Z1R2tlnqP1kiHQo7Xeh+MYCES2ROgA==
X-Received: by 2002:a17:902:d4c6:b0:2dd:c100:3130 with SMTP id d9443c01a7336-2ddc100319amr56593615ad.44.1789880146239;
        Sat, 19 Sep 2026 21:55:46 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:43 +1000
Subject: [PATCH 04/28] ASoC: apple: mca: Fix PD link double-frees
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-4-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=l6ILyllDJHogvaPe0jQmA0G3c3totE6rg0ScLhCeibc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+U5j3Q8K1d7n3zG7LTOxmmXz5Q2XzaeunGxT7HUc
 45m1SaHjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRPesTwT+HVJhMTvqn60VdsGRn0HgazSXQf/Jq76funXvH8tlWL1RgZWk4ftrd
 /oNc+ddnUN1O2mJZWhlTNltBy1Hz0+n246IQNHAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Add additional checks to ensure MCA PD links are not double freed.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be702b2942a5..66196c6a9273 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -303,6 +303,7 @@ static int mca_fe_enable_clocks(struct mca_cluster *cl)
 	 * the power state driver would error out on seeing the device
 	 * as clock-gated.
 	 */
+	WARN_ON(cl->pd_link);
 	cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 				      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
 					      DL_FLAG_RPM_ACTIVE);
@@ -326,7 +327,11 @@ static void mca_fe_disable_clocks(struct mca_cluster *cl)
 	mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN, 0);
 	mca_modify(cl, REG_STATUS, STATUS_MCLK_EN, 0);
 
-	device_link_del(cl->pd_link);
+	if (cl->pd_link) {
+		device_link_del(cl->pd_link);
+		cl->pd_link = NULL;
+	}
+
 	clk_disable_unprepare(cl->clk_parent);
 }
 
@@ -392,6 +397,7 @@ static int mca_fe_prepare(struct snd_pcm_substream *substream,
 	if (!cl->syncgen_in_use) {
 		int port = ffs(mca_fe_get_portmask(substream));
 
+		WARN_ON(cl->pd_link);
 		cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
 						DL_FLAG_RPM_ACTIVE);
@@ -423,8 +429,10 @@ static int mca_fe_hw_free(struct snd_pcm_substream *substream,
 		return 0;
 
 	mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN, 0);
-	if (cl->pd_link)
+	if (cl->pd_link) {
 		device_link_del(cl->pd_link);
+		cl->pd_link = NULL;
+	}
 
 	return 0;
 }
@@ -1145,8 +1153,10 @@ static void apple_mca_release(struct mca_data *mca)
 			dev_pm_domain_detach(cl->pd_dev, true);
 	}
 
-	if (mca->pd_link)
+	if (mca->pd_link) {
 		device_link_del(mca->pd_link);
+		mca->pd_link = NULL;
+	}
 
 	if (!IS_ERR_OR_NULL(mca->pd_dev))
 		dev_pm_domain_detach(mca->pd_dev, true);

-- 
2.55.0


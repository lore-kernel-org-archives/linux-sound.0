Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F408E3E7BB2
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801433; cv=none; b=mBgfh2w3kT0H4vczIcDgHBq5zjoRFhORKJIge0Xz9sXcvk8jSYaD+tvzE5G+hJQP9dHwTtjKINtEVVvZX8Pv56/NAo7636ElkcTlEZtlhevaycQQrqG+Xv1j1bRqKWQRlHFGeUFvqbrSXD5sOB+rCJR+kN4CJJg3ekf+fXu7ZH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801433; c=relaxed/simple;
	bh=nILbPuYN5HDdgGpTz+3+vLTQdHEtspoh90a2ct25aWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dZui+pPBOS5fZNLh9y6AhJlOB0HgrfPdJv4xgwBJlO+vG1svGNAdieyiLQFcb5hbR7qq2WPXgdzLJm/kh8X5j7goJVKhqZpNE+sOpUFwuoF3L/DPlaWlgnjdGQjRR97p4toN1G5Yqn6/xr5nvji8yWg0/jA8BpvfrKdlQgBBGKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QByxGNPf; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QByxGNPf"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8454160043aso3419662b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801426; x=1783406226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=QByxGNPfz18c9zNc8pm/ZcrV541sCt0xxrZyh+49/ZuSLt48wxSnCnu7n9yMFJezQd
         ENvQZi4W62DR51Tup1ocTTehyVQyXJh0iQ1NIhHF1MrnydSxzVD52ScJWmt0nIbjjeTs
         ZOvdVyxc786SgOBq0eCAhP8E+myhasTc2cGo0LRmNRs/D8u88IFUDoUSyXTg8DYTMHjs
         89BZEggc6cfG5q0pA+Tk2p6bU+apyRBvQmATbMfGb3g4xRPBFCC6LD8SgCcqSOvgbnPr
         rhhdqS1O70e5vPIbU8GDwI7UgY0Ojc+110tz7iuNIChUDSwnC38mP+sjTAgybwVIJhvX
         Ia8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801426; x=1783406226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=FxDgkbWSzQjKpxhIetDmyxjSlyW1UWBLT/ygSos2SQQFL5c35bO0uVfQuPjjcN1+Hc
         07FQlilB+Co5EXtk26nTMP6mvdrMEuRrW/HylMqIRoFG/YCB6wfLRUnMCd2bjtHLsqzs
         XGTcYEZbNErmUgD185flwSu58/hOa+RRtnnKw98l/RONfcgmJ17rOVXN8uQbK/cy9LZe
         uJ2d4Ki/0u2UUF7RrdBTzCGy2F2HR97kfTMcGnphAVFY0yHyyVVc1T0i5zsk4OgBL3ud
         jdNsG/3MD54NvVcklpnzACf9vGpYYxlDZC4vI2gWLxdMydr/e98s6x7OfyLSToGgQ2ZS
         P73g==
X-Forwarded-Encrypted: i=1; AFNElJ/zfCAFhmEw4bruMXcoBIt2LlknHgAnihQ9KO/XplC6MB8CHAeVody7G7z8AsqFoG62rDiOJyZoRm8FuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTSdDaTT26Wiboz1/Oo+60t+lw6+GRFEWXRPTSUMh2QbY2405
	1XNfNrWToAD9czdp68JSIC9OCHlBst6AAhf5psMqcbRASqT265WiX58D
X-Gm-Gg: AfdE7ck431z6hSG1o6sLzchBkXdFJCGIE61Nog6wMu9eFjAo4pPPnzb2nXgnU1MjQoc
	Yj0h4LEOHfgCv/Ffl/uhFsS738AsaLNt+44zG6h//wp3GAZ8eVK9gqKnRkvQCazKdSNgZPu2PeP
	q3d1DTqfQoXjuVuEC3mZfTTAXaOxbyfIhXIxYusxKuMxjVjvkLjwD3YXmrhackgCO/fBpIhlAWf
	jw3soR8Zmb6WUEcq9IiB5CG3zw15t+RZ3bFPRzE0KFXGzVktoBQOtlpTNc/y26lW9TThgaQGjcj
	iIjaTrUWIjUAtgHY9EcrLxXz3rzBXiDtXedkCm5Z6SDymgBCvxx2w4zNGahzF5kDoQYt1kyjwr9
	WwYE0VprngZfEBPcyeFTqGMD56XlsZMf4LfMfhKPY4u68BgM8fXS4m7cVh5UWS0EDSyDeJ57L53
	L5ZDCsQt0TYKj0Nlvvgi+fP7gn3O9TDcfpu6UwFDQjE+CuDJ4=
X-Received: by 2002:a05:6a00:ad89:b0:847:82dc:450e with SMTP id d2e1a72fcca58-8479eed22f4mr1846660b3a.8.1782801425966;
        Mon, 29 Jun 2026 23:37:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 13/27] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:35 +0700
Message-ID: <20260630063449.503996-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/mt6359-accdet.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ed34cc15b80e..e1190c644021 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -6,6 +6,7 @@
 // Author: Argus Lin <argus.lin@mediatek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/of.h>
 #include <linux/input.h>
 #include <linux/kthread.h>
@@ -398,14 +399,13 @@ static void mt6359_accdet_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, accdet_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	priv->pre_accdet_status = priv->accdet_status;
 	check_jack_btn_type(priv);
 
 	if (priv->jack_plugged &&
 	    priv->pre_accdet_status != priv->accdet_status)
 		mt6359_accdet_jack_report(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static void mt6359_accdet_jd_work(struct work_struct *work)
@@ -416,7 +416,7 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, jd_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	if (priv->jd_sts == M_PLUG_IN) {
 		priv->jack_plugged = true;
 
@@ -450,7 +450,6 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 
 	if (priv->caps & ACCDET_PMIC_EINT_IRQ)
 		recover_eint_setting(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static irqreturn_t mt6359_accdet_irq(int irq, void *data)
@@ -459,7 +458,7 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 	unsigned int irq_val = 0, val = 0, value = 0;
 	int ret;
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	regmap_read(priv->regmap, ACCDET_IRQ_ADDR, &irq_val);
 
 	if (irq_val & ACCDET_IRQ_MASK_SFT) {
@@ -474,7 +473,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 					       1000);
 		if (ret) {
 			dev_err(priv->dev, "%s(), ret %d\n", __func__, ret);
-			mutex_unlock(&priv->res_lock);
 			return IRQ_NONE;
 		}
 		regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -498,7 +496,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -521,7 +518,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -540,7 +536,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 
 		queue_work(priv->jd_workqueue, &priv->jd_work);
 	}
-	mutex_unlock(&priv->res_lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0


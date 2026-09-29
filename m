Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C563353A81
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662318; cv=none; b=pZpxnHzPQcezIdBTAm/JLZrGZalhrdV4/qYW4IlYrlpSjUgUwC6l6jKajbtIcdraitPAH3aCelmISaFE9J2zFk8Z89agHZIQwO6BRZvhxc3xEFo955ql6l3JK3RGZGxwH1U0Ih+V12C639BVZgpKsfM/XKubihtweuOqLhcGPyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662318; c=relaxed/simple;
	bh=jUullrU4N9AggHAvqMkl01+RfK+cE86lECTdKH7+y4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9NXWG3JhXM0+r1A1liS/ydEHzE+gFCpTxZQsny8QFQQx5pm0PnIzgh9JxbfzJTVfJA8/eCIE8CPLFKJ0S+3YwI3EHl/91zHPgGGqlT7IPEzjg9717IH4QhDO59f4lsDVqaBCDpRqCi4MJvlBm9eFq+SybXdeCzkrmr1rC3pZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qw+Ar6sT; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qw+Ar6sT"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so2540708a91.0
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 23:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662317; x=1791267117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCVvBPbKtk3VcJreNW7SRJiAXgmB7FAeWV2dOTbxzuc=;
        b=qw+Ar6sTlR6kiFuRdNxAPB3cyUmJ1UObEElYaf45xbDjJgBCPw7hM9E79+q67HB+BF
         iGbgNTu6kVE+PbZKQvDO38Xa5Ezzkki9RCb63JpkwBV3OYtzxkMeYlHNEKnTFtc4wTNW
         SZQFEsQYu0d7LXDtWwIZIfT3j3Imu8zjxm8CKzxtoOf+knO0NnDMeaUQa2WDXckTmvNe
         V6laKp6oUKd44d2iC1cDL7pib+sQ9SmCGvzQTlUHbPjl2Kv1LOea6nCDSuIhnKETVOuQ
         UEfcbSVO1BL8phm7sCZzDHdHH3SQ7vvhwLCpfVC4vV97bLsDtYBXcQIiMJZZhFcPfAHf
         BCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662317; x=1791267117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCVvBPbKtk3VcJreNW7SRJiAXgmB7FAeWV2dOTbxzuc=;
        b=Cf2yGXDJzSGs5CmE79HKFX7N4t6PliHn37RvAvKyneWJccc13/XGFRaiGO0iAnP/1J
         sG1Dv69N/E92EwNMGHLDD5R0Z5G+Xymiz0BkViXC5bYeNdoKk5d9izMGuWuSs9QgYx5V
         OD+qHOGYZHq/Lwp2fHpzuodJd+pnsvuC4nmSDd+AbAqhemeJT99QRaIQSmz6g/y+zz4b
         UAQa48b4HK1WvzfyRrpMj0tD+9J0WtsKdRzOMol16iZy20nWck7rsfNNhVc4kv6xPvSq
         jsVVXVjD/Nexzu1GB5YYWRM+IsHcj2YufnQW7eMrWkSuxwN/OQHcZ453DVbo3Rt+6lQ5
         yKZg==
X-Forwarded-Encrypted: i=1; AKwUvBzBXA61WTnt+ihh6TJqpLtmxznwHkldIa0XiKE5q4zA2ArxFclQTx+2jfDfUKhufXGJyePXpZEghafY4Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIFtAVqruBihlf5N/ADtZU42opuRvhofqCH3EzYwu+qTj0rygWo
	YUKCvgiQj1CPG/syp1Gpsi+Enc+31IRgsOln73i3izPU41oxlBV26nN1/LnHJA==
X-Gm-Gg: AYBFou3m4FMP9Brw2Ocjgiuy3Xyh90p/LUrwkiqKoLbT+71hSkknI7aRYuW+4e4l5hG
	PNpmbs8uD+ht1iJZMHT7g1JM1HH9V237cnFRJFhzQMT37Ckjc0sEhP6rm4pvVA9yTeSHq96xJbk
	w8NJsfb2JiocJLGKE0Rc9GyNL77meYW7PHmOdzrOVhEIqBuD/kmAVmRArf651wTZoxZOJ2d9Xa2
	cyvmzesUUILnj7iFeTxnFpF3l5G7DVWt1FtOtldMVq5JkRVJy8sHf+T6MzBOShzrFz/OkdyZA+D
	twCjmf7XX9BTBX9t7qkpPPT4r1Olrr1onbbtYikWhyaNx3gPFtzXVCtWs+6WQS02HXRl4tNq4v9
	A1mRN3i3kuSNOFrdNkCCsUR2hGpdOtG5mUxHHQJmTNRnCoN8dcz76WSQf6EU+QrD/+S1b8uaNx5
	SGR55WVpugTQxBWtb/IBn274LL4yjiTKfHPoMjH0Dz+qmqlFjTTk5u1yBSAothy5QjNJEgxb25C
	XM3NA4qY96+5anmvZnf097IlsCFAMfXokgZKyHIcw8uOkRlC5pGTTRi9pJxlWqUQu992OHb0eSt
	g6BcX1UoGKBhE3tI5AYkQe8B
X-Received: by 2002:a17:90b:3a4d:b0:3a4:9ba1:94fb with SMTP id 98e67ed59e1d1-3a49ba1ad2emr1589587a91.52.1790662316829;
        Mon, 28 Sep 2026 23:11:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:11:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/10] ASoC: mediatek: mt8196: fix APLL mux error handling
Date: Tue, 29 Sep 2026 13:11:12 +0700
Message-ID: <20260929061121.124001-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from clock operations in the enable path and clean up
previously enabled clocks when a later operation fails.

For the disable path, continue disabling all clocks even if a clock
operation fails. Do not propagate the errors so that the disable path
can perform as much cleanup as possible.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 56 +++++++++++++---------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 286e39f53ae0..91ae44024949 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -220,33 +220,39 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
 					      MT8196_AUD_ENG1_CLK);
 		if (ret)
-			return ret;
+			goto err_disable_eng1;
 
 		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 		if (ret)
-			return ret;
+			goto err_restore_eng1;
 
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
 					      apll_rate);
 		if (ret)
-			return ret;
+			goto err_disable_audio_h;
 	} else {
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1]);
 
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 	}
 
 	return 0;
+
+err_disable_audio_h:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+err_restore_eng1:
+	mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
+				MT8196_AFE_26M);
+err_disable_eng1:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1]);
+
+	return ret;
 }
 
 static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
@@ -268,33 +274,39 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
 					      MT8196_AUD_ENG2_CLK);
 		if (ret)
-			return ret;
+			goto err_disable_eng2;
 
 		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 		if (ret)
-			return ret;
+			goto err_restore_eng2;
 
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
 					      apll_rate);
 		if (ret)
-			return ret;
+			goto err_disable_audio_h;
 	} else {
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2]);
 
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 	}
 
 	return 0;
+
+err_disable_audio_h:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+err_restore_eng2:
+	mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
+				MT8196_AFE_26M);
+err_disable_eng2:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2]);
+
+	return ret;
 }
 
 int mt8196_apll1_enable(struct mtk_base_afe *afe)
-- 
2.43.0


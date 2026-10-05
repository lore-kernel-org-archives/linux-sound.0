Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3F847DD71
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198217; cv=none; b=FgDlBYz6nqKwofpR/hPcnlsa+dhawIvKbobYfzqenVq3MWhjAo05Dfej2KKD1vp4VvuDdL2JQlU2DAQNWuBSrMbSYa60f2vT9oNhEzqno0GvIfh7IKGwt0Ykp6d5kB2TksEQ0G+59ZrSaCdcbBS6WFm88JbtOOxhmLcSu3NVNpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198217; c=relaxed/simple;
	bh=YUm+x0nzeJJbL9Rv9wE9lDbjGN/o/ElldmkNERhZ0M8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PA0p+X3jmEQkzgymRPjqR3rgXg8QQLK0FZFk3sJwO3eM2eTLv34pZVhZKGb63ta406KhJCiN/YBurVH9IPhHwX1Avi6K2aLtUOwh/frFkWSeF+IR58WVi48kXJSw1RrdXTW0u15uhB5qz00BaB0k/82RYNIh01ZrBGmoQb5ktg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDptfuk6; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDptfuk6"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-88f51e195beso363022b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198214; x=1791803014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=VDptfuk6c0ASiNrCUAXUx+scopIzZFrHmT8TR2rYoRzgtNqbdTLvzVeN3YXiYQ0eIr
         aQu8xjlKAXXJmkzeF8S4IO4IV33vdeeCuPaYyPEkGjFLCL4coxIQu974mkvKxHWEKxc4
         2QUMglVoHYPXqukVvPYOrSQM5xeAk+y3s927otaUbkD+lxv004fUy8Uq7WqTulndQBjq
         yebSbzjjnAJZtky0Fa4pnieP7mSHQQXHoXEWhCzVIWDukbgJadCR85pcOqGtJheFIW54
         R/OhhS66WB0BAopij0ceBJ/hEvqBQ3Vt+3nAOGwyRNH8I0Ol8FfTadbUCN9nMs4VJPNy
         afSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198214; x=1791803014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=RJysij31rY//e+Yqznjx4wJ8VsrdqhZMPG+ZafjI7xRpj3TciuHyvStJSyZC9c/ik5
         NJCL0TbnHh0kfqauGeU0Wt05GN4cdSd4GxBMd7vET0p7pbOHOCesn4813JPAx1XOrtl8
         4AVTwM0QmpOEVSRVr6Rk+7LSkAS6lwaM2OOcl/0fhCLyWShXELkOf8qp8P74aqyTcLcR
         JssyMhVmMc/yCZZYIbI990DR54IfMhiLtiu1lYtUWRaHgB317LdKPqdJKD2aojldIiL+
         RQAXgq109wdXBlasMyXRvlZUQ33N62ju5LBmjYcqS6o5Rd8s88g9Tlvu/cgRjfdWUpy7
         Xguw==
X-Forwarded-Encrypted: i=1; AKwUvBxPjJJwuHjSaNrPi2Hn+HPi8y/Fq90EK0X7Gn7dqI1JXMJK5J0Y/Gaxpwyvyu0RYjgpYPtKlpxbEqrADA==@vger.kernel.org
X-Gm-Message-State: AFuF++l4/y/rxIjJlYOeMGSQbmDVrVEQ1NBHxGQXSgr5ZUQ7aztkWZMJ
	gj3hJb9EGt5ueCtKXq3TUS/8z8jc6KrZqtAPlJl6sD0dBhtiNYmrQkO1
X-Gm-Gg: AYBFou3a6W1Cd6dHLkPOwh5KZvAT9ztTIMU0n7N7fsmp0tjbT/z/NSLOjY/dNzavUMA
	Z6t93xTA4+7EDoy9D5xRKRM++5IusCSS/Emb0+P7GQDqzVfI1ZxShq2VkfXBx6+3Lr6fs+/o9BJ
	i3sgypVYkZE8po7b22DZT2gvUVuZCHoeHqmn90nxvsrUI7K5IosfXgQXxJabYSszKBMbGbRFkRJ
	p1IG5Lis/TU+2g5EMjBsxawOuZwQONR4KyWnrO5XOxFI8Im23+1LTuWZF+jbufz8KWrm3Nh4hoL
	eKe3iZ6tqRQN8ATVdqDPmwzf4yH3tffwdAJUYziBRkX9bt6Wi3H8Nv32+vieunOCoejCWZRGyhi
	V/GSOG6RRggZej/Ep59LetJETEDhBXEBa8CImd4cKcmzf0fPjJn2vJMxF6Fis+vLjrqMoRkUjx2
	HSYGsP03KsFoGMCX3ow3EB0pZxjFJKElKB9mNkEg54VMsv/7pM4mhxnCPrdA1hbwZ1T4OrN6+9t
	G0yHfusIfNyPaKUX7LdPz3hKlwa63ojDBGXjnbLCKK/SoLZV0VY/29/MqrURRoVjfHrtrkBiX8v
	NMbpwekbxpeoLw==
X-Received: by 2002:a05:6a21:71c1:b0:3e0:d508:59b3 with SMTP id adf61e73a8af0-3e0d5085ab9mr6255687637.71.1791198213773;
        Mon, 05 Oct 2026 04:03:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 04/14] ASoC: mediatek: mt8195: Fix timing system clock error handling
Date: Mon,  5 Oct 2026 18:02:47 +0700
Message-ID: <20261005110257.50145-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check the return value of mt8195_afe_enable_clk() when enabling the
timing system clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller. In
mt8195_afe_enable_main_clock(), return the error instead of continuing
with AFE clock enable.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 34c828fdea29..ef7a62fba6ec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -662,7 +662,7 @@ static int mt8195_afe_disable_afe_on(struct mtk_base_afe *afe)
 static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A2SYS,
@@ -673,13 +673,22 @@ static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 		MT8195_TOP_CG_26M_TIMING,
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(cg_array); i++)
 		mt8195_afe_enable_top_cg(afe, cg_array[i]);
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
@@ -707,7 +716,11 @@ static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
 
 int mt8195_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8195_afe_enable_timing_sys(afe);
+	int ret;
+
+	ret = mt8195_afe_enable_timing_sys(afe);
+	if (ret)
+		return ret;
 
 	mt8195_afe_enable_afe_on(afe);
 
-- 
2.43.0


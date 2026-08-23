Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC14364EB0;
	Sun, 23 Aug 2026 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787476197; cv=none; b=sR0Sza0c1c7F54nbRsfCJqzIbhOws+bdC+TJlnjQYHZUEmyAFL/O9D0lcF5v0l9twyyyTeqMGljHmBCflzd2gAyNasomQuSllQeha4cJY6le5d6VfFk3M5FIpkxVXwZK6LncmAMkP+yJmZjs+5/+wjKUDImRrZKvvnWvwxCHPb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787476197; c=relaxed/simple;
	bh=+qAhjexHSsdSLImM5dnJqcRevK8xSg9zeLPfFnsSiRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ibRW63KnAqzYKBAcldnt262LywD52FPEaNodPE28vyaT6c82QOecnMtKiOMkxIBnmViJQNr38p5vvGDumBHZQYnjpUSWDa8aEOIhx66rkwe5vPS37DNGT0iLG3UZHZMQGe8U3vXOjtDbgibphAfD4DPF9hKqtROYgeDey8GN8qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hL9hAo3u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hL9hAo3u"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FBDAC2BCB8;
	Sun, 23 Aug 2026 09:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787476196;
	bh=+qAhjexHSsdSLImM5dnJqcRevK8xSg9zeLPfFnsSiRA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=hL9hAo3u+nZkF50DHVQ+kksdojKFZTjNS/7T90z5FPYmiUoq5fJ9q27bQFNKRzSpF
	 WpCg3Dy+mjDvYhzId6oCpRWxKC6wCIqiNau9wxZiT2dTFRJ63H/t7gFJocCkqYANv5
	 XIuWR1yCbAHZTNK/3FXqZdpw4YvZ+ENd3WRoy3CqCe3BctyypJ++3Vg4gsGxy6YKhk
	 cGtcgwu8M38GE/On0sRbuYLvD6l5bWKjCkzZaIqm1tDGNs5uhyOYat8kxWGELogZzb
	 ccVQC0WrsfVZdN9FS4Rd/XliF0jrXUKxxcL4MUYMKdnw/hAdeeuy0PM8YF4iapYZ/9
	 63UEbAXjH4sXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AC2C5DF97;
	Sun, 23 Aug 2026 09:09:56 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 23 Aug 2026 11:09:55 +0200
Subject: [PATCH] ASoC: wcd-mbhc-v2: Fix incorrect properties names and
 typos
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-wcd-dt-typo-fix-v1-1-a71b458e0d31@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWZuENq6vIha0g7FA2rpFvLti+
 Z3k/BdYMkwWyuACQxtbniePOAxADc3UE7L2BhGJNMqFxF1p1A7duczY8YFFHgstVZF1lIB/LYb
 8/BWr+rdd25GUezNw3w/J3L1fcwAAAA==
X-Change-ID: 20260823-wcd-dt-typo-fix-9812d3c97fe5
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3259; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=b2eL9Z1VE+RnX6fFKw1IaZPJWpmERV04U6h9XPnL7FM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqirjjWSeyHMdFLZStFtxonLbX/0wNn4Ih208NO
 gOX1pRZVAuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaoq44wAKCRBgAj/E00kg
 ckQeD/9B6oA9spMyujeC7MMahuIKZjOJrxCHZX1XO04klOuazMbTa079X7ZFRIsdEzYuMrS2Rhq
 sD8Bkx7HicI9wUDPAc2R/mCVJqTmD0jozAOskovrWbIQHd+QHVmuqrdPvbLmRZK+190mdWNtFQu
 Y4S2dJZ5kUu5IsF7OysLjPtIAKD0BEZ1xX+xJsEwhFlLxNgzF28hccrUKYN/ksGqByG48gCRe9c
 zveMI+DCXiOzSYH2yAw1gCdBvO7PvTOQ06gIWNZpjFzJgQENzCRu8NE1Lq9yJ47sSH8AwqWm1z0
 0qoKlX+NURDMAoUtmDurXnW9zyRLY+Deu8Ut599iuasw6bUVwteS03ckk0lcwr22W7GFW4fnoS+
 RQD4wBZJxsyR6gtjPxfnbR1QLk7Pea4/AOYuHrWAX/hcs1beeHU7ux17jIUWxmMNOFZy2MSFZi+
 6UVNODX9TgCYs3ivfY/zRiijPStAVvcBmB/8Rv1ePGZzPtNuw9TFRxh83U6du+euvoKHtB4I3hE
 XUH4V73NkJKEe3a6R1Zl6ukmcISy3WhWn77EzRhk9RP7damLo0qfJgEUf3ks3RR6wp03pZ1YxgY
 pNLGWUWHt2ww7viCntaazdY9/MwUU3/X4MIHkaKfGyx7w29uvvy9FZS3M9Sc2Ye3kByvX2JoTtZ
 o2aAHVt1b0NrIBg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Improves debugging experience.

Fixes: 0e5c9e7ff899 ("ASoC: codecs: wcd: add multi button Headset detection support")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index bb0c8478a8eb5..850be84d65ceb 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -859,17 +859,17 @@ static int wcd_get_voltage_from_adc(u8 val, int micbias)
 static int wcd_measure_adc_continuous(struct wcd_mbhc *mbhc)
 {
 	u8 adc_result;
 	int output_mv;
 	int retry = 3;
 	u8 adc_en;
 
 	/* Pre-requisites for ADC continuous measurement */
-	/* Read legacy electircal detection and disable */
+	/* Read legacy electrical detection and disable */
 	wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_SCHMT_ISRC, 0x00);
 	/* Set ADC to continuous measurement */
 	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_MODE, 1);
 	/* Read ADC Enable bit to restore after adc measurement */
 	adc_en = wcd_mbhc_read_field(mbhc, WCD_MBHC_ADC_EN);
 	/* Disable ADC_ENABLE bit */
 	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 0);
 	/* Disable MBHC FSM */
@@ -960,17 +960,17 @@ static int wcd_check_cross_conn(struct wcd_mbhc *mbhc)
 	u8 adc_mode, elect_ctl, adc_en, fsm_en;
 	int hphl_adc_res, hphr_adc_res;
 	bool is_cross_conn = false;
 
 	/* If PA is enabled, dont check for cross-connection */
 	if (wcd_mbhc_read_field(mbhc, WCD_MBHC_HPH_PA_EN))
 		return -EINVAL;
 
-	/* Read legacy electircal detection and disable */
+	/* Read legacy electrical detection and disable */
 	elect_ctl = wcd_mbhc_read_field(mbhc, WCD_MBHC_ELECT_SCHMT_ISRC);
 	wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_SCHMT_ISRC, 0);
 
 	/* Read and set ADC to single measurement */
 	adc_mode = wcd_mbhc_read_field(mbhc, WCD_MBHC_ADC_MODE);
 	/* Read ADC Enable bit to restore after adc measurement */
 	adc_en = wcd_mbhc_read_field(mbhc, WCD_MBHC_ADC_EN);
 	/* Read FSM status */
@@ -1465,24 +1465,24 @@ int wcd_dt_parse_mbhc_data(struct device *dev, struct wcd_mbhc_config *cfg)
 	if (of_property_read_bool(np, "qcom,ground-jack-type-normally-closed"))
 		cfg->gnd_swh = false;
 	else
 		cfg->gnd_swh = true;
 
 	ret = of_property_read_u32(np, "qcom,mbhc-headset-vthreshold-microvolt",
 				   &microvolt);
 	if (ret)
-		dev_dbg(dev, "missing qcom,mbhc-hs-mic-max-vthreshold--microvolt in dt node\n");
+		dev_dbg(dev, "missing qcom,mbhc-headset-vthreshold-microvolt in dt node\n");
 	else
 		cfg->hs_thr = microvolt/1000;
 
 	ret = of_property_read_u32(np, "qcom,mbhc-headphone-vthreshold-microvolt",
 				   &microvolt);
 	if (ret)
-		dev_dbg(dev, "missing qcom,mbhc-hs-mic-min-vthreshold-microvolt	entry\n");
+		dev_dbg(dev, "missing qcom,mbhc-headphone-vthreshold-microvolt entry\n");
 	else
 		cfg->hph_thr = microvolt/1000;
 
 	ret = of_property_read_u32_array(np,
 					 "qcom,mbhc-buttons-vthreshold-microvolt",
 					 &cfg->btn_high[0],
 					 WCD_MBHC_DEF_BUTTONS);
 	if (ret)

---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260823-wcd-dt-typo-fix-9812d3c97fe5

Best regards,
--  
David Heidelberg <david@ixit.cz>



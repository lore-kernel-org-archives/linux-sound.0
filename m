Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B0E2D73BE
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 07:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756712653; cv=none; b=KGRZgaW+4xyz8LAZJhmLQQCRt+NAUT8VWEjPs3mGNJWHEe9BjTOj4XmzuiE3QNjda8rMsT8SQygA7LnX378zSMYqgwiv1cPDf4XI0vUFBQKPGAq1sOvw/t7adsrEO27fMW1CLvV+0uJYjl/khhW0XFtkt8a4N9P8+wxuXC/nHHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756712653; c=relaxed/simple;
	bh=Vxka5qT8/uDls9RKQOa3EW/m9jEVUYrP8KPc6uEZ08g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T1fr6FBY+GNzmhzItAlXFyE7qaoLtygK884JJBjtDvonJBVTwI5HhwdHtQDkhaISwDdAipJXK/iJH+sWPrRt+FB273IfJW1aE5Vpp5Yt/qyLnfp4NU0tmRR4RkfFXFylOhHapxGndkNbPj/X8ZzU8yW9DitK7pNxP4dE4ZsMAb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fWzYiGCF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fWzYiGCF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b76f3b24eso4245785e9.2
        for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756712650; x=1757317450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tcU2RxzATqV6/o5XbejVv5AzlOG3rbxZx3bA+k7/LJw=;
        b=fWzYiGCF6HnMhXKk17HORP6U/RGRV3zTa0hdtPU+snJYP37EpBsGwc3xckX+z4ev3X
         dF9CsZ6BD7pTGnxycWSBsU5ZTEREjL8u1fL7DnkG2VWp6ZKfSq+z5UTAZTRFYvzyBD8q
         J+6qvlnG+SEzeW0cCNwedrbSc7XF39Rxqo5OPG95g1RHm//kADRq/hRA1ZR8Ia2tbrBY
         31fNVuDfW+xqLKo+6+p4SE6/Q5kJggTqCt4jMypVJBOELMY2ls3ZmKdkGOL0GI7ukjsi
         sA+zwwbV3mJzFe3JsO+ngcB65CHHRw5AfwKkCSPpBUmNQw+W2F1esIzqWqugF/gjA5dq
         bfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756712650; x=1757317450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcU2RxzATqV6/o5XbejVv5AzlOG3rbxZx3bA+k7/LJw=;
        b=D3BKK7dfqFLAPZg9cgAF5ZRrMrffnklvXktGg5mLjNaQXja3w/0GCWEfdrqOrgLNh5
         FEOPo9S4GCOmwb9I9OTHF5INKMt+Mb74+ymkJZEpYvxc7QTK0sXPysb/7UnweN7oPMn7
         OBJ8L9ulGKf/jclLhY3GdUd/bV2OfK7JQ8bwL/nPQw4DO4bkgNXfakjjChoUfCU6vftD
         lBV4y1xiAUzWCvy6iKn67fOZZDVV2eEWCk9jKU8+Ing2V//k67kUPtgy1eKLPNa+KiwX
         CoUtwftNEwVAAzDvk0Cxj4Y7/cLXKljXgDWPan9XHy5xC0QX1kHZM+ugR7hGjRG0a0tR
         cJtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdLIRWAizL2Q5CqIIVnFziMnVoK75/qrvOlNvf0suaMqFeqvmFzwHDC/vqgphXkr/c3BE3pbpQK0buOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCxgUgAWMAews38yMTlBfZhnf+4Bdvnq6CHTTT0R+wotKGLiTP
	gwiwLGkNCjtkIVHt33DLlvwBvSyXEOYzKKbDC5YxFgGSzorQZUSMAtCe7Vs6IL+YSTg=
X-Gm-Gg: ASbGncvQGtFmaJxo9I3QQAoFxHZTGgn5krBeFWR/hR4Jk+h0NqebhU6DSJs2K4sGeHE
	s2LEsvP2bBTTlf7UB19bYFRqyGHzVlca3qZuAZvd4x1YyDSTkDucAQtiUaTWW5ccZDltRYnqSKX
	9+YNJtlsIh1WTrD2+PMNjk147ckxJX32EiQEKPU9g8WYBqFIWFxsWv4n3h29Iz9XH0APW/mZWBW
	3XuEKy1w2pk0YK89uzsNHuhjizUfYzIPUg+fVgw3E9oA0CJSokFDZ8AHGSkbXoFGqjZsJpGxy/+
	2J+Z2VT2y1m4LKsxQPMpifZ/iv4zaToMq5NUF0zO/oxbjPKw1F815W3q8U6vF/mHEL4s20n6dKf
	TgiwV4+JPkfeTwbpOygCaSZSIwXmEU0N7jHVU3usPKJSa
X-Google-Smtp-Source: AGHT+IH9FZQ41C3sDmdAO6rj5abHXFmiWvN6t1Pqd5y20uTQNyr7rY7eF4mlm1/4d2htMW3wctdAnw==
X-Received: by 2002:a05:600c:6385:b0:451:dee4:cd07 with SMTP id 5b1f17b1804b1-45b81e23616mr42044525e9.0.1756712650372;
        Mon, 01 Sep 2025 00:44:10 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b72c55c1bsm230437605e9.10.2025.09.01.00.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:44:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH] ASoC: codecs: lpass-rx-macro: Fix playback quality distortion
Date: Mon,  1 Sep 2025 09:44:04 +0200
Message-ID: <20250901074403.137263-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3401; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Vxka5qT8/uDls9RKQOa3EW/m9jEVUYrP8KPc6uEZ08g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotU7Dy0ku0kPuFmrWUIGkwnMpl6DsCcP2XTh5x
 rPc2UlHNPaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLVOwwAKCRDBN2bmhouD
 15MVD/9BEHj+OpjjCS1xDovHbyjTGs/5IDGH01ze82DAsbbezDdc4h+6ASFLDvWjxLlRxe3XfDg
 62L0pyqyrMtwVi0S3nryp8NNlU20IjgtSvHzTJfKA7j56hrNvwRThREvuVyN94qBvo7bC+LrpbV
 dFJTH2K8G6OmMw7pgTbobWsZfix7TcpK8Pr6HO2EpSnd1vD7kSUExLWpNY3LHp+sHbtUvC4V80H
 xYDXN3vTaEsDsGT3sx8qN1UHLLxJho7/vCuOQQjOTGjIbkuUok7lt6g/VocpB9IJjy16BBDxiYN
 /Q3pYa/3cSoJegH2/W/PXPM6CeK0LbxUCNjy8f7NlT+sjIFq0KVlVt+Vl+nFQuJ5diEWrIwRzVh
 CvIzTX+pS9Sl4dxJqj1iKcbnRY/Br4jzkyBsgiBvTqQPHqmqykouSTdjaSfivxQpcDNmzFCJ2Q1
 DOyHwPiZdJgZPpRmgFL9f66b8lZ/kN02o90eVLMRrxPerJ0Byx208tVM1j+SDM0Xakmf30RSTgP
 nNSjfdcxtnPcAqGboTqODoWdzrMKhLeMHRn3G6/XqgimtqBoMpxNxVxLfhb0SCxK27wOUcGR33A
 0eMZuNmhO+5dzWC1ZXPTnFJ9W0HaA07FQl8JPnM1FxG9rdc+argqr0iyBTMYgUCqzIhgS8puutO +AgcY4Q09L2/mBg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Commit bb4a0f497bc1 ("ASoC: codecs: lpass: Drop unused
AIF_INVALID first DAI identifier") removed first entry in enum with DAI
identifiers, because it looked unused.  Turns out that there is a
relation between DAI ID and "RX_MACRO RX0 MUX"-like kcontrols which use
"rx_macro_mux_text" array.  That "rx_macro_mux_text" array used first
three entries of DAI IDs enum, with value '0' being invalid.

The value passed tp "RX_MACRO RX0 MUX"-like kcontrols was used as DAI ID
and set to configure active channel count and mask, which are arrays
indexed by DAI ID.

After removal of first AIF_INVALID DAI identifier, this kcontrol was
updating wrong entries in active channel count and mask arrays which was
visible in reduced quality (distortions) during headset playback on the
Qualcomm SM8750 MTP8750 board.  It seems it also fixes recording silence
(instead of actual sound) via headset, even though that's different
macro codec.

Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
Fixes: bb4a0f497bc1 ("ASoC: codecs: lpass: Drop unused AIF_INVALID first DAI identifier")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Reported via IRC.
Fix for current v6.17-RC cycle.
---
 sound/soc/codecs/lpass-rx-macro.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 238dbdb46c18..a8fc842cc94e 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -618,6 +618,7 @@ static struct interp_sample_rate sr_val_tbl[] = {
 	{176400, 0xB}, {352800, 0xC},
 };
 
+/* Matches also rx_macro_mux_text */
 enum {
 	RX_MACRO_AIF1_PB,
 	RX_MACRO_AIF2_PB,
@@ -722,6 +723,7 @@ static const char * const rx_int2_2_interp_mux_text[] = {
 	"ZERO", "RX INT2_2 MUX",
 };
 
+/* Order must match RX_MACRO_MAX_DAIS enum (offset by 1) */
 static const char *const rx_macro_mux_text[] = {
 	"ZERO", "AIF1_PB", "AIF2_PB", "AIF3_PB", "AIF4_PB"
 };
@@ -2474,6 +2476,7 @@ static int rx_macro_mux_put(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct snd_soc_dapm_update *update = NULL;
 	u32 rx_port_value = ucontrol->value.enumerated.item[0];
+	unsigned int dai_id;
 	u32 aif_rst;
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
@@ -2490,19 +2493,24 @@ static int rx_macro_mux_put(struct snd_kcontrol *kcontrol,
 
 	switch (rx_port_value) {
 	case 0:
-		if (rx->active_ch_cnt[aif_rst]) {
-			clear_bit(widget->shift,
-				&rx->active_ch_mask[aif_rst]);
-			rx->active_ch_cnt[aif_rst]--;
+		/*
+		 * active_ch_cnt and active_ch_mask use DAI IDs (RX_MACRO_MAX_DAIS).
+		 * active_ch_cnt == 0 was tested in if() above.
+		 */
+		dai_id = aif_rst - 1;
+		if (rx->active_ch_cnt[dai_id]) {
+			clear_bit(widget->shift, &rx->active_ch_mask[dai_id]);
+			rx->active_ch_cnt[dai_id]--;
 		}
 		break;
 	case 1:
 	case 2:
 	case 3:
 	case 4:
-		set_bit(widget->shift,
-			&rx->active_ch_mask[rx_port_value]);
-		rx->active_ch_cnt[rx_port_value]++;
+		/* active_ch_cnt and active_ch_mask use DAI IDs (WSA_MACRO_MAX_DAIS). */
+		dai_id = rx_port_value - 1;
+		set_bit(widget->shift, &rx->active_ch_mask[dai_id]);
+		rx->active_ch_cnt[dai_id]++;
 		break;
 	default:
 		dev_err(component->dev,
-- 
2.48.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595126;
	b=QUayTedLln3rbxt74GegpRj1TfwghkGAyxIHp8cJtbZLIgiB2CsLcHW3MvZne7P4hmkv
	 99NrNgIK70lZ+VFCU3fMZL/VlgDrpDgSTnf6/KdkPMA3PiVZL6xY6VUdaxzGxj2zKgdRD
	 pJPgBUewyERYUpccLslYMIwwnuBEF8gypLa2aDkjhtNM22AsMonJOn5XnCEy0D4LaI6rK
	 NLEZLOG+at8sPSz8tiVjvumZY7QSlgRvF6SXs9geZdCeauLeUuGPbZ3P8LAgInyaHZVle
	 J/L3gUJ1id2pEEUlLfCJYLMH/qs8uXU+JJtqeB8VQ8Cl4b85gJdzG3CP6G059YW28gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6Yb4xm/71FbPbrX8bul+Nh9djbt0T9PDaJg9F6V3s1Q=;
	b=0Tk0tnL2355wGX/ScXcQjmwpWXlpbzh9Uij3o7ETm6E7IHvDlP9i02gCiPJuUmFaFlSE
	 HWZZom7tTo+yUXv7PO4DoU5x+xQ2EIekc31jiSTcJjV2geXRsFitVerkpKibGw+7YbrDg
	 JnbhivWSJ0Pwa4krUk105ckMQ9PXEqZT5wCW0VGD1LQv7mVjV2AS8tZdmZHejyHTLGfuM
	 Avs2YTDf6/bndRr06nQq3v4375Xb+q9Q+YbnbuMd8F7NzeBvhJR2RgS//mFDN4kZAqLE6
	 mXWJuND46I76EJiCHsBV3b0sIySazb+i20cnCW+fA9gVDTuC4v5+rP7vfVA5LBnsd2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EMnFR12B;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44EC606E561
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 18:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C44EC606E561
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EMnFR12B
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so11055245e9.2
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 10:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595124; x=1795199924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Yb4xm/71FbPbrX8bul+Nh9djbt0T9PDaJg9F6V3s1Q=;
        b=EMnFR12BFy/Zd/JfaqoThARSiDLJF50Y55g/A5oqz/RdNk/+AyHud5tlPSeLcaJY7E
         w7kfG9fjnI+eT86YE6YxbUMWWML14o5beIvMc/Ro6ndCwjooH0cV+KD7EloGy/wRJD9V
         Jif90NVzZVcQ6+YoLmHHZt4iAeZLaEA7ly68CU49G7X3pzaWIZR8lMzP2+vY891L1jTl
         h8RmgqDHq6vxU266MaErJnLthW6M6kNZv5ZuJ3s2+KVNORgMp4D4JrCArmECEFJMES0C
         4OFjKe4uqE0XjwMT4xmKxa49UaDBJ5eRE3nw5DHCUehtiWFP+2bUX4YlOMp59d2pT66y
         2umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595124; x=1795199924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Yb4xm/71FbPbrX8bul+Nh9djbt0T9PDaJg9F6V3s1Q=;
        b=yogVhqUg4JNIXYBYide3gyaSmKJ9AZWAf8sRKDGIgvFHccLE3CAlhOYEQxJtE6Ms4E
         y5pXM3xyqUKaKgajN0Hb+9RKJiFGlmEv/j1jFRiXNM1u+py+SdwDhL2F7syj8YLKq2o6
         GCAWt/8WA/3h6WP02x350w+7+pf1IflqGHOqxmvpZWkbkqv5Swh3Nx3D59p2HurHYZ9j
         FZrG5StOkdWjTZv0CPTJ/Ri6j+k/zL4eqANppUOoxfoFVY6WREriNWAubh0lR0u3oIvM
         NUCuf/fVpTVermSNO3k78svDAgLGCXYZypk7MYplFkTbIdPtE3NpAzC4H1r/T9zdjo/M
         tjgQ==
X-Forwarded-Encrypted: i=1; AL+hErH43K2KIxTiNq72dbiTnIqwM/DFo5+iEtSymbaNJobx/s4tI+ts8eTxFeE9P0aCerJ+9TQpHEqTpedf6g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9+qCXRcZQK9y5mIXnFo2HT6Hp6m+4pjSZOI9LP3Ca3A0d6B3Cz
	j0XtvVw+qQpIVo75kB9vf8FA6f8WaJizgyZs3DZgDfiSQmA4ePjs/ofH9c1rul+fdhY=
X-Gm-Gg: AYBFou0yvNBO3PtGRhkWggvy+h2sIWQE0R2BaB6fICyqKbzuHAV0MUy3wHlnRKag3xf
	+YTuHVE1ipQCtLpl9qF4l667NQ5XhEN8apbIBPzbo7PeiSCJxxDuIpmtZHv1RW2OUmtY4I5tE+w
	jrUI05JCYQctOvs5agLcg1Gjuidp95AJ59ustH+Hk7etUReYpNFvBwHkWVlg1CJ2yAbmQUWwRfL
	rCzNiAtsZHtnxayy7wxFoKCYSbaKke1heptuoRhz27caHWqGKE+aigu+DpsbXWr90QFTwJw7uH+
	Rxb9NoaQhdzXJOfzWIxm9X4b/G6UzNtZWaLafGLpkJ/uItwlTJ3f7NQ+/Rhmv3823pdZKIXENO1
	HNfIn4bwlun4TRIjlSpEw0SCJlRlDITuOFlwXEnEEn6wr6/6Urm94btMhKptR9S82CNjsUwtW+t
	yyRCSRMXmW/BGkZpQqwuIW/JOpOLal8VZ8x1PtGyy8KZOMUhHECEJfjFR5UcE2jmthK2PhmmbZc
	wdp/ptvWQL4l+HCQXkaEm/Vedd+CZBsfO+1xoupJYIiDK3gL4it0V9xyvUywiAKn+5nHWUMPwPR
	Qq2k0q76XJbiYp7JjnKm+SGDFddlztOBduNjLjP0ND8=
X-Received: by 2002:a05:600c:46cb:b0:4bb:52d8:73ef with SMTP id 5b1f17b1804b1-4bb55af12e1mr70215745e9.34.1794595124200;
        Fri, 13 Nov 2026 10:38:44 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:22 +0100
Subject: [PATCH RFC 08/23] ASoC: qcom: lpass-cpu: get the optional
 codec_mem3 clock
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-topic-sm8650-el2-v1-8-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Z8GunUt92Y/75liBMYWXLbRwhUaetuFUQPX3BHF04L4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91khB1slVEF7d6pDan68qfrqHRNn8kCup/oD7Ah9
 hZllBjaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZIQAKCRB33NvayMhJ0ezgD/
 45ZUV+oN3bZPvX/nBQqaRAOlnpXXntUnO4puAR6WYjREGQL+qQR3swBxSOfZuApkJ1uP+MRJNBBNWH
 lQUfzGyz359aiHXu2wQg8ejOYBhu/RCprmvNTWoOo6iEDUMhAJmcNC4vwAEeRd7hGRetUUBwaGGqBA
 2MX2bvLNk3hnBttn2U2wB73UDvIPTZMix5+hOCKn77M0TkzxygA+QtythciBB1bz1ZjHEH41fvW+Rf
 v4MG5fa7fkHO1dHDssw545R581/ncL7jEv6i5LOxYu62gpgGRI1fWZgmuiEnwKy+pog0m5sZjoRbQN
 o8tMtxZkvHdS3h5KUsa/p7DzS23yZ6FPyU4u0ya+hkxanDIaN6wQFjUGrB5ogFsGkRZwjMcWK9rVVL
 4c2U/VMSdxVz6s1vTO1waKQ+tG3fi/VRMkvszXcMofbGuOvkBtr3ffl9t9zVFZkhjaknEnYsWCY+vU
 lbgz1EwV50TtXULVzqxt3dixNV8Erf4Vgpc6PpQAjSw3HPR9dCLnxPiY79MrST0s2x9lHkxxNp/FpJ
 rzpuEfpz5ApeS3oHmoslrpuTh3ZLh05TE+uXj9hmI0pBtWAgkwhegWpjmHGHPtocAGh+XpHkYwZRaC
 9UZyDMFeqzoYTidcj7aC+O+w2zdxRw0yEtyrOah3BGzW3mwqecX3Py6Mn1Ag==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Some SoCs like SM8650 have a 4th codec LPM block, gated by its own
codec_mem3 clock, which the driver doesn't get.

Get the optional audio_cc_codec_mem3 clock with the other codec DMA clocks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c | 4 ++++
 sound/soc/qcom/lpass.h     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index ee187eeb7392..ea8b6083529c 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1071,6 +1071,10 @@ static int of_lpass_cdc_dma_clks_parse(struct device *dev,
 	if (IS_ERR(data->codec_mem2))
 		return PTR_ERR(data->codec_mem2);
 
+	data->codec_mem3 = devm_clk_get_optional(dev, "audio_cc_codec_mem3");
+	if (IS_ERR(data->codec_mem3))
+		return PTR_ERR(data->codec_mem3);
+
 	data->va_mem0 = devm_clk_get(dev, "aon_cc_va_mem0");
 	if (IS_ERR(data->va_mem0))
 		return PTR_ERR(data->va_mem0);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 68b71039b981..4231466928d4 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -107,6 +107,7 @@ struct lpass_data {
 	struct clk *codec_mem0;
 	struct clk *codec_mem1;
 	struct clk *codec_mem2;
+	struct clk *codec_mem3;
 	struct clk *va_mem0;
 
 	/* MI2S SD lines to use for playback/capture */

-- 
2.34.1


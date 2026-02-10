Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918B6324B26
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770741922; cv=none; b=EaTbxWJ230zxTN+89LL5vDJu+t8rYV4Ql/oILjOcVIet10O3HeAEYydke1HYOYKnQuAYEtQIMeMjwlcyhO871O4xh+Wfo00U2V9ndx+YB92txzds7WK7KL/7epN2Bfu+P+F4ptPZ4vzmpmjfUQ3HaJB7T606sik7/Bu+JUF1HrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770741922; c=relaxed/simple;
	bh=8XLFcuGCoDNtMNhZSpvJ5AtY+fBT/jH4kJppxgBBCMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhL+oj0ZDGHTUlA5XS0ml+b23O2TktJ5USlfAy7mVzjPl/q+DMnIVEzEURD29uNhPWi1uaxFdCxQfJVwfmA8thR9RviYa0w+O9QVgtwEAvsUSlCdt3yQQL5CxHUPirGqfeIWnzxkuMQWFiXQIzST55KzzRHu8yKc8gdz84xeGA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8TqODZP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8TqODZP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4805ef35864so50048345e9.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 08:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770741919; x=1771346719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8M/AzEHOLu66CWQK6hdbu+gOPzelRhtjh/h1JCujosM=;
        b=k8TqODZPnIyAk+JStUq3t39mIoLJqOZbNgfv2vCO58JsguTb6oZeVduLWCBWu0wub9
         yA2h44U6qNiKXmxrqakyVt195uwM1lR//qkWCMSdrfSJUl7QJNvO18qvhZErAkSSMUq9
         KDuNBR7pnCuimjOLPG3xJ2RiHClYPIZWL9QikgJpFKdV/qfkRhgjz2pJsOlFWPOkbIC0
         ldqzqJ/JKKoIJz/aZhVyJKy4Iar9fwUfXuI92+pB/fBiGIMK0mTOUtLu8k/iRcUsBODd
         ppT0trpOGqTNR8gMOPuZOe/v8F9rhdFsDPuArVsNJcJyzHflOd8E9Z3IZaZ8gsG+bCDM
         XS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770741919; x=1771346719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8M/AzEHOLu66CWQK6hdbu+gOPzelRhtjh/h1JCujosM=;
        b=Vah+DrGNDXHgga1UTXY9W19ReXdK2JH1c9vJhhGNBiFR+ENUcq0c2AodIWcfVHhrRI
         pFwg+TSiqGizdWeYI0zSDPC7FWj5jAqrnKOgN2pLuQZQO0HHc2KujxkdIlCc4XsPt31D
         EI4TsTkg1n9TOsCrhLbSfIBOoEQgDxNASzZbxv2jYspqDW3EtOeoFRvPtQkEtvvwlA4h
         sPSlJ6+I7YwIg36vTDJAVehUUqSRA2uCBezqzRySckFYuh/BSYpOi3yUWJoCjmhG4gk5
         +18JNekUkJgWOJCFzCG4AQ1lP8CbVFfoaPZzvMRQ1dWYKBzLtpwC6dPeLb6lx0nzSPcP
         fqmg==
X-Forwarded-Encrypted: i=1; AJvYcCUT6IiDklpPrZ0FfKXZsPjG+NRJ/Ixq23GPTIc/9Cfc0bdFt7kPln2qUeYxlRAp1cmHgL18Iz0BN8i1HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz214CP4+pBuJxBcnWdLWvpvGMh5pODc8fWImwOg7TWbpBr3ONT
	h5ZJYlNO4pYNFi+DvFJAQpFXpJ85gM+BKtKT0kXPjkfWqBp+MJXD9vwb
X-Gm-Gg: AZuq6aKBaY/qrU3RuLMbci4abFvEiik/dp7CnEoW0HD/olC9WRneOdsrO/CGelg4EUw
	IYxuYoyK6ORidwVDpHHSTvs1vclJMITli1YBVULj5iqENBtjdYuPR/1IfQK5W3kqU4/RKjNRckZ
	Gl9Ib0rbi4/ndvvLEiFEesB4CGZsZbpyHfGKckR+gbLGbjin4wxNLxzEFOvFjt8bwuPFcaJL/rD
	VfjtMVi5vsyJuw4PGUrFik4d17wNHsSmeEY8sXylf+mlKqXDDtnDH3QSg/as9L0+WukYrs06hJ7
	3PbDrphwPbN01mWn1EZ4dEL9ovo5JcX386dtWUZ343A4lrzkCJMbfIU8e35EavXgeIrX71e1+Sx
	1yAdETmktIvqeOvxPbWiJR6o3HhEiVU8lPRsjDrD+b1VHh8mnijjpjNCfyOa9eTlaXT0vWSDFyu
	RabnA2aXVnQx0XhrlzwyNPVvwKzN50LHClopA9TvgehXLE+7R6s55B5B/MYUvVAutqjbY08TbxS
	/DMK2di3wLKFCBqjk5DWksvnlkywuaHUX2cMdHGmT1/CjPpoSY=
X-Received: by 2002:a05:600c:1381:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-4835081e44dmr37145235e9.23.1770741918836;
        Tue, 10 Feb 2026 08:45:18 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm96294245e9.1.2026.02.10.08.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 08:45:18 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alexander.h@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: [PATCH v2 2/2] ASoC: simple-card-utils: add selectable sysclk ordering
Date: Tue, 10 Feb 2026 17:45:06 +0100
Message-ID: <20260210164506.161810-3-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210164506.161810-1-stefano.r@variscite.com>
References: <20260210164506.161810-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

When simple-audio-card programs sysclk for CPU and codec DAIs during
hw_params, the ordering of these calls can matter on some platforms.

Some CPU DAIs apply the final MCLK rate as part of their set_sysclk()
callback (for example by changing the underlying clock rate via
clk_set_rate()). If the codec sysclk is configured before the CPU DAI
applies the final MCLK rate, the codec may configure its internal
clocking based on a non-final MCLK value, leading to an incorrect
clocking state on the first playback after boot.

This behaviour was observed on i.MX95 systems using fsl_sai with
downstream kernels, but the issue is generic and can affect any setup
where the CPU DAI finalizes the MCLK rate in set_sysclk().

A reproducible symptom is that the first playback runs at the wrong
speed, while subsequent playbacks work correctly.

Keep the existing default behaviour (codec sysclk configured before
CPU sysclk) to avoid regressions, and add a DT flag that allows
selecting CPU-first sysclk ordering when needed.

Example setup:
  - CPU DAI: fsl_sai (i.MX95)
  - Codec: wm8904

Reproducer:
  aplay -D hw:wm8904audio /home/Front_Center_8k.wav

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 include/sound/simple_card_utils.h     |  1 +
 sound/soc/generic/simple-card-utils.c | 39 +++++++++++++++++++--------
 sound/soc/generic/simple-card.c       |  7 +++++
 3 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 69a9c9c4d0e9..60ab4df8e954 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -63,6 +63,7 @@ struct simple_util_priv {
 		struct snd_soc_codec_conf *codec_conf;
 		struct prop_nums num;
 		unsigned int mclk_fs;
+		bool sysclk_cpu_first;
 	} *dai_props;
 	struct simple_util_jack hp_jack;
 	struct simple_util_jack mic_jack;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index bdc02e85b089..f5b851e7782d 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -501,18 +501,35 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 				goto end;
 		}
 
-		for_each_rtd_codec_dais(rtd, i, sdai) {
-			pdai = simple_props_to_dai_codec(props, i);
-			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
-			if (ret && ret != -ENOTSUPP)
-				goto end;
-		}
+		if (props->sysclk_cpu_first) {
+			for_each_rtd_cpu_dais(rtd, i, sdai) {
+				pdai = simple_props_to_dai_cpu(props, i);
+				ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
+				if (ret && ret != -ENOTSUPP)
+					goto end;
+			}
 
-		for_each_rtd_cpu_dais(rtd, i, sdai) {
-			pdai = simple_props_to_dai_cpu(props, i);
-			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
-			if (ret && ret != -ENOTSUPP)
-				goto end;
+			for_each_rtd_codec_dais(rtd, i, sdai) {
+				pdai = simple_props_to_dai_codec(props, i);
+				ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
+				if (ret && ret != -ENOTSUPP)
+					goto end;
+			}
+		/* default: codec first */
+		} else {
+			for_each_rtd_codec_dais(rtd, i, sdai) {
+				pdai = simple_props_to_dai_codec(props, i);
+				ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
+				if (ret && ret != -ENOTSUPP)
+					goto end;
+			}
+
+			for_each_rtd_cpu_dais(rtd, i, sdai) {
+				pdai = simple_props_to_dai_cpu(props, i);
+				ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
+				if (ret && ret != -ENOTSUPP)
+					goto end;
+			}
 		}
 	}
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 5af6d1b308f2..a16ead577f50 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -188,6 +188,7 @@ static int simple_link_init(struct simple_util_priv *priv,
 	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	enum snd_soc_trigger_order trigger_stop  = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	bool playback_only = 0, capture_only = 0;
+	bool cpu_first = false;
 	int ret;
 
 	ret = simple_util_parse_daifmt(dev, node, codec,
@@ -209,6 +210,12 @@ static int simple_link_init(struct simple_util_priv *priv,
 	of_property_read_u32(codec,		"mclk-fs", &dai_props->mclk_fs);
 	of_property_read_u32(codec,	PREFIX	"mclk-fs", &dai_props->mclk_fs);
 
+	cpu_first |= of_property_read_bool(top,		"sysclk-cpu-first");
+	cpu_first |= of_property_read_bool(top,	PREFIX	"sysclk-cpu-first");
+	cpu_first |= of_property_read_bool(node,	"sysclk-cpu-first");
+	cpu_first |= of_property_read_bool(node, PREFIX	"sysclk-cpu-first");
+	dai_props->sysclk_cpu_first = cpu_first;
+
 	graph_util_parse_trigger_order(priv, top,	&trigger_start, &trigger_stop);
 	graph_util_parse_trigger_order(priv, node,	&trigger_start, &trigger_stop);
 	graph_util_parse_trigger_order(priv, cpu,	&trigger_start, &trigger_stop);
-- 
2.47.3


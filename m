Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7267419925A
	for <linux-sound@vger.kernel.org>; Thu, 25 Jul 2024 11:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721906642; cv=none; b=PE4gsuffpuIjpVfAY86w8g5KJV3plDAu0ToLb/agJi+Hwq6aWEIPSYREgkC4irNbivFK+mCECfdz8Rqi5f3QrJQBVuXRnSBfB3QhZY1ciZ7buSbbx9iwSsMQkPb1KSAOW/ry9/P+lWV7qHprlh4IzCS6DDHK7Ci0+H3PYqutnpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721906642; c=relaxed/simple;
	bh=5CQP3ouvzVeAmZXDUgxf/wEYJYDXjNwSjcV+BJjz67M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GcaLcwdh9mTL1V6oq6Oiq35XDEn/WO9hNpJ7CnmsF08/lvg+pr4m0Uq7qeobqeRx1fxzYAQPduzoaf7GkLN+NKEd0VaeACIXqiZrBzcODMUjgt4Yv7mkuqC3PVVoI8jc2tsBuxK6SK7op7mBQS+J99SHVs96JAUCSr4YwIxUXD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=inNj7b9T; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="inNj7b9T"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42803bbf842so8049595e9.1
        for <linux-sound@vger.kernel.org>; Thu, 25 Jul 2024 04:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906639; x=1722511439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fToOtqS0kKV1Bi4vu3PvCh9iIoxoPkBbmgMcbIcPlE=;
        b=inNj7b9TMyydzxALBr9y26sGdUgitxPWiBFYR14gy93ymjO4MJATJBwwQgRlKypE6g
         tWV6BhCQTJfqdnKnvezl592VAEQG3eXUHSVzMSLdiyQ9FSrtB+TYqK9tXftPrphILzSY
         lBeVD2EqNEiyvw74FJAMZPQxJHc0XXmmYbiIBbpaogX5zHhmwgbMdCqhu3TnLZhq4taP
         6zYJTttywCtjV6fp/f6IQFm7j8hBhNKeSt7hhdJjmSL+qcTZCoasFIqyp1xu5XOPRBsf
         jMKdfE2UezS7FjErGnmaGF+SNdt5qpFvWN6VH4QWpcISI8ZwmosITmBOJ6RHRAJGhRfQ
         Jy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906639; x=1722511439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fToOtqS0kKV1Bi4vu3PvCh9iIoxoPkBbmgMcbIcPlE=;
        b=H+OJQFAtHeKWP3bhvDEclq0c0BfIu/2AZcr5jB3RHBxrwL7jx+Odrcqb565Pe9GTuj
         JTeUgvttDy8/aNhjjef3HDRfS/ZKYfDETNvRabh4uI62uqxD6sjx2OzCONBRkkJRRY1X
         0r98Q1WORECx4stN5aKUPCbZdIihVylJLzJvxtmyGgmBCQuv6TxJXR9ZXOly76eafNQe
         1wtu/vyylxgZkfMMCT+T/2VxfCTXKvxEKF8DB+u2onX/0ly+24fu6HdIALyH5pQ4GnCv
         u+AfcxLDQSGUMZYRs/MUdohu+vuEe50ZVzPuY56GJFwX6HLGltfpmW+PGPUuzLgyZwLf
         7O2A==
X-Forwarded-Encrypted: i=1; AJvYcCVUJCnj+/+y83CgazgkKL9mWZvhtBHQtR7tG2zcnsrtSXa2aHV2Hl+agSgcyE/OwLPtimKJaZg8xvtnRhm8Er/OPt+OZlJvysuphfU=
X-Gm-Message-State: AOJu0YxuTqRJ6wE+k8ODIa0H9zGFBRuP2EzG62eXSjnkOYQHb2NVPWjh
	IWCWXdMuDVGMsJVQzttXR/rq+JEKohrLOa+Tl7Yp+HcepTQ/LkTUhnf1n7zBdEA=
X-Google-Smtp-Source: AGHT+IEuxlhuA47wx7C8GCGxX+LExydeHoLlCtkkUP5qNZTPhq3tlYtBxbrdnheckT8irzJPS6ef+Q==
X-Received: by 2002:adf:f38a:0:b0:368:4def:921a with SMTP id ffacd0b85a97d-36b3643cb45mr1498960f8f.48.1721906638645;
        Thu, 25 Jul 2024 04:23:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:23:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 25 Jul 2024 13:23:45 +0200
Subject: [PATCH 3/7] ASoC: codecs: wsa884x: Use designator array
 initializers for Soundwire ports
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-3-80a03f440c72@linaro.org>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5CQP3ouvzVeAmZXDUgxf/wEYJYDXjNwSjcV+BJjz67M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXFWrIz3WtjJoBOP8BBCNGDTmV3JawrbHX3x
 ChTfPiw6ASJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1xQAKCRDBN2bmhouD
 10kSD/9V2Bpj7WduD14hnA0+M6g8eql4Si1kTreQJK/xO5Qof4b8A6QvqSF8i0iNaAbhdgNH21G
 /GnyBMV8sQL5iGWX9BlwiA6Hf3Ja6ucNBawP+941K1Q8W0Oqbb1XeDnU8FQsK8UAFCckuzewdn3
 gY/XUmn0mcQiTtjzgI1gaWX7/w8LCXE+z9lq81jyw9Cfyd4tasAGCOahNG/VpkIFdGVGi0KwCZq
 WFk0T6VvJs0j7cXpDKsxneGwtFuepjO/f46GRPgLSnY0D43A50/fgRcStZ655LsammpUi37OT8R
 CyTRcwUdgWtidpv+DfSlr/VzBfLwlwMqUmaPcMhqWBx1cRTHCFWk4SedaF/OWFUSYPvxalW88+1
 6dpGjBYYBUMeAwPpBbhzQkR9GGd/5+ExpVlOrkh4j3ZRWDRMGIP9sMgOKJXIB/OlbGcTJY95BOn
 ttI8OAR9Irn02fatjs/aTdgZblVm5cI8ShzKXouXDOFmFXX2rj8UTVTjYsdiNBFKKk1FQFG6N5B
 DdwHI9HfNpD9g0tJmtKdTLu4FBGD5PNNYNPhVLqkCBGhtNOe5fNlbVIXQUx4Q5Dsuk+q6VVqXz4
 PpKk4cOu9XapWiBZ6l2aEf/JPkPgQ4hsGIO2JkC7j8hS3O9qC4Gcj5kJV0vF7yRtRGYcHuaiehX
 aMmdTKZ2UvSfA4A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Two arrays (with 'struct sdw_dpn_prop' and 'struct sdw_port_config')
store configuration of Soundwire ports, thus each of their element is
indexed according to the port number (enum wsa884x_port_ids, e.g.
WSA884X_PORT_DAC).  Except the indexing, they also store port number
offset by one in member 'num'.

Entire code depends on that correlation between array index and port
number, thus make it explicit by using designators.  The code is
functionally the same, but more obvious for reading.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index d17ae17b2938..d3d09c3bab2d 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -782,42 +782,47 @@ static const struct soc_enum wsa884x_dev_mode_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(wsa884x_dev_mode_text), wsa884x_dev_mode_text);
 
 static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
-	{
+	[WSA884X_PORT_DAC] = {
 		.num = WSA884X_PORT_DAC + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
+	},
+	[WSA884X_PORT_COMP] = {
 		.num = WSA884X_PORT_COMP + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
+	},
+	[WSA884X_PORT_BOOST] = {
 		.num = WSA884X_PORT_BOOST + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
+	},
+	[WSA884X_PORT_PBR] = {
 		.num = WSA884X_PORT_PBR + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
+	},
+	[WSA884X_PORT_VISENSE] = {
 		.num = WSA884X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
+	},
+	[WSA884X_PORT_CPS] = {
 		.num = WSA884X_PORT_CPS + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -828,22 +833,27 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 };
 
 static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
-	{
+	[WSA884X_PORT_DAC] = {
 		.num = WSA884X_PORT_DAC + 1,
 		.ch_mask = 0x1,
-	}, {
+	},
+	[WSA884X_PORT_COMP] = {
 		.num = WSA884X_PORT_COMP + 1,
 		.ch_mask = 0xf,
-	}, {
+	},
+	[WSA884X_PORT_BOOST] = {
 		.num = WSA884X_PORT_BOOST + 1,
 		.ch_mask = 0x3,
-	}, {
+	},
+	[WSA884X_PORT_PBR] = {
 		.num = WSA884X_PORT_PBR + 1,
 		.ch_mask = 0x1,
-	}, {
+	},
+	[WSA884X_PORT_VISENSE] = {
 		.num = WSA884X_PORT_VISENSE + 1,
 		.ch_mask = 0x3,
-	}, {
+	},
+	[WSA884X_PORT_CPS] = {
 		.num = WSA884X_PORT_CPS + 1,
 		.ch_mask = 0x3,
 	},

-- 
2.43.0


Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36133221738
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471809; cv=none; b=rU/BTkElDYF9SfKVJwdVJW/1YGatz9zhnmtBaNBH0muyGkAPL/PU/7SOLNovXqWXY8LkCVHc2IgE2bV+eDBRpK0vG1BFy04hAK+vHYNZjV4IPyIAtzZgqWRNazMdnUYKprhQHbSVrzg4B59R3XC0gi6T77r7U9IrZ1l2m+VpxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471809; c=relaxed/simple;
	bh=4AJV0s7mSzqRnod0IJbbhHfzS3X7gQWivXwTjoNldIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iNmaA4umWs6ab/GLKr7fvAwMw1o7E1FUVwcJ1lxfCgM69y3lkP46IwjMB3Wk3fNBwk2i9/z5dyYuC4uaCr5ysu/WSBGOq9q6ixQJU6deChWUZKTfeEiJSiYppztYAK0dtdhBItfLpgsnUZrc9l45f41VtHRDRF2Wun/oh8x1DhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ifyhp1oR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ifyhp1oR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf257158fso4288855e9.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 04:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742471804; x=1743076604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBCmNhzniHSIN+wQEnk2+nLTiD4hT6KTCngq0hI3lqc=;
        b=Ifyhp1oRnnC4sN62R/WptYeQvZGEUBpVOp9IwgCL0J8Vbdffj5mff+BZtCOQ+lZzcx
         Ve40B7EKCfFRP5gtqLTHBYTOHjs8B2LGIUNgHgoLX3koqGe77jL6oZw1obd3U2cwKslz
         PIzq+RqYnlATD9rqzv8+n0jzuY9RLPe25dVoViMDxWhln+xMBtMxOO7GlJtxcK5FZMGS
         nt3iy+W7AWV2lAjt7EeoEAj4TqdaLx8TMuA3FUSA9MH10NDOblmLp7BnOcMjLXLUBJMF
         hmSjEcQdNG7BNO06qQfDGndDp2MDHNqoo7G3sns2l2JAYNko4km5Q+9+NJKbaW84GO/p
         hqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471804; x=1743076604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBCmNhzniHSIN+wQEnk2+nLTiD4hT6KTCngq0hI3lqc=;
        b=OKNK9U9iElMTOKzwvMW1DBipVoOdAmLV7mFMBBI+d5frQbxQL6kcDm5t0tOfU7PBu+
         di0qHZ52Ci9Kp1u5TOV+38MbawDZcnPfl/cT0UcHqo6W/r41go8AQWuNX+edvjWhgYap
         TZtIjpOnDwAeZ4eOkZULildpD0KhZgzuXYowxq/0qJPiQW5rHxf5MLpGgCDeJ7Pc+0qe
         eqvwFZWebtxcQ5N+RSGqS059w5uKwIimEY7KIup3VFx6lc3lAhvKImqqbYVN5a8b7lYd
         jfNQdgk4YU/4KxTz7NzCVqfiSx8FjrCoUoUDLezsFIyR0oMS9hxhn7D2mPOwlGDr+6XF
         18Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWZlKCS2TZvLbHfE27ZN3waQ+ZDC5zccmpe9yCADjXyXeS9dk6DrKbt7O5HsMk5SBKnuy5Rkco11lsO9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Dn5voSKQKDUAqxUdRwBEAEqWTVW8T7dusqhSGuaHF7YtDprw
	BuSHRerkc9ai2vkrQ75ksbb/hH+WJIu/MwYT/95CvpxvoAkx/pjh1lHSOSO1luo=
X-Gm-Gg: ASbGncsaYPrz93FLRfY7L2MHXfANq1whQr971umjr4yZKOeKCZFbT7rv8qKpUFEZNeX
	sr65bHYpO3zmGzFhFt1ZN20lkl2it8pWBILFAR289jYFfiMZuhVJz65j6X2dm9JpMrq0fqJ4BlP
	l/v61FKtajNrVUh+nGdWTxXzeX5RGD7Odmgpf8QcjmTqutBcZkEsko0pnfCMvvjKRiz2DiKQuX7
	eI/ywmm9hUlzQQohyMW/YyIAJYrsVXqgt5QXJL1eUjFISLPg1UdIqJssZ00Xd4sUYGHYJs9hi6S
	0u5KQQtZ7q6xP+leSZXYGvpmn738Ite9jKNmJoAcaEkiUgLd8/MRc/tkwGvbd2Ay1ES86Q==
X-Google-Smtp-Source: AGHT+IEr/g/3zNNGsPb3MI+p5RQqCRdJkhbtB0m0pNpWH0rWHF6Zo3XyME4aG36BJnRg/WaBJjs9sw==
X-Received: by 2002:a5d:5f8c:0:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-399739b63abmr4972255f8f.2.1742471804493;
        Thu, 20 Mar 2025 04:56:44 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm23257857f8f.44.2025.03.20.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:56:43 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 3/5] ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
Date: Thu, 20 Mar 2025 11:56:31 +0000
Message-Id: <20250320115633.4248-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi mux is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable.

Move to using mux-controls so that both the gpio and regulators can be
driven correctly, rather than adding regulator handing in the codec.

This patch adds required bindings to add such mux controls.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index 10531350c336..e7aa00a9c59a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -23,8 +23,13 @@ properties:
       - qcom,wcd9380-codec
       - qcom,wcd9385-codec
 
+  mux-controls:
+    description: A reference to the audio mux switch for
+      switching CTIA/OMTP Headset types
+
   us-euro-gpios:
-    description: GPIO spec for swapping gnd and mic segments
+    description: GPIO spec for swapping gnd and mic segments.
+      This property is considered obsolete, recommended to use mux-controls.
     maxItems: 1
 
 required:
-- 
2.39.5


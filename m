Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3171B5EB5
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 01:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800376; cv=none; b=loVmqPWaSP1UQ/K5bvj0H/IedoDQ/LUL1mPxlN2bKEbnnkW/1OrBDVejR+sXV+frElnl71eBbuB8FYNT+kOOdWBBNGqUvlgy6xtNn0EW8k8z5qJVqzPI2EYgIexKH5ukJtiKSHK+Rih4L+f+jeOvhjdjlyVJmB5oNXxOhLgTENI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800376; c=relaxed/simple;
	bh=vL4Yi7zJJBjUr0fygHKbwh/sRmJU8/5N2tEVygj5zRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JFbUkkCS2sIfbYfX4PbniHDd5CSRCZitnDjHai5PfX4erjcITjtytdSGhzGqIAkHqhslfFJQ2C3jfqBKFEhl2AA0cKyJ3DUmcX90WjEAULKnADMJ71D9XBI9YuuPM/zDYBLH0/Tui3AvXR6DCABN5KJq9DL3mBvYfoADUvULAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z/HYKk7f; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z/HYKk7f"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so33643335e9.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Oct 2025 18:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759800372; x=1760405172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Gkze1PZ3B1F2WvEE1HfylRm4/KyG9IWdPsitRWLnyo=;
        b=Z/HYKk7fplekLTjZJ0mDOTaB4TXrsfE6jqx5ms0AQICAnCG+HWGSo77JWmMZuI72Hi
         /E0zo9Qj4TPg3oj+fZq4aydcAva7agLdzeNZ8J0S5uc8dhVv2dVNH03lOEpIIytoSu9Y
         ZAjLDBn+FxzEuw5J7qvn3TL7CzX8WuV0H0kUVTvtl5uw0DI/8sC17ANM46/HJqQUuVa7
         zvt0fxQ7l1Z96VFtM3hTgHb49gZAktlXlvZNbe8HCVfsqMuXGWQLG04Ec1Xap/V3jt8e
         7uSIv3MaXoJOPpIrWYb9MeaOZyiQxc7+ZFGmj36hEMVkMkm2GYU8Rb9wLoSNMin+/Qb6
         PZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800372; x=1760405172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Gkze1PZ3B1F2WvEE1HfylRm4/KyG9IWdPsitRWLnyo=;
        b=FJ9ul0zW7xLImGioNMyw6CnyxDC5BhUz1xcYIWN+Iw4Jzm8ydEz75brqkUOH8o2t1u
         f5BvRms6CwQ5S5fFyKGVfw2eedmt2XkDam0uRC2NXqv6qf0O3giAmwaEwkRG2ZOxjDBZ
         mfM/Q6++0YURy2bDSalnrnlM4w1ZpLd9dJO5n0fAqXdo24TrXVgB6fjLZk01vdEuET6W
         MubyLGvgtocG3OfXGVTD5Bxq0dI92e0uhwTuNywixIecCcXPTGH9MMBtdLw9ZWeMdsmv
         HF7SjzhP8DrwEDqBT9dKMs23EUQa8FosrS1PPW85gDBACHldzOBQTiAlRxv60D9sGaAD
         yVzw==
X-Forwarded-Encrypted: i=1; AJvYcCXl/VlroQHEmOfGyVRGI80jtDL7qIyGhHdKedDgDi6YA79shoYlSz91MyTmZpVSTb6kVGPlsggSX+e8ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1xL1vZA5arALeTu2ZJY/07cNa4+vGWlxsr/cjdJ0k3kWI457F
	hN7OcsMO6dFJl7inhz1PN5hRuo+NKZoUKdGyD8rUlG03/j//qmwEclA59ZupvF+oQx4=
X-Gm-Gg: ASbGnctjq0ek21dWtFPYeLOtWhHEcVsipIk4aD99pE62+zMS9LKjNe+g29QOTxpcAAt
	DdRBtQV0q5zXw7aw7YeBt8SzFlws0gkjJ4rCJucsUPFyAp+VLUKV/9l4g6tQUt94V+xMHZWZMyd
	tqVP1JOv2y5g7iZgbvJ906KvG8opFRt3vTPD0qFxuvQ9LIgLFBAsGUMe3veraz6L2xWOCJzfN8G
	jYGkeezz2619qreNjF/AdZLrRknEBbmSUkTOcurtVomWfLaJRiNBHvt+15CMefdmXH2WuC0ZtRr
	GiATAU0EZlCi0c2I5pXfEDvT7gipl0D9sh4Z1twHL3ul5pnf5GY9aiFMqWzTICBOqKBB6KjVRIk
	bTzXOqpLjASZQjbhqv9Q1YhFEzEROS3uZ7K03ObjZ71yr6wzXsTnnrILf2BcPsSq93GIw8QVKrI
	euLg==
X-Google-Smtp-Source: AGHT+IHaZllh/8DB+xeKauD0rwLpbID128BEf2oUn62u64beA/QXNf5q8CSKvTkssxIfyn9Bav1kTg==
X-Received: by 2002:a05:600c:1f0e:b0:46e:3978:ba71 with SMTP id 5b1f17b1804b1-46e7113f659mr89603085e9.21.1759800372470;
        Mon, 06 Oct 2025 18:26:12 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa2d52a71sm7410915e9.1.2025.10.06.18.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 18:26:12 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 02:26:07 +0100
Subject: [PATCH 1/2] dt-bindings: sound: qcom,sm8250: add QRB2210 and RB1
 soundcards
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-qrb2210-qcm2290-sndcard-v1-1-8222141bca79@linaro.org>
References: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
In-Reply-To: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add soundcard compatible for QRB2210 (QCM2290) platforms.
While at this, also add QRB2210 RB1 entry which is set to be
compatible with QRB2210 soundcard.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..c29e59d0e8043fe2617b969be216525b493458c4 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -21,6 +21,10 @@ properties:
               - lenovo,yoga-c630-sndcard
               - qcom,db845c-sndcard
           - const: qcom,sdm845-sndcard
+      - items:
+          - enum:
+              - qcom,qrb2210-rb1-sndcard
+          - const: qcom,qrb2210-sndcard
       - items:
           - enum:
               - qcom,sm8550-sndcard
@@ -37,6 +41,7 @@ properties:
           - qcom,qcs8275-sndcard
           - qcom,qcs9075-sndcard
           - qcom,qcs9100-sndcard
+          - qcom,qrb2210-sndcard
           - qcom,qrb4210-rb2-sndcard
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard

-- 
2.47.3


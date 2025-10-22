Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF5F224AF9
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 03:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761105537; cv=none; b=Zz0aXNWIME+KWZfWZidkF+Zch8icOQR3RVxLZH212f6wbnmjZ78vDdYXSKUYCijftQmcTvEeyT9Z1Yao0XRqHR2WyLL5Y2r64yTx4imDiQ8rT0bv0j5FgwIeZsSAoqTwUTpwnIjJXsm+qj8P4MAxO0ufbaVMDmEVnW3Kq577qk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761105537; c=relaxed/simple;
	bh=eD3Ij+lZtQ4DnXw+Tr7kovgD0K44T1dMGiw6LsDx7yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QnKStzLjNUUw5YjqVH1Kt2JD6kQTVWwbWrbWrvcWcSBe6hs/uoALphI5EqQ/gzuG89nUgwMfm8ENEd2KTHVIWAxhlXRObCY3474b5r93TEKwDQsdd2W3O832E8M+vNQkqrNc+NMnt0NU558PkZ2agSjoisgmmi8SHcasCvn6fjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dFRM3Pg0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dFRM3Pg0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4710665e7deso24142545e9.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 20:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761105534; x=1761710334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o57tAm9bEj69a+6wod50M/v+YTegpl9/ax57TD+w3u0=;
        b=dFRM3Pg0f2OFxMUtUgawSWaBCgTFe1/4ZI/QAe3QXChhMl4VFst0EfQt/udHx0JzUJ
         H25/8moVI2BLRyT8JKcK08/89aAjAM2zEy77JGWOU7RIOqFi9hyUBEqEqPuVePc/3aHd
         FD1uNNvSgmIjJEe01WBsIFK6bTiflR9lCPj2gW1OagZK/IXd/x89ACAP7gH8ewiQi5iv
         7ndKUoUDpuZSfeSWS0NeqI7AtCbZkDM6YNpSFsKMfT2Z6di0fHc/T91jo635XL7q81/6
         BmqW/25xVk2lUZWRN1UsxGtPtZlQYuPUrvIaRHj0bSWQiSmd8fpF6WAnJFldFupmqeVo
         rkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105534; x=1761710334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o57tAm9bEj69a+6wod50M/v+YTegpl9/ax57TD+w3u0=;
        b=V6A83e3J8ZzW4mLfs9NPA/kous8KeWm9c/14lFC5LTTK9iOy7dGFFCuBU5U1ljYBLc
         lGVj3KkBrYgQNTqAdDktJYK5O9r98frRHPkwDXgHdqs1z+QZXsNff6VdjikyrP+hbA2b
         sRNrzE6yWYcpjdRe0qV+jk/3gxJBdHDncZLe3NhUaSFoQPM3Uj0mu0N7sOg4bmcYvQbG
         JL7akIV8ii0ePrUC1Wj6zZh5QxCh2sbiPyLBXFTGilv5HhkahejWHi+JL6uFmF3ZahFr
         wxiTJ2/+qwDoKOIAzYf0GDcY5+xPoUbSQ5umu+4fCIcA4y6qpcaE74hOmPyQiwq7kRZe
         Yz1g==
X-Forwarded-Encrypted: i=1; AJvYcCXaP7YSmZaUh9+ieozcgMBO3GyFIgpyHcg58zyjEYt643tst4UGB2NlrAunZnf7mMpEKgI8vQau5JCqUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrC5TowZwuEwmKe1Bm21EF73EB92rwWsqI0cAP7qy+69l0bok6
	EQ127aGVHSHaMu+YJjGS1EdLZsNh4KPpavrq0eQH8TDBXWieOioV95enmLPKe2z1MPE=
X-Gm-Gg: ASbGncvyMB2R0mwXa2x/L5P1aJmtAp6rjNisFuQ+ApX7hpba6OPCAXcd1qvgKQi2wFS
	toCoz78yu11ZdUDTd65TNXD26MU1q5RJLdDkvw0CrSpFBsFaUZqU1mWDLO3qqiDr3LZGSH3yxDm
	fpflsygB6dTzAEW288aM0rGKIS213YZU+T6nYbukJuvQc1ShIk2NXnCwFQeKoHd2fOf/GSr5QE9
	daN06mkhu7Ka8MswgFFnXpYdCYPjkOc0blD/LxHvT7FH9vUt9K6uRdz+h8UhvxIoPzFbzYJytLS
	hCDg/0WgJ/aWYkx2n/IBxnL4wHEBZZqJY4UeZjr7xTXKjyMFcU9GzAt11JnTDtQWwb+fdGY2qTA
	JhnkzRg8gXmtRkuejjxsof6APtjHgQi5gq+YkLFtmLzgMw9ONVOd6OQss8YkNIYId30WbT/mhYY
	rZFc6mlnT4GYlzZ6rL
X-Google-Smtp-Source: AGHT+IGn8Otegez7YT97/Q+RL+NH5eMmlBzrdp9SHgbeYCrM+gFyib3bAAvmS/oihsg0BsFmBaDKFw==
X-Received: by 2002:a05:6000:22c6:b0:3f0:2ab8:710f with SMTP id ffacd0b85a97d-42704d83514mr10579228f8f.8.1761105533675;
        Tue, 21 Oct 2025 20:58:53 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a6c5sm23637639f8f.28.2025.10.21.20.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 20:58:52 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 22 Oct 2025 04:58:49 +0100
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom,sm8250: add QRB2210
 soundcard
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-qrb2210-qcm2290-sndcard-v2-1-32e9e269a825@linaro.org>
References: <20251022-qrb2210-qcm2290-sndcard-v2-0-32e9e269a825@linaro.org>
In-Reply-To: <20251022-qrb2210-qcm2290-sndcard-v2-0-32e9e269a825@linaro.org>
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

Add soundcard compatible for QRB2210 (QCM2290) SoCs, where the older
non-audioreach audio architecture is implemented.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 868acc077046596120ea7f427e802282ed03c853..15f38622b98b904c4107f4800cd1a4159191fda9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,qcs8275-sndcard
           - qcom,qcs9075-sndcard
           - qcom,qcs9100-sndcard
+          - qcom,qrb2210-sndcard
           - qcom,qrb4210-rb2-sndcard
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard

-- 
2.47.3


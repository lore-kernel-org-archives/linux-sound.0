Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AB4188A1A
	for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 16:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724430099; cv=none; b=oLMyjPxwH0wz1LOppVfIGCKkvZUl4m69CNzhLedhkWQwcMASaj7wcav0HkJ7BPUXk4j9PVuomQlzNyjSdZc+55eSaUj1jiv1KFHefn7NY8qNUAoBIa9MdWSNo/WzDM+DVq82Xf4m62hARmijBDjufhsleZYWzx8yMrg26EKbLwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724430099; c=relaxed/simple;
	bh=t8wiOfrfxHEMnbl35BDG8oU50OIX2ALJxv77a7az+48=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M1bRB8Ck76vuuDx0LGWESlZRnD4BOjh+hb5uib9ATUV8PDasVqQZzpCZDC5z4ku9YDfuskLh2j9RKMFarfiLUZtsiGLAjetNHmjUcLygCruK/L+SVmZlODpEh/w8caSTaM9SzaMRAHvPw/rcmeYwOqKjO8APh1JC1rM+GeILLj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YjpVH7vQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YjpVH7vQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4280ef642fbso2703745e9.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724430095; x=1725034895; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T6brdorWdeo3olaFVOr6JBX5PiDBOs1+M1ab2Osxxjc=;
        b=YjpVH7vQ6U2z1P51A3fewZQUhkcpYIrgEXhRGWC/4cFQJSik9TZ+E7Uz/Tjw3mXHVl
         sBrUvwBOK1h9etNE1BY1z5eslsElFj8pdnDiVlMQBBCMg5ikUi9tC3+HF4lVerJhfbva
         7bEGb5kMZhaVHx4lPChEn7ISHbHb+BdYev+ZYO/2Mt0b5ZjRzkwzdLwE/Mz6S6VhgpDR
         pi93yeUPCbKiQMnJl4Fln/eWXIuFdMTNpNETGk2BNxk7yMTIm4nXATAloZvj5kX69Tx6
         6HiVbLn00wj3pJ34aDEgbxJRKQ+cAEfPHb72QYLo95IBOC43DUws2VdNkALHqoaLuDmL
         Yzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724430095; x=1725034895;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6brdorWdeo3olaFVOr6JBX5PiDBOs1+M1ab2Osxxjc=;
        b=sdSx714CQ10GrKGj87PoReDYpkdVmPu0asBfmVb6ZUPQ53KrPy+vTAfnXIEGzw+dyj
         K2HMTMJtPMpuBsyEGMPveRTKxffLgBtlt74LXvfjH2xCN2+HyTxcyTMOpu1sQCg117lz
         gm1Pw+fcvfpK3QbhDHnnHxVgAk8VqyHhddPRDRD4I0uK2U7YWsnJjVNGLKzO9JycWNDo
         ZwJKO7ZqSwMni2jNQFhNHNwMslgiWtYo7pDfV8ag/S9ZAek1GnSb+NVk+Qw1IgED0U7P
         BvEvGiHN42drTd/Yj7JKNItAhpSOkF4OcRv705gQFhBxppAJheLH09jdnKU8QMtXy8s0
         N1oQ==
X-Gm-Message-State: AOJu0Yw7B45O21hhEWBY1Brf+RcqOg0CEC/1O6s+PBQdASmHq0uF7PMV
	wha9JNkZYB1D7lk8D9Qvmc8YrNvppUJeoqi4QW5KgElea+SIrKmurKqiV+enACQ=
X-Google-Smtp-Source: AGHT+IG+GcVyfLUH2h3KXyDS5NcNh4UoP9nzPczNHsu6N0/bkLLePsJwDESHKkfOJzTByL56oLPdYA==
X-Received: by 2002:a5d:64cc:0:b0:366:eb60:bcf2 with SMTP id ffacd0b85a97d-3731185bd1cmr952147f8f.4.1724430095448;
        Fri, 23 Aug 2024 09:21:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308160586sm4499312f8f.58.2024.08.23.09.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 09:21:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] ASoC: codecs: wcd93xx: Simplify locking with guard()
Date: Fri, 23 Aug 2024 18:21:28 +0200
Message-Id: <20240823-cleanup-h-guard-of-node-asoc-v1-0-2349bd7fb7f4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAi3yGYC/x3MzQqEIBQG0FeJu54LZr/MqwwtTD/rwqChFEH07
 knLszkXZSRBpm91UcIhWWIoqD8V2dWEBSyumLTSrRp1w/YPE/aNV152kxxHzyE6sMnRMsZZoUf
 n6wFUii3By/n2v+m+H0dxgHZuAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=770;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=t8wiOfrfxHEMnbl35BDG8oU50OIX2ALJxv77a7az+48=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyLcKD+uG3HcTZUvqhDKFW58Daipckpqa/Buz2
 cwjqumM5aCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsi3CgAKCRDBN2bmhouD
 1/JND/9PoGdcTtdX3IALyCipieeGjOsL+lQ35HjRLChOlpXgT6gB9cGBNGRMpdYRjqqVRkEqGXn
 Sr+UYYLO3PKpIFfqTnJ3hggq+ymmaf/BTn7oMSw5c6Gi4KGI+y8HpY+w5x7GpSo9mqwb2n1fccl
 lIg7G08wNUMJrxAyWo/AfU6JY9l6u7SqcRZUnxPxRdietwCXGlLuMYQSvSuDvM+y8Wi+yruP2Qr
 AhiZ6JfyYkpUWeR9nUAKFdi1Ctsl/5bxy68No8K8DJea3lQfjQDG3S6uGIgju3EqhaBG9HbZvmq
 qQAQZeQ09QVCCawoFQnXu24xCV7izakesuoPm4HQRMb0Swt55sSFgZ4C0ciHiqBDwpNPpE06TUV
 DPDlzFRs+1pc7EtO/jAjadbAI20G9fJqPNjt/wB+IiRqueAPU4jnB5KSup4MbVulRaZ8O6k2urC
 J25vyu1jqvI0+Y1Mr3IK9nIyDkAIy0RVzx99dKXsr3tB0VI0AEa4bD4D4kC7c47vGaWpNrGYF17
 lvZ3oB1FTyjjMF4uzBaEIxlDgkbCx5atEtqku5JTk6M7xjYB4DGjNTIosbsIwTowFyZGg1jLPRV
 GgcXc8bKdNb9ZSvQDOUFQleIyeeA/N7LiUaOV5u9mtsfvKrhdHkRHA52snPXNnL+mFklcKJREe0
 U7aDsMyfXk15uLQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling around locks with guard().  Less gotos needed,
drop local 'ret' variable..

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      ASoC: codecs: wcd937x: Simplify locking with guard()
      ASoC: codecs: wcd938x: Simplify locking with guard()
      ASoC: codecs: wcd939x: Simplify locking with guard()

 sound/soc/codecs/wcd937x.c | 24 +++++++++++-------------
 sound/soc/codecs/wcd938x.c | 24 +++++++++++-------------
 sound/soc/codecs/wcd939x.c | 21 ++++++++-------------
 3 files changed, 30 insertions(+), 39 deletions(-)
---
base-commit: e188fd67a69319f3d105d9b90e424b8d1ff9580c
change-id: 20240823-cleanup-h-guard-of-node-asoc-e8b0e6e5f17e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


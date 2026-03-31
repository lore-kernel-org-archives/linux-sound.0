Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402CE377EC6
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 19:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985950; cv=none; b=KxoV0tbcU/OvZdevbVoEL/1wJYJ4LG+hhT7UvkyUrRtKG17EA5S//Nxawm6StiMx8JI3Ldr9xDqCzyv1ueRrdjZpObcJbzdTRoo3WBE54ANG6WLpi58xbX7brQ0oD0ippGe4Kle1Hv17NTkJX5gwN4/QckOiLzTdXK+X179b/sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985950; c=relaxed/simple;
	bh=PbEDnRTPGkTQYVIBOFEiCXHo/W0nlMVxr3pRa50aTCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FG+2aIE2j+zFZOpy0bHId2a3jjIG5AvuZ+CLbfUC/Gu/5zhN8vLP1MlJAf1+gLDU3jth6sVekx2KS4oyLKt2j403QlDmjlxXf+qsdiilqjo+3Wd/Yk2wj4cAzmodF2WMAGFDBE31vPGCeZ5wEoLL/+PHr04SGynB2Aqoybdrux4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLsQ2cFK; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLsQ2cFK"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89fc4147f2eso62081336d6.3
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 12:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985948; x=1775590748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glb/MBLiZE+shtD8YN2zjJ6EHK0kWv/fgZbWKQ7BlbI=;
        b=XLsQ2cFKK/BhzcG3nJOhR9O192cyJ7tucQ1Zfa9it0Ay9T1WwJnvITeUutEyfiHKzZ
         RYe3tv2+0Mgu12iXlh0RG2C1NJEWT7E2hBbHX6g7Tz+8gi9XKsiqr04ozG5nOGK2/zQI
         IK4kpr4uIXjOm8G5n5kZEkAnc0gj86uU4XSHN55rKsBq5W1hW0UepCJ8P6I5HE7Y2gEV
         pvy3H3H0R4S/cBCCIXsCXoBw1Bpn0EQm5G0dq0HMzzw0kEsSGVTRiP1lYgYfdGn+m6ov
         JrPhF84qGievtZZvnuwwuZG292Q6n49gyi10GtS84x4S9/lHGpZdxisbEN3aLjqqcBPR
         HNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985948; x=1775590748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=glb/MBLiZE+shtD8YN2zjJ6EHK0kWv/fgZbWKQ7BlbI=;
        b=TfJrVZIpouf15TFgUDbits7c9H5tjPVYTRHQimyyoL1SMa0LxYKl54bLGZZU7rTd/o
         AQ/+j+eO38dJMFYhN+R9nL7t2WAbHp7gnoG1zhIAQBT96+ecjx+tHGE6sund02KD+Oxb
         n+5QTcyDCYGtyzu+AJPS8K9GF9RkfQMUcq/hLAHmrDhLu8e3C8n76WdfD8KXeAeP0jFa
         Zfq63Q8EHDhPqfzCpSTowrTw8EjWCMZKGGRW7l/f3/MORUz8x2pnXYoR2xFXHt8+GHuO
         jouwCUuZgxEmOpu3MPw8YUvLHXE2NakR1UQb1u+BtFEWEw/3cQTdky2OwtvkyfU/0JmS
         s+4A==
X-Forwarded-Encrypted: i=1; AJvYcCXt2HrVbKdroS5ga9EJaOb5AgKalE9UGurYUbZ3eo7j16HPFOViFH9QwIigPZvR3Cp3QqxtnaMSgh5tZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiv9iUKaPF/GIEyPa33D6aopEHOBqjg6ZeYYKFRKg8v7V8XfSt
	p9RBxuvFw/nl5MEbhuJictfSg89qKvkK+IozCzVUwK8WeeD/kVoE/f3O
X-Gm-Gg: ATEYQzxdBbb8Yq7IWD5pPDu5Lf1wSdZi0pfne38YCGcodRgbBOoWyjmq4P8TNHYYF7j
	jGHJh0Egy6ObZOpmn6d/OhROuvGaCvibn9m6WNvchVKZZcmmG6nxySVOJWMvEwTso6fqanrUBIJ
	OzZyLbP27X9rNUWeJ7nFVr0gZQAZzf7+oYSpUPKCCU4qNQ7iVXmujd/LFUb0l6LXehYqy9sZarq
	dpU31rWjYEAUotu2AeLVEcC/9FBUcSbz3sZ+076jrkAnfpY0a/hEF2Djf2We4hUdkJ55NpGEqoO
	oX4Os7EupXXUKIpZ0bhhH1quSFcUm9qGL+D78T4glkME9w5cnSNaf4dbU4c4zQrFflZzUQ4ANTh
	TDC81ZdY42YseDcHtt/gsrNL2OY9+mu3JlFvWyLoxGSjzLdqCfMDgwLbBJFZnqyfPsraRr+7Fc2
	LgsvGOvSqlgO1gWbEFE9ihrtmr
X-Received: by 2002:a05:6214:2b08:b0:899:ea9e:31c5 with SMTP id 6a1803df08f44-8a43b518cacmr12388466d6.57.1774985948199;
        Tue, 31 Mar 2026 12:39:08 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecc1923c6sm97466226d6.22.2026.03.31.12.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:07 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 03/15] ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
Date: Tue, 31 Mar 2026 15:39:27 -0400
Message-ID: <20260331193939.40636-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Skladowski <a39.skl@gmail.com>

Document pm8950 and pm8953 analog audio codecs.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
[richard: add back empty line]
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 94e7a1860977..15389645a3e8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,7 +14,10 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8916-wcd-analog-codec
+    enum:
+      - qcom,pm8916-wcd-analog-codec
+      - qcom,pm8950-wcd-analog-codec
+      - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.53.0


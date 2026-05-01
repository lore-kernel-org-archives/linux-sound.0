Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2285F301472
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649486; cv=none; b=pYy/yUc9CIvuigj+Zbz7THFVO61T4xis+5XswR9vQR6ViZLvPc72gYtk0iRC9zeRBLDYwIYXc0JF8151jRuVMllf571WtS56Q77B3wt+LtQWtPZqJZqIwUB3MrtAKERjrWi/txMnZBD6ptRpK8A7KuffzKOE2LitYzEdhiN3JOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649486; c=relaxed/simple;
	bh=K/us0Zy5FZddFhfgjPkUdq/ry2hSBwBm1eiS3uRxCv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5spjT+s+BF9oE55BCLgnSLWhm8mSX4UanYpkW/Dq2zmQCAjcQ+Y6FT8inFZXzVNcDAcE9U3HlFACFo3gYQRUaXHgu4wzIfzJx27QLZnSJOPdD9GUCpS2locsK5J/gwl8tLMCBEtEQ2evWIgqyklbargiI0kq7qRHVLjB7d4Chw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyKT0gx1; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyKT0gx1"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50e614fdb42so16786781cf.3
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 08:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649484; x=1778254284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdpR8sjNdl6yN2sQRJHAcYExtu7/DPFnK06CpUvyYec=;
        b=hyKT0gx1degft0jdhyydPRQyO1eRxR8O1u83ndilwU60nfRiRwIfgpDGF4o2HfCO+I
         Ypr3CG2TuA2r8qfDpGH0iw7M+tBRNcGAf7Nz7YMxQ8gV3ZTbKIZr3v5HzYEO9hdKyjaI
         Dnr4LfOrB5P7vn6z8rL1dAR66QUZoIK/8jBMdATeSniwAD7Q20VAE7lqvvAydFWDIp9B
         sB8yGXKwnyzyddq5HZrNJPL0dTq9rEAwRMUBdjQQIAX0aSH8DDXHeDFklqW6K4413jss
         p0nw65KfP4AroBXunh5BLU4t4ZVlCmPWEdotLdxtqiJf4eSJYSP7GX2tSzQKisPELALL
         vcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649484; x=1778254284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BdpR8sjNdl6yN2sQRJHAcYExtu7/DPFnK06CpUvyYec=;
        b=qGga+vT+V1i2f1k29T2HKpZMZNQn9CTNb1q7/JGmtLIfoxYrt8DY9tma3X62wU7mwV
         V/lboOrIYh/4M3adwCWF/PnCEUzOtpSpqj8LLViq6v6fNwZuNMT/wopTX8+SBU3aaJDY
         /sbntoNhKEpzBtfNUzdYM56KouhAehN3zR0F0EtRbhoQj4AFdIS1Lwf3S0pDQubOslry
         5FZOhM6rEPPoX0rPFN7erfWXmVPZlMLB1IbnP9BGPLc9FB/7gSEj8V5hYV17cnRcjskR
         HW7KjxlJe1tN5x3+W0/Qvwfwa1FdnULaSLRdoAeDAW6A14b+T89E5+c6Pl9wDr7HfgQU
         hfwg==
X-Forwarded-Encrypted: i=1; AFNElJ+FeQh6JAJrXmKCvXRHOjl2BC2OaGkXF0AISfTTyi/oZffjMFM1MIL+VupEVQ4d4RAujLB/TVtP4T4Rfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykIoq3ra6qD+FngThE7KT20+xP4ay7FAAm5UfmOVJG0IPM217R
	pnKmcKtBAyO0+jdEB/hyfd+vh4La3UZ1QxVYMBnn5A+lu5wJTfuft62o
X-Gm-Gg: AeBDievsZ52HyBg+Tm0khA7z0vXfg3YpfW+fi+/QGok2HvaTu5F71q0yQXktbSuXk1q
	69SHCN4u7zlZ5NMpiIM93O53yQRAkePZ8T9ihvkhuA0Pq3T8RZie0tcqpVj6bxiU6NFhrDxlNeZ
	FOKwa0QcPkxTtBNtpjftgigwbqJIZSRE0o+TVInqGpeudqRHIywjniIG9uLB+6ohnB37Vh0Qm9P
	gjQnqgGr0R/fF1es53+5hjJmOW6gdHJC3aX3fsO+99P1s7h5maJZhVRoT9tY50LGxSB7AdAssmd
	OMRr9cZTtFVpAV3sbH90Bita2ku6gEvqMItmUqsqRIO++dl1X0AKp6N3Rpw1ascGvCOtEpIx7WH
	gEFXeTQy7Ov/BYBPfqAyE2uFgIsJFgpfZcfvhnWhtiy2JjZYZt14Q8MHvxGz7UJJ+CaNlqcwIeP
	yQX78COoIYxoVlOclvBUdAiPbxb14M8k/xWJ5H
X-Received: by 2002:a05:622a:114e:b0:510:142d:cbef with SMTP id d75a77b69052e-5103e9413acmr45768861cf.43.1777649484030;
        Fri, 01 May 2026 08:31:24 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b5e8b4sm19037771cf.23.2026.05.01.08.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:31:23 -0700 (PDT)
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
Subject: [PATCH v4 04/15] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
Date: Fri,  1 May 2026 11:31:17 -0400
Message-ID: <20260501153128.8152-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM8916 analog codec is also found on PM660L, typically connected to
the SDM660 internal sound card via the digital codec. Provide a space
for specific compatibles and add the compatible for PM660L.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 15389645a3e8..074a20cda89f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,10 +14,16 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8916-wcd-analog-codec
-      - qcom,pm8950-wcd-analog-codec
-      - qcom,pm8953-wcd-analog-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm660l-wcd-analog-codec
+          - const: qcom,pm8916-wcd-analog-codec
+
+      - enum:
+          - qcom,pm8916-wcd-analog-codec
+          - qcom,pm8950-wcd-analog-codec
+          - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.54.0


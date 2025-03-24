Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CCA250BFD
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 11:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742814384; cv=none; b=HhnV71Kn8LSgEq9QRjb2rAo46UzxGEmbAdLNF4GvDJAk+zY4/aYqeIFPaXn6h1Q7XSbUf7IhmqNKVye0YFoa2rBs2jGAMIEfUs9b1LN5TeFJ02cmz75cjZeeqOoPKIRhjmIdR05XZtDiR4ZNtniv09eSV4D2IOCF8/88RhfjO68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742814384; c=relaxed/simple;
	bh=4KPz2dgcK6oAYA5wLTZGtAM7Mjdv3/Gv4z1Ch84MYAo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CVnIC8EB7IGjWHAoULxygiISWDJYbEe9Y+VHQl0/Www2+rK8f14cfSQvE74jCT7LaavVapmvJij0ysaHrZjAl95RyvkAcbWA01NMstyOUqBCsGljXuBlKsPgOcnDlTfCIOSCLcqVcFOiA/UqFfA+a+aVqeqEPyqBtcoDYYCeZOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jv+7hI+k; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jv+7hI+k"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso26572175e9.0
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 04:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742814380; x=1743419180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1axor6d9w4plgEYoyUgTZRxyGQQY8c9NPyfBy5rid8=;
        b=jv+7hI+kXst8p//Dkh0gMhQG1IKQ05AV+0ETrGba9BUYDXV7ixCY+RsN92pNEmPGO8
         janOir1HlFMRVgQC0TrhJa8QLJ71VMHOov+4dMJaibjWdYhRCTcOsZZ1RfLxjayXFcS6
         oG+8jrsbX4APx6CrMwh2jq0Z9ez6R+l/s8lWELjHjmhRF+HaSUpyQr2v/kDqolT8V0nE
         +Sjw5b55I4wYYwh3rWySXhtLZukseBbTy+ZF2xzX7GLym7Ct5KjvOE36uB2JasJMqqMZ
         o4M4h6+QvJthlP7ZZJWa8huXkJkO/061+DC2xHW1t2knnagCLFZuzBOrdGZkA+m1qR4U
         mw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742814380; x=1743419180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1axor6d9w4plgEYoyUgTZRxyGQQY8c9NPyfBy5rid8=;
        b=XpY//8FbAKXHsipguXryUdEbGlv86mZXtyr+/gTYO108utOYjBV17gM4THCkrbV/zl
         Rh38Y2T3JPaonlkMCpKbMAOPuZYNR9ymLxxGFmU3VW2xxWlMUWDc7VfTGpcighDaGMRa
         o7ZV7kRFLJYcip3oD9zIvb36geYLhYYd/xR5OPxdC80nUj2ZC3O38RcUvaQrSYl6XahH
         Ko3nwoSWPqv8iww5JNzWlDgzwLOKcnxLfeiFuxpPDe6FZvab/BwLdhC8bwqL5yJFsIcy
         cjMOUv5VEGtHw6wJfV7il6AyXb0Xy8LH+hPvMzS66F7n+r1epbcc+wR3WGce615A0M9k
         9Wug==
X-Forwarded-Encrypted: i=1; AJvYcCVQyRU/yTyNAP0N80XU5MdDOCCwoamDoJTenbMP7y4qcznH8V+2yIqzJOKVXKY/gx47yQsu7lGWI3FLcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YysU+rU5mmYmuoRAoH8kRNTnfOpPD+hnrK1mwdHLzSP9vl6YF0N
	YPK61SAcaQfZyc9S03zJyWVT6dC9hJxeaSFCFfWZkBUmA1jvjXpkYhGZLHG07Lk=
X-Gm-Gg: ASbGncshkLnmSpaiikPNpq0VOdlVetvq5+YPE2IZ/Y14o3F97Q6YNXOBncIxgIIehJp
	ymK6b7u1wEWt7rJ+mKz/jsY1f17BKETopRPV8quMWg0rxw/K9ux05sq0TDvKNp5F3SR+JE8x3MZ
	LpEklUTR3bJo9kLslYMHQCSP72mh/BwJHFlKQXMqmwe4BHPzEOb0B12LtBe5jOvw56UB6+M4jUM
	6MVg+LUAGLwHrU1UAvDuo5O37VySVHgsUYhFmRr1IPWLaNJtt3Hla+s9SVf8WuNEtw/pnpRAR/6
	AAzqWZnEXya/RV46nwR2k/Y6DgfDr9N3IujworOGuayijjW+y6nprHQGjOHS6d+h2/XkOQ==
X-Google-Smtp-Source: AGHT+IH9z4p4Z2S7Blu9BzHzsu9aZDSMDB7Td19pvYAR19+X1jWwwiCjxXg3TZVIRk2/ejMVRMLm/Q==
X-Received: by 2002:a05:600c:3b9c:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43d50a4ca6bmr105053195e9.30.1742814379624;
        Mon, 24 Mar 2025 04:06:19 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd28a46sm117236055e9.24.2025.03.24.04.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 04:06:18 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v3 1/6] dt-bindings: mux: add optional regulator binding to gpio mux
Date: Mon, 24 Mar 2025 11:06:01 +0000
Message-Id: <20250324110606.32001-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324110606.32001-1-srinivas.kandagatla@linaro.org>
References: <20250324110606.32001-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi Mux Switch is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable. One such platform is Lenovo
T14s.

This patch adds required bindings in gpio-mux to add such optional regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 Documentation/devicetree/bindings/mux/gpio-mux.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
index b597c1f2c577..ef7e33ec85d4 100644
--- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -25,6 +25,10 @@ properties:
     description:
       List of gpios used to control the multiplexer, least significant bit first.
 
+  mux-supply:
+    description:
+      Regulator to power on the multiplexer.
+
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
-- 
2.39.5


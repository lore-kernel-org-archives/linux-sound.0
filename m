Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEE325F968
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821274; cv=none; b=H9x61MK4mdZfphMXcjJGnBRzhrKqNCJbbt7QBP/DP/cPRYWWt+Xxo5quPa/NYVZ66Klam33b1Zr/yENL2S9Zpy6wDWKscVC0W9nvF9+4OQ34hjpR2OCHMGv9QPMh6jbR6t3YnPr/cc4swm/h3c9TZqnzDGsxD9fCSuGHL/ZY4ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821274; c=relaxed/simple;
	bh=SaEurHg9my0SgGDfooWj4uP1HnHehhMQjbSphU85xtU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZDMDOSAl5HQiFtvVL8EdhY6V4njnzWQPMH6MOr9noL32QDJFF/laW+n0X6sJWicSV4UW9BEQJL7ILh8XfNbb8zgo4AESiVvLC/GPIJAa4kh7TQOO0iTRMktDtsn3P2tQe2bw66qt+js252jBhiyELYjLYkWMrGEBAq3WoGXLrPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d8hoZtZE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d8hoZtZE"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913d45a148so3525369f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 06:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742821271; x=1743426071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ6QvHirUebkLT0cLpo0Lkee0nQc81mUaPIyQl+HrrA=;
        b=d8hoZtZEsZBejbfV/I3vlg8HL0Yc67JgmFuAPCIBGbcmJsDw+jo3kLbaHKnQT7/OQU
         nUjjfZQMkylioqIKbx1OMF2YbJ8k+v8W701ZzykPxQ0ySZPieymL6XelP7tINstRxDFu
         hzy4U9YM2+ahRq0gyFDGP9xATaOyjux3+yWR+xcpB7u1cJPb1Ey79bxK+uA+6FEjoHpt
         jw8aCpMT2HeWCxgV0w2gZKOULJb92u4L95aJxknf/Y6OFRn+7lqSmiRt1P4oj/GfRY9f
         Bfkrtim22yTxb2UMpLT8ideNGDL2rPRCtlFbVhy/qoRsdKlaD7vT2VhNUXWbz3l7wBky
         zoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821271; x=1743426071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ6QvHirUebkLT0cLpo0Lkee0nQc81mUaPIyQl+HrrA=;
        b=gnL7qlB/PtDNhNZUhw5aK8OdyVouSzeWlFTXhwotu9IqXFECZVp8S1tNT/uLXN5waa
         kB6glIl1WBPNDZpyjAwdNzdbch7jS/DMaLD3iPUu3upJuJvUfZoUNCsbJMy8DqhdLy4f
         BUNOXYoKjnUHSlA+Nxvs4qdFHGhlk5kTPnvYo61pYguRol3TKdFoNcEbFhZgW8mwz9Gq
         ZhepFJIjfykj52k9il5VGpmpwbpfujKsHAlyI8l/UEDt3Fbw1+i/antOKyj+raTMQ5aW
         cdhdHHIOWFoX1kD9o9IVlkGrs0/qWRUQoqRLGudSHebkB29nsWuvb7CdgfMR+rLiC0tO
         v4HA==
X-Forwarded-Encrypted: i=1; AJvYcCXOKtIs7MyrddPS0DkVi4wsIjQjLgs9UInenCMPZWyOeBuG9gx1gMy0niQCFM142IqFdsvPDtke2OgJjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqHHf5iLCXDkRdteypUvwSyPZUIhXf2QXHd9rBE+IsbW9buf46
	lL123ApAIKWcl/gP5bh4PcTpa0C8C9UUgLkr1xCOhTAeYdEe+OSG277fMPElsYE=
X-Gm-Gg: ASbGncsppLcWCll0hMfcmVmLvSIhassAOV02c6tPm/g76G/T13zQVYNlu2tojgGNpiQ
	HyPbtMJFsQgPkfk2OPk8VaX7pVAJAXIRc1zJDM2V9UCOjRXWayYsNHBUoZrtJ9sxVy42+ULyju1
	dezU4P9+bpeJzzHQjf3PBauihq/eNFM4TCmnjpBcEVZtpluoTjpL00vuGCY2xreST2EaoBr6E5G
	eqjKeimhFE9hn8gn2AXWqkHlaK8MICPNwpAJWmsZ2EO+yTOWMxNINNej0mFti27blbYowNhTyZT
	dHnmoK47okEylqzOIIwm1C6w2jdOiPg5BkhheJwdmFzfAmnhHvhXje21PvZpHgL+++vl4k64YYg
	PVWyk
X-Google-Smtp-Source: AGHT+IHcZdjKo+W60+E0889CUCSjzvCnQTNGHROcaLcw11SC7gzeWcB55np64KwhSuLoUJuyekwy5g==
X-Received: by 2002:a05:6000:2107:b0:391:3d12:9afa with SMTP id ffacd0b85a97d-3997f90391emr10016304f8f.21.1742821269598;
        Mon, 24 Mar 2025 06:01:09 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd1c7sm122275975e9.40.2025.03.24.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:01:08 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 4/6] ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
Date: Mon, 24 Mar 2025 13:00:55 +0000
Message-Id: <20250324130057.4855-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index 10531350c336..ab1c6285dbf8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -23,9 +23,15 @@ properties:
       - qcom,wcd9380-codec
       - qcom,wcd9385-codec
 
+  mux-controls:
+    description: A reference to the audio mux switch for
+      switching CTIA/OMTP Headset types
+    maxItems: 1
+
   us-euro-gpios:
     description: GPIO spec for swapping gnd and mic segments
     maxItems: 1
+    deprecated: true
 
 required:
   - compatible
-- 
2.39.5


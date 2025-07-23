Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607C52F2C50
	for <linux-sound@vger.kernel.org>; Wed, 23 Jul 2025 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279453; cv=none; b=nFDodfGF5hFhYtq9r2k67uVwLgP/z38e5Ju2rIn7BneOJoDHQjfCFFtyN8lbZow30RHYepDH1TVIr4CLEIE1YF+AGUXCnZ2a+97/uz42iVAZ1pYIG4aYjoju2RoL0ZbZMVNY/eCtPpF7sWZGALteeSHW+fPpqs3P1lR67aw/3mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279453; c=relaxed/simple;
	bh=iFrv0UOBrWQDOMIVYCVEkyIJ0o38UILWsfNE6sREkpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WuQEk3mP3ZbFnjPBqVbuvlwEa7iRT4YOtgY6YqekuHpC+RmaELD9TzKcFdtCVWlHROgx9YugCv9cl8nL+oOBKi497pWEUFwiEzZ+KuYJwiGgDDl4bXnIgX9jR8g9uwaYRwgzNL7O3NwDzJyUzsmTzuMj5qz26SDdOX9So8t5fEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=G+hMqo/v; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="G+hMqo/v"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-611f74c1837so12916299a12.3
        for <linux-sound@vger.kernel.org>; Wed, 23 Jul 2025 07:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753279448; x=1753884248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIayvnL52YWH7X/Cr5CMXwZtJGZyuDUcKNZ3PxwKQms=;
        b=G+hMqo/vNEw56CMZ2SofiexvS8vVbsxq+zeSEnAWJFNJK4+tVGgJoAZuOy/t9EOjNv
         6D6cdLkm8tes110bKGEuoLyFhbeWRPVzDwKV+ubTf8JT29smqb6LjDXhtixgo1fPtcrc
         TZCk7hZTdvrRMJPBAFOI4+jZjFiJT3NxG6NnuxulPeDAkjpsRADqJw/rTVyklPq2dwYC
         ZGIwoi4UNcVY1nJm0180ZBoKj1t3EsFOtA1mWl7ztghaBK+PHG1WE/SDmiZ+ehv1ADE7
         ZcaytxTrSsd8NAyV1w5fwotJByOyjqLfJTA7BrrIrOANIC/jKOxV47CCt10Whwy12mju
         FwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753279448; x=1753884248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIayvnL52YWH7X/Cr5CMXwZtJGZyuDUcKNZ3PxwKQms=;
        b=iIJYxweyuQo+nyiAdImN2LzLl3E2j8n7NA3aEXug5/hfpTXoz4sDVYoR8Bzr8GD8im
         bBxqzkriTRTOWX0VUdqZAcxJpX47DPVfDw6jT4vswHHk0nGqr0U+CutaJpoKTF43Ym2A
         UYkcv12DHUqB4WuvyO0L5IrK2aepnA5TEV+vR6077VtIcXulOPoCK2f3Xm/2yE6xW8bc
         23MHGFZGIRrjH7CqY6JtGwPGxODW9BMJDjpJzlrBlezyfwH+/iT53/bQlmIBPnQ7i8QZ
         4BZAs7PbF/kgcCUd5ica7FmnNBpWzp0QNU9ao1uuRerUlfS+28SPdBxC3hFWXCdWk+GI
         hkAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvmTM30dc3ydMveK1SY2VlS7W2j8RMhGi9BQlLGw1qdsHOArYHJ3b8XwxOOsbxcdaDg7OWdPlomItQQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQi7s/PDhzwOHQrzoh0k83YQIaPgpb/Ohcsxtg9bf3foqldxj9
	za43OpQPYgbMuqC2dfVbwflALt4iiTmegwaE6Mlp6yD4/v72y+IYTFto9sy8cy3iz8I=
X-Gm-Gg: ASbGncu70H9zCKoUyd/umDnRoms5CvjlXUYH5hME0nOw492PZVG8C14xeN7SH15RXxv
	AD1MZ3VLw5uXZK6pj6wvrJE8PXvaml9M+riXBPyegINzL5ZPU0aVEPSvV90fpCvgrkYANGJ2zor
	ebYtw85hypggLwcpO2p76+kgpzRn0wIKlhuJpuiO1uLaqs4JG30qqm1+iAQVn35YBDv46Yuc3BV
	WC5FR8Wg62DW+porWrP4GnDlE5eLOLkZYQmDqGEnp2WFG5INGa0/L50aAh4Zf9fVjs4u3rt3KXj
	i/LfPgIZMb2+rRhDUQawN3/c8C9l8NztpWYiSmskdJr91/SwoUiCon6GSw9xZM0GTVtkZnOlnHe
	H7spXO5FvXfOgfqQDxp32Mzous5+2a6t0Pj2jsB7ubMib/si8LdZnM2GG6NjdIr7IhjUU
X-Google-Smtp-Source: AGHT+IGR6BvCSuwozQuhF+JK63ZdSllhSvwjucskJLyJAXnOTc2Yf1K6fqw2IyjVv7b8YJWo3DFKzQ==
X-Received: by 2002:a17:907:9813:b0:ae6:efe1:5bb5 with SMTP id a640c23a62f3a-af2f67dff36mr337902766b.7.1753279446731;
        Wed, 23 Jul 2025 07:04:06 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d46ffsm1054830466b.42.2025.07.23.07.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:04:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 23 Jul 2025 16:03:38 +0200
Subject: [PATCH v3 1/3] ASoC: dt-bindings: qcom,q6afe: Document q6usb
 subnode
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-fp4-usb-audio-offload-v3-1-6be84ed4fc39@fairphone.com>
References: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
In-Reply-To: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753279445; l=1387;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=iFrv0UOBrWQDOMIVYCVEkyIJ0o38UILWsfNE6sREkpI=;
 b=Ztq41RZXSMGO6exUAOuQ4XQcdpBry6H1ciTLjtAknNQkm9moDrjoxqdKldMAFo0BxG/t8N6Qw
 UOlP27CPefLBV/wj79OId5uHt7EjrKLju9XrZCiuJZQRup7OWYCuFaK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the subnode for Q6USB, used for USB audio offloading.

Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,q6afe.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
index 297aa362aa54ab41a956b3ceda73d4c7027d72a7..268f7073d7972da2ef46d36264c0f7d8f648071b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
@@ -29,6 +29,12 @@ properties:
     unevaluatedProperties: false
     description: Qualcomm DSP audio ports
 
+  usbd:
+    type: object
+    $ref: /schemas/sound/qcom,q6usb.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP USB audio ports
+
 required:
   - compatible
   - dais
@@ -64,5 +70,12 @@ examples:
                     qcom,sd-lines = <0 1 2 3>;
                 };
             };
+
+            usbd {
+                compatible = "qcom,q6usb";
+                #sound-dai-cells = <1>;
+                iommus = <&apps_smmu 0x180f 0x0>;
+                qcom,usb-audio-intr-idx = /bits/ 16 <2>;
+            };
         };
     };

-- 
2.50.1


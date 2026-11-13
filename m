Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595124;
	b=CyzMFH6gzr+BFIqH3TiS2WkTnRn8aLaySu7R15uSzoS4m49m/LPX3ms02xA8ehcZ9I8o
	 RAstBQvfxhB/j+0DPFQjDUcc0q2pQ9bjB47d/WKvZH1iIRNAhWPBhk4Sb38mRP5kjpJY3
	 1OLSi2XOBMK9vcrpxvidaORNRcTN5df1B9bKtzcLrP9XKJ+Nhmdivs6bTlHDy101eL/lX
	 vOZ4rIEcCq2FWjPwOjPFnt6PLQHSUnXNVhnyXzfUhGbNtZw24ZO4DqTCS3vqC7yxvbAvS
	 oSkj0f7xxHN6aEMreg3Fv9JW4BvjKuF+kbMhEzGhyxZDHZnTtbTOpt2z0yuN3Xku+yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zf2ueSN0brUmLpX9oxEjZ4Lyidgx3hF8zuXYpXrD3fw=;
	b=fk55wu8ayIYs6CBVqWa5Mr9tmisBcElTZCgRTmXfhMLt4GtGtTSwuwNkaMiBsqSd4ows
	 DF9BanDu/QCeFfQRyDB2mY7TeC7Q8Be/mAiA5EQ4Req/KZxjpqHZKHosEV3xwggzsZIP7
	 M2HOxgRdTsTLtFv4nxM9OmgEGA0ns8lC/H6Ng65k9uowyyRkLzEL1xeFcPx9YrHDkG9vT
	 NAWZ1UsnUavn3EdK/MzaPGm4EvevKkjgdVIW0tvefMtnrs/yBfyLmDPWH1edVf3yjB4TD
	 jISjS9oirGUroxnzEwZWVMCfRe8Bl1MYw7FQXRDplf2J4/9rta4wE31LdLw7mJtHUHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Msh9aI4/";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F49606CC81
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 18:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1F49606CC81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Msh9aI4/
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-497614c95f0so613695f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 10:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595122; x=1795199922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zf2ueSN0brUmLpX9oxEjZ4Lyidgx3hF8zuXYpXrD3fw=;
        b=Msh9aI4/HOayHoSMiNbjIa8+/U22qq+eRXVL42dWMkCkpcOotQBzssFMMdtIrGJuGX
         MrWd4Y/i8ebfuMGVe/ZDvUTsMyUasyUD7nogrpOTVNfLP5yon7t3kXDm05DcWBN7yZoh
         MPC2lCo+yF8OxM9qFiEZvAsp/mm13XsXHb9QKogt3E8+stImcPqdNIsWTNKjg73gt9c/
         ROOk2ONhGxjVkpTdfZSC3p3oJ5Rz6c+akL5RAIcxZVlDLSGwbaG42CK7qb2VjHKlVa2A
         AJR8mWPx5p+05aIVDp2sel0UIZE2W5fUtKJ3J3xnfZkwSuLyhUNia3yB6i65kov2Kmgw
         U82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595122; x=1795199922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zf2ueSN0brUmLpX9oxEjZ4Lyidgx3hF8zuXYpXrD3fw=;
        b=G/UCaVHXDYjK4IeBD7g5P2VyVZWyVeK/ebrqL9wb8xx/Q2mpxv9jS+KhsM6yzVrDT4
         spTdI27tu2PzQ9OSnXm8GKKQLgCoi0Bb9U7E/YWcvtN9he4JGkxH5tDJVy+pmDeTZ3ct
         WVsUenGiYs/RbkvcB9Il/ZjNYtE/UcyPeTySM+Rkuz+qMSK5+ztPvYyP++Nz0ybMYhl9
         MooYrEOFV35vItFHOVLAzwmKX7zND/c9y7p6kkUQJzC46dSPZnn9Wxvf76YzXVqj4Sru
         p19R/n1NVL9MwzYJKfqgQkH8wbtQIegPHK9RbCEzUA/3CMQfFlKZOcHrhOrwL8mPcgFP
         Pb1g==
X-Forwarded-Encrypted: i=1; AL+hErEmmZAdsiHpw+Q47lSdpHAfPuYwtCTAeNB5v/JkxeL50GsnXe3aE5yFJ3Yd10kfJyglx1W3DZJyRyWjrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9zZcKUpa4SxOSoM7tgsXcWLDLXlLtNF5FOjXbGzSEVdjzS40yP
	NIuNOJjszz4rpGim6csd34igO1o+CI+bfGsYAscBUlSADmFNORt8J/HgWBCtFhEMayM=
X-Gm-Gg: AYBFou0b5ZJLYtu2gc599w5g8MqNZ0ht3bpYgILxNVuSdRW2hnR/bYvWwuL0fGB+SSD
	ciNn9g1P4WjDhXZURyhDqpS5ac2IgRklQ1wTItJE3He4gKqrTCDyvQgzd+BvdbfuT+6s/L49r+G
	XMvTkpIIHwICzACP+HlSZ8hU6PYs/spzEyaHwO8mN4h9n7BaiOOVfw7lJ/Ysz/qjrxzHKXKiWtv
	IEeX00S72kGBjP5MTt8kDzEgOgLlnq/jYvHasAJhQpGz5cOoekpAAgAGZ1taiDji2rnC+q/g4SN
	dRSeHkd2dtKNg2Ym3jDlnT0FeCqESf+UbZq2Qe20KB1FOAv8unmzclILz89VcQS5R4ilSx6eA8+
	Pkr9XciTGmRrMCHu1Q6uLAsppUq1CTRxmh3N5ag26mR0IL+DUliIkTQni12LkKH48NfF9Krvt1H
	UskJwTbEuDh61GKOgi0X6EMKzVMTusrn8b9qedQylw6EBafkwL0d8KD7z+HSpj3jTEXos24Dxn7
	4h0oNajmqEkpF8Ynk9WCzbDlWtUfx1QFAr5OO2Tq+HVMpr8zbtPCNfVAlVsYFMB2ix+qCnLBxx9
	bUX8bTy8kaDMuoE+lkzzN0exaDWHO5ESt1lpEigJPTHU
X-Received: by 2002:a05:6000:65b:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-49c740bc18cmr6379979f8f.39.1794595122113;
        Fri, 13 Nov 2026 10:38:42 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:20 +0100
Subject: [PATCH RFC 06/23] ASoC: dt-bindings: qcom,lpass-*-macro: document
 less clock when ADSP is not used
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-topic-sm8650-el2-v1-6-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5113;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=anakJKqhStxTQEwPnhjGfobE0ulRfpcmSgr3Fb4aTUc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kgeOjyO3IS2De8UB9Wi45k0n8x116tg+Zpcatm
 hwhPBRmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZIAAKCRB33NvayMhJ0dH/D/
 9JjSfFNr6WKB/Er9I6I+r/z4sqML9qRHVR/OvjBf8w3RtGxVCKHsawU9zrtyyyUmjRfmIzflEfOOGR
 vdCspXhmOK+dU60mkMJWeVIwGqBLo/SLMa2DgOxSUt5NzWe9/uxcKDU0+l5F4JQ6oADhpuaKgcNmO1
 isSKVZabEpQ3NOwpAC/lSErMU6XMqJ3Yi1vCiUC2PNobOhurhDUpmer3S2P/GVTByixkk+/bko8unA
 Z8tDcTR577nnUHUmR32gWAYPatwTa7BpE0nELVoHXv61Qtx2FX2l+I8xPEywBDIkP1DK3zhTVxAf/5
 I24n8CkTS7lyryvYqgFQNCMQa14NQeskfvmMU2u5BLk0NAgqBDT4R5b4JosdBDFRivSZsj+jP/2kDA
 x8E9BR+YuWXcbInU7/FE2K2v9Daz2WzelOyDMf4d7OAYZxCp2WowsdzQF4kbANerAPrrGdBeZbLSHA
 uIzPUkCWa+kQOFZ99d68HMHN1FExdlSuB5DfZHUm4xF1luOZbEEflnmBIalrgjUw0K0BrhGNxL8NL4
 Gy1fmSnYM/p6kZ9gOtZ7QOKqTr8XfxsnSRmi/R3Nhj4paVlqvI/hUYOJ+NtDib6ZgzrunKrog2iWu6
 7ejfFHTR9NPQE1APUrRVOBXQ8tMrCi78br7eohdiqikIemtp86xohwC/P43Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On platforms where the ADSP is not used and the RX/TX/VA/WSA macros
are entirely handled by the OS, the macros blocks requires a different
set of clocks and power-domains to replace the clocks exposed by the
ADSP firmware interface.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml         | 17 +++++++++++------
 .../bindings/sound/qcom,lpass-tx-macro.yaml         | 20 ++++++++++++--------
 .../bindings/sound/qcom,lpass-va-macro.yaml         | 13 ++++++++-----
 .../bindings/sound/qcom,lpass-wsa-macro.yaml        | 21 +++++++++++++--------
 4 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6e34..b76c5dfc0462 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -129,14 +129,19 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 3
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: fsgen
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
+                - const: macro
+                - const: fsgen
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index d8682ff2e82c..bb150baf3ec9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -38,11 +38,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 3
+    minItems: 2
     maxItems: 5
 
   clock-names:
-    minItems: 3
+    minItems: 2
     maxItems: 5
 
   clock-output-names:
@@ -133,14 +133,18 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 2
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: fsgen
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
+                - const: fsgen
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbdad37..bae257447e25 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -160,13 +160,16 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 3
+          minItems: 1
           maxItems: 3
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 9fedd80532e2..2ed35d812790 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -38,11 +38,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 4
+    minItems: 3
     maxItems: 6
 
   clock-names:
-    minItems: 4
+    minItems: 3
     maxItems: 6
 
   clock-output-names:
@@ -93,14 +93,19 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 3
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: fsgen
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
+                - const: macro
+                - const: fsgen
 
 unevaluatedProperties: false
 

-- 
2.34.1


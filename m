Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541547;
	b=1i3L1Qkzl1CRGGkwREF0CEfPbkaCRJrpgxxnTYiFMbJa6N33NVIVHL0MhYssao4yej4C
	 4Pz4P3Qcb1RoneZSDMwdf5Cv3Ps+Pzkn8PZnUQ4WGwDpY5AsG6IBwAwPVEkTSrjnGX0Mj
	 IvRHEWi25mbHsohHCHHIrOgdN6MofH2PxKNePR608TvXLTDXGUibYg8eo4MdLKsDcY9Ba
	 F42FvA8066oQuGVUO2RxeuCeSk/EzQwdYMkskmmMkko1JKHHfqo3C6bmjxaJwjcKJjTCZ
	 eD8Cyczr7SuUyhb96vakOkY1nLRI+N0TeOp4++/sL+X5hgLfWgH6I0YIN1XBeZFBfLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=9SvbCg7Ps5Nq9N8nXx7dRohF/YVoRnfTVKAxW5AGeuk=;
	b=uc4/thfM+m7UQKEfJJzfAQ1YDFAiUrnsnHtD9SyWssCs5TksS6hUCBEY9L5GsOIyb697
	 lK0dXtHazqIERe8W+rUYYT2Vrj2iCWfEJhsEGYlk6uzwNYukl7w4GAdwgmPbVMh8eaMdq
	 IEsZHUQn3Ul7k9b3B72hnH7awQKCXBWRMRkM04bObxnIjRSuSZXiEX4pINWllvzEUCm4C
	 5nZOUP3CZ1Q/6FSoy7fP9DMfd6BOWFOZHuVOrdBFzwCCPbUnCqcXTb1xb8TRaonzJT2E4
	 8o5sg4/dj9l5YbDkiVEJH7cXia4fEqnIP+jTw83ecgOWCcNRtXiVCnFrwks81N2FUIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OMdOiAWe;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC4C606A6B8
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC4C606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OMdOiAWe
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2765945f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541545; x=1796146345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SvbCg7Ps5Nq9N8nXx7dRohF/YVoRnfTVKAxW5AGeuk=;
        b=OMdOiAWeNGehUvoWHF11Ewvcv7JrnE+5P4gdU+sKW4N/flR9Xra1mEe9VTKPga+pCy
         9GhIT1NZqKgoPJWEX7fXU1gpYOYAh3T39giXjwPzJIS+AVc5V/T9Jt8skxkCSW+Xt9gM
         aQioNdQLLzVMnv4K054mqTOqHmi/pfGFYe2eRBAm8gclFT4p5pt1cCmZRQIq1rPtyZqV
         1cTWJcO00Ua+qIiJZMpg+QnyrFRZzkBWifZC4oHKeG0kqYJRD3Ugk6PAJp3apXx2PORj
         0TbTAPWrQDpfBgULH6k6TWpGuXw2jcyDVSAV4LbPhVjuE34AbX2o2kAqhmdA8FcbQbcF
         UPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541545; x=1796146345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SvbCg7Ps5Nq9N8nXx7dRohF/YVoRnfTVKAxW5AGeuk=;
        b=zV2eCe4WpCmJqLRtTcTWi4JfoP2Ep7TxOD2EAGamYpWxMJIyV3mCa3ZdStFqPJ74VU
         k8D7DjjBXs10bFSkynpuaX2tJrxG9LWxnn6E2SpRp6j6j+L7DzXU5UNRPZFIqIcl+Bou
         jQynlbaLjssyufg/yNYDUGby93IBaDrT2A6jXhsu4FXs3ixrJJuq3lJRS8zPvXgfsg3N
         BHf78GsRQiAJwGeQFSqPBlvsrFDPbnHjfYFCztRsIxoXqFkGTuThKzuRBNKuAPasADP8
         HUxsje0VFshzx0CuyVi0aYSdkMxEDxIXPrA7djT2nPbUEB7XwMKsefzhoF5wDp9Y7sU6
         IZCg==
X-Gm-Message-State: APuU4Z9nAukpmUIaxDngtMEHt3al6CrjEMl79KjnaWQf0koqDiEZuuSk
	StA2j8QhE7JgjyhGd2A+Aod2DviXl1Ac5URl2IztJ9KzuxAiFFcIY/AL5p/pUmyQY2Q=
X-Gm-Gg: AZFdTZdvN358EGIa/Y0zTk19NO7dJA+nW6lq3nPC69g9grDBjccej5TB0k6oDYMLrP0
	wzZcZq8slwHrz2RP2Cwx9mtOBvLY7e4jidxZuidB6nRtWeY0XTUu6Xqs7zs5Oe7Gg+VMW8b552M
	rQzzgWe5f7nZydoDeS7qBO2bs3r2r3GrlGWn4vk3mI51TJXr6EbjB9Xh0/Xjj0tC5W8Ey641VYl
	PzJten2Pz24QU+plI7uNlxEkQrW7db5oWLV0Cyuh15vQb6iKdgF2FYTCpQ+iNT0vVkA8492D2Kv
	cyzbBq+iGtpB59uLSayHLf0tzfWGYE7DWGoPeG7vWzRL4aktzX0ZAB8i58+9+MKeGhYvPQZ7l8z
	leLyqVyNGv0eAvfQAI/W3x3ldI88YOd+SJKmtr2UNBzmiJBLCzIh5XZ1r/bvV7+VVUWiV7VgsVO
	0IND9pAlI53V/FBamP28E/e6yp5LWAYb8Wb+cQdkrLwvQFQM0vE0N5laWoPQSmDp1CqNCtY1edn
	YZ7I9VeMV2iab4RAPY93Sddi0DrN8Qcvsu+YfOR+kZnWV2AW2n8ibpInaVX+Q1KDzRa7+jYFVXr
	NcYF8pdw00kZ4Up/2J/XIfEqF+L87QMlBe1IV0Rd1A8YLAtxAA==
X-Received: by 2002:adf:e010:0:20b0:492:b221:ac38 with SMTP id ffacd0b85a97d-4abb2ce4bb5mr22650837f8f.26.1795541545190;
        Tue, 24 Nov 2026 09:32:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:12 +0100
Subject: [PATCH v2 05/19] ASoC: dt-bindings: qcom,lpass-*-macro: document
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
Message-Id: <20261124-topic-sm8650-el2-v2-5-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5362;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=do4Pmf+OVu07K8cj6AtpBZmoXVp+LaC/8m6b8cSv7gg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcocYv9+888ZgnQroXtUIA8JcUnztIEsC5bdXRJy
 DDjRFMeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKHAAKCRB33NvayMhJ0YNwD/
 42F6P7p/IOzgCWAv7VWdS4T77nO3fg9sWC5QbrR1LcEK51x4KxUWpf+z/cOg5HDUMYS54DDBL9w7ve
 a+5ft1K7AOOvJbInIHltppdlJfBwEI2cMelcSBt4/7+cYILBNxeh9O2qz7JzsyZPP78wD5YY0sUlyM
 fRVc/GruFa2+Sgo0l/JwBYmhFKNauLebKecEqvJ59EgqwUO1tq8QIhu/lqipeJEoANevWAcjWcB8BE
 aUhGXsceO15KEqMolIM83kTNHQwPXRJdOCi8wOzAGstvjgf1ril8d9Hu7eio+NMRy20O6sfus88xBI
 DeV7V6EeEh8Nx8Liu65JjyInFBvNlpN7JvVLpDyvfsIwrirGQ3oRDzOvY1b8Xd+nVnXpscScoJDRbA
 7h5FdXL1baJvYd5e/rjS0wQPfBQTD9nQKqkIest2EfWi2s9WXoPOY5/s3dYKV7aJBreh13Tc7aNTKp
 cf+DaPOtlMUY/GTF3f02J2hEPt7Y+BZdfP4BrWW3jdPmn6M4oS1caMcxZAvRwSttfR8rPJjJ5U2ZX0
 EHKkd7XrWp5rT4zoyGpKLkg/GIfhzE1QTkmI9roNtey+ggzok+yRlOFdRi+igl278HLXDh0JVJv7H2
 XRR88/fc+IUiqsZYLZ06KKx5QkrPkImdLxG2j1xLH4mAVIOH08iaC5QjaMeg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On platforms where the ADSP is not used and the RX/TX/VA/WSA macros
are entirely handled by the OS, the macros blocks requires a different
set of clocks and power-domains to replace the clocks exposed by the
ADSP firmware interface.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml        | 17 ++++++++-----
 .../bindings/sound/qcom,lpass-tx-macro.yaml        | 20 +++++++++------
 .../bindings/sound/qcom,lpass-va-macro.yaml        | 13 ++++++----
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       | 29 ++++++++++++++++------
 4 files changed, 52 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 67a4a9536d06..62ddc577a345 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -133,14 +133,19 @@ allOf:
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
index f9702a11ef82..e593b84bdbc2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -41,11 +41,11 @@ properties:
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
@@ -137,14 +137,18 @@ allOf:
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
index a5466e61b0b1..3f8d0b4cbde2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -163,13 +163,16 @@ allOf:
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
index 9fedd80532e2..432839f05c58 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -38,16 +38,24 @@ properties:
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
     maxItems: 1
 
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: macro
+      - const: dcodec
+
   qcom,dmic-sample-rate:
     description: dmic sample rate
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -93,14 +101,19 @@ allOf:
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


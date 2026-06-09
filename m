Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC893B583C
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022188; cv=none; b=VZ2e/Nrzut23sCeqkqfjIjZ3QIe0w1m7nmheSbvacTY0cNG4iQG99Aoep1I5fLf2mR4VVkdrbnYP/TkAfP1Hh+wlc6JWnCJt3oSLYQPqH84el51XlKZWJY0b/72Ivp8uwBoPyHOJudsn+eY86+EAjP/YtXewXXsXTlU32DxGnik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022188; c=relaxed/simple;
	bh=sZptyh2YnTUW11YXeW5s0iLAeCrXBy0PXfU8miqgtMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UNIryFVDxwT35lAXAQjvEdnsNx1OtWfiiScn5tzZRfhljPBzdqDwXQE7vQhFFvsGFkzZqsG+CXK+dxKvEDwtbd/D2z0e62DSnbayNt2sg9Tu4eBWlEl5sZfYelV2UF4BdHr93JTNh1HSsn5MTA79I6ewOfy5KOTOYddUnT78Nkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLV0tbHq; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLV0tbHq"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ce9d444173so69688516d6.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 09:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022186; x=1781626986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa2oscqijK70AQfxauHDlQKqXVQZbGo2+KnF0J46Iv0=;
        b=OLV0tbHqOOriT9GSQDxjldj2Ij2cpTrhRqAXUx+t46RxZ9JTkNB03Qk4ie4xkG8Lho
         /F7TGp6TiYdvkVIozAWQ7w1N2/dVSmZsUxwD5QO57wY1Yf/1YokW7Xt/IuW/sP5rzJ40
         P5vDqz3/mmsCt7MfcHIf0cngpwoMRovU7URVobXjaUmJ0pQiNDbLMDXxnZoQpToLqokg
         CCKpmzkgvVA1g5tgteZs1YUWyG+dyAg9/lSdlKJ1dSSmzrbuv1+klXuqY2kxQSpY//oQ
         lgF/wEPvoq++YFyXMpTmtZ6OnkJ+vdoOxU9chF4DFYCmkzi3vyyEaoZNa4scFeTQuD1a
         vnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022186; x=1781626986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qa2oscqijK70AQfxauHDlQKqXVQZbGo2+KnF0J46Iv0=;
        b=hb60Cg3CYcidpd2fxcGiDqZ5Z2Ttx5VXyy5x91pdZ0WXM+1SVnzfWSaeXfrRsWCXJ7
         AY4FJE8TO9/GvtS4zIW6x7scxvutlex3jfV9+QiRE0gKYTSxyeKlI4BRUVIW5QAp1UmH
         bggMEN9qIFyuyIloAzEiCmpy6qas3N06G+Rz9blLB4tJY6q28NdssAMZvMpN0mMDaug/
         OLuMt6jdsYJrSz18jazR8NLbjpN3pUNTIahwb0nrAtU2OFc6CMkWO9i5yBzQ4yyEFd25
         w46f6MvOCb4jbJWU+G7PCvxMYTLNLOqZmfLBrd2RIfqwfDcIGtJ0bfVcbQgt1v8CFbzS
         Ixzw==
X-Forwarded-Encrypted: i=1; AFNElJ8n+Lt8bGGQZdeYf+rvHzlKx3SU36hR0wIOcz9YSk+k0QCJp9P4HOpw5+CWnySUBBfaha+7KWzZjhmvqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVytj5lkhiNBlk+j9KNbrYOFc8C/7Us5uVn2cDM4s2hX5o7GL+
	FyvB46qat78YX1L0a6xpiWlqDxas8VI3tLHnCktGdBYcwGAXy4TB49D6
X-Gm-Gg: Acq92OHr4+qGrHaA0GBpAosY956RaaBsaf5TjpqJ8Zdl4KA/B2k4+BTTjvxBls/ahEv
	VnPUaOXbdEf0kQMqDf+qynvHnp3t6O0Y23OnsmO3qmLAhMGjdQIJDHsAvud9n4QySCKKt55vdH4
	Ggvpc61eh/V8XGlmu+lMVg8rDQhNGpL4QrrtbRt6+lKHLUZLVqYDw1MCSELO7vs+2VUrEyMbLD8
	Opo2GnfXadk0D1EWNfZIg6C3sNjgGCTKmWAatV0IK1wvlcnhyWxmjWznEpRZB2gq8mjdUljoyoz
	66fapO+osEWbyDCH9lZ8yvTXS6xBwIcitfhxxwfya5jv9I+gYV0mI0vIIC5QtdJeSf1wroNnVjm
	RbB59ZqU5O568N5/Gf3EogO7W+4uy3q5biPjRNpkA9RZHaYXi7F9SzKgsdvgJAjL7JIJu5fzH7u
	vmn+D4Czqq40/D2345wmrQH8jGJgl/1wL1s9ekFw==
X-Received: by 2002:a05:6214:809b:b0:8cc:ec7:72c9 with SMTP id 6a1803df08f44-8cee5fddd91mr292765756d6.19.1781022185918;
        Tue, 09 Jun 2026 09:23:05 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd275dd2sm202873796d6.47.2026.06.09.09.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:05 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 05/15] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Tue,  9 Jun 2026 12:22:45 -0400
Message-ID: <20260609162255.31074-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSM8916 digital codec is also found on SDM660, typically connected to
the SDM660 internal sound card. Provide a space
for specific compatibles and add the compatible for SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
index a899c4e7c1c9..33bc23b6176a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,msm8916-wcd-digital-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sdm660-wcd-digital-codec
+          - const: qcom,msm8916-wcd-digital-codec
+
+      - const: qcom,msm8916-wcd-digital-codec
 
   reg:
     maxItems: 1
-- 
2.54.0


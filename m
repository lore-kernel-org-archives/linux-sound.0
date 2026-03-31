Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422733E5592
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 19:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985955; cv=none; b=SejyVLo6fxTUejFUSAHIRBeSccXyIduHRn8JherWeMWiW3+RWOF2l5h78/TjfMRKDn49+rPFMK1Xoau8P+fbVLEqV0bbs+ZyAm6ROGc9hwVCxYCywiPFTcp08kc9kdXeYqtSBSoHsfVsryCKDVHay8j8S8vEgN+RW1D7SirBV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985955; c=relaxed/simple;
	bh=XoJcRcH1qRXDO2rt0HAsSwjISCQOqSy7joomJfQRkRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMXurR4S5ivz8chPLTeGqTXo66oR76IU0IQ8gLGXyzvSIGGCvdSin0HgJ6mHB0UwV0RPiJkhl/XHOrzNwkfnqNjGrXzeNPRKCysDAfqVMtd0HQx5LK/Fv+zB38tDTOPLAQD9n32Z8Uu5/nPz86AD/W0e9j30Emc/7R5sm/QdhcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzC/B5i7; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzC/B5i7"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cd7c372929so654147585a.0
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 12:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985953; x=1775590753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGaSVusjTdCGe7VyTkv2c8UnvdKBcLIofqJcIfpcrTw=;
        b=kzC/B5i70YXKgBo+cXrpzeyCAJGiza5y/IWdjPrqeWBwLveatXeoRUylDgC0huPIFV
         ONr6vOiMj5AQAtM9NXhLh9S9kdwfB8fmtpC9ImoqgQy22bl7Gta468J/Ev4ASNdkuxdt
         9EkRumk+AHxHxU5joEO+SKUvWx5ROfxjgcFv+tfB6y5s71r8McrlSgbKsGXHM3h4o3qK
         bCo29PPunM57IHM6MSQYfTj6woWPxpbGtliFZmhBDSNiPziTzYHTrmYdhOCUGsAeyImO
         VIKc6o5UqPIboX3fyYMoJTUIt3ENqjGPtEnPsPtbk+9gbvfQJ6oRm8nvGMnXlrHi0WPs
         QNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985953; x=1775590753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DGaSVusjTdCGe7VyTkv2c8UnvdKBcLIofqJcIfpcrTw=;
        b=TQZa1AivFCLZ/BzaO0ljzaD/kpAGPWlCc2lUKjHUmGDnqJxQDTkrCwXAWj/JbuFvpv
         +/KxYgV8mMvq5AQmaWGBUXYcF1kSJ9MzGpnM3jXtKkz5bB/W7Kz+GEhfsGpUlZynSg4l
         ZcUdMjsPXPKJ8ZZ5GMTnHyOq7vBOBmVogj5gXhMyP5hDlOcv6MapN8KIkXgD3qCAyqbl
         N8lvEJty3lULSzOypZayOUzUKmw5AKgr35JhGk8cDAe6PyldHYuGLTfz9ElafDx8lpuv
         zHplIfB2Cb3X3OPyPKPDQs5InGAoo0BK05HQ1PJPQz1Vx64y++lQcSb509GIwxr99Qsf
         AGrA==
X-Forwarded-Encrypted: i=1; AJvYcCX16/0lC3HaVd6136nG1sfeBjZWfaE0WlAg5HuOvbNrJ+yupaq1e1tTfed02Sfh4KvkWCDIl1yMCTBiVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8CpY4XvR0bYNEFzwBvczKy6jz7lt+e2OoSmPYvRxu30de7LaK
	uFUk0zXzQZjtODeXZKmeB48/RVUxqywdJrW+R8sOpYk3+ruP6BrpJ/JG
X-Gm-Gg: ATEYQzzppZuvngymHcdowDR3+fXpyRmVxf2kytQxfUxz58GvtFX62oAiom6+fB4baQ/
	PFAHpskztieFB3JVAul6yADXoJrBmbUj4X1JuXDmjriC3mEtHAjlCC8Ln/6bQbE5PlJk5HNNu+D
	lyx25NzqFfarZhnRnRIqqDtsb2qm5Bg/TS7sJlTw/1KiVf8wuWO4RM//sjqri5C2mXrUGrN6XRb
	Q+KztU6rQmS9Bwo76AR8QCg3ZSeoctVBg0ByyQhxQ1yh+IsRY1Tvt2ZbNXRvpXeg1SpUHCH+ZZ8
	6zGteX0RBpoj9RbE0i02+Sl5SyRiq6/R/Im5egqfgH3cZX3o1Y6pEqceCq11Ggbo88uumpYc5fH
	Wqf487KTz2KHjUaBdVozWgn3nU4Cdi2swnovMlANF8DVxFpuWbgxdO8/E72cFbxXNr3edKNL60w
	AOUrCCjetFsLRRXSgZ9iRtv9Jx
X-Received: by 2002:a05:620a:2a08:b0:8cd:93b7:ebbd with SMTP id af79cd13be357-8d1b5c40efemr153898185a.60.1774985953297;
        Tue, 31 Mar 2026 12:39:13 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027edb7ddsm918603185a.9.2026.03.31.12.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:12 -0700 (PDT)
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
Subject: [PATCH v3 04/15] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
Date: Tue, 31 Mar 2026 15:39:28 -0400
Message-ID: <20260331193939.40636-5-mailingradian@gmail.com>
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
2.53.0


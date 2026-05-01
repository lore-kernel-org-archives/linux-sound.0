Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C7123D7DC
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649498; cv=none; b=LtlX0M9EOMGxbzEubcDbrBVsjqMhIt4vE3ZTPu1OGismJyFcIq36LpuQAWTO8nwIQwxPa/N3jnrN4F7XqvVr2PAbqyrH8amSqK7DuwuNvFah+amykIOgdpi8Uet/rsVMM74feqtW17onC3lY3fkP+Y2kcWiCr3W5DJztJY8c304=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649498; c=relaxed/simple;
	bh=sZptyh2YnTUW11YXeW5s0iLAeCrXBy0PXfU8miqgtMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F66LvQYA6dZw09GydYHnxnyXkbNdCIWXjMeVM3ytShy24BSbhEtgppfQvlk/TnBXczNWNb78TrWF/dRMAMs63Jkv2Tx7Tvw+J6gkOfV/k2kGxrLkv9Ss9Ys44T/KWr2jYWOpErZfruh5CJSBz6XGd91rZhC+p0uyoGX5077yqms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAcse78M; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAcse78M"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79827d28fc4so20181197b3.1
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649496; x=1778254296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa2oscqijK70AQfxauHDlQKqXVQZbGo2+KnF0J46Iv0=;
        b=MAcse78M15tyfa+Z1eS/10jPTj5JBIpkHnTsoPrp8TLGau2ywADmawOa512wIlZZaX
         r68eWKCMzW2W9StOrnx+uD9TcRhETQ2wTMPKjLnlQY/TblCkzUA4TFfWvVfHTi3siNCN
         6LhpmyEJQCP+bL2VGQRXtS5cT3QvOxlVywmNc5jyCPKKw0IsaqLljU9rLSqHELajglrh
         Rw+qyIEnNh6yCU6YSExLVlkFMosHbWykv4T9wsbkUxuuhF3yFCdT8VrtWS4keQjjzT8I
         XxEwFm2ifMnVnF98PdY6Ol5LOoTHahsaSSTSa2rWQYyAFY3HWp2xvo6jodm2Y2aUr2BR
         /Bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649496; x=1778254296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qa2oscqijK70AQfxauHDlQKqXVQZbGo2+KnF0J46Iv0=;
        b=N6ZTRa9agiOMQEgurG+U8BMlGl28fA06QrjXi6nhPEGLWTdqLkObZXLGfhH4MAM8Z9
         16EWEPaU2EZR+F7SdQgThHPoZ5L+v9bPrMl1D88rFSKcOCnxfJIs8IkCHLohCs3ivTdI
         LSOXzwd2CEfKKKx+3p2Gqc3omyoHGBqJ+z2ZFhVGcRkfleNl/mgMlzLvPGJkeolm+QkJ
         6Tibv7TdGZUnZFWmZlcY0KH/ltye6YkFXBW4Bl5y8goxRxa2xmmyZ4QWQrQvy7Ndyds3
         T/5YpPSh+qvw/gSW1w7PBAXXRaQiJJjSdEMoSvrAtBY/DZkOEJ/O1gFZta1vJ+aksyDn
         dX1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8xbsjjHJUbDMd1reV7V0U/MbHqZQkR/0waqAan8pxjrbO4BAdQw/bHVRBggkL2FQ81DZXSMg8J+3TDag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7kL6Qr2LjoHv4H95T6QhPlGd5cYWzeMbpKHLBFYekWPB3bk5S
	RO5N72jojrgu0cleHt67DxRiQB4PY5/aa6lempskCHLC+kqPHfqrm92E
X-Gm-Gg: AeBDievdZxNruTPCVUlsXLKjEktIad4ybMcPUagBRpd1mlzeHAUe922+YgroiIkKznH
	G0sHukacroBgjaZAwVEyn6laHeDgKUzNLk2XoFwizpgi05i3FULQPT8oM1RnYh4WpehZcLNjxlP
	mnd/7U4ffq7dF7BLO21aw6EkvnLVhoyxBewwSu6XoPiaml79JaynYE71ULP2Ojn47ynzQ3+5wSM
	o98D0Z1JLFQECb7Jb4d7U2Rdn2yj/tjQ0EHtNFLRtlK2nDRlqaefo8zQV9aYrG+Ty7bMx3KYDqv
	kt9ni5VU865wAFcw9eGT0iH0bMg2yJwISi1AcpaaKpOZ22q4RkrpzDQ6b4uH8yOJSnmOYmb6st6
	TN2KR7g8nFj4MJPh+1IkQ4EQdf4nkxSYN/qfe/NmsDEG6BdCFmolLqoT7g5g2oEUvuT6QDN1ZFY
	gfcJ3MD08WTgzcMDBUkWuN8hJvkIqCZXfLiqMe
X-Received: by 2002:a05:690c:6989:b0:7b2:7dc9:360e with SMTP id 00721157ae682-7bd5448e19fmr70151347b3.0.1777649495949;
        Fri, 01 May 2026 08:31:35 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-510408de8b2sm19702151cf.2.2026.05.01.08.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:31:35 -0700 (PDT)
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
Subject: [PATCH v4 05/15] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Fri,  1 May 2026 11:31:18 -0400
Message-ID: <20260501153128.8152-6-mailingradian@gmail.com>
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


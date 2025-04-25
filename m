Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A893E2475F2
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 10:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577987; cv=none; b=k2EgwqvNngGV50B0wbt8fzlLhHC2iVU4B7xbU+5C79MpHayh0FiyJsMsevfc/D59Zr85ZimBhd1oeqYelB5f+ibbeQN4+bsaKd6S3KHbk+B1ZlmodTqOlW/CJP/cgnTeJr7Lr0MDEnHm5yhYiYLIhE7m79GzIHga70pHaXKSz+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577987; c=relaxed/simple;
	bh=yM8BRFHXQ57lwyVkMBlhdAM+Q5zCu+0Nhquu24Prusg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hdAlclZPeH2uvGGVeTHpRSUJSBNz2FAwl/UHj+9a9zuy8gedHCYs8IAfG1+5yWGUIekDbXlPWjPDox4528w4L7kHhrPnF8o+mPdHtdjG1tbmhFLMjyNPyG+ub7HGtLb/mDSEOEOMS2jg8Goqc07P945NdpbD8tD3MRAPgpkYoe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DCBvgc5E; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DCBvgc5E"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so3595079a12.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 03:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577983; x=1746182783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=DCBvgc5E40z3g8D/FKf0tRPVeoH5cdze5JE98ZBBXFkRvWSjvkdBmRrCmnBUvSGV56
         17mxm47qjap9zg2xoSB7fqRijeyiC8/tBqKw7TToJrBhVEFgGsRWhNYqjwx/00wWl5yq
         O118D53VSlNK2qyk/7xuPXC445k9NtLWRGLEShSTEkzVeOG9G8tac2bLTQSC58NOBZpc
         4c3o6MJ0xghEOd57QFmwcYFp7DNRUMIk2Rj9I2lxwSBVPb85MRwVXWhHDfrk4g8Xe5uH
         yoxYgHGA2lIWvWW2rWZ9zZIYsBmRB72CfJqNcQKXNCB7RNTUN6muOlXPvr9A4wacO3wg
         GtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577983; x=1746182783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=UZmtl1FaV5ZA1uCQbSytwhtqU4C4wILrq196qJsxd+8krFRRLEHOA6rO2SSBbOW2Dl
         eBH8ZWTrXG/cCjgHNXiU6vxJxt4oiYDjHvTVdYnvkOAZi3ZIrucMZIqhfojdrKWQQ/Ne
         hUiZzAyvupCZfijxx/Xa4wth/4zxIRCN4vxgt+5Qkn5AZUGAxtg2R5wbPZkk7NtwqcxU
         Pr5K+53JCpxOrQu6O4hgdTGOEOCCB0Ncy5CySITUH/aLiqHkFo1s6SGbt9hcbtzUHPC5
         f2Qbl/O2nhBhTtdKFPe0SCFr6nOQinrI6O6wbYOM7bSqenv2ZqoDK3Tk1JKJ0geGKu9D
         omSw==
X-Forwarded-Encrypted: i=1; AJvYcCW9FOoVthMHulhUZfFGUpOJOM+/Fz6YpemdK8pID423D4qlXR/Eaur2Mc9ntUzcULRUA0acgxGCzREGpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNtOn8QKQzBP7JFn6Iu5Us9/S1igDwqgaoQSdT0jPYUNly1OKD
	J8sAyxOB4+LP4mG5e7PAf5hzfEmaS1jHirLxEZfCYLXjmPNPk5KCe+XqGdeV1yc=
X-Gm-Gg: ASbGncvKMVoR/hZAKKSKc4tqxcZyajocuyE4D+MUS3EXi/mCtYVKxMozvhn7IlxOnbm
	+yk6MIPA3OMnsIJNxh02079pG7H1eS9ZKBzaNT+RtdL3FJkpm/njraq+PgU0IkJVMbtBRTHGnid
	xPJ2w+JZR3o72ZVkewfqr8YYhWNl3MgocUUAHC6jUDj0I0luxU8ZctZl0rkctB1lZSLpwu9B9YM
	WQV+YwTB4bFj1omU+gZBLrXy/k1QVPsguC9VsYCR8JQdw6LPTBVzD91/7iMQy7Os5AXGY0bYsw5
	B3OGgZjZeyd3jQvGl/epSOf9EG7sBXOWC5inyaQstXjrto/ApcI2l3/Ev3C2DgrwBCC41AT4+W3
	s1S1MvG4cugcdSMQlRSMVMNod/3hq2hw0PWtEX7qCasYXuE3N/rBvDvus
X-Google-Smtp-Source: AGHT+IEMO/qU8Izgv8WgQTjq/p2rXnbTDGbYkosmMOLUyUMdq3+DaLxBEwE/Ly/BIlSR6mHqOeHOOg==
X-Received: by 2002:a17:907:1b03:b0:acb:b966:3a8f with SMTP id a640c23a62f3a-ace71337b53mr162428266b.39.1745577982688;
        Fri, 25 Apr 2025 03:46:22 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:52 +0200
Subject: [PATCH 2/6] ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-2-f90f571636e4@fairphone.com>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Document the subnode for Q6USB, used for USB audio offloading.

Cc: Wesley Cheng <quic_wcheng@quicinc.com>
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
2.49.0


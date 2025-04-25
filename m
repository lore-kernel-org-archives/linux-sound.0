Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9740242936
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577985; cv=none; b=fOj7kbQyEXQa814OdLU1odIAG866aCUgccI0jdtVNZhcmnnQyde1BiXHUFkziS066N7+i6hqm3FzUR0lAW3hT/IM7rr6esFfEDU7vl3dW9D+j2UvG1h+Nujsxo10lDqgIVBOHiu/2+4vO6YPmvFOQfUewqOJ1AEpsEbfvM55iEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577985; c=relaxed/simple;
	bh=wg75PCTTfribT+dtDpE+CuchrgWtQI6Hhj4cdsebLPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvF3xcQmwa1Ok+RaZGYFyQ6oEip1YjxzprIyd8Crj1g2lxE+wuCyjVqjnsSG8J8CUu2VEzjVxtj5miDx+cNo/WBNB+Nqf3XrxYJHd7rY0jLtYw1cfDh4AOHufyyId1jmi7JQ/nFBfQ8Sq/eVMIKmFUaU3FkNqwhThgGSL2oOijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hvkx03Bj; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hvkx03Bj"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2aeada833so410811266b.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 03:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577981; x=1746182781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YQvkmgUeO17WhatmtmKq2DT076cJgIIPjxnS7/XI3Q=;
        b=hvkx03Bjcp+GR/1QVW5kChsSmAhyZ6ws6d+wXx9Uq3zStGmQrrd490lGWtJIEnjTqe
         4W7cDcwtOdIjufJe1eMvc5qF+fuWqrT7hbdA8NysDTgqi4kGxHHY3/aa4ZJZcApUpWU5
         zuV5se8o21ozDq1ThON3QpD2isMd2powPFlZ6N0dRnYZk/Cd6ps6naGcjrrkFIdrJWnk
         NoRgg8NpnsxOK0jljxgUELGwRO3RFErjDssEiJXKAj9/P86Z8Qe0bfx1XRBZPhOwQbfJ
         SuIFSlj1WqyyFV2PjGs+flnLaFdQcdZtdQswLHRtkTvovKx6R/ZhBlIHYlmUq6omAL7z
         MR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577981; x=1746182781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YQvkmgUeO17WhatmtmKq2DT076cJgIIPjxnS7/XI3Q=;
        b=OVBAmJxhEeUpwtOkHFx8S26y02MvXIjYnvd+YwRfOVIbHCWWvByICHJv7BGlwoBttJ
         j8AGnBoQhE8r2KqarioXU7PjN9j5W8sH3vqbAnGEsNtdKjY97W5PT6qC8sS1omIKSWlm
         U6aKchqaNyLAOzuJEoV/FfMCnD04U1Cc7pT4oKoOVY6hj7rDNPX5G+KGXjQ3gA1L9q0N
         n83omsMZRfQ4lKe2Qw3AG7OosSWN4TGWtgVDWLoTDuVppuLAxitB4mlcTtIXz/UmxVtL
         B/tyO9X9qs6gwyxD4w+pLvOCdiOOmmV/QCJ6zPdCggFxx6U0/jlx9/0jz1CHNvJrhaJJ
         6JrA==
X-Forwarded-Encrypted: i=1; AJvYcCXhEaggMRhcKRd1coRguuaF4Wg3b2QJt4b0lD55d4dbACIFRf9RM9UxmbC3o4uIKW6F9Tq/fMto3a4m+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4cNjAV4J9wgMwR5kSnBqbbHu/ndbQeEAVtAFBuIaSv6MI00Yv
	MaiM6D3NiSZgm3WBMbU2LGu95hkECtD9ZBaKXoL7b1T7nAk5RXo18ThclUil7sA=
X-Gm-Gg: ASbGncvXhDkq6FBUiXekGzQkhUEpMidxbPhArttafijjvtkhf36ags9Tijdu08KnVzr
	U5dOgGgKCuhrqpW0u8D13LyWkIMRfA06ugCH8cVzu38bwhTKDq6N0Km9ADAAdlZx4DnXCrtNlT+
	QgRiuENUy3EFxqtsqL+MGAjnlOqecuARcy6w9TlgT4GQQ/rp++3r9bToMiog5tU2Jl08UT5EL/5
	aO23OUsTO1w8GqjPtema6CW22e3+Tlk4PByoCWLDMfmSgFjlndEkSh0h9zSvLOuWJhfzig2go12
	Mlc6wvJdNhgR6X09GKvJ1Df5+Nm5OyIxyyd9wiE1v/t9EZgUV9wrUxzclLwEMRhj5cSaOqdsVhc
	Fom/MyiI+KYPoCcrO66MuTT16oULVzvaY2aDD4ZhJvsQ7TEz+1HBgrJye
X-Google-Smtp-Source: AGHT+IFhT/3lbhxw1N/ErfoHK46Ys1jGbT7IoE15GimhHr4ref5PyGOaNXV88P9mZw1kjxSvsvjkyw==
X-Received: by 2002:a17:907:94d2:b0:ac1:ecb0:ca98 with SMTP id a640c23a62f3a-ace5a48320dmr460145566b.26.1745577981539;
        Fri, 25 Apr 2025 03:46:21 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:51 +0200
Subject: [PATCH 1/6] dt-bindings: usb: dwc3: Document usb-soc-be property
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-1-f90f571636e4@fairphone.com>
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

The property usb-soc-be is used by the new SoC USB layer which is used
for USB audio offloading on Qualcomm SoCs.

Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b6538246adf746fe7ccd6df936131c61444..07549dec0f74234465fa9b6ab21871762a2f5127 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -38,6 +38,10 @@ properties:
       - description: USB2/HS PHY
       - description: USB3/SS PHY
 
+  usb-soc-be:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Link to the USB SoC sound backend
+
   phys:
     minItems: 1
     maxItems: 19

-- 
2.49.0


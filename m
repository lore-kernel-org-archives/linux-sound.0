Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FF426B2D0
	for <linux-sound@vger.kernel.org>; Thu,  1 May 2025 06:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082160; cv=none; b=XF4Gz8IXCL5OcT1f0uH7Scu6WgfjooFo7Z/goSSoMgQkCapaCdR2rf2TSYmTK1glhfsg+FRDTjQXknrEeAv+JeJNmWyokFvOtln90Ek//kcs4fIYtFiCnWnSZyO5iEVXxdD6QtQILBaz04oCZu/cFF2gm5YzkzlBljCO1FgGJBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082160; c=relaxed/simple;
	bh=538noH7wSha6Gfe6NGpoKJ7R1j0O3wJrwD4f0JHuo4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ak4OKqNDR3PGzN2ugzzvJ6dBpg8+0zc5mBXJL/+gusMMyyhmTualvzmt9dteHUo/ec7z2szB26lOneo/Ho2LEC3CcaWLw9fU8sBY5/DzBO8nDDbWokNUxbwLBJVSHvYjbqix79CTRUX/D9iB3pPx2jCK+MvotL79Vtae2aCuhOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DejFtXq5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DejFtXq5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso1258637a12.3
        for <linux-sound@vger.kernel.org>; Wed, 30 Apr 2025 23:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082156; x=1746686956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGJYx9JJv1up4GGUdlgk1bx9YrInkIDVtN8toig3qkM=;
        b=DejFtXq5mr/gZ7bayr02dpHMSvIvndKRLZTrUFALvQTMvocibwiA+Zh9mGo2QySuHw
         M46u7aXwT8HCIE/xl163OGetS+qjT5wAEUQt9Mi8UWieC4siIUA3fGHemy0w802aYadx
         lAar0ctn9YRNtEqtwfposka8VTb0P6n+/++sCOjlchTh6vPoWzQj+sCh2GpvcaZ1q5OK
         cS938Xqt4z9nWY3TvBA6lwSE1JtTTd8Hm7zdht0LlDxFC7GwAgCmRcR4jZVjnYmvEflp
         CRdYOiaHEKCCDxKX+irQufWoxfCl89Hrv7qdd3kEtPa1h798nrTHGeplsHS6WuUb5Lf1
         lrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082156; x=1746686956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGJYx9JJv1up4GGUdlgk1bx9YrInkIDVtN8toig3qkM=;
        b=TJA2UgzC86PRJGduqNUrDMxPKuInQsIA/h3KshPG0I1k3y93d+TMihim2kEUTMGCp9
         hhrw+3nrIUk/AvlvJobxPlD1XvDgdlnVjGBPtfr8wfKjjylinBVIUsdrOPRIGhHZfhEm
         9rzbEjhoUeZA881Ics6x8NGU9KVrVKDD3i5gSKXAfd77HXElFslTxBuGJ/YTheHqwJBl
         /0Z/mA3WlSmqqwBd1k/kaZWnwD3GwpG2oZ6e+35Z3fOLexL7Ykft3DhVyWhuQs5PdcsQ
         3clbNEqXqgeOslEOFi5/boBXuy05e5KqKPDDN60WXHb+vd7Y+og2VehsPidkxFK47wek
         LObw==
X-Forwarded-Encrypted: i=1; AJvYcCUTtbYJBcVm+K2/nnIOauOmmKJQ3pHkZlNPhmYxnm0yE/NdiQ/JFZmOSbTgP3/HcT+ox30y5Kd243hshQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCYB0UCADT6K56xdTCM3RVD4ZVaLspMhb/WEFG1SmpRR35Tadr
	IFzibtnXcnO/addEGuSHYGR0lMh0LmaLR4pmsj0rWNf8Kb0acS6hWH+/os7HZ88=
X-Gm-Gg: ASbGncuN1a633nlFDsj7MBTSgEzAnxOzuQ2d1XrUn6js35JJ1x2NTPk17QfTsavrnnH
	Xg4LQsyz0UO7Z9D47eeQFb9vwSvIEf6sG5MG+xrCyDI47xy9BpwMemH30IH8eeYoW4vLDmTWzyN
	DI818X7ACZGw3diSC3mXSt3aL1TH8pIpTVwli2NMvhG8S6szzbPkEybcWvGzm6zacBFrQmNwa6g
	kCS3/UuZO7hwLg26DePC+3Z535Zm4fIvdnBjeBHMbo0pTl421V9uvN8ZCP8lnD1uUfPIk4nxv+V
	NZiw3aL5NxVMS6YX3BfSt5hCWgtfs0ErZOzbcTXZaFy6bdfbcZpafjtuy+uc/MbPeRJth5gBJ99
	D4jQ=
X-Google-Smtp-Source: AGHT+IESb+QLyV3Vp9nFjqLZstSoj0lTzPWBk3gdi1NsT9A6t34AFz5LTYb9MDeueE7IY46205q5+g==
X-Received: by 2002:a17:907:c23:b0:ac2:d0e6:2b99 with SMTP id a640c23a62f3a-acee2404095mr605506066b.36.1746082155788;
        Wed, 30 Apr 2025 23:49:15 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 01 May 2025 08:48:48 +0200
Subject: [PATCH v2 2/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4
 sound card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-fp4-usb-audio-offload-v2-2-30f4596281cd@fairphone.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
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

Document the bindings for the sound card on Fairphone 4 which uses the
older non-audioreach audio architecture.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 57f62a228c262f38e703816efdcf443355052619..6f82e5cf6df30e021692015df9ad7b09d4b2c7c6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard

-- 
2.49.0


Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F89D50F;
	Fri, 12 Apr 2024 12:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924074; cv=none; b=nblxp7gEAsNULxlQtgU5mlpgBpwvCcAdYAHCl1NXMm8jU7PSTwIqjcOLRA1kIMG0UD6HZUdUqPKodW1XmTgHjUFMv+m0p9b78lLmZCAlQRrYFBUJSUPFvwAglCCegGh7dvdEjG8hTyh0njN1lsHXFvzUgSfsm3KRrusjTZGJ8nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924074; c=relaxed/simple;
	bh=JsH2Bl4z8+g79OD6+OMeASe1KZSq6//RizDUCnkdXzs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cEmhXAP0hNBJWqeflVCKwbMtQbQ8qQaRjsOZhVL5sZPyXy6udzf7nsPOfZXK7Jx/gsxtqa/t+3Sq/vGYbhVhlUhkv3qaQ0ZygA4Y0Pw+vaoZsSM3T8ljTJgCFClNZryzWuww5dPzLMfmXbthSAwb1AV50zeHBUosFf9iGitWOls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F17WjDSI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F17WjDSI"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ecf1d22d78so123214b3a.0;
        Fri, 12 Apr 2024 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712924073; x=1713528873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IRYGSIp2GD5yApmE5jSg2wil3KrvtIN27U/7TrpcQA8=;
        b=F17WjDSIcx0VLOHUNERGJKkmjAljvAYK4mcTr7SeArSgLMXCwpETXTaVxs1wG1wSoi
         f2K2uBGdUn/4MZgPwseGzw815I8Q/K0yWu0Gft+hGEwevQDT1M0Vnpiv7BC1wYVTauUV
         DxJVhdUvHxL3hOC5jNJAZicfexv3z6rgl3LtYlxA5JX3qPqsx+w8pEOf+zWVEctuGvSx
         +XoxKWypT8xTRtIV7CXHdvrCQML0WBmmO2CoDkQGZUg57Or1ked5vmQzMmWeWs8cIzXY
         ypLkoCN+f9U8N8D59hMCW2pNXppCd5KWtKKw2mK1r2MNRgDCn0P033c2GERxC30aMbZ1
         VfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924073; x=1713528873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRYGSIp2GD5yApmE5jSg2wil3KrvtIN27U/7TrpcQA8=;
        b=Uz28LNa5qGZ9E8xO78lDv6tJIcZJotPO2b/6oJUBvEqbwh6OQIxJiV4YGVKQjSZXBZ
         0svnvfIoepKFHsmATATE2RZZMzrbokeWzqnPUWsD2xzZCwwvWgPViSeICCI9NIwKye6m
         Llc9f3dSQBN4FQEDFAN/qdtM+kogET41yXzCSPj19R9X55m47ONEdWLwG9j3hS/8inWt
         H/9M+64ReXPxhRK1mpm/o56nQfpp2hL6FZG3/8c9iBkb8mDRfZC97p2yBfAU2Kdip3Bj
         F5V911/LEih0vkaQfjwfBU8vbTKtPvbsW50DMOmvoBjhr62LywRVRAwKYnNQUam52w/U
         haHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEk6c5RCTOezCrOlcBQpLMlPH89g9SAz5YA/ASKzTjm7XZsc/HlhmS9fTjorYlS4iiNOCYshfA1SaDeDbEi3Tc8w/ygfkImg+YqWWFAZ2wOGWvQdk7L6AoT7BWsb+oXoWqnKOL9Wvf
X-Gm-Message-State: AOJu0Yz11QG/awyIs09lDZ2aYNvG49nweHOIz7/A4oxnw4GWnLDasIOR
	keYmhtv+hwBqm3q05jrO7JX4dBbNahuuJ1+lpfsPBVCBkteBIzqsZ3BKWQ==
X-Google-Smtp-Source: AGHT+IF0gsjWIjd61CsA07mNyis/Uha/+mVglP3A5sTGDf39gc2JQU7LR8Cm2ueddX9aOWwVsKYvYw==
X-Received: by 2002:a17:903:2442:b0:1e2:c1ce:5b9d with SMTP id l2-20020a170903244200b001e2c1ce5b9dmr2390296pls.2.1712924072683;
        Fri, 12 Apr 2024 05:14:32 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d5ec:bd78:342b:a748])
        by smtp.gmail.com with ESMTPSA id q4-20020a17090311c400b001e2b8c91f04sm2851189plh.22.2024.04.12.05.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:14:32 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ASoC: dt-bindings: fsl-asoc-card: Document fsl,imx25-pdk-sgtl5000
Date: Fri, 12 Apr 2024 09:14:10 -0300
Message-Id: <20240412121410.2948048-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Document fsl,imx25-pdk-sgtl5000 to fix the following dt-schema warning:

imx25-pdk.dtb: sound: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx25-pdk-sgtl5000', 'fsl,imx-audio-sgtl5000'] is too long

Fixes: 4189b54220e5 ("ASoC: dt-bindings: fsl-asoc-card: convert to YAML")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml b/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
index 42ca39eebd49..bbf6fa1a2012 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
@@ -33,6 +33,7 @@ properties:
       - items:
           - enum:
               - fsl,imx-sgtl5000
+              - fsl,imx25-pdk-sgtl5000
               - fsl,imx53-cpuvo-sgtl5000
               - fsl,imx51-babbage-sgtl5000
               - fsl,imx53-m53evk-sgtl5000
-- 
2.34.1


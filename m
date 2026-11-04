Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796076;
	b=lH7yp7oHvpLy7AHk/s6vTZUo8ueQSEIk6qvTNiV0GvofqdYOH88xLYLyHdNEeIK+rUww
	 6YDNfKRBg6nY4k+SRgE2W73dXTRznbPIWYIrHAgKlUSjghdoyqvSieXMO6X4GYAV2flLY
	 6lGbx7meaKP7uqqft8pwUf2v+H61v+O+B765N86l7jGupp09latrmG23k8JhCXgwIzyxm
	 DkAiPmTdJUMV6ndldDRieIFQ8EL4hetbd+JCd3jY7T/zNCg8Jhr6H/eCMUMp0T+YdKSRQ
	 PYd1jzOQuyFShOtWyqQAyM5PuToi7A59+TJTUmiUYW3kBW7Vvsr0NhXRnbucmpV6uvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
	b=xN+qwuE5jqYAPJakE7dYCrbfxEj/gqTklIa8SrWOGyKpuH4He4WFeS6mQY4KM91Y3srX
	 jBG/ATkoxNBbytA8dqLQz6Rjp99eIor4a2nZltumcDBeXczaeRTELoYkDpGgehCbR+8eq
	 PNaTbO282Sd3lzXoP+PVtemS4BAO8n25g0mJzCcPfq2eOnyV7wQy36HyswV1/PgIggDuH
	 eFP4joLpY82SXqfTKnhkZDctl6o9nsmMTIEs93RWg+MR8nmOrFT42NNpqwr6eMy9DSWiA
	 rWkzuaeczEDYpeKD4dTl0U+Y1Jmuuk1VHzzH3meAf8bY1ZMxVZXOPMu8M5IhrzJ9k2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSqtwQi2;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C6A606A330
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 12:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C6A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSqtwQi2
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so6520525e9.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 04:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796074; x=1794400874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=OSqtwQi2DvYdW/9NDnsfd4FgY18hSmMQL1OgPhtx7ddG+pD8os18yaDsqXQNiF6K5X
         VfzHIMbUnVLQipkK7O2+ICU4WweZWaeNl8oYNGHQ3ZNFu2wsz266jOZQ93OMmmUgB667
         d4kkuvpbx69nmjeyhn0Hyulzm4QxVRNGNsMEjYdBp2L8tQYEk49N91F3CL/98GmGUJ9/
         c+hRjuXNqwZSLEtMhj0CoNtvytO8U5NlcqcODMUb8BJSKRSRB8PNkbnkHSVQNoxF3p4Y
         rg0lTVu9OdjgDya8m1qSsJeLYCrU/vefTFGv4R/X8Xc/OAK2QAPPHfYO+HRO2YBdIMSt
         xyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796074; x=1794400874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=FbU1rQAcWz0Mh9WESvPzqOyI4XD8DkS1RalDbb5VRNWg5zAa8YRQL6wSyxgv0eDZXS
         XSRUv2yTew/JhtMDDrE/5ud/DoROiEKg/XiczRfwUyjipij4OxUjDt1qw9BjdrRmNWv0
         bVgziCXrnumYdxjFG3JRRDMWiYxTaJApeX2bD+b5mI7j4jwLpAtNWZaDZNxguwmPkSs/
         iNYYEcZpNwzhWzvZFXfR2ZrQK7YvsomqLfs0lLjbr2k1LfTeg6yBNhn/GSWJsqgKx+Eo
         LTlB5PIp+lnC2KNjQWTEk7Pi20e6Y1ImD0DTJfIkma21vY3GrFE70NOoPmW7lrzrVIRe
         5yAg==
X-Forwarded-Encrypted: i=1; AKwUvBwId7BsL1VJknMcp+I1VXrGAllDNLdI2WzlvtiTjAAvqD0muS70Lchce/XTYuawRejh7Q3nvT+JiXGYgA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8MnHRUOnIoPfY9/+A1UYOHyTRIY+OypW36NBV7U3fY0SIMfkNp
	DznTsXwj6qBwI8byJEgYez3yxMR56KklHSz5W49+31amYtqdA9eR2q1F
X-Gm-Gg: AYBFou1VEfQFf+wDAXyjcTVQlje/LKzt3IcqgeM7uJs4pQwPXbcoepNwVlwpPZn+8XR
	11ntoeJifjumZ8DsDP/Q56r28SxBMBz3Hr8+MFl1ydyixYB9t+Xv4vTEfOMI+cXqvRMP0e9T4CA
	bfG5NCPiU5cuHYgA01O+v33oJ0znB0YeujYUNmR2gAP0IYG9M06Tu+i4cwCd2R9aC+/TOAFt4W8
	jaNsgSE6blvbnWLy7oa2K9NoEQXuBzwKJ/QTa+NNyd9k55VcEKJjkoFydomdA43aoaC6lXe4rR0
	yBTDhfr7ueJEjXjrP5oN1R3MkCjUqTBIKnqbwuO/lsje5S7fPHISdbMk7MB3diOqAygojeLPILH
	rxddln5hX5qY+ZuZpTBNXJ7ujjnP0ZKHYkBEff7mxq5e4zokUa/rtmtFRP9oLQKechdm7lUKePb
	1ovSwZWiSwoXfUQnUJXwi4whIfFKjex8t9tPKymbsRssSeh9e0dwsxJ9j5/gaUB1zovMRJ5nYJQ
	fNldATeMXqubhIjXThvKuwZ6c/rsPbk09Vvj6oyK4RO9/hJ3CDq95F9682svOa5jIOwOPPxBD4u
	wkCtliXC5jdCLYV8GldL7Hj6DY5f2PGVrbjSR1kuobDV3YWMxA==
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr370091705e9.32.1793796074373;
        Wed, 04 Nov 2026 04:41:14 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/7] ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:53 +0200
Message-ID: <20261104124057.240288-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Realtek RT5631 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44c99..3f5f7638cf84c 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -36,6 +36,9 @@ description: |
       * MICBIAS1
       * MICBIAS2
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -49,11 +52,14 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0


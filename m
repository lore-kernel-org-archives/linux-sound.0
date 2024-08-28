Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CEF18787A
	for <linux-sound@vger.kernel.org>; Wed, 28 Aug 2024 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724853245; cv=none; b=AOa3p3OdmBNhaa80+s3Vtrra97AP2cLbCQnfSjDol6qe1BS3FbfW+LA2/Gc1wMIFWnQiBB8KNbjodNRq+Vkia29uAp3SLem+EAMavVQM1JuQoALYNCaUDdmukhmArSetMS6yY/ZbYIW+9yr0wpsUGnGpRQSct5C+kjgk6F5sznA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724853245; c=relaxed/simple;
	bh=H1c4ha+5GYzDLEbE4i1lNMGNdBCv90PmwIHjIeK7TAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LcUVp6Wm34+lHdQs/p95OfL/YIhNdyUJPQ9qviL5dbFdIfQ8gm6XG93ckD/Mw739l3CH6viawZeMdJ7PEGYcy1HnenrTXzZuoigw7rEUHA8qTgIy6jgenf5BMMfjGmY9aCK3WXa+wTcWqkW7r2bzl3xEzMDgu62p8RuDRv9MwkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NxcEuBDH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NxcEuBDH"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-428e3129851so61230525e9.3
        for <linux-sound@vger.kernel.org>; Wed, 28 Aug 2024 06:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724853242; x=1725458042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKFmLO3/lL3Nmg2MZkLt12OObockGDaQF70Wv4NVfcg=;
        b=NxcEuBDHD6RqmtWVkfNP1fPoxJIBN3KSJttqhY0tKhKM8oodzFJdH8XcYxa8con3kc
         Nnm9nku7QX78QR+Ng6yt065KnjDUpLQkRpcD3gk1wT6ogkCkoEAp2E3FpUDlMT52vRey
         YQsuG+PoBG6DBnvGi7taXvihLbnF5F8KM9I2c0rDkb72L55q1pxnK1YKBt3/ZzQspj3g
         h1FqGXKJ5TMSKMDHfiVD8Oae252RzxAWnf7hhdy9OQPkbKJG5M3bdJRBgZwc9JxqTYmh
         DK5fSoWuyL+tYA8zHuj/c39SNnXDu/+f0xPA3da5tAlZ/1M5IK1ERDZqeXPqSvGKWcMp
         A9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853242; x=1725458042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKFmLO3/lL3Nmg2MZkLt12OObockGDaQF70Wv4NVfcg=;
        b=B7Ce6EzANwcR6NvI3JQkBuN+NpS/Aqhy0NbQghAh2thlf175KqJ3VLo14dHLU9qzaC
         hVa3EpSLW7VL0zK8OSkcgSwpu6IDVOZSp+UeUBdLRSLRwnqTTXdxrMDsTVz/2PtizUsW
         EldMR0wrFvNGx5NpknRqn3IMMcZRqJUM0x70b3HktzFuGqeLijLg8NCI9rnjBKmTXLfu
         aBJ2IIsIXSC1Jsjo6uW+Msx84Uk8R5OEn/Ro1Cttfaqn6rVWnKLb5ZAIJXI2Z1e+TZmb
         oBXUldRgMb5Qn4qpD/FoFEcCEL0tyhKn2VsO7yX8xryN6TB9md0eZLOS+PBNDerV59hv
         Yihw==
X-Forwarded-Encrypted: i=1; AJvYcCVLCYsAPm0JQulP6RPA6LA4QIgMvEdGKMSK2/ERR40coCrVgYipEOQqwyh3YX/f7/qJ2cQO7FVkrvJNUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoIGw6VeulmsUteYcUGD1SqDKrsv7Ivi+Va076Em2liKFEr/U7
	jPyMQ38BtEzV3RqM+XTGyWfMl/K1QCgCocxGzYTot4jhwP+soIyhmGjWxhYH4AM=
X-Google-Smtp-Source: AGHT+IHSwoWHMFDjpKFcK9pcwJPtwmfEIa1A/D9/8Z2Dvd6+CqPWbqEAoRbKZE5vSyxTCHeL3rK7vw==
X-Received: by 2002:a05:600c:19d2:b0:427:9a8f:9717 with SMTP id 5b1f17b1804b1-42ba64c2453mr17313295e9.0.1724853241539;
        Wed, 28 Aug 2024 06:54:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c44asm15613395f8f.34.2024.08.28.06.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 06:54:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Aug 2024 15:53:54 +0200
Subject: [PATCH v2 1/3] ASoC: dt-bindings: amlogic,axg-sound-card: document
 clocks property
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-1-58159abf0779@linaro.org>
References: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
In-Reply-To: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=H1c4ha+5GYzDLEbE4i1lNMGNdBCv90PmwIHjIeK7TAo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmzyv2DUmjHipIUmDw1VvFv3gYyKSp37htJ4T7g7y2
 Yy5W4c+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs8r9gAKCRB33NvayMhJ0UQcD/
 wM1sahnvh7BlHNGmJyn8QxdB0ucze7tbl3ftwdIlJoqnyAF9V5NGDbe15HkoR1MXxiIICMBEVrKl/8
 +q1dz5aZMfphY7lHShsY/MdZ6lNm7kSOSU8kM9L40Nd2XOTkr5PU8mfaONDidmxwC/jFiPHE7ilFpQ
 C5uYMvoa84cRrhXVk4uMPnkA8w2qybW+LfxiEUvlt5fNv5CkDlRdogs14syofwQdCNe9ezW8UR5pLY
 ivKIGzTSD3CBNUsmnzRx3w2wFgQ9ZJ8Aca9D2feC1G/3c3CRbWUzvs9WkzKYY+XEYtECJRoWJEx9Ot
 8yZT/colrVm615sewPkKOMszEzWfm3Rc+bojYiiIJTIvdAQDv/VUvt+BFXdfkdqdIyvLhVvAhp5+Hu
 ch01cknvRXXb5EPJ0lu+sKGMnJ7KWrs20e2kJRp6HLRkIhKpvDrJCWL6Kj/FWdJcBh3B7TRqbDuycr
 BVLF/PYIv6xGoCzxwKihusUc0faG2WzwlJybQkrBoxdkM2lYyR90TlII0fuBYAGEcunlDs2Nfs5JTB
 2FFrFaM/spiPI9vvfhI5tr/4jk+Z1qIXo7lQ6PLam6VRz2jnhGMs+fsjnuxYibONBgsQ7T8nprvCkz
 wYDlC5p2qBePzz82BZ9ZopTxv1KqASLS4YV4Khg06DsRsXdmrk1Co7mrATag==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The sound card design is based on reference PLL frequencies that
are the root of all clock rates calculations.

Today, those frequencies are currently specified in DT via assigned-clocks,
because they correspond to the basic audio use-case.

It makes no sense to setup clock rates for a sound card without
referencing the clocks for the sound card, mainly because at
some point more complex audio use cases will be supported
and those root rates would need to change.

To solve this situation, let's legitimize the presence of assigned-clocks
in the sound card by documenting those clocks, as it describes a true
dependency of the sound card and paths the way of more complex
audio uses-cases involving those root frequencies.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
index 5db718e4d0e7..4f13e8ab50b2 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
@@ -26,6 +26,13 @@ properties:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
+  clocks:
+    minItems: 1
+    maxItems: 3
+    description:
+      Base PLL clocks of audio susbsytem, used to configure base clock
+      frequencies for different audio use-cases.
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object

-- 
2.34.1


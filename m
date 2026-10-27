Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102462;
	b=2taXFlSFmjGj6jaSFietxRZO73fnsNvehUcFTsng9NgX4wN7nbKR3QbZWgVSjDYiw2c3
	 qOBqgbCwIfgCNtyxQ9JTqbhFny+KDtAiXbxgpFJky2inF0lJkJldrGfyKIhyilLvdsSoE
	 RqnIZy/1Ic57fRui71Iy093t2n2UDBzN7wA8n4ckKhw65n6wr83+oxYazqQX19Byhh/ih
	 wba4YggO9I4TuQZ9zLaXHwkkDPpNCr8ypKOomGuWlAJhqXuCkd6LkyQ50YEvi5UHaQT4Z
	 Tyf7vsEVlvq+JUyn+nJ+RQpNmuftbeJUWYlfCuXNNP/ShhuDe09LR/f43eeOC2B1n2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
	b=lDeycgo/2U14jpAnOtLJdKgqN/hH+FaNwf4e7Xmegd70swO8m1Gxq/x096/7dLRu/cta
	 M3uDkezewGHExDaH4FiwfnHyWPpaOV2W7O1ajRkjr+Ve1VqpDcb+VAlQwdNb3EozBHgPw
	 7jTsLktcwA34NIoJpr6FWeYQOU9Gt5fz/Jmnt8zV0xAE5uMn1Z4tGiHTwktx8yVNrH2pj
	 u5LozzcAc4tGFPl/MfbLBMOSet9VTMepwxHUcwx4dm8WKNrTayMF6UH9NnPoRDKiaE9JN
	 h4fquRRnCoFiFA+eqU57EiKiO2dLiN7J1LWGmpXXkFdMi17k5840W6epVDiqjMAhlAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xjt5mWv7;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB69860A2637
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 12:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB69860A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xjt5mWv7
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so4997558a12.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102460; x=1793707260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=Xjt5mWv7K++mwN/WN03NfQkwgE+faDF2HqvMmYn2EVFGiHAcKg7buiJBbJOQfUlSdG
         Wl33eAegRGaOwGLBg6BDwCZ2xspHbB0SYvdGx/FX+gSZNNP4YsRBCHKthMq7rcYzbcVE
         RL7ibq4ad6sGu6uIDpyJRpJjy3vhHZlsOeavUmhf27x7rWR2vaOQnLE1UrsoWw2mGkdK
         QOljAfT2YC3szoE2jOVVlza5EZkOKT1FW1fU1gMjo4EhaE+81YdN6uessiYM4+/vEd/a
         9c29+3ppVjNv1FGY8bYTUiTiMqO8FRY8zQ4T/gHWgc0mZCxxWzABh8dA07/5qPNjklzE
         pshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102460; x=1793707260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=eU0cb7ZsRMRtTikMeA70/wqveY5iaNuE4vWXUp72qJ61z1Y8+94gX6TwGUWC9pBZfV
         SqR9sofwF3Rmo0kKPeaoUClvyGKjT8hSoTyTWdgcYeFUwH2clroy39eL2xwp4bHz0qoy
         SfjLwflcbkQuxVfy2iSkE7+yYe2ryxck1U7wruTwO3pHM1NOB0A2B/buIugS+kRFmDDb
         N+q1pxZSIxBQK8g+vml5nh62/+IrDIbg11pv3LUeXNRp3sn+AzWy7K08m3lLlPx3q9XH
         i/JpCUI3ixU2jFCRO3IK3FXl1mKdS7O30cWjLum38N0Wr9pv36Puf4Vsc4gSgUG9/SZQ
         NaMw==
X-Forwarded-Encrypted: i=1; AKwUvBzPqfGc+cEMjEi0D8ldJWpBCsMjmxCpYB/9mwOz+WoYHTwJ6Wre5YG/jKYMTk3vt0oa8CNC/63ATUZrvg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJZkmiY4Pnyq0Hn7nunryXZcFB646tr+4T0NX5rZNeQwzuTXC+L
	7wAzGPIBm374Bu9njlTpxhdovvddQfpAjbltzsrtsOaUBVIm72vMDQM/
X-Gm-Gg: AYBFou1wBYlMMZIIykXTKG2gOFk4ptMpniZnPzlc3ToSK2ahXT/Pimn/gxptVC/k+3L
	Mp6ldueLmpt2xzk/mZ1dYVnHk2vzymFeHla5RVqbsHHMWhw0VPlDEsjeCEuoC/A93mFgUBSv5M1
	SDLlodjhvw/wv+yyYp5co1Qju/TNmJBh0dEp+9X5N3YzTVz8O3wKDwkQSKCuk473KXfnaCmlOAo
	eu1JMarpHqWI6RQqfhvHeG8nfQZUgFMrr3iDDO2MvdyHaxaSwRJhovAd+dtLHxRTR4ZA1gNKzZF
	o4RAlHzlhQBr2Vh9Y3QhomJyoMPOvoy98cMxVow5CM5Jf4p6fJpQpzjD2rLWB/w55STB/KgADbk
	3YY2QN0+8mDDPwa4x4n+3tE/ir/pYNFglb8KH4Ui5Mrjcqj7tKy+6Mg2Gv++PADFdhimfPro8E0
	uvJLOcF1qZuuuu1Qst6GNrP5BnCyCZuprRc0j1H2dJkefOEyRZt/y7breXxMp2JTLw2aij7LHwk
	5AcKVPT+0LoVj5q4SjIEsPZVls0MguGgnel/SDF9nMR8V0TGSuucaOA057T8TWA0X8uMXsZesaq
	vCpBcxAT4k4ZPN4ycqXA+g==
X-Received: by 2002:a05:6402:4143:b0:6ac:7d0c:2cb8 with SMTP id 4fb4d7f45d1cf-6b443240278mr10161733a12.30.1793102459088;
        Tue, 27 Oct 2026 05:00:59 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:57 -0700 (PDT)
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
Subject: [PATCH v1 4/7] ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:16 +0200
Message-ID: <20261027120019.93611-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

The Wolfson Microelectronics WM8903 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8903.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
index 089b673847975..bb96e8f790b2d 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
@@ -29,6 +29,9 @@ description: |
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: wlf,wm8903
@@ -75,13 +78,16 @@ properties:
   DCVDD-supply:
     description: Digital core supply regulator for the DCVDD pin.
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - gpio-controller
   - '#gpio-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0


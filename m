Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C7C47987E
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934597; cv=none; b=SfLZgNYpNp6Zmlnq6Cr4zjyQkn2WfDdM/D4NRIVUafwu8QQR9Bx0kvr/GKGq7dcfopbQqBZfmuZ75k+FLmNF86D0CAAnZqrpk3XEQwou4HPBic0DTaOlYipXBCCBPmZCv0ZGA/f5zVT56nQC45nXL6OfyaLDQSed8aH8bReKZsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934597; c=relaxed/simple;
	bh=cSMKtHhDDIrlu9/TZiEcgG2pQVjTFVtall/R40Ims+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hI+eXH/BpAJ1EHrIM1nJ/QkZx0pYqhb2r+bPRBB0M2TO6JERnTeTLChPjUXsjX5NBn8A393xboBgxXvE+WK9mGn7BOk2GM3JXdMK8Vjhz3vzPG+DJojHXUcL7acCXCCBLX1jo16o3Z1E7c/q+RAkzhY1GC2Q+LM5Iu4WB5vuBQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=RjT0BpcV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="RjT0BpcV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a09e2d0f7dso2580015e9.1
        for <linux-sound@vger.kernel.org>; Fri, 02 Oct 2026 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934586; x=1791539386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtlxzGADVLpRg8uWTI/BZ9pWlYGLrKbVbyi3KlCt684=;
        b=RjT0BpcVCkKgNvQy0BrMfBVvYalTZXVXg56lB07HNdeU83RLXpowbRq1itEJbe/HOs
         3A7E60NFQpfQkWreeqi08HUiD4tIvSQvBtQ14Ax8AKgAcUGw+zn25IG9onYxB4f//Sd9
         5uzB4A9XQauPmwOAa1RPwN/hw7XIE/wD04pko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934586; x=1791539386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtlxzGADVLpRg8uWTI/BZ9pWlYGLrKbVbyi3KlCt684=;
        b=22/Eur8WZgzhcexkygt9DO/kxyOzDaXxOGnVolrgjtFrxDsp669mHvC/EPKU7PieJ9
         7WcXQJteqhYP2fwnBqfChPivvg6RfdV8Vq5wSXJRndoKzQWGWr15iOoxtoav7OkJH+qW
         uqvDi76FXRCUTBGDaez+Zq76UfKpwmSM0bKVQFyNEj7msdKpQYJImG2w9cQbZjnfeQnu
         Cu2MtOMu2rrgJNehtE0UHHgqL2hh0sScgM3y0h70j1BBYgPNR2XNZw+RvKmaU/aWq9IR
         +DhQohrq0Z02MszMcm/WoeJNFCS2W57A4E52GrjZigy68Ev8wQmK/jTekXVWK0hNYVm2
         KhpA==
X-Forwarded-Encrypted: i=1; AKwUvBwcuHmnSZ09pOdpu8QQ58f2sVlo0KkPlv2D0w994vO37Z/gXEAMkMRSZio9hlb+l4YncsTWZK+JBRjRYg==@vger.kernel.org
X-Gm-Message-State: AFuF++mRHUp2/JSQoFHvSsboPEvkNjE/6ufmnO62Oc9pBO0XiWKh/3FR
	xKltCkBOGg60BgYHI8xMc6FIK+ObKMH+S+5ysFEixmCdyw7gwS9AmMKujClZ9UjwXkQ=
X-Gm-Gg: AYBFou1IsuChfzRk8Hs6yiathmpzCx27qiMsIRzkOYpUs1m0k7Dnm+ovb+9ASlpVynH
	qLrLXHG7n2QFGDj5r+aQxmPSA7gWnneYFLb6Tcbfc6uNi54ISrLpSz3kuBGmuP/3+YREJ/0hawe
	W7YJr7Yg9XVvFp8BLAwNKKKih9onTuIYfSbSP9EWUOAKaYbKn0VJpzra84YpOUf73OcDJ0iT/nz
	RyIETdoS1dxN3dWzVf+bSnzgAQ/9AII/MyzE4G3vA+PZS8sb7QVrZN1l9iwxAP7ywdvY31SoQ11
	ZHvjBmB6kZo8UpnewnvoGoRf/25f5tbAfkzmfRMHz95zfDx4AJXIPtGLMHAdINgdv74uC9iEGq8
	FOfPPYLz+9MSprotoIo2oDSc4wSWMIM1l1DmWQ/1PwpDH8I2Hpl7XFQ8cRt8rewGGblSDd4wuus
	JawCN7k5RVP2AsgmzGbvxvTr5qsioKNtHFq0hbSH1zDqk26C7cSkXx48Qzftm3+gNY8IQkHELxO
	uI=
X-Received: by 2002:a05:600c:4e55:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-4a02755a141mr40643525e9.14.1790934586627;
        Fri, 02 Oct 2026 02:49:46 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03fef5950sm37281695e9.2.2026.10.02.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:45 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:30 +0200
Subject: [PATCH 1/5] ASoC: dt-bindings: Add ti,pcm1795 and ti,pcm1796
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-1-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>
X-Mailer: b4 0.15.2

From: Michael Trimarchi <michael@amarulasolutions.com>

The pcm179x driver gains support for the PCM1795 and the PCM1796. Both
are register compatible with the PCM1792A, so they belong in the trivial
codec schema.

pcm179x.txt no longer exists upstream, it was folded into
trivial-codec.yaml when the trivial codec bindings were consolidated.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 Documentation/devicetree/bindings/sound/trivial-codec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/trivial-codec.yaml b/Documentation/devicetree/bindings/sound/trivial-codec.yaml
index 9a35dfb17349..a24a21c855e1 100644
--- a/Documentation/devicetree/bindings/sound/trivial-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/trivial-codec.yaml
@@ -36,6 +36,8 @@ properties:
       - sdw3019f836300
       - ti,pcm1789
       - ti,pcm1792a
+      - ti,pcm1795
+      - ti,pcm1796
       - ti,pcm5102a
       - wlf,wm8510
       - wlf,wm8523

-- 
2.55.0


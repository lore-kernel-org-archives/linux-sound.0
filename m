Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102454;
	b=akohjVF51IlzeLlAXS4A18ec5wYZsI+MwvF44dZ5FPOFeMzv/KM2HNXyxQFoi1+ruder
	 YxndXlYPg/HqyJ/cbDYNxnbcFqtpILbdKqi898K8bnWMSzQdPx/att+LmWf9j6+Frqvvr
	 6RUuqmUoiJQ0Rr8MzpJhYtN2kfE0ODNnqVi2u2WGiuUBeOtgB7irTAOjvEY9ONYc9Di3l
	 YTWa8XvDfijTKUm0fFnVvrtF1L2wHVwOQeSqLNUOPzyksYqmLwKq+6Yg03JeMq6Jb7aEf
	 cnkvJ7DzOl1mLBEA9FZ37owfwsLpK7GvxfLzaSEuNDxaYy0z35ENooY8j2cmih0NsdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
	b=Ouimrz/yBm0AhNR0xxIT38ytFGvJNu0dqWvgGUWNAg083hG7dLSiQ4n1oBY9FArAhmF8
	 T+OgxAEUnKiITPpgt+TfF1/kRb8SVmVQQJJ4N4ccOwG5DGFPcmRr6EjpFiDCEnSyx6xh9
	 l1tFyMAD4ZP9h1IuJ02zvaPhJQrkHU82yN5a8XNqRZTaynn2AVwyxIJ2Gdw2dNzMBS5Xa
	 2PLKwsqfdntjBIZVFkb7OeKrLCqY72i6/F9n6A75i4FlVS79tOOpz/9PvwjVeJru8MYMz
	 csu86bv7+BOALyPs4mVFGpb2+ShtRntoNarSiifwDrY92DmzvNQQ9JBVzhFOJ1cWzRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gXsK3c89;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F6360A2608
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 12:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71F6360A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gXsK3c89
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1115494a12.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 05:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102453; x=1793707253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=gXsK3c89vpWz088eJ7ug3RXM6pCdHmPR51kIClm8GCuTOQnA0rnAqT0PKP3KJSiVEO
         UpnTeF0Vo9pMjQ0eTH0W6EnXIIWmKw32WkkjqFyx8HA3h9jgzpRst9qtgcY23VzK6bfW
         zOc8AymEchMnog9IaOt/l0ZRXFFBjoGgwoGVLAh5QXQf4Y+262AgDfjq/Fv5J2r3phsF
         7+7gOeFqRj6oSEvDwKYHKx9NzzMGMt8U2hr94fJWLGyI6S3rgKDsN+e1utgPGHSD5VKe
         rwk2B+pDqiM+EEsY2sGXt6hT3lH314BbS4tVdUZlnf8DGZlVu99bmtoVA/Opc/vg2Rih
         ZDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102453; x=1793707253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=Yh2yF5ZTtuU2/NeCGIEUcukpSBECx03lZ4/7i7y7W+I8wq0R39Wgvz3beV/KyDY+BL
         HjHgwSCAGxCXmLG1rC+FNtP1Zw76ACIbdNwYX57vW5N9NPKuWCPCqY+govt9XJg8fSpc
         1hADAlznehdJotnjNOl3trMuF+wuxmoXc9T1UwaQhbSDMYbsnMM70ubsEgth60hHkiZq
         Bu0wRB3XZj/OwbCgUFZ87V7c9+APfqgR0ndy4Zl0olNljcqyKDp8ps0hGXz1iUJ8qc2z
         VxCwj0sQnMkivdaatdiTfqQ5MCxKqC7YqpdGpPHF52seM0EQb8iIZlzAd+jA52aWBt1p
         IM1A==
X-Forwarded-Encrypted: i=1; AKwUvBwNH+dcbvV+smFDWvfPPAHd1BggniZUF8j0bz5Oau2VOFOQ4U1KmF8x2HBEwFx/bl2hbc50IQkPGF71vg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJV7uHkh5ccNK3USV7hWjMF7IsSOKSzT6dos3pTHhbN36+lxCDn
	PUfnWZeb4WrzhiX33A7QBla2Uj6BjXcFGGZNStzae4xA1rsp5oJkxkp6
X-Gm-Gg: AYBFou27rHttKyTxRz+sFKwbX/Z6sGbWNObSNHXMpM1FbIQkWDSdPYnihxDxZ58q0Li
	eBLAW0SFpj3xv+m+gKnZLKizP1Wws7zn2YGIbHRaFMvhpPVQdEjsGMFA8DtlZ7k8oRH/Qs4iZU2
	Z3dKUjLpL1pBRm1VeG8nuNheq+M1/9zHOFqwkJHDV4p9oSt/CXpnCZaJYTm1Xv73mTFGDIX2qs9
	Hmu/aTGSUCqCCg+ZjnYCvOGWGCZSJhxAA9lqT+V/d/YBPY02aLcQwbc84awx7dfxnO0AMNkarwa
	DQekLP0LQe+FSvECHGrXVhmCuFjGr34GZdBixBtgGCKZj3Qotw38nE/Orybzl2JkqoTG26r/lvX
	YJYOziwQ89ByHc7TiOMDv3rTmWTCt3sHeWgn2I2qoboLJGZjgutaUm1M3/S6sFoi2rU3A8bZ7NW
	wH8tP3UnZjTU53fgESfZjtV60WZITwhLyLL+VVZJ3Y9iyhlZS0BhyFq1YGUarCDuiCBF6twKNrq
	Y1OP3/fA5CryrUlHvM6URCIvSUroW7UAjRrQz9m1oZmIUUo4n4+2vWI8Jky4R7K3wO0YA9iBgbJ
X-Received: by 2002:a05:6402:e03:b0:6aa:9284:9a99 with SMTP id 4fb4d7f45d1cf-6b442a806a7mr10453861a12.6.1793102452579;
        Tue, 27 Oct 2026 05:00:52 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:50 -0700 (PDT)
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
Subject: [PATCH v1 2/7] ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:14 +0200
Message-ID: <20261027120019.93611-3-clamor95@gmail.com>
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

The Realtek ALC5632 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,alc5632.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
index fb05988ff7ea0..939b1fbf2afe6 100644
--- a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
@@ -28,6 +28,9 @@ description: |
 maintainers:
   - Leon Romanovsky <leon@leon.nu>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: realtek,alc5632
@@ -40,13 +43,16 @@ properties:
 
   gpio-controller: true
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - '#gpio-cells'
   - gpio-controller
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0


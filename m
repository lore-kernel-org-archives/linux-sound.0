Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792878283;
	b=i9dsLIIYSGfJFXq8jvohYPhIds5KUiVOWoPbubAeekYYbClvEqzZk6UEJE+VH7Gv2YHQ
	 RUhXtwoLPMCwVnp8cIvIoFYv2Cph6VnkheG11HGzKcsGvg4FKmXTH14IG/4MCF/4oi+Pm
	 ofuHxFluX28wT5oY7JDYymqMk12bncuGlviE2MNKP3M4EiB9stTHaF5iKy+7Qu6rUsICe
	 912alu3DqpsYx357ALhgNIlS6DlM/llz7PfXDuQYiVj4s3GeskDT4x6WEwp6dmrUM3504
	 tHwaXWyHU9hweMFarP0L3Y+Xk3Lvdl7P3+s+8zNBMnZFX5TL1zh+6VzFv6VxP8Riv3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792878283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lk9d/Gl2nz5jUnyw7wF4SHbFvcIOShutZg1r9yMeJ9I=;
	b=0PUj70R4/Lg23AAPrZN5q0yM53dwnSQXYkMKfQ+F8Ff3yY8wJsWssTQm/HnB5mL7ofUF
	 mGpT+ODvTLhrMbd21SP8uzukunklilx3uzuXsyoni/aBps7Y/aVEAR+Ux/ehGI1TeKdoO
	 spFNZfhPov5FWkFOZEzbvLUIBdGA7uOnmAWvJtuB7knXIY5kYDnuypsslCUEPkKEm+Nsa
	 UKYLnFQabT8CWvJdoLpotZDBHzJYUmFoOVuE9djEww3Jb1/Q7OnsJwE4YhoYpu31CasrI
	 KsKiV5RG9y6gicjJaot0O7GLmXU8b9qhsIrxkxEhg50XR+FVgCgjyIe65PwU/WEhkGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oRnWTIP3;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717FA606A320
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 717FA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oRnWTIP3
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso19210995e9.3
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 14:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792878281; x=1793483081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lk9d/Gl2nz5jUnyw7wF4SHbFvcIOShutZg1r9yMeJ9I=;
        b=oRnWTIP3mjVegydXsW85+Os3bvWZNyu8xPVPw6LmUM1nvwSIfLCyiKpn4SWc+W0MNb
         hRVASTt35mwM0FVk7kS6c51IETKt4jBskIa4N1OcwXcG/DcXjQucVqpomv73Vab+RzJi
         rfCFeKcDHKNOKNFVM7S5QRgDvrx3Wz2ZzCLHhiIhRemDKXppwbIzdJsDfmbkEFJUHjuw
         EhSolui+3bLtanZozEkk4eu7afXguEuErlFnCZOWPUOTUjYy4vAlmQZ0omvTyquVqZEi
         6kiYKFBY4gHdwRK93LHIhHbOWMvCTIAULOLVKGcQDFDU7L6W4CJ53jW01fo3ge+xEn3r
         6BGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792878281; x=1793483081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lk9d/Gl2nz5jUnyw7wF4SHbFvcIOShutZg1r9yMeJ9I=;
        b=HZo1Yestpw2wnwKMu/Dc3a1GST7cx+mXse0SCSZFpeo+Wf9nbEIA364M3Sr/I+O9zK
         aVV7RjjloXskNhgxLP1f0ewIzidxkF39J/s2PkFuYtMe8OHTjwDDcPneN71MkuGGgHfN
         WLtDHK7hNPLUK9Z0qlswfy+1MW2UOJuKyX9/uZiHF64f2uKyxAExOP1I4mz35BoKLB0l
         mixrW+QJuhpNZNJ2Qv/81T4//SRUMJyahiabR9sZ8wdUPlI2w7yQ5WqcPHkxHKSw5Dei
         grzTJs86XgYfj6vF4gMYQsHaD6TbJCmuOG4U0oL3nCvvUgnqjD4023r01fuXEtXHyBzY
         +NoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQh6YTGx5LawZNQCnG+GsM5v70mzXXIg+u7dlOhMpuurZRNiGhlUBHZvJBpxAfvbNPPZ/5lhUgSSZM3A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVWLDRdcnLjpRN/Ottzqv0V7d8eZwvBJ3Xh7Vpo0+kUck4HGOX
	ipWRwnUQCLNIX3YSIoTyi2vwOIee7tr+0eqYe7aV0NCt8IRnCAcPgDHCwvQzvBU8OLY=
X-Gm-Gg: AYBFou3uKViTWemscHaBGvhRGhgx11p7O+qCmTfcEnndSpz+t9a97C5xQHFdEc6wFmd
	FfGT1kjh9Cka2g56x2pNZv4zwYGVbO7Wu089u9Zy8XHSppLt67SOR2kykqEOzLMzX1/NvrJ9SiJ
	pWRLphfIw/5uNmy6rWuV0tNbtY8+9HizYbqXU5UhgpTlMlb3iAOks9LgHah3KJVKFHBD6d9CcnY
	QZDPY2Otm5RtEQiUqLStOnx/7FCPX2jzyjYWzdncwhUrFSLe25h3KMO2+CYLgJ2e42KqdWbgFcT
	sIrsp0ReGfljQ12LbZpVOEqyxBQfnYOKHa5y2L5/UL2CzvTbHfUkbmqvf5akXcwiglbzsABVgTN
	0ImGA7+FyAr3KcYuly2VMrEsG1CZI9/pZYvxgQPoaUz+iZziuGO5oQ2mFP8SBlDnySBD/aVelzv
	R8ABEG4v0aLpt6gItd+bW4rJ2gLjBHkrEhgzOw/0dZzfO1A1qzWVYXLZlK6TzGF4H91yGnZsz1G
	hyr+2tRtdllTdBBdV2q3r8m03cF0UjQuCb9YXZ5gHeIWJAG1sGiIADsClltit8gndJZungsKWAA
	Jbb+7SeuD1vf3T2LA7uOAfmTBtny8jAnSjSmdXTLK3Er50mlnFqlQClfkXURqn53Trj2hqU0Wg=
	=
X-Received: by 2002:a05:600c:4704:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a35acbd575mr48866525e9.16.1792878280936;
        Sat, 24 Oct 2026 14:44:40 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm80447905e9.15.2026.10.24.14.44.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:44:40 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: ingenic,aic: Add the X1600
Date: Sat, 24 Oct 2026 23:44:37 +0200
Message-ID: <20261024214438.33342-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024214438.33342-1-olivier@mgcrea.io>
References: <20261024214438.33342-1-olivier@mgcrea.io>
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

The X1600's AIC is the X1000's, but its bit clock divider and its mono
handling differ (see the next patch). Give it its own compatible, with
no fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/sound/ingenic,aic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
index d15c000f14e1..9ca75fb80f45 100644
--- a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
+++ b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
@@ -24,6 +24,7 @@ properties:
           - ingenic,jz4770-i2s
           - ingenic,jz4780-i2s
           - ingenic,x1000-i2s
+          - ingenic,x1600-i2s
       - items:
           - const: ingenic,jz4725b-i2s
           - const: ingenic,jz4740-i2s
-- 
2.39.5


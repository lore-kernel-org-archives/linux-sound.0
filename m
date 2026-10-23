Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743297;
	b=4Rn9IIHjg4IxfO8dLqkM0lPsmX7IvR5d74H4s1FCsS7uuafKzh0imbz9GhatE6z3ipCx
	 U9tLGbq4iu39Hb3ShOVqy604jlJkzNKkgE495QJgDOhu+ndU7ouSMZw/mczyrsuArhSvc
	 ztr4D6yNepTo88O7PY6oCMqdQVssr2jYVL+f8xDrHBhc3Gk1j9dToth8WNsq6CmI6hrJ4
	 /z7RjYJ7NfasFOg2EOoCiyxp3xE9T8s2gaQcvO2uEalcV28AuHX5qVhFifOmKx1enMJzG
	 R+PyoU+/KG73Xcu4gUXIq3kNRY7FLjZaQ5mYiFfOCmT8RNxMIkpw6yFxQHbGr7Zc8xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NmiJqs2kgKUg/nVVPvElS1K3GJHM8TwPnke+Kpv8F8c=;
	b=LtxrWrJObSJwYIS8b08KjI9z00iH1vV501Wl+ePkgXTi69zp/to8mszxNevx/kFm1PxS
	 ssrXgDlryu/8FZCjuYFCqCmkFZm4nPr6fFlCl5w1zAm9o4uvD+tcwMa+P3+H3yy+y5Hwy
	 hok0skpUz/eLXQG16Nxabpmh2Ez5icdgbwKN2aVHEK9WQaBRdaXUUdUKJwwqz5fqTDag4
	 z51ysfpXxOrE8zO3P9R8fhWWXkJK1Mg9b7uhkNb791bdY4NKsO6LvLkgvTMbyR0P4pLO1
	 fmbQv3i+XFi/93Q1IM+PtnbyVwAkozEjkH9gUcSEQM2Ai0n+vOLFq9QYG+3QHJzcpwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=shrSCUWD;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C34606A326
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 08:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C34606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=shrSCUWD
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so3402415e9.3
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 01:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792743296; x=1793348096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmiJqs2kgKUg/nVVPvElS1K3GJHM8TwPnke+Kpv8F8c=;
        b=shrSCUWDJO3P86ZUe+xzX8Ud7eisYtxJcj9uofLLJ0hu1+6qrcydcuj5pCMw+qhbFW
         BMI0NjQs39Q7yR6s3u2OTCVxFEHFRoi8rKQLw9LG3unM0mx17deWNESOuTc8fuWb0enT
         RKgXziX0Frbk+5yG7fBd5NVTFRtmN8EvtT+m/hPZnmJCEbvG1XAMiM+o367yoIGYIhVU
         3zUaZbsQh1Jl3L6ZkLQVWVQsxo/yq98347ztXF1kYqZet51x0PMy/xMlABoYRbGIkbcW
         9SB5fKsXww1kAs5iIf3XcCEu/z4jKS0D/cIvYdeRGcJYjQUPZvZ6V2DnN3Jar+4etsSX
         TWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743296; x=1793348096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmiJqs2kgKUg/nVVPvElS1K3GJHM8TwPnke+Kpv8F8c=;
        b=NpbpMuzScdTfBlsorOF2xWcHbtIzgoW2zU/iGl9OBWgX5e62C4l/50YZIX57b0piVO
         jmRxEyiKRU7Znks26CBbO/J2f6zATryAEotD4FJTaf3YIdKvogZsfn9VR0whU+fErd/H
         REaKPBrZ0Gp86GDWjwufZMaskBIgWMxP8k79ZT9ONY0UM2CcG0FIWTFO1jH9ENvIbeTz
         Fh7Y2RAKJpobcUtmvIWtD/os722o26zjSSrXSQyjpanbt9ZrLka9PIcmG84KkL9EU7+C
         dqa13BoDNPJaavSX4Kg7kC87JNF5QkJhwoagUpuPWQvfgZ8cCC1mvo+uvjH7afqxIVDT
         I9QA==
X-Forwarded-Encrypted: i=1; AKwUvByDV9R5DKu3FZoIreItvuCt4/AVj33QUKajo85lPG2geweNwaX1yVguB+FohS2HuV0ef5CEN/XOdiTrfw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIckRk0E2p3Gmj5uC4nCol0KSx+EmcwWNgSG9CI4zxPgZVPdjoc
	Yw6DUaJHb4lhJmfGFXsdL9kTRn80jCZaEOkUEDeVJGdzrENeO/Dzg5aHJeggkPWYtoc=
X-Gm-Gg: AYBFou113ECUtD4B6gltoVr/vyfjSq2DJl5IqlVxRyFms2zVcKYEr/R3dutKM4WApjQ
	CxKgx/vH4DRArvi8nbmNlqj2RJhsgzzAD0CzcoRfaNeZdug4ROa3jnjyDgYlvA6Pg+LLtJIz4sb
	pp8v9gvdPpMV5GK7Dg0XbcbN6YHBeRuWTulZA5FumIQMMRzfQxiIevMt1yRvMRtu1m2m0x0fBhc
	UQXI+0ZsBQnRlhEM0H7zLGZd7ynQyhqvpCCA0Ssra4RqaBPWi2q3QPutuoxkYhXPd2LbDcMfrxu
	Mng0LGrIeZHJGXOkBDY3z0vxf/8pM8gGlDhgh6IlmEFkI1Bm8AoRQ7cxLRbhpNzskoeudNTVRuV
	hvtRQy00EjodWSsFSK13tYgcx6cGcIEavORY6hTiOw98OzB5LP+6A1r+g/68WjcqPlNw9ZtdiPF
	+uYC1mTc2MrS0egqzJ4Ter5UyFlLdhf18sURfoIuNFOxaTAqxW2u2aVm3IOSJ1DqLPiwuzabcyR
	1/SFgPyzH8TImAJ3Fl/oXzstV5g60bijAAyBfkDNBm52WajYtnj2cHzufeL/q79jI7NG6T4olCF
	4JWcoad261rT
X-Received: by 2002:a05:600c:c87:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a211ca674amr24100465e9.16.1792743296063;
        Fri, 23 Oct 2026 01:14:56 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b2absm55750745e9.13.2026.10.23.01.14.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 01:14:55 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] ASoC: dt-bindings: ingenic,aic: Add the X1600
Date: Fri, 23 Oct 2026 10:14:53 +0200
Message-ID: <20261023081454.44350-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's AIC is the X1000's, but its bit clock divider register
differs (see the next patch). Give it its own compatible, with no
fallback.

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

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5


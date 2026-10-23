Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768816;
	b=SPZt8R9eXRxIy6BUrpZBztxC089gk24/krkICl0Bo/Kk5cx59pfMn1FslzXRIIGmc2wj
	 8q041EelUVD44yeCiOABaEmlR6nRuklsd356RcWxvjHzK8X/TbTc9vmzdsuuhC8O6vlhX
	 6WaDxGbGBPsKd7tRNV9zz4pNo/pbtmcVFY30UOC+Aec41zxIRB6r4CUw4TIYxMfjwV5e9
	 3l97gXoZzByiCgak8dF/oCurimFu7U3vdnyz5uq1ZPujUubNzInpqLhirVWAThAJsHHkS
	 AtyF1xOldsOvihjt/dxJ++JqCkDigpxa+tSyrHG3B0rcyyV5NQ1F5apTvjQkkEBwRwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MJuZYhGzc9bJ2iUoM+nb3+fAyF+q3KvA6Y/qH0NIzKI=;
	b=3rs4ne6K0gM3x4NwLeiXUaCBAjACeHPatmCLcN+EuKNkso5S2OIE5gWklqSioLB553qx
	 OMY7kiiX160ptTMph5RYjx8jJJZtSgxh3HSlnvzx1etppTu+f3IYJ5x5B4lNCTPREbX7H
	 r9TS7yr4RQc4qWjszHSVbNkYYP+chHoQUPHSQdFV9HdYdb00Ff2aMO4nzTAMgWco3NP5A
	 A3iJWyfSsaiJro/ugPlil88t3Pt9eT7DSLOTCVkP8XHhSdVY7l4PwkA9rvU3PAzXWaQOh
	 SsKBuM0648uoEYbKX3fawo3MIAnSVYtMCGEHSiAIM4qvmDOQRsdfekLmyJrv8D6byIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=jdhlR+lA;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B54606A31B
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 15:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0B54606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=jdhlR+lA
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so5341395e9.3
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792768813; x=1793373613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MJuZYhGzc9bJ2iUoM+nb3+fAyF+q3KvA6Y/qH0NIzKI=;
        b=jdhlR+lAO7IDozcJvsMqFxmnm5Kt2++1YaEJ8/YCU2ez/29XM72x5C+baH4L4ooaWc
         g9In6dGBnUFVkSvPwnJMyPuzEL8ZtoF5x6Njczf+b/EUnrjpV1Q/140BEchX45FuK5ed
         188b9CMM6T4Q3sv+XwUYm41vij4jDLKv8kqCqQTdQwvJ5EJvbpyrdXMp1g2DddzRpaB8
         cjqqe6Shxaag/YOpkdekQ+QU+7yEKkbC+6qhoIhjMNOu26Yz0GVDxLqyOZZUnjZCpbJ+
         NKJQUsPiMKBGtXD4CYveFWD88fiEKHzoqgMmqm6O/rkA1OU3QF1F4egrAPeXgHlcGBtn
         MOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768813; x=1793373613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJuZYhGzc9bJ2iUoM+nb3+fAyF+q3KvA6Y/qH0NIzKI=;
        b=rTtU6SquQ1FHwUQJGUPHDzScxVHtSLnpl7JotYvEzNBVJlNH26S2LYY/bQv4INwS4v
         E8GQvvCHXOw763fnjRS1QC/CMoUuJXcCSnkn0/ew0iTRSdc4c7LTUD0JSQsVdFyy8VXF
         gHo+6rGQfbs0z3+mBx/EYhjz2iy3Q5Jx3+hVjSMbPX42jispWW/O5R4to46Hwa08Ptt6
         rpVfPEDmpr5F032G8MNeJjAeOe7B40SYrJ+7wOWkwhgtLZFMeFJYz8sbA0NvNLhDyCMx
         IMfkEOKLvVxWFMw/+GeZj7LayVMap0cHl8wAsONJNq6IEEdZWd9oH4jslTuwzVt6ZLYt
         BnbA==
X-Forwarded-Encrypted: i=1; AKwUvByH4xjGI3lUkWPHjXVZ/AVABCz4QBXf6zaGRVYHxj6vUivMTz4yGpXA9OPZzIYXd/pTR+CjwU/HYvky3A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJjptitLTkwiw8iUfmh27LiCwp3mRn5SWr06pt5aZzLHngpmF1P
	/e/JehuggYrSM1/SRYXWEnavpFaFSyUw8/zHAdHKYpUQq3J6mLoZUXQZfqfeGhsbOTI=
X-Gm-Gg: AYBFou0/5G9DGsdNaIwAfZcJ4kva30yYM6kRvj8igXXjL/b1CcayV0lNJCz4QBKyyKm
	2B+JQgPuFFiXGMp7vFCMezSeNy739OP//Ybr3h+HHPpAX062NqPgBNT8QPpNAIEcq6dHZcdRCXq
	uj9uLQRcG3W8Em+A33iZhOz+eXKH+GupHPRzVbvLdZqYXaqHRQxTADkz+tq30loxG5b9nLm1aSq
	71IdWn5uKFHsg2QXDNzw2QmKGDtBSOwqCIIM9JZTQaKtjz6/WAEhzVqtJZ1bCLerJHlParEwgcs
	x0MRrYRNESzLNwFOE4y0d8N7gJ+EYppjdJOZF6w13qzE50K07nEb+MS121XsMEHIFdpK3q22IXu
	uDNz9N0GSmk/BZuyeMIptSIs2yiaQm2nKX/uSX5GZqaEbEWc8cebvfqimfDvTHsSSKJxWxLeABv
	W46O6R1y4zDn0y+wBN7L3147qlLxzKNfcQ93Tcpg9NNiNbwQ8kqejIIyE+xGwEWYmESaCzUbg5v
	4rsrhQC/ThodlPJnZD+9t1+pX1yXB3mc2ZaYxi8vuhO3g68xYxU3fnQ8snd9kmItbxQl58es43s
	oqOQ5z1ND1Q=
X-Received: by 2002:a05:600c:8b41:b0:4a1:e9c2:6c84 with SMTP id 5b1f17b1804b1-4a211efe1f2mr42623705e9.18.1792768813197;
        Fri, 23 Oct 2026 08:20:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2a9062d50sm11683025e9.2.2026.10.23.08.20.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 08:20:12 -0700 (PDT)
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
Subject: [PATCH v2 1/2] ASoC: dt-bindings: ingenic,aic: Add the X1600
Date: Fri, 23 Oct 2026 17:20:10 +0200
Message-ID: <20261023152011.85407-1-olivier@mgcrea.io>
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
Changes in v2: none, resent with 2/2.

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


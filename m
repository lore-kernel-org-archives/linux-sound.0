Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7A31D47BC
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 08:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881204; cv=none; b=bJdgh7sIfCpBvDAEl/lfFhldU4k4KyRWxwtVSGhLWi9Zod7KDGRn9gGIU4SSpsV0jVlRz2GcSDDP8A5hX5xxuxpxbw/eFTgVUxo2WkrtZrRf9sj3El4sm8yFIrrJ1EcPkmswJNG0/jtCUJsHjw72yuunGPZq8MmlG3SARat7XvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881204; c=relaxed/simple;
	bh=xRr+e0E1CrRZ+YHQygMn9a8WYuFf1x3YFyuRTr3Y4vw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QK/9V/svkkbn0D/7bcNlxQ6DSQFxyRmjMOgfGg0vitrfBawiyd/oKk1SCmh9rc46CiP2SWn6HYO0gXi0n+3RvAjffHm75ZS7bK5IVqMB+82lGIoNZl3umtWeApQBG+de63m2pt1U7ILa4eg9buIF5d9DbWd16Wq2xf1rjNgExLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=e0qDHqqK; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="e0qDHqqK"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso850370066b.3
        for <linux-sound@vger.kernel.org>; Wed, 06 Nov 2024 00:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881200; x=1731486000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWDS+QzHb5R8GNTmjVWcTdkTeBoukg0Ylo47oa4wrXA=;
        b=e0qDHqqKetlEK/KeY7s+Lrcs7TQ++2f36V7BOI/Oyynv6B01CTV0HDd0+9tbWuCRXk
         4HwfcMSgyLFMZKUK6T+q/rUhmxcHAEgszc6UDyHoQBrE5HlP0h5gWzFdC4hCNFQIIPR/
         HyQyOKmq7PrS/G8hu5atO2i1gSUhH5aeRpFP9BZ33bafwrqBPCrRh1XMw+g7+5dwcX1y
         a2roHpUT0oxjFvMZ0iAb0La54QAen9BgsKCZ0yXoiCJ3pqtk6Ri0NTFbK3WU0Hvliug2
         TzhhqR054uB2Mg1wnuKzvyFr38nlnUOv8QUuFSCoFDM03TKzHf9e3XuiIxzD/7wFdU6t
         AO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881200; x=1731486000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWDS+QzHb5R8GNTmjVWcTdkTeBoukg0Ylo47oa4wrXA=;
        b=VSXj4PyhczXRxx0/7X2z2E2YDU9qOgK14g+9c+DvCQXUoJjfe48utNLBXt6VSUlOEN
         xRAAtBX0EU2u1+l9VBjXyC2pqS+cDz5nzoSEEjfL+7mNeGi1Gm5nnvQ4IsPHhGg37wTc
         3AnDnEDSzrUbQG8J0D9NtJuihMA9Hy9mD9HQMS99aHmPt9sqGs8UAmSNedr2tKBqtMN5
         DgNeCSUFHf2OZ2tkrXHYgSon3UN4UFpirkVH78PMROLmOcjEwl+Ga+X0t9nXK4IWdn/k
         udkCl145foNyndydgrl2MVh4PIjI8MxPzKdngj3P8+Y7558H0eYNnOr3nurFnv8bUKFh
         Bd8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV68H1sbpa+lC0PgxwwS2KjvAnkwS26lxBJmlN4ALRY8hcIfq/+HFb1UNz2HiXowPU7/2VOjV6gNwn+7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXj2m5sboe/Go5VtWDqq/0OrtKfCzskQEt2ak0HZF16jLZTZ9y
	V7DlhWanL7yFm1BLIbt6AKb03K7xpbNp+xSZCxiN/cHuQlK/ZUhF0xhVKPI4e+U=
X-Google-Smtp-Source: AGHT+IFq3M7EKWSQZDPTj/orvzmMKskePy+zdfGU3vkkTxev6C3c/lDfIf7i8VEOD92Ds53S7fFfiA==
X-Received: by 2002:a17:907:7e9e:b0:a99:61f7:8413 with SMTP id a640c23a62f3a-a9de5ed3f62mr3581394666b.23.1730881200372;
        Wed, 06 Nov 2024 00:20:00 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:59 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 21/31] ASoC: dt-bindings: renesas,rz-ssi: Document the Renesas RZ/G3S SoC
Date: Wed,  6 Nov 2024 10:18:16 +0200
Message-Id: <20241106081826.1211088-22-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The SSI IP variant present on the Renesas RZ/G3S SoC is similar to the
one found on the Renesas RZ/G2{UL, L, LC} SoCs. Add documentation for
it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index f4610eaed1e1..cab615f79ee4 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -19,6 +19,7 @@ properties:
           - renesas,r9a07g043-ssi  # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
           - renesas,r9a07g054-ssi  # RZ/V2L
+          - renesas,r9a08g045-ssi  # RZ/G3S
       - const: renesas,rz-ssi
 
   reg:
-- 
2.39.2


Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1A11DF962
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881213; cv=none; b=SQ7+dW0OOafnEcvu1iYpivZdZ28n17g5EZ5fpCCND381jjX7sRxho6thSSJmlhHgRjUoC/v6z0M5s7C68Q9gJ5jQMcTdkVwLq9hLubFcBsJXB8STCZqYWijil6miy7snbUvKipLhlyi6eyubigD0qOWzCsTchCoyYgF6QmyEWjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881213; c=relaxed/simple;
	bh=ePNkgpInQ0LHviqIL2rQ6y2GmzKSknPnZgRb0ENVRp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q8gxdX45TN+4hneNq5/BjleyqQ6ubodbJzwqr7gqep7bRPdnVYWwxsIqd1kboragrZgTFFHwf5ZAeXHOOaxSws/lh+TH09+IWSwN8dK/9yhDR/BCZC/rvPSIQK205ajbq/aMs68/2KjiaOXVKuLyGD17ZDJLyjzFayQzy8J0vmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AouwflUi; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AouwflUi"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so824995466b.0
        for <linux-sound@vger.kernel.org>; Wed, 06 Nov 2024 00:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881210; x=1731486010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjWLMa6GNFm957/fEMBAA4+F8AArRUt82KCuqEd39JQ=;
        b=AouwflUimLhoGoLM5CvhIDE1RhP3L1Srx5LALVL78Z6YVH4WiSHZQOAvGqXhfZb8dD
         W9MiKA5bT1CBN6BhNrog5w7stiIWLhDfjTCW3PKi/WY84W6i/14AvWvJxPHtv/nOgKJ3
         Q1u1qG9ARSQCMh0R79a4i/smrVrCr5+vlk/5uwEF1l8K/a1E72dfv0rYPXBhnxNhjAu2
         +h7W/DaRJvyfM1a8NB66oPToOntk/1GxOtb4b3zymwNZ59XwKbZjbA+m1ln33pKOW99Z
         LJEFxEjh0clFqRNK4mo1lHlSq7Co1OvjEQQjluun68OF2B3GAcHoB0GWmh9lqxIJwaiF
         DmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881210; x=1731486010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjWLMa6GNFm957/fEMBAA4+F8AArRUt82KCuqEd39JQ=;
        b=EzPLSqM7Xnsnz2VFfSDtaydmmCHGiih+YnBNmECqABaqN6+GRcKsdxArgUqJgxRTsN
         WjI8hNvcAj+4SPvpqb7YxPh/zJD2zgqmmxO+KVSKKnmpwdptR1bOWV/Er7htWxorhnkh
         kUtPZEcsLwIru98GV6kCnIK4Hs/qHTtl5SygVIUxznB7t7IMgTXl4LgaCq0TMYRPEbVv
         tPgaNkpuahsolqj+ZEtLNHcRjFwJgVjT63F3fAZzPPfS4PUUxbX0pcQnYYjlyvTNc9Ob
         ceEdlFOkQ6g6A3l/1uwC/Tfb2vNU5aQ/GHNcAMeiwTx0TWAVvcoNKI4DPiJlXNTFsuDs
         9uWA==
X-Forwarded-Encrypted: i=1; AJvYcCUFV6eH44aruQVXDFNS9NcU1du+dNkFGM4VJDqU0GKVokMeYIzo6XL+CBqpUJqcOWV4T60dEQucjDY3Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIljo7Nfwa/3xP4kzr7JGtNLIo+IlQiTzjdpNkmdlHndbYcMTp
	kOSwHtXF8jKBW/7H49Yk7vVI2QqLkBgv6dc42iBJsUpAq0qkLRq9aSz/EGVLXnY=
X-Google-Smtp-Source: AGHT+IGuBhZ4xAhPiQ3xPooVuL0AlYkDRl6kdSTT8hoeBeHKnrJ1huQqKWuF3NVBMkGTyEmrfTDrig==
X-Received: by 2002:a17:907:6eaa:b0:a99:fb56:39cc with SMTP id a640c23a62f3a-a9e509787a5mr1913526566b.38.1730881210161;
        Wed, 06 Nov 2024 00:20:10 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:20:09 -0800 (PST)
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
	Hao Bui <hao.bui.yg@renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 25/31] ASoC: da7213: Avoid setting PLL when closing audio stream
Date: Wed,  6 Nov 2024 10:18:20 +0200
Message-Id: <20241106081826.1211088-26-claudiu.beznea.uj@bp.renesas.com>
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

From: Hao Bui <hao.bui.yg@renesas.com>

When audio stream is closing, audio frequency is set to 0 by ALSA but
codec driver DA7213 does not handle properly in this case. This patch
adds checking of 0Hz frequency to da7213_set_component_sysclk() and avoid
unnecessary PLL settings.

Signed-off-by: Hao Bui <hao.bui.yg@renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/codecs/da7213.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 01c78f8032c4..af38b2b5e174 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1555,6 +1555,10 @@ static int da7213_set_component_sysclk(struct snd_soc_component *component,
 	if ((da7213->clk_src == clk_id) && (da7213->mclk_rate == freq))
 		return 0;
 
+	/* Maybe audio stream is closing. */
+	if (freq == 0)
+		return 0;
+
 	if (((freq < 5000000) && (freq != 32768)) || (freq > 54000000)) {
 		dev_err(component->dev, "Unsupported MCLK value %d\n",
 			freq);
-- 
2.39.2


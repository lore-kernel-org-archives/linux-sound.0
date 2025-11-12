Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EE033AD9A
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962091; cv=none; b=uCxSfMT7lcQOMSLGCiZ5+rz27+py/as7GndnOL393gKHo9XHu3KQ8Pcoq5QIUaqmtIZB2vePlvE9HbbQ85XeOHoB6rUDkp+0nEQgIMhgfuQMlmWq93J5faciJemGbhUlDA/vwkqSaSeTVIzIVSt3EqIvH2K/H7Cl4EIXjVgh08c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962091; c=relaxed/simple;
	bh=CRIWp0n5HwRdlkmssRO+ntsNrIka6hpB8QMW7u3mkwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NoXeqPIst6kYPfMrtWAEfQzK3M00OgMJ9v9p6XPsNcHiCFfBNckQzNdt0EzE5mprblQxjtaeyn0xu3ms3PNxAaT3XnysknS2KvSbsfPMIG5I/G6ydWJb2iVNfwoXZ36DgToNopG2LR4rqHKRsFgf7wURFWVrUYLrZ+gHiJrXkJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiB7AZDp; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiB7AZDp"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b4736e043f9so139362366b.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 07:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762962087; x=1763566887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gq3AgUTPzY+a4pOL3uaAaWkPNx0akFqHFeupvGebgG4=;
        b=MiB7AZDpz3iz5OGP653WkZmtYMl9BYDhrwCxdS6oiwevvUknTaz6LAGwQYn8Nmu5pT
         DuuUvJc462kKcrxbOCjS0AVZ6zpOgl1JZ3PKbYJ0O1P4kbVsaXH9A1ByLMaCtw19UAiP
         Eie9I6te1ejtPTfe67VV0F7q1L1+qJc2+nsOOfJCOGKa+2FhWvOshyBrCZXhRg4mm3ND
         mtP6OWB+gmio05ifLgCQmz5I+K16LAxRFVBTOqpm2ivo8oVJXFzJqIhuknZFkoCdjk45
         jgVTzzXEL5o5+isjfmIaV3epwM2xM82TPRPZImML+IlOEFAr+WN7si0vEvWrSLazDLRS
         KDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962087; x=1763566887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gq3AgUTPzY+a4pOL3uaAaWkPNx0akFqHFeupvGebgG4=;
        b=tlIMl9lV8nx9+GmQSQljMg2PiDH3WZV9QuCG/ORtAL2BXdPYtXDobSgdxH2NIIK/VT
         aFBPBkHZ17yodjcZ4VBkH5WY+XqdcKI0nZ9OFoo0hI5JTzKHibHAbF9zrQgy2dDCRE2D
         G3RxiDNj7YDImJ9fBX8Pm0u8FlV49D6mp+GlfXQTxVK4u6ECPEhVBxY45ranr2CggZ7N
         5JcJpFt6qcOy4w/prsvQY8ywvXAw3SXCtkMGfSSVJ7ZxvRHHFxOVu+BfKOSaH0SdeaA+
         7+NrfFPqc8sewsDZyf/v42xyhTF+MU5ZdrqYrOfOpnvu7l7QZiouC20c84KZ1ZdnuMwm
         A97g==
X-Gm-Message-State: AOJu0YwmxHSp56zKxfGJ2lguDdGrhTmdhXdNB6meFu1wMEaTbOl+DQ+L
	og7Gqokb/KE52Wh8PYm0iBt97cQN/IPSbZ6HBI9eq194SIN1PrgFfZFb
X-Gm-Gg: ASbGncsX+kC1IWc1s/4g4ZwwCuKXfq/tjTCmPUQWhn12XiHEk762eyep631zrccWQ0Z
	Zz1zJpxx1e2dOyOPdoOk7Zptk1WZ+WFU2jkBlysx+3exFjkKx6INR9bs9q5U6YDqgqHGIYufhfw
	bfrUMxgfaeruxm3z4YhT3xkz+HgknVFGMYR9+i/Day2PwR6e0VVjoGrVhtbgGXj+HRaztqnPUAg
	KcJgGqvmEtSbpJ/yGQKqt0Jw8Hx940ijsKTwg56TPC4XjGiG4uFb0pV7kQj+tocjIKVp3PKKHOw
	ilHzwge2eMt1NbmBFGnaELRRizlSSPevg7258X2cuY1PDSLvfqnOKhEv8jo1N9soxrfF6gznfyh
	A0QtXRl5sjGEsVyRDy/ZESHn5QXE6gVDBT1+noxJi75Y22KCj0jGzgQpnKisBmQIINZnMm1esen
	rfpLFII7SrlC+/fSNLoj1GHgknP15elRjclLWUwePcjuhIeqI2TY6xWgMHLN1Vo7wG7d+6YMkFq
	qBwpw==
X-Google-Smtp-Source: AGHT+IH+xX5hJrZOC7Qu2lNDzak2vwnr1s8A5ixFZilatjPXkva5IprmaQlq2uvPjZRQHXlOLziFqg==
X-Received: by 2002:a17:907:3f0b:b0:b73:2df0:9fa9 with SMTP id a640c23a62f3a-b7331aec6fcmr309681866b.59.1762962087420;
        Wed, 12 Nov 2025 07:41:27 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d456sm1670023566b.39.2025.11.12.07.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:41:27 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/7] ASoC: renesas: rz-ssi: Use dev variable in probe()
Date: Wed, 12 Nov 2025 15:41:04 +0000
Message-ID: <20251112154115.1048298-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace '&pdev->dev'->dev in probe(), this makes few error paths shorter.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 039bec32cb5e..c7d5576c8283 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1123,19 +1123,16 @@ static int rz_ssi_probe(struct platform_device *pdev)
 
 	audio_clk = devm_clk_get(dev, "audio_clk1");
 	if (IS_ERR(audio_clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(audio_clk),
-				     "no audio clk1");
+		return dev_err_probe(dev, PTR_ERR(audio_clk), "no audio clk1");
 
 	ssi->audio_clk_1 = clk_get_rate(audio_clk);
 	audio_clk = devm_clk_get(dev, "audio_clk2");
 	if (IS_ERR(audio_clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(audio_clk),
-				     "no audio clk2");
+		return dev_err_probe(dev, PTR_ERR(audio_clk), "no audio clk2");
 
 	ssi->audio_clk_2 = clk_get_rate(audio_clk);
 	if (!(ssi->audio_clk_1 || ssi->audio_clk_2))
-		return dev_err_probe(&pdev->dev, -EINVAL,
-				     "no audio clk1 or audio clk2");
+		return dev_err_probe(dev, -EINVAL, "no audio clk1 or audio clk2");
 
 	ssi->audio_mck = ssi->audio_clk_1 ? ssi->audio_clk_1 : ssi->audio_clk_2;
 
-- 
2.43.0


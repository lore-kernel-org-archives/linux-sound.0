Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9154E1E6DFF
	for <linux-sound@vger.kernel.org>; Fri,  8 Nov 2024 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063022; cv=none; b=DNzmJNaB6WoKtOznmwPLTvVR+JAkxmrVs7q2tKgpHaKB8Q9f9djHXwlAPIgzTS2+V36NvPSTwHbEHMJq1WSrJ0n886VFAlDr5zwx7+558EM+UdWvhwjp9tVMo7TCyXRx2Fj5l7Y2Vwe7YXxxEZKAWqYCtGTo39DGSmz2fLWdd64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063022; c=relaxed/simple;
	bh=gcbLp0EDuhXnLWcMfm7HepHAEOi/ma1whorW46vYLVc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tYWtC3fI+kDptgOPQ79RHLl46f/v8lbbjQGkd4iJFjgEhZ6Fv2WJcuhvQHR+0VK6mC+fFIcSehXf5bbjl06Pp4eQJ1hopuUB4aUbiyxJNGzRGOTRUo6XKaZ1tCLqnDGCb8xjY5qa2EGQ+fOIR93wBlY4YXlC6nsRP0K6H/yVR/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JYHpwHmO; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JYHpwHmO"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9eb3794a04so275713866b.3
        for <linux-sound@vger.kernel.org>; Fri, 08 Nov 2024 02:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063019; x=1731667819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9TIDVBXswiUE5qwMC9ASUWD1mYCqJbFdA9aImOCUio=;
        b=JYHpwHmO3Xe5Xq6eoP1qTEBV7R7rLrulFoSaktZ4tgiwRFL5uHzOnjbUv77xFH75ac
         35hnxHCV4NyfY1VN7Gl1Bj4Hq4cRGkG+8MsbIgPoBaQWq+fLQ2RPHGdD2xlOMjxzIY86
         gkTyhl3r8C87BmzeAxOsi9iHJdtyJKxConxafdIwYRv8eOPVeScM1PUz1uDrDIL/8wgV
         Nk6A0FXeaFGV9jT7F0VnUDdPUTb8+dFKfVRRnDUSPEyRzPTjM+kSbt8gNUmgaofHgoaY
         8Ve5W1USshjgDvKkBKDdO8r013QGy+CPEyYBiZeDTnDtekW8eYdr+UbIDBMhqDKU+v0t
         Peuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063019; x=1731667819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9TIDVBXswiUE5qwMC9ASUWD1mYCqJbFdA9aImOCUio=;
        b=W0/2cg22aLSPCa3YqgEL+3E+lIoiu1MvxV/bDFzq6Bhw/hA2efN1WAhrVDrDx85g7e
         veRzZqcOGvuK3zohQgGRczel3G2/p/PfiMxmUFlr1udY8uwThnppkGiY+rOijVg4XglQ
         7i6c5uGbTMkKGFL1YoTIy5wIDVyxuy7AZpBZ/Cp0boeS7mTDEuokk79wNzm+ITfREjt0
         ZrMAw5Oc18tYj7dhe3l7br8QpXPCJsgD0Raxk2uNn01owtYMsrPkoEh35yfYQla+9aHO
         ILIuy8LLtZ6U6kZfmQkm4LUvxRCj6HjMEGz60w/DgxqKI4NDTI9aVZqqP1cPiYqaj0Gj
         O1QQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+4Gny2EGrufn2LfS715czPhTRzuVAuYS0RsrXkBZX5NFAVr4FTT1lA9NTyWK5LEaBUQz5SXeNeRowSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUTQPVPvadN1AwnceFNyxtXIONRDJmG+XF3+b3Ul8tX9EQebzY
	jBzjuGgoW9Tn7Sn4b8xloHKi6XaGguEuGEa6C3z9tQqUzT6jGrymMdWgF/0wMIU=
X-Google-Smtp-Source: AGHT+IHeDcoAe/sAQtrD3IXuJOZe9XyJNaWHB16C9eW/o6XJaPaVjTfxbe6gh+mYzP09cZuV2+uATQ==
X-Received: by 2002:a17:907:6d04:b0:a9e:441c:f729 with SMTP id a640c23a62f3a-a9eefced5fbmr221846166b.0.1731063018920;
        Fri, 08 Nov 2024 02:50:18 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:18 -0800 (PST)
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
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 04/25] clk: versaclock3: Add support for the 5L35023 variant
Date: Fri,  8 Nov 2024 12:49:37 +0200
Message-Id: <20241108104958.2931943-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add support for the 5L35023 variant of the Versa 3 clock generator.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/clk/clk-versaclock3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 1398d16df5d0..9fe27dace111 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -1133,8 +1133,14 @@ static const struct vc3_hw_cfg vc3_5p = {
 	.se2_clk_sel_msk = BIT(6),
 };
 
+static const struct vc3_hw_cfg vc3_5l = {
+	.pll2_vco = { .min = 30000000UL, .max = 130000000UL },
+	.se2_clk_sel_msk = BIT(0),
+};
+
 static const struct of_device_id dev_ids[] = {
 	{ .compatible = "renesas,5p35023", .data = &vc3_5p },
+	{ .compatible = "renesas,5l35023", .data = &vc3_5l },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dev_ids);
-- 
2.39.2


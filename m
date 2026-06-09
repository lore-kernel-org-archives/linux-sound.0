Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFD340315B
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 11:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005176; cv=none; b=PP9EqMgdxrMiYs/6xe2B7CrIBfJBV8whO3D/IUukJUMlRaoNFGZsaHB0NaqT7muQQUn6BQ7c6ANembGzojFheiajLuxRpTf/H28PFSmUvaizdRDkXNF8o6pg4xTWM4mYi8TJDkYazsNNpNPDTBb+m50ia8KYj5zKrW+4sNvLKXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005176; c=relaxed/simple;
	bh=SsUMo+hqcHS6PAZWbeNXNV6E2THXUTZEf8/ZmCsujio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aE4+7RK+gAk8rm+CAAX9Slv1ZQ9CdiUAW1/RrBYBzDbJ40AAv46Y/ZRNT935L+ASGKRhQ62+PCZrDZ8TtcFSCL/p6GzHUWWPi3eXkBVBliKPMNR2sunKZSObXlPjAcEJU16sYh1U5UfdAMXDH+f0f2rCQs2J+2H+C9NoACKUYmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEBnvUDk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEBnvUDk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c168baac83so24966765ad.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 04:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005172; x=1781609972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btle9qlFdNHhg/yZTU5eyJZhUVYtJLKRE/IEtXriIZs=;
        b=pEBnvUDkmkrx6ZB/na9wJt+Bnjmf79cW7CU1DyRbbBv0v/Ha5Yt+ZNmp0AZHJiV/o2
         jlAJswIw33N+/rV+0LEotDJMG2nITK6ByFU2aJnA8LMoS0ZYjLGo1rg4KbRZwCVdzuHU
         RS8Oe4EpKb7lK/pxcTNH2F14+4QGtbMv0uu/T7pa62a8q2GTG3bTglCOUWJ93QLG2Rk9
         YAXxIHEIfpKTPJeLtl3ZrRXpc82uJsC/+uX4URZOkQ5U5xtaFqHcnIyfe4eI1RZ9s85e
         Ayjv8qZMshoPEoGmlyVFPdhQkOKLFcRVVCV/MLaZOkWVvq27A7cfnjDjg50lwtZwZzsy
         t+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005172; x=1781609972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=btle9qlFdNHhg/yZTU5eyJZhUVYtJLKRE/IEtXriIZs=;
        b=bX/4JlUhlC8ocH6dxyUIG5Ue+vx29vor1N3m5APRbjKT3tCnGluWcNZaAYVEEGAtjZ
         TIIocXwgE9H3A5AJ8iGqjRqQwpuUjdCurtX1EhlTMwzWAjufcS4L16BBYbEfYLwlgZKH
         bCim4l59fmkK/SpDRekxao9njno/VpAnWgh/uMNQtzsIFvMEWHmaptZ8BBkuPosgMspM
         MsIisJDXPaIGy2MK6G6t0rd6f72eLXrrDnz2912XwbWeJob0Jt0nlKsEI8nnXUT/NGcc
         TV57zHlyYWtxafg+9NsVLRqybq0UfcRUGPJQ50+t0JaG5HdNx+LooY78utItEWy9tN8t
         thqw==
X-Forwarded-Encrypted: i=1; AFNElJ8/wPggWykmp3tom+nNQJ6ZjrmWlcbU47/5zo/oE8zWWXXdsAhZgvnmqk4zGsYE98VoaZU/6Rvwjgy2NA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy91MtcCr/57B6XDRkt5HYaZbMNmuqJnwT1LucTnRbSZ7A9qsY/
	Z47QX322ugkqkDkg39g2ncy3JxUBYCRJrrxhLz2MG4M3M0I/fw33zpw9
X-Gm-Gg: Acq92OFiPb6TZTfRmUGzpSlpOOEZMh00Isyfvjdmzpny9gNcLI653wL1jC74HMqzmtI
	YyBr6pzcFdacZipJ/tbcPoGIxLVqO+1HZZwJpJe2dCkz7wO6q2B8oHHfrcZaMZhJMgFcEEmYKS8
	jM1gxf86tGglQCgJnIHdXCLc0/7zW1WqUNfU16NepEUlIgoNJTQnlt5fLHX1EV+qUknNjBnzSLX
	6mGnnAUvc3bs02Y1uzB3UOKbq8mxXYUzT9f6lxuUrRTTNuphpmibdgP3MlF67NWMm1xUg3frXy3
	ZpAZhl42nCKCpkn4UZTbib87WAHzOObX25SZhvg4dyW7s0ysgQW3PuUFvz5vHvmYqNz4Ek7Luvs
	XPLQLZHTa5+MwlWkIgE8d8iA009pWjsG/t1bDlecpeTG+24/9rjRqzSyUB5oYIQG3vyniDibnMg
	tS9Ewhl5Z7q0GzhU+jU6R0noSvu+dzAPeLGovMfhIWcfHf7LbT/HvHfB84TignSqOC3UFu
X-Received: by 2002:a17:902:f64e:b0:2c1:4310:d80 with SMTP id d9443c01a7336-2c1e79e22bamr237302725ad.8.1781005171824;
        Tue, 09 Jun 2026 04:39:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v6 07/11] ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
Date: Tue,  9 Jun 2026 18:38:32 +0700
Message-ID: <20260609113836.45079-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The xck, ick, and div clocks are optional. Switch from devm_clk_get()
to devm_clk_get_optional() to correctly handle cases where these clocks
are missing.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.

 sound/soc/renesas/fsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 1df7dc014363..e29be2bcf952 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -994,7 +994,7 @@ static int fsi_clk_init(struct device *dev,
 
 	/* external clock */
 	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
+		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
 		if (IS_ERR(clock->xck)) {
 			dev_err(dev, "can't get xck clock\n");
 			return -EINVAL;
@@ -1007,7 +1007,7 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSIACLK/FSIBCLK */
 	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
+		clock->ick = devm_clk_get_optional(dev,  is_porta ? "icka" : "ickb");
 		if (IS_ERR(clock->ick)) {
 			dev_err(dev, "can't get ick clock\n");
 			return -EINVAL;
@@ -1020,7 +1020,7 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSI-DIV */
 	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
+		clock->div = devm_clk_get_optional(dev,  is_porta ? "diva" : "divb");
 		if (IS_ERR(clock->div)) {
 			dev_err(dev, "can't get div clock\n");
 			return -EINVAL;
-- 
2.43.0


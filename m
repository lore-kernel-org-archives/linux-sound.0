Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC804028C9
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005169; cv=none; b=Z6awaCYKDO/GhKUOl9NrdyIOdHwhPMGb4+D84WdEAzFnmGgxHPe06ONt30APd6kXoqlSZJPoYqxKOu171WPFxDZJo3ut5CoxdwRMDWcZVGFvzM3OdyV/MCdmxD5spcduX6Oe51P/9uLX8e8QM6QLu9Btv81dsfPkK9QHqW1b1n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005169; c=relaxed/simple;
	bh=m996FWhRx8Jyse1pg+wk0JpYoaqx8/UREkFYUcB/3mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHjgRVE33wUbN9lhkhuXcdu9Z33nxUe7x+NnOM4cnW61MUSq0GfByrFL5cyvdaCSJ5I3aDfIr674Wlswnwb6WPnrn5A4fnXa5dq1PJly7CRp76uw2HQmqc3bTMLstctt07IBITSzSsdGJtIMCOtw30pOc0Lp+3FsJVpXI0Otm2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROQr9E3c; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROQr9E3c"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so2326951a91.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005167; x=1781609967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFE4SMGzYu6VfqVWZy1LVzG1tn7Hezp1rS4Db45ZIm0=;
        b=ROQr9E3cGqMkiJLWPAGhCFmHQ5RCEH7s86veA0+pL+HxA6/9HGQ2r+mC9uE3ufOe9b
         HvXZEnnZF75Lwj/Laj9aDLWMdzhui+5bZB+49RKYWbHNnaw1JRjH3Ea87jckZMC7rb2I
         uj1UInB/hA2wibqGNka5MSzp10+n80uBmXOsKXuU4J9z1FMYQPEH3FgI+VPoWnqsb1uA
         rEdLmbjWoQiBaoiBaobBegWyQexlzSJS4ApMFrpsFcHULi4MzS9Bqp8nmVz6UqGQVkBD
         nbDMm3NWFWtPVEUGr6e6CXzv3Hm3vVbNggkbiM4HLrC28tzYC6g30FU3/OBhwujmjHF5
         tU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005167; x=1781609967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RFE4SMGzYu6VfqVWZy1LVzG1tn7Hezp1rS4Db45ZIm0=;
        b=ECnkPs7/21fxSbHSb2dOYtJeJ7yTeK+8Ydx6UPpbAn6ZRx5C5Pm3aHBwB0A6XiR6Wx
         lmhhcfWxCDgRK8pjZNfA9BDMeFhhQczgSIz9E2T74VTLfP+NphsrCJGqVnICi3qQ1RHC
         bLyZfjbclqSZNX0JRGW/27pzb80msuVoRbg8jtEGL3BYncF09tsA0HnwflN1AStbqqiu
         2a7pn+MautxNSTJCGWI6bGxfwnpz8E+4bOJOEEjxb4m440q8Xce7m1cj+xhMQOPMG+8F
         b/A3WOcRxmQ98Tr5NmlebK5lvcvCUq+A8H3f4z9+tnDy0YxDC8O2VUkr0AbeHM5Uo7ko
         bIXg==
X-Forwarded-Encrypted: i=1; AFNElJ/OaqSRe0TnBDmCZ2ufpSXUFIbfLNTc8v3NbVd6AY0O1Sb5AzRdbWdmrZynEQXgJPaj6cIYsOeTNtcQfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXP07Ouks+F3P9kLfe4zUoNEve8T9BmHtOBiBUqzt0AtNHMstY
	ybOI+/3Y8Rjadpgbk6nzTiIHcRPw3hEKQn1folvSHh8Z0vsSvtMUnMVC
X-Gm-Gg: Acq92OEjbITcScR3HoqWvk0Nfsyl/Qmhe04OGHawzuahZzuraSKMVhZPTtH1s2cdwp4
	Uw9QMU8s0fCQl9BowQAHaHw5xtRxM+RrYKCDCL4q7je3cGVFOJzs3UDFJZMj25saQmJBM84GFNM
	eaG8SHKu4mqx7+8Ihxf3KndcVtSFC+Mt/oajjC2CLanAIPtNOYUz6VmLXmIwihHY59Hp63robSF
	GPOG9Ie6+vm2g7MROklsHJh4c3KjC4wMaTIasFN0X9ICCeSrqYqR/XFJKQDH9cJm3XIa/emw27b
	FKVAV8G4dH78QXNBDUE5lCzk0P2KyifCiVGjqQI9+ocCHxjyxHC7mg9No0xFBgVH1k+i7hwxNar
	WVj82jGiOqtR/i6Iotm69chwnmt2avjKXoWK68ZpPL5inAxmBIedWJ2xyZzwjlhN99GyG2RVYWJ
	oBxeXKhQUSl64Vh8QtQqVq8M5xjEPAkD5U+g3XDNPoJi02L4r4MuQvS9MvFyf6ypj8pCND
X-Received: by 2002:a17:90b:4d11:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-37521779d48mr2843139a91.24.1781005167145;
        Tue, 09 Jun 2026 04:39:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:26 -0700 (PDT)
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
Subject: [PATCH v6 06/11] ASoC: renesas: fsi: Move fsi_clk_init()
Date: Tue,  9 Jun 2026 18:38:31 +0700
Message-ID: <20260609113836.45079-7-phucduc.bui@gmail.com>
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

Move fsi_clk_init() after set_rate() functions to prepare for subsequent
refactoring.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.

 sound/soc/renesas/fsi.c | 128 ++++++++++++++++++++--------------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 3e3c6fd7c56b..1df7dc014363 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -717,70 +717,6 @@ static void fsi_spdif_clk_ctrl(struct fsi_priv *fsi, int enable)
 /*
  *		clock function
  */
-static int fsi_clk_init(struct device *dev,
-			struct fsi_priv *fsi,
-			int xck,
-			int ick,
-			int div,
-			int (*set_rate)(struct device *dev,
-					struct fsi_priv *fsi))
-{
-	struct fsi_clk *clock = &fsi->clock;
-	int is_porta = fsi_is_port_a(fsi);
-
-	clock->xck	= NULL;
-	clock->ick	= NULL;
-	clock->div	= NULL;
-	clock->rate	= 0;
-	clock->count	= 0;
-	clock->set_rate	= set_rate;
-
-	clock->own = devm_clk_get(dev, NULL);
-	if (IS_ERR(clock->own))
-		return -EINVAL;
-
-	/* external clock */
-	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
-		if (IS_ERR(clock->xck)) {
-			dev_err(dev, "can't get xck clock\n");
-			return -EINVAL;
-		}
-		if (clock->xck == clock->own) {
-			dev_err(dev, "cpu doesn't support xck clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSIACLK/FSIBCLK */
-	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
-		if (IS_ERR(clock->ick)) {
-			dev_err(dev, "can't get ick clock\n");
-			return -EINVAL;
-		}
-		if (clock->ick == clock->own) {
-			dev_err(dev, "cpu doesn't support ick clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSI-DIV */
-	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
-		if (IS_ERR(clock->div)) {
-			dev_err(dev, "can't get div clock\n");
-			return -EINVAL;
-		}
-		if (clock->div == clock->own) {
-			dev_err(dev, "cpu doesn't support div clock\n");
-			return -EINVAL;
-		}
-	}
-
-	return 0;
-}
-
 #define fsi_clk_invalid(fsi) fsi_clk_valid(fsi, 0)
 static void fsi_clk_valid(struct fsi_priv *fsi, unsigned long rate)
 {
@@ -1034,6 +970,70 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	return ret;
 }
 
+static int fsi_clk_init(struct device *dev,
+			struct fsi_priv *fsi,
+			int xck,
+			int ick,
+			int div,
+			int (*set_rate)(struct device *dev,
+					struct fsi_priv *fsi))
+{
+	struct fsi_clk *clock = &fsi->clock;
+	int is_porta = fsi_is_port_a(fsi);
+
+	clock->xck	= NULL;
+	clock->ick	= NULL;
+	clock->div	= NULL;
+	clock->rate	= 0;
+	clock->count	= 0;
+	clock->set_rate	= set_rate;
+
+	clock->own = devm_clk_get(dev, NULL);
+	if (IS_ERR(clock->own))
+		return -EINVAL;
+
+	/* external clock */
+	if (xck) {
+		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
+		if (IS_ERR(clock->xck)) {
+			dev_err(dev, "can't get xck clock\n");
+			return -EINVAL;
+		}
+		if (clock->xck == clock->own) {
+			dev_err(dev, "cpu doesn't support xck clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSIACLK/FSIBCLK */
+	if (ick) {
+		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
+		if (IS_ERR(clock->ick)) {
+			dev_err(dev, "can't get ick clock\n");
+			return -EINVAL;
+		}
+		if (clock->ick == clock->own) {
+			dev_err(dev, "cpu doesn't support ick clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSI-DIV */
+	if (div) {
+		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
+		if (IS_ERR(clock->div)) {
+			dev_err(dev, "can't get div clock\n");
+			return -EINVAL;
+		}
+		if (clock->div == clock->own) {
+			dev_err(dev, "cpu doesn't support div clock\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static void fsi_pointer_update(struct fsi_stream *io, int size)
 {
 	io->buff_sample_pos += size;
-- 
2.43.0


Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2115C4DBD7E
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 12:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662045; cv=none; b=KkeXC2Xi1Rjx3AFrWjxu/d7cHtMjMCo6Nn1qEoitjOEC9K5FrD3VkivGM9zcMolOLZijovrLDg+ajVL639WBYZE98cOk2W+V8daXao0eTL1yOjI+zAY2wUXrHc8aH453mPpJqwf/SPEKbf8YJ2oGFMdpedXJNXhWJceLgiyZLDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662045; c=relaxed/simple;
	bh=6JrAI+jHNCVY9D9mXTcwbzLOirSfEaNGPwbU2EKa/Ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMs7lkSbSXUTGx3A10GnZ3q6xjY7r8PYS8iwKKhqZnT1ULGhDCWz+7YTNfNMvUbE/KvDkskikoLflQZfOfOhKOWqm+YGzeCDE+sU8FyEJO7cpghQ3TqIHI54/9Hbi6GOBbxxOfBy1KlgVCYk8HEQC9PQgRGOjK8UOpdB6f3Uhng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qXcVtmGv; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qXcVtmGv"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-842338c18e0so1318868b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662043; x=1781266843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFeJyXKmHA1Uec1iK3fvTQXNf+MjrFSlqdhOvHAIFVA=;
        b=qXcVtmGvGw7GKuID7xkrFjgKlu/h04nD69yfEpd1w7Z6ytp8hTm+xIDl5km7xBf7dP
         NnozEcjdInb3zb/1Nc6QYK6v/edalcGNlUgApJHfOvrd9oG32yjuKx5c64QRKywq/8tI
         bs0zEUARt8WyZZVogzR7IVqFHPlOJxJrl4iHXX8DDQZcrw7IRgjMsiCIvJWyOfQVi1FT
         la263xsAWD69pteJXQkojJVqXF8CxYLayHkKFdWUp6LEu6zfN4VXWN5rDcydUIzYVjiE
         VZ38zyzdNUunFhLLsZFXPGCmHneHY3K/gaBpbwVsP3JQvQfS+J3KgzFIA3AjMWcSTA1i
         PpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662043; x=1781266843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFeJyXKmHA1Uec1iK3fvTQXNf+MjrFSlqdhOvHAIFVA=;
        b=dPcqMhVeUou6WLIwXTSwOJdi+6c1UTA+BY+fyX6pky5xKWbY+pbDg1NO5GqAHD0PaY
         lruujNFFWJmMe58VqsAFpxGloY9IIGx6LM0hL5D8DY7zQgpnfZIJFHFk82WQzeeyD/Ev
         Tjw3p1agAGwiILZnWimSTWVeh9NkxS8cREnJ5e4xbeYFcAOwG0KNqEga8l6RQrD7O+aa
         0oQhmiK5WW7yirS5cNMhMIs5MM3Tqp0Gsy1EUj4mxohKN+FuIPFRRtl/AWi71ri9BI87
         cSrHzu0Iyz6Zaj0Iuyqm/FBLVKl+nVonI1jPAxsybkD2TtULGPj+Tk7/EeEA8mwNUCgH
         QqhA==
X-Forwarded-Encrypted: i=1; AFNElJ+2P+GX1l8OBbJ1NjQNONaYNlIYzjKy1D6S64upQ0d6dWj3JQRzTp1b/torlJAzT68vHuJHV/8AqmolAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZKUYoAGhxmDWwGDsiReJ+FEzJhNKMADRvKMHss3paqAfmyUkd
	5qw/yYRZHGZ+zNOJ+JKycQXogA1kAMr6CzxjzbHiMsfHYdsVs8dnSf8a
X-Gm-Gg: Acq92OHwTH2LYhfPLIn3nEiPyyOcSFAruqeILazv1RvFJoVO+1SIvfYcJcbc5oT+toj
	R3mYdpmBkP8yOGbPTi4yD27WjKcPuBH6j7EdUkngY1+lnaaWGWZ85P6pJvR4/X9pLGK2r5UQU4P
	zTYBXYoKeeWgUDMeI7ke25zU/8zUpG/VhOEm85B3gTX8AF3qejH67HmiOQiIO6FsH7LfrLg1tYU
	Pv7BI1Mv5Fgaew5QG++HFFStNpZZheZdBQTGvt0/DdWWXc7wAZXoaY9lF9+8P5I96ybmvRMEl1G
	Tqx02l6nafZ+XPA3zkZKEHgut4V3qyZADSnBSq83fJ3wqaYJ5iPfYNvIerCj8mCY6QfvwRWGyHR
	pCDlo3bdE0kDuCvA3PCHd89n6vSwJze0EJYgK4kYdAj/d3MeFsh+3kwQNr83QLhYl76iAh/ebGH
	OBmk7rCpLuibVAEAPgNT+ofX1kASMkD889vO4j9vhIvfMtOlxSlrqFXd+ojZfONpmod8kd
X-Received: by 2002:a05:6a00:929e:b0:83f:250d:59c with SMTP id d2e1a72fcca58-842b0fa5602mr3482846b3a.39.1780662043121;
        Fri, 05 Jun 2026 05:20:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:42 -0700 (PDT)
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
Subject: [PATCH v4 06/10] ASoC: renesas: fsi: Move fsi_clk_init()
Date: Fri,  5 Jun 2026 19:19:50 +0700
Message-ID: <20260605121955.105661-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
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

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 128 ++++++++++++++++++++--------------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 0f350bddeb1d..43e6772c06d5 100644
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


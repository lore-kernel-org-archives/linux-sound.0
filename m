Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C77E28030E
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 01:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968735; cv=none; b=lGdotk4yJN3CUpmjjQQe2RvxU+E7OiRiJ4MYe1ywEu0eH+4s60+cNsWem2Rw08vkgItZDwHv9fd3dVVNbutd3V8xdGxIV0mslgEemac9oODY8ETUEeo7WHBC6UaGXJRlqBE3TkV3OSEWZUhP6rPIBPq2KiyjSPiGE2GW3/SQPnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968735; c=relaxed/simple;
	bh=bx/xL4uOu7yvgNYhnektr0xaOZz+gXIRdS4GkyGOK18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JrRhpseX46Z53BPuq1bFNhjKG3K9nQzzf7LCIFPrsnoN4fw4EIQsmMla8wmIiCC1aPg2pkuWNwuv2hOpvZoVDTTAjI5LnvTYOIfF1ku9HkdIsr0ajEkKtclUs9+rLsLEuEuLwGcglK4sYKjTD43I2onf9PYRoUKtUkA2JwlhoO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIkLMIfy; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIkLMIfy"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so3355031a91.1
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 18:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968729; x=1781573529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mt6AAR2A7+1jbWMkZsxSOAOfyL+coLl7wIQlASDZaG4=;
        b=IIkLMIfydhs6McIfCIlFNSN+hwhkKjuLJoEgoroRojNzONcs188oTb4+w1AH5tr2DG
         0RBdbITuYowfGx6uATdZNtcKVESHhgQtfRUFbm2+oEgoU9bx5/pqCMPrO+tnagYic3jM
         iM1dgYJZf6aXHiONFw1M/IGuN+PxlZ3jLfMtop6hEdX0+4NLLgY88lmJGmo9ta3rxnu1
         Wt8qTFgjaiXh4/MSUeIidk9jFMia3s+81d3zcwcO9iQcZkNBWnKBJ92CwTBzjS90HonZ
         VfwkfHuAraCHcAVhhrYT64iIfJSL51qnm/XHkw/jc8RlWQeSp47TaQxGFp1W0IMr+VEx
         BG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968729; x=1781573529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mt6AAR2A7+1jbWMkZsxSOAOfyL+coLl7wIQlASDZaG4=;
        b=l0Z6n1iYrKM06Sl4cwr639UTuhfqkxxE928MMOFu7XN49pWxFB8OTq10LA7m4sBPZv
         PJZvG8MY0pjMX1Cs3nkCV8Phxfdu6FQ2KZ1UA9haYPbz99T4P/+3ZlWtTzQuZzm5Np+r
         jj4zGVeZgfOTWGaXtO9j6fPzspvEQRQp4HNHE11CXVSRk4gA2nYck174qgFFHvHG4q2F
         AfcjBefcWE3UXmFCVX3KXpDpk6Sj+iQvslBpYWzzpQP9KgklEKWMfv87xhp82pzmrHrK
         SZqmtgdl6hufNbRObSVImQmO0aB4EsOV6RTeCxjHgobA/EUcAgRCpGk71DN+f90N5F+o
         Je+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9yhPAS31qJrwUGZ82JClC9Eb8AxcZMrsvdSp2JgzTxhukOcd1DIq/Q5VJjDbaXPk1YoJxIqzarCo4EqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAFp+Pi5u4almrL0zTw4I9OMW2YVWm/MyVjIyyVj4xqbBK0YAo
	93VakJ6Zb4oZ+r7KXAgM7CngKTM+mj8a3VEHg0jCVIzZTDLRZsfuSIzN
X-Gm-Gg: Acq92OHNbRyCd5tzdJ3qo3QMGQKe/DIRaOwNvBpIj6P9qdtaPAjc5o6VPog/KOrVo7v
	OgRwoLPJXBQTcmz2xx9hg+MOnDvlLweXVQkfJdPEZEL6YedzgGts0dcFIX90xNGat9EBnUu5P6I
	kbBGTgkZoFyhQ8gtTCYVhgB6KHQ8Gzav7hE7ugutMKqZk2oknhLEWhtUq6qyv97anuofQzisdD9
	7SH6fjnOqxoVhI6os+BnmUDiiYzcsckAL635speE8+1dzxwji48eUFTjBrgPIHAnLx1m2m3AApX
	bylISbhaMd/XMGVCfHuSPTkhV9bMWjzS6WexuL65aTVG7FhS9u1r+1GhXTUeojenNlxOzZ2YqYn
	VYu6Lxld8QqXl08iwI/k7QkxLpSQxl9UJmpRFlVYuPEAJWKDAXwL+RDpvGGH0W/OUFZ5hq/igle
	+6N4kTk6xT1myH2d+xv9s4YvXgXUlPptao8mEuK29t2wVdA4PtM6ox/xm6yuuor3UcwPb/
X-Received: by 2002:a17:90b:5783:b0:36a:4074:9aa6 with SMTP id 98e67ed59e1d1-370ee82fcb9mr17612341a91.6.1780968729219;
        Mon, 08 Jun 2026 18:32:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:32:08 -0700 (PDT)
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
Subject: [PATCH v5 09/11] ASoC: renesas: fsi: Add SPU clock support
Date: Tue,  9 Jun 2026 08:31:05 +0700
Message-ID: <20260609013107.5995-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

FSI register accesses on the r8a7740 require the SPU bus clock to be
enabled. Add support for acquiring and managing the SPU clock via the
device tree to ensure proper register access.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 13988c7dc926..6c432c7235a4 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -292,6 +292,7 @@ struct fsi_master {
 	void __iomem *base;
 	struct fsi_priv fsia;
 	struct fsi_priv fsib;
+	struct clk *clk_spu;
 	const struct fsi_core *core;
 	spinlock_t lock;
 };
@@ -983,6 +984,7 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 static int fsi_clk_init(struct device *dev, struct fsi_priv *fsi)
 {
 	struct fsi_clk *clock = &fsi->clock;
+	struct fsi_master *master = fsi->master;
 	int is_porta = fsi_is_port_a(fsi);
 	int xck, ick, div;
 
@@ -1004,6 +1006,13 @@ static int fsi_clk_init(struct device *dev, struct fsi_priv *fsi)
 	if (IS_ERR(clock->own))
 		return dev_err_probe(dev, PTR_ERR(clock->own), "Can't get fck clock\n");
 
+	if (!master->clk_spu) {
+		master->clk_spu = devm_clk_get_optional(dev, "spu");
+		if (IS_ERR(master->clk_spu))
+			return dev_err_probe(dev, PTR_ERR(master->clk_spu),
+					"Can't get spu clock\n");
+	}
+
 	/* external clock */
 	if (xck) {
 		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
-- 
2.43.0


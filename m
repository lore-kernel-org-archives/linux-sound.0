Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0A333C19E
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257266; cv=none; b=R0ZvAJA74nFW/71SB1OxALLHIRSHEkHMnJkj+iKGhZ20xenyRfbRNRuYO+O2zbxHEeRLTfCk/9lzSjjH3PwqVWzrV0IFJgjYmDLyCHFTomHNIXaMUsBfOHAnfw5S3dn3Q1bb19tOsqLGxpppZPkYJ4gTxw+PgOOg6IEc1hZ2Uvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257266; c=relaxed/simple;
	bh=4tYxfcZaOQgAqpQgivOn9HYNKKlERBSPufAHePGaTmo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mj9/z/ITFP503pmYJwiLGGCWf7akSrnxg7SkjVkEIFz6415+O3wPRPZfo2YNfFPl1YCcp4NtnyBuzfqQlMp8IB9gPJQqin1DiGiE+srmFIG0sQFX1xb76dBZxGqrWOBiICQtWPlBQWLLFp+r1evOkLLT/AP7wnepl5SY+A5/MyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKU9jR6g; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKU9jR6g"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b150559bso52987235e9.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 05:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257262; x=1776862062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AuYxNcOpJ7xKuxZlqVlteeY0wdXOkWrTHrG8+sRId0=;
        b=ZKU9jR6geZnaf69eC4iTMajM3//OFBq9ORBFyEc5NgOShuMCCDbmXqovHsHLjnl4aF
         y/Ar9VZG9hdFjCEaohj6iT80dBwe458CMqGdhA4toXCtCfNoI0FlNeWYm/HuWYs5GJA5
         8uGGQc3NfTchT4j6AORW+TO/cSyF6HB9AjkbZ9a4Jjdxc1zYR3cdPj9rcYabKp1Ainqx
         5e1xy49jw/TbgZuUZeXAgOiq39zEhvvbLGZPGeLtodDC/P/uzuGw1ksI3uLjoVcRE7lw
         ZZPzxOTc3LW15NtMrJsHdIMpo8zZM5G/wMjWisiXGT5Sx6Q3Vh2wDMByILLkSnIgY3du
         1DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257262; x=1776862062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8AuYxNcOpJ7xKuxZlqVlteeY0wdXOkWrTHrG8+sRId0=;
        b=KUjJto1hcp2cUGjKUnfoyPN0P7zsD8A8H9iznI6ywP8oBdzjseQomNe7Zp5fS/vvV2
         PB4Hs//qtXJ3bo1/lDSd/CA/Cl8+Ei9ff6vZujOsJSFnavSDD+K/K8VlhDjF2494UsQ5
         6BAYG71W6kSHiINKYjELo8T7NX0aumQWJo+8Ci4NnKOtR8BQZLcSu2Nn9ppgJCIJ6mID
         czxe9JiI6DDp+yrrQoShN+JNuOJ/QVFnk1cvBtHNdfiPDqFaySRmAAEuId9+9E/7NCWt
         Mux/CV2Z1I+fCNT/SXQTER1j28AZSANQlMi+vpIsDAn3uu3DqAthaB6Ts9ntLWUZbncI
         U0LA==
X-Forwarded-Encrypted: i=1; AFNElJ/3p04mh8ceFng9QpNqcKCNJxXBP/gxMGXDGg3U2Kcmq+vvGCQ55e9WMZYg1axji00X7q+4D+Ti970ygA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHUwvN3dXrCe8pr21IJRD+tOPTzgeXkq03Y4AXc0nHlhNCHj0
	mnpSVm2DElFRTDbiyhI+V6DGzJ2BbWEPK0KL+U0Tfk6Y9vg29N644RWl
X-Gm-Gg: AeBDieuke5TKDMofrwrMKxRGZJ1lklCzouIkO+C5gzfsCqFZgconv2o++/kMBoaqdxW
	vSV1IBbwBQb9Hi3OVrmW1LBW9df5FIVTTk9rY9Ywj1wiR4iKu3IDfEv3MkmSUttyyAZk5bez+RF
	JuQyRaYxYJVNfaUphg9u0JpjGaTo3qVmQd6jNg2FYS0nK74TVRP8y9cGUDqwG093WDkZlPeiu68
	LfTa0ahmATpMJ9if6wulYNMD3OPMdVwxAHVyfgjjicp7V5MLXZ/tWQ1FsWQiKhYUO652mjp6wgK
	42nwRkEVXYcPLtpxNyZgUrh0ja23JK2oaZX4ip2AbzwrCtSPz9h/D6ArT+090OqDIrWVlt9bhSI
	8/MQ1Y8Kh5G5TXSgM2d4lAgjABU7V9duJ13cGJgQwjjKKMkRHJyoYhsOVWyFL/MYFecHKoQSfr/
	RjwzVDSeFzZERJoaJSnlcfgehcG1iVomIGFWIzEA==
X-Received: by 2002:a05:600c:a105:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-488d685b75emr209800885e9.17.1776257261922;
        Wed, 15 Apr 2026 05:47:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:41 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
X-Google-Original-From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 06/14] ASoC: rsnd: Refactor DMA address tables with named structs
Date: Wed, 15 Apr 2026 12:47:23 +0000
Message-Id: <20260415124731.3684773-7-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the raw multi-dimensional array used for DMA address lookup in
rsnd_gen2_dma_addr() with properly named structs: rsnd_dma_addr (in/out
pair), rsnd_dma_addr_dir (capture/playback arrays), and
rsnd_dma_addr_map (src/ssi/ssiu module sets).

While at it, extract the common lookup logic (is_ssi / use_src / use_cmd
evaluation and table indexing) into a shared rsnd_dma_addr_lookup()
function.

No functional change. This is a preparatory refactor for upcoming RZ/G3E
support which will add its own DMA address map using the same struct and
lookup function.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:
 
v5:
 - New patch, extracted from v4 patch 06/12 as a standalone preparatory
   refactor per Kuninori's request
 - No RZ/G3E content; purely the struct introduction and rsnd_gen2
   conversion

 sound/soc/renesas/rcar/dma.c | 147 +++++++++++++++++++++++------------
 1 file changed, 99 insertions(+), 48 deletions(-)

diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index ab9694589052..bd50f18fac26 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -481,6 +481,69 @@ static struct rsnd_mod_ops rsnd_dmapp_ops = {
 	DEBUG_INFO
 };
 
+struct rsnd_dma_addr {
+	dma_addr_t out_addr;
+	dma_addr_t in_addr;
+};
+
+struct rsnd_dma_addr_dir {
+	struct rsnd_dma_addr capture[3];
+	struct rsnd_dma_addr playback[3];
+};
+
+struct rsnd_dma_addr_map {
+	struct rsnd_dma_addr_dir src;
+	struct rsnd_dma_addr_dir ssi;
+	struct rsnd_dma_addr_dir ssiu;
+};
+
+static dma_addr_t
+rsnd_dma_addr_lookup(struct rsnd_dai_stream *io,
+		     struct rsnd_mod *mod,
+		     struct rsnd_priv *priv,
+		     const struct rsnd_dma_addr_map *map,
+		     int is_play, int is_from)
+{
+	struct device *dev = rsnd_priv_to_dev(priv);
+	int is_ssi = !!(rsnd_io_to_mod_ssi(io) == mod) ||
+		     !!(rsnd_io_to_mod_ssiu(io) == mod);
+	int use_src = !!rsnd_io_to_mod_src(io);
+	int use_cmd = !!rsnd_io_to_mod_dvc(io) ||
+		      !!rsnd_io_to_mod_mix(io) ||
+		      !!rsnd_io_to_mod_ctu(io);
+	int id = rsnd_mod_id(mod);
+	const struct rsnd_dma_addr_dir *dir;
+	const struct rsnd_dma_addr *addr;
+
+	/* it shouldn't happen */
+	if (use_cmd && !use_src)
+		dev_err(dev, "DVC is selected without SRC\n");
+
+	/* use SSIU or SSI? */
+	if (is_ssi && rsnd_ssi_use_busif(io))
+		is_ssi++;
+
+	dev_dbg(dev, "dma%d addr : is_ssi=%d use_src=%d use_cmd=%d\n",
+		id, is_ssi, use_src, use_cmd);
+
+	switch (is_ssi) {
+	case 2:
+		dir = &map->ssiu;
+		break;
+	case 1:
+		dir = &map->ssi;
+		break;
+	default:
+		dir = &map->src;
+		break;
+	}
+
+	addr = is_play ? &dir->playback[use_src + use_cmd]
+		       : &dir->capture[use_src + use_cmd];
+
+	return is_from ? addr->out_addr : addr->in_addr;
+}
+
 /*
  *		Common DMAC Interface
  */
@@ -527,47 +590,45 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
 	struct device *dev = rsnd_priv_to_dev(priv);
 	phys_addr_t ssi_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SSI);
 	phys_addr_t src_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SCU);
-	int is_ssi = !!(rsnd_io_to_mod_ssi(io) == mod) ||
-		     !!(rsnd_io_to_mod_ssiu(io) == mod);
-	int use_src = !!rsnd_io_to_mod_src(io);
-	int use_cmd = !!rsnd_io_to_mod_dvc(io) ||
-		      !!rsnd_io_to_mod_mix(io) ||
-		      !!rsnd_io_to_mod_ctu(io);
 	int id = rsnd_mod_id(mod);
 	int busif = rsnd_mod_id_sub(rsnd_io_to_mod_ssiu(io));
-	struct dma_addr {
-		dma_addr_t out_addr;
-		dma_addr_t in_addr;
-	} dma_addrs[3][2][3] = {
-		/* SRC */
-		/* Capture */
-		{{{ 0,				0 },
-		  { RDMA_SRC_O_N(src, id),	RDMA_SRC_I_P(src, id) },
-		  { RDMA_CMD_O_N(src, id),	RDMA_SRC_I_P(src, id) } },
-		 /* Playback */
-		 {{ 0,				0, },
-		  { RDMA_SRC_O_P(src, id),	RDMA_SRC_I_N(src, id) },
-		  { RDMA_CMD_O_P(src, id),	RDMA_SRC_I_N(src, id) } }
+	const struct rsnd_dma_addr_map map = {
+		.src = {
+			.capture = {
+				{ 0,				0 },
+				{ RDMA_SRC_O_N(src, id),	RDMA_SRC_I_P(src, id) },
+				{ RDMA_CMD_O_N(src, id),	RDMA_SRC_I_P(src, id) },
+			},
+			.playback = {
+				{ 0,				0 },
+				{ RDMA_SRC_O_P(src, id),	RDMA_SRC_I_N(src, id) },
+				{ RDMA_CMD_O_P(src, id),	RDMA_SRC_I_N(src, id) },
+			},
+		},
+		.ssi = {
+			.capture = {
+				{ RDMA_SSI_O_N(ssi, id),		0 },
+				{ RDMA_SSIU_O_P(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P(ssi, id, busif),	0 },
+			},
+			.playback = {
+				{ 0,			RDMA_SSI_I_N(ssi, id) },
+				{ 0,			RDMA_SSIU_I_P(ssi, id, busif) },
+				{ 0,			RDMA_SSIU_I_P(ssi, id, busif) },
+			},
 		},
-		/* SSI */
-		/* Capture */
-		{{{ RDMA_SSI_O_N(ssi, id),		0 },
-		  { RDMA_SSIU_O_P(ssi, id, busif),	0 },
-		  { RDMA_SSIU_O_P(ssi, id, busif),	0 } },
-		 /* Playback */
-		 {{ 0,			RDMA_SSI_I_N(ssi, id) },
-		  { 0,			RDMA_SSIU_I_P(ssi, id, busif) },
-		  { 0,			RDMA_SSIU_I_P(ssi, id, busif) } }
+		.ssiu = {
+			.capture = {
+				{ RDMA_SSIU_O_N(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P(ssi, id, busif),	0 },
+			},
+			.playback = {
+				{ 0,			RDMA_SSIU_I_N(ssi, id, busif) },
+				{ 0,			RDMA_SSIU_I_P(ssi, id, busif) },
+				{ 0,			RDMA_SSIU_I_P(ssi, id, busif) },
+			},
 		},
-		/* SSIU */
-		/* Capture */
-		{{{ RDMA_SSIU_O_N(ssi, id, busif),	0 },
-		  { RDMA_SSIU_O_P(ssi, id, busif),	0 },
-		  { RDMA_SSIU_O_P(ssi, id, busif),	0 } },
-		 /* Playback */
-		 {{ 0,			RDMA_SSIU_I_N(ssi, id, busif) },
-		  { 0,			RDMA_SSIU_I_P(ssi, id, busif) },
-		  { 0,			RDMA_SSIU_I_P(ssi, id, busif) } } },
 	};
 
 	/*
@@ -580,17 +641,7 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
 		dev_err(dev, "This driver doesn't support SSI%d-%d, so far",
 			id, busif);
 
-	/* it shouldn't happen */
-	if (use_cmd && !use_src)
-		dev_err(dev, "DVC is selected without SRC\n");
-
-	/* use SSIU or SSI ? */
-	if (is_ssi && rsnd_ssi_use_busif(io))
-		is_ssi++;
-
-	return (is_from) ?
-		dma_addrs[is_ssi][is_play][use_src + use_cmd].out_addr :
-		dma_addrs[is_ssi][is_play][use_src + use_cmd].in_addr;
+	return rsnd_dma_addr_lookup(io, mod, priv, &map, is_play, is_from);
 }
 
 /*
-- 
2.25.1


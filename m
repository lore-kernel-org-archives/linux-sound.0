Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690D5403E99
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005182; cv=none; b=nJ/O/SyGz8g46wMHsD9NsppThp5pHRnsMR37IlHeKeiu+aBHA92z1AzlOE2efsObxTyIvP7Vdlm+4rXVVSilz3j6vvefMhzQ/ho0fNdCO8waiknfQHg0aU2YsOMDw707OI1KN6iwC9fO30l45xFQyeHOFqRsmFtxoZIKgNI4Sgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005182; c=relaxed/simple;
	bh=NsITPzSpAz4fGBrSp75LeBpjl4N8sxVfHka61HOq9sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttGpWJmdUi13YjNb8ecTwGM+ihoiltEsDiBfdChxRO9W1KhItH2FMiET5AVrK9E7d9pFsVAKLYh8TzM611eZNaLsOUKTjXVAz6XUNwbjUATZl8SGiCM14/hlDhdfD/Z0C7o0RI3hM5KCBMMzndOsQnajBHXRMil4Eb7OxisZvpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjGsV7dr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjGsV7dr"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf1f074a12so55988675ad.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005181; x=1781609981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQHxCJIc5wdA2xrHT5QQXhiIMFBTsuYRD5YZQNGHjTk=;
        b=UjGsV7drSGXOx5fYVSKxBKqZkEKy/bc0NZseIKCO0Dss2Tt2ar2t8sHKuhoZzpLceA
         1wrNDMVTyEGmKbnj/Zf57UQlRRnvidP4zMJso2Ku865gKuJ5I+yvZ96Wnu0YzvrzMyZz
         8km4Zt0aBswdV5jshQMsn/G7jkk+eO8lewHu7BV5s+nndd/jT/yN9BsYN50oWbOgU0o9
         Jp/EIdYsvEWHH6mT2XAPGPO0U7ltHdgsaidUwgiRagOs5cKEHZ5KdLnjlgObboCXRYAv
         0jpXdsL2/73ccr4iP9km//7KfcaZeRrVJ/0wFTf/IxscLwKLifUuqgbcpKGp7fHms2ot
         gUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005181; x=1781609981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tQHxCJIc5wdA2xrHT5QQXhiIMFBTsuYRD5YZQNGHjTk=;
        b=EO5TrR1DciJ/FcnnpuwqyytrjmeImHiCenMCJbxmkvtFaTBlPvT3Gp+W3fumEI78Iu
         /dpQnMYnYhryQP943thr4VReJ5SJo/yFqgu13qvxAGUV+jDCdStznb1/hcIqdMUOeLUc
         jEWFHNzZ0dz8Oxy9WFf3Q7vF8K9zEdAkFJOw06CzGV1TjzU618OayycspCoY7FdG1WPX
         kVkzrvZ3DtwFlOPlO2y3pKCp/7kT/ZufsppJ5ZdEIKEiIgW2GAhOBYFZC1GompHuXwnI
         gAX56GDtL8vcd2i2p7maMHUvJ6Wch4N42/77B1l3xbEu3YfH8LtrqYwGM8vVyqCD5/2l
         yL4A==
X-Forwarded-Encrypted: i=1; AFNElJ9i8/dj5czEmpF1leUEqS/5RCQaQ6IzbS17eI3NwNaa2/eSt2ioapVTRvsD4DMjZDrXmLlESAOLAmyc6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr7/r1Ha53hpnElDcNtaC8hEM2S2rfqz5BGwVJQfva1sEoKYO2
	7CoeMstxpy3rTmzkmKMyoMHpY+MM5bMrr7WXj3VYPJcQlXCxkm1Xdq3d
X-Gm-Gg: Acq92OG12sT7LHmtxv7DSD6AD8S4fjaj+dbpSM9CJypBEKAv5L/5cNujtkGpjw6DXS6
	xOLXiHuAbcc4TW42wf7+AD0AjUZWKQ2Tn4O6ulX03HVeIBBf9MKn9v9SqGsiygDhIwPcepDbMpx
	flw5rtye+NbW9zzewCzwPBaSpm0pKoh9Xy+IApO/G6qd7lwlgexlxUPov29tjE5v0XTKzA3bG9J
	vrd6aoI2r9paB6RcTb2HZ+240PN4nRj7T3lfm166fNazdQsBUdq9eqqcRzs+v2eRIY6LannH7L+
	iGjDIzgVzkYnxYc4Hgno12oIQv5YKeQ/4dNSRy3ty/I2YSiH6V9vceWFSPgTOyWcbFQ1BYQJP2K
	84wGN2C5ZQWab6ojWFHOpotB0dgsY4IdmbsTYc+WZ57wLdfBbiVJTjBs9WjFs2PhrUxqPh23vqi
	g58ID4idIfWkj07buEu89080x9lfniA18mYWY2HO8bB/Kxu8DsvgSwSJWQJTRv0KyOJydf
X-Received: by 2002:a17:902:da8e:b0:2be:bcae:f6b0 with SMTP id d9443c01a7336-2c1e8495230mr248457445ad.22.1781005180791;
        Tue, 09 Jun 2026 04:39:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:40 -0700 (PDT)
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
Subject: [PATCH v6 09/11] ASoC: renesas: fsi: Add SPU clock support
Date: Tue,  9 Jun 2026 18:38:34 +0700
Message-ID: <20260609113836.45079-10-phucduc.bui@gmail.com>
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

FSI register accesses on the r8a7740 require the SPU bus clock to be
enabled. Add support for acquiring and managing the SPU clock via the
device tree to ensure proper register access.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.

 sound/soc/renesas/fsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 43bc77ebcca3..716ecf0401fe 100644
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


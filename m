Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A6B3DA5CC
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400703; cv=none; b=BEBmCBz1VmosBbatnrDimT2ykWJTEdzUMQ0apHsEH2/1tmrzB0ivnH1+3zYqzaYbXtpDozeiWZjB3EDPnL1bCNNnm0nC7cUXGoKiRr/HrcITvE+IMcP7yJKwAo48o3GCnawVJjWZ1bjQNunqkDzjsplhUCmYLvYM9LWYZjmjTLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400703; c=relaxed/simple;
	bh=ues6/VOUWZmjMAGbuVCi5NdprQzYdw/UbUKF+QEzg/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ofskt+H5ci+BiO7sJK4/rhbtW5L1r6jEJI7IAJb0cSDpUTZ/Rz7jydG0NhNRVO2unihNmp+VzROyxSFg7ZixoYpGMOIvkboIETFk7YlC7UTCKp5LyjBYRI7rB1/wSRCZsOC2ovZlI1CqfcF5ztMEZUCYQJFHceo+UqGO43VhvxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPRoewfm; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPRoewfm"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8423f1e2f8eso1754838b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400700; x=1781005500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmC4zYF7/VSFzDxDUcysEBlqEWK3sw1salrmEASv0aE=;
        b=YPRoewfmcsN2l41rkOsj6M23fdkFQSEXGZQfaa+ttgTgjpOMVR0U+3yMmYz+ULP3yr
         jsqs6iqhvz6hv8qw2kym+rLlmPtJg3C8W4Akw02h//Ykz7voI1prs90BxogvCADn4jhY
         AvNocESNDjXiiPBuF0Cs/ogBwI3qlRJdbCBoRR1KpFfNOl/Odr2czlJ0MvgxOQvp1tMv
         8P27JkPUwSPc1K4XOXcqjKo7hZIGNx4Qp7oiTwdeX+7/aHS32TFByOM8lQecl50Fpyl8
         NvyIyCpm706ImgcVCPScRCR7MCQiJvlSv72q8HzG6lc0kXfMcE2b1cXOt0i/VLAwi3fb
         6mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400700; x=1781005500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TmC4zYF7/VSFzDxDUcysEBlqEWK3sw1salrmEASv0aE=;
        b=DV1JVBAWWpkFCbuEM3V2mxjCULfhTRDTr9CJ0kZPeBawoWt2ppzfrSX6hZBZVycCAB
         zf2iJpVBLVd6xq2gBQqT00Lww9Lz49BC6bmgH/rD7wv/9zCGDwsNXf2h561VFGwDjr1P
         CkVubujIJL6WPDsp8vAkXoI0FQJxy9ZsUeL+RgxK6mc7QTdBiM93p6CYmM2YDCEcBVPU
         C0aMp3vIt9GmhNiT37HqfepCanebyoovfCKa0xnRWtowTWkY6JXbOALhr+pZbnZbHTrD
         MMHiep9tQMRlYuA28Z+ePGH1/oEtmucZj+E3ZJSP8Q5Drp9P5IZgYvS50xSDFaBatKOP
         m6LA==
X-Forwarded-Encrypted: i=1; AFNElJ9oXmpubXo45+rRwggnvQYZV3OuQeTFENxHIJ/0rIgyCiRozylldvfGunhJnLoFau6WqO4rF13VWS5HBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJwNfdq84+eV+Kqkts3m7M0C6rqbxev4y7hO5FTgPGj6dRKTD6
	g6W4qTAXMUOLUuvUe4nLLHN1rokD8vQvuhD2P88Yu26HyzOOVBywyGTb
X-Gm-Gg: Acq92OHnr64qO9bF9tJVt+D/DLkcyTmMHVV5oyT2w5fGGyi3UBNZdiltB81KRM9/5Is
	UuWmWUAq2w9BxVfKKGMzNVapF9g41vDrgFn3vK0PY+d6APbwUKwe+JmsK+y+5v/Aj9pqy8qZ2T5
	T7HXUVdilnfiFMzScYMJpZwiWzHUUC3rYotHvcSCiIAycQ5s5VuOfBDlmpoan1IFUCze1RBDTkC
	XR/2lt6BLpfYpSyS157B9ilq5v4I+99Gb7dRuXiQH11dzQm0lef7zcQryLXGMT7wjaZOEtucMXZ
	ooN+VxBfc1AcBruxmAWRuBclmx3rNS5Uv+BqF4JWhZfoMt7XLMrbL/saXahm7o405s43DW2KyUH
	xwujSigZkswWtQ5YHeeRvrxvF6fhBpeD7knsx/fJoLHMrFFBJ6m6RPmYWnhm3AcXmcXjo9Q/VN+
	WuiMBa1UqbmPH+iq6PWGVfeiNP6WGlfwqyN7z0HStaWAuyZx7JTQnOQcL2qpCMHqDk05AZ
X-Received: by 2002:aa7:88cb:0:b0:842:6d95:261e with SMTP id d2e1a72fcca58-8426d9538a9mr3400413b3a.41.1780400700453;
        Tue, 02 Jun 2026 04:45:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842263539a3sm12025224b3a.44.2026.06.02.04.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:44:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 1/3] ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
Date: Tue,  2 Jun 2026 18:44:35 +0700
Message-ID: <20260602114437.50324-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602114437.50324-1-phucduc.bui@gmail.com>
References: <20260602114437.50324-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/sunxi/sun4i-spdif.c | 62 ++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index c2ec19437cd7..89eccc83a130 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -427,24 +427,21 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 
-	spin_lock_irqsave(&host->lock, flags);
+	scoped_guard(spinlock_irqsave, &host->lock) {
+		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
 
-	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
+		status[0] = reg & 0xff;
+		status[1] = (reg >> 8) & 0xff;
+		status[2] = (reg >> 16) & 0xff;
+		status[3] = (reg >> 24) & 0xff;
 
-	status[0] = reg & 0xff;
-	status[1] = (reg >> 8) & 0xff;
-	status[2] = (reg >> 16) & 0xff;
-	status[3] = (reg >> 24) & 0xff;
+		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA1, &reg);
 
-	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA1, &reg);
-
-	status[4] = reg & 0xff;
-	status[5] = (reg >> 8) & 0x3;
-
-	spin_unlock_irqrestore(&host->lock, flags);
+		status[4] = reg & 0xff;
+		status[5] = (reg >> 8) & 0x3;
+	}
 
 	return 0;
 }
@@ -455,35 +452,32 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 	bool chg0, chg1;
 
-	spin_lock_irqsave(&host->lock, flags);
-
-	reg = (u32)status[3] << 24;
-	reg |= (u32)status[2] << 16;
-	reg |= (u32)status[1] << 8;
-	reg |= (u32)status[0];
+	scoped_guard(spinlock_irqsave, &host->lock) {
+		reg = (u32)status[3] << 24;
+		reg |= (u32)status[2] << 16;
+		reg |= (u32)status[1] << 8;
+		reg |= (u32)status[0];
 
-	regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA0,
-				 GENMASK(31,0), reg, &chg0);
+		regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA0,
+					 GENMASK(31, 0), reg, &chg0);
 
-	reg = (u32)status[5] << 8;
-	reg |= (u32)status[4];
+		reg = (u32)status[5] << 8;
+		reg |= (u32)status[4];
 
-	regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA1,
-				 GENMASK(9,0), reg, &chg1);
+		regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA1,
+					 GENMASK(9, 0), reg, &chg1);
 
-	reg = SUN4I_SPDIF_TXCFG_CHSTMODE;
-	if (status[0] & IEC958_AES0_NONAUDIO)
-		reg |= SUN4I_SPDIF_TXCFG_NONAUDIO;
+		reg = SUN4I_SPDIF_TXCFG_CHSTMODE;
+		if (status[0] & IEC958_AES0_NONAUDIO)
+			reg |= SUN4I_SPDIF_TXCFG_NONAUDIO;
 
-	regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
-			   SUN4I_SPDIF_TXCFG_CHSTMODE |
-			   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
-
-	spin_unlock_irqrestore(&host->lock, flags);
+		regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
+				   SUN4I_SPDIF_TXCFG_CHSTMODE |
+				   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
+	}
 
 	return chg0 || chg1;
 }
-- 
2.43.0


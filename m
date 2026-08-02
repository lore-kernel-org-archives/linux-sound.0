Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600C93C3F52
	for <linux-sound@vger.kernel.org>; Sun,  2 Aug 2026 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785686284; cv=none; b=qb++7UiA6ZY5KfwNRi0hNBF+E8jl+46pLMIMIllnl6iyVw+95FJRawhBVnldTTDP/jHCZ1LR2G5FmFLIKGM7SC/+0yzoRNhhxfUheUz9hY0kmvBlS6MdF/yDBPFhtEgg23fzC4htVUpbQKulT9elWDWEgAN3oyG3GkpglWGyqqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785686284; c=relaxed/simple;
	bh=80w1bxo8HofkFPGSDfAoE3yryphRApzOjIm1Zbovhls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O34nmfB2t3sM+wZ6DCJeqOm3N2+8OiXKMJtX9lYC58E9V3Wg6R9KLDtRvnspI3Dy+NZmL8tLHx0F2wugjFqDNTfAc6FpQZe3O87Ar8t8wZ+on9JhuXJ9o/UjXP7qTGpRjwPywb4yzGqOrtBChrWMugOiQWvQ+D6xpvFxYiLmo0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel.srl; spf=pass smtp.mailfrom=kernel.srl; dkim=pass (2048-bit key) header.d=kernel.srl header.i=@kernel.srl header.b=a9X1UVbV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel.srl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.srl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.srl header.i=@kernel.srl header.b="a9X1UVbV"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de0093c42so1768722f8f.3
        for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.srl; s=google; t=1785686270; x=1786291070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UVESwNZjyXM8r67+UALyxxpGt7Z0/q+uIrVNmZe3MzE=;
        b=a9X1UVbVt67Y9Q5M1NJ9nTOCJyHF7uPZzrSmJv4jN/5dG2iDT8zcIIMRvMBs8VCcYi
         mWe2LkCKgSyE2he4em54tCx8SkVOWnLxOObXYF5mY76BrwFLJ8Qt4vnYWfC2pvXHKpnb
         y3wvD1LvXffof4o+QGmzk8haqYhmkLYsPYAf6yLSZBDmfyu4Z+BIqxD7PRpYo472I/xi
         yxJ8P06S9h+E90Os4MHhZNAmQCjo2416FYENAcO5UCdnMATWVjlWFeNr8akSd6RRkgeY
         6XHX+XK1Nvm8+hkbglI/FUTTD91kAWx2y6Mp085AGIlOQa5qGxwKc26nyJK8/a0gixuy
         1Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785686270; x=1786291070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVESwNZjyXM8r67+UALyxxpGt7Z0/q+uIrVNmZe3MzE=;
        b=n4DcgjDM8OG3QT1+vRkYGXbjUaa38TLonAnQrRfNAdyCscv8vtSsHuqwQTuX+UpNGw
         cBrRye2uwcvBKPOM7NulcpTrE0YU4knf4/L7EwfJ9JX6C2TFpdKuU+bq3iqC5vM4fGBz
         gme/gzByyo2FvuOO67QFH7qQWTXNBKtzYF6kH1z2915xm8TGG08Gndz57mMjA8vmkE8z
         cRgR9rNRc3Jn5NmhJZZipXwXVrKtM2BHngiDefZ6erGeqfe4jec0qB+R3ALYAMMxHsis
         8gAh7YLtcwJukFo0gexoY3FHPD/YH9rdpKGcUawD7FSzTm3ja82uDW/k+Tfa6RcUrNLo
         3Rxg==
X-Forwarded-Encrypted: i=1; AHgh+RqXPNmoyhxw2MYAAln1HlWzzKTYnV5283oi7q/D+RYBVcqWRyhWiNAKezwqWro5FJGwigShYuEMAyGfJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycz1w8serZIsMoSDZ+JmBU3c1GuTYn+DgERGw7hZz97c8iHrRi
	JqsVXMrlq4ee7kPwzBNK1aR6oMphqKzXWzlcQmtDVQ4TxsF+FEPRBmPI1YUqF9gSVbo=
X-Gm-Gg: AR+sD12BYV81sAzlu3otLe1lDZib3is38tHp72zghj4mQ/pG1Te4hp7bikw30pN1ibx
	+YpJEi2tYHjaa8VxDiNKUFghYSmC7bw46Rng58AJVRwMl59mziRfqsy2PF7vwrm6QWahAL6NCma
	0N1HFzPUZn+3F3e7oNc++tJKOf2enYezVCP7cTU1Ff9O9NpHSl6vZZ0wVUNYLSFdl4saakQ/DeQ
	mqpUfQ51e5tEHgHTMNTaIyiTyM7q3HPnt3Qj0O/qlKfztBGn0+iwOwNqMLiuXqieyYAVxZ5v7/b
	wr0gbrviLY2e8ZzeBv4cTWiqnP/ME3FE6wsCwceaTEnpDwXhhlMyMRskBV6+MC85mHc2hxp4MdF
	z8QWxJCuO+x8iSKFyGh9GU7o0JfcqgMsHX+nyM7p/EPCZtRvLmtQYVdADakZJpqy6ZXDr0yrShl
	00EZjk8TJHhRIKVF4MNXIMJwODj3SCrC5HFRbhlmM9lGDYZ3p8xm7swsVx92Cyp3DjYo65AvOjz
	VftS5S1HqXvDd9/HuaKFXl4mJ/v6YJlihm2HbwInJ6f6mXACGmi/9j2smO/dAe0w7Op1wmqX7BN
	KGOUTNaekd0fGrnBan7qEi/8bxmbP3lp0+R74Xo2ZWXpChauigmtVQL611K1qxsGGJmLiAEGP3b
	opbdY6iIRR33QbacOd2r48PSNO6nPXv11xfWvrxdn//EjCb6uhg==
X-Received: by 2002:adf:e010:0:10b0:47f:9464:86cc with SMTP id ffacd0b85a97d-47fd72a00b3mr13260881f8f.2.1785686269763;
        Sun, 02 Aug 2026 08:57:49 -0700 (PDT)
Received: from KITT.minareto (host-95-230-187-130.business.telecomitalia.it. [95.230.187.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm25487093f8f.19.2026.08.02.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 08:57:49 -0700 (PDT)
From: Cristian La Spina <cristian.laspina@kernel.srl>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Cristian La Spina <cristian.laspina@kernel.srl>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: add cs42l43_cs35l57_l0 support
Date: Sun,  2 Aug 2026 17:57:39 +0200
Message-ID: <20260802155741.202067-1-cristian.laspina@kernel.srl>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga 9 2-in-1 14IPH11 puts its CS42L43 codec and both CS35L57
amplifiers on SoundWire link 0, as described by its DSDT:

  sdw:0:0:01fa:4243:01     CS42L43  jack, microphones, two tweeters
  sdw:0:0:01fa:3557:01:0   CS35L57  left woofer
  sdw:0:0:01fa:3557:01:1   CS35L57  right woofer

The existing cs42l43 entries describe machines that spread the same
chips over links 2 and 3, so this laptop matches nothing at all and no
card is created: speakers, headphone jack and microphones are all
silent, leaving HDMI as the only output.

Add a match for that layout. The codec drives the two tweeters through
its own amplifiers while the CS35L57 drive the woofers, so all three
speaker endpoints have to share a single aggregation group. With
separate groups each device asks for a DAI link named
"SDW0-Playback-SmartAmp" and the second registration fails with
-EEXIST. cs42l43_amp_spkagg_endpoints already places the codec at group
position 0, so the two amplifiers take positions 1 and 2, following the
numbered series used for multi-amplifier groups elsewhere.

The matching topology is proposed at
https://github.com/thesofproject/sof/pull/11053

Assisted-by: Claude:claude-opus-5
Signed-off-by: Cristian La Spina <cristian.laspina@kernel.srl>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 756bbf82a..2d2bdc832 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -92,6 +92,20 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_endpoint spk_1_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 2,
+	.group_id = 1,
+};
+
 static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
 	/* Jack Endpoint */
 	{
@@ -184,6 +198,35 @@ static const struct snd_soc_acpi_adr_device cs35l56_2_lr_adr[] = {
 	}
 };
 
+/*
+ * Lenovo Yoga 9 2-in-1 14IPH11: the CS42L43 codec and both CS35L57 amplifiers
+ * are on SoundWire link 0, as described by the DSDT. The codec drives the two
+ * tweeters through its own amplifiers, the CS35L57 drive the woofers, so all
+ * three speaker endpoints must share one aggregation group: otherwise each
+ * device asks for a DAI link named "SDW0-Playback-SmartAmp" and the second
+ * registration fails with -EEXIST.
+ */
+static const struct snd_soc_acpi_adr_device cs42l43_cs35l57_0_adr[] = {
+	{
+		.adr = 0x00003001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_amp_spkagg_endpoints),
+		.endpoints = cs42l43_amp_spkagg_endpoints,
+		.name_prefix = "cs42l43"
+	},
+	{
+		.adr = 0x00003001FA355701ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_1_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00003101FA355701ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP2"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -301,6 +344,15 @@ static const struct snd_soc_acpi_adr_device rt1320_3_group2_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_cs42l43_cs35l57_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_cs35l57_0_adr),
+		.adr_d = cs42l43_cs35l57_0_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_cs42l43_agg_l3_cs35l56_l2[] = {
 	{
 		.mask = BIT(3),
@@ -510,6 +562,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l2.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0),
+		.links = ptl_cs42l43_cs35l57_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-cs42l43-l0.tplg",
+	},
 	{
 		.link_mask = BIT(2) | BIT(3),
 		.links = ptl_cs42l43_agg_l3_cs35l56_l2,
-- 
2.52.0


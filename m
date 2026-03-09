Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FACB3A4F43;
	Mon,  9 Mar 2026 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056827; cv=none; b=IFDEp0W3wmvtfb07P8X/DtWk3tUZyty1M4I7/vGMJAo48GkgCy+ZSYtEldVmMDl5OHOQFDUbJkJw06Vlx10yU1n/zu1+zE4/5oBLSK+NKdG4dk0lDBjAzTWM1ocF6/rgpNVXiML1p6UM/i/KVUFVaJgQBloHp5Y4JJHdeP4rg6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056827; c=relaxed/simple;
	bh=6HvfBj3R6poXh6hfpOwLMFAuvPKM/QQe+V//8fjNykc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IMMFYzpC4Mg8joVsutSYNITMNBSLFnlxBBAqR3TAgzLNcIx2I1XGKRS0LjCRSoHVObiDSmFbSG3Vl9LqredLDag8ha9x02LrMTimfyJz0V/wQ/oFNszAHAeI8Uus9+2TH3UlSuWStx1Ho+3fwIEfR9GQGAm39W0BOJeqmGIggiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otrBNoHD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otrBNoHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2887DC4CEF7;
	Mon,  9 Mar 2026 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773056826;
	bh=6HvfBj3R6poXh6hfpOwLMFAuvPKM/QQe+V//8fjNykc=;
	h=From:To:Cc:Subject:Date:From;
	b=otrBNoHDHWdTdz1f5qgl3jbUvtZ2E35t1j6GCEoRVHm3A++hreW4fSlr3A21vzFNJ
	 Sa+dPx1nQIvdNJsEqXJgEkgfHdqXzXArCmJE7JwW7V9K7o9ixTl4W+Bw5gvZVNPn0U
	 DofdybaTF3KVqG7lWoQs0KhTNgeNRyyizj+FqmxtvYj0OxnEFEovJD03LMmJeFo8ch
	 MO6slQrl4tN4zzoLfbSt8CgyyP+NUfbh/jGZPNafGsnByYpjqK+u/nzvLGniZwte6J
	 7m+J4WwDY51vOwWKZpjmdClR7agvrBSO/pOjpRaSq+eIcq3M/XRYcIh0P8Cq0BUZAv
	 mXpIFJRc8FLFQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: peb2466: Change the +/- 6dB switch to a volume
Date: Mon,  9 Mar 2026 12:46:49 +0100
Message-ID: <418fe76d1c9efc8182ab57b6b426a8c723e025fe.1773056714.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606; i=chleroy@kernel.org; h=from:subject:message-id; bh=6HvfBj3R6poXh6hfpOwLMFAuvPKM/QQe+V//8fjNykc=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWSu26x1R/Bqtdb6UHahtN3TKjfq74vcWi7GzbFBJDD7j dAe27VVHaUsDGJcDLJiiizH/3PvmtH1JTV/6i59mDmsTCBDGLg4BWAiSSYM/1OTWDllvzEyTer+ diWnYe/Xp2Hmp2bmGXTt0BQML3glWcPw3/GHT2Eq8wWen4KaO/7K1FZP5F3xOffs/6IglfDb381 cuQE=
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit

In addition to the digital volume adjustment, infineon peb2466 codec
has an analog adjustment which can be set to either 0dB or +/-6dB.
At the time being it is defined as a switch and appears in 'alsamixer'
like a 'mute'.

This adjustment isn't a mute, change it to a 'volume' with an
associated dB range.

With this change, this adjustment now appears in 'alsamixer' as a
standard volume slider which can have two positions.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 sound/soc/codecs/peb2466.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index f1ee42af264b..2d5163c15d0d 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -517,18 +517,21 @@ static const struct snd_kcontrol_new peb2466_ch3_out_mix_controls[] = {
 	SOC_DAPM_SINGLE("Voice Switch", PEB2466_CR2(3), 0, 1, 0)
 };
 
+static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(peb2466_gain_p_tlv, -600, 0);
+static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(peb2466_gain_c_tlv, 0, 600);
+
 static const struct snd_kcontrol_new peb2466_controls[] = {
 	/* Attenuators */
-	SOC_SINGLE("DAC0 -6dB Playback Switch", PEB2466_CR3(0), 2, 1, 0),
-	SOC_SINGLE("DAC1 -6dB Playback Switch", PEB2466_CR3(1), 2, 1, 0),
-	SOC_SINGLE("DAC2 -6dB Playback Switch", PEB2466_CR3(2), 2, 1, 0),
-	SOC_SINGLE("DAC3 -6dB Playback Switch", PEB2466_CR3(3), 2, 1, 0),
+	SOC_SINGLE_TLV("DAC0 -6dB Playback Volume", PEB2466_CR3(0), 2, 1, 1, peb2466_gain_p_tlv),
+	SOC_SINGLE_TLV("DAC1 -6dB Playback Volume", PEB2466_CR3(1), 2, 1, 1, peb2466_gain_p_tlv),
+	SOC_SINGLE_TLV("DAC2 -6dB Playback Volume", PEB2466_CR3(2), 2, 1, 1, peb2466_gain_p_tlv),
+	SOC_SINGLE_TLV("DAC3 -6dB Playback Volume", PEB2466_CR3(3), 2, 1, 1, peb2466_gain_p_tlv),
 
 	/* Amplifiers */
-	SOC_SINGLE("ADC0 +6dB Capture Switch", PEB2466_CR3(0), 3, 1, 0),
-	SOC_SINGLE("ADC1 +6dB Capture Switch", PEB2466_CR3(1), 3, 1, 0),
-	SOC_SINGLE("ADC2 +6dB Capture Switch", PEB2466_CR3(2), 3, 1, 0),
-	SOC_SINGLE("ADC3 +6dB Capture Switch", PEB2466_CR3(3), 3, 1, 0),
+	SOC_SINGLE_TLV("ADC0 +6dB Capture Volume", PEB2466_CR3(0), 3, 1, 0, peb2466_gain_c_tlv),
+	SOC_SINGLE_TLV("ADC1 +6dB Capture Volume", PEB2466_CR3(1), 3, 1, 0, peb2466_gain_c_tlv),
+	SOC_SINGLE_TLV("ADC2 +6dB Capture Volume", PEB2466_CR3(2), 3, 1, 0, peb2466_gain_c_tlv),
+	SOC_SINGLE_TLV("ADC3 +6dB Capture Volume", PEB2466_CR3(3), 3, 1, 0, peb2466_gain_c_tlv),
 
 	/* Tone generators */
 	SOC_ENUM_EXT("DAC0 TG1 Freq", peb2466_tg_freq[0][0],
-- 
2.49.0


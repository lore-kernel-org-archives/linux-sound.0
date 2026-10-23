Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773129;
	b=u7+frJpzJLM4Uu8pUlE7IOBzSXCp9H33NyuWZJkdSlKRPPvIxTbM4Wl8PD7CyiRLiNx2
	 WIRLrgv5jKhEek/OCMK0IUN/itesdz9esRCzm6pRtj0Ggn78n7VPHJrgpBXRZbWcSfuxl
	 LEfKWzbB8OAJqBggT0zO7Z1l0d28YaruHYzOvnVEaHIbdUC8GcO/54ybuzZAnX2vdkwRy
	 d3t1OIOXBE34X5bCSbONcKIrWx/r/GAcOtO7W6L/xjWAHSJjLn6SqEK3HfGYduIm/Yw2S
	 2L2CdXdTaisElMQOPS8Wpu6kKoPXPyzogXEit6JrW2F9c7pcuq+cw82eQxqB/jxOOYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7AVs1R5P/DaLmd/7NvIFvig9eNUIytz9Frg7gakJ6c0=;
	b=c7XY58AqfeDwRGBUYNqhiVNWrWD/vqalEwvu5fecfClaAU3wa6R9rx6gYnECnWzkAoau
	 obuZpY38nmGqU2v09TKmL1Si/UZaBwQ05jOC4DTCiR4Y+0iw2XiwtI1VDKjmSQzTm1hEc
	 82L6QZcolVj0FdQ6KlD0UaftvYA8G62qQIIlNF0JOhXEBZALV/vD8IIPkxx9vrGdZifuE
	 3yEHmNwvsYzdivx9FxzZJZf2xPr+hKc/CH3Whjefq6gaDCsmI3GA58mm34zDU3VwF2IVf
	 M1nx9W+bVQlZBZ9mEDQleUfrPq8kMphsrNxkBXGzjIDYC3TiKY1JsSf4fjIcnK3ih2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=yIA15d31;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36581606A31D
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 16:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36581606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=yIA15d31
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4be28b82so888798f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 09:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792773127; x=1793377927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AVs1R5P/DaLmd/7NvIFvig9eNUIytz9Frg7gakJ6c0=;
        b=yIA15d31PVmy35l8i/Scbft6iqRsUVYvY7FvHW3tRE8UuBM4zHPYNVcx3Wc07zJT8C
         LyViMRX6eWpoFGLZgBmnw670zkUJycN0igeQnD6dIkQ0OrEkIsThhZe+9E7YcHtTuRdi
         fqqGwdqNd9EDUjeHlSk9y8HW3mjXRS+2rMD4REjPuqbAvM91Mwn+I5wFTByNcgMNp+hE
         zMz+lG+S4T+TTsTlYjIrMY0mk3UwhSzv1AM2ZtYXDUzi/VaMBPTqlGx87AF/C+K8IGyu
         lZnA8KRG/BrLEqMvsSiIo1nem9tWLD5hA9YJ0kcGdbjjQZhMcFp4YlUkP6a2UBXG3IRi
         6OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792773127; x=1793377927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AVs1R5P/DaLmd/7NvIFvig9eNUIytz9Frg7gakJ6c0=;
        b=eyTQmIIA1wH6ipeR+t1LP4P2AUls2aWuwvyXd2rbtfAqSmF2ClI27/OYOAJ0EwyNC5
         NOr/7Oabwty40wx/oqWY6uK/1R2ANN5k9NOG2RO8X1v4WLYDD8MXZQ5Ue2OTaj5Xoqd6
         23rjahyP3u72A14ADCsIhrAg8uM7Lkiiq5f8YcAE0iDim7UXkb7Ar4i8WG66AKILDUrV
         4sydGS7XfKSDdbf3kCPmcun4CIydTDCyc7JhKs4fNLdGru7Xii4IvNEO8E0Ueu0pOzLL
         waiQhUreqbwUazZBnaxRmnwywUuvBmv1hvd1PcaFsmzacd9d74Xqa4mTXfJgJkm/ovkb
         Weww==
X-Forwarded-Encrypted: i=1; AKwUvBy55hKWUN09fv5iTkqRKPh+DVdqMBtH3K7OcfyK5cPWRwQ/Op9URvmzeEYDezAVsWtapBbqrgFvYPagMA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIoNPK7XfC4rg3Qwijb9BluJtTkC59iwfxSp+/TmR8/l3jH44pl
	ONKWmCzlXxCvt3us6aVZkUtf6YRKc00w4GVU5Du/x1XBnXMp1IwATOnPFYVIpqvC4NE=
X-Gm-Gg: AYBFou0+mIiwSmb4LyUXZWZRSVdyV+AVZaLmSxGE/G+4eo/y5TYw5IzvZ0aCLJx+NF4
	uLKGRvMJDCHQa28UFwe4Tmbka7+Oqu3OXmmoFQ92gCqQFkcWLyz1anHUJ5V/K8SgKA85p80GIOx
	qa00+i329fjTRgiOKMEQ11901wRP70KDe2EJijTujbEw/oMsNBykAKnvpu0s9HEcw+xqQ9banM9
	CIHMbmdhbmREt7fUrkECEWOgoLtZnbWZ1U9Bu/pJsdCH1Dwh80/I0imgEPAZv7HlPQ/Rlb8ZO58
	qtc9BhFimgKzWLQX91n43VIzOncEfHErF98XwS0/Kdm+LHBpAuAhOSkt+XoD/S0ShpyLfD8VtKg
	7l8rGlXpQDtTBsqOeaW6NJ+oPjpZw7Gw29zagSNPmZ+ZffaFAB1an5IdOoR/PnKrikQgz6W1GNT
	QHAGKpJlRMPKPszC90VobjNHGvJJq9IyOtcCDx803tzkWtLL+XJt80dWBaTleRXC9FGHVIjX/3A
	kFOtJ28QJo0yEy6tv2vLrt8oTOo+P9jSX6Lwp37cdJQGET7lvJL+1Do+ru5hB0DRRqEW3TrkhrO
	tOvh/dnKAPE=
X-Received: by 2002:a05:600c:350e:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a211c48ccbmr53213785e9.4.1792773127570;
        Fri, 23 Oct 2026 09:32:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cdc74b7sm25720795e9.14.2026.10.23.09.32.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 09:32:07 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH RFC v2] ASoC: cs43130: Take the frame layout from set_tdm_slot()
Date: Fri, 23 Oct 2026 18:32:06 +0200
Message-ID: <20261023163206.81891-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hw_params() derives the slot width from the frequency given to the DAI's
set_sysclk(), which it takes for SCLK. Generic cards pass MCLK there: the
simple-audio-card of a HiBy R1 (Ingenic X1600 as I2S master, 64 bit
clocks per frame, mclk-fs = 512) hands over 22.5792 MHz, so the driver
sets up 256-bit slots for a 44.1 kHz stream and the CS43131 plays white
noise. The card cannot simply leave mclk-fs out: simple-audio-card then
sets no clock on the I2S controller either, and the codec, as clock
slave, fails hw_params() with "SCLK freq is not set".

Add a set_tdm_slot() callback so the card can give the layout instead.
The two channels go to the first and second slots set in tx_mask, within
frames of 16 to 64 bits, the sizes the serial port clock tables cover.
When set, the layout takes precedence over the one derived from
set_sysclk(); zero slots go back to deriving it.

Tested on a HiBy R1, on v7.3, with dai-tdm-slot-num = <2> and
dai-tdm-slot-width = <32> on the codec node.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Changes in v2, after Charles Keepax and the review bot:
 - Full TDM: the two channels go to the first and second slots set in
   tx_mask, with the frame length from the slot count, instead of only
   accepting two slots with mask 0x3. Limited to frames of 16 to 64 bits,
   the sizes cs43130_set_sp_fmt() has clock tables for (beyond that it
   returns -EINVAL after the frame registers are written, and hw_params()
   ignores the error).
 - The callback stays: on the R1, without mclk-fs simple-audio-card sets
   no clock on the I2S controller, and the codec as clock slave fails with
   "SCLK freq is not set" (tried, see my reply to v1).

Still an RFC on the approach: set_tdm_slot() is what simple-audio-card can
express from the device tree (dai-tdm-slot-num and dai-tdm-slot-width on
the codec node).

Tested on v7.3 on a HiBy R1 with two 32-bit slots and mask 0x3, the only
layout this board can run: the DAC gets the same frame registers as with
v1 (64-bit frame, channel 2 at bit 32) in stereo at 44.1 kHz and mono at
48 kHz. Other layouts are build-tested only, with W=1 on 734bef548a96
(v7.3-7363).

 sound/soc/codecs/cs43130.c | 76 +++++++++++++++++++++++++++++++-------
 sound/soc/codecs/cs43130.h |  3 ++
 2 files changed, 66 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 48d88dad4ceb..e3571ea08252 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -651,9 +651,16 @@ static int cs43130_set_sp_fmt(int dai_id, unsigned int bitwidth_sclk,
 		return -EINVAL;
 	}
 
-	frm_size = bitwidth_sclk * params_channels(params);
-	loc_ch1 = 0;
-	loc_ch2 = bitwidth_sclk * (params_channels(params) - 1);
+	if (cs43130->dais[dai_id].slots) {
+		/* The layout set with set_tdm_slot() */
+		frm_size = bitwidth_sclk * cs43130->dais[dai_id].slots;
+		loc_ch1 = cs43130->dais[dai_id].slot_loc[0];
+		loc_ch2 = cs43130->dais[dai_id].slot_loc[1];
+	} else {
+		frm_size = bitwidth_sclk * params_channels(params);
+		loc_ch1 = 0;
+		loc_ch2 = bitwidth_sclk * (params_channels(params) - 1);
+	}
 
 	frm_data = frm_delay & CS43130_SP_FSD_MASK;
 	frm_data |= (frm_phase << CS43130_SP_STP_SHIFT) & CS43130_SP_STP_MASK;
@@ -952,18 +959,24 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	if (!sclk && cs43130->dais[dai->id].dai_mode == SND_SOC_DAIFMT_CBP_CFP)
-		/* Calculate SCLK in master mode if unassigned */
-		sclk = params_rate(params) * bitwidth_dai *
-		       params_channels(params);
+	if (cs43130->dais[dai->id].slot_width) {
+		/* The slot width set with set_tdm_slot() */
+		bitwidth_sclk = cs43130->dais[dai->id].slot_width;
+	} else {
+		if (!sclk && cs43130->dais[dai->id].dai_mode == SND_SOC_DAIFMT_CBP_CFP)
+			/* Calculate SCLK in master mode if unassigned */
+			sclk = params_rate(params) * bitwidth_dai *
+			       params_channels(params);
+
+		if (!sclk) {
+			/* at this point, SCLK must be set */
+			dev_err(cs43130->dev, "SCLK freq is not set\n");
+			return -EINVAL;
+		}
 
-	if (!sclk) {
-		/* at this point, SCLK must be set */
-		dev_err(cs43130->dev, "SCLK freq is not set\n");
-		return -EINVAL;
+		bitwidth_sclk = (sclk / params_rate(params)) /
+				params_channels(params);
 	}
-
-	bitwidth_sclk = (sclk / params_rate(params)) / params_channels(params);
 	if (bitwidth_sclk < bitwidth_dai) {
 		dev_err(cs43130->dev, "Format not supported: SCLK freq is too low\n");
 		return -EINVAL;
@@ -1609,12 +1622,49 @@ static int cs43130_set_sysclk(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+/*
+ * Sets the frame layout directly, which then takes precedence over the one
+ * derived from the set_sysclk() frequency: generic sound cards pass MCLK to
+ * set_sysclk(), not SCLK. The two channels go to the first and second slots
+ * set in tx_mask (both to the same slot for one), within frames of 16 to 64
+ * bits, the sizes the serial port clock tables cover. The PCM DAI only
+ * plays, so rx_mask is not used. Zero slots go back to the derived layout.
+ */
+static int cs43130_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+				unsigned int rx_mask, int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
+	struct cs43130_dai *cs_dai = &cs43130->dais[dai->id];
+	unsigned int frm_size = slots * slot_width;
+
+	if (!slots) {
+		cs_dai->slots = 0;
+		cs_dai->slot_width = 0;
+		return 0;
+	}
+	if (slots < 0 || slot_width < 16 || slot_width > 32 ||
+	    frm_size > 64 || frm_size % 16)
+		return -EINVAL;
+	if (!tx_mask || hweight32(tx_mask) > 2 || tx_mask >= BIT(slots))
+		return -EINVAL;
+
+	cs_dai->slot_loc[0] = __ffs(tx_mask) * slot_width;
+	tx_mask &= tx_mask - 1;
+	cs_dai->slot_loc[1] = tx_mask ? __ffs(tx_mask) * slot_width :
+					cs_dai->slot_loc[0];
+	cs_dai->slots = slots;
+	cs_dai->slot_width = slot_width;
+	return 0;
+}
+
 static const struct snd_soc_dai_ops cs43130_pcm_ops = {
 	.startup	= cs43130_pcm_startup,
 	.hw_params	= cs43130_hw_params,
 	.hw_free	= cs43130_hw_free,
 	.set_sysclk	= cs43130_set_sysclk,
 	.set_fmt	= cs43130_pcm_set_fmt,
+	.set_tdm_slot	= cs43130_set_tdm_slot,
 };
 
 static const struct snd_soc_dai_ops cs43130_dop_ops = {
diff --git a/sound/soc/codecs/cs43130.h b/sound/soc/codecs/cs43130.h
index dbdb5b262f1b..f0a28ab0a3f9 100644
--- a/sound/soc/codecs/cs43130.h
+++ b/sound/soc/codecs/cs43130.h
@@ -495,6 +495,9 @@ static const char *const cs43130_supply_names[CS43130_NUM_SUPPLIES] = {
 
 struct cs43130_dai {
 	unsigned int			sclk;
+	unsigned int			slots;
+	unsigned int			slot_width;
+	u8				slot_loc[2];
 	unsigned int			dai_format;
 	unsigned int			dai_mode;
 	unsigned int			dai_invert;

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5


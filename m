Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793326408;
	b=pQSnrsTWqNElN2+fsIPD0rL2hDm6UxOiCXevLqD5dyca+gJVdpZjl7twN6+K56tgboas
	 g8v1N990FBiiz63mcBgK8rgv3dYt/p3MKnEizBaB/3599Lkf/AU3+0eImA14N5LtU1fL5
	 a58zfryOucyWVzxBj8Nj0P8XVYV+fFK1mPxbhZmwPZo23AEhmcp7g6nvpzzpBuf4Ou4nh
	 OMG3PSiaB+95xX+TNcNWL5DQCrmmusmjCqe7nJATXtgqf8OUCMMpfkcz/FskM9Htg8iMc
	 2faXccAKs2XBzcbF5+VXgQqVAtORbzVwmBEoeDEXH6SSr1MhfMEhe7Fylm94zd2gVOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793326408;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	bh=3mfY1XQY6+BsOBwsGoVRzpOrpw7klvougLIh596jePQ=;
	b=4eFfpyJp80Q7Jv1WcQ0cTZcCzixKldZh7zCA7WGMTl2v48FGluQ9oRW6wsvVNPNhKuFs
	 2PS6hVF1hLMx3mRONXoW5wawgcs9m8ao7Rdt8YSRasoGMb+LMMfTtqChe9W1MzEqsSv/w
	 FZaZLSFZDge+oE0GiViL9oox5Hwdy0PIRK+OXwbTOJiNqtqjnMGwJyConZ1mZa2DkT9bF
	 ST2WoZtStx7G4d11ZUt9dYrRV5Q3taU8PnWcsCGd2xx7U38rPvp2eTjCdhEmxJon+sfPT
	 4XubSPVUo+I9687aPScU7geBRwK86ONem+weGD2p+11rH40p2wrkVFF8JTtFyyawCww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.89
Received: from r3-89.sinamail.sina.com.cn (r3-89.sinamail.sina.com.cn [202.108.3.89])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB50606A324
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 02:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB50606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6AE3FD3B0000704C; Fri, 30 Oct 2026 10:13:16 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 2405018BAED74B2698A9E81BB11A7DB6
X-SMAIL-UIID: 2405018BAED74B2698A9E81BB11A7DB6-20261030-101316
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2] ASoC: codecs: ES8389: Fix the issue of hpf_freq keep increasing
Date: Fri, 30 Oct 2026 10:13:12 +0800
Message-Id: <20261030021312.2027-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

The problem is that on repeated stream runs the value of hpf_freq will keep on
getting updated and drift away from the original setting.
Until hpf_freq increases to a value higher than 1020, find_best_hpf_freq will return false.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
Changes in v2:
-Correct the error type

 sound/soc/codecs/es8389.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 267806b72..2d60f7536 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -99,7 +99,7 @@ static const u32 hpf_table[10][10] = {
 	{496, 244, 121, 60, 31, 17, 11, 8, 0, 0}
 };
 
-static bool find_best_hpf_freq(u32 target_hz, u8 *hpf1, u8 *hpf2, u32 *out)
+static bool find_best_hpf_freq(u32 target_hz, u8 *hpf1, u8 *hpf2)
 {
 	int best_row = -1, best_col = -1;
 	u32 min_diff = U32_MAX;
@@ -118,7 +118,6 @@ static bool find_best_hpf_freq(u32 target_hz, u8 *hpf1, u8 *hpf2, u32 *out)
 				min_diff = diff;
 				best_row = i;
 				best_col = j;
-				*out = f;
 			}
 		}
 	}
@@ -147,27 +146,25 @@ static int es8389_hpf_set(struct snd_kcontrol *kcontrol,
 	u32 freq;
 	bool hpf;
 
+	if ((ucontrol->value.integer.value[0] > 1020) || (ucontrol->value.integer.value[0] < 0))
+		return -EINVAL;
+
 	if (es8389->hpf_freq == ucontrol->value.integer.value[0])
 		return 0;
 
 	if (es8389->capture_rate) {
 		freq = (ucontrol->value.integer.value[0] * 48000) / es8389->capture_rate;
 
-		hpf = find_best_hpf_freq(freq, &es8389->hpfl, &es8389->hpfr, &es8389->hpf_freq);
+		hpf = find_best_hpf_freq(freq, &es8389->hpfl, &es8389->hpfr);
 		if (!hpf)
 			return -EBUSY;
 
-		if (es8389->hpf_freq != ucontrol->value.integer.value[0])
-			dev_dbg(component->dev, "At the %u Hz sampling rate, %ld Hz could not be obtained."
-				"the frequency has been set to the closest value, %u Hz\n",
-				es8389->capture_rate, ucontrol->value.integer.value[0], es8389->hpf_freq);
-
 		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, es8389->hpfl);
 		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, es8389->hpfr);
 	} else {
-		es8389->hpf_freq = ucontrol->value.integer.value[0];
 		dev_dbg(component->dev, "PCM_STREAM_CAPTURE is not active.retain the input frequency\n");
 	}
+	es8389->hpf_freq = ucontrol->value.integer.value[0];
 
 	return 1;
 }
@@ -790,7 +787,7 @@ static int es8389_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		es8389->capture_rate = params_rate(params);
 		freq = (es8389->hpf_freq * 48000) / params_rate(params);
-		hpf = find_best_hpf_freq(freq, &es8389->hpfl, &es8389->hpfr, &es8389->hpf_freq);
+		hpf = find_best_hpf_freq(freq, &es8389->hpfl, &es8389->hpfr);
 		if (!hpf) {
 			dev_err(component->dev, "The HPF frequency is invalid\n");
 			return -EINVAL;
-- 
2.17.1


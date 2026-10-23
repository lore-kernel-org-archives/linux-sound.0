Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722625;
	b=OvrW1K7dIAFearTgPOfCmaEon4hsFiNKzyxcxh0BKzU9rF1p+0SktzofbpuOBDs9G18B
	 lEnqY1L2AO8cwnRYGsu9okBusQykzhzpGCVKBcD81RKvZWgkEm1VYHLVdT+5eSilHF2yM
	 ZzV4u6S0NjO/zXxQHDlVyt6rJ24Jy+dRG7sqP/VB4CqSNGOUtRJzvOcAGl23sFC4soHQC
	 l3SzaNtBkpPVde9hOP+G4QbhezmnaVBWWB6AaA8Ph8sUvmcMgy5hWRpYAGgc4vfF2s1Ro
	 9xGfYXIuNaBDBzfh5xesDnSN19yZ3SLdrZ5Fy1vD3MeplvA6r6iltttEBbKcaJPa/vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722625;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	bh=0iIp7ZilbNPZwJKDMY8hAWIq29EHWjNdGJetBX68l5w=;
	b=rNWluuPXB4RsuJFyi7fa6e+VJn/j2vGAw6vA8p6g5zAcNpQ9k9NfIKJ8NONW/vGVQqCN
	 YkBjbo16IdPiKc28xJt+u9WM+Zf10pAEyDSfts3W3+D2whQ3wbfCsqmh3u0hvigiti+Fg
	 9osaXx0XtSdmavhryu6hoBU/45KFofxkT9Tvycj9wdgpTi8ztbTIJn9Upi3KIbtjOyH8b
	 BnlAf7w22ppwlXlwJkcLCpcM7yQWkAsqHFKpzqYk6IYOe4irs8dSS0580fY4Uh3H4/y6E
	 vaQi2+DfQI4ahvQiFGcCpIiVZsrYVA9MxTbpcGB67ujyDdywsGaxQEhPHDgXFc3bQuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=61.135.153.176
Received: from smtp153-176.sina.com.cn (smtp153-176.sina.com.cn [61.135.153.176])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F306606A319
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 02:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F306606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6ADAC6B700002EA9; Fri, 23 Oct 2026 10:30:16 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 03E39A4DE34745608707C463867CC961
X-SMAIL-UIID: 03E39A4DE34745608707C463867CC961-20261023-103016
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH] ASoC: codecs: ES8389: Fix the issue of hpf_freq keep increasing
Date: Fri, 23 Oct 2026 10:30:12 +0800
Message-Id: <20261023023012.30352-1-zhangyi@everest-semi.com>
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
 sound/soc/codecs/es8389.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 267806b72..b1cac5d50 100644
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
+		return -EBUSY;
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


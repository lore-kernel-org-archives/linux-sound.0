Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1980947F3BF
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 09:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450238; cv=none; b=J43NdeMaQAMzMnPsZ0YLcKK3djBr5mQyaEK7MKcfj7m8/Q6LjoCHbegGSRotaMfCI7ZUSlsM6CA5LF4w4YMl6rxdsWqgLWAOBtv7gZ7CGokIPcD0/sq7vKE4CP4g3G2gt+qECdL+NwMHAkFebSe4NGRIZxJbWHv7d/y8StR4A7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450238; c=relaxed/simple;
	bh=rPFHU/dHvsalIQh2kIlaQoM2+u0pyE81CSxF8JWhmKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bbkwS34TI8etkJXjWyJ+XpY9scg605LJe3Vjjx154BxnxKcJ2HIFt4SzND2kxyX/H4XELpsOTWFt3fFnDEfdkAwbu50C6fyK/Pd9lWShx5DeUwtw6x19GjxsjQlh0iQIdptcHvidY9iVP2Iss+WGDsrcBNyY0dqmSuCUChmEk6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EywOgxTt; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EywOgxTt"
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ab04c3c533so160697a91.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 02:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791450233; x=1792055033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgelxhHvWewT2d9+1zKJoOvTtUQIEsPwXQ0LcCAPAoQ=;
        b=EywOgxTtdVzH0GVtuZ7lyDWoppwk+4lrloifmqwaLJwghPSnwryu/ZyxS5+/Z+jPam
         JrgvxwkULr9KfyVsVz8D0/w6IFINz6F/F1W1NntxBOyOlIpJ7khK3PSZ2Xe57YZRQrTj
         96z6YHJozMPC45AVyFJg4cjxA6It+p4XR4+2er0QCTJVHzWpDIz5qqJkS4WK22TReVl6
         6Z0V2nr60xhIjoY5lu3oKFKyKYhqeG5gJjsHuGS26yU/EvnouyoXs8W8sxYKcpnzoRWp
         hAEKJ95beH9LAT34QywDUyMhxZ6U+tRraOATqJzXiuWXIB4y7n3vjfhEPTzAxeiSa1o6
         PjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450233; x=1792055033;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kgelxhHvWewT2d9+1zKJoOvTtUQIEsPwXQ0LcCAPAoQ=;
        b=p1fffYFrQUqlKUphwxnRVwMdL7tqE5vAz5fAMstBG6v/dLcNY1YA/v5ZKQI52RcwQf
         0LeRpeWIKsMRneG7I/Pp3SicgqM5x4eRNJyxMMYXfg+6GJooSSeuia+Ppba9CPrDKu4T
         tqlXBqfjxLaC7IaXYZhK7Fkexbihdw7M0M3w/zcl6xww2bpr3PaOb7Sz2JlqGT7z7Rj3
         Drma5IO49CGgj9eXrBFP9Y1MePvqQ8Z95UXtnw9WqdJEjHJZhlYLWcDW2FgNOhFkhXkd
         OfM+xITa7dwZoYio0uEJ8iTksZGE3iLFdQsT3G53hy8LGUu/i7zl25RwUZacBtHHSkYd
         e6Fg==
X-Gm-Message-State: AFq9FYLwXRAyJX6NwnDQ/zAYrOmw+grwL4hpSbZftA2b+6XqUrIpFXz6
	MJJ+ty9+fAKPc8mD26SOEHLYV9GbYWBm/twTxrouoos6F/Oc6QtcjfQY
X-Gm-Gg: AYBFou2lJOYtSAVROoxzU+XjeVJ0weuh9kR7jXq4Z+5AJPtRPEzdMwsezPTQgV3mVua
	QAulLJjlm2tRZTXgANlD1EqbcvjCV0+P/u3o2EIvBbVqP+ztmKmx7b1mrziMOU3WgQ1fq70E/Ic
	k+5b1V7Ll8pyCJSw1EBCVd1cdcntxExhvZ6iXVNlqv16QBbxqJd0wZqxtkZQTQvokRGDnacU72O
	v8o8Wg6z9nuJbGyBoKjU2acvihTIOG7yblEw8YlsX1VpuIzTCVijHhiBvrGXbEbC00xLSJ4YASf
	R/bSg8Uo/9go4SyGbhP0wC+zFG2yMmj6gez7sGYHkl2Q4dDe8nOzHVnb81fF983qKdSRhJ4UoCd
	+61q052OTAftHJysR6lPt/vSjxn4Ug9fpTBN0BR6VPUK2rBqYJ2+8gQjWcedD0fEKnEToMm32F7
	bdIclFdBzvcrTEAOXqpAvGfXV02v31JWl7fe+om/GHjFKlr/cnX4KXtBL266CIp3nHX1L+SZXFH
	5col4VrAF0PMVwx
X-Received: by 2002:a17:90b:2ccc:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3a8a1bd0bc8mr3684185a91.58.1791450233175;
        Thu, 08 Oct 2026 02:03:53 -0700 (PDT)
Received: from [127.0.1.1] ([183.54.233.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm3289565a91.15.2026.10.08.02.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:03:52 -0700 (PDT)
From: Zachary Huang <zuzhenhuang365@gmail.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, zhangyi@everest-semi.com
Subject: [PATCH] ASoC: es9356: add missing DAI rates and formats
Date: Thu, 08 Oct 2026 17:03:19 +0800
Message-ID: <179145019931.16888.9682263186729943710@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ES9356 DAI definitions only describe the channel count. Since
snd_soc_runtime_calc_hw() derives hw->rates and hw->formats by intersecting
the capabilities of the CPU and codec DAIs, an empty mask on the codec side
leaves the whole PCM with no usable configuration, and soc_hw_sanity_check()
fails every open with -EINVAL:

    ASoC error (-22): es9356-sdp-aif1 <-> SDW0 Pin0 No matching rates

es9356_sdw_pcm_hw_params() already programs 16 kHz, 44.1 kHz, 48 kHz and
96 kHz, so advertise that set, plus the formats used by the other SDCA codecs.
Verified on a MECHREVO WUJIE 14SAH (AMD ACP6.3, ES9356 on SoundWire link 0):
with this change the PCMs open and speaker playback, headset playback,
internal DMIC capture and headset mic capture all work.

Link: https://lore.kernel.org/linux-sound/20261007193038.2473068-1-mario.limonciello@amd.com/
Link: https://bugzilla.kernel.org/show_bug.cgi?id=222092
Assisted-by: LLM
Signed-off-by: Zachary Huang <zuzhenhuang365@gmail.com>
---

Zachary writes:

This is the separate ES9356 codec change that Mario mentioned in the machine
entry patch linked above. Both changes are needed for audio on this board;
with both applied the internal speakers, the internal DMIC, the 3.5 mm jack
and desktop playback (PipeWire) all work.

Tested on: MECHREVO WUJIE 14SAH, AMD Ryzen 7 H 255, ACP6.3 (rev 63),
ES9356 as sdw:0:0:04b3:9356:01 on link 0, kernel 7.2.9 + the machine entry
patch above (localversion -es9356test). The corresponding alsa-ucm-conf
change (no ES9356 UCM profile exists yet, so PipeWire only exposes the jack
PCM) will be sent separately.

 sound/soc/codecs/es9356.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 80db0f2..b8b3ffc 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -26,6 +26,20 @@
 #include <sound/sdca_asoc.h>
 #include "es9356.h"
 
+/*
+ * The DAI stream capabilities were never filled in. snd_soc_runtime_calc_hw()
+ * intersects the capabilities of the CPU and codec DAIs to derive hw->rates
+ * and hw->formats, so an empty mask on the codec side leaves the PCM with no
+ * usable configuration and soc_hw_sanity_check() fails every open with -EINVAL
+ * ("No matching rates"). es9356_sdw_pcm_hw_params() already programs 16 kHz,
+ * 44.1 kHz, 48 kHz and 96 kHz, so advertise exactly that set, with the formats
+ * used by the other SDCA codecs in the tree.
+ */
+#define ES9356_RATES (SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_44100 | \
+		      SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000)
+#define ES9356_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
+			SNDRV_PCM_FMTBIT_S32_LE)
+
 struct  es9356_sdw_priv {
 	struct sdw_slave *slave;
 	struct device *dev;
@@ -617,6 +631,8 @@ static struct snd_soc_dai_driver es9356_sdw_dai[] = {
 		.id = ES9356_DMIC,
 		.capture = {
 			.stream_name = "DP1 Capture",
+			.rates = ES9356_RATES,
+			.formats = ES9356_FORMATS,
 			.channels_min = 1,
 			.channels_max = 2,
 		},
@@ -627,6 +643,8 @@ static struct snd_soc_dai_driver es9356_sdw_dai[] = {
 		.id = ES9356_JACK_IN,
 		.capture = {
 			.stream_name = "DP2 Capture",
+			.rates = ES9356_RATES,
+			.formats = ES9356_FORMATS,
 			.channels_min = 1,
 			.channels_max = 2,
 		},
@@ -637,6 +655,8 @@ static struct snd_soc_dai_driver es9356_sdw_dai[] = {
 		.id = ES9356_AMP,
 		.playback = {
 			.stream_name = "DP3 Playback",
+			.rates = ES9356_RATES,
+			.formats = ES9356_FORMATS,
 			.channels_min = 1,
 			.channels_max = 2,
 		},
@@ -647,6 +667,8 @@ static struct snd_soc_dai_driver es9356_sdw_dai[] = {
 		.id = ES9356_JACK_OUT,
 		.playback = {
 			.stream_name = "DP4 Playback",
+			.rates = ES9356_RATES,
+			.formats = ES9356_FORMATS,
 			.channels_min = 1,
 			.channels_max = 2,
 		},
-- 
2.53.0




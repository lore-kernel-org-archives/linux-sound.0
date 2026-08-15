Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E703374169
	for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786793836; cv=none; b=O2SPzvUUzADP/k1k2A3lj3STC2PhfBIGYjFh5720G3cMMmATGaYoNveL9Mrch04pYvzKVzJa0MyJV3ZB9OHhHV26VZ7UfXQCKzT0xTf3U8GD1+CXndfMNTZQeV9J0a5ZwjvbJEPjBnmamB9Si6276/KM2DowiRH2q/nW1xwOg1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786793836; c=relaxed/simple;
	bh=FOugWQtEBeJQzD8N2Sftusib1lLmHx31ieC3m5AMQ6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eRFaTEPgrNGHp8EZvWpI7iI0841uSyZQTkiBQE2G88NGG44xDaIihwB+oH0HlX2rUKggSTAv69oS/r3HALQoCJIJe+z2IJxhtIgvFOPAmFJcC08KmnGFd5KsR8WdtUyEY7Xy0GP0fh0Tn78maleRCAGXRjYLSbhvblOR8JoDzag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXVHEhgm; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXVHEhgm"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so2051969e87.0
        for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 04:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786793832; x=1787398632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V26MBOUuWr7mg1xevaQTApAYaUSfXN8eYj29b1TCTK0=;
        b=XXVHEhgmi8+ghgbtB0RMh6EVuLqRHK2vixxPXJtZ3pYxFz16uy1hQevI9FXmzU4F8h
         7Hi8TuLTiiDCA5me+YaVkhOVWO4M9kQEvsrgu7s1MNkENHBLd5nT0pxgf957GzqsPKu1
         uwSRBoW9x0Quz9ZisA9rgScBSzNfZQvXjCUIknb9HSxcT2NduTR8nGrU7+M15Wt+wiD2
         l3wmAKkFU3lDnOtC4Thl7Va1v7q26nt7QxnoP8F2GfWzDaca9U3SIJIbI8kc5kaqv0qW
         KFDslPHVNJKzYV5nKiYjPaq/mmXrqyRIHWXDRWoyPK2rmECTvq5oGPP/G4MZfuIFUVdz
         K3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786793832; x=1787398632;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V26MBOUuWr7mg1xevaQTApAYaUSfXN8eYj29b1TCTK0=;
        b=INgN0+Wb1ySSIsWvw2qU3xt/CwKaMEu6a+S/4Hqi5e4pkf68UNIyQeme9u88o204G1
         5i6eZkq3skMIqtma1Z3lez+KiHY+eZBzUytsK9sIimlkjtzK2+5Aj/bv4mISK3MuAgv/
         +6xphbKNXK55MI/QlabPdUBVr8/vbggX1jw517bYWQFOF3thcWOx1A7vrE7wXJbLkpnT
         YnuS4/V4ooNom/8xkCygA38uFogO5W1oqqMjZwQkiWdqD07Xqg5nZyZKpu66EjIGp1iP
         g+CyDdA5UxTtF+4h9ILpJFBMsPmMKq0fwxKkAImGMObjDniS8Hrv0xQgHny2ko8MjbP/
         nYsA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5qTSDo2jALe7NnUYx0g3c0bUzv9vOLp0Frlo+E6KM87dxJdvtnNKbdVbZap7eFNnizNddKFXiD9aKXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxt13z8VRbJCmyyQxN5qgnhj4QqQFlWuY90jUtlsr10z8JXbi1
	IuQWb7NSCHVtZGcq4Dz+9ZuAi06j1gqo+xdN8LhoaedWbdUEz8lSunX+
X-Gm-Gg: AR+sD13XlXOFzUf06kKC+bqCy5qAIQCTX1NqQb2I18GdgcIGdZdQ+0+2kq4PAO7v2mk
	xJizIsuUBnqsWl4HKPcTqTAzmnx6IZ9w14PqkOoOLgKhrfQmIOI5wGsP6my3R3CxfY/uWN7aJ92
	7mNK/CJBZzd9vKkoe5NED0Wl7e+z5clcYDCAuvttDQAFizOGyP2OwbjvyrInyh5jiIw6ceaksMg
	/xbcTe/Ps1gz7MUwzpFWwqtjVEgFS6dD1AXwLE5iv9N0IsI3lDd++AbJLPbCv6YtnstLwWEnqsK
	VUXeWXXxXqKy8vFHJ1h/UEmPa3pX9EO1KnLt3R0yBccpEbYGPotR3SKXT8GcSBEh/VA3OfLbDU8
	BpPjMREve+1VDCrML43SBYCHNtMOMHHXNkZ6x1dX8EIg+c92XcmaE3QY4KTmTHTmeCfm09sRVrj
	WpZhcxUx/WOXs0ar6+kN1kzwR18Dc0BkKp89HRUMB/bzKGi4b+WRu0S1vrSXHkWz/RZPPMLFKs6
	VjL3L4rZf4y3gMKGv1vHAc=
X-Received: by 2002:a05:6512:1306:b0:5b2:a6e6:8d83 with SMTP id 2adb3069b0e04-5b461dfc275mr483051e87.23.1786793832285;
        Sat, 15 Aug 2026 04:37:12 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458c09d2csm1084285e87.65.2026.08.15.04.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:37:12 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tas2783-sdw: split a stereo stream across the two mono
 amps
Date: Sat, 15 Aug 2026 14:50:00 +0300
Message-ID: <20260815113000.4488-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Antoine Monnet <antoine@montane.tech>

A board with two TAS2783 aggregated on one link renders mono: the two
amplifiers are mono parts that each carry one channel of the stereo
stream, but snd_sdw_params_to_config() hands every codec the full
channel mask for playback.  The pair stays in mirror mode, both amps
render the same channel, and the other channel is never reproduced.

Claim a single channel per amplifier instead.  The index comes from the
machine-assigned component name prefix rather than the SoundWire
unique_id, which is board-specific: soc_sdw_ti_amp.c names the
amplifiers tas2783-1..4.

The bit that is set does not choose the side.  sdw_compute_slave_ports()
advances the payload offset by hweight32(ch_mask) and never looks at
which bit it is, so a one-channel mask fixes mono by defeating mirror
mode, and left and right then follow the amplifier's position in the
codec order of the DAI link.  That was measured: inverting the two masks
between the amplifiers does not move the audio.  On the boards this has
been run on the codec order matches the prefix numbering, so the sides
come out as the machine driver names them, but the mapping is not an ABI
promise the bus allocator could honour.

Reported-by: Robin Everaars <robineveraars@pm.me>
Closes: https://lore.kernel.org/all/20260805183517.8665-1-robineveraars@pm.me/
Suggested-by: Robin Everaars <robineveraars@pm.me>
Signed-off-by: Antoine Monnet <antoine@montane.tech>
Tested-by: Andrey Golovko <andrey@golovko.me>
Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
---
 sound/soc/codecs/tas2783-sdw.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index caf8fe1bf4db..c0c59480064a 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1001,6 +1001,31 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream *substream,
 	/* SoundWire specific configuration */
 	snd_sdw_params_to_config(substream, params,
 				 &stream_config, &port_config);
+
+	/*
+	 * The two mono amps each render one channel of the stereo stream:
+	 * snd_sdw_params_to_config() hands every codec the full mask for
+	 * playback, which leaves the pair in mirror mode and one channel
+	 * unreproduced.  Claim a single channel instead, keyed off the
+	 * machine-assigned component prefix rather than the SoundWire
+	 * address, which is board-specific: soc_sdw_ti_amp.c names the amps
+	 * tas2783-1..4.
+	 *
+	 * Which side an amp then renders does not follow from the bit that
+	 * is set - sdw_compute_slave_ports() advances the payload offset by
+	 * the popcount of ch_mask and never looks at which bit it is - but
+	 * from the amp's position in the codec order of the DAI link, which
+	 * on these boards matches the prefix numbering.
+	 */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	    params_channels(params) == 2 && component->name_prefix) {
+		const char *idx_str = strrchr(component->name_prefix, '-');
+		unsigned long idx;
+
+		if (idx_str && !kstrtoul(idx_str + 1, 10, &idx) && idx)
+			port_config.ch_mask = (idx & 1) ? BIT(0) : BIT(1);
+	}
+
 	/* port 1 for playback */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		port_config.num = 1;

base-commit: 0c7aeb0f5eceb95b5887bd8e83fef865e5a49a13
-- 
2.53.0


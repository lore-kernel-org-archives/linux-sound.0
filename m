Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E724521ADCB
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 06:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763967049; cv=none; b=i+Bnb0TSUrN1chQHSFiRHLINEg0dn6NI5X9q5zrgQsJVvb1PRxSTewJuANYfYhQ54DGagu0vLj7QmekOdonprAZeoZnT5A4LiKPJH5fcXrNOZ6JVRGI4jHEhCMNXYr7b9ZYTF8dzqjgrSjnhCzbAtcs8dTe0ctl5eA4Dn90YYeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763967049; c=relaxed/simple;
	bh=CDShQlU/cSjcTsIpI2njOpO2txWPLMTvYbcfH6GtBUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSJHswCjAsemiyrdmg5ldoLfDOrsmowT6rcGx2RMAPlOn3uvAcHD6ANcmSq+b031UHXSB5HT4UjP+d7z0yZ+ECX3KNhmt9XRmWtMCJCTKAqFeflfb+LW0Ei/yxhdwUe1s+ho2MF4kwT9BSLgKW6fkemXDGISuaWkgzdj29dP1KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=AsFMxLsQ; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="AsFMxLsQ"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b2dec4d115so397687385a.0
        for <linux-sound@vger.kernel.org>; Sun, 23 Nov 2025 22:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763967046; x=1764571846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64NexCTfBJLKpFJlS/fd0Q6ob7ab6FhTIMphcAktnfI=;
        b=AsFMxLsQaSEyfjz4zb1xlHCFC4f0M6/KidjnJ7VuO+oUhbMU4+hA3lRgtOL/nex9Op
         uQk0Ogc4pq7mxTx6+y+2GlFodvw0ZI3UnmELOZ97hYU0XVGE8LSF8SS+FGjlkE2WXrtY
         oRRuMaQ4UHx6inX7ueCR/Ko4gr5Fbcnb1ZyP0PeJrPHl4jyP0TqMWKEFh6iTpk5ee5Sn
         caNQYo1el2pvH2RQ9t/0x6lvUCgglWbRaHMWbsudNfwTiXaw/vAB6YTj2vlRVdXVSBzb
         yopBxLFcFNp0B9wpYEpzuxqgZtKuP3hK7IhvL6Gwv1XfQDWdBaFzRDUmGfPfF9jQWBAL
         IqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763967046; x=1764571846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=64NexCTfBJLKpFJlS/fd0Q6ob7ab6FhTIMphcAktnfI=;
        b=qt78npmzT0DEGoYNtYwpzXegIyPfx5TzMbuFXQ4C93lAYIEcyssKhQPbnKru3y1oEF
         vowVO+WNvLhIrrUWB6ah6zrPqaQt+9GyZBEiWqv/q6AmnsLZjlM6qIxs0pgnUe22ZMsx
         eJsaQ37urD3wMncB6OHH6G6hPtL2FA4+6ps+d74DHj4ZcZAANLj7gmR1aJ8DnPMqm4rN
         iI83AFVqwfkdRh6YGt61LgoWugg5nVJJXBWPERybvLOEZIFFHQ+6kox99v2OWl9dzlsN
         dXhmSne9v2+7PqeTm+iMjDLrILaxa/eRYIMb/itqO7dSGEEl72o1jh4Usg9h1sasNkWc
         y7zg==
X-Forwarded-Encrypted: i=1; AJvYcCV2N7DPbns1Yru/mnNNgjf/S7RiiEs6UVYWDMzRKdnwWAABKoadP0oruc54VyFUiVSknxGi02rqd2YZNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcLb+2gsWUz0bwFIMa4Q2/sG3wZeZGE9zB6EvaCctnZXn8SQDs
	bI8CEagyFVkWWd2HONPzw/0qL3TV/jNtDKukkaaL3WW4Vwz0GoYGvwzeLY8K2ohUDFU=
X-Gm-Gg: ASbGncs93ffTfmKFWIaaGxlvV/GTk20I+0bTxTyXXfD8sD2pEqDod5z6XhVwA6RQcVb
	3g9CYizhok2iIjnm1scmHkkoejceWqzY3n8NbahQ/GxASdCiIwexEIKs/NOe5d1eLU4Rs2wR2TC
	kvQ0DWjhcOVPTnqbCCMdesOvoONIaTjJ6fl17aaSknFUDZvdRVydLfmT3eVWBNgi5Xhayffl8q0
	mnIl57VbeU74yUaUsO9B69HaatkQQt5HtsSGol983kA4ZUxL6spCstArpmW9A8LZB64M3TGv9OL
	dc7OSJIq5x/dZUywn3+6+H8TrDeat+/742jjUdLzFVHAKqp22YPer6wiSGEVICRggY+w5U2yjZT
	/JyWtzYwLnjNUiamatTiCy935oOkbDoNLXKxSEw83juvfLSzDdTmlPqhirAwrwfnSFAmvHw+1Fa
	n2UqH4qunLe6OaDGR91ZRemwuV4PZqliopg4VTtum2D6iO7BfJANqY0YK/pxeQnehk0Q==
X-Google-Smtp-Source: AGHT+IF6no5UKhBX9SHPBCL+XUi89blDXI7xfpEX7F/7tAobu7a/8TUxHIlqxsStDopfRUyd1LswXA==
X-Received: by 2002:a05:620a:4606:b0:8b2:f191:2b3b with SMTP id af79cd13be357-8b33d5e2e3fmr1386347885a.67.1763967045778;
        Sun, 23 Nov 2025 22:50:45 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db8b1sm889075185a.40.2025.11.23.22.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:50:44 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/6] ASoC: codecs: wcd938x: fix get_swr_port behavior
Date: Mon, 24 Nov 2025 01:45:59 -0500
Message-ID: <20251124064850.15419-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124064850.15419-1-jonathan@marek.ca>
References: <20251124064850.15419-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For example trying to do this:

amixer sset HPHL on
amixer sset HPHR on

Both HPHL and HPHR share the same "portidx" value. After HPHL is enabled,
wcd939x_get_swr_port returns an 'on' state for HPHR as well, and nothing
happens when trying to set HPHR on because it looks like it is already on.
The result is audio plays only on the left side.

To fix this, drop the port_enable array and use ch_mask in port_config to
determine if the switch was enabled.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/wcd938x.c | 9 +++++----
 sound/soc/codecs/wcd938x.h | 1 -
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index cf15190dd61a4..1768209e35ea0 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1839,14 +1839,17 @@ static int wcd938x_get_swr_port(struct snd_kcontrol *kcontrol,
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(comp);
 	struct wcd938x_sdw_priv *wcd;
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	struct sdw_port_config *port_config;
 	int dai_id = mixer->shift;
-	int portidx, ch_idx = mixer->reg;
+	int portidx, ch_idx = mixer->reg, ch_mask;
 
 
 	wcd = wcd938x->sdw_priv[dai_id];
 	portidx = wcd->ch_info[ch_idx].port_num;
+	ch_mask = wcd->ch_info[ch_idx].ch_mask;
+	port_config = &wcd->port_config[portidx - 1];
 
-	ucontrol->value.integer.value[0] = wcd->port_enable[portidx];
+	ucontrol->value.integer.value[0] = !!(port_config->ch_mask & ch_mask);
 
 	return 0;
 }
@@ -1872,8 +1875,6 @@ static int wcd938x_set_swr_port(struct snd_kcontrol *kcontrol,
 	else
 		enable = false;
 
-	wcd->port_enable[portidx] = enable;
-
 	wcd938x_connect_port(wcd, portidx, ch_idx, enable);
 
 	return 1;
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index c18610466d7d8..6650c3788d6e5 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -639,7 +639,6 @@ struct wcd938x_sdw_priv {
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD938X_MAX_SWR_PORTS];
 	const struct wcd_sdw_ch_info *ch_info;
-	bool port_enable[WCD938X_MAX_SWR_CH_IDS];
 	int active_ports;
 	bool is_tx;
 	struct wcd938x_priv *wcd938x;
-- 
2.51.0


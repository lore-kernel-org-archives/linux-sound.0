Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF72E737C
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708184; cv=none; b=ZrrBrpPixgEnB+W+/RpNrT+Ftodg443L7sodqo0u/hg1V7KyGwcwZdYgPxRlP3oISlw/s6fZJcY/LqVffJkr0Dw7O8qm42TJn1mLTMYL2YBk/RObMAaR2+Mi9OfGvAivi+PfkM1BAeaOoInQ3x94ThbmVJY4Owosc5oJAdmXkNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708184; c=relaxed/simple;
	bh=FD4MZbubjzQrPudYXoggs8oxWu1u+iRI+HHQovqqAFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fojtq5ViftgvbtKTl+5KeomMcRjTPcRV58ZzZqMWskZyiVrHEQP8mNd9+/oe83zDDCMxj1sNQSJGX/1wX21lQmRnOz4fDw7d+O5LX1R+3rkeC7k4f2yps8Oxe8olx6OdU4wYGdCGsAI+uEWEIhjJHxxkmAdpGLmWI0JBEJ0SG+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=w4AbCBKW; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="w4AbCBKW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1781708170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MMwZCh7biXRfQ9OugCAuGNz7dVoKYNV9aSvet6kpUIs=;
	b=w4AbCBKWNWTnc7tmD0S4hBcpg7kgqHaBjmp81GWs+k1w21uCIP7KzMJpdmCjxHWARO+9Pe
	+UE96icbSPEadsLg58JP3iOOHXit1Rnh6Qc7Qd99vmKZy5B9RcB/1a0vVnq/MQc0pmZSBL
	Hkk//hByRlfqlMp/2Hluxv1BBZlt6sCL3CuctiujxCLLDya87cM2qg0NSpmKIbuRTiKVf9
	zVWeDTa+5bjOX34rXh3LgX0XMUBBUx2Aw+JJ5uIMdiyftg4Ad6miJzDyhiE4VXhVlgeIBh
	+2fiE9E3pCSYPGWMZcXhpxUsydvCowiivWy7hrOJV6gQcw6PgnYYiKOJyC75yw==
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>
Subject: [PATCH] Revert "ASoC: audio-graph-card2: recommend to use auto select DAI format"
Date: Wed, 17 Jun 2026 16:55:08 +0200
Message-ID: <20260617145508.327213-1-alvin@pqrs.dk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Alvin Šipraga <alvin.sipraga@analog.com>

This reverts commit 442cfd58e71260dcd983e393f750e36fe7ab34d0.

Sometimes the DAI format must be specified in the audio-graph-card2
device tree, so emitting a warning can be misleading. Revert back to
emitting no warning.

A few examples where automatic format selection might not be applicable:

- For DPCM, where the other side of the DAI link is not apparent, no
  proper selection can actually be made. This can lead to disagreeing
  formats.

- Due to hardware peculiarities, some ostensibly supported formats might
  not work in practice.

In either case, the only correct solution is for the sound card to set
the format

Link: https://lore.kernel.org/all/87ik7s36k2.wl-kuninori.morimoto.gx@renesas.com/
Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
 sound/soc/generic/audio-graph-card2.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 6894bb936cfd..0202ed0ee78e 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -778,18 +778,6 @@ static void graph_link_init(struct simple_util_priv *priv,
 	graph_parse_daifmt(ports_cpu,	&daifmt);
 	graph_parse_daifmt(ports_codec,	&daifmt);
 	graph_parse_daifmt(lnk,		&daifmt);
-	if (daifmt) {
-		struct device *dev = simple_priv_to_dev(priv);
-
-		/*
-		 * Recommend to use Auto Select by using .auto_selectable_formats.
-		 * linux/sound/soc/renesas/rcar/core.c can be good sample for it.
-		 *
-		 * One note is that Audio Graph Card2 still keeps compatible to set
-		 * DAI format via DT.
-		 */
-		dev_warn_once(dev, "use .auto_selectable_formats on each corresponding CPU/Codec driver");
-	}
 
 	graph_util_parse_link_direction(lnk,		&playback_only, &capture_only);
 	graph_util_parse_link_direction(ports_cpu,	&playback_only, &capture_only);
-- 
2.51.2


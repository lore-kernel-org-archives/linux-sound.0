Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F13FBA7
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 02:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770259512; cv=none; b=onIZOSSbn/jfaH0UL/gqCGVguPWLMsSMY/2CWKd5oJNScqffZ0uLjztnUsjlFx/gD6unBhnR7CV+qVt/GheObi3cZgqwIIPrYkSICING5826ivaFQIBIdYKs4LdWH/4sKN7CIf3evWxkNHhzQcmnPE9WxXFis/rgkTVYgqwh9MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770259512; c=relaxed/simple;
	bh=8wKLZx3nrpnSwCiIn2kJMTnnyGQMMNHXvKsQjh0lVT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CQP5AI87VFO/OB7f6wVcbxLvXESUTKAB9687lOtLnfejlgdTjBNCxNQe8FDHW8q1xzMqnkjHmpSSPnnIH+wvpu711pOI/6CE4vSVYxLZp2zhf6ukxPeHnsTJlLsYskUD0FtWVVJTH11yTsQCnrkxYEnPgAMgG2vZKUfjcMp8usw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hX8sBTCi; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hX8sBTCi"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-649b31e9010so529662d50.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Feb 2026 18:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770259511; x=1770864311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5hb/rXNSzieM+lpTlhbrfC0i2zNgOwIaIEKrgtsJhnM=;
        b=hX8sBTCiNj4jXsvrPkCjqVhi3tp8SDtMLFv95FEQOAXZOUYNux2Q4jIFvv7cfTzNb8
         HdMFRiy227qCkvsM3/VtwDHfAeJ944LNS+U22zOQw0UKgIGje2MNFl7L2tfMLx9s12Gc
         WakiQnEz+YNGZJBF5Zx0QPlVMviqNVFO8bZ4XxdYqToSYC499VmOI2RjqmphoenYxP/a
         34dSAVJ45SNFrv9J9+X4lYxTZJg0It5uaF1keUrhJNNCD5XdXpJhGmX261tNEEgH5u+3
         o9vPD3lOD6s8nR+uzUHFZuHpmekfOZMtEEGYNGd/kcYq5fWBgCmmblxnxDx2kZPCc4C8
         iRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770259511; x=1770864311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hb/rXNSzieM+lpTlhbrfC0i2zNgOwIaIEKrgtsJhnM=;
        b=sBOhJSzAnPQZr2hyj8LONUY6PHYisJ7+W19lr4/fehOr8WoPIqZ8IqKn2c0xlE5fY6
         QuEeG1Aj//goePkS+Hs1COxc22rluaZqJTQvR3dQ6fZlFfoDmm6fu3qvJjcWfrnXTo4b
         zgVVI4PcvdXzcr9K00NyBBMq8ip3Mf/cUSekTm7tHXwqbKtRb10lc8Ghuh+gkw23OhcK
         4RpR0O33J35L/FKWa8C7QTxFUryOv6wWZ/HkyUmd+toJr2SXghXAc+cyK4Ay4Lu0WDHy
         PGxHc79yOqNwYyfhhmrw7Q0/Eu665kiAhlnLBR577vgil5F/9Jk+a3A/jWUcDKEnkPQe
         BvsA==
X-Gm-Message-State: AOJu0YwnT77R/LEbUvoUlc8P4z0igXmGXa/eifBTHNPke4m1p/XWopZg
	cTpbEhRBWhVU1kFBZceBzyxBbInL/kcM4waKw4RNQmDiGItyaIdwlxPSzvao3Q==
X-Gm-Gg: AZuq6aJL0uAi2mQtmdGSwrCfpvgY7IOkJYGpkIw9muEZyhiOLZsXoQakjPHt+bvd7RI
	MXojYlZ+ox6se7yq+WByB0kyCCWJsHbi1mIvcB9lGtArse9Bz3nPFdNF3/ezY5f97VgxNdDf01m
	PUeV/exzBCqggSZIWevBEl2xuuxfa4y7UYhOivsGZtlpKDcY4UU9BIz4ppDqiuUBBpGwkomqsbX
	DZwNCd6IXVheDHgpb0l1J3OAek6G+zPXJfSbNmP5uDL7OqNwVTV8BNx5URn63xF+A3M74aNthgo
	avgF0Cuz9coOVxy4a/rjGhM0HzMUosrTwXtDf3MKCmJuMaQYUq6g7JW6r5L817AorNwodQ+q5qj
	6LZ6p2Mqw+lOvGweJxHs9Cz0xlp9IoQxevY3jz5qsaIZbICwAPN6lHCnzP2gfMLL4phzKmQKgmS
	ChKBjuTBw=
X-Received: by 2002:a53:de0c:0:b0:649:c2a5:c711 with SMTP id 956f58d0204a3-649db48fd73mr3506600d50.51.1770259510882;
        Wed, 04 Feb 2026 18:45:10 -0800 (PST)
Received: from laptop ([2804:14c:87b0:929c:6949:276c:ed52:c289])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649dc5ea03bsm4094347d50.24.2026.02.04.18.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 18:45:10 -0800 (PST)
From: Breno Baptista <brenomb07@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Breno Baptista <brenomb07@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Enable headset mic for Acer Nitro 5
Date: Wed,  4 Feb 2026 23:43:41 -0300
Message-ID: <20260205024341.26694-1-brenomb07@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add quirk to support microphone input through headphone jack on Acer Nitro 5 AN515-57 (ALC295).

Signed-off-by: Breno Baptista <brenomb07@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 0a0496deb..b66965a52 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6353,6 +6353,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1430, "Acer TravelMate B311R-31", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1466, "Acer Aspire A515-56", ALC255_FIXUP_ACER_HEADPHONE_AND_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1534, "Acer Predator PH315-54", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1025, 0x1539, "Acer Nitro 5 AN515-57", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
-- 
2.52.0


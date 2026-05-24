Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10AB23D2A1
	for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 18:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779648824; cv=none; b=dGqji/mOcmwisRaaL9CmOts9a6d7GdpMPflpp7twGQmGBpGY5qLkgECn9/Df5LWu+ogPuUTY+9jzFneYX028yejWuKh11N2OFk49kODImtXjBfgqy/nJxHjqFqAVKpJZUpRP9bBtLe6HPn4maUvpOCvXaxcYHXisz8WgeJ7WGRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779648824; c=relaxed/simple;
	bh=7Cq0PjWo+Wv8a4i789kKLt3tsU22ixfeLqbH4nR86gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g5vayY1CwH8aLbAfHZPj+ZSURouzZ5jrcx7J17mLzridH/gRpBA/6YW8GNPKUVAG1/4NhBhsfcWjPSNUPIOuPRVNvEaQAW5QXqhEkkywG4yLKyd2jyC0eAxVu0pLCOJbw8wQJb60F6WoZAya94gewCi9/k8NsLaM1ufC2039MYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pf45HVPD; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pf45HVPD"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f7020a928eso12976194eec.1
        for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 11:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779648821; x=1780253621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YN1A2w6jErYwVnxWZCT9QuhOtHtaKN6SLjD4SIr8vk8=;
        b=Pf45HVPDE+MWttSAoQz4wglHKFqAykEHoBbayFuAxxAOS1s5yoiBm+PN+R1m68Tiic
         K9hcuPmnLX02OrrScXRhYJVVJhBWrDD65MiSh+EqFQr4cba5qx5Ls9oVna2n4cHdOlDN
         hhZbOi5EWpI0GzzsF2yz5dHi08bzEk/LN0NUtzM8+EUFR8te/AKZMNUSwNr13QLlGJNt
         Gq9wEfrYwYAXA2KXlz1zywaXYss6R1yjhMVUUg3rkpqi83dAxRwYsth3kOpZiD3EsWBR
         F4gC5Yhpdp3VXYBNqbD98l2wG+rEem5uysGTUGXAe6tMn0wpfQ6hMvQNqshGUh9/G4cA
         J8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779648821; x=1780253621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN1A2w6jErYwVnxWZCT9QuhOtHtaKN6SLjD4SIr8vk8=;
        b=c1AwaFf1OGGUM+mWew54LfKYkYQcUJQD5oekB7BN6PsXr1hwZmLJKLFxKdKcptqeyD
         OOZAD85zXtLWRDTH1Ylv2u6DVY9MO3YPMunoYIyHvnYrwU7Ckvzzfc2bkNtd2sZ0ePwf
         keqWCncjIIvMoeUoHdUJqocfN6Gew3MXm6ApbiMTzGWXTC5MPNIx3/dALo5FyDfEkBe9
         QasmJgbEEQWSzq73sgn65olDn0nZuIMv+ftZPxpbIuYJi2aM+BevJtFz+Fd+UYgQRWVu
         BceMskSj6gTFpCPwpUhz/93xGXONL7yNOikIbw24sIlAm2ziKWlZe+jNsFbAQU+/odKX
         sVwg==
X-Forwarded-Encrypted: i=1; AFNElJ/JivaKL7sK4HG8IbJVrnWtFGJGMvkgp2N0l6cfMPoWJHMk/Yxfni1cjuLUhDLN1+9fWrPJcjnhwPyycg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywny5vC5TqBiid2N5y3wAE6x6rtMcD03Qgjr/gnCNVlBFr444ZT
	HhDCi76a4OG3H1WTjYlNEZNRKvB2OgyGVXvYfxxESNGa5sFoH5zVgDDwCa58XJg8
X-Gm-Gg: Acq92OFgEqVRBZ2xR1NsanPIROItOgrqhf9ED3IA6vYnqp/xfMbvJijdqJ1qhmcQYLg
	ENRqaKP76giRSwplxXGb2gJ+ugSmTPgw89wLDs+OS/1DZdokVmVfiW1ka8vaETE11SSjKSr7TAF
	7KjS4kRXR2D8jeO/JBS+Ak8qeMP8QWwbcwIhyTOpZetyo2gA3SEeVy96NU82vV6XPLE2ohoJCs0
	PL9s92dClb/rs9bqhc8GR/vW/1FHMz/xwqahuhzGQzYs/iAcQty/Ws+Ja3ZElvBBc1vaqWoD8nB
	5JOgwc5nNieVYKCmJWsZPQGg4gOlJm5gwMcoA9nbrbWuwCNex5NsHuNcJDSzDGfZ9nC623GiYRR
	/HOu3LcO97/8obVIcmXlFyRAdX6y2mZJF+XNunR9yL7V8jccoVOkPaLhaVaffNkITMbWWais3YI
	lFjUGT/0qqGk8hkBEgn6HcxGFEiQP0ga3mWf0hhGLABII=
X-Received: by 2002:a05:7301:e2b:b0:2c7:3a7:c792 with SMTP id 5a478bee46e88-30449184590mr5949846eec.20.1779648820786;
        Sun, 24 May 2026 11:53:40 -0700 (PDT)
Received: from localhost.localdomain ([187.17.229.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef470dsm6130530eec.4.2026.05.24.11.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 11:53:40 -0700 (PDT)
From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	zhangheng@kylinos.cn,
	sbinding@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	edson.drosdeck@gmail.com
Subject: [PATCH] ALSA: hda/realtek: Limit mic boost on Positivo DN140
Date: Sun, 24 May 2026 15:53:24 -0300
Message-ID: <20260524185324.28959-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal mic boost on the Positivo DN140 is too high.
Fix this by applying the ALC269_FIXUP_LIMIT_INT_MIC_BOOST fixup to the machine
to limit the gain.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f180d6a72021..acf046ee10d2 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7845,6 +7845,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1e39, 0xca14, "MEDION NM14LNL", ALC233_FIXUP_MEDION_MTL_SPK),
 	SND_PCI_QUIRK(0x1e50, 0x7007, "Positivo DN50E", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x1e50, 0x7038, "Positivo DN140", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1ee7, 0x2078, "HONOR BRB-X M1010", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1ee7, 0x2081, "HONOR MRB-XXX M1020", ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO),
 	SND_PCI_QUIRK(0x1f4c, 0xe001, "Minisforum V3 (SE)", ALC245_FIXUP_BASS_HP_DAC),
-- 
2.47.3


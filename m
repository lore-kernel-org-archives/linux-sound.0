Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7209B30EF91
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662035; cv=none; b=TZTcFiYjiXPUYLdBNJh6UiIQqF9xzRZRct64pKwgcx96j3liQA5L6bdt/k3qt0dfLF10FMulL7yRxoX6IYDElPW2KgmsO6CQRQAwijz0gIGMbF/Ml546wjKiALL3fZ4pHEA8h0FP9avEXOKKBc/mP2xtXxR1EmmUYJXq2n+a/9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662035; c=relaxed/simple;
	bh=TMiHEe92SuAh6fgG6WujL79mYk0H4L6Yn425oPvB8uY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwGe4OHIUC8etQmCDB4GUndredKhFqSXO3s+ZXGlvddXx3ikMHAw76Tr/or6Y7iRCJCSKJMkS4Nm88vyoRhS5kXj7OLmvHvZhmLORSPGdjLckuXFW6Nnnc3PzVbHklPvGQ9w1KxXeKxXiRVA1okOGRFdH6pRrQ+7ouv/r+RWVHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a01nWBZf; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a01nWBZf"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84231305a80so982863b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 05:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662034; x=1781266834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsRhVTKGsiM8JmWvqFHRoyOy+2lKAlrjAXLVyytCHCs=;
        b=a01nWBZf9sF1KHEwdo7dfm/S8kiyMa/XTflm+byQ84TeWOK6N0cgwr1tx1521QuTPI
         icP1n8pRwfmaFMMZu7I3tdjKay01nMHQyOvkxjSOrUTALW2GYv64PyukucF8NK7E2LDN
         gy+FGcTbxCScV5HMvz+8cQ556v7JS4iukL1AwRjN/sB6pHD/W3zSFOMfjt5mrf7nT33Y
         Ic49vG9yBMiRdHDOR1hM/L7Zn4LKEMmHfkhDi/V3HNFDAzrghFpUr7RfGDf5v+rLllLa
         gvi05EpOx6YkTpdle16eb5WxqscvSxsnEN0W9kXMSO6/t81ZAUiiO5/Hf+IF8Pd0cuQd
         AkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662034; x=1781266834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KsRhVTKGsiM8JmWvqFHRoyOy+2lKAlrjAXLVyytCHCs=;
        b=dwqDO6Wp85RGPa9mYh8lmFvcQx2+9XG4y2Zetro6bQUiiR9rYwmO3Wxx5ARfPvfb66
         DmFB9mckiwsgDC6wzmzVnevyWEa4qt/N84uvwpMBX1JVdRu7FjaDwM4kO+lkjlnRDVw2
         9hnBUyULu68w/HKrbBWwmfvvhWsKqbH/H9XYBjvKCEGWiS4Mo4X8hZjTzUnip4+cCL+C
         905U6c/FEMCaa84tQHLBprOrpaysIndR2sXjANp2do8InZsM3AkHhKvC+xkZWkXjHbdi
         XJ0WOihM/dpCM4pZOuW1Oks5m5zTfVIcszlVsNljfiyGP5unJDJZEndKKtux+aGLmrXh
         395A==
X-Forwarded-Encrypted: i=1; AFNElJ+FbClLwu4UBIS6Yj4meHL9NTyECBUUMhxlVEyABoiVciLrIezsKuZCht95bDq3Q0NHlHczEBx82NWtwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeUROj0Jiih17M0IaUdvK/m+F0/t1wrCL8XG81xw+m0JUUjn/L
	sOvB34MvT/mJ/iw7CtRSlGSph3iaCzskFG2F4MLZX9G6l3j0qFzaKaHd
X-Gm-Gg: Acq92OEa6qz1thpQAX/XFRrd9vmJWagI4djPZAOgP16Y30GiDPYD4lsTWjjIRnUpPTQ
	rRNvll7FtPiA8P36yE1ypVJ0U4cinIKb841BZZVEzq/HNEDoP3sJm26byRI4HYsik+jKO6ndQ2s
	UM91LoT/KXRkgr9LJMX/2Z+h+aj6sU2UsxBBdhCIoDKuSW2U1NaMxODBmxirDOMKXuy03NRozRv
	ooaLVR7w0cQs6u7DIWay+PFQpt09OVIhOBrzBI/ZS+xPwpkkZPC2NiO+TJYQ7o7RqStEQI98yNr
	DrIK2PB96k3DXMCJAnla7Y70d662hAj9c6SXAxNHgiOykYCsbaulFdoJTzb2u7TmppU7WKv5XdB
	6gvV1koM6bWDlszNqv6GeK6PLUJUaR7cxUfZ+W62/3Um5AFoXeqPV3sBrpDIuBmYCuqdHaTB21Z
	aghFPL9q/avrLhgk1AEfQOYP+/Vwl7z/z8oofwis1hRgqPwIBpZHqyLvP0RIIAd/teGtdX
X-Received: by 2002:a05:6a00:ab83:b0:842:2280:538f with SMTP id d2e1a72fcca58-842b0e74b30mr3311643b3a.16.1780662033809;
        Fri, 05 Jun 2026 05:20:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 04/10] ASoC: renesas: fsi: Move fsi_stream_is_working()
Date: Fri,  5 Jun 2026 19:19:48 +0700
Message-ID: <20260605121955.105661-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_stream_is_working() before fsi_count_fifo_err().
This prepares for a subsequent patch that needs to check stream status
when handling in-flight IRQ handlers. No functional changwqes intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 94ab2e490810..429c3c9b6ede 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -442,6 +442,16 @@ static int fsi_sample2frame(struct fsi_priv *fsi, int samples)
 	return samples / fsi->chan_num;
 }
 
+static int fsi_stream_is_working(struct fsi_priv *fsi,
+				 struct fsi_stream *io)
+{
+	struct fsi_master *master = fsi_get_master(fsi);
+
+	guard(spinlock_irqsave)(&master->lock);
+
+	return !!(io->substream && io->substream->runtime);
+}
+
 static int fsi_get_current_fifo_samples(struct fsi_priv *fsi,
 					struct fsi_stream *io)
 {
@@ -488,16 +498,6 @@ static inline struct fsi_stream *fsi_stream_get(struct fsi_priv *fsi,
 	return fsi_is_play(substream) ? &fsi->playback : &fsi->capture;
 }
 
-static int fsi_stream_is_working(struct fsi_priv *fsi,
-				 struct fsi_stream *io)
-{
-	struct fsi_master *master = fsi_get_master(fsi);
-
-	guard(spinlock_irqsave)(&master->lock);
-
-	return !!(io->substream && io->substream->runtime);
-}
-
 static struct fsi_priv *fsi_stream_to_priv(struct fsi_stream *io)
 {
 	return io->priv;
-- 
2.43.0


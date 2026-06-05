Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141584DBD84
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662040; cv=none; b=IcwUpOY8CYf8RLTsMQSZJwhLtuyVRxEP0fTjAitN+iVOuxQEZgfz4bcn4s+yxqMLbfHBRdB1P5PhVCbV8fujZuREZgLcTzdVsp1EGthufYkTZd8WleE/yCmXirbiJZMHrCeshFiWPlb3yAOOSbOkc5wZBDyUygcs0G/flUVV2JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662040; c=relaxed/simple;
	bh=uUylIx3XFV4TA4RmfYqmD8Wd0T0GOAThqW1V8bTR8aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlygxJTDbvRsmtT69/eLq1UrzWkz8ger7ca36HhF8+ROnZfEGWtdGCKFllV1AqbSTao3ndrBMzg3dcEivQM+CzOJF6c2SAPgDFRv1SKpoAeSHiyqV2PlRvD27Op7yO4YV9dif9/Ws+Ke2s8a7Fn53U3BqaVso4oO18C6F57pL/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kw7h9mKp; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kw7h9mKp"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so1274823b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 05:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662038; x=1781266838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFsk3bK57pNH+uGXIvFwcPQqhl/Aln1/JKtxJWK3Jkw=;
        b=Kw7h9mKpfakWEmCXO/ZHF1BzGFn+G12svbyxI8WaWsvSDbNitxPe4ep9qudctoHudr
         17t6izyotpvUtx3Ss1RcbYSZqld3PXzpOwx9jYz0bdZPogDCEL0jafX6ePsqaDs1QngS
         BeR717OvRAGPDxv6+yJxZSDGIYX3g27JcO0vLnkadjNz+Ow/TO30sDBwz+IAtL8hEl1/
         ix3iTuyacKuUvPNnUlaYEfNybvAg0Og19DiJozLqsLUdFQ/w+szQTtsR6EjGRbBqftBp
         EemHozwCorQ+oA/0Ffbe1loXSOvubpMEg6LxHrPbM1EENe0FKUSTd11C81jkZzST30qW
         1ERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662038; x=1781266838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JFsk3bK57pNH+uGXIvFwcPQqhl/Aln1/JKtxJWK3Jkw=;
        b=Pzh9a52b1xfJoJgRixmLldhMtShxn5slj3j1y3sqoFhJo7Z8bWyKgwxKWgkgjHKRco
         gfsKCrJHgrwI1OAtJRcD6Mk2E6B2e4gqEvXu0KZhMSzs1VAcQVeWf4T1H9g1QpVz5ysr
         SdKoHtasnkMikYKtYOA8zEkiuLK5O2JLlwcedQGdJ4Vg5yxgEhnwKrH9RKeHAKCO6pPm
         Ai4U/YX1mcnmnthxR5UBxTCkBb6yKivKht0px2nOhCR+8RpM1ykg5rj0w2hpytuVFxY4
         UaH20sHLIS2kTYZ45NtcRO7J0eunYcYjeO4XkvKqLWddpe3boPz447L2klnrnEK5rRIc
         ZCMw==
X-Forwarded-Encrypted: i=1; AFNElJ+M2SdrSZD0sNi/buBKJ6BWwPpRaQqnowPIhB8wUF1IpkRXna5yfHFFfAAwNGFd2YqfVtL3FM5t5NaoyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy559+2y3OZ3kNPdU5h+I16bIkKcVGtyptkvFwvLlehYfBD/4Q3
	WLwHEmI7ioHHjWMPvAKTpWUNUX0zFm2KHR4jhWej2Uphjpytm2MZfY35
X-Gm-Gg: Acq92OGpSGeJpdyVIt0/k8NfxkJew6QIIizq95fTIRFN0lY3UJcM483TBvkNOqPMqmj
	G6KMgVd4MIJkyLM9fFECX1lvR1xHOCrfw4e6m1cOwU/YoF/kNmwaFXx0H6TkJMXjGbrfaPtSrqP
	d+MCQubQ8Mk3Xhq6Xf2dYVOcxQDOnxT1xGjW/fo8GIEvrTD1l5DGM8hYLT+b4jXSUkiZVeHA62Q
	GHlxEaObrPWH+Bg7xbQGkIV/NELl/xVnygqNturpqxg8pafsyKbl+IqtFkxhy9V9ZPlb2aO6LSL
	xetZu3F7Tz+TDFip+Fzcm8hkJlpTAxf0zcbXeuxd9W70pbdPSsFVNagc1NunaeLSqqC8yXhdujg
	Kvz6aRO41CCEP5GU1ieN2RoTuX+zXGJWCI/cp0S7l9zZs9wHgnW2cmMwLRA8Cd/OPfrj3A3f1S9
	fj2AMAqpWYq0lQAc1WdZ3rb7VcdV7OAXANd4ccNlWuOicq0HZKVKC4yFnI1W4wTIAmeNXR
X-Received: by 2002:a05:6a00:1d84:b0:837:db4e:a35d with SMTP id d2e1a72fcca58-842b0e3da27mr3436451b3a.23.1780662038529;
        Fri, 05 Jun 2026 05:20:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:38 -0700 (PDT)
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
Subject: [PATCH v4 05/10] ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown
Date: Fri,  5 Jun 2026 19:19:49 +0700
Message-ID: <20260605121955.105661-6-phucduc.bui@gmail.com>
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

In-flight IRQs may still be running when the SPU clock is disabled,
leading to register access after shutdown and causing system hangs.

Fix this to use fsi_stream_is_working() when handling in-flight IRQ
handlers. If no streams are active, the handler now returns immediately
to prevent hardware access.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - use fsi_stream_is_working instead of running_streams.

 sound/soc/renesas/fsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 429c3c9b6ede..0f350bddeb1d 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -470,6 +470,10 @@ static int fsi_get_current_fifo_samples(struct fsi_priv *fsi,
 
 static void fsi_count_fifo_err(struct fsi_priv *fsi)
 {
+	if (!fsi_stream_is_working(fsi, &fsi->playback) &&
+	    !fsi_stream_is_working(fsi, &fsi->capture))
+		return;
+
 	u32 ostatus = fsi_reg_read(fsi, DOFF_ST);
 	u32 istatus = fsi_reg_read(fsi, DIFF_ST);
 
@@ -681,6 +685,10 @@ static void fsi_irq_clear_status(struct fsi_priv *fsi)
 	u32 data = 0;
 	struct fsi_master *master = fsi_get_master(fsi);
 
+	if (!fsi_stream_is_working(fsi, &fsi->playback) &&
+	    !fsi_stream_is_working(fsi, &fsi->capture))
+		return;
+
 	data |= AB_IO(1, fsi_get_port_shift(fsi, &fsi->playback));
 	data |= AB_IO(1, fsi_get_port_shift(fsi, &fsi->capture));
 
-- 
2.43.0


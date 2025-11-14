Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490B32F90C5
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107144; cv=none; b=VN9aeVbEYIh4qlbYDK+X/SPQem+0rV0K3RHLxbnkF8iSj9zfTGaoyTbOGXE1I5fdhSn64AjLGPW4HCjj53vlbnKI2LCZOdpg5xIoFtFCMF7rLIEVJT013Jc+fOWdzqdj/+IogXfO0ocjetpWmBjanYcjqedul4BSt/t/OdGMTks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107144; c=relaxed/simple;
	bh=1oB6ejVOQiSslI+YY6o6RVr+qL2UsPs4X0pdDi9q1yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DlgkEgkmQtvtlxnBKtb48a8ydC76pqnT4WOkFt6Ay+z9cNg3rKCHQqDiq6VIKuSCqOVRP5VSi2E52Ntr7JDPdnQoO/9UlaG++2n3J3MPKIkb+BUTThZ2FHEbh5A2IUXbK7wNVfMHzC6cGk752nPl/Ix6lHWds0fGZuLofp4zqx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CE2vRygB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CE2vRygB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477563e28a3so10902665e9.1
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 23:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763107140; x=1763711940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CmbAWmpu4IIfMH0eqanYAoW/4AiPlJTrOkq2LeJ2C4=;
        b=CE2vRygB/KzLgAHaR5Om/wkWOXzXtXEumQqgsZMz3bhAp07NYGidekzChouQuihi1a
         FH9UCaJOaIX0fqW9aopaep6VubefngAuc9UeyT/24Pk26uMLwnsuVl78UqBCPo/nTNLN
         aUCMXxS0HI+Bimm0F7El6qnyUFyyphaBu6nXxZskAnDbYhUQcYTm071a8pQh+Nd2IHRG
         UbBC05Amk47qXSg6L395P7Sn5OK25FueXZa7D80XpzZb5hvBvjcSfZ3N0CZ+z76oA1EJ
         oSONagvt/9dYudfiVKu78m1lZOuQo9PPvLQYE2fITGLjNtzQEAhrplwpVWnmGO89Ifw2
         vKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763107140; x=1763711940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3CmbAWmpu4IIfMH0eqanYAoW/4AiPlJTrOkq2LeJ2C4=;
        b=JjoPpuDRj0uj3/KAQywTbGXGIErzjAKTPV8qSgyWVxebnRgLKwOdLqMols3DkhMvX+
         GfgEP4w1VJSN1rpJT39yQ9Pz+JdrV4nCQHM3E4wrg1V/Gzzw6lMcY3WjKyVnSwgqDpIs
         7eMTWwsQFzWJHOhFlvlm+6a7ojOAmVnE/xhboYCts+Rsaifl3znn5iqfhfI5nfw1ntuQ
         MFWnWN2blW53ZzCzYKJT410ldUbJmcNkJf7RofAphKlJdy/ZoZJw0rLSN35WLbKaFdYG
         poxBHTw8636Lx49W34Rw2Qub7X56nMmLlCpIpxB963dVQCcNxndq+FEzs+RLQ/JjMYdB
         zMhQ==
X-Gm-Message-State: AOJu0YzE3cYyHijN5a5f4KU4FkJR0MEc2ButNrOlOACYMzmi78yZPNmq
	xXNMxisu/SGWonOoThdmmzWW31dnumPj+PcUFvucG7/FDDOPQhXPGUoQ
X-Gm-Gg: ASbGncububj8pppgKAU6nc6L1iRFFKa8l6Zz1+UVi15ZoamIWFESpuaM19KZF/ABttU
	jO+pNzQeiI8NB2QWQMduTxotcyJB+kgPPsSN+hwIucTRTKrKGVdeRAAielzgQeRClp23fRi3zx0
	Auw41iRFe6bisZdSuguvsSZ1hqLA/tt3KYd1wfh3Q2f58M/OxE5G6c11LjKBsgXWC+TrAC0Iggp
	lUQVyxCXgzv0nKq3e4auZ8Ut76xQA313h5fgu1TwE0beXLzffGCS9LuwN9iGAdNbsvtybFUDCQr
	zBQ7Z8uT8tgqgIJA46jx/2EMglNw188gHeSNoAB7M16c1kxwcHeB+z52nwqutU9qiI+o5qBR3E/
	jXXs8EO5rbSbAp56UAbBbZpfsgBpwTRwJg7JuO3GdafS2OU9h7BbybPRdB1PnQvgPHqo6fZQHX1
	k26zNUxCa/1NLfbAEHI7e37n3c1oXeDPoDQcw56TX441hp26Pio344AwqAdAHTXz2kobRlCcEV9
	ZV/K8CSYV6kI5tH
X-Google-Smtp-Source: AGHT+IHyUrHUtSoN6qunQKG/oS0uHt3Xb7PwuZ/jNdLTEYwTgxmXjTTrQls0Yrm3bKue/k1AuP95Uw==
X-Received: by 2002:a05:600c:3586:b0:477:7d94:9cf0 with SMTP id 5b1f17b1804b1-4778fdb36d5mr21891195e9.12.1763107140419;
        Thu, 13 Nov 2025 23:59:00 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c847bbasm76347895e9.1.2025.11.13.23.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:59:00 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 3/5] ASoC: renesas: rz-ssi: Move DMA configuration
Date: Fri, 14 Nov 2025 07:58:50 +0000
Message-ID: <20251114075856.4751-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
References: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move DMA configuration from rz_ssi_dma_request() to rz_ssi_dai_trigger()
for supporting sample widths higher than 16.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 sound/soc/renesas/rz-ssi.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 21f7d7c7c009..55aefff8857d 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -774,14 +774,6 @@ static int rz_ssi_dma_request(struct rz_ssi_priv *ssi, struct device *dev)
 	if (!rz_ssi_is_dma_enabled(ssi))
 		goto no_dma;
 
-	if (ssi->playback.dma_ch &&
-	    (rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch, true) < 0))
-		goto no_dma;
-
-	if (ssi->capture.dma_ch &&
-	    (rz_ssi_dma_slave_config(ssi, ssi->capture.dma_ch, false) < 0))
-		goto no_dma;
-
 	return 0;
 
 no_dma:
@@ -829,24 +821,27 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (cmd == SNDRV_PCM_TRIGGER_START)
 			rz_ssi_stream_init(strm, substream);
 
-		if (ssi->dma_rt) {
-			bool is_playback;
+		if (rz_ssi_is_dma_enabled(ssi)) {
+			bool is_playback = rz_ssi_stream_is_play(substream);
+
+			if (ssi->dma_rt)
+				ret = rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch,
+							      is_playback);
+			else
+				ret = rz_ssi_dma_slave_config(ssi, strm->dma_ch,
+							      is_playback);
 
-			is_playback = rz_ssi_stream_is_play(substream);
-			ret = rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch,
-						      is_playback);
 			/* Fallback to pio */
 			if (ret < 0) {
 				ssi->playback.transfer = rz_ssi_pio_send;
 				ssi->capture.transfer = rz_ssi_pio_recv;
 				rz_ssi_release_dma_channels(ssi);
+			} else {
+				/* For DMA, queue up multiple DMA descriptors */
+				num_transfer = 4;
 			}
 		}
 
-		/* For DMA, queue up multiple DMA descriptors */
-		if (rz_ssi_is_dma_enabled(ssi))
-			num_transfer = 4;
-
 		for (i = 0; i < num_transfer; i++) {
 			ret = strm->transfer(ssi, strm);
 			if (ret)
-- 
2.43.0


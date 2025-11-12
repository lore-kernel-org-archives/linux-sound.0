Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE7833A036
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962092; cv=none; b=f9/z1K37GZNgQCSbGCLSJbl6ySEvhP7If1BvLYF3wlh8rH1W26mu7Bk7lp0HPB7FjVrrFDEn/sgNbf13gNjxhSEP0iOne+Rul3vNqyDuaXsLn0Cx5HKGlm1mrNUCvHbQ4PfCIl8C6L/rglJv5WSgqG3u8ruhfgni++M8Fz7sKzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962092; c=relaxed/simple;
	bh=jj3vTLvr3WCiPV6i5aH1MKkIW9M01IOgqR9TLzyysKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7dP+aAtDT8zyYKlfzeXNGAt8iotnDv9UtTlMHhkbiDjSLvEn4NGlQdqJIiBJ2EvZUX672lP6SA1Or4usq+yXCacF2as3vS92Iuv30BWgJcJXEWWwV4LhUQTOQaMsV+ft76aQTXHCzUdFFc4xMu+KGcLyqSmW8sX2jQLg5RCDlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoqNmsBJ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoqNmsBJ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b71397df721so157406966b.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 07:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762962089; x=1763566889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bj6ZfkS77Hkj1ggagRTkBVhoyJmLo5G2pZsYVl8EfqA=;
        b=GoqNmsBJs9BHAEJbu7WiriBsFJtr/knbD18xQE8CV6JOcATJj8JmtxlFjbrtbe2chT
         LKT3E0OIP1X0TK+bekdvYQ9z51nd0Z07KVKf2/DblfZwAMIzdP/t5tZ4LI1q29HrXgMI
         fEtvCtH7I1vubc3QBmREpM9FRCWiiO8xGBnC+3fJIGWkDV2H6/MuPwnBIj8YPcYuiQXB
         MFDTrLUDLdW1+yDnz/fx8WEvhIpMuuTnhU4Uxf6GNsYAWXoj3nfWjPHsr1yJX5s5/ejD
         /IcN3L7j8MRTYcft++0pFfqu7TOckTlPD0gB3aH2HPMAz5otQclnOPX8vrvvNgCWurKB
         thdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962089; x=1763566889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bj6ZfkS77Hkj1ggagRTkBVhoyJmLo5G2pZsYVl8EfqA=;
        b=u5zVXEPpuKkulmoZs3vEUWWDifQRMizzqa4MrX1b+nLcOpRy1gb53V6KKz4/i0mKOE
         bTmV+E12Jlo8XKp7GGIQ4DP6bplAhzvAWGv3St1Wme1G04tlgarcAIEeP7/3KbqgYqo/
         i8MUc5nu+Zc06aUbt437f2FW5CgER3XpWdMB33hr5+2C1DuzGvPYj8p2Q4NazbWtjeOu
         3b14xl52UREdZo+hSsgd1sbh0vov8RhjpulDvA1t6rmedqRwq/QF6X5FonsnH7KuHxkj
         qBpmEc+vXczp8V67OYY1+95z94xArQnVkaotDswB+JFnY2Q/CKd52mVBxmRants+PwIJ
         jlFQ==
X-Gm-Message-State: AOJu0YxwK9Ir7CJN4v7G6TnL1b2JUMiH+gQG/qw/xvQWNDI4WYiW3hXM
	+lRenLxelLJeQry6fZWFvVnXFeX0DkA06As38aLX7ZxGzUUmcYIy3JWE
X-Gm-Gg: ASbGncukTMVkWMVmtJunL/7X5VMvyobz2tcey9ABarLRBhjNS/iYttS80F4l2yBmI0Z
	I6+anSq7oIZGs9+CwpTA7+Xg3jBUNHWVbHop5BjHfvh3Uxr30BaXYLgwk+zTprAx3nqkJhBpL2v
	aYZrSm7S6MN47LCrEqhxg9/zjkCTE5UrbfLB3Yz0iWt7vfpFZZ29dIWfHVYl5BZEIaP15clKGMB
	mdgrxB4cZKK1B5B/rTmr+fJq3v7BZUBSRpnwbGudpA1HkwmnP3tqshI2GcHX42us1CrzCW69PdW
	y5yXk22RYX+qxNSFikRwEA2tD9Pe0IxjWXxLxuJpL9fGP5n1VbaXAoIGp6VJnhvdGaoO4GcP1BX
	9cUUBe3OAzgrLmr0YJhqq65zpIbl0wptjhXqcW6xt1Zus0SHB8P3Apjh08E8L7zWDQxfrgIJ/0N
	THvKCOMZVrmzktPN09ZP/dxrlDOYlHrMDxQZkswCvAJ22hE75vrS4CgmyD7ECJNr91CWdjAdwTW
	k/xaA==
X-Google-Smtp-Source: AGHT+IGkJu4gFSEW3zfxLURJ8AyVV5KilcDzFNMu+vkSrN7cqdVzG32uksgUmJAcnsaH+ofD5sZrMw==
X-Received: by 2002:a17:907:8687:b0:b70:ee00:a465 with SMTP id a640c23a62f3a-b7331abf76dmr399894066b.53.1762962088563;
        Wed, 12 Nov 2025 07:41:28 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d456sm1670023566b.39.2025.11.12.07.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:41:28 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 5/7] ASoC: renesas: rz-ssi: Move DMA configuration
Date: Wed, 12 Nov 2025 15:41:06 +0000
Message-ID: <20251112154115.1048298-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
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
 sound/soc/renesas/rz-ssi.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 5dc510cf66e1..839934e4b76a 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -778,14 +778,6 @@ static int rz_ssi_dma_request(struct rz_ssi_priv *ssi, struct device *dev)
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
@@ -833,24 +825,27 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
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


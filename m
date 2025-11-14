Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AAE2FAC14
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107145; cv=none; b=D4UaJR788Nq3Aq9ktjm2scRMYZLB3vadptF4Vi77RhAadNxJmA0/ll683XWu9VxRnV5DSpgLl8x+wdYczNYZ22yS4oD60daCPm9EtF4s7rC4FL9CoQnPPt6RS1mMApRAZik7PLjF6l8PJl3yHmXcbJXRRdtXTADWtuC4EUiuv30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107145; c=relaxed/simple;
	bh=9qhHAfmSmgZdMYGPPdj9m4G0frUb8TVsMzQFMztnhwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rzplZzswrzeY3G54J3o+1EAMcLxXr2UZ/iJOSjZDuXgBHCmUdWfDCbT+jonU5Te1t9zqn30yT62bUG74ntaWR30STEV9emd4l9Z0DpvsCN2amFahyat5TRF1R2liqeFyHS38CbcSz0QD80Pm3+NxuPBkiy778jdpETKjR9QQDYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SF2G4tEs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SF2G4tEs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477775d3728so16758945e9.2
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 23:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763107142; x=1763711942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dno4fYyihe/RYznSluqpdOt6mZrIDZ0jrnHu7E3GcE0=;
        b=SF2G4tEsUoa56R8GeVecXqZEZuKlRHAQl6fCTN1RmAVNk5hsuRsEIJ5EQNHxFB/SDQ
         CTa/arSW/r54UFvF1sK3HKyUPRO+DjSZT20oRNSAixPCVKsQFdqtbrQPUOY6upk+JKqd
         HOX1wt2oNiFjEV2f3UgxcTITxubXL/xhqAkucIQTsaoiOPtlW/B4blat4BoYbdqEd8tY
         oPfmdTJYNpYpDfc525VUFi8Fl1dw78R0aRgAOd7NJoNQrJqMCPlj2UapI+oBfq5go09u
         cdMFAIzgSHlDb1oXgLbqKKhkZJzMFegLpuzUb4FUvGMiWd+EVBMp3yxE8h0/c4tJpVk9
         e25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763107142; x=1763711942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dno4fYyihe/RYznSluqpdOt6mZrIDZ0jrnHu7E3GcE0=;
        b=LG2BB/361acFArWlOHvoD5UorqBmUAWu6Ghs0zvaW+d5WH0ZTZXBfyeoswBKtTqyze
         2VcQkTjQHl3GAaS2skao0HDFAjLegdPyDm0ivG0ewQHdx1XKHpeTIMAQ0rej6ShD24KT
         7arQoXdWirK5UaukyHxyN8LLXfuoekway7Ph6mObL07VMNPPdrE3e4izxfb189WXgh0z
         QXdGPW8Pk33OjJMEI9MFTVe8tlGkNLHPY0BuF/S2vPIgXWnjQqZzqPFXwf8X+2enSBLH
         yi1jyhnKg1Zfw6yorsYp3hSMZN0pg010GMlQgeXSO3rtQPmwFpEDj7tVWyWd3RL2H71r
         08ZQ==
X-Gm-Message-State: AOJu0Yy/QNxG0TBusIpegGPzSZy/pa2dxZlCWmoKSciAfVF5PqE+oTF/
	FHBepzMWsy4815s4wKMb3i7oo0/oXgwi26+7hsYkPqBtRGWCmZX8wNSb
X-Gm-Gg: ASbGncs8iplqjp87mfRatAKKh5Mr0Cwr7TBCkDCSRNvxsXbtaYgjeI2HZlhO/GN8TCS
	YKe7sSnt8N6wQV1Z+Fgm1PNqeOnWgSlDqqVFnYRobpbAqkuEuHViZgvixXF3gEHH/IkxEaa9KoT
	Hpi1xg6tDW+AAxcZatqFfqby6xjGdUNuIQt+qhzBpRKCvBpBag9gioXhjA+bQSUohoDwfzUYELp
	7omdwwi/C4z+mpp734aFqKyJy2v9GnaEKbhFKLWRV5da+TJFPYa/jWh84DdtmGjXr55bal6bLL0
	wba3qbce6huU+3QROD2HO5LkXZITRz9ZT/DZU32HwKLz/46kQdub83d6UC/Im2Y2kr8mrsSbnOb
	470bCQbYctkIsU9yQD7A//p6C2lbWj3LnB1Cv+s0a6W7sl2y/mAHBDTmmsbByTw9fTiMfIFunh0
	68gGdAGbV5J8EIOqTVg7DtAbr7Xxw+Okckt82wDaM0RfBPsF4dEzZjnUQwE+Kg9/y4kdI9H8qSV
	wkN/54hFBLrmUsQ
X-Google-Smtp-Source: AGHT+IHSwU4mhyT8rLvuHxiA7sp7Ubk0n2kRWcbYTp78Fbo4XVCzyG5XlKzDo2VIzKhdrSQgxELv0w==
X-Received: by 2002:a05:600c:350d:b0:46e:32a5:bd8d with SMTP id 5b1f17b1804b1-4778fe553famr21894475e9.3.1763107141541;
        Thu, 13 Nov 2025 23:59:01 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c847bbasm76347895e9.1.2025.11.13.23.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:59:01 -0800 (PST)
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
Subject: [PATCH v2 5/5] ASoC: renesas: rz-ssi: Add support for 32 bits sample width
Date: Fri, 14 Nov 2025 07:58:52 +0000
Message-ID: <20251114075856.4751-6-biju.das.jz@bp.renesas.com>
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

Add support for 32 bits sample format width for RZ/G2L SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped checking 32-bit sample width in rz_ssi_dma_slave_config() as it
   is taken care by restructuring the test.
---
 sound/soc/renesas/rz-ssi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 3ec7c9875b43..5909778a6a70 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -75,7 +75,8 @@
 #define PREALLOC_BUFFER_MAX	(SZ_32K)
 
 #define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-48kHz */
-#define SSI_FMTS		(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
+#define SSI_FMTS		(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
+				 SNDRV_PCM_FMTBIT_S32_LE)
 #define SSI_CHAN_MIN		2
 #define SSI_CHAN_MAX		2
 #define SSI_FIFO_DEPTH		32
@@ -295,7 +296,7 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 	}
 
 	/*
-	 * DWL: Data Word Length = {16, 24} bits
+	 * DWL: Data Word Length = {16, 24, 32} bits
 	 * SWL: System Word Length = 32 bits
 	 */
 	ssicr |= SSICR_CKDV(clk_ckdv);
@@ -306,6 +307,9 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 	case 24:
 		ssicr |= SSICR_DWL(5) | SSICR_PDTA;
 		break;
+	case 32:
+		ssicr |= SSICR_DWL(6);
+		break;
 	default:
 		dev_err(ssi->dev, "Not support %u data width",
 			ssi->hw_params_cache.sample_width);
@@ -1016,7 +1020,7 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rate = params_rate(params);
 	int ret;
 
-	if (!(sample_bits == 16 || sample_bits == 24)) {
+	if (!(sample_bits == 16 || sample_bits == 24 || sample_bits == 32)) {
 		dev_err(ssi->dev, "Unsupported sample width: %d\n",
 			sample_bits);
 		return -EINVAL;
-- 
2.43.0


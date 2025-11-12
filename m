Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C746734027E
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962093; cv=none; b=kT+hTBOlCesf2e6QJVUt60E9WTnF9Tg4muJ0sUOxU4Ra2K3MKgU/z5u943jM42Gkv3eBBMWZh/CRgjsU9H/LzvEr7dTgMXdDungUHJEuByqkdA68m1Kii8egGRp/uF34LllQS5iwwezf0wgVwYh5/LyjZh6W4LNxER1y/ahoLZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962093; c=relaxed/simple;
	bh=/gCWFkRkzNo3eNZ+1Ba3S8C9u3xVpEOMTubl+OzGIfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S3yF4s365WnO6QLO1V7in8QnamU05hniX8r8OZn1wUzztoKwiYTfFFl0kBLP/8sdsxZ5xKLXDzS0wvdCVDm+UoF0hiC6LAVPD13LxurCwNJ/rDwTDlq3tBkByn2ItvDhBnoccxuPVswdKrlLHpD+0Gpgl228fDoSH6/uuIjWflw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEZ2yoqJ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEZ2yoqJ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b403bb7843eso214878766b.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 07:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762962090; x=1763566890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCyPsKER0IjULkacDBKIbqRbNblXHgLZ/kXCVC2BOJ4=;
        b=MEZ2yoqJTFa7AJjfFCJWjpZZhetUjT5f7QxqIM3kIi3hFMhkG9lhvE/+TexSmrQYBR
         +9bjIk6AQqWH/t/uXWB3mLZuhMYQShmGhUBUWv569q/kfrrajNSLohPdPv9HN3riXG+o
         Xy4HzHpUi2yPWxYwV0v+0eOgW5xYLLTI6jhSyJHy+w5MwuqjbDrUUDzuO69KdU+uSOTj
         dV0G7blkl9nmR/xx4ltizp99S2FmOvauHqdY5fmrl4ZOYlqWazukNFFjlPm3muijoNlw
         maZz7aah8EeNoPQPN2qCXp843vnq0lYH0aomfKfIbdj0qy2dzQ5HHfNoZ8OE5jf5OmpK
         /k4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962090; x=1763566890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TCyPsKER0IjULkacDBKIbqRbNblXHgLZ/kXCVC2BOJ4=;
        b=QrZD4Y/GqNqqWCe88a4eej9JljlR91IidiQGE/zXZQdvOr+e+ccvHt5YswXuvaL7Rr
         sU2NktdsPJcosiU+SWQKfQY1VvjWjDgN2dODzArT3hiQbKLUYeHxor83inK0B61qxsyd
         rSx/GEqBGSs8J90cwDS+HGcf4JUDKF6hP6bsiM6RWeEH6xWhyIxQ1Vx7OhR0CCpjipOZ
         ZvKl1RDXQWPonzpuIMB/vpD99/GgmHCweTvkMKsFNKOsnQCcH6y2/mK2RkwoZv0Zr4eD
         mexlkdRTYkros+R4hBE1WqRfTKXt78mgT7YjTM9nys/An5VLSgmM5wG04dlvcnlgvE9m
         BoCg==
X-Gm-Message-State: AOJu0Yyy6LLVJF4yg4XTh4j80G/H6y17RsAKv4cKyTpmYNDR3ZN4dk01
	MdJ2EzijqnXWfYj6ewJK2cUNo6hioUqBvKedlwkWYG+/9x4JJyizc9ck
X-Gm-Gg: ASbGncvtzOqcms6uPVJA8ESzSApC8JaaIEVVxcxwE3ZCv/YUqx2OwTcGE7hheB0Fqbr
	/9hepEL/wimgmqH01iHxA0/f50Z/4YTsDCrWXAqMxiOslk/TjxWkZ/oJxHIRpS6+Ck15eG/h8Q1
	2KRankEQtrwCSwNB+OKrrgjbG3qg00oOoXfOpATaG+qyUFp5zvsGzoazeRE15SEcmWAjLXftF4I
	zcwrAy5UP28VHa/QZOZl71lKDL9H1dblQ7ztn1DudnbRcmtcmilNfxiD0u452o4RosQr+Uc1bQ8
	wQCkiA42ddnQKbedKRJgq1Ptuo9qFfFMmCpKPp9NcosCGwEcos4se9v9sObhPntoV1M73XitLuF
	jdmTUYg+MU7/n72ZXQYtw7t0E83QR9NnU1BU4CK35pq6KCKNshu1nag1nuDU25eEgm36udVNJK5
	wFFhVOiD3UQLL/o13HHcBZskAMlvm/EcqUIUpDzBe9c+FdxSkF2z0Vr/tlP5UV+5XvJUd60Wqq1
	M6rTA==
X-Google-Smtp-Source: AGHT+IFV4ZJk8gCb7awz9e1XUlzsyTt2dLuTYq1zFzlkQqVLDRi2ppM+aqJDBCoFok+16YWsNFYpOQ==
X-Received: by 2002:a17:907:d11:b0:b73:3a:c49d with SMTP id a640c23a62f3a-b7331aac21cmr406575066b.52.1762962089984;
        Wed, 12 Nov 2025 07:41:29 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d456sm1670023566b.39.2025.11.12.07.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:41:29 -0800 (PST)
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
Subject: [PATCH 7/7] ASoC: renesas: rz-ssi: Add support for 32 bits sample width
Date: Wed, 12 Nov 2025 15:41:08 +0000
Message-ID: <20251112154115.1048298-8-biju.das.jz@bp.renesas.com>
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

Add support for 32 bits sample format width for RZ/G2L SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 5ebaaa440141..85d368794de4 100644
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
@@ -307,6 +308,9 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 		ssicr |= SSICR_PDTA;
 		ssicr |= SSICR_DWL(5);
 		break;
+	case 32:
+		ssicr |= SSICR_DWL(6);
+		break;
 	default:
 		dev_err(ssi->dev, "Not support %u data width",
 			ssi->hw_params_cache.sample_width);
@@ -697,7 +701,8 @@ static int rz_ssi_dma_slave_config(struct rz_ssi_priv *ssi,
 	cfg.direction = is_play ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
 	cfg.dst_addr = ssi->phys + SSIFTDR;
 	cfg.src_addr = ssi->phys + SSIFRDR;
-	if (ssi->hw_params_cache.sample_width == 24) {
+	if (ssi->hw_params_cache.sample_width == 24 ||
+	    ssi->hw_params_cache.sample_width == 32) {
 		cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	} else {
@@ -1021,7 +1026,7 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rate = params_rate(params);
 	int ret;
 
-	if (!(sample_bits == 16 || sample_bits == 24)) {
+	if (!(sample_bits == 16 || sample_bits == 24 || sample_bits == 32)) {
 		dev_err(ssi->dev, "Unsupported sample width: %d\n",
 			sample_bits);
 		return -EINVAL;
-- 
2.43.0


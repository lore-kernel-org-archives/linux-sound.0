Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692B435AC20
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907818; cv=none; b=r5WbfB3frgSqCHP81GCtUhmCuMnSV0GgOH0Y3Bbru+M3SZ2N/e/wen/zNpoDEu1NCh/0xZBwt2wOlTE3XzGuSt+hvDtQV/gz0VfPUhTwQ5DChd5zuxxKUwn4KP+7sftF7H7Ug6J6iReoB8HaIQtonCSW9smNYBzgyYR2oHIPKeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907818; c=relaxed/simple;
	bh=FpCWJ1/MY4BN1v1ry6eYA3qXFhCvUdewz0pHLK1RDgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmVAN05wkEMMJAm1vW9szWJ0x2B50rLoi+l3EppEy9CL0lUpOHbRWQcoCoijQf4HdcDtL9anVWqUUdkCIFv/MlwmhPFgqR9ZIwE+It6bRpMtH5jFdz9XbCZVxp0hXbesBp/DoWZY1sF5Gdo4u/Wg0Hx/USH656iJnuh/JQUWmHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FMT5r8zZ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FMT5r8zZ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfd96354aso1738116f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907815; x=1776512615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=278h+cjHuGOS99RHJ8gfM7jOA+QjEIxjWNs1as6pY7E=;
        b=FMT5r8zZ0GqmJhNImWqWntYRSQ08KRs/R1J8N5YJFZTjn+Gxnrg1hZihd6x35QHH6/
         SHkVjUPupmo8meiRrsdzhGQbx7eSk91bUKdJyjmb/lh+jO3j+SumlwN/KU0DyE9+/j8i
         lKligzr6mZWbk9UdW9f/ggQA+lLwq/tMpxH5PMR480uXF3OLwfFgNHkjKAZ2FkKhr6Oy
         AhO8vWrz5qPOrQ/+y1m2bxEhm7z/SK+eTvwq0siJGjkrskbgtGSKs67u9E/H31NxAHvw
         LIZfREL5VtlXnYigoxcekg5KLayyvO6CiF506yVKv7ukjbngUMun2q2xDUQ/+wPM8hiM
         J6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907815; x=1776512615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=278h+cjHuGOS99RHJ8gfM7jOA+QjEIxjWNs1as6pY7E=;
        b=XHwiIzpOBvEwrLA+y22VuQJ8hv7TMAfvagPuufTUAHqGPBW1ILTGrmnE/BF37O0Cp0
         gdeM6/Y320g2X70NrjGMNIU7MZ/Gbm3ZsSdRIejeOM5yWSKuA8xNE4ebAJAqLVIZZSh/
         JTHHGTmVGomomzX31xCLjVEKxxvA+3jn7wXSG4MGxGzA0AVj9Rxn+0zbfWSlJyQH9zyG
         26JeLftEE3z/I6GmLjObdUi0NFszL+Smq6xhcHofnloj1C+XlMHo+1ueaYxVEdLtgDXs
         p2Bfk8AVj1vnkwrcNodSx+Vpvosx0CqSxxIGN48lFFq4qJ2ylyxV5ygTH6+odG5zH2Pp
         5qfg==
X-Forwarded-Encrypted: i=1; AJvYcCV9Dhe9J8C/CAnTDxlUc3UrPjKJQO9uUSOPqBLOJMBWzZSy9BUqhcNCJnh53S5BVs1g38hrtOdxM1rCtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5CiFgSOUvUMB/ELVrSTPazj8KKbosW/DkY9APlxQUrK2v8Iz9
	FL7jLpdcO397rKlYExbX62wz71+apw80qsTm+n8FU9cmbseW2ZvMNWI6/s9PL7PSP30=
X-Gm-Gg: AeBDies81ZExRGgGi7AcbCj5avirSYdqi5p3c9Awi6c4+7vIT9sV65I04Prwg2UfeDo
	1mdmMld2R7zDGuwwFsZ2KbD1wOlAUlXifAfRxs3+/YHB7pkfGu49cR8rQOb06xFuMkFkQwAGAiD
	aCqT51VPJa0Y/PicsAKVFNFz5QDxMSwScIEIcUqq7u3wWQNwN7F3dEC7ZwMjuuK/EBiXbPVnM/4
	jpA2gdLh/9Y4QjyZNjHPq6+FEhbvcgG9J17t22b5ZEs0EKNRdcBpTe5uVsPBUf1TEMlKy6XZTQV
	m4vFqwqi/o6GuTH1hTDnatmw4wJ+CpgkLpref2Ix5/nlecC46tKeVSQTXV/ZILjA/K7yWfCbCaE
	yilouuSqYRRehaDGTCZ2OyyENRrDYJFa1JsejYq21dJTMleXymFACAGPLfaS2te6vadOvx4ThSH
	9YpGQkWihBNzjQKhurwwmORZqYIM7FlmrQiF4Qwv4ZvBvJIZKtdGOT
X-Received: by 2002:a05:6000:18a9:b0:43c:fde6:212e with SMTP id ffacd0b85a97d-43d642b8ebemr10073612f8f.24.1775907814878;
        Sat, 11 Apr 2026 04:43:34 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:33 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com,
	long.luu.ur@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 15/17] ASoC: renesas: rz-ssi: Add pause support
Date: Sat, 11 Apr 2026 14:43:01 +0300
Message-ID: <20260411114303.2814115-16-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add pause support as a preparatory step to switch to PCM dmaengine APIs.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- none, this patch is new

 sound/soc/renesas/rz-ssi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 71e434cfe07b..d4e1dded3a9c 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -847,6 +847,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		ret = rz_ssi_trigger_resume(ssi, strm);
 		if (ret)
 			return ret;
@@ -888,6 +889,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		break;
 
 	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		rz_ssi_stop(ssi, strm);
 		break;
 
@@ -1054,7 +1056,8 @@ static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_INTERLEAVED	|
 				  SNDRV_PCM_INFO_MMAP		|
 				  SNDRV_PCM_INFO_MMAP_VALID	|
-				  SNDRV_PCM_INFO_RESUME,
+				  SNDRV_PCM_INFO_RESUME		|
+				  SNDRV_PCM_INFO_PAUSE,
 	.buffer_bytes_max	= PREALLOC_BUFFER,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
-- 
2.43.0


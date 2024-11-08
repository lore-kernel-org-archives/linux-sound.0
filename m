Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D631F7098
	for <linux-sound@vger.kernel.org>; Fri,  8 Nov 2024 10:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063064; cv=none; b=qzwCwIE4UbzSMJjlao1XPf3CG5vQpPnuYvZyttCqGmWJMCFggAlUNv6ve6WhQ3rhfpgku44vNfVYjwN/183SS+E56CBi3QZpRahk6TkBqo4hjZwKXNV/geHwyhLaxrcG9eysNFRKwl5VhOdWhwHnIy5V5nZ9M63liEQyQIsoiEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063064; c=relaxed/simple;
	bh=7Aycs7iw0uTpqe/5B+Sd7tJmLzg6PTuKqWn2WBE/iHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uAcEWnSRJvqjB+Unyp0+OcHR7A0i/MJcrRHwiI7aOGbxI+ayOk5Pf49VjHckLoNwkgEUAVIIRd+7TgKDfTkGtrHt0XpP9toSIIfFHXhHi6BHK8FkNjHGPmGTs7ce7dIbsCg/MGrex//PxUvSEk5kwVvp6Z41Zr47ZYhxT74IypU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fa4vAzkf; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fa4vAzkf"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so283376566b.0
        for <linux-sound@vger.kernel.org>; Fri, 08 Nov 2024 02:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063061; x=1731667861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8Uk4fQmAWvdC1xeKG77LIM8dnesFI8Q0ss0r4c/eGw=;
        b=fa4vAzkf7JkJCxiOFehTy3t8pIgotPmqplIcaiWur530ccWRypTvNrlVotrCPR/INM
         QHe77W111tpkP3/nmkNSGNdRC/HifKGNk5GRhhKr6AkL+ESlbW0HP/Kk+mQeR6Ys0+GQ
         EQ+Hn7n8pPtA2MkXCKzHE63GwNQ9TbqxbgAhP0GtFN9fXgvS+IdmlefPOkJat2W08MpX
         vZQh7biLlnAyKrrL46pfNabRAfSuO4sTbMpcIfoOBThiczecisUxztQeq/D6NAnxs26s
         t0zfHB+UIX3+nd5iITmZgAnrYsDP5Ce3NgFqX+S4MZhajpBvFPLKpmP+kUZP561jE1PH
         ANlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063061; x=1731667861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8Uk4fQmAWvdC1xeKG77LIM8dnesFI8Q0ss0r4c/eGw=;
        b=auOWqX23Twr9IU8oggmmSXOMizxVnqUSdCBH1tWQ8AmWmPuH8lwUr80gmGLmoKBMuw
         8eoOHrJtXCaXbVqtali+zgmjRgT8FIphWCBXBbNF3wnlcA4G/TfliGHk1ROw43SAvVaJ
         pgX32Rt4ASCWh5aropDhF12H3yHAc2Gja4BF6qD6sqJ8JeMKvIHPiKd2QwfYUASvaiVB
         tf43KppBaLxFzwn1mfrCCvYM+QCmjQCjcuL+5qj/trj3mO2r60XduneEFDjSUqM6PmLo
         41Y9KTqg2yNW+HcII0x5IaG7txhd0cBPTcKCRmAONPiqq4aTzgCOtkTjdWOX0dw+oQ33
         bfFA==
X-Forwarded-Encrypted: i=1; AJvYcCXKrAy6jv3kT1cAqsTAXqve/T/Rxd/IZ4t2keKKx18P+lodTUDRcTU/Uz2RpjLWsOYl/gfKPysDDiGcKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyZoJ+xo4CS4Pgmp9ePE26TzZwkvDRIhdLQbu1TbXg6hIaMAv/
	n6LD5K3MoFVbeLV48ngwUupN5+xqlzIp3GN++Tu9X0lp0LLY3wNCxPdsNAa7ZVA=
X-Google-Smtp-Source: AGHT+IEU1GXWVhGI6kNsTH65WSwRs1TgPNBco228dyKtROcgVpJH7gyq/L5uX5nBBaQSNdFoMn3XDA==
X-Received: by 2002:a17:906:6a2a:b0:a9a:80f9:d4e0 with SMTP id a640c23a62f3a-a9eeff44905mr217224766b.34.1731063060775;
        Fri, 08 Nov 2024 02:51:00 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:51:00 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 19/25] ASoC: sh: rz-ssi: Add suspend to RAM support
Date: Fri,  8 Nov 2024 12:49:52 +0200
Message-Id: <20241108104958.2931943-20-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The SSIF-2 IP is available on the Renesas RZ/G3S SoC. The Renesas RZ/G3S
SoC supports a power-saving mode where power to most of the SoC
components is turned off. Add suspend/resume support to the SSIF-2 driver
to support this power-saving mode.

On SNDRV_PCM_TRIGGER_SUSPEND trigger the SSI is stopped (the stream
user pointer is left untouched to avoid breaking user space and the dma
buffer pointer is set to zero), on SNDRV_PCM_TRIGGER_RESUME software reset
is issued for the SSIF-2 IP and the clocks are re-configured.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 46 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 10dd973a1c85..c6bedb58d3ae 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -782,6 +782,32 @@ static int rz_ssi_dma_request(struct rz_ssi_priv *ssi, struct device *dev)
 	return -ENODEV;
 }
 
+static int rz_ssi_trigger_resume(struct rz_ssi_priv *ssi)
+{
+	int ret;
+
+	if (rz_ssi_is_stream_running(&ssi->playback) ||
+	    rz_ssi_is_stream_running(&ssi->capture))
+		return 0;
+
+	ret = rz_ssi_swreset(ssi);
+	if (ret)
+		return ret;
+
+	return rz_ssi_clk_setup(ssi, ssi->hw_params_cache.rate,
+				ssi->hw_params_cache.channels);
+}
+
+static void rz_ssi_streams_suspend(struct rz_ssi_priv *ssi)
+{
+	if (rz_ssi_is_stream_running(&ssi->playback) ||
+	    rz_ssi_is_stream_running(&ssi->capture))
+		return;
+
+	ssi->playback.dma_buffer_pos = 0;
+	ssi->capture.dma_buffer_pos = 0;
+}
+
 static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			      struct snd_soc_dai *dai)
 {
@@ -790,8 +816,16 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	int ret = 0, i, num_transfer = 1;
 
 	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		ret = rz_ssi_trigger_resume(ssi);
+		if (ret)
+			return ret;
+
+		fallthrough;
+
 	case SNDRV_PCM_TRIGGER_START:
-		rz_ssi_stream_init(strm, substream);
+		if (cmd == SNDRV_PCM_TRIGGER_START)
+			rz_ssi_stream_init(strm, substream);
 
 		if (ssi->dma_rt) {
 			bool is_playback;
@@ -819,6 +853,12 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		ret = rz_ssi_start(ssi, strm);
 		break;
+
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		rz_ssi_stop(ssi, strm);
+		rz_ssi_streams_suspend(ssi);
+		break;
+
 	case SNDRV_PCM_TRIGGER_STOP:
 		rz_ssi_stop(ssi, strm);
 		rz_ssi_stream_quit(ssi, strm);
@@ -958,7 +998,8 @@ static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
 static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_INTERLEAVED	|
 				  SNDRV_PCM_INFO_MMAP		|
-				  SNDRV_PCM_INFO_MMAP_VALID,
+				  SNDRV_PCM_INFO_MMAP_VALID	|
+				  SNDRV_PCM_INFO_RESUME,
 	.buffer_bytes_max	= PREALLOC_BUFFER,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
@@ -1201,6 +1242,7 @@ static int rz_ssi_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops rz_ssi_pm_ops = {
 	RUNTIME_PM_OPS(rz_ssi_runtime_suspend, rz_ssi_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver rz_ssi_driver = {
-- 
2.39.2


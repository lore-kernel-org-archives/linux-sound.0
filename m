Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D462046BA;
	Wed, 31 Dec 2025 20:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767211483; cv=none; b=hMXt6KN/ZDRcIJcUITjiywGiLLn0XNtZ3mBAgwvZRWnorxoKoC/qEc1J588ZBYoVyQ2Gdh+Tsz7y3fVp5DxI8IU8fVvxUUTD4ZkII4Te/CMVIS9/7q4NNjBe1KakfxSaXxgmKUAkGdF+0kFeX5bM+U9sTnoYsOtTh/U2ssJ4rx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767211483; c=relaxed/simple;
	bh=ivJYBIqvY4duhUZ4XVnOBB0/SA/kSDK67zFf3vvhRdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qdV1f22cRxSsSG8h52EFv4JbiBMsPsGEFhkIvJtlGguGxNxRko5xsKMerQ9k2kNiGxAMHfxF3tF20fpk/2Pr04OrULBY3SocUKTML7jIrAqkMVoOMH+tiZaLWIg58FpkRJCSuGiWoGtX2MXRcP57g9eKEv37YttlPbHhcU1AcrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kHSWIo2N; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kHSWIo2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767211473;
	bh=ivJYBIqvY4duhUZ4XVnOBB0/SA/kSDK67zFf3vvhRdQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kHSWIo2NanC9MT6LtFyhMUsp23KH/vhaB7h67+hm1hdGOJado4Ac+vIHxqlC7RN0L
	 4Gj6T8njhThr4fgLeGjC0PuVT+K9RZSrWmPhwsUYss3+o4ThDPfTSfAQe0/yWGI0x1
	 5PgSEjVVwPlBlX3R7pCmBD+ohbADcKX3+uZi15kM9XeXmwf8RSQUm7RCLs5F34AhSF
	 FyfqX/C4ChIyF3UNQU3JnWDpE6COGoMdSyEOIyXPVCsVi3WMAohHgR7YhjQP8pNRA7
	 AswVP73Q/OWQBIFEj6/cQqJoOqPRFG3GUyIHslhYzHmgocraQ+FQSkK//af4dyQrcU
	 8wb9/FEZY0/Aw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6714017E1533;
	Wed, 31 Dec 2025 21:04:33 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 31 Dec 2025 22:04:15 +0200
Subject: [PATCH 1/7] ASoC: nau8821: Fixup nau8821_enable_jack_detect()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-nau8821-cleanup-v1-1-6b0b76cbbb64@collabora.com>
References: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
In-Reply-To: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Seven Lee <wtli@nuvoton.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The nau8821_enable_jack_detect() function was supposed to allow enabling
or disabling jack events reporting.  However, once enabled, any
subsequent invocation would fail and the following splat is shown:

[ 3136.996771] Hardware name: Valve Jupiter/Jupiter, BIOS F7A0131 01/30/2024
[ 3136.996773] Workqueue: events_unbound deferred_probe_work_func
[ 3136.996780] Call Trace:
[ 3136.996782]  <TASK>
[ 3136.996787]  dump_stack_lvl+0x6e/0xa0
[ 3136.996796]  __setup_irq.cold+0x9c/0xce
[ 3136.996803]  ? __pfx_irq_default_primary_handler+0x10/0x10
[ 3136.996812]  ? __pfx_nau8821_interrupt+0x10/0x10 [snd_soc_nau8821]
[ 3136.996825]  request_threaded_irq+0xd9/0x160
[ 3136.996853]  devm_request_threaded_irq+0x71/0xd0
[ 3136.996859]  ? __pfx_nau8821_interrupt+0x10/0x10 [snd_soc_nau8821]
[ 3136.996882]  nau8821_enable_jack_detect+0xa5/0xc0 [snd_soc_nau8821]
[ 3136.996901]  acp5x_8821_init+0x8d/0xa0 [snd_soc_acp5x_mach]
[ 3136.996917]  snd_soc_link_init+0x25/0x50 [snd_soc_core]
[ 3136.996958]  snd_soc_bind_card+0x615/0xd00 [snd_soc_core]
[ 3136.997026]  snd_soc_register_card+0x1b2/0x1c0 [snd_soc_core]
[ 3136.997064]  devm_snd_soc_register_card+0x47/0x90 [snd_soc_core]
[ 3136.997108]  acp5x_probe+0x72/0xb0 [snd_soc_acp5x_mach]
[...]
[ 3136.997508] nau8821 i2c-NVTN2020:00: Cannot request irq 58 (-16)

Introduce jdet_active flag to driver data structure and use it to
provide one-time initialization of the jack detection work queue and
related interrupt line.

Note this is also a prerequisite for additional fixes around module
unloading and suspend handling.

Fixes: aab1ad11d69f ("ASoC: nau8821: new driver")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/nau8821.c | 5 +++++
 sound/soc/codecs/nau8821.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 3beb3c44dc2c..2d25a182f4ab 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1655,8 +1655,13 @@ int nau8821_enable_jack_detect(struct snd_soc_component *component,
 	int ret;
 
 	nau8821->jack = jack;
+
+	if (nau8821->jdet_active)
+		return 0;
+
 	/* Initiate jack detection work queue */
 	INIT_DELAYED_WORK(&nau8821->jdet_work, nau8821_jdet_work);
+	nau8821->jdet_active = true;
 
 	ret = devm_request_threaded_irq(nau8821->dev, nau8821->irq, NULL,
 		nau8821_interrupt, IRQF_TRIGGER_LOW | IRQF_ONESHOT,
diff --git a/sound/soc/codecs/nau8821.h b/sound/soc/codecs/nau8821.h
index 88602923780d..f9d7cd8cbd21 100644
--- a/sound/soc/codecs/nau8821.h
+++ b/sound/soc/codecs/nau8821.h
@@ -562,6 +562,7 @@ struct nau8821 {
 	struct snd_soc_dapm_context *dapm;
 	struct snd_soc_jack *jack;
 	struct delayed_work jdet_work;
+	bool jdet_active;
 	int irq;
 	int clk_id;
 	int micbias_voltage;

-- 
2.52.0


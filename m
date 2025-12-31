Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C620C2459E5;
	Wed, 31 Dec 2025 20:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767211484; cv=none; b=iFMNuvh2EuY3q8trMjiwXvVYD1fOxsmqLJGXbR6wLl2+g53/+07GF/i0g23nNuelzgYJSNKdttUvtEGzkwk8UAZ/+xZ72W0tOIf4F7kP0LFx0GnTAQfxfBz0Z018JdrJbWKeO7i0OTuE7yfa5MuNbux5BYDmdAVBtVz9m/m0WdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767211484; c=relaxed/simple;
	bh=lqIxe+2iBfqIt72uH4+4mwkm/E5wkMupDxN+jbjIW2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UHgvofhYsfO2P7G2LPx3NKPsdSeDfRLY6DNNwqkTGX8VIOpvGgCRjKSQlFLo0Ak4KsmindKnZy/mDrH6aW34J9sfm5Ky0HPZtdJ51g8qMuGtupaUzQwbgBQ5LPqx6bOG4bW1/SMc/I80rdycZRpMlXooHmqf3xQhaI8IC7UQSws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EQoQ4lx8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EQoQ4lx8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767211474;
	bh=lqIxe+2iBfqIt72uH4+4mwkm/E5wkMupDxN+jbjIW2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EQoQ4lx8Nc9mHm6Tl+CFj9ET4uUYQv94treG7mwD3MnWk9n4TVNqhSAUAGuR15QnO
	 MtU0bduM4hyt5W723vRCZrO5PTmWs16WJ6if3JhDrykN8i4/NiLu64BjEraxBqifFf
	 qHCLvLTR/zd0rLfB0jQ3/x6KVogfo//kczXmXFPjpemPNxZp+N9yOc4HYWQZkZOUIR
	 kprS1MBD332KrYNXCOIMAQF5zQMm+8GKYoMHRXbJhI0dVy3mLiPk1EDaaTOOD/5InS
	 W81gneT1MtGQ2j97F80mYvwWiY79bn9mdUUQ5Aph7li43ZGbVSXqDMbyVVGcDq+r02
	 UywbTdxmieDbg==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 413D917E1536;
	Wed, 31 Dec 2025 21:04:34 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 31 Dec 2025 22:04:16 +0200
Subject: [PATCH 2/7] ASoC: nau8821: Cancel delayed work on component remove
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-nau8821-cleanup-v1-2-6b0b76cbbb64@collabora.com>
References: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
In-Reply-To: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Seven Lee <wtli@nuvoton.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Attempting to unload the driver while a jack detection work is pending
would likely crash the kernel when it is eventually scheduled for
execution:

[ 1984.896308] BUG: unable to handle page fault for address: ffffffffc10c2a20
[...]
[ 1984.896388] Hardware name: Valve Jupiter/Jupiter, BIOS F7A0131 01/30/2024
[ 1984.896396] Workqueue: events nau8821_jdet_work [snd_soc_nau8821]
[ 1984.896414] RIP: 0010:__mutex_lock+0x9f/0x11d0
[...]
[ 1984.896504] Call Trace:
[ 1984.896511]  <TASK>
[ 1984.896524]  ? snd_soc_dapm_disable_pin+0x26/0x60 [snd_soc_core]
[ 1984.896572]  ? snd_soc_dapm_disable_pin+0x26/0x60 [snd_soc_core]
[ 1984.896596]  snd_soc_dapm_disable_pin+0x26/0x60 [snd_soc_core]
[ 1984.896622]  nau8821_jdet_work+0xeb/0x1e0 [snd_soc_nau8821]
[ 1984.896636]  process_one_work+0x211/0x590
[ 1984.896649]  ? srso_return_thunk+0x5/0x5f
[ 1984.896670]  worker_thread+0x1cd/0x3a0

Cancel unscheduled jdet_work or wait for its execution to finish before
the component driver gets removed.

Fixes: aab1ad11d69f ("ASoC: nau8821: new driver")
Fixes: ee70bacef1c6 ("ASoC: nau8821: Avoid unnecessary blocking in IRQ handler")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/nau8821.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 2d25a182f4ab..2e2714b47501 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1264,6 +1264,14 @@ static int nau8821_component_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+static void nau8821_component_remove(struct snd_soc_component *component)
+{
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+
+	if (nau8821->jdet_active)
+		cancel_delayed_work_sync(&nau8821->jdet_work);
+};
+
 /**
  * nau8821_calc_fll_param - Calculate FLL parameters.
  * @fll_in: external clock provided to codec.
@@ -1621,6 +1629,7 @@ static int __maybe_unused nau8821_resume(struct snd_soc_component *component)
 
 static const struct snd_soc_component_driver nau8821_component_driver = {
 	.probe			= nau8821_component_probe,
+	.remove			= nau8821_component_remove,
 	.set_sysclk		= nau8821_set_sysclk,
 	.set_pll		= nau8821_set_fll,
 	.set_bias_level		= nau8821_set_bias_level,

-- 
2.52.0


Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC833064AE;
	Wed, 31 Dec 2025 20:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767211484; cv=none; b=a4k+jY8zsoHQCC1oooGldHrXj2BxPJ3qdXCUtRbdYCgzo0wZ6lManHUyQH994jXYp6cT+tZAZ+6cDQaX/aLcDV6bNeap1PSZrYScTq/P0tWT5RSw76zYVmLTLfXENpAyAgLuJ4PoHInJlscjE8EH+ckS2C7m6OezR/YdAlflaf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767211484; c=relaxed/simple;
	bh=xJvRw08s346aB4bQFdhdVkcd/oioURVI+ywOOYi+vOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=epn451Lm7rGy78a1limBKiBAbJ570rX2NPY8uaPyJKAZU+QcXBlAqNSHwC8OfbtjCYxuBVUBYviynbomPbak+ZlA/dHXdF5d+YHP6DTss1JheT8c5QAd+ea0LvlEqHYeRAC0tISqjGzEh45SPHiU7hjnj8FPN51m1TfXhUh7ia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JZOBcusy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JZOBcusy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767211475;
	bh=xJvRw08s346aB4bQFdhdVkcd/oioURVI+ywOOYi+vOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JZOBcusyijt4Ky04eJXtwqYaeWO5EoVRQQDabsc/7jiTiaf+jY3+dt2MKR4h8N0BX
	 Ql2ACO4RVEMQfTnkyEkhPkpsqJ2iFbhHknbz49LN6y++4H1FO7+C0BH7IqSdb9/wNX
	 TzM+KtXs1nvlGLqBAB2WSusnEL85PUAsYSDPreh6PkQB1Or4oh4zXmBI/gg0yE+Bj9
	 rpP+E5FYFSuQl0+pTTQdIfkHiLxHfUfeTBv+cqu7zqr6FZMgnTslVzMazodrhVfOck
	 lZsrM7saeB0b0Ix961CGICgrbfw8jRew8fBF3lmAfKpnGZBa4PkGUchgy70xitmTrm
	 o5vgA5pXiY+Zw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F96317E3685;
	Wed, 31 Dec 2025 21:04:35 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 31 Dec 2025 22:04:17 +0200
Subject: [PATCH 3/7] ASoC: nau8821: Cancel pending work before suspend
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-nau8821-cleanup-v1-3-6b0b76cbbb64@collabora.com>
References: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
In-Reply-To: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Seven Lee <wtli@nuvoton.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

A jack detection work that is unscheduled or in progress while executing
the suspend handler could trigger a race condition.

Ensure state consistency by cancelling any pending work or wait for its
execution to complete before processing the suspend.  Since driver
(re)enables both insert and eject interrupts on resume, there is no risk
to miss the related jack events.  Therefore, flush_delayed_work() is not
required here.

Fixes: aab1ad11d69f ("ASoC: nau8821: new driver")
Fixes: ee70bacef1c6 ("ASoC: nau8821: Avoid unnecessary blocking in IRQ handler")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/nau8821.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 2e2714b47501..58d2d5e77c8f 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1605,6 +1605,10 @@ static int __maybe_unused nau8821_suspend(struct snd_soc_component *component)
 
 	if (nau8821->irq)
 		disable_irq(nau8821->irq);
+
+	if (nau8821->jdet_active)
+		cancel_delayed_work_sync(&nau8821->jdet_work);
+
 	snd_soc_dapm_force_bias_level(nau8821->dapm, SND_SOC_BIAS_OFF);
 	/* Power down codec power; don't support button wakeup */
 	snd_soc_dapm_disable_pin(nau8821->dapm, "MICBIAS");

-- 
2.52.0


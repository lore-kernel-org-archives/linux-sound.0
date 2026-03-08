Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069C531B828
	for <linux-sound@vger.kernel.org>; Sun,  8 Mar 2026 11:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772968183; cv=none; b=eV4MivRCW03TFwTQAWuIG/4o92XUdlX1cIgbCwfbv5W/Tz6VY8CumXFtKVMtPzpWY5+5M14/Iu0tDoxkQzwfrs3L0NpER+D4K08Yr27e7R5fcb7HH+ZclduaMoGy3EfbQp41Kf7M6YaK+ZmdHlnXFpW1pN6whs1zJFx56TeIrd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772968183; c=relaxed/simple;
	bh=6AAcio1GJc6nbuHkpQ3SnZoLqNmIyKgEysZExP+QjKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QkAUCMo24Mq/6RqvhvYijfsCFmyd/ybieMLaPRy0APqCcwsoDc2gocN5ZDfkKULkt6EaSC0cZ8P4FQUk/RhUIkmpHw4hhBPyrWrKz4mjBNjptqUNQGaSb13vUrPkXrceF3wOsbOtBlVCcX/Lr4E5giaMdjjVYk2oaU6bpCTFtQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaQIAEj8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaQIAEj8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483703e4b08so104326285e9.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 04:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772968180; x=1773572980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l+XUt0u5XJpVULNhibEfvn6UJrIOwH1+vFY88JXb0GQ=;
        b=gaQIAEj8qcRyfy0A1EJ7LWr7x9qCSBcV2nsMH4A75SQ8cUdvCD+bTt3YNRfO7SNm40
         0hHs1G3IVjfy6m41VSrnvYeEpxeZxLYpTzaXIRsiHIysGPTXXzs575bf+12dW5s1oSam
         MsdADRWx3/ETkAzOMATciXJz3BSbHEBTNLGO5IG/0UQ0hiUyBBiDciuDhSwpcQigMQxg
         ZwjsJD0Yv2iKblfNEbJFFHB0rT2POfQnktzvMt/2G3L+5cD/jdPyBVgvPb0HlMxFvBqf
         vTEtxF39JRHuPz7Ph4L273iQa99Pyrw3ZY9S/fPXi9QkhXORfU6FtmQl4SkmPijwzK/V
         VZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772968180; x=1773572980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+XUt0u5XJpVULNhibEfvn6UJrIOwH1+vFY88JXb0GQ=;
        b=ZNkP7M/2KlhxF2NaE/BYy8u01GjfTVSzcj63nMQsKCWDhGcCcQwvqR9bZg++/mHGeO
         y9B/5jFcVZoZYWtvtmxyDvS1yBtcU0iLNcY0dxZdodpZuqdDCW0oNp/sZLjTPSJA3M7x
         7pH4dA4Q5kgQg4M5IeXgt/hn0+av9up5TDSHTfSiF2CH+9INMSZb2JWb+d1e6klyb2FM
         g48ScZD1+c5ewcX/MjqQaoX3TGSA9aP1Nm5unw/XoFbt/XRfwSJN7Wzk7TVmpMBDs7Xw
         CGZ4MsrYQApIPreqg7eYVkWkTkW4moqvUI7OuNcvMRU70wPNMlMDmzHfPPcJzlLwa5S7
         7Lyw==
X-Forwarded-Encrypted: i=1; AJvYcCW0d4ong9S5AcSkqMBQvT7ApVF+KsxbcYgkXv9KRBMDr1sJLY3+rWph+imPgMBDOpxAHLJrsGENYuSebg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbSolg4gUEhRMpPkka3nZ2jMm3UrwQvCOvDlQEH8sLSKBVxtS/
	OK/DjU5YNC+NZT0j3s/85byJKIj6a5oWx2ILykGB8Si2Jt3Rn9RCnd0=
X-Gm-Gg: ATEYQzzxfXa0cfycvRQwNBTxouY+ImTNsHd42y4MUpy057tvGk+nISXypR1A3e62PHE
	dE2jO0j7x+GYe5dey4o+m/RcKASDASVB+WFE+aa9TvgJeG3ZzcFFauIhQnJnnD213CKa2maoHqY
	15I8ucbLztMo6P4nm9pn/Ew3Ljm5ly9BzbCx6/U71//p9ZXU7RcZ1O1fnGowu20NQSBeoRX4yMn
	+IIlOOJhr0y5ouHVekPqs5FqmymafiGFQhvdhvaRQ4d1TNDLwifKuGb9aTVHCxzZ0vl+Zsh2Ikt
	NtZ569gW7FQDMTB3ASzClsyJxs6zpKQ1/MAuZNq7p7g8Z/dk9EWVjEYtvu8LpPLLMOCPE5FkR3C
	LYWVzzYK8hp40XdTCS6gMSu8uhXkoBcN0zWdyksyxVZZc6B6nP0wu7sDrdUjZdooG+HB+ORQStj
	dj1aIMTOknwQvGHAu4wd+V9e7zk8GKfvhu89Z9stHbD9c=
X-Received: by 2002:a05:600c:8b6f:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4852674e8f7mr136098015e9.11.1772968180067;
        Sun, 08 Mar 2026 04:09:40 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e11:2401:e440:4d43:1ae9:c232:cc4d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb3668csm406058865e9.13.2026.03.08.04.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 04:09:38 -0700 (PDT)
From: Matteo Cotifava <cotifavamatteo@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	srini@kernel.org,
	cujomalainey@chromium.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matteo Cotifava <cotifavamatteo@gmail.com>
Subject: [PATCH] ASoC: soc-core: fix use-after-free in snd_soc_unbind_card()
Date: Sun,  8 Mar 2026 12:09:31 +0100
Message-Id: <20260308110931.148919-1-cotifavamatteo@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a sound card is unbound (e.g. on module removal) while a PCM
stream close is pending, a race between the close delayed work and
soc_cleanup_card_resources() can cause a use-after-free:

  BUG: KASAN: use-after-free in snd_soc_dapm_stream_event+0x39c/0x430
  Read of size 8 at addr ffff00000a29a918 by task kworker/u8:0/8

  CPU: 2 PID: 8 Comm: kworker/u8:0 Not tainted 5.15.71 #1
  Hardware name: NXP i.MX8MM
  Workqueue: events_power_efficient close_delayed_work
  Call trace:
   snd_soc_dapm_stream_event+0x39c/0x430
   snd_soc_close_delayed_work+0x208/0x2ac
   close_delayed_work+0x3c/0x54
   process_one_work+0x670/0xfd4
   worker_thread+0x84c/0xe74
   kthread+0x370/0x410
   ret_from_fork+0x10/0x20

  Allocated by task 8:
   snd_soc_dapm_new_control_unlocked+0x2c/0xbc4
   snd_soc_dapm_new_dai_widgets+0x12c/0x35c
   soc_probe_component+0x418/0xbb0
   snd_soc_bind_card+0xa38/0x2200

  Freed by task 488:
   snd_soc_dapm_free_widget+0x384/0x520
   snd_soc_dapm_free+0x11c/0x284
   soc_remove_component+0xd4/0x1b0
   soc_cleanup_card_resources+0x184/0x700
   snd_soc_unregister_card+0x1dc/0x240
   __device_release_driver+0x2b0/0x584
   driver_detach+0x190/0x290
   asoc_simple_card_exit+0x18/0x30 [snd_soc_simple_card]
   __arm64_sys_delete_module+0x2f0/0x4b0

The PCM close path schedules rtd->delayed_work with a timer delay
(pmdown_time). snd_soc_unbind_card() calls
snd_soc_flush_all_delayed_work(), but flush_delayed_work() does not
execute if the delayed work timer has not fired yet and the work item
has not been enqueued in the workqueue. Cleanup then frees DAPM
widgets, after which the timer fires and the work runs against freed
memory.

Replace snd_soc_flush_all_delayed_work() with a new
snd_soc_cancel_all_delayed_work() in the unbind path to guarantee
that any pending or running delayed work is cancelled or awaited
before card resources are released.

Also fix soc_free_pcm_runtime() to use cancel_delayed_work_sync()
unconditionally instead of the racy conditional flush. The original
check of delayed_work_pending() followed by flush_delayed_work() has
a time window where the work can become pending between the two
calls.

Fixes: e894efef9ac7 ("ASoC: core: add support to card rebind")
Fixes: 9c9b65203492 ("ASoC: core: only flush inited work during free")
Signed-off-by: Matteo Cotifava <cotifavamatteo@gmail.com>
---
 sound/soc/soc-core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index d0fffef65daf..0f459679d459 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -462,8 +462,7 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 
 	list_del(&rtd->list);
 
-	if (delayed_work_pending(&rtd->delayed_work))
-		flush_delayed_work(&rtd->delayed_work);
+	cancel_delayed_work_sync(&rtd->delayed_work);
 	snd_soc_pcm_component_free(rtd);
 
 	/*
@@ -616,6 +615,14 @@ static void snd_soc_flush_all_delayed_work(struct snd_soc_card *card)
 		flush_delayed_work(&rtd->delayed_work);
 }
 
+static void snd_soc_cancel_all_delayed_work(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *rtd;
+
+	for_each_card_rtds(card, rtd)
+		cancel_delayed_work_sync(&rtd->delayed_work);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static void soc_playback_digital_mute(struct snd_soc_card *card, int mute)
 {
@@ -2149,7 +2156,7 @@ static void snd_soc_unbind_card(struct snd_soc_card *card)
 {
 	if (snd_soc_card_is_instantiated(card)) {
 		card->instantiated = false;
-		snd_soc_flush_all_delayed_work(card);
+		snd_soc_cancel_all_delayed_work(card);
 
 		soc_cleanup_card_resources(card);
 	}
-- 
2.39.5


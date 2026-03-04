Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC921A681F
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 03:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772594117; cv=none; b=EdEBLS4ZFkVL/aUZKKb58dKqEqFACLtx5F3HMMrWPpLjZrEtgXpMjWZ3K96ugaBHzPrggMN2MLV4nS5UG+Viq/n8w8IBOO+s7ktZ8QKqOv+9RfqoOASES2EDzMUFGKPof5l4Usw4ow3q7dxrTcDRZrYVTwI7i3dMziG9CE3o6B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772594117; c=relaxed/simple;
	bh=adrxhRBK5VGSwmvLMLS00LJzCjjD2NiB2SXH8DIyaK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F6QkCfCfRt3Gnj4dtkmmt7HY5QDffwrlLHm/l4X+7d9UHKYf0s4yNnU3VzjnJmN72tJsY95ZbzAABr7Sg+gHrHuDDmleRY1KDYxoFInEGsKQkwZWh1g0yA6foNSKsFuK6gPIMIuGs5ezcbLRna/Byv1ZRBnobrLgPhXcesYanpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q3q0goJk; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q3q0goJk"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae527552acso10381795ad.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Mar 2026 19:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772594115; x=1773198915; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F3ZuLgwSN0G7v9/OIE+XUVdG12gsyO2jvTrJvM7l85s=;
        b=Q3q0goJkdSsWm8MhB3ih5vL5mUqIS75h7WiZEg7LEHaOSdTAUsgceSak2vqpZS9ShL
         i4Nhum8VT9mR+UW1yzqvL3l2s30RtVEcf02b5bTHNstuJrGhyPzYkI2Umbyeep3wssQ6
         Ndppi9Dtt6aWmn2C1kSlJsmDMo8NvG4lS6HGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772594115; x=1773198915;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3ZuLgwSN0G7v9/OIE+XUVdG12gsyO2jvTrJvM7l85s=;
        b=N4VYFHlhHoXucNlJ8ZY0w2uUJTJSd8Qfky5HoPwR+oKBSrRQY77ery9aihjienX4EM
         potg65IbbdUz3VQ1x2sg711RPr0pwbtfuUukQtKSXlQO0gkJa7Q7SEH8AINsSbvSiP6R
         /21J5pzPcvqCzP8fXgocSqetgS3ixYgfX5Sjr+/xMXj9xHRFbVHiJxPzxFlCy7qF7ab6
         uQ/AgYGSDgwNpFlY3zxMKoRsZpPIdhoNiqx0hAG+TnAxKJFik3x5bVU7UpHALIKKo98o
         uchB2OFaHgrCwjr5bfmlSjmLrE3lFCYY+rEIt85kEhxjYIzoKdZsY0NJShiqsfTHIWDL
         OJCA==
X-Forwarded-Encrypted: i=1; AJvYcCXbTHw3lfjXURJ/J5MPyCaYX0ScfAiKrKyanoy+WMYfUJPpVTXLDFUF+Y8sNuqEu3F7SI4qn1+jLb1V6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT34PmdLE7N9+GegEkzbzbqOY3uhcUFOftraHbt8WkaR68HBz8
	wa/EhI40XcReReNh46zQGwv60AREpCl3Wo4WrktdXB8vZZwAKciGovpQQP71q8+hwAC6rOW4N1w
	fMFs=
X-Gm-Gg: ATEYQzzL3MSsutxCyUWA77rilrSJPtnvT2aqhDvdeWn5Om9DCrBjEK8XSuyc3aX+59F
	GE1AQykTV/ZR22ctbP712VWm/d2vDLqpa94NiaeEJfbfePLvv2Xs18iQ/PxOfgMqESHJUWaUBsZ
	TLDtg+Nlgg+Z2gHslBj0IKso0stZqD9dU2MS+535U5ZHBCQIp7hFM92T4JnY+R8hnANJmtG7xrW
	m/9C1HsVHXYqifT7bgN5SyQ9AMuSf+hvJal+yBZziNsqgOk5YcRNu6JYOLMlk7sLyTqvC3KH7zW
	+PoBh3DdJwWQ8JMasMM2+PrL1AAFoo30FYR72kfzPHvjLFHJI2lI+zyZkbJM3BKhtJX+iK7xjxh
	Yr/R+dL9cPQAWc2YxOzZbT84bn2RR+90EyWWaiZF2uN30b6k22RFa/Ad20FXktvmI5Bsb7JkIhq
	URf5nXX4wEhHSl7SyH8sdn6gAeWW2QQI9dpfmDE7ANOf2yhmVq/KMuSVrhxQvMqIw=
X-Received: by 2002:a17:903:1a23:b0:2ae:6579:4795 with SMTP id d9443c01a7336-2ae6aa1904dmr6603965ad.21.1772594115319;
        Tue, 03 Mar 2026 19:15:15 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:7218:9151:d36e:8e85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm114166475ad.6.2026.03.03.19.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 19:15:14 -0800 (PST)
Date: Wed, 4 Mar 2026 12:15:11 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Baojun Xu <baojun.xu@ti.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC][stable 6.6] ASoC: tas2781: ABBA deadlock in
 tasdevice_fw_ready()
Message-ID: <oujimewjf4um4hz3r6clucgnbtgntrkvzjl55rthiqahzqdy4v@aydjs5dibdqn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Not a formal patch, just RFC.

I'm seeing the following deadlock in tasdevice_fw_ready():

TaskA first takes ->codec_lock in tasdevice_fw_ready() and then
->controls_rwsem in snd_ctl_add_replace():

 down_write+0x88/0xb8
 snd_ctl_add+0x38/0xb0
 snd_soc_add_component_controls+0xe8/0x160
 tasdevice_fw_ready+0x284/0x620
 request_firmware_work_func+0x54/0xa8
 worker_thread+0x368/0x9d8
 kthread+0x108/0x1c8
 ret_from_fork+0x10/0x20

TaskB first takes ->controls_rwsem in snd_ctl_elem_read() and then
->codec_lock in tas2563_digital_gain_get():

 mutex_lock+0x50/0x80
 tas2563_digital_gain_get+0x4c/0x138
 snd_ctl_elem_read+0xf4/0x178
 snd_ctl_ioctl+0xa04/0x1430
 __arm64_sys_ioctl+0x2e4/0x548
 invoke_syscall+0x6c/0xe0
 do_el0_svc+0x68/0xe8
 el0_svc+0x34/0x88
 el0t_64_sync_handler+0x1c/0xf8
 el0t_64_sync+0x180/0x188

Which results in ABBA deadlock.

This is seen on stable 6.6, but looking at linux-next the ABBA
pattern still seem to be there (tas2563_digital_gain_get() was
renamed into tasdevice_digital_gain_get()).

So I have a patch that drops ->codec_lock before calling functions
that add ALSA controls (which internally acquire ->controls_rwsem),
and re-acquire it afterwards.  snd_ctl_add() doesn't modify tas_priv
members, at the same we are still in init (loading firmware) so the
controls that are already visible to user space don't modify tas_priv
either.  (at least it seems so).

Does it make sense? Or what should be the right way to fix this?

---

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 41b89fcc69c3..18c8c7471301 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1638,7 +1638,19 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 		tasdevice_config_info_remove(tas_priv);
 		goto out;
 	}
+
+	/*
+	 * Release codec_lock before adding ALSA controls to avoid ABBA
+	 * deadlock: the ALSA core acquires controls_rwsem (read) before
+	 * calling kcontrol .get/.put callbacks which then take codec_lock,
+	 * establishing the lock order controls_rwsem -> codec_lock.
+	 * Calling snd_ctl_add() (via snd_soc_add_component_controls())
+	 * under codec_lock would acquire controls_rwsem (write) under
+	 * codec_lock, inverting the lock order.
+	 */
+	mutex_unlock(&tas_priv->codec_lock);
 	tasdevice_create_control(tas_priv);
+	mutex_lock(&tas_priv->codec_lock);
 
 	tasdevice_dsp_remove(tas_priv);
 	tasdevice_calbin_remove(tas_priv);
@@ -1675,8 +1687,11 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 
 	/*
 	 * If no dsp-related kcontrol created, the dsp resource will be freed.
+	 * Release codec_lock before adding controls (see comment above).
 	 */
+	mutex_unlock(&tas_priv->codec_lock);
 	ret = tasdevice_dsp_create_ctrls(tas_priv);
+	mutex_lock(&tas_priv->codec_lock);
 	if (ret) {
 		dev_err(tas_priv->dev, "dsp controls error\n");
 		goto out;
@@ -1685,7 +1700,9 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 
 	/* There is no calibration required for TAS58XX. */
 	if (tas_priv->chip_id < TAS5802) {
+		mutex_unlock(&tas_priv->codec_lock);
 		ret = tasdevice_create_cali_ctrls(tas_priv);
+		mutex_lock(&tas_priv->codec_lock);
 		if (ret) {
 			dev_err(tas_priv->dev, "cali controls error\n");
 			goto out;

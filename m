Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C6844D02B
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487444; cv=none; b=Vy1Sgkzukd4uskuKKdGW935zouDzXqE/0p4NrrlprxTthTK7pCb+jpNhK2AMTKEnouxyLvqHCJjf4ANdXjO4aOiwBth54SxEWxdD5pFz9yn+mxAlYeIaAReNNKh2BnvC90InhjHo5vsfNULinEFqcB6kh1fncgB0oE5GNwPqoJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487444; c=relaxed/simple;
	bh=mW4eQXqnfxaB0c/JC7r7EXwbppQQR/dLCcxN+G/JGWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U/V+448MforbmgR6xqQscu3lFiL/Rj7PbyYKG8IvrbpdTOGQPH4RyQcmJfP/rAE/c67IVoM+vGE2WHEhaGC3+P0mG+F319NPvhoXjU0DVbtLBA6dPndc+Rp/JQXJeHNijS4bCIJvLbw85ND0bm5+tPcjV9D4O6hxv1M1nDGfO8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOeD0Csh; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOeD0Csh"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so2979685ad.1
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487442; x=1781092242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/cb7/Oh3wrVW6lTEgQSTGPGYUEEQIjXPznLNOjAVMo=;
        b=dOeD0Csh2J9hCpo1AaEEl1z+VNNAE/NsFnLdeIyzE78YecNEmFb8cAdZFGAhzJOLIe
         pwy93amfXkQO1ilD+mUH4EZfev+CYpfcU9ghQ1RFgFH2iDO6ilBUWt7ypt6qtFH8CG56
         +DL1sFCze48VV8uv1hyGALHt4A5hXzGRKg79Ho2Ysv5/FWB0cBiiob4baZOAlJZhMb4K
         I7KeofRucMuV/HIGtak77/KJ7OG5fKn1nmjMHY0/G7ofwiSKU3OY3NtCSjd+srx/jTLo
         dH4Cc8LccLrAxSphyy8bALrk7vgoruAmJVppb8m0jtBle1UsCGoXFVN6O1+zzw752QdA
         fZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487442; x=1781092242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/cb7/Oh3wrVW6lTEgQSTGPGYUEEQIjXPznLNOjAVMo=;
        b=m7mWkBg3YBMMT4QPtyPfcvS0vmrw92itiqBFo2cXWDdXMCgWwCnSI0sQUjYKfWmGbT
         mmbluxuE8s4f/+DX94E5rCsFC7pyU0lTl/hRAhMETqgwa065jkQf0Nnxz2j+pqXLkiPC
         1JdvRmwRscVhlPQCC/oOH+xnhhX3SWwGp0IRjAq3riLx/MtcZGcecKY9z0/rPOAYzHcM
         sH732GFMSeezQoQhOmdD7tDaZbLmZRh8eMnLV1XF5MYzdRbNMCecSBA2NSAiLbWN4RTV
         9C4ILjgQjZIRqyoSBuMw2cV4RjepYYsJpzR6Ka2ojRu23OfitU/8bjGSWoZWkqQBDixT
         FTNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ru78XCHOjOp81U49HtoVo3HbzitpJNvM1I81SYVf35w5PP9KtpqfvWvatzRwrDTuALSRd68gBYn3QJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzmdP5z3waQbRsWllq0iiabEfrQcdbcfERUWdM0ZTu7dqXoip
	ANGhoNeZjl8uZHaRAFFcR54ZQWR3YPkwiWisNhOdJkj/mM7f/VMCsn2Y
X-Gm-Gg: Acq92OFVqiCBMfBP05lp8VBkK7uIkQfVRqYgg6St0yZjxZWhjh4x2nWFOWOrEQ50Rmz
	/yfSE/gku+coJcPPou9wjEiGYraN4d77NaUjruJyWozM3tVg4p71ILIrF00ZUJbx2YVA/DEqEVn
	awWyFhGNZwH+gCCpSSj8tS9AG1gid4XV8aul5iWATE/CMATFHKUqCZcehvOXRvlxqIHoWBN07C7
	MegrDhwF86DEseB7kl7uX7j9OSNWrOdK/JehaFKhJcBVOGUsnqvRz4m4/UyjrlTQc+ooNNl+C5N
	x3qXdsdlF5LXUXWDcw8AFXoZR8xFhaeuulU3PnzX0YklfE9tcbDeXlF11Jy6DCpuW/suc1u+AWZ
	dme7qykwfacExL8zIo8bCSWcFVc+bL1br+mEMvrdihVARAP4Oitz4V3Km8WOB0vhV/rW63izYI7
	B+axqX03OM4O+qAfePUR/mjndjlcKXLF0oEh6lpcTdImnGeSK4Aa1FfoAFDAP0pWuqZ6Kh
X-Received: by 2002:a17:902:bcc3:b0:2c0:bd40:17e5 with SMTP id d9443c01a7336-2c164b2c190mr16899325ad.19.1780487442382;
        Wed, 03 Jun 2026 04:50:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 8/9] ASoC: qdsp6: q6usb: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:48 +0700
Message-ID: <20260603114949.149595-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603114949.149595-1-phucduc.bui@gmail.com>
References: <20260603114949.149595-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/q6usb.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 6381b289c55c..ee6de9635342 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -61,31 +61,28 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_usb_device *sdev;
 	int ret = -EINVAL;
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 
 	/* No active chip index */
 	if (list_empty(&data->devices))
-		goto out;
+		return ret;
 
 	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
 
 	ret = snd_soc_usb_find_supported_format(sdev->chip_idx, params, direction);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
 	if (IS_ERR(q6usb_afe)) {
 		ret = PTR_ERR(q6usb_afe);
-		goto out;
+		return ret;
 	}
 
 	/* Notify audio DSP about the devices being offloaded */
 	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
 					  sdev->ppcm_idx[sdev->num_playback - 1]);
 
-out:
-	mutex_unlock(&data->mutex);
-
 	return ret;
 }
 
@@ -203,15 +200,14 @@ static int q6usb_update_offload_route(struct snd_soc_component *component, int c
 {
 	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
 	struct snd_soc_usb_device *sdev;
-	int ret = 0;
 	int idx = -1;
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 
 	if (list_empty(&data->devices) ||
 	    direction == SNDRV_PCM_STREAM_CAPTURE) {
-		ret = -ENODEV;
-		goto out;
+		route[0] = idx;
+		return -ENODEV;
 	}
 
 	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
@@ -227,11 +223,9 @@ static int q6usb_update_offload_route(struct snd_soc_component *component, int c
 				q6usb_get_pcm_id(component);
 	}
 
-out:
 	route[0] = idx;
-	mutex_unlock(&data->mutex);
 
-	return ret;
+	return 0;
 }
 
 static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
@@ -244,7 +238,7 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 
 	data = dev_get_drvdata(usb->component->dev);
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 	if (connected) {
 		if (data->hs_jack)
 			snd_jack_report(data->hs_jack->jack, SND_JACK_USB);
@@ -257,7 +251,6 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 		if (data->hs_jack)
 			snd_jack_report(data->hs_jack->jack, 0);
 	}
-	mutex_unlock(&data->mutex);
 
 	return 0;
 }
@@ -284,12 +277,11 @@ static int q6usb_component_set_jack(struct snd_soc_component *component,
 {
 	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 	if (jack)
 		q6usb_component_enable_jack(data, jack);
 	else
 		q6usb_component_disable_jack(data);
-	mutex_unlock(&data->mutex);
 
 	return 0;
 }
-- 
2.43.0


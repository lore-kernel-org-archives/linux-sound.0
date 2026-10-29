Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271473;
	b=NiJHfSLRZ2yHlFfFdugyx+BprIlN5rx8NDypoza74yBbQvBGpnedTLpHXdzPuzYaT45a
	 XNAaMstmBzWgWDLMx2A4IZ+IHRy6fk/S1sVjURqWqOcuVvWf3Fz2PjIBQ/PxqJZQXaCrj
	 uapwbU8t+DINuYmVNAiNmI8YN92UpNyz/xuY3Lr+NiF2KwHYEp4eubygCt5oSLbsbot5+
	 j9Zj0s+absam58dYjv9zZR3WLnH8lXgV6OsQSQqvN16U1aJInnmehd/VVo2zuNqi7Yd1E
	 uW8b5qWNnSJJ6lNjylqDDZbOfqigX0n52OLdzUJelKSjc+ru8+IUUCBUoL5ZzKlHyUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=601ZkybHQcnvafMGUUE2oSmb4D2juyrdkTa8YoClJ1s=;
	b=ezeGvXEtk9S6xyWVGyqRl5W31PBX3aglRbbPvL0Rx8f0LiDauB1ndVInuoQtnZMm62Sk
	 XZpAZ2DKgM0NNv/knxSdXjS0KmcJnYYGUo6er9nFkf+PWxR3vndJoRbPUASOP0RtbiQCR
	 b2gRg+Y47gBkxASYFCSUPnjLm8M1Svuv9ecr+gS5WwrZs4cY9rTkK9MYedRio0yw7J8jz
	 QX+k1TevBmQLAvkaSgDX9Va8K3DrtwVnF6xCBTUfs6RCBzWwzKQyAAkrOdU2QOIkTIURl
	 bAP3Ser6dal8A6xBm8J7XzYUusMEeB2zE9/2WbBg1QrKcYJv/rnja6par91mjkJndbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyYIWigl;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB8A606A31E
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 10:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB8A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyYIWigl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso13725415e9.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 03:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271471; x=1793876271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=601ZkybHQcnvafMGUUE2oSmb4D2juyrdkTa8YoClJ1s=;
        b=xyYIWigletM3AaiSoW7Gm83b5oZGFoU1gBNWUVWY0uqCrHeYIP4E6XsdyD5y/9CnFk
         CoZuOJQxLbkvlwA5JwOIGgCFB6d1WGtj46QjQszuw9GUWYGx/LFuTBtNKflrDHR0HHmE
         Hjp2xWluDNkY4YfRY2UVdqyPnsbmFrOiYfPiVhZzVUu4Wmh8ZZQBusFWkWzbsqlwLJ96
         wMexiVZZRKkFouJCcSKVGQ6oKZVypkxJfZkaM7mW4pxJYYn2GrArH1eRggEouKRV2KnQ
         ADrVioo9iZSutbOhTkCgJHduvsDPBHO8E4b3WkhkW2bMbeOvwJNPa4mxbDt++kaCEyv7
         zNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271471; x=1793876271;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=601ZkybHQcnvafMGUUE2oSmb4D2juyrdkTa8YoClJ1s=;
        b=jEYHjFZjAq7saH+gLvIKAHaTny0mcXsBfKzsuh4+xV6ThsjM4VIW2KESkt/SAN9o0D
         zG5jOE0MZ909/wr6yUWeiSjS7gyeMmVH/tLhFT7OUPEfY/qFUdl12uztjsnTmC7f/G2x
         RVjGrKJIboNwi5ZA7Fl6NX0BeOH/yXUIgFQLjcpWkyK1gTB4D7ESwxGY6Si4XqPu3kaw
         FbPCntUCrWjTJzbSUu4ola0VcnpufGShgvmlMgUgoKq92+qj9JZeP0bvhNMhQk3gZold
         7+oMmjp/th7CVXrY1EeUaHBlRgHIiGhWE3DTXLvI8nP12PXSST25u0Taen6q1sCB1n9F
         5Vjg==
X-Forwarded-Encrypted: i=1; AKwUvBytAtK7GMzF+xjMuIn4ifeU+tHsb4hX9YYQeMS9DK5ltnsrW4H6ag79Z263RbLs59moPiGyRUxXxpMIxA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ+tCSRDA/RdCccQjHPdLfaZjVYP2+lwOWLRK8D2k18F2INh5L
	0ufFywUMH3AfelgZgto81sHkz1j3fSMjHDnKoCdra/C4W12d22IByxE=
X-Gm-Gg: AYBFou3qyJCX0WEl9nk5sQigFx4I5P1MUcr3/+faVIr+zBZ8NUoBsCfIj8pgCvc6FdW
	2uV0YNMCV7XQylnVnTuyhDzWVOl0pr9s+g8cbqOA6M2scrAqaz8ljE32JpYYpShys5XJ+8oTlvh
	odBbmXsRS9bVLPs4fK7Vdz+8sSZeDORGPGaWwvoM6Yz1E8xTx0XquyaOFH2a8BGmpbP+uyibzLB
	y4t77TcvbYCbcq1V+HOS8q9eNyUQkXjuFOjk0sqLszQP0kdXMabrr5a9nH6ElfMmbH839E/d9BC
	KleNZIrz2bLl0Evk/y2KMASivWJ1TDGZDlip1klupyFUO5EFt5rOm5RC0sv1nRD1JbDqaUensf3
	vqLsRWumt2z7qgqHAiSZ99Rb34hTtshTEICOWdEU4MFeKxcIlFgYuUd1j2Aq90OmMF8m7yVVh6o
	oVrEtCaAv/y3gUA5NgrkThxlAbgIraWttFI5cLDom0zcnc/cUvsUoG9AQHl2RNGBG9ziMH597It
	i1ZlYgf1Pr1EqtUL7szSCT8PRBCkXnkYtUUTcQ7gO1qcN8jpUDjUWGabiZS2qDza+59MOK2Vw==
X-Received: by 2002:a05:600c:a10d:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4a96639b049mr82589655e9.7.1793271471052;
        Thu, 29 Oct 2026 03:57:51 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3c5bsm34266064f8f.9.2026.10.29.03.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:57:50 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v10] ASoC: wm8994: drain delayed works on remove and probe error
Date: Thu, 29 Oct 2026 10:57:49 +0000
Message-ID: <20261029105749.3732334-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029102515.3417777-1-tristmd@gmail.com>
References: 
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

wm8994_component_probe() schedules several delayed works to handle jack
detection and microphone status polling.  If the component is removed or
probe fails after these works are scheduled, they can execute after
resources are freed.

Cancel all pending delayed works in the error and removal paths.  Guard
cancel_delayed_work_sync(&wm8994->mic_work) with a type check because
INIT_DELAYED_WORK for mic_work only runs in the WM8994 and WM1811 code
paths.

Cancel mic_work before jackdet_bootstrap and mic_complete_work because
wm1811_mic_work() can re-arm jackdet_bootstrap through the DAPM power-up
chain (force-enabling MICBIAS2 triggers clk_sys_event which queues
jackdet_bootstrap), and enabling microphone detection in hardware can
cause WM8994_IRQ_MIC1_DET to fire and re-queue mic_complete_work.

Fixes: 99af79dff5a6 ("ASoC: wm8994: Ensure we get a notification on startup for jackdet")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes since v9:
- Reorder cancel_delayed_work_sync calls: cancel mic_work first,
  then jackdet_bootstrap, mic_complete_work, open_circuit_work.
  wm1811_mic_work() can re-arm jackdet_bootstrap through the DAPM
  power-up chain (MICBIAS2 -> CLK_SYS -> clk_sys_event) and can
  trigger MIC1_DET which re-queues mic_complete_work, so cancelling
  mic_work before its downstream consumers prevents re-arming after
  cancel.

Changes since v8 [4/4]:
- Guard cancel_delayed_work_sync(&wm8994->mic_work) with type check
  (WM8994 || WM1811), as mic_work is only initialized in those code
  paths — addresses Mark Brown review comment
- Add cleanup to probe error path (err_irq label), not just remove

 sound/soc/codecs/wm8994.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index fc9894975a1d5..5a493f29c2ca3 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4563,6 +4563,11 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_FIFOS_ERR, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_SHUT, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_WARN, component);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 
 	return ret;
 }
@@ -4604,6 +4609,11 @@ static void wm8994_component_remove(struct snd_soc_component *component)
 			free_irq(wm8994->micdet_irq, wm8994);
 		break;
 	}
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 	release_firmware(wm8994->mbc);
 	release_firmware(wm8994->mbc_vss);
 	release_firmware(wm8994->enh_eq);
-- 
2.47.3


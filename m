Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382525;
	b=w4TEtcnYmfqss+dikXXfT9w34HKXFeMg+At1K60MPpDFhNZVH0Wb7UXrw/3e/rrl8BDC
	 CmKQLTM7ly7VyOBrRGtrJbh2ksrr8RvrJRWWO0PLbNs55fDUT1cDCS1MekJpmbld7Nss/
	 HYJU+xjGEORbS8UQ8lKCSL9Vq6mjZrulQif0FDQOA3J5VRBiBHwohN7b7k8K4He3M6wTh
	 DC4Dw5dUi2dZAns/GaExVkftb4WSt8MCSg5EVet0G8FaWvoPUua+gHbItQW/BdcZBHluq
	 HWZwVDFW6+QtvMgMvLLwNpInL4h2mvbYuaAqDUbWTbEpt0wUCpC4henVHHUmMziwGzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=e5+c9AXhONOxMQgPc6CEGvMQHwLZrqKxnpe3CnRk/A4=;
	b=t/Q0SWYBHeL2kJhQlP1ARyFN52yQ9zGqBbdk8xbUwgf8bL8lg3YeDHAlRt+fWZm+hgIj
	 IwUelyta+KsYT0YZh/90BDH4taP79UevP0TjBry/TRKD5GCIKvxtlhQ/vSYR8SMNSb1tF
	 OeUCASSAZkiNvaqrHSrFsHrkVN+/wu9bH65uQhJ3HxxFND4X10xDaVGydFf7gauP0DSw5
	 yhNLtCEx4n3WyFMnek9ikmOwi/4WlhHVJ3oNPz8bvFJ3q8KqBN+RTQpiep1z+9a/K6N76
	 ujNckrcsZ2RCqZLmJtGN4MvV4BfJMpGmTFkDzR0qI8eOW13VasGTj7C0Zl6XlZ3OgSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BV5ekKLA;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B01F60A261F
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B01F60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BV5ekKLA
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so13215805e9.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 10:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793382523; x=1793987323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5+c9AXhONOxMQgPc6CEGvMQHwLZrqKxnpe3CnRk/A4=;
        b=BV5ekKLAyI6bQJ94BR+NHhbOkaImM8rAugfPQ2zSa9dzkSCFNdMv7xz1OG8bFdY7JC
         xWqF8ieeO0KwXJNVEw20ealfDpq/HqTN1f4XZltm5eEP3ykBIycrMgZ05Kjpa4xlrgy/
         x+CbRWxiD3nn6C3QM+83u5tPbEU4AmoWCPXCo/bNbvCkhRqZ3xOVM3GgySyg9S4Tq0rO
         HbUqBnx4GOduJzdl0hbIEIScyo8aqgnmakf4qvYPJ1gAp0GjGpE+bepYNIJzt+jzu9dp
         PEFaWe4+GOdygU/7zdapjmnbY1Oh5XMwGmAILMdhG8DQh4tpm8eSU7yhUcUp5ezZesch
         6jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382523; x=1793987323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5+c9AXhONOxMQgPc6CEGvMQHwLZrqKxnpe3CnRk/A4=;
        b=AoRfq84mJc6rWi+i9MO+LtSEYzw6GiLQmrVh5CNtUX5E39PPihIzXJLigaRSPdCnUC
         DiBGczTXjMJf047Tgz+8lb2knyQVm+Qrfj+rc7D9rRnzA+qfyGrd0zy8QSb1C1FLembx
         TZpDLHNpiOU/2OSi3yAZxeCD91heWn1tx84p2xDJ8qZUZewVMdtCUuPxnlglYVby64FP
         Xx26LDcIxq1D4V6v6jK30pSfex2szh9oJmoKxFQKiphWQ7DdrjnChYWX2t5w7fFK1L4M
         nHfdTgLxLXrnNbiC24wP6VOaF6mDdQTMY0gGJV8nMW5oGcKHsO0C1nZRdkF9bnkZQV5B
         Dkyg==
X-Forwarded-Encrypted: i=1; AKwUvBzAl1ObV4JrTH/x+o0wwG9MASK8caSR+UuYv7PdwpZL+pWjYoyPnzCcGOYc8tVIkkXmd4tj08LSskk5LQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLoDg+zAMnyWpMbjivsqZvXwA1k15/7lCU5/pU2jHt3w5Mif53l
	zUDrNi1qjlXMWmjZ6q4bW1Q54LVwCh5sBHhuKz+gRD96pYpn+x4wyhg=
X-Gm-Gg: AYBFou36wsPe5f2LdXfoeGwu+bUOKxEc5Q0Jxsx51Jv18syk70O+B4Z/sHwBM9lR/Ne
	ZTzpHSwkR/JIoTb3sKqz+OScz5Iy9B6zQXhQpPqha3tHllaRsUPS2lLt58jTROim3v/Yx60exiG
	6hhEHIjUcI9QkcFrFRhzgWU6Yiwmz8Ryjo9jJAqiGp5ec8SZrrgXJxZ68DxCpSA/ZPzDUnywSkl
	MIujHD7Xr01CQONBbBUphIXtFKjqvgNtNQ6a1HAZ674sXWFJ9p8vnPNoGzc8wZ6DZWE9/LCW9w9
	QCOtTeFhhmKxv7EEDA2nq9VyRWj7220Kp7xDMEbkfBaeVtPGP/Jgv2MLqpBMc9xzgiu83wXsO7G
	CbhMaGoaykYxe3HKTChPwli00MiaFqX4jaXCCiwXo3qfbcwhLgdx18sIw0WLiQ8uTerAnL9l3y3
	iFta1okT6G3PgBCgj0dxJjRqkMAF48jlzKJn2u+XsJTUx2CWk8X9zdPp7rvZa9nGDq7hqRhNBNA
	PFFta3IJPzcbDA4QXqQnOVKXms3iLI9VFginM+owV0YHgzyy8RpnGusMaOHaOu5aTOQkAvMnYr7
	EriKdZXGjI4=
X-Received: by 2002:a05:600c:5d6:b0:49e:795e:ba89 with SMTP id 5b1f17b1804b1-4aa8a0f4e16mr107659595e9.6.1793382523018;
        Fri, 30 Oct 2026 10:48:43 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm4492926f8f.40.2026.10.30.10.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:48:42 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v5 4/4] ASoC: wm8994: drain delayed works on remove and probe error
Date: Fri, 30 Oct 2026 17:48:37 +0000
Message-ID: <20261030174837.1839402-5-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030174837.1839402-1-tristan@talencesecurity.com>
References: <20261030174837.1839402-1-tristan@talencesecurity.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wm8994_component_probe() schedules several delayed works to handle jack
detection and microphone status polling.  If the component is removed or
probe fails after these works are scheduled, they can execute after
resources are freed.

Cancel all pending delayed works in the error and removal paths.  Guard
cancel_delayed_work_sync(&wm8994->mic_work) with a type check because
INIT_DELAYED_WORK for mic_work only runs in the WM8994 and WM1811 code
paths.

Cancel mic_work before and after jackdet_bootstrap because the two can
re-arm each other: wm1811_mic_work() can re-arm jackdet_bootstrap
through the DAPM power-up chain (force-enabling MICBIAS2 triggers
clk_sys_event which queues jackdet_bootstrap), and
wm1811_jackdet_bootstrap() detects a jack and ultimately queues
mic_work.  The second mic_work cancel catches any re-arm from a
jackdet_bootstrap handler that was in flight during the first cancel.

Fixes: 99af79dff5a6 ("ASoC: wm8994: Ensure we get a notification on startup for jackdet")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/wm8994.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 8bf58a6a8af7c..b9e0df83b9bfe 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4551,6 +4551,13 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_FIFOS_ERR, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_SHUT, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_WARN, component);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 
 	return ret;
 }
@@ -4592,6 +4599,13 @@ static void wm8994_component_remove(struct snd_soc_component *component)
 			free_irq(wm8994->micdet_irq, wm8994);
 		break;
 	}
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 	release_firmware(wm8994->mbc);
 	release_firmware(wm8994->mbc_vss);
 	release_firmware(wm8994->enh_eq);
-- 
2.47.3


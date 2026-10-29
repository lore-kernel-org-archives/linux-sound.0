Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309117;
	b=1mwTecZ3G00Lv0Bvll7w2rLS2hE5jJFKhfUtOlCaRQKSZfv20XiYXF5/Ezops/YlBZ5D
	 dPaBrqLtc6nuB+QEoyEkOyzQZE4NSfn0qneo0DxTVBnrYQv4zWwtTb8Vz7AwE3k2r/yCC
	 MsztSsJ4RkzRFFwVKHcRC/bkeZNT6Gaf5s0V5HI+zuyvgdb81muKttnA47upy9dVGCTih
	 qk6iyuwdxEbQUQ3mWCFRgZQXpL/ERMIHs1B/O8d34bgVy+x8LfVVkGB9vcmgdWHxSg3Ph
	 8w3s21msIz+Fg7Aa0iRllDcEh4nBXrzRWwPXd9IauLEQ82h20wSxz5fdfIgIkmyi2Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YsEaBkCIxknBVMj/WhDHccQuJ+3nt9IxBGjxscUMLpo=;
	b=R52ZcjRCe6OmAVjIubpzWylDEmM4cmcGfb8KXLTeTwCqYZ3pSbVmtIWiytm/j1InLQap
	 t8u/CSEoJV2A+L6/iIA/48TStXClHWDml2kkybmST4F2G/chmlHOa+z4hxtXzGhrnR9wg
	 A0pZuoDqQQRvANgdG0ETjhCjPMklJNsCMlMP57jHIqoZUVfn4xwKWevPPIcAq7FHdnjJp
	 FI894454od2+YZRTGrtonGO6EKidnbKb99gT7ZHfMAG8/jds8XhnBV0oYQPibXpW/mz+W
	 NH1L9PQJQviq+7xPzJLeSjFDFrrA2wdVExVfO0PSiJa3NfSzXBEKMzZAaoWSwF+2FsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQ0cWYmw;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2940C606A326
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 21:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2940C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQ0cWYmw
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e0d1da913so50478f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 14:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793309115; x=1793913915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsEaBkCIxknBVMj/WhDHccQuJ+3nt9IxBGjxscUMLpo=;
        b=UQ0cWYmwB3jJfwAG1106aCDhGfB+TsoimabA+dF1hok5/iBCt3JQKmDHk02G/0cmh+
         S1v+KjLNJ8XUQ2ZmEIazHxY8DWuD2guxi8g/zeYUNgINSbaUpVCEFT0Aum8Zu3F6OgLw
         iGKzFHnggWahtTRtD7Z2ar6Nj8irExEQqiEbrtuFIcf+Cpb/cMvG36YAIYghUKt5MbEj
         gdr0CjXCsOI83WApEB/CY0nJIivNhMk+a13p+b08dCGwv5jt89fRJ/1xum+o9tybC/2o
         PA30y1k3ev9gUbJx1t6Tg7/bizxzsnJBHuR/7z89qADMBQl9D3JBpr4kGU58lOqEXDzJ
         NbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309115; x=1793913915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsEaBkCIxknBVMj/WhDHccQuJ+3nt9IxBGjxscUMLpo=;
        b=vU4hmfmyk/yLxgtMS7eMutVePJlgd1lyn6u38+cFxqJOPZ1Mm5lZ5EQAFXJC7avNCR
         LnCoZ9fk7pNRfHg7G3Q+up3/hvblV5ZxjedEo/uglpl4rNu72FmjdkYlB+BT5z6LvmQ5
         XVmDOlg2S5daq0DOYV5XqEvTueao11h3Rt2IsxLbaqdSZPOr9yxOXN7zmhiE1hZaEIgl
         ckNpR6PkLhczUd2RDpl6DkYtrdBKBJCzfiSOMPNs9Y43G9dItcUWwdVPwgR1k7DIqT4H
         kRg1yikZIEUl49Qp4SRQnO/FwReHK02PEhbDeEorPXUvh6ftXcwwiVYg1SktXBPr+l8h
         iH6Q==
X-Forwarded-Encrypted: i=1; AKwUvByuhVw7Mx+SjzbSObmmp7rzpgFETFR1juLddKTN0+s4Jx75JS9mtiAuar+j/qw+WSmQknU1zyUIx6oHZg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJuo9+kJpRKomuztiPUa/AWsJN6+Hz/O24XaTEPObSEHtdiUBZ3
	0AKXzS+K8MWv6u5duYuyS8IoP6Aac0M00xpclUjpLoMIGuuuBcee2l8=
X-Gm-Gg: AYBFou2obMs6rGXOINOYPwFxQa22i7w6szpJAKEDjVxG27QJ8FWUYZvThuVSdbwQDCK
	NeszAUtw4DXlNDVBwUyR1qByQb7wvshA5pYE4hLhf/3c3DwsuCEathLFUn8yzeFYZ+ZH6NTslMx
	0u6KFypkHGr4Gzo8JkIO++Dic873X/FCBXzy61R3dAdaALOFI6CW1yT9+dezpDkgoEi5o3bHvwN
	V+vsC22cWLDySE5z/vZ1LJko5BCdHbtl01Jk0T8YmMLa9xAPuQ8E0DPw48fNuhxGKNjvbDtkYc3
	rrhhdidYtjFnLOogVms6zgA0ELxCtxfYhQFeTRNX8YItVm3LlJXE/WnVhpL2PzwSEkJjQz8Dty0
	mLPNw5i9QyEfKtO9NYuweqbS2uN4lOCl326iHHhA36ZX4jX1RIEkmzG8vdI3k7wHL7UASuTBjTj
	EDymnT0vXyLnJExj4l4mgpZu/dNOuCtkRNOweKjKUWgdlSMM1+SiaovZw+WFkmthdC1+X0nu9Yv
	wtM+Exw8RUFZtr0aRejYr3koBfDZ1BujVU9oT7wH+BCjTJuw4Z4cREqOZ6WZSKo5qO8aV3VEBgt
	C3gC5l8CpnUTpSH8W1k=
X-Received: by 2002:a05:6000:3102:b0:48e:22fd:1ea3 with SMTP id ffacd0b85a97d-48e64d02817mr9721213f8f.28.1793309115564;
        Thu, 29 Oct 2026 14:25:15 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb82584sm714873f8f.27.2026.10.29.14.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:13 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] ASoC: wm8994: drain delayed works on remove and probe error
Date: Thu, 29 Oct 2026 21:25:04 +0000
Message-ID: <20261029212504.2997364-5-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029212504.2997364-1-tristmd@gmail.com>
References: <20261029212504.2997364-1-tristmd@gmail.com>
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
Signed-off-by: Tristan Madani <tristmd@gmail.com>
---
Changes in v2:
- Resend as part of unified series
- Cancel mic_work both before and after jackdet_bootstrap to handle
  cyclic re-arming through DAPM power-up chain

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


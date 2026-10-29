Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269523;
	b=Q7To8ftbv+70dnKAz8haBHnkcD3QEw0m42Pc0GBZxhA5I1rzVzz6eYRzcCAl33l3zkfO
	 xSDbU7DslhevA17lxoYx1caXc8sRs5192MvXTFUhia2BwAFHEcaIGeSmYLRj6982/doxV
	 nhwFonXxvuL+7bwKUX2OtRfeAykZsMTDqV9os6MAHYf/5RxnbNSoODUaa2BsBvwvvGJKS
	 eP99VDrHjzR75ZsZRx0RmAuyY2jVrFZ3Z8xguNxSaabxbsyQwKlp+Go4KOo1v1llz0I6e
	 FDreJHmZ8H7z4a3zSFkgRK1/1849Ukz59re+gafMIOjrgsFQPyu1tqV4GHG/uGG3wfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OtSElUmkgSMBmtpp69kzqh/LAyhlzAFVWeVHo7DNDyY=;
	b=l9oFjzjfCv74+QHbJNsILTAa/EBzfJ+yORayWEMg6BtxLBe8LWXNu/5pSW58Uf5intYv
	 erteph5p5QvTyM7hc7A6XT1wjEXXRp3g8/Ij+EItww9MQJy+VRRwCYOJPxNK+ie/hH+Zy
	 VF3eVsa+l8kQK/wPEaU7YJIjF9PZzq37Px6K9MgpXe6YWeCvWipVo5i5HYnNEk9by7Vj/
	 dCVhv4tbIgPSi1dIbGcs4LqJAX4DswOkbKQI/EMGv5detZgpyHFP/Y4FHNmhU4AAkTGID
	 HyeklZYTudkpK7cIt+8ClpEqdcP6LKtJs/n88blTxFn45JxL3T9lR6KF/L/aH2c4RJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bRbWJS9S;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B968C606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 10:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B968C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bRbWJS9S
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so12255485e9.3
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 03:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269517; x=1793874317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OtSElUmkgSMBmtpp69kzqh/LAyhlzAFVWeVHo7DNDyY=;
        b=bRbWJS9Sq3WUrvm1K5CCDr/2/y8KgqJiqm0xxnpw/ojea8hd/zgAwmJrEL71ITjiqZ
         t4aGIfbQtGFCXTpFU5selcxPoZVOx81+BOYn78zUeUvDXX92flM8Ncdm2ekyE1btDhn+
         xE2vof3zAVSlu0LpRS+SkvNBvrfGH3o2EShZVHeTDrQuPYXRifPOLwmr7TJNBcv76PG3
         VKVW2hDUXmw/+Q1JHgqUL1Uy8jnA1dL0RWSA9Ss/UFFAmOvD0b6it/Yc3FXIxoA5+hZ5
         H5KSat7xyYQQ+6tHt00CexmB3azBzcPyGeXfKUwIKmd7nKBOwScnTDtG4osQsIaGxvqQ
         CJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269517; x=1793874317;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtSElUmkgSMBmtpp69kzqh/LAyhlzAFVWeVHo7DNDyY=;
        b=aA/qDVjE9SNESYt7J89EVTlU09+6TuiZ+ZGSQqcFW8yZaJHhqIKs7T4YRiZl4tEWrm
         /mE5uevplAfAOaQqrIlhl9K9A996Y9wU4/gi8QODcVPl6uchOu8DInaLvZ3P/PHll7nK
         38sytbuduOlG+vfQQwUuD77m/yQCrBhoOkbTFW8NLVx5gNIli1RHIHMdY4n3rBS28122
         g2ndsrQHo9I8mlA0xHMpTp+YEfFUzvimx09qMG5KG5okM1kbT3gBtop//jPz8bpxiYaj
         o+t2QI6Sy2ntcds8TsGIVvZvo9F9DTW9435E9qUdAZV7Vp3pPSzA6FSdFk0sSvIq5Uyn
         3ImQ==
X-Forwarded-Encrypted: i=1; AKwUvByQer1P2wRhsUeEckk2iwvnCa8A+bsZjtyB7XE4+HHOGuF70UDDFnOLrpTd0bBx63eiEM2h/pmImVtMSA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLdaZz4edbI9Q+dGkt+iQski658wdJdvIgpuH8Fqr5QU+2H6lVo
	oE0NW2zdTpgVwOwoKPEVZhrdf2eUaUh34nwPVj+DFKqEBeckMeo7vVY=
X-Gm-Gg: AYBFou3KjGdzcRLU/AbtiNEoo/OBoSatwfFnelcudTBcKAFrbHFMA0IuFP79zNVGoIr
	svgZfvZkpSY0zoqslJZU4XaR2WMwBXhdgbZy02T7kAaMDk594wekoKhrQ49htyFo09zXmF/rAjZ
	R+JX60cq+ckk6e5xuQ45euR7LaQ+y8AJ3iKHxHXrAGsPUmCXd6ojo4h6yw4mBj4e4D8DEYANXdb
	LD1vEgSdhTfF2pwLW+0jagNBkB3N7jMEZs2qOkvb4vfADkWEEJYE3kqFFNJuTEs7IEhpiL35U1/
	nm/3+n6cjBv49t80HqmNPZgyFmlRjGRxp/kG3vWLTiQDXxlr3xfyExB5tAAofNLPfIsWfWhsDoc
	Pou0el4ZXNtiTwYrp8yiVbqlNQff4+t0bljLsFmeZTfShTJ9Mx/+dWHt+FrniPiIQn7adtke7F3
	qQRPrmDl8EE+z8DY/biYD7pWfTTdt0nTBq/12JqGuSnrxq6Cbfk1AuyrKiLqRiceRVhfdYZvr3q
	2SFbkdkKFOs9Q8mZ5Oeuz+cv/qDi0hSOkqv3RF6xird5aVEX9GXPDHXDrqN7bGp1nMFu0boRg==
X-Received: by 2002:a05:600c:1391:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a966c41a4emr112142115e9.9.1793269517096;
        Thu, 29 Oct 2026 03:25:17 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd49afsm34041196f8f.35.2026.10.29.03.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:25:16 -0700 (PDT)
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
Subject: [PATCH v9] ASoC: wm8994: drain delayed works on remove and probe error
Date: Thu, 29 Oct 2026 10:25:15 +0000
Message-ID: <20261029102515.3417777-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026112212.2519775-1-tristmd@gmail.com>
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

Fixes: 99af79dff5a6 ("ASoC: wm8994: Ensure we get a notification on startup for jackdet")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes since v8 [4/4]:
- Guard cancel_delayed_work_sync(&wm8994->mic_work) with type check
  (WM8994 || WM1811), as mic_work is only initialized in those code
  paths — addresses Mark Brown review comment
- Add cleanup to probe error path (err_irq label), not just remove

 sound/soc/codecs/wm8994.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index fc9894975a1d5..30a164796fd48 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4563,6 +4563,11 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_FIFOS_ERR, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_SHUT, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_WARN, component);
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 
 	return ret;
 }
@@ -4604,6 +4609,11 @@ static void wm8994_component_remove(struct snd_soc_component *component)
 			free_irq(wm8994->micdet_irq, wm8994);
 		break;
 	}
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 	release_firmware(wm8994->mbc);
 	release_firmware(wm8994->mbc_vss);
 	release_firmware(wm8994->enh_eq);
-- 
2.47.3


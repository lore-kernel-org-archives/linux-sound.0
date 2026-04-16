Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C6C3B7769
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 13:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345914; cv=none; b=SLF8FU0mhKRTbqsmo870bQykqfN0mbpuj+dU2f+NKjDzo1bZwrHPY6NZvH171NizjKYzJmB3p+eRVY4x/kxA7HVbWnoQ22Ta7KYPh4AqUldwYYAeUiOJ3JuvsY1n7D5c7Xa23Tx2lCiIOC+r8x/yF/fuZLWSXSsAzEl3UMkaebU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345914; c=relaxed/simple;
	bh=IXGjDwTvh4h4KuOXx81DSKXrmdElgn4WOT2+I/2WUvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gDvwpA0m3Tv0VGAd83nSsBa+wxbXxiKAOiKQcbZtwjzJowHSoZR4h69Rm6p10rC477ID2c/JZsX2Pgx3hw93vyNcMPFi6b01LWfJvoB+xlXSx7PxFEVJK24PFmXuT1z+5P0t0KD5fCJsrDzr7UfVuU4ibSCfa2hNZt0JXtJQs9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rzDgFWqb; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rzDgFWqb"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2dee127b3c5so2721853eec.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776345912; x=1776950712; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jX6Ogp1BShOzt1WRlynqsHqsr7PXv7guMEAzRV9ZzCM=;
        b=rzDgFWqb3YKNeToVr2U3tK2mRUnj9bqSR+DoCTmvTRUCeP6T8Rtbfp1Bm0gABu6sVi
         NzxaOEj6X8BYN9ELPdVaIOP2MuhxE4ymUCSPX6hFNSSPtLvgWfjpL/34mZCgkkvUcyXa
         sPn5rpvPVtS4/Cq6219cIy0xx1lMtti+xOyTcRuhlORzkb7r/qnoIZqkpBr44lcz+yKI
         HvBvKRT4iLuzhjMvavw5//F1IJ7ztQXeELQkbFc7eyILuWVtR6nZ1jSpn3mVNbs0MMLs
         BlwwCRY89LQEuXCQdSw875BiG6/TI3ckQDtnkC0Up8Yg8whJR2F6Kfc9R4lrg1yFb7/l
         0JCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776345912; x=1776950712;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jX6Ogp1BShOzt1WRlynqsHqsr7PXv7guMEAzRV9ZzCM=;
        b=nitXwMASsLcPJjn3lCrWyBQukR6whnPfzr7o7D4kzBonrIhqHten3arniESVsRhB/H
         eCGTqaUk/U16ScBDyI0qwLTEcE7S86yf3bzGascZV9qrM4uR9ykxr+LtRf/L+czEtv3g
         DcwovW/fvV1KNsvQt7S5AIAwly89n0VibmirCsBwfHpv+2xXYMYzpYFT6XVfLAVSCYR9
         BDLwm9rpE3IzeD5ujVzPUEteo91wOZMOlMS3M7EUFj/Uk8tgNlsFtgjjjumcbGhaSkCF
         zssCORfm9o2pAakyV6/1CAbrl4aIpTZPCNCQM+Z6vdV301ER2TrZNIqlRVhLl3kfqWm+
         VKgQ==
X-Gm-Message-State: AOJu0YxhC8JuNPT8YHdLcoz7m91iOVDKC/RTY+KyDCkgSF/wQfwSbB02
	sfAvM1oPxolmymBC8+1TOwXSlcMq+l+sPiwzvKykdir3hgpcik4p84u96MYjyJpwkuQ=
X-Gm-Gg: AeBDieucnhAh8HkMEXYv4f9z59by01em5ICEhQmW3mZVwiEjEPkYkmk+zioFX5tTFtG
	oBYDPeShpj9sTLYCDj9/6Qr8O7bYjQqO2loblRQ8nZzsuGXhzkrvn3D3zUtkVlzVl3Br+0rvV0A
	bC3zhCjiEhpmcQuyp1vYjh/us1xgazuO4F1rwNbQFiUmAxJDdGhNEULD7rdMPvnqqPMcrWTlR3h
	7hOQK7X6vRmEuwcBuGocZKMC4Qzg49iy1MPlAKYxQDk/L5XNtV9guK+yV0Nt3F/gBHIAPhCvukD
	u1rvfsshsE1nOc+NyG15UzK+NnSOTWMQ6LzwiAWa+4fy6XR5rvaBGTAY2a8GMzPo9aKXfi3oS9Y
	YBr/ISvd8c/x58HHmnXPMcyIwyuNjVEynPiGfnpHuDKlCuNoshGYbFC6QHojLO0UFK59J6L2+by
	Q0eRVHn1/IPeby4um0oE7Db1Do3mx3Y6RpR6ss/EgEL3sWodjP1f5UWsQTKvMYGwc0PaZ0dwylx
	JmkxoymMjYm5Mg=
X-Received: by 2002:a05:7301:6788:b0:2c0:cc90:a71 with SMTP id 5a478bee46e88-2d5873b3c6amr16502650eec.8.1776345912315;
        Thu, 16 Apr 2026 06:25:12 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c50cee8sm7689556eec.7.2026.04.16.06.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:25:11 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 16 Apr 2026 10:24:40 -0300
Subject: [PATCH] ALSA: 6fire: Fix input volume change detection
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-alsa-6fire-input-volume-change-detection-v1-1-ec78299168df@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQ6CMBBEf4Xs2U1Kg5X4K8ZDga2uwUK6LTEh/
 LsreJuXmbxZQSgxCVyrFRItLDxFhfpUQf/08UHIgzJYY51paod+FI8ucNImziXjMo3lTfhfD5S
 pzyrRdDZdG8he2gCqmxMF/uxXt/vBUrqXrn9+2LYvJfMkoIwAAAA=
X-Change-ID: 20260416-alsa-6fire-input-volume-change-detection-de50b8fe278f
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Torsten Schenk <torsten.schenk@zoho.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2021;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=IXGjDwTvh4h4KuOXx81DSKXrmdElgn4WOT2+I/2WUvQ=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJkPHptwq97XNttRcaBmudR/ebY3/9R0Xn44s1mUSe0Ou
 822ziPvOkpZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAiNjsZ/tn1Pjl7f9Yh2xhD
 s90Ge3NcFN3XTFE9tTgunWVvZ+uxhV8Y/nsbahhHWj2Zks2l4rfM+GXMtnCNycIey76oOSzZ8nZ
 dNhsA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

usb6fire_control_input_vol_put() stores the analog capture volume
as a signed offset in rt->input_vol[] (-15..+15), but it compares
the cached value against the user-visible mixer value (0..30)
before subtracting 15.

This mixes two domains in the change detection path. Since the
runtime is zero-initialized, the visible default is 15; writing 0
right after probe is ignored, while writing 15 is reported as a
change even though the cached value remains 0.

Normalize the user value before comparing it with the cached offset.

Fixes: 06bb4e743501 ("ALSA: snd-usb-6fire: add analog input volume control")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/6fire/control.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/usb/6fire/control.c b/sound/usb/6fire/control.c
index dd25a6407b63..c77a21a9acd7 100644
--- a/sound/usb/6fire/control.c
+++ b/sound/usb/6fire/control.c
@@ -290,15 +290,17 @@ static int usb6fire_control_input_vol_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
 	struct control_runtime *rt = snd_kcontrol_chip(kcontrol);
+	int vol0 = ucontrol->value.integer.value[0] - 15;
+	int vol1 = ucontrol->value.integer.value[1] - 15;
 	int changed = 0;
 
-	if (rt->input_vol[0] != ucontrol->value.integer.value[0]) {
-		rt->input_vol[0] = ucontrol->value.integer.value[0] - 15;
+	if (rt->input_vol[0] != vol0) {
+		rt->input_vol[0] = vol0;
 		rt->ivol_updated &= ~(1 << 0);
 		changed = 1;
 	}
-	if (rt->input_vol[1] != ucontrol->value.integer.value[1]) {
-		rt->input_vol[1] = ucontrol->value.integer.value[1] - 15;
+	if (rt->input_vol[1] != vol1) {
+		rt->input_vol[1] = vol1;
 		rt->ivol_updated &= ~(1 << 1);
 		changed = 1;
 	}

---
base-commit: 10cdf5ba267d89b7fc5d9f693c65a6e4af3f8e13
change-id: 20260416-alsa-6fire-input-volume-change-detection-de50b8fe278f

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


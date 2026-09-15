Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360FC4A386D
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 12:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476977; cv=pass; b=hk7e5bPmAMmNNS4F16Ra9KjCujLC+a5cY+flwa5UhY9KdjxmrzgRqSnBCsjpKcEZZT3mJaKQeB2F8cfzWOxOrGN5DPZAnR928RrvVmn1u7M/Vja80fSaLBwBHN57f1holMOp3Ru8T87XrvRWW6nv8ayljD9Xi5XDfOH4Nk/q6f4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476977; c=relaxed/simple;
	bh=SUV0im6cUJZynb1LfyeHKw/O8Hl/nFJgiIjdg6sKwsU=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=iLWWkkeDXCSjAKJ3QY5D3s8c8zWz+laPA8LtGlUjz2FRISCav2iZsYlm5JgO5fg4JDS9FzhAz4CZt/vsAkjwAZpVm9bVZ3sWX8cMVZXdVGTPFCb95DCIQZRLZK3TiQDn94C2+b9kIWVx8eNpEL28zo5RYwvLe/iFRRg27F2BNmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUCrpo7t; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUCrpo7t"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso2565027f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 05:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789476973; cv=none;
        d=google.com; s=arc-20260327;
        b=l83y1aMyGAG2YjRp/L1utOwPSEubhHD6QuQEyG6tvI8iAgAck3aX4Tr1hvwvJ7EjcD
         IgtY5js9OIWEqU5gj9zKDj6Lh71dK/+1jYyVq526WnrFjmvn7MB5Za8UzhADYZp5q30V
         thLYHyFK0t4e5x0V2XPxAEDicerUkwYcnAJqc5E2v/6GDy8pQWTkyhMFFsRh4V/llvWS
         vTpa1nqhM3/nZ8vqQS6UBgVumK36G4H9LHwbNkQo/doqqfClzDJztcEHH4Y55qv61mqE
         iaASRbr/b6wf5CcTNqsywQT1mnqfg7LM13KISxQ7XvmD4E6dauGeQjV06j/6NUfxe4We
         ynSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=AS5oQrSySIKaVDCX3XX0dhlDwRVG/9tvxOkTEIXGrQ0=;
        fh=VNr6rtkI5hRt3O4SjTAMqsuDQaE3ojVRUBm/THAlY/w=;
        b=L50s6SuvK1F1q2uKsqNRNarSWINXyWkkYEqtmCQ0isUo/t3ViqbXqbeT2MP6I7VwxE
         SDpDD3MBL+Uq7w/bGT/+2sU9qPv0J6KouVwgDB9qyhxz0lSc4wAYoBeJecpkxfeSqOlV
         wiRz2EcKWNgtVYRJfhlMZTLr3ZLL9p2ycxkHMU9L7u9uwFF62EcUDunVOzFw8ghvNkCD
         SPCby4WrU0jtgbm+Tf6pbr7XgvIGgCuB6mhY8ynuvL+83eARyHVc2bAYnQH0Xt0tC0DU
         5eoRtKBfmEUOcFSqSTd3PeWtCDPEDClV0n9R9csSQQhip2RWdBJEGpH03tu+WMg3UwDh
         h2mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476973; x=1790081773; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AS5oQrSySIKaVDCX3XX0dhlDwRVG/9tvxOkTEIXGrQ0=;
        b=OUCrpo7txeeZ+J2Vi+zR1faM+aVMs62Q0A4mN8zkki39xPjv41W2mDYokzBSz7b00i
         Cm0XLH3CDHmdO8oThONTWsb4n7CzKzMII0UVB6d//n275zT8y/Yk39XWMHoYf37mhY0g
         R49Bvb9qoKztFrsKt7RjRDJTJQHXHsTprh3aRvXtqalrTQRuLYuGY8GAj/Yr6ZdvMbaJ
         hjkPJcQVpHp59glN8fwvJwffAmeaxzEBp2cKKNnnB5/jrKkBc+8VGgQ8rUcWkmNyLLhg
         NmtPBNcdOafucqWtDRAhGC0+h1dk7F6i/POQrPngHZovuqprXF2mAkDU2B/8VkvN5WYT
         /89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476973; x=1790081773;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AS5oQrSySIKaVDCX3XX0dhlDwRVG/9tvxOkTEIXGrQ0=;
        b=AA+iTtbdMC4Pv9YTQyPCRSIuQTP5lRb7cvihz/nxfaCn+Ip3il5epZ7Jo84lyIJt0s
         dBkuicSiMnYOF0TIWnHeQKRZdsiPZi2nMCwVu+fsxMKquNnePR/1CECYKA4yD7jxtTrD
         ZVOhkc5Tpi3mK6zKLH6GnZsTd5TZSMYRibiOI8PtgmSZOBRX7vl35t4L+cy1EeCxKPTL
         ES4D8naTYoFfAJBs+6gmkNc2ASb+NnT8rMNfCYHA4K8IVflugu7AnQngortY/LHGbt8j
         AJAoW2ltoQH3QEid8XGxf2boVqCN66I7UuOsj8iVS+UZUobC0GIMb8wTq+qdICK/hMOE
         3tyQ==
X-Gm-Message-State: AFuF++k1QnUcZB3QUNAuH66r3+ax1x0lAzSgvZrCHQz6Vcx0LaDyJ7Pw
	RAIMlZq2JYEN+c+558MyG7/p45KKVZ0vD+BxkDRkNtrGiyUINSsUH2Yfs+sL/uJ2SCMjq2omAGt
	pJDkZWKKN5lXo6yjEj5S+atQ3QWj00E9qS6W3T2+40Deq
X-Gm-Gg: AYBFou18KXrsbDaYU9sdYpkTS9D19Vdn+6UuoKl7hjeURbiqwy7uatFECmn9y4bwq1z
	1xW4+aVz/EKKYbs/W9OdhX1CyzDiTYIWIqmqwqXsgG1PUZMNm99x7MsD9PwmPtvkC5Na40hcHKS
	HzSNfsGulL7UMkqaCP6QVbyx67gmS0SFn9AtPPiNZO6agXorVgvkqVJLvqpqvdLh+Ju6+etgOHc
	dKtTMjUK37RlP9Hc6LgaIsC9ppkMXgwTJmXjDUnCV6cI9IBc+XnViNfgYppyjQ+H6NHZkFeaw3G
	NnslIOBOP80BYoTs+92BoH9M1ApyhU4PII7WgjMA3LCpiQWXJpNrmZ7ZkLow8MMkdA==
X-Received: by 2002:adf:e00a:0:20b0:487:381:efb0 with SMTP id
 ffacd0b85a97d-4870381f119mr12071479f8f.14.1789476972726; Tue, 15 Sep 2026
 05:56:12 -0700 (PDT)
Received: from 830778650420 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 07:56:10 -0500
Received: from 830778650420 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 07:56:10 -0500
From: Ruslan Vagner <rusya92266@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 07:56:10 -0500
X-Gm-Features: AcwNN1UDVo87rbyvZil4lrEF6sXuGofn4YT1S2jgXfd4B2YWHZ8tRYKntYlcdXk
Message-ID: <CAF9RqJ5xANuq+=b2Cfaz42zufDp5f=E_vpncKCO9ap_neqi_ng@mail.gmail.com>
Subject: [PATCH] ASoC: fix comment typos in codecs and atmel driver
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org, Ruslan Vagner <rusya92266@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Fix the spelling in comments. No functional change.

Signed-off-by: Ruslan Vagner <rusya92266@gmail.com>
---
 sound/soc/atmel/atmel-pcm-dma.c   | 2 +-
 sound/soc/codecs/da732x.c         | 2 +-
 sound/soc/codecs/spdif_receiver.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/atmel/atmel-pcm-dma.c b/sound/soc/atmel/atmel-pcm-dma.c
index 7306e04da513..e4b73ae3df4f 100644
--- a/sound/soc/atmel/atmel-pcm-dma.c
+++ b/sound/soc/atmel/atmel-pcm-dma.c
@@ -47,7 +47,7 @@ static const struct snd_pcm_hardware
atmel_pcm_dma_hardware = {
  * atmel_pcm_dma_irq: SSC interrupt handler for DMAENGINE enabled SSC
  *
  * We use DMAENGINE to send/receive data to/from SSC so this ISR is only to
- * check if any overrun occured.
+ * check if any overrun occurred.
  */
 static void atmel_pcm_dma_irq(u32 ssc_sr,
 	struct snd_pcm_substream *substream)
diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index 12d1ac98461e..55b2263d1726 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -569,7 +569,7 @@ static const struct snd_kcontrol_new
da732x_snd_controls[] = {
 		       DA732X_EQ_BAND5_SHIFT, DA732X_EQ_VOL_VAL_MAX,
 		       DA732X_INVERT, eq_band_pga_tlv),

-	/* Lineout 2 Reciever*/
+	/* Lineout 2 Receiver*/
 	SOC_SINGLE("Lineout 2 Switch", DA732X_REG_LIN2, DA732X_LOUT_MUTE_SHIFT,
 		   DA732X_SWITCH_MAX, DA732X_INVERT),
 	SOC_SINGLE_TLV("Lineout 2 Volume", DA732X_REG_LIN2,
diff --git a/sound/soc/codecs/spdif_receiver.c
b/sound/soc/codecs/spdif_receiver.c
index c9766979b1d7..7b4748fc488e 100644
--- a/sound/soc/codecs/spdif_receiver.c
+++ b/sound/soc/codecs/spdif_receiver.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * ALSA SoC SPDIF DIR (Digital Interface Reciever) driver
+ * ALSA SoC SPDIF DIR (Digital Interface Receiver) driver
  *
  * Based on ALSA SoC SPDIF DIT driver
  *
-- 
2.54.0.windows.1

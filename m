Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6733112B7
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 03:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775793287; cv=none; b=r9R1hRSTgunT6sPFz4Ltc5bgyvQAzJCOEeoyKZIKc6J5Vq5NtB3osIt8DzU1spVMBXAs7k22FAHdBTVZYUmalnleO63hJjgKvYXBN9bjN+os7BetHbdLLIGorKjlMJMewUfLRr0nR8f+avRx0B0iepcDTEniDVLJ9AiFC+L+9xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775793287; c=relaxed/simple;
	bh=NQevDX6aOpV6UmASSjzB+c51Bg8F9WPQHySebaud/EQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dngirtQy7Uay8owUAaSFrqG9zM6DZAo2RMKD30UH/sLEqIgoygTR+mDhFzvyJXjc1LLfqf9b7IGPCNc2Iauw212t533Y3VNjVUsMTMLcnFDMRNsO8xpbtUdDUFp9KAX1L/0I9Tn4vnk5fwoJHeTCDflpkIWucxYQYWqfGn5ffBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvEsrkco; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvEsrkco"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso1730387eec.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Apr 2026 20:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775793286; x=1776398086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ld8G5no9kay76nV+1+0Z+Z2eJzqM7fz6h3+04cvMoaE=;
        b=lvEsrkcokvlcISUmi3WWE7jCZgmwtNkE5TzsFCwJroXhQjPFvDSCivTyhgmAODRHPQ
         sNnF9WfQ7g9af9KhSATKEpPeEgoLAy6Adv1WwpBcLEsXDqOstn+NzqTo+6v5OIeRY/q9
         /nRzHYi7bZ2rNJx6u3PtZ2iPZg9JzcjzRJmlWRttkkHiHNI9pLfFV751X6WxmpJySdmR
         +GaFdax0IqFB9quaROSEaHB9Bo4El8ICDAD2K5UMT8MXJaAz31rf3+NzCROO2FEyzVil
         Fb/dpD9nEJvVVLaLrZNCwseJ+dNLZgJQnjlh7xiQWY9QiOtJhVpCjg2PAzxIF0SAJJeo
         nQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775793286; x=1776398086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ld8G5no9kay76nV+1+0Z+Z2eJzqM7fz6h3+04cvMoaE=;
        b=PsYtX1274fTGBup246YUr1rIJJ3NEs2UI8eP+sweFS6fBJczMoQna8G5T+9RSyyn8M
         +Qfe19d4+W396RTx9ZC2kvbcL/MUyerAdhIWeNjdcCx75oD+P7ZXX5i96n/9gSTCVX/5
         NJ/fsvn1yHvFLmRDTCDA3lpYTzlQelXFOBwWEfeALpJNZACG4vJPkfOM2SZAgtWYSyaM
         DlLeaAPYu8V5ESx890qAQ3Hev06XhufuZdEBu/12LAYKSZWMWR+olO/VBtmH+Kyty7C8
         QmhGpkY/3FEFhpzbMh80SQgrcMEjz/aj0U/SzFsFW2bgoRCQ/fLggteZzo7WmLVjwsj4
         1/Ng==
X-Gm-Message-State: AOJu0YzeBb1rgXOegFtfVLNe3wnwJmsfWs/CkwdTXD4K6CYuYpeC55dO
	CcYkIb94fHaOAPUQPCQ63WeXIeky9zTlEWI023gidyWY8Y6yaW/2CGRH
X-Gm-Gg: AeBDietFbtIqkga0pEhTim1dNB4hkXrbNBrI/G/SyBgiOk4qpWW3PykUDmf1p2CNqdB
	M1BEZTQoiZjudkxkoX+FLnqUGNqDi2X/jey7xZoSJqmo4OwqqcZw94kIOe7AnEqMcN6yz4XPUyi
	319iqiijMM+MvsFgEzetyWzjo5lP2XzjPmEVm9K+ydrsGx9e3u02jrCdSXNRu2Ue9TpQklgih54
	FOA+rAywX5j9/zc+Af9gAajNu1bSm0838/LWtV/1dwJhfnQtP68p3B8DCPzUqQfQw5I2KhIw1nQ
	Ymku1v+BiAaZNT+qyU7QpjG2qV+mOCs8PDVNnwKSZGUwL8D8/CVlG4aCkgpcTBXgbyR3byI9LXK
	K9qOEm17q0+p3znRe6YnDdXrMndKdWs8llT/jl3W9kGNoI7rQ21ZDYjEmrt4/jlbw1LdwM6/ykC
	k+8aADsW/SlfymHf/lbJ/yo0Lh1FZ/nLMMd4Sgzi7e0IHWFhEhOSqyzPJYgyHH1aPytjhmXsKaE
	Uxd
X-Received: by 2002:a05:7300:7c0c:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-2d586ea78eamr952859eec.13.1775793285484;
        Thu, 09 Apr 2026 20:54:45 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5632a2a06sm2495371eec.30.2026.04.09.20.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:54:45 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 10 Apr 2026 00:54:33 -0300
Subject: [PATCH 2/2] ALSA: sc6000: Restore board setup across suspend
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-alsa-sc6000-pm-v1-2-4d9e95493d26@gmail.com>
References: <20260410-alsa-sc6000-pm-v1-0-4d9e95493d26@gmail.com>
In-Reply-To: <20260410-alsa-sc6000-pm-v1-0-4d9e95493d26@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Krzysztof Helt <krzysztof.h1@poczta.fm>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2682;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=NQevDX6aOpV6UmASSjzB+c51Bg8F9WPQHySebaud/EQ=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk3SmrrTD9/knCKd58fWicxmbtrSVtBQ8XOggLlZxae8
 66lRP7qKGVhEONikBVTZFmdtMhyT9eDq/VxKzxg5rAygQxh4OIUgIlIcDD8L/yemf8++oTUickh
 uvYRDpHx8yrNNHqvLT9y7EUf52a9t4wMR3wON6osSu+bL/I78R9v8yuTKWHC8Wc+9aZWHg8qfTG
 XGQA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_wss_resume() restores only the codec register image.  The SC-6000
driver also programs card-specific DSP routing and enters MSS mode
during probe, and that setup is not replayed after suspend.

Cache the WSS chip pointer in the SC-6000 card state and wire ISA
suspend and resume callbacks to the shared board-programming helper,
so the board is reinitialized before the codec state is restored.

This keeps the old/new DSP split in one place and restores the
board-level MSS setup that the codec resume path does not cover.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/isa/sc6000.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/sound/isa/sc6000.c b/sound/isa/sc6000.c
index 9949e06403f6..cd3a63c7c2a7 100644
--- a/sound/isa/sc6000.c
+++ b/sound/isa/sc6000.c
@@ -103,6 +103,7 @@ MODULE_PARM_DESC(joystick, "Enable gameport.");
 struct snd_sc6000 {
 	char __iomem *vport;
 	char __iomem *vmss_port;
+	struct snd_wss *chip;
 	u8 mss_config;
 	u8 config;
 	u8 hw_cfg[2];
@@ -646,6 +647,7 @@ static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
 			     WSS_HW_DETECT, 0, &chip);
 	if (err < 0)
 		return err;
+	sc6000->chip = chip;
 
 	err = snd_wss_pcm(chip, 0);
 	if (err < 0) {
@@ -702,10 +704,47 @@ static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 	return snd_card_free_on_error(devptr, __snd_sc6000_probe(devptr, dev));
 }
 
+#ifdef CONFIG_PM
+static int snd_sc6000_suspend(struct device *devptr, unsigned int dev,
+			      pm_message_t state)
+{
+	struct snd_card *card = dev_get_drvdata(devptr);
+	struct snd_sc6000 *sc6000 = card->private_data;
+
+	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
+	sc6000->chip->suspend(sc6000->chip);
+	return 0;
+}
+
+static int snd_sc6000_resume(struct device *devptr, unsigned int dev)
+{
+	struct snd_card *card = dev_get_drvdata(devptr);
+	struct snd_sc6000 *sc6000 = card->private_data;
+	int err;
+
+	err = sc6000_dsp_reset(sc6000->vport);
+	if (err < 0) {
+		dev_err(devptr, "sc6000_dsp_reset: failed!\n");
+		return err;
+	}
+
+	err = sc6000_program_board(devptr, sc6000);
+	if (err < 0)
+		return err;
+
+	sc6000->chip->resume(sc6000->chip);
+	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
+	return 0;
+}
+#endif
+
 static struct isa_driver snd_sc6000_driver = {
 	.match		= snd_sc6000_match,
 	.probe		= snd_sc6000_probe,
-	/* FIXME: suspend/resume */
+#ifdef CONFIG_PM
+	.suspend	= snd_sc6000_suspend,
+	.resume		= snd_sc6000_resume,
+#endif
 	.driver		= {
 		.name	= DRV_NAME,
 	},

-- 
2.53.0


Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D24823ABA8
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864688; cv=none; b=MOlp+Y05HVIEHbCVsyv11Ykk/NJWMeCkRDRqKkuf+Dfy2gxUJO5g/INL8/RUuVXSGfCSbIo6M8l1GsZNW6tV6UYSaGZdRuxQadcCgGXj6uOt1ZHntFj5RfEHBX+Fa4++g6Dk4eG/VpIaQWQdN2L8BWxWVudAyupqBA6JdHzMrio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864688; c=relaxed/simple;
	bh=g94WIdZemflk+5Q1F4Y3kp9tBKG09ebztYM7MASnMIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dvizEvSGbn+mzYQJFXRtXbUSyFMaR5AD/nyLh3aza4fp8y+MFcY9oxIE4cUDN5fMEUwAc9Jka3wrH74XinJXj/HeZDU11uT0Wh7o9RQ+Kf7fTJXncgn/iSaVuAn+5fXk4S2JMNtpbWhDuRu1WVFcJ5oAd+yPUvi8jqFN5xL1Q+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=GJq5zgvQ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="GJq5zgvQ"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 030543FEAC
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776864677;
	bh=J/2SRm1BWzzBNEgb9l5BqievhU03d/3lP1bud/lb9eI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc;
	b=GJq5zgvQ+Pac/0143a0VeyqOsfHPs6uiYQVOhSBlfx6MNRGR3XJ1lZghygeT2WG02
	 FNTIHavKoLByKEogW8SI2fp5eDDjYwDCZjm7MbIbKonHQZQaLM+R/04ezNvDgFvvf4
	 QNIB6i3XWO1nHwHOfU6RyjTIsMNcZ73QMISuKXbOS+xTi39LFPSCFz/vt3Th9hvPWq
	 WPHpY9oRaaXgxXN2ZePPgi+tsByndVI/UJ2HSHlRU/AfRF/p8NM+pVkspCivS1yM7u
	 0hVvj2+ulPVNdX1/yiynuCvwWX4bWHbippAVBtgUvhhk/YM7cJhtKuH0rLm0EsFXpK
	 2vwwIQpzhAWXV+GjcpChOcJcxlnyZiIICktuyhpdc3eXLimY25ywuOywKmArjSEg1i
	 yHFIoGOtqvuGog4GsFUMPPx7vBj2t31gW2RpyMI0f7JoRLZJ8Aw63mZCykTBSSQAAh
	 R+diw1UWY4JgnPCuzcg/JSN9FYXsrko840x41KmET7DN/IxxIWFSdKjrhuUxVfeJpY
	 yEcFGcKMPQ0R2EbQKtZKUNl1R7Qep0FIzfjrO3Tc7aO/Vo8alQe2erqrftX368Z53m
	 UDFbnfkTvvCxVz5pcMKsdXuk2POwcVv2AQOmNtOYni8CzSiKxH/RCYUg14iQVC8rR1
	 t+2Sz8gTP+knXJUvhYiR1ElE=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-488cc31ea57so43594265e9.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 06:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864676; x=1777469476;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/2SRm1BWzzBNEgb9l5BqievhU03d/3lP1bud/lb9eI=;
        b=l7iokMAT72udEuu0eym7g143yQHXsiTxQfsYz14lF7XT5V0UtQ9LyXEvVK7hGRUBM2
         iGR3E7Co1mZI0MRKZys44IvgcphSs93BtwmeUdfoHPo0CWCGVCkPydfb+IVtBLdtuBNa
         X5EAxF9USTdDx9SUEqnQdn68yVl4L3CbtMSo7a+iwBLnrOy8ZfFlz+x3rxiRRAdYeucr
         Rwrz/zh/sFq1VEWcPQeWiV8OVauCiBkl6EUFSAqKkMILERZvz/wftU/9MgdcqvNZe+io
         D5Y5hXbsNdbWfrl23sbiO/mpFVT1RigTi5mNlYcbzRFj0uqqnXGrrQQiUTG0l4ICuzFi
         OrIw==
X-Gm-Message-State: AOJu0Yw5Qf8Ldl/EBLI/j9wEu5rGqpoj066VxpgZYQwNLDYtd86oHEVe
	yugczBUKBo045vga51RsUPXhNXm4b4lrbhzEMax8dOzai46PrPz1tWWi8MXng+4OxmJU/tz1CYG
	T2GW5HVX1msZXbAZkmSrkPYIuiBeTRMvNPVu6Sil/JW+paQnJBGfvgBzbVrfkkcZZcN2lZ3IyhA
	obU196nxKE0v0+W9c=
X-Gm-Gg: AeBDieuHQAArVDDQ/ErUY+52GfjTrFGUQt9XuqMYsH0w3kk/H9pw/6/q1GsOcAPgV9r
	qJr35l4LTE1r+YsS2dsH75I6BNGEGX/o9XWV4TFEqaluV72qW0PvASP7kAxv6EVKGs+oA6H7w5S
	27WgLQYYezR+t+CzlMz7FC83QbQWbaw36UYIFavA9F9iG7S4JEgtxIno2/n0/uDcNYig5c5adUJ
	SERwNpRRRUChJ80uMm48+ugpIedTT8pdO2hSqPdp6JLiaFoRcRJUOWkQ9DrLWTeQoxCNgldLCEA
	+5OLV6xVyiL/AITQpAp47ouHjRb96tkWrj83XxOkTWmpW/OJM3zVLJ1tK5772uDP5/v4eqCK6/O
	S+i5CpaYX1kCyJAgfk94283kx3liFevaaMYGn/iHeJJxt
X-Received: by 2002:a05:600c:8b2e:b0:488:b749:8482 with SMTP id 5b1f17b1804b1-488fb7469b3mr345910215e9.4.1776864676433;
        Wed, 22 Apr 2026 06:31:16 -0700 (PDT)
X-Received: by 2002:a05:600c:8b2e:b0:488:b749:8482 with SMTP id 5b1f17b1804b1-488fb7469b3mr345909755e9.4.1776864675910;
        Wed, 22 Apr 2026 06:31:15 -0700 (PDT)
Received: from [127.0.0.1] ([2001:a61:259e:101:228f:8fe3:f47b:8e2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm310769625e9.3.2026.04.22.06.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:31:15 -0700 (PDT)
From: Tobias Heider <tobias.heider@canonical.com>
Date: Wed, 22 Apr 2026 15:30:59 +0200
Subject: [PATCH v2] ASoC: qcom: x1e80100: limit speaker volumes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-x1e80100-audio-limit-v2-1-333258b97697@canonical.com>
X-B4-Tracking: v=1; b=H4sIAJLN6GkC/4WNQQ6CMBBFr0Jm7Zh2glhdeQ/DopZBJoHWtNhgC
 He3cgGX7yX//RUSR+EE12qFyFmSBF+ADhW4wfono3SFgRQ1qiaNi2ajtFJo350EHGWSGfuGzyd
 WtquJoExfkXtZ9uy9LTxImkP87C9Z/+yfYNao8WIe1hnHTMw3Z33w4ux4dGGCdtu2L6zIe3+8A
 AAA
X-Change-ID: 20260421-x1e80100-audio-limit-f6e75e0ad422
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Tobias Heider <tobias.heider@canonical.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3740;
 i=tobias.heider@canonical.com; h=from:subject:message-id;
 bh=g94WIdZemflk+5Q1F4Y3kp9tBKG09ebztYM7MASnMIY=;
 b=owEBbQKS/ZANAwAKARNJjwMsz+naAcsmYgBp6M2ivmuhRgSi5vtje82PKSC71bssI2GP9oXv5
 odfVqhMF7KJAjMEAAEKAB0WIQSbaT10QIAuim/4A94TSY8DLM/p2gUCaejNogAKCRATSY8DLM/p
 2tliEACfrCjtdsitau9UKrLRDF2w6HYDgnasCyZNLuwgTGg6NDwgZX3SZJnGFhjsoYBge8a1ofR
 M4tPolS7/QVMToR1q0bllDRLCHIi/whYouX2x8ZCwzxaJ35zWmuXoQCdDo5ku1/n0WquOoqPSyw
 X55Mfk7mWlfsWG5Gvy3ijkjbgEypO0UtTx4WE2n07ldg8fVFmjE6WuDob+HeaVNAe7OfPf2Cb8o
 IVPb/yCowhSX8woqg5nvj8wo53YxDk/BZ/+S4zHP7wW5nWnJGGjYICx8+RuLTAyfQy18AqGtYUs
 TdkyeNOai0X2eTO1XICoZxsKeyEPxbJGI4Am6IUJZFsXbtlSYWN2xx3V4vdPkNuCgLgmgD0BXsd
 tRhjv8/kyQrJHlRJ84FqwDESw5cFoNLtFCCi0Hk01l1/4TX4bclVGWS3SS087s5GKFDILX9LAm9
 /kTu/QUoNtIFz+EjBNtOOeIUhXoaVk2n3GPbC0qkCCc8XL0HMX5t5Mji1N1BgQ+OdEEyCnQLFOu
 GalqSQH8M31V+E70AaZhDLtxG+N5u+pE7b0//G7Su32JYecuzVTnh81zBAqrrYUAAoxxqzIJM/G
 9qCuYnjgSNXGfSeCw3gRVGcj3LZu8km5GB2q8rTgTRo6Euzh2kQogjBnqaNoJykVwzHwHKI7nMs
 mR9hgb/IQdTg0Zw==
X-Developer-Key: i=tobias.heider@canonical.com; a=openpgp;
 fpr=9B693D7440802E8A6FF803DE13498F032CCFE9DA

Limit the digital gain and PA volumes to a combined -3 dB in the machine
driver to reduce the risk of speaker damage until we have active speaker
protection in place (or higher safe levels have been established).

Based on commit c481016bb4f8 ("ASoC: qcom: sc8280xp: limit speaker
volumes") which addressed the same issue on the sc8280x SoC with some
minor changes as explained below.

The Digital Volume behaves almost identical to sc8280x since both use
the same lpass-wsa-macro, but x1e80100 has two sets of controls prefixed
with WSA and WSA2.
For PA x1e80100 machines use wsa884x amplifiers which expose a linear
scale from -9 dB to 9 dB with a 1.5 dB step size giving us
0 dB = -9 dB + 6 * 1.5 dB.

On x1e80100 there are two different speaker topologies we need to handle:
  2-Speakers: SpkrLeft, Spkr Right
  4-Speakers: WooferLeft, WooferRight, TweeterLeft, TweeterRight

Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
---
On x1e80100 laptops like the Lenovo T14s Gen 6 most of the audio
enablement work has landed upstream at this point meaning it works
out of the box on any Linux system.
One unresolved problem is that there isn't a solution for active
speaker protection yet and the current default seems to be unsafe.

With the current defaults it is trivial to crank up the volume to
a point where the T14s will hit what I believe is a hardware
protection that shuts down the speakers entirely until the next
reboot. I am worried that this means there is also a risk cause
permanent hardware damage with the default settings.

This patch adopts the same limits we currently use for sc8280x to
x1e80100. With this applied I can't trigger the same shutoff I
described above.
---
Changes in v2:
- Adjusted Digital Volume names as suggested by Mark Brown
- Link to v1: https://lore.kernel.org/r/20260421-x1e80100-audio-limit-v1-1-98bac8cee2ee@canonical.com
---
 sound/soc/qcom/x1e80100.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index a3f4785c4bbe62e7e027deb6d810e0a0275d81c2..c81df41ace8839cf912a55514518f1d8cd3e58c1 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -27,10 +27,29 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_jack *dp_jack = NULL;
 	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+		/*
+		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
+		 * to reduce the risk of speaker damage until we have active
+		 * speaker protection in place.
+		 */
+		snd_soc_limit_volume(card, "WSA WSA_RX0 Digital Volume", 81);
+		snd_soc_limit_volume(card, "WSA WSA_RX1 Digital Volume", 81);
+		snd_soc_limit_volume(card, "WSA2 WSA_RX0 Digital Volume", 81);
+		snd_soc_limit_volume(card, "WSA2 WSA_RX1 Digital Volume", 81);
+		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 6);
+		snd_soc_limit_volume(card, "SpkrRight PA Volume", 6);
+		snd_soc_limit_volume(card, "WooferLeft PA Volume", 6);
+		snd_soc_limit_volume(card, "TweeterLeft PA Volume", 6);
+		snd_soc_limit_volume(card, "WooferRight PA Volume", 6);
+		snd_soc_limit_volume(card, "TweeterRight PA Volume", 6);
+		break;
 	case DISPLAY_PORT_RX_0:
 		dp_pcm_id = 0;
 		dp_jack = &data->dp_jack[dp_pcm_id];

---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260421-x1e80100-audio-limit-f6e75e0ad422

Best regards,
-- 
Tobias Heider <tobias.heider@canonical.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530866;
	b=Kpody9hsl2SP8inM949hnN0n42bM+EAU3RmDpNcShv8ghEH9Vho8SUBjv4s2Vem0vbPW
	 Qc+jkyfUeiZnhZ7VAnH1qvu3tPV025JoeKRtmM+/eT6CSE8bWoYTnDxtdjh7RrF13pp5v
	 feGM1dSER1HjRvb9mCLxf4Ec5PfF2hZ0tLUyUllcoLujTT0u36IlhHZnJJ+H5T63dizYV
	 tfzTYRAu3NWYfCUwxiLoHI1I9aWbW+Coy2V2X5l+bdlfmYXSpU4USnVZhosllM5gu1q+v
	 4FZ6Tg2xkcWdWLp0MKtks4MUhDR3pZBnF8cCm85YpPCz87B85FuBlXvWHUdA8qGndwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yFoQJBScLbNG7UEOvAL1vF5HjM/rH++AY1nmVKgYUV0=;
	b=gqL8hZe/5dfQCuvTj7iZLKBxfU5Xxl7N6ExeBPrr/XUNcOyso0SW4tuDC2c6bytTVava
	 6+VsvR3lERpkjtXOJ7khvhXVidCo26Hc11JwHiwJTDdBWTlGE0KCnMYsFePCR5vyDSzKG
	 xJU26mlF+vBbN28rQLXgYus9jEimVLXjRV3FJPonYGnWVZeyz2JsEakCMw1uk8vYInJ5E
	 if6qVZNd8Sl8T/fqSGpPWJ3JfVxMHhnDrzJHQFg7Sjl3DU1TpOWYQIwfzDUIJKUDf5FmP
	 G0mRkA/bCOsgUHEE94ktrZurqiSPFwQPX/6rW1T0wL3EK+sRI1RqTxBmSo2SA7yssww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEm4mYP5;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B39606A324
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 11:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82B39606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEm4mYP5
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so14626855e9.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 03:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530865; x=1794135665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFoQJBScLbNG7UEOvAL1vF5HjM/rH++AY1nmVKgYUV0=;
        b=PEm4mYP5LftUCcP8yrAYVSWug0PKXLV8f7+pRns5t73OpHXeOi67vjIhpfhLUm93Jw
         IUahjmAeytGANtakNTyLmOt0AA7JvjGqx6f9HYFb5tcRI/ca3YeM410gicEN9SZ6J9rY
         LnG1+PY5AY++lcTrIfdNWpPLmx5+yRshZgLtM/FOTM3Kdx05niG+uADCHQDdKYZ/FtHE
         9754VPFs6/YBbfSXh9lsVnx1zo8NtHf12Bw6qyAQknR7bfdNfsoYY39iU9tBj4dEtOty
         qVEzz1epfBeX+IaINxWTl4UPyPJ1Tvnagla6SkbYVgwFs4IxWmwUSdEswr8G9lF4HM2l
         jKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530865; x=1794135665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yFoQJBScLbNG7UEOvAL1vF5HjM/rH++AY1nmVKgYUV0=;
        b=c9Zka8WtNZs19GD3OiExyRRtDiulDKtasq/OgJ+BlV+oi3vrTIrk41wnEHJ3D/orEf
         Sf5DlQb98ndKxa8QEcypu7mbi4QOu5MVh1OAFdwgq3jPp6bZxJetgbHPQKHIeXVBul2N
         e3jpgQSweepwPlJiM6Hdl91SXzYSaSGQCUneqTz9zaOf1nhstOohA+8bpu6xe3wy9gj/
         FTaQDBHRN6ReL/xub0I3uJ+EQfbxBxB63Qpk3RQiQOMV/GwODzZCe1EKOM2g/3PADz0F
         lismEuF4oCtWVprMn3jdjS3oxoIZKzRT9yo9F2bxETlquHFDY3ethxHIEh9Jp3+xoXZW
         uP5w==
X-Forwarded-Encrypted: i=1; AKwUvBwhT1+lWeOb0XBMCuNpxgTF9zEDhAuyH3RJpuiaZRs8qZaCFTbhEXn+n/darWwxNNvv4l0fPlz1LrrPKg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI/lXFXNCPpWjTHLrmJP8C7RyIGV4HLa11veHXP4srXKiEbjhir
	I4c6ozuqLSAwsSMlZiFqtXScptGAjBOER/xMbWAeZ7PWVB3WoS7mWNVo
X-Gm-Gg: AYBFou0mgeey9tVMm2X742DhxRfWoPsZrGJNb3kxi507I+2QUYYLCnTr3K0PHadWYSj
	MJ88MNSIBwC2zNGQdd4NzeiFbTKO/CvUAYkTBv6nwKJ0AAr3eCaN5+L0ie/XwTzrHwmW/Ufbzbz
	90cfy3ZC9oCVBySKR++rX5+nrOyocsr8ctyRhwRizlkvsnEvb+WesbaYRnVR7TmLp6wY95AUR4H
	3kIfuXeLWmoR6qJU5YPym14Fm5eqsIZ5RBsyOpRf+TbLjahqhxb1OKiFMLkiaZ0iICigCOQkL2i
	mVC8Y7gBRlEAKbB60/Pr3jN3iHqDTNwwGy/JnBrxhhN4izxgd1JE/13+XoHOiVfOw9G2jF11TAJ
	HH+kzl3NurMWGcPeVoWjhgXV1j85YTFUczpiRiTXT6nXC2HfPP3tzoHcpIpIpZaKn8h9+BRIbsK
	TlC6d6Ci6R56iQeySEaKWLSVF9NHuMaJfoItpZYvjGMLM30CLtT9NrA2P/Tkvjeh5lx5vAGrDJb
	Iwoh8MMagrC/1ENxIk3lW0Wlmv0dWAoIUWQ7kKJKz9FdELPVls/OLyGM2fB576cmsStlTNbHiRU
	fju3hLO4T40Y3SiVwzYtIWgbG2xn4MyiYUlbwNptz5CBHXI+3Cs7vo4ZsVG1IUki4Dc=
X-Received: by 2002:a05:600c:4ece:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4ac169d7e39mr163304225e9.5.1793530864868;
        Sun, 01 Nov 2026 03:01:04 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:1f0e:d397:58dc:8e89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm12388432f8f.28.2026.11.01.03.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 03:01:04 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 3/4] ASoC: rt712-sdca: handle HID button read errors
Date: Sun,  1 Nov 2026 13:00:59 +0200
Message-ID: <20261101110056.423353-7-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101110056.423353-5-thnkslprpt@gmail.com>
References: <20261101110056.423353-5-thnkslprpt@gmail.com>
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

rt712_sdca_button_detect() returns zero when a regmap read fails,
so the jack handler cannot distinguish the error from a valid
no-button result.

Return the original error and make the button result signed.
Skip button reporting on read failure, but still report jack
changes and clear button state when the headset is removed.

Fixes: 6c39710da75c ("ASoC: rt712-sdca: Add RT712 SDCA driver for Jack and Amp topology")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Changes in v2:
- report jack state on button read failures regardless of SDCA_0, preserving the original jack reporting behavior

 sound/soc/codecs/rt712-sdca.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 20961e5760c65..08e08ec96bc50 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -335,10 +335,10 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	return ret;
 }
 
-static unsigned int rt712_sdca_button_detect(struct rt712_sdca_priv *rt712)
+static int rt712_sdca_button_detect(struct rt712_sdca_priv *rt712)
 {
-	unsigned int btn_type = 0, offset, idx, val, owner;
-	int ret;
+	unsigned int offset, idx, val, owner;
+	int btn_type = 0, ret;
 	unsigned char buf[3];
 
 	/* get current UMP message owner */
@@ -346,7 +346,7 @@ static unsigned int rt712_sdca_button_detect(struct rt712_sdca_priv *rt712)
 		SDW_SDCA_CTL(FUNC_NUM_HID, RT712_SDCA_ENT_HID01, RT712_SDCA_CTL_HIDTX_CURRENT_OWNER, 0),
 		&owner);
 	if (ret < 0)
-		return 0;
+		return ret;
 
 	/* if owner is device then there is no button event from device */
 	if (owner == 1)
@@ -416,6 +416,9 @@ static unsigned int rt712_sdca_button_detect(struct rt712_sdca_priv *rt712)
 					RT712_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
 	}
 
+	if (ret < 0)
+		return ret;
+
 	return btn_type;
 }
 
@@ -485,6 +488,17 @@ static void rt712_sdca_jack_detect_handler(struct work_struct *work)
 	if (rt712->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8)
 		btn_type = rt712_sdca_button_detect(rt712);
 
+	if (btn_type < 0) {
+		unsigned int mask = SND_JACK_HEADSET;
+
+		if (rt712->jack_type != SND_JACK_HEADSET)
+			mask |= SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+				SND_JACK_BTN_2 | SND_JACK_BTN_3;
+
+		snd_soc_jack_report(rt712->hs_jack, rt712->jack_type, mask);
+		return;
+	}
+
 	if (rt712->jack_type == 0)
 		btn_type = 0;
 

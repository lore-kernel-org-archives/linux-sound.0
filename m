Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350671;
	b=tmBoC+6FEJDW3A+BzaeJU5pdCu0So5hoqIKADhSrbtCNVhYkrm593THqB/U9b0wwIjdf
	 H75o0ddmL9eidnsL7f2q4tXInwdubn+LSs0RGFrl0zAYSk8fZqvYFDd+P9tlCeO+6yPQL
	 RAECl/kS8otjKeRXRaGl27/rJ4p/J79ccKVo+M8FUuS9wZTNJRtre/5yJEGfy7KAHtrLl
	 k6h1k8FJlb+a6DH386gHKkNsYcv6X6lZm0FFtuIsYgi7dPdQu9eNliOFPgFpWoLy4e9Eu
	 XLuGMqMm+JOTfSzFuEFf9oZWQg1ZpkXUs294O+o296/Q2+hoB0Pgzmp4JoAfMZtkIiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A7Q2eiuNxGVv8I3rpEtDldrw4uyQBrqO9v4Ebr2czEc=;
	b=WVIEqVqv6OaN6+2Hwd/0POC8Uqmhn5r4tvBF0k66YLK9pnLs3aRZP0G1s13NeCe0EI64
	 C28TvRzYRuCnp5ltejUyvgttDKzKFXoBMC+pyCyKRjH7ckxCcvfHLeRLBoDR1lCi3KSx+
	 v3wVJaddeVIkTU95xL2drRurDQaJ7GC/rADGAOpAmYbeIDvAuDhA5GzEoGE2YaMzjQYXs
	 ACREhKUNCsB2XQIECgSCiZ4vKw7MOTJgCBmXov9Bo7Kuw0d5LWRk+E8AeJln7yQs2FOX2
	 zpxAZFb702TqhREoe/FzvuxZyQX4Vz1uBa1kBP3qgbKerPTJz7+BQu0+pKdph7tl03A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CfZmQGS0;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF89E606A32F
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF89E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CfZmQGS0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso1612655e9.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793350669; x=1793955469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7Q2eiuNxGVv8I3rpEtDldrw4uyQBrqO9v4Ebr2czEc=;
        b=CfZmQGS0/r8wZuddBKbMPFO407F1wbP/ZyPSnxy2IvME0WuRE562WJP0eGuCM3attb
         m2mOAZlxV6+ztsRXJfN2fTMGIgB3i3TwsbHDMDd36anxKZxDo5nOB5C/WQtZavKG+ma5
         1JhNCa+xsP35QTt1kG58T6aW1lojq4V+qsQqLpJQmkZHLp/HOJbL1mMT+G1/BesRd3lG
         hDbPLlyFlDRS7GtoJF3wABImYqxAl+oYVMmuI8Zl2RWHNm8fzRCSH1uLZnPRTHYA7wJX
         9iFAP++WiJDhB/jnrAkJ07gQiuEZVnd2bY1q21bu+YBorRFqQk1GoFIPhJTbxu89gPKt
         /GhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350669; x=1793955469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7Q2eiuNxGVv8I3rpEtDldrw4uyQBrqO9v4Ebr2czEc=;
        b=lqmc4+0QtK0DeQ4iZvFECE/y3zxE02ye1o0xEjnoBZQ62l2YdzMaFV99h74AMVyuUp
         2VtOiglIJyHfN5X+vM7AOSR/uWXyQzlyH6s39WcO8dQwcMJA83sXfCyUWf6S1MXs42hh
         ih9yt6apmuTYUmIekXY21VElKxRUTmGwVUMPNP17kp3cfWPFb7Ny/6ogsLBN0iRoyqyi
         QbE4CnQJx4wBx1bGjGLPQQEvaz9fZ2QNUPUMy1LukasEmmVcxvd1cKafhetmp+tSnWhA
         SR3eUT2M0R0vw4sRiwdQqwdW/kxqejoU9HEWvX/ADHo4GAaEpxjP1ZedpB5QGBBjX1P4
         xCeA==
X-Forwarded-Encrypted: i=1; AKwUvByk//7c2p7n5o7deCLgVt9RCaac7Hy60eX86GFdkFH60hQ3UDlHGlIfqEbkWjfbzsvHQOFx+77LTmHg3w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLeskvFZwZzYGqk41C9fAN0E4X+/a9fRsZwZYYneKzr15BlChgD
	ItomSFrM/HzU5YM3su84nAz6taGkRxP4tMLKIQEDCBwN2t92RPn/d1cu5rxs5A==
X-Gm-Gg: AYBFou3yAwwlkqhDvxKKhUhiqRZHyI504gXlFV8t0nUA5a684+OqKn4Lv2cJSaUfGxn
	9dGbNgmk+15Z4dbOAMrGfPuHwKctAkl+84BwWArRHhRMA939n2BYduKwmqKolw6vpMLY5+LMWuQ
	t4I+MBG52sHqURdbF3CNLPNXtmyHwbhkmPT/cJzKV08NCVn6loL99KAqGpxdHvE/jYkL6Huridw
	+cfEjGmLZbsATYef+mBfWboCCGFLfGoKwFqA7oJaI5bR+KNxoIqdKH8kjKcE1MTDOGuTIy9jTRl
	SAdynnb4D52vsqBgcNCcka29MeXtZ2K6bJTft+wtNMx15pHF5CRXmkxLzKOz9E5Kkee2RmHAWBQ
	nrtKhIN2ylAOmwNt6Dq/A5lLzQoKA4HIDtxKGMWYcRGZsRL221FEon760Ct9l4gpb/zxdSB/vB7
	Kxxso5OC6G4TjLxCLKpQPRVxV87wOISDsbxAJ8q/4iFzAClfKqHsVdpZNq8LKUtbY3G5NEl5kyO
	xGtnWU2RhAqz9Qj1L1kDNM0wX6bxe0FWXuDpYm5CcDmacV8xTG+/L41Twik2k45YsS2hf51IEQC
	WYZ31BuXBTOg9PnTV2OWCrt76gEnij9szcEEZey9xSfFt8c=
X-Received: by 2002:a05:600c:a012:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4ac17b2ce18mr30335755e9.27.1793350669154;
        Fri, 30 Oct 2026 01:57:49 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:6ca3:c7d9:c03f:68c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad35fdsm28215155e9.2.2026.10.30.01.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:57:48 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 4/4] ASoC: rt722-sdca: handle HID button read errors
Date: Fri, 30 Oct 2026 10:57:35 +0200
Message-ID: <20261030085735.2146047-4-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030085735.2146047-1-thnkslprpt@gmail.com>
References: <20261030085735.2146047-1-thnkslprpt@gmail.com>
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

rt722_sdca_button_detect() returns zero when a regmap read fails,
so the jack handler cannot distinguish the error from a valid
no-button result.

Return the original error and make the button result signed.
Skip button reporting on read failure, but still report jack
changes and clear button state when the headset is removed.

Fixes: 7f5d6036ca00 ("ASoC: rt722-sdca: Add RT722 SDCA driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 sound/soc/codecs/rt722-sdca.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 1dad8012d904e..01f56058cdcc0 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -95,10 +95,10 @@ static int rt722_sdca_btn_type(unsigned char *buffer)
 	return 0;
 }
 
-static unsigned int rt722_sdca_button_detect(struct rt722_sdca_priv *rt722)
+static int rt722_sdca_button_detect(struct rt722_sdca_priv *rt722)
 {
-	unsigned int btn_type = 0, offset, idx, val, owner;
-	int ret;
+	unsigned int offset, idx, val, owner;
+	int btn_type = 0, ret;
 	unsigned char buf[3];
 
 	/* get current UMP message owner */
@@ -106,7 +106,7 @@ static unsigned int rt722_sdca_button_detect(struct rt722_sdca_priv *rt722)
 		SDW_SDCA_CTL(FUNC_NUM_HID, RT722_SDCA_ENT_HID01,
 			RT722_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
 	if (ret < 0)
-		return 0;
+		return ret;
 
 	/* if owner is device then there is no button event from device */
 	if (owner == 1)
@@ -138,6 +138,9 @@ static unsigned int rt722_sdca_button_detect(struct rt722_sdca_priv *rt722)
 			SDW_SDCA_CTL(FUNC_NUM_HID, RT722_SDCA_ENT_HID01,
 				RT722_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
 
+	if (ret < 0)
+		return ret;
+
 	return btn_type;
 }
 
@@ -207,6 +210,19 @@ static void rt722_sdca_jack_detect_handler(struct work_struct *work)
 	if (rt722->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8)
 		btn_type = rt722_sdca_button_detect(rt722);
 
+	if (btn_type < 0) {
+		if (rt722->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) {
+			unsigned int mask = SND_JACK_HEADSET;
+
+			if (rt722->jack_type != SND_JACK_HEADSET)
+				mask |= SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					SND_JACK_BTN_2 | SND_JACK_BTN_3;
+
+			snd_soc_jack_report(rt722->hs_jack, rt722->jack_type, mask);
+		}
+		return;
+	}
+
 	if (rt722->jack_type == 0)
 		btn_type = 0;
 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350669;
	b=Fo3n93J1aTNxCA1smS1Kp2oHNYEELBB6pOrxJyXKMS2biX3f+IsLD9OrumYSK1oyWeKq
	 C/kjLyuTXyal6CkBlyuSx5oBMCHvfrObu1h/x5bHqRgSpxRTOnHFROXDCoFgYyIUFpjib
	 WlMQYFvRxTv43QyyBdW9o8qv3h9YWc3Utp72yW+Hpuu5R5mKBFZrEwehTXOoTG/04LJ/4
	 2DclrigmCIFLJNP7JRJ6U6jwvkqKgdNxkfbG+kI6SaaEcWKzDh7hDFLAjS1HfwbZUjpzX
	 h7LOeZO6pfjFQQF4tTCL0AFECrzfos5a340oH/x9aEFlKPbIeDexxLL2uKfr4Y+08jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YF90ylelAlkCEEL9u3GZ6o1MhuQBnaDtNWLBRblrnAQ=;
	b=rEzLMeeWHD3DSQoPZ65aXPOEABro6ZmkPqakZTunDO0BROedXJUdUGoLI6ZCqqBm/yYx
	 93u1FAKTap+qMwk0q8sFc9dTp59aqIOHIKYTuG5iWIH8qjRoFZhQB7eDllTFB6JkmExd5
	 D5OPG2yJ5a5BM8cYQnZwM84UwX7K0a4nhV7skJZdM5mASM2Ke1/Yp7ey5pn4AeWs9fGP8
	 zelnXvl7m48bb92eyzKsoD4kPP93RxLelqW4b3sgFtSqvdzm6DxG2KIpFoRxEfVvW8GZ0
	 zZ9wBvbUqwsPXuF17TsvxXvQ4Kxtalc2lGqpPTGFTumKFtv9Ivo1pzrGVFMu+oeZZ7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxAZ5588;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69594606A31E
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69594606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxAZ5588
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso4010095e9.3
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 01:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793350668; x=1793955468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YF90ylelAlkCEEL9u3GZ6o1MhuQBnaDtNWLBRblrnAQ=;
        b=mxAZ5588E2lkxqNW/fEqrgNWjA99SiCai/HjLDvh1Z2epyJn3GxjumIb2PWx+9NkFo
         IBuAbDwUmJ+f+VMnStqnjhIB6DiFRRJ/ENiskOIE9uoSatKmuSHTEx4SAGbTvQExnJ6h
         HF1Mx0EBRcMYsfpLL6xfDmjnkZUKirZSnKZRzxIu0DosiRK/TtDlV54Qu642hY+axeMT
         yvodDC1xRdo27iJF6rluxxmyvlsclZ0mDn5DBN/6vrIsMZ9SNxpyQPMAK9Aivpb1xRZZ
         oRgoqT9fsAuOqvQbWQNgiXJLeLaCCRrYBlvDOuhjBhDJKoOIMJH5uDsGCAFytyPxPG4z
         Ez6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350668; x=1793955468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YF90ylelAlkCEEL9u3GZ6o1MhuQBnaDtNWLBRblrnAQ=;
        b=pEVoI4SG0xzPqcycz2bbmmLe+1S7hEQbIlLOLdqfNQtjaOABQG6AU2lL6VE6mkhm08
         4G0wPbIdBzfLo7yvoMYQQa9LTvwVUJNCxQrKMbMSxCqPu4/Myh9Tj/+xu55J4nzfp8ao
         J6NRfEhBU/qHDL9NrYPZba4f1pkkyRZUV+iiS60jqgrJqiyXY5Hat82QA/taNodkE7/o
         wsPr8DlbfoKvQqXAL0IPAXhpd7L7xePXyI5UZmga9RqXan8zRnBPwAgjb8jP/32ze2C0
         kdx/hLFGkdPhnEaNInaOV4XFMhjgAXI6/a95V5Rqn6yZtYV4ZBClWuK/lzsvzKNLwAyG
         ypNg==
X-Forwarded-Encrypted: i=1; AKwUvByuG+a72eDpyyawbcdEDF9fQs0EdE5pHfXhObrJvUxr2FSrJNQ+9BankG5BUIvrmRwSuMGltdKbUmmFrA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLTVu8c/Zz76p1CS2Tf9BP1EQNys7aAiwDlYYk+xx3PUKnVP5TZ
	nsNCsukYlDByad0GlBLhMm7e/vonK84IYyqLcZHZeyQoI8z+r+1lcZCwvj7MIA==
X-Gm-Gg: AYBFou3goDn/ykeRH1WpmyAtA0U39uA+kAqVVA4EonqdAplxZvViK4ZCUKH+Pp5JaGj
	Doq03AwUatQnXn/Molk2RKHwzZprjKejtG/qg5O7ctleKFHdAxi/2evpDSh3uawQVdSyMScPnp2
	1DUIWWRQv4f6sa6gaNr79iio8NpbSIRi08d9kSuSBL5tdhkSICtBiPAxM5YSeaIMHvL/gUSYkrV
	FgaRT2OZDnDTvxcobWG8Zo3g6RZbK064BG1KMuZCXS1J0L15sEq8G992l32foq/yNls1kB6kxjG
	S7wAg9v/zMzaQQlfC3V8v01NwEeUiFt9Prmj8O4G74fsxq0ucIhFeDcjq13cdvHhLDJFwAGuj7D
	Y06NoiC24P5gJmw7WKoYpCSO0zvDUSkq/j0coKRtUSnFKhDlvtIvpqN9SXfi326O69VMaqs7UZX
	JnN58EnTuYHWXeWqvmInfxPIOXMJfbdUrgz2gi8SA5ilGlRpe1H/2WfGD1S98zA6hK/Fj0x2KVB
	XLtvNiSUn5veKW5PzVgBeMThhwjbJzTduQ1YMM3zdqr+0UlfrBiDw1XLPqjkvWIAFLqP+/5LmK+
	SPj3k21ZkiNRYUG3EQflC4vag/dSllgBsfYlQYbUxnmvRQ==
X-Received: by 2002:a05:600c:3f0f:b0:4a2:1612:636e with SMTP id 5b1f17b1804b1-4ac16bc4645mr32553535e9.5.1793350667491;
        Fri, 30 Oct 2026 01:57:47 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:6ca3:c7d9:c03f:68c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad35fdsm28215155e9.2.2026.10.30.01.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:57:47 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 3/4] ASoC: rt712-sdca: handle HID button read errors
Date: Fri, 30 Oct 2026 10:57:34 +0200
Message-ID: <20261030085735.2146047-3-thnkslprpt@gmail.com>
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

rt712_sdca_button_detect() returns zero when a regmap read fails,
so the jack handler cannot distinguish the error from a valid
no-button result.

Return the original error and make the button result signed.
Skip button reporting on read failure, but still report jack
changes and clear button state when the headset is removed.

Fixes: 6c39710da75c ("ASoC: rt712-sdca: Add RT712 SDCA driver for Jack and Amp topology")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 sound/soc/codecs/rt712-sdca.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 20961e5760c65..d4c0a3ac5d61e 100644
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
 
@@ -485,6 +488,19 @@ static void rt712_sdca_jack_detect_handler(struct work_struct *work)
 	if (rt712->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8)
 		btn_type = rt712_sdca_button_detect(rt712);
 
+	if (btn_type < 0) {
+		if (rt712->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) {
+			unsigned int mask = SND_JACK_HEADSET;
+
+			if (rt712->jack_type != SND_JACK_HEADSET)
+				mask |= SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					SND_JACK_BTN_2 | SND_JACK_BTN_3;
+
+			snd_soc_jack_report(rt712->hs_jack, rt712->jack_type, mask);
+		}
+		return;
+	}
+
 	if (rt712->jack_type == 0)
 		btn_type = 0;
 

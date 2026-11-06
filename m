Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982751;
	b=DqCMQH7LAVlALuR82vhBOjZCNMiWSevszXSs2oJSoO0IPT8uRWFt8HavpFkxx+nEW9ow
	 lgaD8bhzwQjDN3pGEXA+jKj13AztBumhyU62njQFYjZU1SLRCRK4hXqsI+r+FHctoVssN
	 UNZDVHHE716bY3W2Fcbmxp56xgfkYiO1ALyqNfb+e/0g6le+EmFZD1WiLCqqa0ONlaUrg
	 OYu7Sd/4XkHbAQKXMRK+EplfkDP7XG5Sl8JtmDCPmAZdrN3cg+uitI223vsTgTmzPKcZr
	 chk0rO/Jk2W24qkU+GPTod71I6eCa03MxhgrdfpvJa/XFduGb4ntB8D3efaR1fCXcLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PLhpD9ccdquyHXvw/JVPQGaivr5kK+qZR5BeQNamL4A=;
	b=MVrpPbRTdIBG4mC4IbeuY8uD81QRJGLmyBkSWqv1DkMVLA+RFnjc/v60WrDhyTvsRqyZ
	 tuWYuJbTRp+rJxqYqY5PaOruvzGPTM+jALFrnHy++5ViE/cp9JbtW6lUtdH+o3miUsQ+3
	 9znt59nIKUGx4bMuFTHL1FXsjdioAsTnve77aszOrI0t6gzb0gEHATi3BV0fsIiQfPHY1
	 GFGeQkbPKklN/U3wD8jKhz492JZXVDICv6hyJUlcfWkBJVv5EzTEcpnBDUgTHSb2+vZVp
	 TMrPnUxR1YCx9TOd6dx88OjJChBQxBRrdOuCIHa/Yz6qG8Rc1AKYGWc3J2wwb+astvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wd2gDNI/";
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D3C606D81E
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D3C606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wd2gDNI/
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6f5a0893610so561046eaf.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982750; x=1794587550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLhpD9ccdquyHXvw/JVPQGaivr5kK+qZR5BeQNamL4A=;
        b=wd2gDNI/+JV11jjBs63iRALRbyoxDRJDGVb5gHVbNYlAjWCtLzN0yrA/zTMApkGwn/
         YwSnYELBy1v0H2vdhrx81XxQmcVKhQKwQHjNQHsP1Zzv6EXGhIzo7wog1oAOVZWIefQw
         /iGLqX3pM4+ExwmzMaMu2+EfTWjDbYHP34PDnmajxzQOaYjryVz8cUlnFounxEIAPoz1
         c8nJCWtRVz735NKpKbw9ulg6kzfayZ9SHYhFFSl3MTfOAunoeB/FMldxqGVYMsCzsjz1
         /cafzugwEVud67cr0OvCfWL1EKHpf/fbQuMcj7B+wpXwlmKkMEPHgNjZDkO31GEmyDHA
         soPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982750; x=1794587550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PLhpD9ccdquyHXvw/JVPQGaivr5kK+qZR5BeQNamL4A=;
        b=H4Oy+dDH5YZiXIP9g5m4HqbIA69s1ngVOSrMuLNxVcYh3swErA5l8zx2APw9ZA4/St
         AJ8KqD02sULwOfiOfmbagTNw2gs0tnfkoBhuKhTogDmEmn0WQW0i4KJxl0vXmAcw3STa
         fzLcrzPw/J2lx4u2qTUAyr8Fx0jhEplb8/N/ZXs+BxNHjeHdIOwNCgmtmd1pvTti9hQ3
         3SnaMLkrFG7sOCwPqrtnMhpR05HMbDtJY97bBywG7Qgzqe4LBGPtf3i6RmN2uCGr8DR8
         ePAiOWSghGFeKuaMdOPR4QW/FiOhxM8Zise1vWAqeQSbV+GvnFx5uUijDLZ7rxdMFJ8V
         K+zA==
X-Forwarded-Encrypted: i=1; AKwUvBwZWplbYW958wEfv5A45NVxM0dX+t3K2YMH8AbQdazqqxs8BbGSsz1RENYH7lFqtW3dPRpgNTKTJMUW8w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+2mBrCDr5u37AipQSI+YRsX18WxG33xTohOVuq66UBxIZuKlpK
	cdg/FzU5j1GCpLeZj+dEZ9QFmLnO2zHYZdhcZLjRzk9Vt+RmU3JTt0DzTrG64g==
X-Gm-Gg: AYBFou1F7t+MwNyfdIbz0Wu54S/nrR6oo5OY6Hizi3vEVLaB+zMsQEEUH89xxADSSYe
	kekVWQTXoD3HGu19J8q7iQchBa7BwQ5KDCsuj3ja2ogBPxZVpd0sOm/LZYRzxcnZ+cuLEu8oE9X
	JvVplTOBQ3cTczND5Snu0ZEZ3WqURwprJieeFlXBzLMmVSSuzVjaRl4KhIoEpZfTgkAUrA4b9JX
	zcAKMuKQG+nkhXikFGCwgNJnQwklq536QSBp2Nf0SHPlTiNS21fHg3SLNhkm63jtiRlHjuTIUxU
	RUDrjMGOjj17ubkrUcYCsVVQI2l2quV5a5H39aSlKjNddWQiSF5voJrd3qt/zv3HPU7dB+4puXZ
	6jN/l1YT5Ko6lYbcJq2FBVlkMS5koT1ERFKmDaK67nVJE+FeY90wDPlzqPY6ANcgCBKHYuTAJ21
	F6mWe5pWHI9xHcayG85JEXRmROXSE+tzVXVoP1t+iuz5VOKz51zLiidWU2MDccP9SBMaQIArCNA
	VP18TqcedDXW5Fo0kOlaIwLiFq5RAvZV4rlqCHR3An3bnprEKFn3N6rPVnwZlfFdoiXsCly9lqi
	vbTkU3Q5SMhH1oXJoThuhd1hORRPkYVKzuPFw3eO9FoAZw==
X-Received: by 2002:a05:6820:428a:b0:6f8:92ab:bb4e with SMTP id 006d021491bc7-716e7750a3amr1705274eaf.6.1793982750550;
        Fri, 06 Nov 2026 08:32:30 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:30 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 06/16] ALSA: mixer_audient: Allow arbitrary boolean control values
Date: Fri,  6 Nov 2026 10:31:19 -0600
Message-ID: <20261106163129.1006907-7-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
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

From: Christian Ruppert <arc@gmx.li>

In preparation of id14 support, allow arbitrary values for true and false
of boolean switches. This also rids us of the tedious invert flag.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 43 ++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 57d856d25271..4b20db9a82e2 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -43,13 +43,12 @@ static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
 	unsigned long flags;
 	size_t len;		/* datatype size, can be 1, 2 or 4 bytes */
-	bool invert;
 	union {
 		int integer;
-	} min;
+	} min;		/* for booleans holds physical int value for false */
 	union {
 		int integer;
-	} max;
+	} max;		/* for booleans holds physical int value for true */
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -65,7 +64,6 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_PHANTOM] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.invert = false,
 		.len = 4,
 		.min.integer = 0,
 		.max.integer = 1,
@@ -74,19 +72,17 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_MUTE] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.invert = true,
 		.len = 4,
-		.min.integer = 0,
-		.max.integer = 1,
+		.min.integer = 1,
+		.max.integer = 0,
 		.unit = 0x3A,
 		.sel = 0x02,
 	},
 	[SND_AUDIENT_TYPE_MUTE_OUT] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.invert = true,
 		.len = 4,
-		.min.integer = 0,
-		.max.integer = 1,
+		.min.integer = 1,
+		.max.integer = 0,
 		.unit = 0x3B,
 		.sel = 0x01,
 	},
@@ -359,16 +355,12 @@ static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 		if (ret < 0)
 			return ret;
 
-		ctl_val->value.integer.value[i] = buf ? 1 : 0;
-
-		if (ctype->invert)
-			ctl_val->value.integer.value[i] ^= 0x1;
+		ctl_val->value.integer.value[i] = (buf == ctype->min.integer)
+						  ? false : true;
 	}
 
 	for (; i < nchan; i++)
-		ctl_val->value.integer.value[i] = ctype->invert
-							? ctype->max.integer
-							: ctype->min.integer;
+		ctl_val->value.integer.value[i] = 0;
 
 	return 0;
 }
@@ -392,12 +384,10 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 		return pm.err;
 
 	for (i = 0; i < hwchan; i++) {
-		u32 buf = ctl_val->value.integer.value[i] ? 1 : 0;
+		u32 buf = ctl_val->value.integer.value[i] ? ctype->max.integer
+							  : ctype->min.integer;
 		int ret;
 
-		if (ctype->invert)
-			buf ^= 0x1;
-
 		ret = snd_audient_raw_set_one(mixer, ctype, base + i, buf);
 		if (ret < 0)
 			return ret;
@@ -485,8 +475,15 @@ static int snd_ctl_audient_info(struct snd_kcontrol *kctl,
 
 	uinfo->type = ctype->type;
 	uinfo->count = snd_audient_kctl_channels(kctl);
-	uinfo->value.integer.min = ctype->min.integer;
-	uinfo->value.integer.max = ctype->max.integer;
+
+	if (ctype->type == SNDRV_CTL_ELEM_TYPE_BOOLEAN) {
+		uinfo->value.integer.min = 0;
+		uinfo->value.integer.max = 1;
+	} else {
+		uinfo->value.integer.min = ctype->min.integer;
+		uinfo->value.integer.max = ctype->max.integer;
+	}
+
 	return 0;
 }
 
-- 
2.47.3


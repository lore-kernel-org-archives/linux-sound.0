Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CCA28850C
	for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 20:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776630702; cv=none; b=OeuYlUUpDzJqj7nm49JorNEwZM1DUeN5pCGMoaEMabeHkWsT2GvWlfYuGRYDyE0YPvjJzMYHwXa1X32kEFxPfcG/b9BFTrQAakYB4UEAkrIYaGEgt7z1x0TiXZyvwO6OIE2NP8WUw4Jc5VXBKU4QpI5/73dHXAWtODWTlVdgvw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776630702; c=relaxed/simple;
	bh=WebseC0n1uvq36U8Uba9vWPPZlTekN/7JlLiJTYMcdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EWygxEZaKoCTZovHqJHJAUc0F0oHqwGheayEAPPku+NqXNjgHj2r7rhC9Z3ukF2p5lQJKQBl1763MgGD3ypwALgthL/ZwWR4jP4AF1DxXsrfJlc/6bI5xVheU89+aQaKZOQ+x6BFQPYChfHjO1x26sdyuQ+4Z3RgSz20v7qZVSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXRoY6pa; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXRoY6pa"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba895adfeaso2508039eec.0
        for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 13:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776630699; x=1777235499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMVw5KmBgRtdu9bTOKibgYALvECPF7cHuMU/74qaZtI=;
        b=UXRoY6pafrvCjE8Oq0jjoChbwJxoII9jVJDkF/m4qfwq5pyHPSAwsWezLXchJloSlH
         LAAHFPV1sRhL6XIeyZN9312Pgb+ySg1wzQlKMDqWjQS8USum6bDaNYCGdJ8DcqWCVv/J
         DJtng5v42t+lWEtbE39TYiMpjzGmmXtGHCcK0jLCvcMRw/3SAshEBeNQt0lWpBGmYxhG
         95YMsGSZtsXTx8ff+z7WXR0stX3duHWT4xU8gFwirRuWBmEIt//XNDIQomvFxDz7nrlm
         tqKpA3yiYYLK/3woMGgysiUgN76dPlBQAqmjBX/akSc4Acyd6eJj3oJEuW5cbGF1XuaF
         mrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776630699; x=1777235499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pMVw5KmBgRtdu9bTOKibgYALvECPF7cHuMU/74qaZtI=;
        b=IeknY2ap8w/Xk8HpEFdlDXPRvzMcuV/zA3TqMuFyQWXNbRT+Xw5ATEMx7kmWq2fPK4
         QlIgV1BLi0k7sTbruEn46XfnW6NJ8M5Za93IOw52iuyJDZnc1tXQbvG0wxCIARNU46qv
         Fdm85fcCcLfPhw+WPWbihyi9gP5+YD4cRD9oSkbZpqWpR8dMUHFPK61zcjSLlmuagaGZ
         SVUU8EAGqAoOOUCaSAhQFV2fbUBTey/DljQbFaVVu+T2MaoYJIX9behgW0Yh/sdXwW+C
         8Kue+tmhmjEUu2fGwJIWnSlZpSUa+i1k9oCh1pRtVk7zWnWTwKse28DxjFBXPLOQ/Cky
         MLAg==
X-Gm-Message-State: AOJu0Yw15FL0MPUImItEqWfY44G4f3TL/IVMFqN0m8aI2mbzSxwW3SDi
	VvCv+gaNAbT27HI0EMldPYpq3lPI7IHTjGYvydliYTcOWMjWclbr8vWI
X-Gm-Gg: AeBDiesCpwk+bNWzrhbR/Hs4MeWKpwIg/j1pHZx7we/iai0UGJl+Iv40YjZbzDDqJi/
	PFcJMZBdmos/XzXnkPaf4O3dmDVUeIUMYlnAAepNqLD5IYa4vrmbvV8NzPQ9LUakOePCD3dmBBD
	3VVeXsOTGXPcZoOjVKWap5p2JS0a1na5TWfi4Q2futObqO5eLYefoo3kVR5QqtlKCb9ifjN77fO
	ox5oCh/irN7cZEhw08ZTG4JpTfN2ePGQPF5XCjBwlL8Mb0Ph4I6KXYs26qazYrOUjNvbcRxPLbI
	XrxLYIkzI5Xda8tWqbCsiFKPIdnH0oC8/0S8pTCUlBZTIXqyhi8vcXJzmUk1EUN19PO3CRGISPe
	NuZMXWGrul9cGLhF+WBcFnup1by/6PZiiRN1k0vTMDVRVHyKbiCbjCERDdkLUwr9sabRFX0nWz4
	A5OQmVEG/NWliY2GW/fy5DyzKVWACXzNZYU/jmjsbKz6cDqmpAYmzipja1qagpfmN2GKAuV/6Dg
	uiSddkZOANDw29YJ/psl652UQ==
X-Received: by 2002:a05:7301:2b07:b0:2cf:3de7:22ad with SMTP id 5a478bee46e88-2e47901764fmr5596867eec.27.1776630698635;
        Sun, 19 Apr 2026 13:31:38 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm11419096eec.13.2026.04.19.13.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 13:31:38 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sun, 19 Apr 2026 17:30:32 -0300
Subject: [PATCH 4/4] ALSA: usb-audio: Update US-16x08 EQ/comp shadow state
 after successful writes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260419-usb-write-error-propagation-v1-4-5a3bd4a673ae@gmail.com>
References: <20260419-usb-write-error-propagation-v1-0-5a3bd4a673ae@gmail.com>
In-Reply-To: <20260419-usb-write-error-propagation-v1-0-5a3bd4a673ae@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Chris J Arges <chris.j.arges@canonical.com>, 
 Detlef Urban <onkel@paraair.de>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5067;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=WebseC0n1uvq36U8Uba9vWPPZlTekN/7JlLiJTYMcdM=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlPrWeJ/N2z4eH3vr+6/Y93lR9f4L+Ja9pB8yrZNQKex
 4MUlzLs6yhlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJxD9lZPh85nk2sySHo86e
 gp9ODstOnTpcsi3J2uzvAq28wF2z7VwYGZ6vmL/6QOei35vn7mRv+y1tvJE1NP8SX/bWDPs1Lf4
 S/xgA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_us16x08_comp_put() and snd_us16x08_eq_put() update their
software stores before sending the USB write. If the transfer
fails, later get callbacks report a value the hardware never
accepted.

Build the outgoing message from the current store plus the
pending value, then commit the store only after a successful
write.

Fixes: d2bb390a2081 ("ALSA: usb-audio: Tascam US-16x08 DSP mixer quirk")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/mixer_us16x08.c | 78 +++++++++++++++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 26 deletions(-)

diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index fcf7dfa4aa84..ebff185cbd2c 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -435,6 +435,7 @@ static int snd_us16x08_comp_put(struct snd_kcontrol *kcontrol,
 	int index = ucontrol->id.index;
 	char buf[sizeof(comp_msg)];
 	int val_idx, val;
+	int threshold, ratio, attack, release, gain, switch_on;
 	int err;
 
 	val = ucontrol->value.integer.value[0];
@@ -447,36 +448,61 @@ static int snd_us16x08_comp_put(struct snd_kcontrol *kcontrol,
 	/* new control value incl. bias*/
 	val_idx = elem->head.id - SND_US16X08_ID_COMP_BASE;
 
-	store->val[val_idx][index] = ucontrol->value.integer.value[0];
+	threshold = store->val[COMP_STORE_IDX(SND_US16X08_ID_COMP_THRESHOLD)]
+		[index];
+	ratio = store->val[COMP_STORE_IDX(SND_US16X08_ID_COMP_RATIO)][index];
+	attack = store->val[COMP_STORE_IDX(SND_US16X08_ID_COMP_ATTACK)][index];
+	release = store->val[COMP_STORE_IDX(SND_US16X08_ID_COMP_RELEASE)]
+		[index];
+	gain = store->val[COMP_STORE_IDX(SND_US16X08_ID_COMP_GAIN)][index];
+	switch_on = store->val[COMP_STORE_IDX(SND_US16X08_ID_COMP_SWITCH)]
+		[index];
+
+	switch (val_idx) {
+	case COMP_STORE_IDX(SND_US16X08_ID_COMP_THRESHOLD):
+		threshold = val;
+		break;
+	case COMP_STORE_IDX(SND_US16X08_ID_COMP_RATIO):
+		ratio = val;
+		break;
+	case COMP_STORE_IDX(SND_US16X08_ID_COMP_ATTACK):
+		attack = val;
+		break;
+	case COMP_STORE_IDX(SND_US16X08_ID_COMP_RELEASE):
+		release = val;
+		break;
+	case COMP_STORE_IDX(SND_US16X08_ID_COMP_GAIN):
+		gain = val;
+		break;
+	case COMP_STORE_IDX(SND_US16X08_ID_COMP_SWITCH):
+		switch_on = val;
+		break;
+	}
 
 	/* prepare compressor URB message from template  */
 	memcpy(buf, comp_msg, sizeof(comp_msg));
 
 	/* place comp values in message buffer watch bias! */
-	buf[8] = store->val[
-		COMP_STORE_IDX(SND_US16X08_ID_COMP_THRESHOLD)][index]
-		- SND_US16X08_COMP_THRESHOLD_BIAS;
-	buf[11] = ratio_map[store->val[
-		COMP_STORE_IDX(SND_US16X08_ID_COMP_RATIO)][index]];
-	buf[14] = store->val[COMP_STORE_IDX(SND_US16X08_ID_COMP_ATTACK)][index]
-		+ SND_US16X08_COMP_ATTACK_BIAS;
-	buf[17] = store->val[COMP_STORE_IDX(SND_US16X08_ID_COMP_RELEASE)][index]
-		+ SND_US16X08_COMP_RELEASE_BIAS;
-	buf[20] = store->val[COMP_STORE_IDX(SND_US16X08_ID_COMP_GAIN)][index];
-	buf[26] = store->val[COMP_STORE_IDX(SND_US16X08_ID_COMP_SWITCH)][index];
+	buf[8] = threshold - SND_US16X08_COMP_THRESHOLD_BIAS;
+	buf[11] = ratio_map[ratio];
+	buf[14] = attack + SND_US16X08_COMP_ATTACK_BIAS;
+	buf[17] = release + SND_US16X08_COMP_RELEASE_BIAS;
+	buf[20] = gain;
+	buf[26] = switch_on;
 
 	/* place channel selector in message buffer */
 	buf[5] = index + 1;
 
 	err = snd_us16x08_send_urb(chip, buf, sizeof(comp_msg));
 
-	if (err > 0) {
-		elem->cached |= 1 << index;
-		elem->cache_val[index] = val;
-	} else {
+	if (err < 0) {
 		usb_audio_dbg(chip, "Failed to set compressor, err:%d\n", err);
+		return err;
 	}
 
+	store->val[val_idx][index] = val;
+	elem->cached |= 1 << index;
+	elem->cache_val[index] = val;
 	return 1;
 }
 
@@ -578,11 +604,10 @@ static int snd_us16x08_eq_put(struct snd_kcontrol *kcontrol,
 	/* copy URB buffer from EQ template */
 	memcpy(buf, eqs_msq, sizeof(eqs_msq));
 
-	store->val[b_idx][p_idx][index] = val;
-	buf[20] = store->val[b_idx][3][index];
-	buf[17] = store->val[b_idx][2][index];
-	buf[14] = store->val[b_idx][1][index];
-	buf[11] = store->val[b_idx][0][index];
+	buf[20] = p_idx == 3 ? val : store->val[b_idx][3][index];
+	buf[17] = p_idx == 2 ? val : store->val[b_idx][2][index];
+	buf[14] = p_idx == 1 ? val : store->val[b_idx][1][index];
+	buf[11] = p_idx == 0 ? val : store->val[b_idx][0][index];
 
 	/* place channel index in URB buffer */
 	buf[5] = index + 1;
@@ -592,14 +617,15 @@ static int snd_us16x08_eq_put(struct snd_kcontrol *kcontrol,
 
 	err = snd_us16x08_send_urb(chip, buf, sizeof(eqs_msq));
 
-	if (err > 0) {
-		/* store new value in EQ band cache */
-		elem->cached |= 1 << index;
-		elem->cache_val[index] = val;
-	} else {
+	if (err < 0) {
 		usb_audio_dbg(chip, "Failed to set eq param, err:%d\n", err);
+		return err;
 	}
 
+	store->val[b_idx][p_idx][index] = val;
+	/* store new value in EQ band cache */
+	elem->cached |= 1 << index;
+	elem->cache_val[index] = val;
 	return 1;
 }
 

-- 
2.53.0


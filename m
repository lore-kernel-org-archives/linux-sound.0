Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336952EA749
	for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 20:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776630697; cv=none; b=TywBK/l95mW/0lfeiGh3d/boqZ7mrUWyVeuUPRrFeCjuRmnfFk+Y6amticDIsAynGYT6SA968So2LfwOlv35wh1PE4nK7j3cT8LEZnbbli0i58PTq5jh59+CR1aeFv8le7vKfSqyBDdnljWPftQr0zKs8MR1APRusKjvOzdp0lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776630697; c=relaxed/simple;
	bh=Sd3lBuRPc4TVt8+YNxlMtKK90gkr9B3jK01uoIEBfEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmeTCDBBkv1G0TOUZliuJODcHn2RA+0GcjM30HctbG4hVAXzUTXuQHqNh1uczPQJlBTqc7+xYK6R4a2IcoHHjZga8v1sUOAmd9b6bQN4vRBP+3wtEW1A9LQ134stoaD9CLplHBiPJKWyh8TUdKjSaPsC9lfRKh6JVL8ETB7kVtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRyj7fpF; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRyj7fpF"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba895adfeaso2508015eec.0
        for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 13:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776630695; x=1777235495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwHh11ZJDmP6iTnoktuVwH7YOEWIPLJREiHNq2gv16w=;
        b=MRyj7fpFe2GtubX72KWC23vnyiG1FfwbHlGd3NFYthnnftpM/yFyo2ymb6M9N4a9/a
         PEiVYfbMHBSp0BHi9EufOMtef2AIyikXr4S2kDnjVGOogPNyB1VHZ5cTrwr8RHZFW7hb
         rl2VSg9cNs6SgII2klI6mWazOE8h+RPCEdSUIvB1cqardsV5INv1NKoTUQcTai0xA4xN
         fWFspxcdskGNG9xybJBMq7omWMqLx0sKJaC146vblJUabHX2XI/lJIF82u6NEcX++lDK
         NAlkDXOo4RtOQf7XmLv08o0hspzQ+GZlzqPSQBOv8PNoN28uURtbvcyYyw6IzZzLRG2M
         mVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776630695; x=1777235495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JwHh11ZJDmP6iTnoktuVwH7YOEWIPLJREiHNq2gv16w=;
        b=Lpq0wwNtTXWVkqJU8ZoltwPYivmLL4zA6yAZAkSBGjCdEPspT89a4ETEJAMmMVjxaB
         0TVAvO9YYq37XHxmYoqCzvPrNzHux0YXnUiprT3mWll8t6WnpGJsYnk5UbO2T75r+/Mh
         w4hvYttztz1OhMt3qDyJb/u5UBF7GIMVK4JNglO/z3/51CT+sa/iN3ZGEL1GT8YSQzkC
         B0uZBz10gPfUhmOKZeQ/50r5SiIX1SEnzCEbe4VcScLfB3ObwJLWd7ocnJEWwg5ONhPl
         98HVeOd6SLskBsu8JSsEqLGbt9vz+NwAPVQk5MVwZs5CU6CLDV4IcCFjEcBYy+BB8AxR
         JYNQ==
X-Gm-Message-State: AOJu0YxDP/IefzNwhX7rzktlNUnZCtxHySqQO5xsZKgyFu+3qyWiLaXM
	KN4/BOK8pvJRLE0ndRhVxuv/NrAtri2mxYkkrVPDD+uFrjRu+tiNb95e
X-Gm-Gg: AeBDietECUYrJflHXJx3KOesM4/RAEeFPLQT7pcuwjV4/verZlrvCEF01l4uI2rkjpK
	8Yc3eUdlEWPIdUXmD7E2fVnNqpy7s05iPzFAxvGrZBotSJZF7sAYDG0WxB9CtLXdef+LvBJjCDj
	JPnXmszNvicNOnQefMeBtxcFxAK0JdeL/jHo6A7fw6RPCv9OvuZ+nmpiR2j+rCC1MjEeNVSC0wb
	KWIacdqrGjh1y/CgEx0f1g3S0rzvxMeDDEG9YjygngJWO7FwGUKgFZrhmxHgSufSXWVOy+Ut+zE
	iXYIhIeal7SQRvudPaS3ezzpdbxxaSSvEtCzP5amVZvbeDtkrMdskzmzMw+SXEa5pbm4qlouL5+
	470szdk9ndeElnKdjigglP+XuRGsfsVIUNeR91JxS02K6Sxxa29AlmOiUqOeIoIDcFAR4S65sMj
	h5hKoqMRroxRNeNmmhTGVU/frqmJQbFxzqZsrzCIsNKkkausmgZtC1wio6kePF2aYnfkn4uQQC1
	7Ewqwb0aM5NnjQ=
X-Received: by 2002:a05:7300:e684:b0:2e2:5bc5:f8eb with SMTP id 5a478bee46e88-2e46538c8b5mr4826430eec.9.1776630695261;
        Sun, 19 Apr 2026 13:31:35 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm11419096eec.13.2026.04.19.13.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 13:31:34 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sun, 19 Apr 2026 17:30:31 -0300
Subject: [PATCH 3/4] ALSA: usb-audio: Propagate US-16x08 write errors in
 route/mix EQ-switch put callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260419-usb-write-error-propagation-v1-3-5a3bd4a673ae@gmail.com>
References: <20260419-usb-write-error-propagation-v1-0-5a3bd4a673ae@gmail.com>
In-Reply-To: <20260419-usb-write-error-propagation-v1-0-5a3bd4a673ae@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Chris J Arges <chris.j.arges@canonical.com>, 
 Detlef Urban <onkel@paraair.de>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3397;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=Sd3lBuRPc4TVt8+YNxlMtKK90gkr9B3jK01uoIEBfEc=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlPrWddWlIdqfDPU5r7iW932Ckmj33VXIwpwdeEm1O1+
 vYtCvvUUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABOZfZCRYWGqqb21JJ/s6r9L
 boaFFNz0VAnmFm1ymuJoydckdvtmKsM/Zav/7QVpvbHrFGew/pywm1lJjGnttQU7MzzfB+73N+x
 jBQA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Several US-16x08 mixer put callbacks log failed control URBs but
still return success to userspace. That hides device write failures
even though the requested value was not applied.

Return the negative write error instead in the route, master, bus,
channel, and EQ switch put callbacks.

Fixes: d2bb390a2081 ("ALSA: usb-audio: Tascam US-16x08 DSP mixer quirk")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/mixer_us16x08.c | 49 +++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index 8a02964e5d7b..fcf7dfa4aa84 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -224,14 +224,14 @@ static int snd_us16x08_route_put(struct snd_kcontrol *kcontrol,
 
 	err = snd_us16x08_send_urb(chip, buf, sizeof(route_msg));
 
-	if (err > 0) {
-		elem->cached |= 1 << index;
-		elem->cache_val[index] = val;
-	} else {
+	if (err < 0) {
 		usb_audio_dbg(chip, "Failed to set routing, err:%d\n", err);
+		return err;
 	}
 
-	return err > 0 ? 1 : 0;
+	elem->cached |= 1 << index;
+	elem->cache_val[index] = val;
+	return 1;
 }
 
 static int snd_us16x08_master_info(struct snd_kcontrol *kcontrol,
@@ -283,14 +283,14 @@ static int snd_us16x08_master_put(struct snd_kcontrol *kcontrol,
 	buf[5] = index + 1;
 	err = snd_us16x08_send_urb(chip, buf, sizeof(mix_msg_out));
 
-	if (err > 0) {
-		elem->cached |= 1 << index;
-		elem->cache_val[index] = val;
-	} else {
+	if (err < 0) {
 		usb_audio_dbg(chip, "Failed to set master, err:%d\n", err);
+		return err;
 	}
 
-	return err > 0 ? 1 : 0;
+	elem->cached |= 1 << index;
+	elem->cache_val[index] = val;
+	return 1;
 }
 
 static int snd_us16x08_bus_put(struct snd_kcontrol *kcontrol,
@@ -324,14 +324,14 @@ static int snd_us16x08_bus_put(struct snd_kcontrol *kcontrol,
 		break;
 	}
 
-	if (err > 0) {
-		elem->cached |= 1;
-		elem->cache_val[0] = val;
-	} else {
+	if (err < 0) {
 		usb_audio_dbg(chip, "Failed to set bus parameter, err:%d\n", err);
+		return err;
 	}
 
-	return err > 0 ? 1 : 0;
+	elem->cached |= 1;
+	elem->cache_val[0] = val;
+	return 1;
 }
 
 static int snd_us16x08_bus_get(struct snd_kcontrol *kcontrol,
@@ -392,14 +392,14 @@ static int snd_us16x08_channel_put(struct snd_kcontrol *kcontrol,
 
 	err = snd_us16x08_send_urb(chip, buf, sizeof(mix_msg_in));
 
-	if (err > 0) {
-		elem->cached |= 1 << index;
-		elem->cache_val[index] = val;
-	} else {
+	if (err < 0) {
 		usb_audio_dbg(chip, "Failed to set channel, err:%d\n", err);
+		return err;
 	}
 
-	return err > 0 ? 1 : 0;
+	elem->cached |= 1 << index;
+	elem->cache_val[index] = val;
+	return 1;
 }
 
 static int snd_us16x08_mix_info(struct snd_kcontrol *kcontrol,
@@ -529,13 +529,13 @@ static int snd_us16x08_eqswitch_put(struct snd_kcontrol *kcontrol,
 		msleep(15);
 	}
 
-	if (err > 0) {
-		elem->cached |= 1 << index;
-		elem->cache_val[index] = val;
-	} else {
+	if (err < 0) {
 		usb_audio_dbg(chip, "Failed to set eq switch, err:%d\n", err);
+		return err;
 	}
 
+	elem->cached |= 1 << index;
+	elem->cache_val[index] = val;
 	return 1;
 }
 
@@ -1418,4 +1418,3 @@ int snd_us16x08_controls_create(struct usb_mixer_interface *mixer)
 
 	return 0;
 }
-

-- 
2.53.0


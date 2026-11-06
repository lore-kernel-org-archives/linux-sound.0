Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982757;
	b=zWhscP883A74qk2PxbOMpVFLqEAnXt0UiSKO9OvD37FIUuVL3JV8ETFCtiYhcJ9w3/Wh
	 uBERbkgvpYrRFQiGePhEftNh1vv1WiG1KGXQiHWyCWElwcbeAXXxDgco0CUQwnNdL5apw
	 VSSasKeiz31ihlIpJdVQlDsCD0bBziifOwz67tBoq9K7DTnJiMlTMHj+DYZmlGPqKBJtV
	 d/5O4xz8H9pGcWz1b0O+cglr3Hm1tKQ8J+7PVHS0mIpuxbuX9inF6CN2o4Vm1NvzDVv4H
	 TxpcTOO5x+3J5ImtvNjUkMfGX779+ObZvmvq8Na6xcbAt3IUi7uaEir+X7D0ShRkueA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fZPF4S1eXtb5KMzO81tc/kIYPQYInWpgG58pvcny4hE=;
	b=q9+/5s7dYbCu1i2xfa+l3Tp4TNgAk/rCZ8tLmmi+2p8VYRSxNjf+mVdOxYuXtsivGhl0
	 E5a36MHNwGYPopTFbFD9hYqO/U64oPTjT0cPV4Ljxd1zSix7shJ45RceO/23o3n/D3yfI
	 z9xjKJUFR3K2xvpPSjn24SVuymgEnKEbutdPiaX7IO59v4KJXdTmYAQiZUZlJIGfB9fq+
	 br8ByTdxwIr/BFLXXF+kI2okmD+lAF71GC/SpxLvcIuFqOpvR4g0gUfTwK1frJ0NMMyhg
	 gT+Zb8mDtxTJI1vX65RV5lo4+vMeb2tVHRY+0oNfv5SKi9rScmXCZCI5jt11Z0Xoazg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x9T8b9br;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A5B606EEAD
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A5B606EEAD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x9T8b9br
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8479f46ecd8so393709a34.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982756; x=1794587556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZPF4S1eXtb5KMzO81tc/kIYPQYInWpgG58pvcny4hE=;
        b=x9T8b9breLB87D1MQZuxv4JAQt/tf+B5Ep+4lKDJObNJxf1k+zGHzVZh13SjcDc0QK
         wpYI//KTLXxfCgFJno0yk5erF8g4lqIjlPhmbEgEP+0A/TWp+PUjSvCIdREqPB70kOt3
         8wVavJYxnT8zcgZNsT0RC8j9MlFruatAOjM8GU9MeEoeVJo2V9vDQuSUGnob+B8lNSZ6
         VXnUiLuUwd0k4dbvZekBd3CGqsq+/3WSOAm1pW4q8n8fjVjErB4hGc1eED7SgmHk/Hrz
         xwoyorb1U8GVB8XaLmrfA7gY+laHw6DBYvGWaBjmf9YFV7S9FJ5EHnC1RXyBxcku6RnE
         0SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982756; x=1794587556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fZPF4S1eXtb5KMzO81tc/kIYPQYInWpgG58pvcny4hE=;
        b=QxzWYCB0NyIKa0t8fnU0hcSuANf8TprenPBzIl6UuUSwgNf2ViBZp8XU19aE6cC6zC
         mH7qLIZ/TY2LXZK0GS3EY1qJ5AXiZuS/xDszZ7Nk3xu2L1/zSMHJrqlhcz8fPR04RD/L
         iq/n4cSHlz/VNFQYA40VbzK4jyAzel99bId9UpwwVbNkV4sxJSI6w1nuw3dP9wfimLAV
         ZMGaZS/kF0hRdwv9wLEnPhoTTMFq3IUXALPYf1+cansN51Dfhp1QD6jspFtTtkBxy4Dh
         yO8O4F7E4Dq9/6MOkRFOLUuqtgsTrxI2iDtMp/YOI6VsbQuSEHmehDI+5lpvqH/fQfln
         daRA==
X-Forwarded-Encrypted: i=1; AKwUvByy/E9BSdnymgPJVkJxVm5zxjwGJAPB9AQrt6sMK5U35H+ifS3w1bmn0AFAFI6TbE/OL5+RZI5U/rASuA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+QGWA5zUWGzH525oYK8KMIF09qpzqu9T3y9vh1celf4+1wdaIl
	AC5Keps2zZt3xULfJ9vtzidGhvvSbgP0737rDj9ZM9S9cd7qtjWfUCHo
X-Gm-Gg: AYBFou1K6VcwhUFh3+ikcVzRQRCe71/4LqtNG8BZdWFdOfeNII/IS6Rwy8RcEZYh/Vp
	uBbMOBMGn0ylKjqD9HgOrC+Ay1OrgNH0qkPbL84ENpinW3vV/uw8zo7lHvVjf/RUL/FEIe3ojwH
	+rj4dcHcHlO6L4G0Hx5msdbGcOFYHwO289Azm66UoL0u1uX6koJJOSRd10e50uRoPltSlXZv0Q1
	cclCA0B3FwRnH5WXlgvZ5ix3IqNpK4QHwTw3gypxnpTK6bwEqM8LI2n+o97p7H6id5WqiI0pD0O
	Q6fRMfcSmyNGoSw7sQb/5S2nGxAsMd40k+Wg2a1UApyZmU5OFBdo5JKPmjpDTQ4iJTakzSPO1yS
	5wjwABHOXoA1YK4DjzHqT/Kef6oPS/FcjrxKzz3SH4lTp71LO5d9QOFet8p+l/jiJ8wKRDXYFch
	epgBg/fV/g+fdZSCDxoXt7f5Mab17KOF74TRxqd9KmReFX1npbTMNyRyiE2shbntn8hdQs7fgLR
	EyNT06XEKd+83PHzQ4VxPrReA4Rmx3unxMM7e15+B0uQEWxlkJI5C6wjlrRlgzoZ9U9pje5jljj
	a5LHjopzG3E2tKIrpVY/fFbKFea8i6T8WqhzeSBTZu20wg==
X-Received: by 2002:a05:6830:4101:b0:844:4959:e856 with SMTP id 46e09a7af769-85f1cf2dfcbmr3191339a34.11.1793982755866;
        Fri, 06 Nov 2026 08:32:35 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:35 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 12/16] ALSA: mixer_audient: Add a step size to integer controls
Date: Fri,  6 Nov 2026 10:31:25 -0600
Message-ID: <20261106163129.1006907-13-mrwillporter@gmail.com>
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

The iD14 level controls use s16 values in 1/256 dB. Expose them in
1 dB steps, matching the volume knob's adjustment. Let a control type
give a step size: the control then counts steps from the minimum, as
the generic USB mixer does with the RANGE resolution. A device value
between two steps reads as the nearest step, clamped to the maximum.
Types without a step size keep the device value.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 55 ++++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index f15f96a8b7d2..c4ce2340f8bb 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -53,6 +53,7 @@ static const struct snd_audient_ctrl_type {
 		long integer;
 	} max;		/* for booleans holds physical int value for true */
 	u32 init;	/* hardware and cache are initialized to this value */
+	unsigned int res;	/* integers: device units per control step, 0 = 1 */
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -438,6 +439,39 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 	return changed;
 }
 
+/*
+ * With a step size (res), an integer control counts steps from min:
+ * 0 ... (max - min) / res. Without one it shows the device value.
+ */
+static long snd_audient_int_max(const struct snd_audient_ctrl_type *ctype)
+{
+	return ctype->res ? (ctype->max.integer - ctype->min.integer) / ctype->res
+			  : ctype->max.integer;
+}
+
+static long snd_audient_int_min(const struct snd_audient_ctrl_type *ctype)
+{
+	return ctype->res ? 0 : ctype->min.integer;
+}
+
+static long snd_audient_int_to_ctl(const struct snd_audient_ctrl_type *ctype,
+				   long val)
+{
+	val = clamp(val, ctype->min.integer, ctype->max.integer);
+	if (!ctype->res)
+		return val;
+
+	/* round a device value between two steps to the nearest one */
+	return min(DIV_ROUND_CLOSEST(val - ctype->min.integer, (long)ctype->res),
+		   snd_audient_int_max(ctype));
+}
+
+static long snd_audient_int_from_ctl(const struct snd_audient_ctrl_type *ctype,
+				     long val)
+{
+	return ctype->res ? ctype->min.integer + val * ctype->res : val;
+}
+
 static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ctl_val)
 {
@@ -470,17 +504,12 @@ static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 		else if (ret < 0)
 			return ret;
 
-		if (val < ctype->min.integer)
-			val = ctype->min.integer;
-
-		if (val > ctype->max.integer)
-			val = ctype->max.integer;
-
-		ctl_val->value.integer.value[i] = val;
+		ctl_val->value.integer.value[i] =
+			snd_audient_int_to_ctl(ctype, val);
 	}
 
 	for (; i < nchan; i++)
-		ctl_val->value.integer.value[i] = ctype->min.integer;
+		ctl_val->value.integer.value[i] = snd_audient_int_min(ctype);
 
 	return 0;
 }
@@ -502,7 +531,8 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 	for (i = 0; i < hwchan; i++) {
 		long val = ctl_val->value.integer.value[i];
 
-		if ((val < ctype->min.integer) || (val > ctype->max.integer))
+		if (val < snd_audient_int_min(ctype) ||
+		    val > snd_audient_int_max(ctype))
 			return -EINVAL;
 	}
 
@@ -513,7 +543,8 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
-		s32 val = ctl_val->value.integer.value[i];
+		s32 val = snd_audient_int_from_ctl(ctype,
+						   ctl_val->value.integer.value[i]);
 		int ret;
 
 		ret = snd_audient_raw_set_one(mixer, ctype,
@@ -542,8 +573,8 @@ static int snd_ctl_audient_info(struct snd_kcontrol *kctl,
 		uinfo->value.integer.min = 0;
 		uinfo->value.integer.max = 1;
 	} else {
-		uinfo->value.integer.min = ctype->min.integer;
-		uinfo->value.integer.max = ctype->max.integer;
+		uinfo->value.integer.min = snd_audient_int_min(ctype);
+		uinfo->value.integer.max = snd_audient_int_max(ctype);
 	}
 
 	return 0;
-- 
2.47.3


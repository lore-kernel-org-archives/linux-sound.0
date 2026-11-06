Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982753;
	b=XMC9GYOP/4I1lqTCwvrdsJZH4a5O8MGzgTTgo+S7gPi/6AOz0CE+U0GgDPffehDnkyx6
	 f0ZiJGwdBPmfnbtDmPzytU6p8mP95LCkYFoawr93gYxJDPrgr3tlTjoN73OOYdtfhRr8j
	 7qPmsyngtyEjfdCEr5A4qya/Bibf1E0puBIb4rXhVs7VeB1MqZVJxuSLamXGsiHWku9vI
	 00HlD/419eqVLUGl/CbMgJrrIG4zFq+Y09OZy62pJZoo8cG0tpr0NfzHGHHiQVOz7blGR
	 85nUB+SCHjtQeGo+YZFbyqkvrgftlMjIf09UzMgP0fddz8fTFRfVIbxiqrhQe5scj3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DnSiCHS57/5NeVGNSfvi5weTMPVYKrlFxAEl/9lABc0=;
	b=bbTBZmGKOoZ/td3F93TB+hs/AyC5oj9jKJQCFFvnHQC2XicNiKBO1veciNg+wlTXLESD
	 oqpQJe3+qHZz5o8r6rr7P2i/mgsJXihqS/rLS/dGB+LJtNPYnEPzpiBrpzrmms7NarkeC
	 eh9hQLxJwO4ZEeE4OVJPm8HwQl4SAxO5ZpSC42etRXvhct/7p7KyEubySWoEIiiI3I+Dr
	 z1mdyKZLnkQwBjq80F4RuIPcLpI0k8OzvQJ7s0ynZO3TMP66guVyCWAtHxfSNCYfyU8Yr
	 pFpzPNY6OGQT71zuBHDAhsN32Ps9o/JIIXaD4g9lQaOH2EDmd+cqyz+KlA63M+MXMtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKmURR3Y;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C144606A335
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C144606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKmURR3Y
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-843a4ca671eso367631a34.2
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982751; x=1794587551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnSiCHS57/5NeVGNSfvi5weTMPVYKrlFxAEl/9lABc0=;
        b=fKmURR3Y8bzdTsTHRtYKNCAdRwxxuX2OL1P79AJLyIpUpGnztdb1gPfHVcd/+nAxwk
         X0bk4fBiCmF7lZNpJ2qk2x0FT8JQno8Z6roFRuIbqWtPkTsLAdGRyJdR3TXPf1Ab0MFx
         8Pqbu/h23EtfQkyC7prb8IYEpYSN5WS8UmYx/7DE5BOHRfwcAoIFecHrsAB6FqHAm5FC
         Vnmo2bCn0QrJuk04+DoFmOtBLZ8u3A2ARaLNuSLuSOhEadjTXIZ00FnCPj20OimWREZL
         9RD3/NQ9PE3cGRXekRfrhbXWDkO53VhvzKXSH2HsXY6zjamarjBRSr8wic4TA1nyhSVP
         ED+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982751; x=1794587551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DnSiCHS57/5NeVGNSfvi5weTMPVYKrlFxAEl/9lABc0=;
        b=bBn9OaYIRwWjtLF6O0k2EFF4nT5LQPBNVu99vPJ5KoMiLirxcIEIRdPiRYvm/M5c+F
         jO7eR8PTXQQGUZNxGqdbCgKjcomsnMzdnLKefLORUC+dfrN2YQmiaggoy+QHhEe0ivTk
         UBkH8OHgAZS8XQ86ubEKAe6aPUMHZ1hs90OsPcYnpbEHGtPqBURtC07NvdrctQWtTiy4
         8uD1rTra/hJLKybc6s5mnCm4cc3jdShnSV00Jv8GGg3+EpmIM+d8/huf68OcS7E/j6+l
         MWTDJC44/6u51WxiszUyZ9AvXye0XjAbfpNseFBI1rOWx5mwSfmCRS9bOEbOewJL+YNQ
         EN6g==
X-Forwarded-Encrypted: i=1; AKwUvByKFe5MMfxG4gxOFoVdWjdXtWB57le4j9tOGe22lt9ZR4gsFDf8ydZD4cwQrCG0f5AF/U2fJXE1A7zakA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9nsmJ4dd2DDt0pkp4t/E4yLS2GSOimcMYhg4ZkVnSkcUVUhunz
	HYVYw/NjryjDZ5B1rpAozwijbMK8ywiNyp2GU47k8X1tDOXITMHVrFsu
X-Gm-Gg: AYBFou3OhU861KL6Gf9HlCiclzZrLC4bowENghN1SHaA8eZJiQs7kjXeDkV0DPVtdFq
	CIGm3STrNg/3qpb5TvS+hjktXvZe24NmLpnZsIONRMbQx9VeULIK0hn8ZpCfgwqpzk6kjRMnrk/
	9Cc8lmz7XoHbAGOJMimdZJUykA1gVYG/+Qgecr/B0UV2IY01o9BMiTX+uIcYHddQ7Kw7E9np0ey
	xfCHmZZP+UIonx6N8dS+P7XTfKH4lmKkh+p4wxhyn7SR2bCLK2MvAG3KS4uE+WMaGFyC0NknMOb
	zwIJY/c9QMAgm0HJi/Gwnr9iSa1jLoFgeYb/UBdilSACGdesaz76OI8TzSMFtfWhjKirR4Wz8qB
	wB76+gFxu/AGwUfrEtLI00VNhh5sEyWh7yGInV9WYDJnRQUcNWdt/6CtC8oQBDsVIV49s9YdNgm
	y2cpvIWWNPYguPx4XYtcTRNvO3mDoUJKjYm6yZFZ8/dNHT/EfObyBPXsxbq48T6uQ3Mf4F6BrtR
	BQvxrswVLEQUWEtNbJSRSX5vNpuMPfeTMv7n2REa3g0btQbua1VjXKFmO7PJ0lmPDrZ0+JrbI1U
	kmRnfzuRKshA0rXbO9nV9N6Jju5ysariwp/C45HhX9BZ57I=
X-Received: by 2002:a05:6830:82f4:b0:81e:abb6:749f with SMTP id 46e09a7af769-85f1cee7892mr2866810a34.8.1793982751368;
        Fri, 06 Nov 2026 08:32:31 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:30 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 07/16] ALSA: mixer_audient: Add integer range checks
Date: Fri,  6 Nov 2026 10:31:20 -0600
Message-ID: <20261106163129.1006907-8-mrwillporter@gmail.com>
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

Add range checks to integer parameters to improve error management:
- Reject out-of-range write attempts with -EINVAL
- Prune out-of-range values returned by the device to the range limits

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 4b20db9a82e2..433bb5479d8e 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -44,10 +44,10 @@ static const struct snd_audient_ctrl_type {
 	unsigned long flags;
 	size_t len;		/* datatype size, can be 1, 2 or 4 bytes */
 	union {
-		int integer;
+		long integer;
 	} min;		/* for booleans holds physical int value for false */
 	union {
-		int integer;
+		long integer;
 	} max;		/* for booleans holds physical int value for true */
 	const unsigned int *tlv;
 	u8 unit;
@@ -425,6 +425,12 @@ static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 		if (ret < 0)
 			return ret;
 
+		if (val < ctype->min.integer)
+			val = ctype->min.integer;
+
+		if (val > ctype->max.integer)
+			val = ctype->max.integer;
+
 		ctl_val->value.integer.value[i] = val;
 	}
 
@@ -448,6 +454,13 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 	int changed = 0;
 	int i;
 
+	for (i = 0; i < hwchan; i++) {
+		long val = ctl_val->value.integer.value[i];
+
+		if ((val < ctype->min.integer) || (val > ctype->max.integer))
+			return -EINVAL;
+	}
+
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
-- 
2.47.3


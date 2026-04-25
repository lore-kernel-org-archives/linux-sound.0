Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFA41A6813
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 00:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777077878; cv=none; b=t8R0heTvsij5LS6A4dRC240jyu703sGbYCPcoM1d/9jUuIAhgHw3818PJDZGjuAlKAbZTFz1IHS4ArE8autY8cEEv1S+6ITI8zbMA2FA/B3gmErZYf8ADi3Al9/kUKQCFLaaxpxgUBrA2sCv4Pm6rbKoRCvwvviyJfOO8btxqb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777077878; c=relaxed/simple;
	bh=e4tOpu0LbNNGF9iKe0Fx6Ayli0jihvKbR4O8mx1wFnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fp/tmAH7fCPooDrsTGhPu9pMKTjLXNfn9vWopYaE90LpjS7QZFdkUdEhnlgxptEbt1+JnPsHRW0M1s3B7xmHlDmRzUEseSTJN1L/HOXfh3Inp/3q7wGIZ96w0Ojw6r9PC9nmlQJfnQY6ieNOysDIpAt+zjtC68dSY2ECkJHpRvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Al/HEIKM; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Al/HEIKM"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f83bd32efso6418058b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 17:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777077876; x=1777682676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeLK2D28kWbvQeOXcDdKQJ3UJRWDE+NdXZ6b+JbOcrQ=;
        b=Al/HEIKMbMgdXyAMOGOftAkRgjVISUFty8BQxclA68P8HewNJiIcdE6j+guLY0LGsM
         LMYEAcLQlMRjzj2abkKl6FPPbFtPKOJ1Z6Ueghn1ILCsXOw3GJcfaOJmPdaI7XrDwJ38
         Lj7ILJc7MCjFnrf4uq4QrrpUzgPxDkuA1wjKjLc+4F7eKXDFihn1GPIHQ4ylbm+8aljU
         j65RbjFcM+sfpIdYPwK4SXCI53SlJQdCZvRD2K5x/3JvAwQv7rAoeIYGfcj3erahao61
         yKH7qcZYIb29VT20wZUmu6BDfEkgGUUF/mekj08Mr+zhSm0Q4Jzi5TuJ6AaHrFHrLHs+
         mNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777077876; x=1777682676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OeLK2D28kWbvQeOXcDdKQJ3UJRWDE+NdXZ6b+JbOcrQ=;
        b=B8UZj0HXSq0F74BkXrztrTU7YNEUZ78HUAhVDLRCwhmOBldRFgtG5PrNJXYE8y7VYh
         C5Mp42QzGxrpwfclWWkjpgK/AvdUK3Iz1q5hEQN2zuIE2Zjy8trO9IFy2IYTiK9GKZ5B
         9u+knANs0aUtN2V3BFroKSM83bUOAoBvcyNflF/4paGMIV6sbhTXuJycnzVccfOGZtPW
         KPl3q5waxce4Xk0D5sg3zwdWUahz9g/OAEVGIA2P+2zexcqS93rM1X5Ej8TaIuHNqAtg
         9YwEZENAen3+69BZ9Z07abdPY/CCq8nt4tPLImk1ofZDJ8GqKM3b5K3AqVqLgbFt/oZr
         TFxw==
X-Gm-Message-State: AOJu0YwmyFBc/i3r84uGWK+UcaM+ku+8Be5drWpA8f0yLbQ0s34T5P15
	xYJDN9fe+sEG8Fz+D+Exu12kAG45ODdSuZ7W9vwX7F5xjGQO/0PZ6T2/
X-Gm-Gg: AeBDietWV2DaBCqUe749o987cDcG7Uzg7CMpe3t6uHu0piWco8i+Kan0rbmK0hK1c8H
	Nt6wKObswtMXZhVRPhj73NOoxMuwvO8i82UfTbo9pgWixTdHEU/c1pi3oHtV9w5h7PtPXobTvnH
	T/wQ9mTfqJjAyJGT4hYvaNgyQpgiRwxtKM3xPn75N4kw2wmF70z/ylxGj5AOhwL/dqeCe3zHmK8
	k+x+8s22zDOJbg4nHjvPvg8mhj3HlpprHCuV49FX8WtrTutP+rFCDv0tRQfvMUxmClUBpHq3XIA
	beNbGcxKCpQNJVZAsZxIOYcBimkyQYlZMSDm7oWcljgWBrK14pjht7ApE+QFPZK/ocnW6bHMhzV
	yZfoI0F1b86uMSvoFr7pQoZX6Mj94c8UGX0i6zvXRqulPJOlVrTgkiAJD2AFGIVeLXaOKPWVktd
	y8fqzfH+QDDQYQ6q9looWWUz07/vyV53ZXjUNYdNLzbYrvmQv2tE2jcuXdDKwT9CsKijoXa0G8D
	18iCjlPcRmmXvRvLsgpJqWp8Q6uhWRUGV1ysv3KRwVms4EMMvy4O7xuXAjs+xTuXwbxubEA/WrE
	5aVdnx8iKA==
X-Received: by 2002:a05:6a00:2d19:b0:82f:425b:4c27 with SMTP id d2e1a72fcca58-82f8c8250a2mr37208949b3a.14.1777077876149;
        Fri, 24 Apr 2026 17:44:36 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0566dsm24948385b3a.57.2026.04.24.17.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 17:44:35 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Apr 2026 10:44:04 +1000
Subject: [PATCH 2/4] ASoC: tas2764: Deal with bogus initial temperature
 register value
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-tas27xx-hwmon-fixes-v1-2-83c13b8e8f54@gmail.com>
References: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
In-Reply-To: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3008;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=e4tOpu0LbNNGF9iKe0Fx6Ayli0jihvKbR4O8mx1wFnM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJlv+FKqNbfcPK/2YM5fxbj6rjeBjbomUkcUhFKE1Dn2+
 hksf+PcMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOoXzxkZDh/usk3RZH/00ejuixtLAiMslK3v75M/fcRx6rylKha3DjL8r/WPe/t
 v3fXqU4UCjq83CCkmaD2s4c24fv+UXPb0eKEeLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The TAS2764 datasheet specifies that the chip initialises the
temperature register such that the temperature reading is 2.6 *C,
ostensibly to prevent tripping the chip's protection circuitry.
The chip is not capable of representing 2.6 *C however, and the
register is actually initialised to 0. The ADC does not start
sampling until the chip is powered up, and the last sampled
temperature persists in the register during software shutdown.
Therefore, any reading returning 0 is almost certain to be
from before the ADC has actually started sampling, meaning that
it is invalid.

Return -ENODATA early if the temperature has not yet been sampled
by the chip, and indicate a fault condition using HWMON_T_FAULT.

Fixes: 186dfc85f9a8 ("ASoC: tas2764: expose die temp to hwmon")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 6aab6d2b7419..df21d98ee274 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -684,14 +684,15 @@ static int tas2764_read_die_temp(struct tas2764_priv *tas2764, long *result)
 	 * As per datasheet, subtract 93 from raw value to get degrees
 	 * Celsius. hwmon wants millidegrees.
 	 *
-	 * NOTE: The chip will initialise the TAS2764_TEMP register to
-	 * 2.6 *C to avoid triggering temperature protection. Since the
-	 * ADC is powered down during software shutdown, this value will
-	 * persist until the chip is fully powered up (e.g. the PCM it's
-	 * attached to is opened). The ADC will power down again when
-	 * the chip is put back into software shutdown, with the last
-	 * value sampled persisting in the ADC's register.
+	 * NOTE: The TAS2764 datasheet mentions initialising TAS2764_TEMP
+	 * such that the temperature is 2.6 *C, however the register
+	 * is actually initialised to 0. The ADC is also powered down during
+	 * software shutdown. The last sampled temperature will persist
+	 * in the register while the amp is in this power state.
 	 */
+	if (reg == 0)
+		return -ENODATA;
+
 	*result = (reg - 93) * 1000;
 	return 0;
 }
@@ -705,6 +706,7 @@ static umode_t tas2764_hwmon_is_visible(const void *data,
 
 	switch (attr) {
 	case hwmon_temp_input:
+	case hwmon_temp_fault:
 		return 0444;
 	default:
 		break;
@@ -724,6 +726,9 @@ static int tas2764_hwmon_read(struct device *dev,
 	case hwmon_temp_input:
 		ret = tas2764_read_die_temp(tas2764, val);
 		break;
+	case hwmon_temp_fault:
+		*val = !!tas2764_read_die_temp(tas2764, val);
+		return 0;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -733,7 +738,7 @@ static int tas2764_hwmon_read(struct device *dev,
 }
 
 static const struct hwmon_channel_info *const tas2764_hwmon_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_FAULT),
 	NULL
 };
 

-- 
2.54.0


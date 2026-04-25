Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4902B1D514E
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 00:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777077889; cv=none; b=tphyn8lRX7ZSTTC7ygZMV9lA+NuWIS98k3Mp584yiYT3Fy9ati+hnp2a5spZ1u8In8xmseG/J5Rw1OA0oD61JukC9zLnFCOOZREF5vdS29WeAIW4H0kjJ0GMwgPVa9EKkJSbMmxqKKYb1bpJxqL0JltnfYw2RhECjeX08ash2+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777077889; c=relaxed/simple;
	bh=F5yeh6pdK6Hs7beqeyQj/TVTdS2YepfCTkinI6k7d80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcPBGmIku/locohLZOHcJyni0FbLY6q0y2smdjJN/mcsq2du4ZYQ+eU5/efrtQVp1oofRRbEE5hYnpPKRl42+Rt1ViWhXm5xXWsyJGSXjc+J2VmSrl9JPfVT1U7tCxPN/xvjSxSUHy+l7vML1KlFNn473+qnFBi1/qx4xbi254c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQBxA4DS; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQBxA4DS"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c79506f3c40so3075574a12.1
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 17:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777077887; x=1777682687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hX2/JA8GK9hYTduQnxjY+1BP+OMuld9S7rTvEbat1fM=;
        b=sQBxA4DSK/xdkYN6mRL1Go2uoaEaLhdiw9dUHlTct8ESSOidydZWmVfi+PfgedfRwY
         wDrRuQMrnlscu0jrF7hnztaia613LCpxKkq9Lo/C+dih2jX66tBDIHZad2RX01VLlHcW
         EEDGQyplrh6108QFkY+U0Xsj+EcnX1RbXUUUYuBkROI++YqYr3U40n5XLLRvg+3wGZIa
         vD2qFPH5MrBQTeGaRm6tYVE7op4NXXpgdGD6gQTPS/CTo5098p37C9rnKOOXzfb7+sb2
         B50pUg5ryD8i9Yn8gd+VnKVsOJXRNU4NnQICnv33mUSx/s1RiI2oZxFknhghSCr5WgSS
         B6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777077887; x=1777682687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hX2/JA8GK9hYTduQnxjY+1BP+OMuld9S7rTvEbat1fM=;
        b=ZVVJHujewbdIHWEUXvMEwQguTpl4TruOrbLJvjj1+5lzWQSp44oz6MEP/sOmZMW32g
         1jkgBTdhv9yfIEW5V7hMB2idEu+4gT4ALlC43hHdLqJ5d0FTxdt0sxMMyvLzZOHzC3D5
         C/KDab2PizDrBlL6JN5/IqkTbsq0BrYVC9Js6nXF8KKfv+vRtpOBAvpmGeBMSSS7k7+z
         P4+0ZVKyJxa40ndxG3haLSX4sx6hskFstF7ht7F4U5ebXT6nDJL3jiPvac28t7SR0uuA
         5M7eOIEISt4ccd60wy4Ik6cdTC0qaEruKk+32e5yTOuEV+18uJBS43rLdqAQVqMG+IzA
         qO0w==
X-Gm-Message-State: AOJu0YyZRW5gqwlaO0KYTqfmTIeMeHXUjqAuB4Ztp/5EcVucYHB4U6oD
	uwP/YHoRpEItw9f+EhUirAnDnTkzZZscxGSvbOJWU8xybeKKtA1jt/+F
X-Gm-Gg: AeBDiesnkVDevGwL8i5I0BL2g8wEoLbc7yeFljawxQPTrLhpR5vdTDfQRgeZEdMof2K
	j8G+ivaUBRJWNkFZCFNC9gd390jmAcwWw3ifkcXkXQFEnQ5Qt6CQdZ1lRDogu+q36qBQL3IJDqA
	GMowD6fCwplJRxOxPyYttqDvDU1Rq8Fx0at8yZUF1Cgv0TeWjXfcouFH0vc06lxl5ptKbzRcEne
	vskcAbC+iq3tPIGhvXTQmRH0R8DUX+8/MwUBHbC5bam7XnSNbZxi4jUCC3aHPg87ENAGnYbkUhW
	y0Pe5Ss8f/z8r9ID4z9UD7oSA+StE7Zb1aTZz/As6B9/nTuM9Q2/4dmievOrD8qkbv4hC2ue/B7
	ekORITjeh1/fM/T+Rkt5eBn6mP2EJ2iaS8svNHom+Uu/inDB82KIIbgotVZpM0zU9NLDs/W/0eN
	42QDmVySCtEUFJNTsogMfoBabN/vmSxdjpQO5h67ezu3rEejDBkrEaJzex+GZb5ZUnlgZTHwbzV
	KxkN/b0PZv4zRNhUw2z2bCsLqkz3udV9k+jZR/oGdPe4mgRhyFuPoPMgpiBgylqOP3KcqF4OKsY
	zfSvRPVbGQ==
X-Received: by 2002:a05:6a21:3396:b0:3a3:21db:8ee8 with SMTP id adf61e73a8af0-3a321dbc8ccmr11418866637.1.1777077886621;
        Fri, 24 Apr 2026 17:44:46 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0566dsm24948385b3a.57.2026.04.24.17.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 17:44:46 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Apr 2026 10:44:06 +1000
Subject: [PATCH 4/4] ASoC: tas2770: Deal with bogus initial temperature
 value
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-tas27xx-hwmon-fixes-v1-4-83c13b8e8f54@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=F5yeh6pdK6Hs7beqeyQj/TVTdS2YepfCTkinI6k7d80=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJlv+FIixd5laq+Nc0jrstovZVGz3CkyJ7HG3KH5vorRO
 U37R9wdE1kYxLgYLMUUWTY0CXnMNmK72S9SuRdmDisTyBBpkQYGIGBh4MtNzCs10jHSM9U21DM0
 0jHWMWLg4hSAqS7YyfA/88y+/OthEjcP5vC9NJAM95Iwz1/41cxrK6N2MOOipOg9jAy3FXhFk3i
 EzT9nz7/FX6S1zGDZxiCFvXVGbBH+6zknb2EFAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2770 initialises the temperature readout registers to 0.
This value persists until the chip is fully powered up and
the ADC starts sampling. The ADC then persists the last sampled
temperature during software shutdown.

The ADC should therefore never return 0 in normal operating
conditions, so return -ENODATA and mark it as a fault condition
using HWMON_T_FAULT.

Fixes: ff73e2780169 ("ASoC: tas2770: expose die temp to hwmon")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 50501bcbe916..21e3daadefab 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -633,6 +633,9 @@ static int tas2770_read_die_temp(struct tas2770_priv *tas2770, long *result)
 	 * value read back from its registers will be the last value sampled
 	 * before entering software shutdown.
 	 */
+	if (reading == 0)
+		return -ENODATA;
+
 	*result = (reading - (93 * 16)) * 1000 / 16;
 	return 0;
 }
@@ -646,6 +649,7 @@ static umode_t tas2770_hwmon_is_visible(const void *data,
 
 	switch (attr) {
 	case hwmon_temp_input:
+	case hwmon_temp_fault:
 		return 0444;
 	default:
 		break;
@@ -665,6 +669,9 @@ static int tas2770_hwmon_read(struct device *dev,
 	case hwmon_temp_input:
 		ret = tas2770_read_die_temp(tas2770, val);
 		break;
+	case hwmon_temp_fault:
+		*val = !!tas2770_read_die_temp(tas2770, val);
+		return 0;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -674,7 +681,7 @@ static int tas2770_hwmon_read(struct device *dev,
 }
 
 static const struct hwmon_channel_info *const tas2770_hwmon_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_FAULT),
 	NULL
 };
 

-- 
2.54.0


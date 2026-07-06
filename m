Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B70539280C
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351885; cv=none; b=pbpv0sLUAqZ71nagkFk2nA6L4sTQa7YxuiFsGpbSpxABHE7Z4cgwtLGPwI0nbjPhUym9xt1dvbdNlTOKlgK5caP41CiqMIkh3jrxAaYKc/0YYeFbrEHnP6hIi7RkRAKh0T7EYyqEd9Z1fOp4VUURa+yEiI/utUOHnqrqLNvW74k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351885; c=relaxed/simple;
	bh=gDZyFzTwMVhrlrZuGwsbcw9LTPwUJ63h6yY4OboYANs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FP9rEwf9zseoUehWM2ymSj7Lc8hKxYDeu+lUQCM7hENXtRwVO5B+ag+mDGzROCiMrY/8Jfq2/J0UATNvO04Jqgd9OvH8Jf8sPm1P+psPVyHo981eY/k8Zz/GQ3UvnLklpSH/lfvyDhSNQO2GE/I4RvIMEGx2nP6pjOgBvyi2Nlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKr8jcEC; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKr8jcEC"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so1586839a12.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783351883; x=1783956683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vRCsj5pah3xL1Ur5ElKkBXQitF25DI536NaoFrHgmJE=;
        b=kKr8jcECbegv8bjgnROxjfVYO3/rMrvpPI3hvdNlb4T6Xl2zJr52qt91V1wikvRlLK
         /lyhaijAmmBkHYagTlRMx/yUQfoQC66j+SLO+frE2fT20eSpccs1hc1ZN+zGlJw123pq
         TEeZEZr3Hxs4Zj+4ndZxIHrBEwpdosifG33fMZn0gLnc/L0F2cY6uR9S7lS5kMCs+eh8
         l+uG51nJxIgLf/rutLHEmOU23QDMPMYs4J95p46vDHjcOgiTjVZ9D4P7Z94sLpfL3bl5
         dtnKBuPqa8rKjA0TuiGn6zG2TmQv6/U6kpqG8vLJ83kU9/qj/YRmKbpq1l+yYwP826Qj
         Wkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783351883; x=1783956683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRCsj5pah3xL1Ur5ElKkBXQitF25DI536NaoFrHgmJE=;
        b=H0xcyBaLPDJDD3ib0I9AJjz7oPv3qVTEuC+0nc1WVZ/V1vXmA5i+E8IIgN6e7/IEPm
         CmH+mZ8zW55yZa8QKC9tabO4DIRzb9XqnLKiSvNS4Vly2KFjHnQs33dVA3XR51pdIuQF
         nTXbo9DzwHHNRdBqKl5xh45bx0qViHrJ5r3aaZIulH5oNkF3zvoYFw7skP0LH+bqWLBl
         ZodY0dHZltF149RAi0UknA7/x8no/Xv6KpmNay9zzYLMrBZrXsHsVxkKkBdBW/ibxdKV
         c83ioFQ/MzvgQ3tH86Mj+PwAwrclRXTh5P2UHksM9imNgZo3w4FzwPK/1e1rfo9Oi9JE
         DEwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHQp2onL2cyA4PeL7djycMKico+CS6gMDqwoeMp3L7RUmXZjAyO0biFE62H/TT2by4U3xwCuVSDCVBdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVRSXLRhmFb8BxZDyX6LiJ+T9i0NFAh7QMV6H7XQAGqVCbfEnY
	2LOcN1VfH21gC8K0Tk7V1f6lVCrTD4hCFw0urW8GmDpCNdgXEgvbm6gz
X-Gm-Gg: AfdE7cm4ZwY07UNHn/vikkqAtLj4ZJ8My2d8FnK8gsSF5TDLOpDCAAhjl3WMS5fR6Ph
	GZLrczeCDGbNA9LlK09k4HBAxbFABncSZ7qi1jT4a8aWwVecY/ZY+T0jG9PCKzdoxdHaeE2V5LU
	DZWnQWGhhq/sRAz92bjYvJwHEVsUZ0mWeiGWYFg0hJzQrQQxisDLXU3G9ia4fy2O+gAeoaHDMNp
	mI2+a6OJFIbMtpGmZcVZulo2MXEVlwNbdVqog8iF44AQVjUqx2mu5A6VssZ/FHwuYuG/9LezzKG
	uIzSQxIL3XHnSs5S+SJfp1/DhbvdttAAr+z0VKhBtbqaVsAGAzKWqmJwqH47TCH3CugRDsnSerr
	BXrhLSqGT8fja4+UhFpwaSKpNtWN400Q9wPsyCAmPMWfjbya1ePNT4FjyuFBkmXdMk5dF4tTFUa
	AapIcqMSvuiZTKE6XFKfry5zR6eWPc00juwm4T4J7nzYHEP3+HNgRvLGW68ztM
X-Received: by 2002:a05:6a20:ae2f:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3c08ec8fb81mr1480518637.3.1783351883028;
        Mon, 06 Jul 2026 08:31:23 -0700 (PDT)
Received: from steellegend ([2405:201:304b:4973:59cd:5c84:346b:aa8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm86973096eec.9.2026.07.06.08.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:31:22 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH v2] ASoC: tas2562: fix deprecated 'shut-down' GPIO always cleared after lookup
Date: Mon,  6 Jul 2026 21:01:09 +0530
Message-ID: <20260706153109.10953-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In tas2562_parse_dt(), the fallback lookup for the deprecated
"shut-down" GPIO property is broken due to a missing pair of braces.

The code intends to reset sdz_gpio to NULL only when the lookup
returns an error that is not -EPROBE_DEFER (so the driver gracefully
continues without a GPIO). However, without braces the statement:

    tas2562->sdz_gpio = NULL;

falls outside the IS_ERR() check and is executed unconditionally
for every path through the if block, including a successful GPIO
lookup.

This means any device using the deprecated 'shut-down' DT property
will always have sdz_gpio == NULL after probe, making the GPIO
completely non-functional.

Fix this by adding the missing braces to scope the NULL assignment
inside the IS_ERR() branch, matching the pattern already used for
the primary 'shutdown' GPIO lookup above.

Fixes: f78a97003b8b ("ASoC: tas2562: Update shutdown GPIO property")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
v2: Fix Fixes: tag - use correct introducing commit hash (f78a97003b8b)
    instead of the incorrect hash cited in v1.

 sound/soc/codecs/tas2562.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 2f7cfc2be970..e1d62f30418a 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -675,11 +675,12 @@ static int tas2562_parse_dt(struct tas2562_data *tas2562)
 	if (tas2562->sdz_gpio == NULL) {
 		tas2562->sdz_gpio = devm_gpiod_get_optional(dev, "shut-down",
 							      GPIOD_OUT_HIGH);
-		if (IS_ERR(tas2562->sdz_gpio))
+		if (IS_ERR(tas2562->sdz_gpio)) {
 			if (PTR_ERR(tas2562->sdz_gpio) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
 
-		tas2562->sdz_gpio = NULL;
+			tas2562->sdz_gpio = NULL;
+		}
 	}
 
 	if (tas2562->model_id == TAS2110)
-- 
2.55.0


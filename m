Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20F21553AB
	for <linux-sound@vger.kernel.org>; Sat, 30 Nov 2024 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732961305; cv=none; b=XfO5mh9bgGbg5U6HW+bVHtiUkhrJHjA0TxQDzpzMBeODjXPlf92z30agCqr6vCQx2uEluhVk/a44ssxWgAbwoNuucCh8ce8yKBg0kGdIDq+SMsDGV+pP4wfxM+LFHLgcCXbV3r4qeCFqq6mbYH4PukJMlWtwwnSspu6hCdPZWRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732961305; c=relaxed/simple;
	bh=yGN0skpZCH/XVXgf1QIShlnVw3a2xJjULCwKrnqKSg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PxcYc2JSjpFwawBdWSXULAz/xBEaluBN1uDtW76YoGRu9D0etIrPh/pH/DeVRfMfGEoeArb1bBLjlptYdxMYRoZN+YQt1OtXSOpJLodC3bYNLE7KIVu9An3jt1wbQObOH7LMOrT37S605tg+JkEtsfav+Y+3NLuA+TyFbUWRs9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZTWUD4X; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZTWUD4X"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so6417149a12.1
        for <linux-sound@vger.kernel.org>; Sat, 30 Nov 2024 02:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732961302; x=1733566102; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Foltdq1wnJptf4CLVy8W4RVoCPqvSVXILCEAnOfXokg=;
        b=MZTWUD4XrpdcLOOg/ncjq550IxAEH9fos0PkNXiSDMfZIBB7EouCckfaKvw+SQvniv
         6BIYMzLjh7/OzNTCbdcXSd00o2z0JkDLP0ENn0KKWU/iXu98W+4j853c5Y1495fUPVly
         tCid7j6+99WpmrAbECIy5MUwKD0buQgnG6CvK6fEv7CwtdE5HSSL2E+kV8tjx1mdBmEF
         mbAQepSnwTujAaZX2EY9WIlXaXk9LRqudY/Wc3nRTQUGq7Wvw+TikBaeRZ+XAeVh79PX
         Qd60dv/o5jdJBs1vttP2+jjy5DiYRboAjOAGn04LfrO9VjIfcaadXLVgbTSGcvYy6M34
         mXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732961302; x=1733566102;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Foltdq1wnJptf4CLVy8W4RVoCPqvSVXILCEAnOfXokg=;
        b=mtP/C5a9QT2DCN93Q2wfiEvZK0caDVgwboOaUM5teHi/cNrSFgqoNn7Y0okx4l7NCj
         1JxtmwirPqEyfcnJbprERz/hz2H3yAD0S48kYTZW4cSi6PPMvpfMVxYcp2cup3RtdeGZ
         1b3GOpnjp4Sk1Uy0XPHM+xIcBSCmBuO2C810IEa5k7maMGthHaXc/zexrExKfm7oJ8Wo
         HvdAXAZhx09t8+JPSZPB7ZPIDwUafdzNkSdpcAOujoRVTWSVQ17bn7a95NygD3VRlZc5
         ltpOzwy/IKYFc6Ua3cT6LRmShzPkkkTjJTr2LFuZOhTA+tjRbZXe34yF3akO74aUCWbs
         RIEA==
X-Forwarded-Encrypted: i=1; AJvYcCUlr8k7Tyz0y93ls63EOoB4Uf3OMoQt+WfcwQyZw9UIToNva52fGCtg/NWLUfPIatNngkQDULfyPdbRQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjBCXZmxIWt4cuTyA7lXRlypjYW98MAIf4JPHLHP3kJb2aaw6L
	pckUBdT62G6aexX904FltcJ54ocVjqORas6qjfFXVRfgtp2bUSI7hTBqadnw01g=
X-Gm-Gg: ASbGncvrxAVhqWVvu3px5M7EvtqPw+Na9U/yWjkgZnfietfcl2iW9M19vtL1RWN3cfE
	f3jZjQR+oxcsM7Qyu5ZltiVyX0VU4pB/8QVYbFeSW0DPLAA5vx766jSZC9pXW4NWF4ADgBwXY9W
	pR/1dqa1nRDI6DIAgwfAle0h7n4MDNjN1bv/PCiei0tLudxHayl6cuDBcTKJM4h/ytU4l6KlQfn
	n2Pa2qtQ4no7gwvYsHbvjHF6jWWUTAcmJBMmTKk47ZDEjtWlCOhDYVdVVnSHmq/HthZqgtF
X-Google-Smtp-Source: AGHT+IEpsOjTRBw3ZIvPknkFFjSqYnH4ouKRAqfBsVsF+pma6HwTEfCu8fT9yrQ73+MialO52y3mFg==
X-Received: by 2002:a17:907:7615:b0:aa5:358c:73af with SMTP id a640c23a62f3a-aa5945075fdmr1341277966b.6.1732961302097;
        Sat, 30 Nov 2024 02:08:22 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a79bsm264809266b.151.2024.11.30.02.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:08:21 -0800 (PST)
Date: Sat, 30 Nov 2024 13:08:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ALSA: hda/tas2781: Fix error code tas2781_read_acpi()
Message-ID: <ef773f8a-a61d-478b-9e81-41a38a75c77b@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return an error code if acpi_get_subsystem_id() fails.  Don't return
success.

Fixes: 4e7035a75da9 ("ALSA: hda/tas2781: Add speaker id check for ASUS projects")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/pci/hda/tas2781_hda_i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 45cfb5a6f309..8ec03bda85f3 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -143,6 +143,7 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
 	if (IS_ERR(sub)) {
 		dev_err(p->dev, "Failed to get SUBSYS ID.\n");
+		ret = PTR_ERR(sub);
 		goto err;
 	}
 	/* Speaker id was needed for ASUS projects. */
-- 
2.45.2


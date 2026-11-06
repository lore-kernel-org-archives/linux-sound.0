Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986029;
	b=CiQg5JCrWbT9B5tPmWeDqaXZiVDCU33aWuW4f+dWYbCnMOopJKbn5LqKFOGuPIAVk7f+
	 yWRNBvipmgMPWuxlDCE+VxXU3qLa/6fW98uSGn/oBGbsjQE4+QHBRoHEsuqQ4O0YBcqnR
	 JRgJ2Ll1v1x+ljQb0M4FNNiFm4yPLIjLj0q+tAEhXqln5xezGqBgZH66lzg+ZVcnim1xD
	 WWhDO6Sbg8pgz4SQmuIAW7uQa5lkBCMlFAIaTd8rvw900QXB32e7oldFWziy4cPRD+L69
	 wNaEoV7ECvXAAiYE1zpk2srKb8mVhsB+PLhNi6A6pWMl/2yyxByH8EkiHRQoWLCJ7xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/6IeFAN+Brr4IgsKEaQkEmx9klkMrgiyQtFnXr2iOyk=;
	b=CV4tfXUYaATJIWfuv3sKiPRJq6wBQVPBKMyGbTdYzG+w3JsoO7pRL95YixHLDLa40cZ/
	 s2udCCuBOWceCqtKbDPFAFd1VrNnSorZHAXG9JacBjdniOLx1jWHjhbBkBt3CvBTBkFpF
	 /BbIFURoVI4Dh/aFI6eRVCbKSSQPVvQx+xkxA32oiCBLb4LaOYP5pjpoMRVrSM2c53tqx
	 5WSZB1Du8b87Ru04/jl4IUqxdna8/v3wIYzzNL3pF1a9mPQ4K//+FycjU+d2m43NQaZ25
	 7ej8cJI+jZiSzKyeLlzJTsGliMCTk98xLQt5BgH76CR75yjpZU0KCGEA+3S5NYrwblA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7toEAbf;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42C0606A329
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 17:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A42C0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7toEAbf
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so1594342c88.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 09:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986028; x=1794590828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6IeFAN+Brr4IgsKEaQkEmx9klkMrgiyQtFnXr2iOyk=;
        b=n7toEAbfrt1WTfLvOvfykcULME3/FdB0VY+ntYbJKJGgUWe+tqywnlfsOreRP/nX6f
         Pg29nKei466dkdDcFAMVdpBmDQly4UbQBQR6I7JtCeZWv7tdQ1uef1PsBUnGsTg8AXo7
         dTPLSf0MfKFqra2oIe9E0SBZrGPceA/3J7E/SQjFD3VksxKPHPs9P7stGSZ4xLbP7yf1
         Q0sVxUSQ9aQbOJUazxhj/mB6y5EpCORBwgKiO2yFAhfNDKxIm3xyQvRni/LoBFxkVZ+i
         NjhAq4e+f23o9E88jSIJHoH5TAWYcJLsGXxfqSdZ1I+vsY4Aokdy8sF5WeV60i0JmO3g
         OYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986028; x=1794590828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6IeFAN+Brr4IgsKEaQkEmx9klkMrgiyQtFnXr2iOyk=;
        b=X+8Kz3BLe2Aju0yrTNB1wecAi7sNuz1BZuaovqw3jlCfnapRtaFyQTYgNXOjohIFdT
         VDlcG8utbR6xcytm3WamRHp2sIibC8/gdFjX8/HDqAUIkCNCf8zsV3cVx56RsmlBiLHA
         B1+aXZGOBJ39Mo78qc6Yr3xdQ0+HlpNpeCRkV3cKNMh3EtC0LGVHHGewoUujUHOVwXV2
         MMJ7P+CqohJPbK+ZagKj9ZlIAvWTjbuqqbQcrALzfCW2Po0AcoGjkwo1XTGxSHgWhIhm
         eqDxv00SGnoCA4HH5uldC5l5T7orCs+2a5nRIXnlUZ3GY6F5XMsyYmCet9ubWzL9uLYC
         Zw2g==
X-Forwarded-Encrypted: i=1; AKwUvBxxWWoAQK99FYpNtNybMYCrxUrissPsxXbeY/eYlH+OEQXWj1+stfCPDX4S815sbUjyp6HO59Y/i2aqcg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MZR72qXEWFigXeDdjjRv4s1oTQGQpaJhLXEEXWlQ6NrLTF25S
	rmObbU7lSSQU95ohhP0+Pc/M+Xg2IVBhKeH5tvG9A/8oLsf74/3Aqfar
X-Gm-Gg: AYBFou1QI+Q3GMi+BZW8URRHJSKVu5+UMAubbOlMIb8QASjP1I8+GPqmaZDCZDGwCft
	sqqjg3Oc0oFT+ho78d60bMD8GBpiNQVugy/FWCTFEhYjw3txjyP33rdMBezAEKu/GGr+PiGSIwe
	BHYXZtmcDCn2Ln6iBoUlmfRGEniEhGkhogx425a/10h7BmJqn4g+GrDGw77QpBxOW1ktLpPb6IY
	8jJdKM8t5fAS5/LX4EX+Xk1Lnoacz4tyLW+9D2dZkfEEloUdc+R2p2DA/wUlRCA0iaoBzi1EIav
	TFjbwYQZT9sABER/UI+ovfV2ZdjJ+Adsl+in9cCCDSxseDEc6l1p9uUSinLvQuXl6gEk3rfdXFc
	0sliOukSi+Fp4Q0M92X0PM0u5YzB4MWcilAlhAo9+t5iggT9sCVSGgkcPOI6JLC9M6LerGKcTwn
	7zl3H6Ko5aaM9L4RdrZ7fxWcKtHKcyXysf++MYNz0720UYjfB6c856cRhkovvoR+MeQGkW4mj9r
	KtGR9O4Gd3tiw6JY0zVGEiJmIsKuCB/PDsuKTEhlLCJ6BzyD3lMJAjg8TIOyuhvirX5iuWYkBJ3
	mil1diD68ShZkwYgoFKc/ig33fYSUD8yvvfNPK03f5pJ28QFdmlT
X-Received: by 2002:a05:701b:418f:10b0:1ae:59d6:91d7 with SMTP id a92af1059eb24-1b25d3992c8mr3772225c88.40.1793986027564;
        Fri, 06 Nov 2026 09:27:07 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b26294289dsm7199997c88.4.2026.11.06.09.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:27:07 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: control: Trim whitespace from sysfs input
Date: Fri,  6 Nov 2026 17:26:25 +0000
Message-ID: <20261106172625.4622-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106165531.4074-1-sreekuttan2156239@gmail.com>
References: <20261106165531.4074-1-sreekuttan2156239@gmail.com>
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

The attach and detach sysfs interfaces receive input from
userspace.

When userspace writes a value using echo, the input normally
ends with a newline character.

The parser does not remove this newline in all input formats.
For example, a bare numeric ID can be treated as a control name,
and an unquoted name= field can include the newline.

Trim leading and trailing whitespace before parsing the input.

This keeps spaces inside mixer control names unchanged.

Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add the Fixes trailer.

 sound/core/control_led.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..a640e7835ce2 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -518,6 +518,11 @@ static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, si
 
 	if (strscpy(buf2, buf, sizeof(buf2)) < 0)
 		return -E2BIG;
+
+	s = strim(buf2);
+	if (s != buf2)
+		memmove(buf2, s, strlen(s) + 1);
+
 	memset(&id, 0, sizeof(id));
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	s = buf2;
-- 
2.55.0


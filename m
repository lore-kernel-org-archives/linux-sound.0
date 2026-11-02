Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627491;
	b=sA40hiukn/ojXUJZmmWP+C8T2B3xE+eruC184iqRidJ2Fiyz2tcjzlc7kNHfxzicKghh
	 IstUu9ebL8yzhgzTNMOimBY6dQ3kQZ5qLiPcbeILDBvw8f4FlltuQqPm2m5BtDb/v9217
	 9kVL6kdpY73n/ADLKNO16J1d2oqBC6T5s8fGGJIyWjzOSDBoIUGi/CZ9567f2Lc9ctRgb
	 dX5K6ciSE0Dj3ck3TNEJbaShaRpI+MklYc9mBmVlr9ZqQJx06xwRQ87jbEam1dRv71hin
	 GtxOwo1UhEzcTwgu+AqIes5zZ8e3SPnCRJ3Jn5fjx9LhDmFv1JwfaZs7ghL/JzPbGxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KkViRr1Qxpn9LLhb4kMwqtknFYRFzwLHGukxfnQUbrA=;
	b=RuIpPZifMNAExn+QgZsTXXqTC/czhprHz6yne308oZRMmO1IzIkWiGORcwysCJqXBZzZ
	 SMmJDbTck/2D/BJBEi3JOWs0yL2973SrVVVslqlfByaS/nNU8l1O+IwFk4G7SypTL+f3w
	 35JpI1Q1k/Gy+2oVxbsWicRLPB2qbM4/YSbvLj+aadQbhB+5KVNw53k8BxLu0KGNY61Ev
	 HCnvVwm8UT7DHq0ndihrgMHa4FuoiuXohOaFDgOqMBrQ1q6DyO7kmTA9vNKZICpxvk9L2
	 N/TBSwIIceJnDP9FMRTYIrHOvxN18v8+NhjDeMkeizeiO4p5b4uXIeLJ4m8Ujd1miXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jajE8V+p;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F7860A6F45
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 13:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F7860A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jajE8V+p
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1822389c88.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 05:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627490; x=1794232290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkViRr1Qxpn9LLhb4kMwqtknFYRFzwLHGukxfnQUbrA=;
        b=jajE8V+puKWvRXqYysJKyK+KkvuPz7FISda/lccWgIr5rA5YT3YKiet0VXiU5NSjFI
         iXJoS6SEiYqvPJ4iscz2fVcZulI9p1WNJM4KXGRlHuuQMB0k52hPHFHmnCSv6cmA/pa7
         2fT1RgPdH3Npu/8nD6SQgYaj6xLEFcPUC4rih+d+UWZcj3cY+oU52nr2f4lsDHFDTk1c
         smER58QfM/Q2jmWaqCZP39u9mcE22NmPc+4H2jMr7xVq32SZLA+JB6JpU8OQlIey/Q0x
         14td8my62u5pHslTJ4d3kAVA6oz/+ABjysCA+ZVtuImqa2EO4hSW6EO/DuaVpSChQUna
         guGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627490; x=1794232290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkViRr1Qxpn9LLhb4kMwqtknFYRFzwLHGukxfnQUbrA=;
        b=sOHTjIrCHxSaHwwbmsaughjD5A5quaMc22UZE4ojBvADvRGv374pzRBDuhvcrIK7HL
         Y2I0ZA4JXuu43+kV2zIF2dYRFnyqV2r2k0NM740Ih4RODqRGrzsFtH0AwIatvFG+LtQ0
         Wtx5Xd5zTQT3rrv309T0aHw4BslG5m812iWpoQpqAKOQW4T5s2or7Sg/9z5FGeLN6PRX
         brPDLxWIPrWnU4QzQcb9np1qhgw3gW3rGLVdTzamdP0xuNCBKhV/3Iv3n0PX9jmtGIS6
         JyRvPTe6zO/T5HMZzVZk5IGMNT+lSx0n6OZjpLMTnXqxKKW3WenBMa9PdkqeKIMoZdv4
         vN0g==
X-Forwarded-Encrypted: i=1; AKwUvBzrps/QvXyVeq6e/3+yFx9DaPE1f23QOfO4jdUHP8ZXclHuQqslWPPWcH8km4FuTnPS90gnfsGMvnyYLA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKnRcTpvd9tdWZZCxKCXTkf5CIcGxu5Mli08Ns6TQ+MAI+i6sa+
	rvdfn5kGIM/YHnLQMlvYIB1ZRq79oxX0LdlOi+ajZUic5/ot8Umu35NA
X-Gm-Gg: AYBFou1UZmkMfHJRh4amhW1hpzLXmhV9VXVDaWQcZ6V4ptqUdLTrEhdj+Rz1J/b6d2h
	pgoSUESnPBNejNxWIzGcZeYo1k3Nmxh2fIfR+eCC/zpTkWN93UNq7pjBZyrUsWg7LIuiEBtsJCA
	OxW+xX3LLq9MmL3pnst85g2JbzOemox9/OgzyXrZGWa/ezHnpCADbIyGc5ezQvEwOuNUIptwcwN
	xRp20q/zZfLb13ucXSBrtE5bkdrucJOQXOpsw1/erg+RQSpgc3Wf13EzRyF2f7D1+hrMxZhLplC
	RZrHsZCGga9QcwzVIRVDkft1JwQDncuRjae7f1CsojpLCOXQesktpu0b1j2mRLYOBjzktiG2ejC
	2caL/aJTvxbEKIipZuLJ6Z+p0TUvyk6LgTSXB1jb358aGrkLerz8wRt7NySFmIiX6OhS+xGsbus
	Of/AWU7wf9dfKD/hBGhBV+5G5S/sDBtcsZMiRPVRCQP6lPyOzZyy2hlJOX0XGKDqTM32TL9jFSX
	DocP0IFh0DM+HJiX6cp48OqSG2QJpsqvRRpBlHQ/VEPL7p447h5hb6er+8nPoKAUpS4RVKoKKwj
	tbF2dmjR6b4gqB5xMH9umnrSG5yS07Piii78WOkl2iQzWxeLpMM=
X-Received: by 2002:a05:7022:b889:b0:195:8fa1:b447 with SMTP id a92af1059eb24-1a9494d8f22mr18903679c88.12.1793627490224;
        Mon, 02 Nov 2026 05:51:30 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm33682841c88.5.2026.11.02.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:51:29 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: cezary.rojewski@intel.com,
	phucduc.bui@gmail.com,
	kees+treewide@kernel.org,
	cassiogabrielcontato@gmail.com,
	mstrozek@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: control: Clear user-provided numid before adding a control
Date: Mon,  2 Nov 2026 13:50:34 +0000
Message-ID: <20261102135034.2751-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Clear the user-provided numid before checking for duplicate controls.

A non-existing numid can cause the duplicate control ID check to be
skipped, allowing a control with the same name and index to be added.

Since the kernel assigns the numid when adding a control,
ignore the value provided by userspace.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/control.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 535ceba294ac..42f16d2d0e79 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1759,9 +1759,10 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	if (strnlen(info->id.name, sizeof(info->id.name)) >= sizeof(info->id.name))
 		return -EINVAL;
 
+	info->id.numid = 0;
+
 	/* Delete a control to replace them if needed. */
 	if (replace) {
-		info->id.numid = 0;
 		err = snd_ctl_remove_user_ctl(file, &info->id);
 		if (err)
 			return err;
-- 
2.55.0


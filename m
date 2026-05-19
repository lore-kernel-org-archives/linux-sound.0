Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52662258CD7
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 03:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779161545; cv=none; b=X7sJl0bJjDq5dKjUgzopRDY4OaWeN2zWTWo2Pif2wbPwHKQ9SL9++j1MWl44QnNzwDYHB0ogJxxXKyIpBw65FT347jhX9yi6EK72s7M9afaNzpNsVQiO5vMqwedqG2Hds36zDl6MDuFeyAHKOLPVmcwexH0Csh+faQtkz6uQ8cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779161545; c=relaxed/simple;
	bh=05iD/qAS6Hmb35Jwib5lGI7jVOda2cbtoKdufYvK23s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CV1p4j1BUOxVZhppiNAKJpZoCcU6raWo+3fccLoKJr71QK+odBlLCTiqIjimHOC2/ZGDE58RplLee5SZ3LrWkW0E7KQGMFLd3Ej2AK9cRC9RVAuqerxdK1ycYpLv52Vb3b1xdT/N1gkJnAlV/ETxJ6J2YMYhb1TBfwlsKxJS5+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwXdAX75; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwXdAX75"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1329fc4bf77so8507659c88.1
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 20:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779161542; x=1779766342; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KEhW2cv9pHxt/OV2GG0kUIG9UFFZnsrejYMLQtjg+Z0=;
        b=cwXdAX75PkFoBwGahK/R6PqLYrAGEa2JfncP2DonvPyYqEaSF3Vir4RqXGXMQBokHg
         ILFUklrXDNIw0yobRop9L7FixjBOTdtqme5joUirGfHtUQD3cBYpa/WAJT5eliF9AED2
         TsfWjYXC0zR6k+wWPEWPxdCrzL9itauLZPMTeHFeCTSEk7Fb7TzfG/Ct4qjlS+ff4K2r
         hvkkbqeKrlqcCpgy5v+WLX1C2xfbmYIoqSNVuX16jzlVhlg/xZFZ6086cPcsGosaoZ05
         pehVaLsm6KiLMjm0sRXRrGhZtV50T8KhekByKj/ts0iLPYNsKilF4X1E06vbEsk4NAQp
         N0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779161542; x=1779766342;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEhW2cv9pHxt/OV2GG0kUIG9UFFZnsrejYMLQtjg+Z0=;
        b=Jxa9delpCDrlkdhUVaAo7fQCZ7ORrQFes5A8efBf0dzb1GrBf76B+IoKyHWxQvnrYS
         0f1zoZoaQETawHMkcBmA8r93/yfEBjEjJDKaH2sd7U7c422Myn+XOHrS28WbkHw0J1V0
         dngywxKfBqDRIRZYy7ORCGiMc8RXMO4Msr3rbOOM339RhxRqgYczyf7KHYdpUdqIL8up
         ek71UOZvpTw0NRm3hVwiQs9uSwp1RLHZrfrykrPXsRJaNlvKLjFwSUK+IbdVVx0Jx38h
         rG+ps3C0g7AKtPqvgB43pZ5zjADDvsrvriDA6k0DEAI8xgbcwyvWz5LhKxZWP10FJMF5
         sWlQ==
X-Gm-Message-State: AOJu0YxcCamWCpzVFrUJeuO7KTBm4yQOTL5QmGUXf42Y46T5AnGOQYra
	gsseiah1CH/UqluKY3QiY52aVvCfCbzK52YQJ7zJNwzc/59t7Ot79xs/
X-Gm-Gg: Acq92OERga0gE7+OX/vVrEwP7jLebvKvQ4rvmGyYDzwBgYA9C+eQwO+Ue6Rl5utZmxO
	InCJyJKKKODksW/DnOylUoGtA3hJNlQQ5y96GjHVydOp1VKajVun7a5fA7aKf1tvcu95uoN908M
	maWdEV4lJFIjIN3MeKHR6xqsiJ/8dUW4Bx5pkC/xs7hPqUUisFehaa6V9Dqm0oyT98KmeCbL3k1
	Ziwn16UDMOyA6//zq3kew2Z5ZrLVCYZI9wbjdcfNQKuFwQaOckBORKBueWBSSpMSMwoDGSA7kQl
	Mk9e29GlkoQApiMBylYl6ktbhHKsMEkhi9KN/eR6dE0rBNSRJIP9mLCJvKdUg5oes+eMitqxcq9
	969EhU+sFb5dNvgAmV+wR9qSt+WnErQz+9ERGhvUZRhMnKCg6cmL9czSsmAojExKSdJxv7uqGhl
	oIu4KjxfSvRd74rWpSyRxd0npLHXT7WZ5LXNOgSkqM1kB7TGqM1GEhaK9KBtOpLv9Fi7JlVdlFE
	A==
X-Received: by 2002:a05:7300:ad30:b0:2e7:5737:8364 with SMTP id 5a478bee46e88-303984e17ffmr8988389eec.15.1779161542347;
        Mon, 18 May 2026 20:32:22 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bc9d4sm14971444eec.23.2026.05.18.20.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 20:32:21 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 19 May 2026 00:32:15 -0300
Subject: [PATCH] ALSA: ua101: Reject too-short USB descriptors
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-alsa-ua101-desc-len-v1-1-4307d1a5e054@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDuQhGDUq5QuYhx1RNKSMaUg3
 t1Ulx+89+8glJgEumqHRF8WfscC/aggzD5OhDwUg1GmVta06FfxmL1WGgeSgCtFdME61ThjywT
 K85No5N9Vfb5uS+4XCts/BcdxArjNHe13AAAA
X-Change-ID: 20260429-alsa-ua101-desc-len-7c4708724604
To: Takashi Iwai <tiwai@suse.com>, Clemens Ladisch <clemens@ladisch.de>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=05iD/qAS6Hmb35Jwib5lGI7jVOda2cbtoKdufYvK23s=;
 b=kA0DAAoW0F0/Glr/7oMByyZiAGoL2cOiu2gVWhKEuAYFu/ViMKEXNP0uSWkmwH7pZD+tJnVa0
 Ih1BAAWCgAdFiEEq2KiObyK4NV/XqhI0F0/Glr/7oMFAmoL2cMACgkQ0F0/Glr/7oNY5gD/ee4/
 FtAmiZRV3dQIczdwTSmIRIXyFC6lgKFP/HrGiSMBAJYYo/5uTbkhQQ84R7IzfdeagWJO6RLuva0
 B6bhZUJoG
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

find_format_descriptor() walks the class-specific interface extras by
advancing with bLength. It rejects descriptors that extend past the
remaining buffer, but it does not reject descriptor lengths smaller than
a USB descriptor header.

Reject too-short descriptors before using bLength to advance the local
scan. This keeps the UA-101 parser robust against malformed descriptor
data and matches the usual USB descriptor walking rules.

Fixes: 63978ab3e3e9 ("sound: add Edirol UA-101 support")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/misc/ua101.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index d129b42eb979..b9a62e94e06c 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -894,8 +894,9 @@ find_format_descriptor(struct usb_interface *interface)
 		struct uac_format_type_i_discrete_descriptor *desc;
 
 		desc = (struct uac_format_type_i_discrete_descriptor *)extra;
-		if (desc->bLength > extralen) {
-			dev_err(&interface->dev, "descriptor overflow\n");
+		if (desc->bLength < sizeof(struct usb_descriptor_header) ||
+		    desc->bLength > extralen) {
+			dev_err(&interface->dev, "invalid descriptor length\n");
 			return NULL;
 		}
 		if (desc->bLength == UAC_FORMAT_TYPE_I_DISCRETE_DESC_SIZE(1) &&

---
base-commit: 7c94f5e77906abd7b9ba81875ae238c802a187cb
change-id: 20260429-alsa-ua101-desc-len-7c4708724604

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


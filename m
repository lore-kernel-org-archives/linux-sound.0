Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2E92F7F18
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783276969; cv=none; b=N6PzdA6uHJlZSmE9Nhf7v1ZhHa/3kgkpKicnZsA+OeWhqlTectBVh7UbuFvKLCdBhwF/rThtcdQvC9qYpi9QiD+TBzubPeywFqVz6tu8hRyNZllB40X4Qux7iDyTQH8HPsdgU48uZfM0x8K2N8NyFRhC24viWCtxyFRq8Zn+EAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783276969; c=relaxed/simple;
	bh=p9UeoAiX2RlCWV/14GWGCsXa5gaWPsbFepH8lXWUn94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RzWq79AaxdLxuakiwtX+fmuguGrhISKPwIAdVHN9UFfimweeqhQXWs/kzDImsg4YiphaWfIIqiE+K+lqYmv90DRzLjQNwnqO5JvQh6UP4D1GNkzAB7IjSlVhHseRV7gmEraNNB/KS1YDI6ye6BICR4ZEoTB64FhMFDS/3AWp4Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjopPVE9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjopPVE9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc84e77e78so4737825ad.2
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 11:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783276968; x=1783881768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHJZjBSfR8znWVn0hETgNilBhp5qzbTw+DVwC8l5bo8=;
        b=bjopPVE90QIbp0lxTwGpDa0jVVSFUbCEW9aiOOb/qD8EVGBNu+7naHmukzN1L/3fZe
         /VTG6/D495to9jjXScLCLWFa+PoWyq1ylsPX00ALUJYbSx7bKv2Qaddh8ycd10u5vjqG
         fbKUn7Mmq8JA2GWGEkwBz/ekPhFYtBgZLYnUNI6HjebUVE9B7L9CULmPQliqK2rqCaXG
         tSZ2Y3Gvh5Rbg5xG62JjqzEi7evu8SO8ulnFmcTVJpAluQFwkcqe9NU9/M/baSull2Bu
         pYtWW1i7fDRG+MKlAe8EeDh/+pXRzLqnA9fp7MuVdHpO5jg4OWXIyJnbP7G7OpdbIcrd
         CvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783276968; x=1783881768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHJZjBSfR8znWVn0hETgNilBhp5qzbTw+DVwC8l5bo8=;
        b=qW/sjDx8TVieIQiPnqNFcumBCnYJilglbMO9Rn0TmQjIjfpS/TOwwePZBtv4GVbQ2V
         PazBxDzFamk5uZdzfUJ0tcjrdVXrVMxPMJ4Qp43J6gdTAxHavJS0bPZHqaCJ43CpbWpL
         Kme8QFzlMNHh6jilX6jjhZQTp5h0hpz7/ins1o0dwJQY4H8kq4+BgWLthkQTVHNGZP8S
         1XqMjGpsblaWUEmayCITLrJXvrB2w85Kj97yFdlchaPHK9vjb83fl++Ap2gpOKJkSfZl
         3sCyeqUsn0J6kfPKcXztV3ZTkrd/CeHUq+SlqfPR0wJkNRUJ0suSwVTlwPIr+wfxu8Lg
         6TDA==
X-Gm-Message-State: AOJu0YwiR7DpKWT0Rq+AWshde5GkC3McVnfEZ+P5SCg5HX4RVYf9H3Fj
	Wc23pbh5RRt6+Z2aBPrWWz/wjPrtANq5x87nQ8GqwKnbX+aRgWSEUsdr
X-Gm-Gg: AfdE7clZ8HB48M3fIrENFtfHw/ZCyyT4NVhXqSKTRLgOBWInRzQAn76NTG4X398g+T5
	8P+VP5Qa3fArKpFkp6f+BP9Mtcj8dAEDXvWGCAjSCbQRslzqb5FA3Xkz+gJJjGb0hgaltzLTogB
	kyJdFy9vD4b5qOVTkM40nK6Q9snfVrmYci3cSosVnY5aHOh7MkWkIBzAUEdhXFxBLtLd8is+ZiM
	95lrxMIvtBEbH/CZ5fCD4Px1ChuSIvVGlet3f4Q7GtOGn8ld7q66yz7Tm7qm6QyYaCK5Vzjb/B5
	vQ6ZAgzGQoLhpHGEYzAKLuJ6BUzmxpSzou8S53Qjvxl/a7hjOgniEy27/5HEQJ3RfGjzaJdfOuj
	QAR8QycuzKhS0+1kFBGMM+x+nJnixWr3EXvo3Ar+aeU3ewkte2crummS5xsRtkyuAeEk23PLs3/
	rXI8uW6jXOA2nzgWPvfCc/5bpnRhijnlBS6JxliaDLr3IKC6o=
X-Received: by 2002:a17:902:cecb:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2cbb74feb9dmr68570515ad.12.1783276967665;
        Sun, 05 Jul 2026 11:42:47 -0700 (PDT)
Received: from localhost.localdomain ([2802:8010:610c:8c01:940:5638:6c2d:bc2c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b446a766asm51146780c88.7.2026.07.05.11.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 11:42:47 -0700 (PDT)
From: Agustin Luzardo <agustinluzardo09@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Agustin Luzardo <agustinluzardo09@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add quirk for Redragon H510-PRO Wireless headset
Date: Sun,  5 Jul 2026 15:42:27 -0300
Message-ID: <20260705184227.113588-1-agustinluzardo09@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device with USB ID 040b:0897 (Weltrend Semiconductor chipset,
sold rebranded as the Redragon H510-PRO Wireless headset, reporting
"XiiSound Technology Corporation" in its USB string descriptors)
reports a constant value on GET_CUR for its PCM Playback Volume
control while still supporting an actually tunable volume. This
trips the sticky-value detection in check_sticky_volume_control(),
which disables the mixer control entirely:

  usb 1-4: 5:0: sticky mixer values (0/100/1 => 80), disabling

As a result, the device boots with playback volume effectively muted
and provides no way to raise it through the normal ALSA/PipeWire
mixer path.

Apply QUIRK_FLAG_MIXER_GET_CUR_BROKEN so the sticky check marks the
control as get_cur_broken and relies on the cached value instead of
disabling the mixer control outright.

Tested by backporting this quirk flag and the supporting
get_cur_broken logic onto a Linux 7.1.2-zen kernel build that does
not yet carry it, and confirming that after applying the flag the
kernel log changes from:

  usb 1-4: 5:0: sticky mixer values (0/100/1 => 80), disabling

to:

  usb 1-4: 5:0: broken mixer GET_CUR (0/100/1 => 80)

with the control usable via the driver's cached value afterward.

Signed-off-by: Agustin Luzardo <agustinluzardo09@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 0000000..0000000 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2211,6 +2211,8 @@
 	DEVICE_FLG(0x03f0, 0x654a, /* HP 320 FHD Webcam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
+	DEVICE_FLG(0x040b, 0x0897, /* Weltrend Semiconductor, sold as Redragon H510-PRO Wireless headset */
+		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 	DEVICE_FLG(0x041e, 0x3000, /* Creative SB Extigy */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x041e, 0x4080, /* Creative Live Cam VF0610 */
-- 
2.46.1

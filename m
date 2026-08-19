Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D283AAF7F
	for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787099578; cv=none; b=DsIEV6u6gf0nKAHJ1qA2tlK1Fs8he6x6Bp1W6Es3oQlsxVcSutG2gN6eWBp2FtSF5sejCv02oYLkiqd0xpH53Awd1AsY0Lv4JDG9ou8mFRAukQQrnJ6yKKU+MbYFIglb+nU/lRemAHU4EWFioE34YhPwSdajKlcgV3Nra/W89W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787099578; c=relaxed/simple;
	bh=Xzwl+gS1UQwpxKmfILTAXukxaPf/H+gtb1HW3GLWqjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oem9hXYpC+vC7hwjjco/5w/ByM0UXJA7/XXQyD7uA2yecyA6Ub17pPZ3GystOv7fLA/LyqpPuIZ6qKdawyqfsIaF+K4EkW9HcrkfzP6LDhKDV8KQanm2BxJ+j02kRbZpCekSrNNfbZEWVl3f2DnAv4mRSfO7nd8MWfCARoEZZ8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4Fp6QzD; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4Fp6QzD"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8486672f03cso614873b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 17:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787099574; x=1787704374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rSdlkIT+CyuklnSl34GlztSq40i6APYLO7K1hmcwwJc=;
        b=c4Fp6QzDs7NcjcSzTwiIg13s3m70BnWNFJt3StmoYhO5dLqdVs/Fknxoal/PLMkDL/
         qL2k6V1Jv6JLYUoP6upAprqWW4tus2YwIpPZDtVZRWae/qoWouo2Vlx+xrt5ar6LvWNS
         WM5vrGlfChIYCvUevilH1GvFf31aT5ZqLcqMKx2xulX87me0RvRJ633mvfw+jjaDaR4n
         uieAiRt6vsQqzdYqCJMCaLDlfcoz47OSKJW9HzRVxHaetQMmrWVker9hsyBb7qCcwu76
         Oyhz7JF5dK5FNfpPqRjjOZs2Q5+Oa86FuBcc1JICB4Rh7NrzLCc23ZUskoFKkrF0Wwcj
         VG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787099574; x=1787704374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSdlkIT+CyuklnSl34GlztSq40i6APYLO7K1hmcwwJc=;
        b=jaE8hEjZ9QYEoeVg54hdgFyIQdNkjjCS0iTsGQexVd2BEh5NvNIgcFLMU2sUwDLIQE
         mIkeYL9K6YIweebnBjntAvVYQu9D2slCuUOhGxItEABUys6ePYyhqnuoDsZ7ZL8rjKGS
         v7OaYxP6Pip1BpMLTWwt3udBZ3UhEtvVo+XE+5luJw75VQPRl07M7x4hzW3jFFghFCyj
         EpJopLJB/vGnjMr8koBxSwxc8qzhraodr5b84hnDmNCJc2Ij56IHt0cW0VcOnNl3ZxoA
         lMqaabS2W/Ovxn8cZPIdd5bkiiwqhly8WUbhz+5wJG3f5oGj4YvJFCsXW13TAFr2JQGZ
         l4bw==
X-Gm-Message-State: AOJu0YxBaDbdpE05G8BzE4HHETNXi2XPi8EhZvuBOX6DrMx3ZBp5M0FL
	GHzzKdfJxilkpi1JgMdyTBjhpqEy6inwRL6mdQ8fxrUvjyKu4e+IBh7T
X-Gm-Gg: AR+sD10x/dN+fp2nLHCfYw4T5X7UtwboAq53NF1kRKIa+Xkq+SYjzW73SirbD2IpOW5
	HAw9WJFJ2uZh+I7yoe9DNA+sb6RcoR8k2dH5iaVZS0WCCaLOh1yo6fxPRnB789/+wWBxMjdYtdJ
	KMgRnvDPVMPx/p1o6K7zoTvAOHlF6r6wjmGWMOQw/md8VRSoieYniiam6FK6ia7fAhcGVUadhEn
	ktadVRrKh6NqIHnA/v9BhFVy7BRBAuI07M3u8tdUD9b2GQiYFUDYU6ByuixaHNRq1pc0qsRqNBb
	AE5JMXmXsarVzhucOAhtmK/zj8o5PRge2CqpD2l2KkTQF4UiHzO4uqqxrcb37UcGXJnJQjYQt2O
	MYzqr1AnDEwtM843OPoJk3ZDZ6DXsp9hF2+J3yHMkbNopbVavZr/v/m5GMSHGIBDFi5dc6vFVof
	Sor/JHvzs+kpe/Z+/0HNVdnNnHQMkeXgAzUJEuI293FiN1opDXvcDL1MkYkmWZsVJ49a3wM7f7Y
	WcKfijRjxZa+PK+T6v3ieXiN2B7Uo5VKBx/vPdh1WVFCmRAnLL2
X-Received: by 2002:a05:6a00:4392:b0:842:7296:dba with SMTP id d2e1a72fcca58-851d384e9ffmr1054031b3a.7.1787099573959;
        Tue, 18 Aug 2026 17:32:53 -0700 (PDT)
Received: from era.lan (dhcp-72-253-4-232.hawaiiantel.net. [72.253.4.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15568c722sm44374a12.24.2026.08.18.17.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 17:32:53 -0700 (PDT)
From: Chad Talbott <chad.talbott@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chad Talbott <chad.talbott@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add MIN_MUTE quirk for Creative Sound Blaster Play! 3
Date: Tue, 18 Aug 2026 14:32:37 -1000
Message-ID: <20260819003237.452807-1-chad.talbott@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Creative Sound Blaster Play! 3 (041e:324d) exposes a Feature Unit
volume control with a range of -44.00 dB .. 0.00 dB over raw values
0..88, but raw value 0 is in fact a hard mute rather than -44.00 dB.

Tested on hardware.

Signed-off-by: Chad Talbott <chad.talbott@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 4d2957e..6f1538e 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2219,6 +2219,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 	DEVICE_FLG(0x041e, 0x3000, /* Creative SB Extigy */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
+	DEVICE_FLG(0x041e, 0x324d, /* Creative Sound Blaster Play! 3 */
+		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x041e, 0x4080, /* Creative Live Cam VF0610 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x045e, 0x083c, /* MS USB Link headset */
-- 
2.54.0


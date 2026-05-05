Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636A93B0AEF
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 16:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999482; cv=none; b=I/Fwvtd5W+idAV3PWW5MThUSMDJHVZ3e44amjilWOv+VYQDY584CmR9xDQWEoWfy/Hfgu8zfI5fn4GZYwWE6VmbHO0TE5IMB8aleNIrgpfBv+8mkaX2qw9q/xVNlX0D2yluTwFFQoXVIpgsjSRd51BmBGNV4lRwOkT0lauu5M74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999482; c=relaxed/simple;
	bh=uypLAyjw90oFQ/+Y0FHIYKvgCxLddwNhB5cC5HDCesw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YSNTfBuuL3gp2l7ku2e9oqmhfzq5WlaV9l6UQ5VzRLtfDzbTRTVd/KQow6jtcS9mXLiynNdWltyxCaB0xwY8SxpHuW8cdTq1VWgqOGrsv1mhV/j8jIaiOHSBftKFyZMKbUqM50B6zbmV2B+tw7XodbJ+uPiDCIBv5MXucO1iYf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYIeVvDB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYIeVvDB"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so6331598e87.2
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 09:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777999479; x=1778604279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nk1ul2e424nbnQK7XaaUkRCRZ8yAoycvZYCihdxL1eU=;
        b=eYIeVvDBKo6g1VG4KLkORMMp2yXeD/qvNZ6YY7aJla81bkOK0JsNd8o/4tUgnF6dz8
         lK+D4qvmUHAvuOFVlBU0uwIcej8TgXdO5nZYkwpPZrsHmsq+ocUS+WDdDwlEjP8YaEIS
         YHxo/16TWwJKJBzNnRZKNqLfih9Mzg+1pzwNjgK6u66x52EVuOE31K3QsLIpig32A191
         ZBcHvk18IehMCadIthUPmLqcuPG/A/lwPuA0rSvGFqsg39GO7Ahb6td9AzSe141H5Qhs
         7F3RzdDmyM9UQYGYy0tmgdCzHuNqAOBlRfhCr5kkP5txdl5Kw0xciPRTSs5VXyEG9DIK
         Q9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999479; x=1778604279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nk1ul2e424nbnQK7XaaUkRCRZ8yAoycvZYCihdxL1eU=;
        b=i4dlRZ4lGkYWUJHcse3s6HTg347CZGSL8mwzGpj417Y+oUXsLhwUiU4VNZ3iuycgll
         Kf2dszc+m/WPTHAgbTGnl4MG7lXcM2t2PHRwo726WoQdyTMnZLIpn3RTiq/lxIttuv3H
         XMm5gtn6RG9clCM5hAyPwyR+wku/nEdMSrk0HHm1zBcsV9bmA1tts3D3OD2mGn5qJneB
         7gDF4HN+Jzdq3NKFHYXEpa65ZP9hdMdvFVnEsgmGJv+ZeRPTKbPEj8o6q+xyTHAH/5h1
         9cB0o4Xx3ezQ+oYJtgULoEC4K3DVDaJl/YqjxeSwyAEmKcmm3AK2RzwuoYOTLQW5E+2U
         cmPw==
X-Forwarded-Encrypted: i=1; AFNElJ8OODjJa/2m7JqVzRKVJUOgTTicDt28QAlrMld7MbUpOg1Y+Bc7OzuQkhyQV65h2iFVI7X2FBH8HEbMmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLMgK3+7JO6qk8s5lpQotZTX1LF1QwvNdhT+bvbOrUfHAS+YV6
	zwbtbMBhy+9NBn+Uv0bbhFkORLb8cU/AXF3xcGeAltaiujJZtCktHlcW
X-Gm-Gg: AeBDievU1CpesgIlvUfGDrX9CTWI1lQXLNgDFo9gtLQST3ip9GcY6RQbsz50+rkHrZp
	u4mZ89MIL7+4/X7QDTzUxYJw5JzkE5wZFVeR26CpNsLxdjskw1Tkd3qyDP5RASYPVvZKxpgoeDe
	msismkIPN5boTliuTO5rZwtYcP++8x4DW1cVTflxIRsNIg3EpTq1r/CdchohGelzNS3xYgw0ACZ
	cZTAess5NB/R/lSohze/ZBdR5K5jKXmkb86ZZRzdk5MJ4UIfszfHZ5K4yxR9V4w7rEkLmxDeOZG
	NoqXD0kvA0f8MlkJpJKkG4dDRBvt8jD8595kV+NyWeTNovtcIuZkjTysLeTbIgdI4/4IoC8wrGa
	Mc2wOqDkxfVznh6T0HmC2dINo9RHKhYZ3nMZGo4Km+gbSimgXjzOFCFSwLIJ/dLCj4IRwjLLlbC
	4R9EajvDjzIbebNkCt97ye/PJKOGVaaaUxxNaIxMnx6jUMm7CqW2S0d2ii3U8eAqq4vBzUPWwss
	+vW
X-Received: by 2002:a05:6512:1154:b0:5a8:7d6c:8b82 with SMTP id 2adb3069b0e04-5a87d6c8c3dmr2298430e87.7.1777999478574;
        Tue, 05 May 2026 09:44:38 -0700 (PDT)
Received: from iszonyat (host-185-69-74-59.kaisa-laajakaista.fi. [185.69.74.59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa3d540sm2934259e87.17.2026.05.05.09.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:44:38 -0700 (PDT)
From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	sen@ti.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	nm@ti.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: ASoC/ti: Remove myself and add Sen Wang as maintainer
Date: Tue,  5 May 2026 19:47:44 +0300
Message-ID: <20260505164744.16134-1-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As I cannot spend adequate time to fulfill my role as maintainer for the
TI ASoC drivers, it is for the better if I resign and hand over the role
to Sen Wang.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 MAINTAINERS | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1575f1d2d8b..8dd2df6a6452 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19464,7 +19464,6 @@ F:	include/misc/ocxl*
 F:	include/uapi/misc/ocxl.h
 
 OMAP AUDIO SUPPORT
-M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
 M:	Jarkko Nikula <jarkko.nikula@bitmer.com>
 L:	linux-sound@vger.kernel.org
 L:	linux-omap@vger.kernel.org
@@ -26366,7 +26365,7 @@ F:	arch/xtensa/
 F:	drivers/irqchip/irq-xtensa-*
 
 TEXAS INSTRUMENTS ASoC DRIVERS
-M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
+M:	Sen Wang <sen@ti.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
@@ -26872,12 +26871,6 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml
 F:	drivers/iio/adc/ti-tsc2046.c
 
-TI TWL4030 SERIES SOC CODEC DRIVER
-M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
-L:	linux-sound@vger.kernel.org
-S:	Maintained
-F:	sound/soc/codecs/twl4030*
-
 TI VPE/CAL DRIVERS
 M:	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
 L:	linux-media@vger.kernel.org
-- 
2.54.0


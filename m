Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631A923D28B
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761935723; cv=none; b=iqxZ7EEAcAou4OSJ7Q+REcHC9871Ub2ZkBSXZNYbZ9vw7v9k2ZD3V437mCA0dRLsF11PjMB0kENSj4fiZnDhTFgkn1AE5GFRQmLbTA/33iOSUtRYOyXd59raOz3HbdMcYBHR3J4O1M5S8ltb4Sx/epHIpqOg5/4a5kv5JlwAJDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761935723; c=relaxed/simple;
	bh=c/8/+M653DTwkbqwhYjF1shgjzt0LxyKcM/hKbSTXvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G6v7jTUyhMT9IvHFhiagCs99d+msdKIIQ7CrFmGYIQuE1bFJ1uHi/ogQLiBxupdSQDbvyNal+2NiO/umkoK5SQfsADeDuEKu0vgl0ZIWPkjnHt3xN9rGDjnY8sjFe6SpJhPBMWIGL2uZSJ9biWBq4LG4zSexYw9RS5ioCd3Bq14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9kCMXcW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9kCMXcW"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429b72691b4so2397774f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761935719; x=1762540519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iT0A4z5+5/yx9fDx0U3h5AA6nOCS4tUDygSaOHDUAWo=;
        b=P9kCMXcW0hHS8Wta23iW1z0HVYDa7H4WGe5dxypdsZigT1YiNzX1lb1aoevcngox0Q
         JAJqaygCL0h2jr0B7v3D6sbCtu6kyEV1nkNttUf1tEryobLwvPuwM3h/aT8ouPQfnOWV
         8k+FDvXs3uaSDzmRFh05S0AfBeRnurDl2HByrwELS1V3LME3GjleEXFq6EcqtVNzjCBK
         TOcAj4ZhVOu2r5NMZ5yf37U+KIAtn5JrNL7YQZZ8/F8MEs29H3HqeVBSkR1EE3jGsSfl
         T9iiqQ8Pp5BE6jCrCCwhoxmmF5wANU/wXotv/yU8vqlYjSPgIpWYrB24MMoXs5tp/b5v
         eNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761935719; x=1762540519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iT0A4z5+5/yx9fDx0U3h5AA6nOCS4tUDygSaOHDUAWo=;
        b=hCpiciQ7Mt/v1fR9eAmQgfjYnCUYNX5uJBy41VRRiBFgAlw+c0nyU8iihwcXfVn+m2
         QOdDWRWvQyo0eYYA/oCCJQWVHmDg2ovr/QMGjrSC4kQtKIjeduIORLBgoQ/6LwNZVlRX
         OCdVyLL/7VKSpNkPRMVF45gcy1K3hVCFX3h5KtnKVQ8AN+aaDNxPuJWmK3Zbuc2/trQf
         Xh/zWc05vgbpXkBY2jfQDfxm7TvrrubxjTMotdVnQ+rNcPSVwNt5YBmOXgK2ZESi9d2S
         8uhqrxA1JH/lUFZSMvBuJSF84GRZfc5MERla/87d5EfijFMmoaS6Q+GvPmZiZC1neMRI
         cu5g==
X-Gm-Message-State: AOJu0Yy6Fc1NT4Gm5PgpF0WmrzGp0cfqGyB8t2jwxZpxXDPZ0WQqiG23
	euEzzgWXS3ovgvi3umN8W5yMYKYSOBKgDDLwRg1tr6d6QvXgyR59SnAw
X-Gm-Gg: ASbGncvNYL3OBwPjodoTq4XLq4Jfh7+9UtvkUUD+zdroZtvluVwJffaT1Yp7WuTii9b
	immvrVqkFzVoPtg4eLK7zDrBLlsuDb+QqPq2VQmA35eUAczT9qDRWOSGBRFhZi75rGwoXz8KCtH
	H4WxPdXdEZTOM8zPNurJQRKasaB5bJPemZoGsh4/9/vk18Baw0QWqOfNvBDqpYJ2+Rvpxoo7Aa4
	8g2c0U/IisARicGdKNq4bbUs78EB0sLFqWjr8aRY1pWOCIhe2wyGm+I19l9zeW3UfRdqoOJHtTA
	L19bGGzEH5vgaDFO+KTYyXn97fMczB7q8TsjcfzLuF9xaW9mOZyX4cyUd6T4bZDhNdDkPZO14Y2
	zHsRxPKJzv+zBHhIwqTKfry4yggZ4kz0g/P1lwruW4bzAaUoSDXvLF8BmJ1aXAqwY2b18eDTmba
	VDTASy3RkHlVvvDVbb67M8KsvIpNQLEJNlbzFE
X-Google-Smtp-Source: AGHT+IGR/czOBAwcuGk1imiVf5VtUQXEd72fFzraprg+CV+Rs7Bpkn9+8+cZs/cHVjNqRJkrMp4OXA==
X-Received: by 2002:a5d:64e8:0:b0:429:8a40:e995 with SMTP id ffacd0b85a97d-429bd6ece4bmr4950485f8f.61.1761935719136;
        Fri, 31 Oct 2025 11:35:19 -0700 (PDT)
Received: from pluto.ws.lan (linux.karinthy.hu. [195.199.149.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1125ad0sm4886991f8f.13.2025.10.31.11.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 11:35:18 -0700 (PDT)
From: =?UTF-8?q?Baltaz=C3=A1r=20Radics?= <baltazar.radics@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Baltaz=C3=A1r=20Radics?= <baltazar.radics@gmail.com>
Subject: [PATCH] ALSA: line6: add support for POD HD Pro X
Date: Fri, 31 Oct 2025 19:35:14 +0100
Message-ID: <20251031183514.40926-1-baltazar.radics@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It uses the same protocol as other POD HD models so it just needed
proper config.

Signed-off-by: Baltazár Radics <baltazar.radics@gmail.com>
---
 sound/usb/line6/podhd.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index 70de08635f54..ea1324c22f46 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -26,7 +26,8 @@ enum {
 	LINE6_PODX3,
 	LINE6_PODX3LIVE,
 	LINE6_PODHD500X,
-	LINE6_PODHDDESKTOP
+	LINE6_PODHDDESKTOP,
+	LINE6_PODHDPROX,
 };
 
 struct usb_line6_podhd {
@@ -440,6 +441,7 @@ static const struct usb_device_id podhd_id_table[] = {
 	{ LINE6_IF_NUM(0x414B, 0), .driver_info = LINE6_PODX3LIVE },
 	{ LINE6_IF_NUM(0x4159, 0), .driver_info = LINE6_PODHD500X },
 	{ LINE6_IF_NUM(0x4156, 0), .driver_info = LINE6_PODHDDESKTOP },
+	{ LINE6_IF_NUM(0x415A, 0), .driver_info = LINE6_PODHDPROX },
 	{}
 };
 
@@ -528,6 +530,18 @@ static const struct line6_properties podhd_properties_table[] = {
 		.ep_audio_r = 0x86,
 		.ep_audio_w = 0x02,
 	},
+	[LINE6_PODHDPROX] = {
+		.id = "PODHDPROX",
+		.name = "POD HD Pro X",
+		.capabilities	= LINE6_CAP_CONTROL | LINE6_CAP_CONTROL_INFO
+				| LINE6_CAP_PCM | LINE6_CAP_HWMON | LINE6_CAP_IN_NEEDS_OUT,
+		.altsetting = 1,
+		.ctrl_if = 1,
+		.ep_ctrl_r = 0x81,
+		.ep_ctrl_w = 0x01,
+		.ep_audio_r = 0x86,
+		.ep_audio_w = 0x02,
+	},
 };
 
 /*
-- 
2.51.2


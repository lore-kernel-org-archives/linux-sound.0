Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29682D5932
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776763333; cv=none; b=bWAgvI1qwq/cHyFSWsctsGaKhPLWr9BHIlo5Mp2uwZc5Vela0V1tFX77K+2uinGfijQzkeQaSuMqDQ0WfIcoUDho+SY2W3d2P6e098GdvxZAdyWzsNrR++9Bzt1thz6mbu55BNEbMv7Zz0aI7gTwSpkGDZcH6FtDGXWxGtRIEUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776763333; c=relaxed/simple;
	bh=9M2AwKbS17ofIRC1yKJnKMvxXvh5B8dm90olGnxKxtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFngf+qjLRKs1wil1c+PvRfzu5qVbustzZEjC6/xj2wXtSj70A8sc5avFPbzID39fHfwXLnt2vdCmNW9O3LlaDDpq0Uohh+6LtMvey45gcGmrzBeYCgzpVI4rGbyaFW4MpaOq3eLzh77V2tRKfGKd1B3wtM+9aJIhIslsq3AqWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EibBHsu1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EibBHsu1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso54487705e9.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776763329; x=1777368129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvcy9Cm0dO+sAARuv9TtsO6nBbvdmETJEWlG1mdfgCM=;
        b=EibBHsu1C/pw/ErK4XR8MIh4YKAFk8DmH9ISDGWZsQF2+yuJYWj7aITj1DT1AEQpqF
         N6Ol+XN5ujTBSaonnVzTnL7Hk0aiLniYYU82UZXOqgy7KNJAe33UhhTKLIyEq6aq329O
         /Lv4YvhWreiYOO/rt3LUsnKE+1DaY6MdMoCD4qNUA6YYdbbuYAfnx/WlJ1paX0sjn4cw
         C2BgTXW4JEDL+MhgK+3yAfupIY8NzVLPCjPBC0VYFoblwiSPeC0u9lhRPB2xGLutzVn1
         WyBoNTskMZQlYqpx06YNEhxPLAXH0CiQ/cm4vjjLhzva4K6XofpMZU8adCSBGe0Tm5d3
         YDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763329; x=1777368129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvcy9Cm0dO+sAARuv9TtsO6nBbvdmETJEWlG1mdfgCM=;
        b=NfJiaI9ejgtwFYgjCRjsPjr5vs84iGT1M1ppNz/KCVjd1CowM+NdnKBSH7TaXb/gbv
         EUJBqyrIt34MNTasAge8dvj5eQeHwSEHSwsA/8at5oTljyAMGg4O/HlkcGuTPRrDvfDM
         /vvS8oiC6ejTm/THXf4K+91KMD2HaYHAIxy4cNdD5JbIIXVsKaZCrUFLrLf+Bax+Khbb
         wY6puHa+EDAytXJlEtHgHqv/X1LX77cDofsvO9o2+o6xaGSoT5XStxODc5/+mCCm502R
         tI/Atu1iZzHcTFMlXb0O5xMV+yZRKJ1VbTEeONouBK2wIN4D9Cw3ArkOD1sTcNMxYtnH
         mgyA==
X-Forwarded-Encrypted: i=1; AFNElJ8A7aP0t3Vd7nrysQ+22Eu/CoNvHYujG5M3+RN1nqQOZ8Hk8JbeBrPZktWD43N1ipiBnP3ZYsCObxaukA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJIwI8rJpZAZSkz2mmmGjjP0IL5X5uo66rjWID7iAGE083Hse
	UlcioQBqq/o7c208ulK9BGrd7AdjQLGr3EEl2h5N3+zeB2FRqDVg4UE6
X-Gm-Gg: AeBDievXJ/Vj0FxLMroBelr23ZMGZcTkXHM+KxiXWxYBv4geki8fXMk30y3KE0Uv+Mq
	bsLNXfFa8LhZ/0eZH9UAiTO/wOAXtilU7XQzTKseI94p8UEmDogrzHC0hQcjR/tcz2wkWFb9DeD
	RJq3hRDgifIZGCbQVrLmO7t0PduskRLe6aZDfyk1NdeOO4GnM/EqHj4Z4XBk+WNWm2htbrrRMu3
	sE926g5HER7+vAa+6eBHPS/HEICjWtaHUjOXLQamd3zkNYNNNCh+59/2HX6AXtlcFXakgbDm1Ya
	dz73MHftw/36GARHq8duWP3X36SRZdec1VpcA0zIp7KkF7usKoAC8Fu2Cr/u6Zi6iQM20kYBE8h
	+MdeD8UtddzvdiYag02SmD1JY4WkZbts5QPulICcDnn5L84sSH5HK5EpXkLsr+RaoGIs2DSG7tY
	N0NPuNAzfXWQwWawDlR9rWsZBNEIrfUwXYoAgS45GIOhBXrKMJxruxrrDTRC8PjZKoxUACUyssQ
	zlaVR7w+9B8zeau2jSUuGrF
X-Received: by 2002:a05:600c:621b:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488fb742e74mr282120695e9.9.1776763329023;
        Tue, 21 Apr 2026 02:22:09 -0700 (PDT)
Received: from Friday (dsl-197-245-177-193.voxdsl.co.za. [197.245.177.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm587522455e9.3.2026.04.21.02.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 02:22:08 -0700 (PDT)
From: Spencer Payton <spayton681@gmail.com>
To: alsa-devel@alsa-project.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Spencer Payton <spayton681@gmail.com>
Subject: [PATCH] ALSA: hda/realtek - Add mute LED support for HP Victus 15-fa2xxx
Date: Tue, 21 Apr 2026 11:21:44 +0200
Message-ID: <20260421092144.27099-1-spayton681@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421084918.14685-1-spayton681@gmail.com>
References: <20260421084918.14685-1-spayton681@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mute LED on this laptop uses ALC245 but requires a quirk to work.
This patch enables the existing ALC245_FIXUP_HP_MUTE_LED_COEFBIT
quirk for the device.

Tested on my Victus 15-fa2xxx (PCI SSID 103c:8dcd).
The LED behaviour works as intended.

Cc: stable@vger.kernel.org
Signed-off-by: Spencer Payton <spayton681@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 8087eaaf1..f0ad1e989 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7164,6 +7164,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8da7, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8da8, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8dc9, "HP Laptop 15-fc0xxx", ALC236_FIXUP_HP_DMIC),
+	SND_PCI_QUIRK(0x103c, 0x8dcd, "HP Victus 15-fa2xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8dd4, "HP EliteStudio 8 AIO", ALC274_FIXUP_HP_AIO_BIND_DACS),
 	SND_PCI_QUIRK(0x103c, 0x8dd7, "HP Laptop 15-fd0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
-- 
2.53.0


Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEDB2206AC
	for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663065; cv=none; b=sYhCEVi5PF3dep8Ti12rl2yNd2ikyRCBynPVY8TX9ngJyNyF9bnjV5tE0iblsBL96kqKxdsYB8HnRMHt7tOFGp1OLijOumrPs8LgD52HoYfw9kMTqSkz+UqkzlGqCPiLa8vKA+UrkFIQRr8XyRPvXUR+f/IhSVOzger52LX9WSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663065; c=relaxed/simple;
	bh=6GXTTZ9ch8wDU2RlX+Spp0CXinqd4MYFtQfY1P0vQ+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uAl5qonue09ws34V4Rd96/x2nVpSO8SsyPBErys1LZJ8HtX2mntfPOSuKBYXPo+6MYWpo6A8EUOdIirOeS7WRWllJDy89YxSKYMX7Gg0A8lKE3DY2LzhZlBb/wIPlQ+O5EAHcsOYyhTsuYrrIZ0sfJvt56t9b7V7vihdG1U7hy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Ag8Bsa2H; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Ag8Bsa2H"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-390dd35c78dso1025044f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 05:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1740663062; x=1741267862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=84GLyeQbX1lpwPvuiCb4KHTMXRHxePZ9hgGZvycnM/s=;
        b=Ag8Bsa2HKTcOqz4q9auucS9owSXuEUjnqmRDivnywwdGtnBQrVg7NIoIz6ZKcrSw4L
         DDQMui3svV6Xx7fXbageBPHl+o8BwpWag6q/JmzU4r8uuSLiVn4sImc7WQMe92p4QX0I
         5rEjK47DenfCiQwdDrP2y5nyyp416coEJ30EzLBV5wizU9RF9mqt75El9KK2enpg6S4+
         pvkj19uM7Q99YhnDAsKMGl8ZQ47a/mVFb9nBR4F7D1MZREaSPZXLh6xoFu3yHh/QQwqh
         9bh6OvgrD0opMJr4/GoBEnS/UrH75Gyh5mwXJO4yEGvsu2FN2togQgIW6iWVjOqMhHkz
         ICcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740663062; x=1741267862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84GLyeQbX1lpwPvuiCb4KHTMXRHxePZ9hgGZvycnM/s=;
        b=ODfj/R7HtTb5sRyuOdk3WYX4oYen6x7aLaOCm/mO/5o+UGtxY9/G6JwgTmLygl+zr+
         9H+TK3IDxahpWewbjS2KQJ8dWaL8vCSRP8RU1QmjoyhzmIHQ+4GIYuryWqn21k0voJBz
         UMe3H2Wq0rDb768eGintyMBWM25ivGsQfMv+W/gFbR8Gtf9k81IF5Qz/IvRSrBuUR/hD
         cgyc4BinT1xI5c2DcwLM8hNds5/O3KCkEcegGV5w9EVFUTtSCYBwc/MIknwWxL+/Mrvt
         WCsa7klYnS5GfaCi/+gf1dMCbN430HfxlNVhCOLhr1GKsmGyyYGRGx62D4JyovEKgRZL
         uDXw==
X-Gm-Message-State: AOJu0Yylu/NBl1V9sMbmj6Vrz44LhHWXm60rtBl0xuPjc4XRrl0atFkZ
	+FR40h9nOPawHPzusr2Gkff2knGWYeBO/AOPKQQdjJtHrJTQcy7bvULKCKCHJOA=
X-Gm-Gg: ASbGncu5CcUEVjnTQ5JI4RiTTHM1tm3zUNdgXNcf0YXTqd2idjkQ+h56MXIBzTDzGfk
	Cf1JhgN0tDVOFFEwlsLPcNYYXOTCr9L8ZnGfwmO3wPVpG9602ZLX18c31oszeUuqomEMnzxBhHJ
	5hfprcBJ71p27lrhzdNXByhQ5mv27iVXHFv0w20wj3HhlBdF4AFIhOS7++tHHI2ZprewaH41bJQ
	YusMgOe3seOBLy2rUONn/VJagJYzHBrCEqtB1cctDVDjSlR6DCs0EJUz5acGoJs/yhS4n5OzOtq
	DmgV+c2skH+bC1JiemzbIzBVRuaCupmFsqa97qJtWC1J
X-Google-Smtp-Source: AGHT+IH26EXF4w/rSiOdSm8W/0RRIe96JkFmdUs1HBIOS0PoP3MGiWeK7seahHswLCPPKbEJUvjYZA==
X-Received: by 2002:a5d:6d8e:0:b0:38d:d166:d44 with SMTP id ffacd0b85a97d-390e18d1aebmr2846786f8f.23.1740663061515;
        Thu, 27 Feb 2025 05:31:01 -0800 (PST)
Received: from STUDIO.. (p579d906e.dip0.t-ipconnect.de. [87.157.144.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba53942fsm54985525e9.24.2025.02.27.05.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 05:31:00 -0800 (PST)
From: Amin Dandache <amin.dandache@googlemail.com>
X-Google-Original-From: Amin Dandache <git@amin85.de>
To: linux-sound@vger.kernel.org
Cc: Amin Dandache <git@amin85.de>,
	Amin Dandache <amin.dandache@gmail.com>
Subject: [PATCH] ALSA: usb-audio: enable support for Presonus Studio 1824c within 1810c file
Date: Thu, 27 Feb 2025 14:30:27 +0100
Message-ID: <20250227133027.21148-1-git@amin85.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for Presonus Studio 1824c, a usb interface
that's UAC2 compliant and it is enabled by identifying the device
ID 194f:010d and works with the code brought in by the 1810c change from
Nick Kossifidis in 2020-02-15.

More infos on the card:
https://www.presonus.com/products/Studio-1824c

Signed-off-by: Amin Dandache <amin.dandache@gmail.com>
---
 sound/usb/format.c       | 4 ++++
 sound/usb/mixer_quirks.c | 3 +++
 sound/usb/quirks.c       | 4 +++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 6049d957694c..9d32b21a5fbb 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -384,6 +384,10 @@ static int parse_uac2_sample_rate_range(struct snd_usb_audio *chip,
 			if (chip->usb_id == USB_ID(0x194f, 0x010c) &&
 			    !s1810c_valid_sample_rate(fp, rate))
 				goto skip_rate;
+			/* Filter out invalid rates on Presonus Studio 1824c */
+			if (chip->usb_id == USB_ID(0x194f, 0x010d) &&
+			    !s1810c_valid_sample_rate(fp, rate))
+				goto skip_rate;
 
 			/* Filter out invalid rates on Focusrite devices */
 			if (USB_ID_VENDOR(chip->usb_id) == 0x1235 &&
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index ed6127b0389f..79c8c1540ee2 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4119,6 +4119,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x194f, 0x010c): /* Presonus Studio 1810c */
 		err = snd_sc1810_init_mixer(mixer);
 		break;
+	case USB_ID(0x194f, 0x010d): /* Presonus Studio 1824c */
+		err = snd_sc1810_init_mixer(mixer);
+		break;
 	case USB_ID(0x2a39, 0x3fb0): /* RME Babyface Pro FS */
 		err = snd_bbfpro_controls_create(mixer);
 		break;
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a97efb7b131e..dea8bfaa7e91 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1599,7 +1599,9 @@ int snd_usb_apply_interface_quirk(struct snd_usb_audio *chip,
 	/* presonus studio 1810c: skip altsets incompatible with device_setup */
 	if (chip->usb_id == USB_ID(0x194f, 0x010c))
 		return s1810c_skip_setting_quirk(chip, iface, altno);
-
+	/* presonus studio 1824c: skip altsets incompatible with device_setup */
+	if (chip->usb_id == USB_ID(0x194f, 0x010d))
+		return s1810c_skip_setting_quirk(chip, iface, altno);
 
 	return 0;
 }
-- 
2.43.0


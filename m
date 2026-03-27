Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3874022097
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618574; cv=none; b=jm8lAItTPK4e2megt0EAzVeXM5bGv938DgG28TiCv3c3q4i5XvS+9J+ULXet5MbIX30yDhoZHh4VhqUmncaPiaol8glc09JpinI0S+aj9ZNP+8mp2M7e5f9LexNmN/qQBi/Dho0vQYpFHorYyy2O/iRtgzn7l962JOwsnQovyxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618574; c=relaxed/simple;
	bh=caDXwRT4IdAubwGVIsaYbrlEQg1KHeWZOprnqhUU8uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lwA+onxeDApyCIUiiW1iZUgh6LCwU1DIKZY09Syn1hZDe6jw20pq+FTzmg20uc61CeWjDwUSSWc5u8Qv44YK5v1IbVbWOxZ1SXyVxe6E7TwVW8ibeVdniIizRR22XjYwTbUp7Tyl/GpyUqLuMrGkExIZGE3ZOErJIeer1Cu2UBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjsACPst; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjsACPst"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b9b190easo1489598f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 06:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774618571; x=1775223371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gXFoVdYRjEqv+NaSvAeeFGV4EJzAS53wkG99S/k++zA=;
        b=LjsACPst9LQqp2xQ5MQgbsXr//tQq/CJLz8mdz3lyjlfWCzhYb5nccUt3m5HVW661U
         hQJyRF8vfUTaAb+sxpVTmSDtjdvwoQv34XOSyciKPzTZx+wzAopOQvrvue/MficKlMw6
         BF4HZtn0UAF5hjQII2Qfn/NANyOC/cKjFHAsCbhNey0EwGtZN4WNzKZ4vGimotfWOTfN
         GbTAsOwc5DnNkvkOZ3ZYOQ6SEzxbi43tFDQfLdQYkQkUocoxO/iJ6QCXkeW0xXXzL6GA
         oJLUOBzthBo3BxhCaBD11VNDKp9ScV2KvKm0T+Q5van6taQFgJqFv74E7R6zTDgU8smn
         A63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774618571; x=1775223371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXFoVdYRjEqv+NaSvAeeFGV4EJzAS53wkG99S/k++zA=;
        b=eBLKhwYpRrnImewHF0cKz+tE02twvf9Ox4w4PnOkLVA5g+vNnyYBnPKpTvmcGQTpU3
         V/BMpNtaRj3U7y84UMixWQTYOIT2xrkLcy5dvOfw4c9SFhSUz5fjPJG2JHK9Nvh/r9Dx
         ZKQhPDr/QvA5+cqH3FHhRldbejeOoH3usEdVHhtZpjTLGN5C2npbCQzOmXbb5K5gjsMk
         F+Yf4EEbit0LPojLakUrzr0XgA4Ss/fBVY6erMbxVxMuaBgHAOfH8C1YsUfMW9d373eP
         ZLe2E8oAswYukvPBU2LyhR7kMRPmT0DN3ECgvqfM4G9fxG9nKLs9c1SvHLhpA5CoMYTl
         MmsQ==
X-Gm-Message-State: AOJu0YwR92tbzIC+HDyRjQ62fZ8sC5aXwqMMT2mMBM+Zh+fJ020fuK6Z
	K1d/1AtaCYc6Xtex5SHG8h3wazXg/LoCUleXygqO9Nly7oZ18iQ5YAhOt+YsPtDp
X-Gm-Gg: ATEYQzwpfn/piOuKxsuaqOz9xr/1dZUjHwSduPUGxgs4gI1jdeFcoc12Ivww1x2arWE
	8jOwW4C8WP4F2mx9Gia0pV4jOJv9Cw00o5FPeJ4CLlULuoUhaiTolRYF012RrVEdAvyZnJ+noaV
	fmMSq6E5lCmKY1bc2Uyzorbi7xUGwW5+hJvXjX6dsDUhRUhYKj5UqE6DLkMO8SG5vmtPfxjtKYu
	c2XnLjawMngoJHiID7Zib5xHGX5e5H2ENNtTKy0oHfAbMYzYNk0BwPKrGFJRtHPskf1NODeREpI
	SVkuPesmnI3PcUpzShMK8lmVzseKV0IIfyqIQ5XxuH+KWe1lve1+6vqQqnj/L3Sycjrf/0JUyn9
	7ihRM/Zm8BgW9KSCD2p4vZseRdP4Y2YpfCEHiIbzC+kodSGT4/XDWEKbV5R/vLv8SPc0kDVCBbl
	1i1M+rr7ydwIBWVxdKTuegSAHpaRl5YhZLK/vcZnLo
X-Received: by 2002:a05:6000:2681:b0:43b:3e40:222c with SMTP id ffacd0b85a97d-43b9e9e87bdmr3998810f8f.26.1774618571223;
        Fri, 27 Mar 2026 06:36:11 -0700 (PDT)
Received: from linux-workstation.lan ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm15153101f8f.23.2026.03.27.06.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:36:10 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>
Subject: [PATCH] Add Line6 POD HD PRO support
Date: Fri, 27 Mar 2026 13:35:57 +0000
Message-ID: <20260327133605.36834-1-willerz@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Phil Willoughby <willerz@gmail.com>
---
 sound/usb/line6/podhd.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index ea1324c22f46..841b64479252 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -28,6 +28,7 @@ enum {
 	LINE6_PODHD500X,
 	LINE6_PODHDDESKTOP,
 	LINE6_PODHDPROX,
+	LINE6_PODHDPRO,
 };
 
 struct usb_line6_podhd {
@@ -442,6 +443,7 @@ static const struct usb_device_id podhd_id_table[] = {
 	{ LINE6_IF_NUM(0x4159, 0), .driver_info = LINE6_PODHD500X },
 	{ LINE6_IF_NUM(0x4156, 0), .driver_info = LINE6_PODHDDESKTOP },
 	{ LINE6_IF_NUM(0x415A, 0), .driver_info = LINE6_PODHDPROX },
+	{ LINE6_IF_NUM(0x4157, 0), .driver_info = LINE6_PODHDPRO },
 	{}
 };
 
@@ -542,6 +544,18 @@ static const struct line6_properties podhd_properties_table[] = {
 		.ep_audio_r = 0x86,
 		.ep_audio_w = 0x02,
 	},
+	[LINE6_PODHDPRO] = {
+		.id = "PODHDPRO",
+		.name = "POD HD PRO",
+		.capabilities	= LINE6_CAP_PCM | LINE6_CAP_CONTROL
+				| LINE6_CAP_HWMON | LINE6_CAP_HWMON_CTL | LINE6_CAP_IN_NEEDS_OUT,
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
2.53.0


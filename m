Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49AA29BD88
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776698661; cv=none; b=dXU902m3fyHWZSzu78Jbr2Rjm5cYv2rtClY1phwawSDu+HLtBOX3PHdn6aQLhORR9FefU9ADzB+YRp0XfrKUaO1CRBJuiutQsxxT9rG4RmxxYS4X03FqOvxCH8YBonNGKbxFdTrvC8ZRzrlzitvETyU4yluKqlAXix+ZX/7ngp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776698661; c=relaxed/simple;
	bh=ndMU5kWXLr8ViefoIt+Ns2OH6gnmERnJXw4RbUh5kGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHUjvEroRNH9mPk0Cl6KgoBxIgtftahYkXIsVeK4EbjHRwZTOcMm26gLX/1KcJN3LWaALTVTYmf0HBRaPDPGO/zpBEbNT+4d4PX+3nytoZIqCskIkiTUgsZ+UmJevtkdo9eYcneszBpyqQRo2Ou0RDi64JP9TLiUoaLPObNLblo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmeM1xXT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmeM1xXT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so9873745e9.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 08:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776698658; x=1777303458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Itod+RumDeY3weESm11K7okx/SDBYVHsFpzUagQcG2A=;
        b=QmeM1xXTt/MCnnlajLzdSMkvu92S1ik8GEUYBlzQc1cCdiEV+1E+eFmXLVwLwM6LoY
         7d7qGvRMIHkPEGQMbs3InzuwBXzu95PLjzFaA1n3BL+5bt8UMyUNAGdbQVkHlPeLvlFE
         cyHQ7j85TZ+tElEta1TH85Jv4J68EKCxiPRnmdZBVwlPeMX/elMY8QnfOeVJPLsvN1ri
         LTuLG2mot2M67rIu+oTAYoz3Yua2fRSV1MhdzibSGmlIWTOyCV3n7YhX6JcWg/LsBUOP
         /txr56Msz2W3bwIc6UDIHW++MYjaCWKcrKfPeav4uElzN4gdhaAbOM80xmALxI+wtx6W
         SQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776698658; x=1777303458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Itod+RumDeY3weESm11K7okx/SDBYVHsFpzUagQcG2A=;
        b=Qf48r6u9Sc8WWquDDeL/A9XGrtQQ1ha2JJYRAgEjyve/CEmNzSV3ZMMnnpepOXReD3
         Af1R4uAmN3rqi+dz+Dkm9/VDamI5O6ihIYW5UxO3dCp7vIqIUtmeLXdDjxIwdaB2zQNp
         9kgCO03jBV1KPZbDrgq+uutzfRESFZdVut2TSbhVAwpRrlvulZ60UhLIUxIlJ/bIp27/
         0TloP4643l6mMKsk39yiZNo3Cho1HWClSVDvhaUnwEXcvX/j3XwVBT6BnYlsbKCPg10y
         5xwOTyvcqcDfJqS7oknE14uJVyR6k0ZstLPhGHoPxOZMMHfW3Z2QdWCrehtuHKGe1NNx
         250A==
X-Gm-Message-State: AOJu0YxQOnUkhmUeFOIZs8rD6QPNBYTviGy1zmoAeGNgu4jknRUAOYBd
	RoChxuOU3n52Tdh1mNHST+zIZJtMLITA4zd0KvCI+6H9E5YruwaM4QumUuIqV/fOg/E=
X-Gm-Gg: AeBDietrtbmjbKKCHrrHb4fUU3mdAkT+dkGyL4UDwi8ok3zz4zTv0HpJuK8zCvSh0a3
	3oytwn8nOs+h4bjJ7ADKGFtyOqeWxW2M97nqqRNyynLxbSV9zjpKYUoa9ZgKBIOOyhbVyN3hu/X
	/w023e7cSIfpLXf73atlf6267S06IHlCw0cDjLAgkKGlD32VmIbTEX979wbo/RwACLL8qjzVbuM
	lWfLq+aMvq8si8CLI3RhiS6Vm4QZ8Ui9i/h5NxeMNlYBjIPbJB3qxmP0214YFTJwkX4jLbC2kC6
	deBFhiykAohXYqeDztcvyByVeDm4x8RUZD0S9nD1PP6amcpkKZcQkedBsR6jwScmwicjrOh5Wbl
	dJp5yIkpTsNJBCLnAObkj3Ym87os+koXa+1Yrf1rU/Facd74BV0FhCMsYysjIYBjl4MlEF4Lak4
	avoulrL9PnKZWhlIUx7Pf60oHlA3dhe6P7lO/yMoJr
X-Received: by 2002:a05:600c:8b6b:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-488fb8859ddmr188800005e9.2.1776698657567;
        Mon, 20 Apr 2026 08:24:17 -0700 (PDT)
Received: from linux-workstation.lan ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a18csm33909080f8f.20.2026.04.20.08.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:24:16 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: usb-audio/line6: Add support for POD HD PRO
Date: Mon, 20 Apr 2026 16:23:49 +0100
Message-ID: <20260420152405.7230-1-willerz@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The POD HD PRO is the rackmount version of the POD 500, with most of the
same behaviors. As with some of the other rackmount POD devices it will
not send captured audio to the host unless the host is sending playback
audio, so it has LINE6_CAP_IN_NEEDS_OUT in addition to the POD 500
flags.

Tested-By: Phil Willoughby <willerz@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
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


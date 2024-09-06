Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C84C1C86ED
	for <linux-sound@vger.kernel.org>; Fri,  6 Sep 2024 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725615275; cv=none; b=ptRRQtYvK8dWOlWVYIg4gG2QhKk2rVEIWgNj+0k0lHpi/FQdg3DKGSeMzgO25b5Dzxh6KxbYS7WpU8Jc4MaRhLZVJys6SmAXgnhlRsxfhvNSMyegIyhRQ+ZEyK230LXIX3zyJ2hfM1GZXTfFSM3BcgrWXnojtJXm51BvYcV1ozI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725615275; c=relaxed/simple;
	bh=LAhSTPhTR1kPbNBM9J93kO3uduBEsaKNKcW2jIBoyfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rsf6KFiBk6eipjB8FakE2diC4qNBo4aKejDxpsL7ZTPRbTICiUAqzZXzjjI+0kTRv2QoDQkgZCojbrMBd+lYjc3pHNkJX5Ycs4qW6yTaYr5uH5H/cC6q5t4oJA3YGk4dxEXEmKANk7A/K5EfNWcVCLgMJYbRp1KzZyDPsnshQbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OXj/OZA6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OXj/OZA6"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374bfc395a5so1025878f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Sep 2024 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725615271; x=1726220071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5cGUBAD/3eZ2qDRIuYLdtjOoYZxul0t5wVc0LvHf48=;
        b=OXj/OZA61Re5MU3a66I9D0z6xGYK1hPC3pdwerWjll5XEtip69OPUDxmPqTQHVWcxD
         lKYrSVwPf8OkanYwdbb5iDNRv2qU/WdS8K0bHW5KF/ZYJIikIRQ3wfaePJXa2N5eCKpG
         EUAQ+3ub/8yTgEJ6zvD36izkkQIu9t+5blrdWhZLqtcoGXlbbABl7jjlYQmPWKp20Ty2
         68mJd5bOkcmEdvfIYOGTF010vdUtdF6U5b/g9xV2utJaRJtPxJvWAKoXJKhC2yBbw+Pt
         hj62pnXZBSw9dOudRpIkYR+c/z4N+KxJzLQ2JNzRA05GMV1pIXN2W37RuDIRgDbmZEGQ
         R5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725615271; x=1726220071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5cGUBAD/3eZ2qDRIuYLdtjOoYZxul0t5wVc0LvHf48=;
        b=JhhBrCYnkiAEeMhEkm2Ag0WgoqQX0o1QP1vlKTBgk8eLsTy0irvQWt4zOuRpmfTgi5
         simeXob3I4J8nkaZ4gVdTkXsHEY8L+fvtURlt38EadumZa6qgFl/dG7InrEpMcpHLxz7
         ErZ68eJPUU0xen6i1XULowztLLTCkUK3HXozZYg3K7AzUX+NU/fJifNddlEjZBeevSNC
         Lei45GrYSE9swMCJzOQg06I6S1gvp8Qbs+K4OXFrdXM0f+5780XEksl02v/gMZ/6W6Jy
         PHwOkdwxhvVX0CLvUysQdvBX1SkBVoDTk78Fs4N4wSchd9ocOBNOmDiOMUrw4fnx96AQ
         9CnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX09IAs7plQzidqBcI8LwodCURCgyrbf1oLTj+05+Ez9XtPDiKfg3twXnzikH9QlAlTmLvkgSo6Utc0WA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6AiAF3RCC5goXd+UxIPYh78L6sLxGwylndo/Jd5OcvXkDjcnl
	UkVGh1ra8U3SWEM0W1se6K1VstiX+jClG4uWlzL/wtvIZgzwiIYcInlHLRuQt5z3ySp/xurKR5U
	k
X-Google-Smtp-Source: AGHT+IHPwi4fiSVRQwZiSneJMvLj61lfvtYJZ9hCg6GS9aV5QZX6/0gc6chMfY2bYol3699nLIhwlw==
X-Received: by 2002:a5d:53d1:0:b0:374:b9ca:f1e8 with SMTP id ffacd0b85a97d-3779b847b95mr5575492f8f.20.1725615270476;
        Fri, 06 Sep 2024 02:34:30 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:4e33:801c:cee0:ee57])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ee4a5edsm21412206f8f.1.2024.09.06.02.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:34:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] ALSA: IEC958 definition for consumer status channel update
Date: Fri,  6 Sep 2024 11:34:16 +0200
Message-ID: <20240906093422.2976550-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Add 128kHz, 352.4kHz, 384kHz and 705.6kHz.
These definitions have been found working on eARC using a Murideo
Seven Generator.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Hi,

 As explained in the commit description, I don't a have strong references
 to back the new values up. I've found them through testing.

 The value must exist somehow since the related sample rates are allowed
 over an IEC958 link. It would be better to get confirmation from the
 actual specification rather than just rely on testing.

 I don't mind if this does not get applied. I just want to make the
 data public, giving others the possibility to confirm or deny it.

 include/sound/asoundef.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
index 9fdeac19dadb..09b2c3dffb30 100644
--- a/include/sound/asoundef.h
+++ b/include/sound/asoundef.h
@@ -110,18 +110,22 @@
 #define IEC958_AES2_CON_SOURCE_UNSPEC	(0<<0)	/* unspecified */
 #define IEC958_AES2_CON_CHANNEL		(15<<4)	/* mask - channel number */
 #define IEC958_AES2_CON_CHANNEL_UNSPEC	(0<<4)	/* unspecified */
-#define IEC958_AES3_CON_FS		(15<<0)	/* mask - sample frequency */
+#define IEC958_AES3_CON_FS		((1<<7) | (15<<0)) /* mask - sample frequency */
 #define IEC958_AES3_CON_FS_44100	(0<<0)	/* 44.1kHz */
 #define IEC958_AES3_CON_FS_NOTID	(1<<0)	/* non indicated */
 #define IEC958_AES3_CON_FS_48000	(2<<0)	/* 48kHz */
 #define IEC958_AES3_CON_FS_32000	(3<<0)	/* 32kHz */
 #define IEC958_AES3_CON_FS_22050	(4<<0)	/* 22.05kHz */
+#define IEC958_AES3_CON_FS_384000	(5<<0)	/* 384kHz */
 #define IEC958_AES3_CON_FS_24000	(6<<0)	/* 24kHz */
 #define IEC958_AES3_CON_FS_88200	(8<<0)	/* 88.2kHz */
 #define IEC958_AES3_CON_FS_768000	(9<<0)	/* 768kHz */
 #define IEC958_AES3_CON_FS_96000	(10<<0)	/* 96kHz */
 #define IEC958_AES3_CON_FS_176400	(12<<0)	/* 176.4kHz */
+#define IEC958_AES3_CON_FS_352400	(13<<0) /* 352.4kHz */
 #define IEC958_AES3_CON_FS_192000	(14<<0)	/* 192kHz */
+#define IEC958_AES3_CON_FS_128000	((1<<7) | (11<<0)) /* 128kHz */
+#define IEC958_AES3_CON_FS_705600	((1<<7) | (13<<0)) /* 705.6kHz */
 #define IEC958_AES3_CON_CLOCK		(3<<4)	/* mask - clock accuracy */
 #define IEC958_AES3_CON_CLOCK_1000PPM	(0<<4)	/* 1000 ppm */
 #define IEC958_AES3_CON_CLOCK_50PPM	(1<<4)	/* 50 ppm */
-- 
2.45.2


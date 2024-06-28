Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A54F2E64B
	for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719577483; cv=none; b=qarCdU1h2laAMD3jSBQ7WbOqTXYjjnspMjHos5NCnBwjZgd7/r/N0QJkN6AqFTePaNeOVjnOr3AF4a+rs9BuMoNbTeyvPqEJTTW0Dv1LZsxEJFwA9qryjgh0ZFezLebDN11c+qMPsUXkUAZp61HWebkPqWFJWri436RNGvjazX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719577483; c=relaxed/simple;
	bh=3ts2gQuK9q5ifIXWwqQcZskJHVRf4IEqgfVfvltT1No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnNgQZs5ArGNMYHqJLHaNvAu/evgZ4QqnkMEcZFau89w3zPqKyXWCFzXnfrLaQhKVwest39DGk5y+VYVUXcC+kDl6HNFobHKZL+yfTQmws6geQxsLHxbzIVi76DPN/m8hbROThjm2lOpis5HaK0XXGpruRZrezxu3MX0htuGLSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RQBHqawW; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RQBHqawW"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cdd03d6aaso641480e87.0
        for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719577478; x=1720182278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8ilixuBZasrX5oPlMOZzvZHztGbrS/qDv+nWurvrjo=;
        b=RQBHqawWaRMbZ3L4RJaibrt2prb/8YtYuKsw1ExyOjwIKHdiOHkDmrhc/gLM7NtHJ2
         M/wWBm3cAwZMruEktftYWVmFgvNdJMKFDHnsFBlUa6YeQk1RxfCiQ6e8zEAoe0kMGZuB
         g+CkJa4K8KWjx0aA1j56jlwpJ/yTeHRbfZmDhdpDcImR6kCaSZsltviGJyu8IYuHWaIw
         Qg3hGQt1ZHLt8BgQRQln5s8noI8x2baZRxMEDWMyv7n8QSEcWKLE5zQ46wkcOe81U7wR
         MJHvQBAA3t1MiUObK846Wib1TK+17YrKvxab4xzFWO4s2jRkf+9JvVUlz2zQ8pYiWGmP
         SCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577478; x=1720182278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8ilixuBZasrX5oPlMOZzvZHztGbrS/qDv+nWurvrjo=;
        b=IUU1S5z0DqIISqNRjsbhwjYFsOxB+7HXjaBaVWOmg94wZfKjYWwIU+B8Xcba0ks6Hu
         NUzzf5lxT31M+nOIz04RxPD7q2V49yASD9UqfgshoV45bI4/gVOPE9k7Inl8yeW4DTrd
         PHlcj4BJvXEKcdDra6F2kEbsHqUFcrVMkjqN7q1XcB4YELbdq7MuYoHmjnzclNosYRmo
         xUHLwFPTDXOuF97ZMF2zzN4l7bDsx8bVVMzhggWVLsEf6QtzS0bNN/wIj3fU/P++/VMC
         HTtCDiqQTjJlVQ4Smf4NFlUupLCd73yUFltgkUMl1m5/X9KcHVZip6khHjAxbWk2FNkR
         1NcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2N7YkSg+P9hgfmUM6PAVDPs5t7DcafjaYS0NZhCArmJGYIbu1jxCD/1k1NpKfiIgzt6n0qccE1UZeNuRZu1FYO6p0eM2ykvThtjo=
X-Gm-Message-State: AOJu0YzU17NnIRaWOHwGYd2MgTE4tdqhv2OfrYcfLHmYlxA1vpkus/pG
	YanvINXMx2683y2Pj5WzLI3A9KMmrdhPPRdDochoOP+HNRGGDiDZRzkmT9kuCW8=
X-Google-Smtp-Source: AGHT+IHQNBdkp5sVhDZMNMGLlSLyCBg5ncNtuAz2wpbbCQJUMGI2AenlpBNeQiXbs7+OnFlxLeSLDQ==
X-Received: by 2002:ac2:4c84:0:b0:52e:7125:c70a with SMTP id 2adb3069b0e04-52e7125c847mr3014350e87.47.1719577478429;
        Fri, 28 Jun 2024 05:24:38 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:78b7:4c75:7e6e:807f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3675a0cd623sm2179013f8f.16.2024.06.28.05.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:24:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ALSA: IEC958 definition for consumer status channel update
Date: Fri, 28 Jun 2024 14:23:07 +0200
Message-ID: <20240628122429.2018059-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240628122429.2018059-1-jbrunet@baylibre.com>
References: <20240628122429.2018059-1-jbrunet@baylibre.com>
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

 NOTE: This patch needs to be reviewed/acked by someone with access
       to the IEC958 spec, to confirm the values inserted below.

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
2.43.0


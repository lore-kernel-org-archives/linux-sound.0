Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBD538B7D2
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 06:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528671; cv=none; b=OS2nSEJ18nHDxuuwf9/29vAjYxp5KRpKnyxEIapObGkaQ42V/EE6N9U9pEbfLCfUlXK9Tuf+nhwTcljqWqf5V0fXZR4R1rLwXCQzieaK3rsH1WspQcfSXMexM7Rqehwr9FWxaK3EiYV/nCFBXce7+TxsluoMPn5aZSfPIlxjdX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528671; c=relaxed/simple;
	bh=y/smHOz0lVoKx2y85ZFvTXARIl9O2ZXa0sJtBon/+DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rv0wWc4ke7cbhUo9pMHJ4UwUKKgpvwtAJbG8GYXLHiV+QHKFTn+Aw/U4jFhLUaPrkRowzw5txK5sA48lwVKpGQ3j2QV7FvjFz2yg7bfQdAVcDoRapCxXgaHvXhjG92RS6JT3n5vs/2hM9sYJA8axma/4M2LzP0Qs7Rqurn4m1tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cKrvswZ+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cKrvswZ+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954dff6536so14127905e9.0
        for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 23:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784528661; x=1785133461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zbKXp2fpE5dBUIu0e81EpN/vK6MlC6BxLlPtg3m9u+4=;
        b=cKrvswZ+azZNpv8FdBXECdYaSWV/O80/CHpcgutmAshwzx3H+OD2Mznfcb04Cx1ajz
         8ZxlsrU1aza8mrprUxRS0mnCsHzkoZSIOJmK7q1dPff+45h0l4TYicELilbc/yI99tCu
         h/uR2xtPMuWtomcmadAq1VD3l/V3HeN8UnSQpCGeZcHwak2dD9pskrlpXdUoxvzj8CtB
         TJw5Bd0LpqQvmCVHQ2vxBAfdmCUA7dSCL+ka4pSsfWRLkE53YWRpUG3MVSoYCCp3TS2+
         SX2uL1ZUY2FXZeCZl4R8E+YfoD+xHNeP1SrygWjlkme/tsdJvivCiRbXzz6FNjEOcdVR
         aeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784528661; x=1785133461;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbKXp2fpE5dBUIu0e81EpN/vK6MlC6BxLlPtg3m9u+4=;
        b=O1v8Ib1aZV/O9CX5JfbycnsZF9W7OU4E7qfa6d0RW2G7RFA2u14nI6qz38fJY5NV0+
         B0MJr0bVAccpFnGnAgngLORaI3ReMD43QsQEbqmcc4sabo+4tkHONRo7TYeAjrPQv4z4
         k/FLXcmdLC8MTMqVf+GdddoxDsKOhw6F412TzcbDB9EsfKqkZabCFs5Ca2jLkjE50wNT
         O4N+ikoU0UTnwdu7cSjnjM2RfYFECpJF1goButRjBQwTlHaQxKEFC8C4ZizTE0Qzm5GU
         axqu/JiUDVSgmjBmgFVRn60vzYLH8U0T3z4qHQVb1eIXOXPqcAHWNsbkRd4QMm1uWdTo
         zg9w==
X-Forwarded-Encrypted: i=1; AHgh+Rrp+2xuYA57s0KhOJS5pbQSiyUkk/oInqHZQQDKsNTZjtWB7f5SNMvJOUmTNr/46l5CEjxFEKfpis/i8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBB4tKM6JBexdxzKoJdKR2J7/D2qUMaYkz3P68yqO0EAAjpZTt
	5RbbjtiEi4TsndYHxTAyoZ+tVptV2W/0U8lIEiZu6xtYyEz/ikY+y32oDZ+HLvcRX1M=
X-Gm-Gg: AfdE7cm+XHS+MBmNUb2Hx+N+FwA7g7eQ1GNraorrRlSYemBsO31HnN8R0AakUECSiy6
	nXOvOF2Ac6kkMu1UXFfXLkVh0FrzO1zpi+4n70cSEX1zKS8u7jMOG+O0QIu1pBV3v185ByhXK3z
	PGAhHv1hrxGnEE3TtmO6c85TwrfZYB55/Sl5XWnMsfavyLi/67uRh1fPVpZ96qwyHmtLikR97/T
	G2M/xmT4KIpUXBJUujyq2phlwNUMVfTp0ivd7QVsBYc1QeiiEth4AsS29wxfT9rezExDJzYgn9g
	UZrF7zJUPTvBDAUe6UOERGsEP3egDmNCDVnTxPlcRpyAkDbpgsy7sitMIEqVIUbqEOY/r+pU3Le
	XCtSK2caJ3gBPuywgFFADRdd5jCmo0e/9R52MT5QucHmZYKbCRB41ETG7S32p+Y5mQd3FJ1mMcj
	mXT+njFC0=
X-Received: by 2002:a05:6000:4025:b0:47f:7c50:2222 with SMTP id ffacd0b85a97d-47f7c50261fmr136654f8f.24.1784528661197;
        Sun, 19 Jul 2026 23:24:21 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63eddd1csm26814848f8f.29.2026.07.19.23.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:24:20 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Mac Chiang <mac.chiang@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] ASoC: Use named initializers for platform_device_id arrays
Date: Mon, 20 Jul 2026 08:23:49 +0200
Message-ID:  <a76e26aa4edb901b4bea684919463b2243dd8d9d.1784528081.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=y/smHOz0lVoKx2y85ZFvTXARIl9O2ZXa0sJtBon/+DQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXb79V+8lpXHNG5bSv6J2NfK/Lt8HjAurRZV9m Gj/zOANmyGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal2+/QAKCRCPgPtYfRL+ TnKYCACs/xDtRRBaoZprLXFqmwZb/RwB9px8qnNjIs2u5okKxB3XJPloF0UxVsDDsng0S1MDIYe NKTrHCo75y6bINwgQinoH4r80geWsZlRJnov126W0Sl8EQtcN4DyQ4vqyjzFCO4p8NWyCeCZBlK f/8+9tUA/rC9d7nCr42L9+VRWEvTZsKXRUze6P8xa2jycTVmS6owXY9CpEBkgjFkbG1PVRjgfA3 CwShcPuC3wY8j0lhurY/9H8c463MVnCr9adwwgSIKn7s7rbrgetrXiRe5Ik9UA/Jn/yOEZADJIF BpvwNQElXpUp5OCdjL9Cf00w3yH4G0NRaYcYIVbXQLekMJCM
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous union.

While touching these arrays unify spacing and usage of commas.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/codecs/cs40l50-codec.c | 4 ++--
 sound/soc/codecs/cs42l43.c       | 4 ++--
 sound/soc/intel/boards/sof_sdw.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs40l50-codec.c b/sound/soc/codecs/cs40l50-codec.c
index aa629ef53db4..676367163067 100644
--- a/sound/soc/codecs/cs40l50-codec.c
+++ b/sound/soc/codecs/cs40l50-codec.c
@@ -288,8 +288,8 @@ static int cs40l50_codec_driver_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cs40l50_id[] = {
-	{ "cs40l50-codec", },
-	{}
+	{ .name = "cs40l50-codec" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cs40l50_id);
 
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 47308cd870fb..1b817e1a6ea5 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2935,8 +2935,8 @@ static const struct dev_pm_ops cs42l43_codec_pm_ops = {
 };
 
 static const struct platform_device_id cs42l43_codec_id_table[] = {
-	{ "cs42l43-codec", },
-	{}
+	{ .name = "cs42l43-codec" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cs42l43_codec_id_table);
 
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 1013e07052a3..346a7b59d8e3 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1542,8 +1542,8 @@ static void mc_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mc_id_table[] = {
-	{ "sof_sdw", },
-	{}
+	{ .name = "sof_sdw" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mc_id_table);
 
-- 
2.55.0.11.g153666a7d9bb


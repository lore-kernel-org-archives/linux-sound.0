Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0294E158849
	for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719577483; cv=none; b=PukUYh17u0rdeX9jugBv95InVJkRaTyQbKMxSx5FMtpVnylKasdb/lU1l7KeXlbvW/nXJ91tAh4eE2HnmuFmo4x0RV0mnS8rtCbGbKbOz30VGtsZyZT0+Sb7/3exlcSSwvUi62zh5WKEQGAifGlNcELPgSYtjblDRQY1Y5D/ukw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719577483; c=relaxed/simple;
	bh=sciaPAJqEgX1NHQM4wEWy3GtvEwtZw9xH14CYUn5eV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HD6oRuTYDxrHlNGZYYp8ZFMYLnTFzVuZtyhNHzMKKM9YgzxY45xEXtTSQfWomssZ5IT4l2UISpWrTEgSBKG8YpzF/8BmkuzOjH6o1A7TsTHrwEZdEYevLRZ+CAzCybhUHvbPE1bqZZRANb8sUHEpOdarNhuY7y5kc4hFJu4zlWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TQaDi+Fs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TQaDi+Fs"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-424ad991c1cso5709745e9.1
        for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719577479; x=1720182279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hW3lP4hCIw/t+/Lvw7tibKaBu1RE1UvWiqJ7tmwsGo=;
        b=TQaDi+FsADQftnuL/mzWFf2QaeCEEwKNstceK03N7jEIK3VbzyScOJkQEA4GwvkwEO
         T2HV+LUKAfw2KUnl8TOR55YB9KCWV5/CyOVuF1uqiaCdkaKTW8ZACEmNBFAw/kFDS7R7
         uY5Tk1LPKyCQmWtso4rzaj/IDDXtY16UVqaifM/uwU2WL4FQWpaXURz1OwYV3oh99/nI
         vaGHNXEwWoL0oIqyiv0AY10we/qzNLFNiqBq8EDNm57MPF9wo8vUDVSlQwmYwCM98ekr
         /Wk7zAdTjw8tYgxTtww8bMLDqNxkxZa3UKPncupm4ZKgQY4RREWsxx8VjAuGBd5oOHsA
         Y+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577479; x=1720182279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hW3lP4hCIw/t+/Lvw7tibKaBu1RE1UvWiqJ7tmwsGo=;
        b=bkJLPH0e7P/3DytA1LP1feT96OHC597aI+ikKBOD8622c+eoKw3DztQm5iy1gaZx+e
         Pq2EMOBYj2L162LW7axFxZPyJS+Wy3SW77fZGUn8HEPHEmNrgINfmcY+qHua96aW4+1z
         Rq0jKVa7/o3MIa+o+BwEpq3daTpR5fLX2nl+va58dSXnEIOJm3MGqK6U/F6sFv8nAKwM
         uyqHL2zBgoepvdUbJbZjEAWagIApz2Xw0yHF9VsuvPS/vEuigjElOsCSKL/SvpwlfqYH
         eRrZSPSnC6YF2Mt0fb/yY8lV/tT0Zg/T/7s46MWhFbRHDuUsQ07/G5NYaIdxZtyKggev
         POwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsyGsuVPzNfdBkU00A08qUX/8e9aIOXz+vb3gA5WVLSCTA7FlS49bOnPYjkELNt/bZA8z7OsAHPlGKWo4rTdTD1zfE/l5sZA7Ta18=
X-Gm-Message-State: AOJu0Yx6DWjGZ7k+nCLPLxQ1K4ULsnZ0Ks76VU4jATTxstKYiTtO8WG7
	OSGiRp9Zw7DrhuJid7G19+wmhcmj7QqHdGLt9Nur2I/Ola8mtCZU6HbUfPO/G0U=
X-Google-Smtp-Source: AGHT+IFCBRrgEPYiJUK/9y0AlZTM7uvye/PRdCItIPgKpi1qBz5asnELoxu7K+MOu68SHYidDVADkg==
X-Received: by 2002:a05:6000:1bd1:b0:363:598:524f with SMTP id ffacd0b85a97d-366e94d6928mr13084226f8f.31.1719577479529;
        Fri, 28 Jun 2024 05:24:39 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:78b7:4c75:7e6e:807f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3675a0cd623sm2179013f8f.16.2024.06.28.05.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:24:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: spdif: extend supported rates to 768kHz
Date: Fri, 28 Jun 2024 14:23:08 +0200
Message-ID: <20240628122429.2018059-4-jbrunet@baylibre.com>
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

IEC958-3 defines sampling rate up to 768 kHz.
Such rates maybe used with high bandwidth IEC958 links, such as eARC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/spdif_receiver.c    | 3 ++-
 sound/soc/codecs/spdif_transmitter.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/spdif_receiver.c b/sound/soc/codecs/spdif_receiver.c
index 862e0b654a1c..310123d2bb5f 100644
--- a/sound/soc/codecs/spdif_receiver.c
+++ b/sound/soc/codecs/spdif_receiver.c
@@ -28,7 +28,8 @@ static const struct snd_soc_dapm_route dir_routes[] = {
 	{ "Capture", NULL, "spdif-in" },
 };
 
-#define STUB_RATES	SNDRV_PCM_RATE_8000_192000
+#define STUB_RATES	(SNDRV_PCM_RATE_8000_768000 | \
+			 SNDRV_PCM_RATE_128000)
 #define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE  | \
diff --git a/sound/soc/codecs/spdif_transmitter.c b/sound/soc/codecs/spdif_transmitter.c
index 736518921555..db51a46e689d 100644
--- a/sound/soc/codecs/spdif_transmitter.c
+++ b/sound/soc/codecs/spdif_transmitter.c
@@ -21,7 +21,8 @@
 
 #define DRV_NAME "spdif-dit"
 
-#define STUB_RATES	SNDRV_PCM_RATE_8000_192000
+#define STUB_RATES	(SNDRV_PCM_RATE_8000_768000 | \
+			 SNDRV_PCM_RATE_128000)
 #define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE  | \
-- 
2.43.0


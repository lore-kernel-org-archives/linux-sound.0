Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8517627FD5D
	for <linux-sound@vger.kernel.org>; Sat,  7 Mar 2026 00:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772844305; cv=none; b=ODVoYW4on7js/X8HExIbayMCzpmvH2YmcssNlUHxT8wo1f+2VVk9umHHOTXrS0WQB337ESPM+UsPiS4V8bWFyWlIQ40B5ONCeubEuWesFdgaIQGdV3IYEPBJ0IpARBP8+gzF6e/khj0dYmUV6uYok3gbEyGgFnbFpkaTRfoLaBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772844305; c=relaxed/simple;
	bh=3CihOmU9NGTH+pHKFRKG0zcs63q8aCSm+5wlrpjoVus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PmL4DZloBQvzXwrPrA2Vbvvh1cArZeFq6v67yFkE4ApvRP4TCwG2zhD5a73dhetYQvmNkA9GvdCJk09G6i7m7ssEFoBskodP538M0w+zAbiOEasJtBfAJsR7NG4ht5YCtCZBM5zgatSbzyOJ/u3FUnJRMEss7nAR8WuEqvbU+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJB/umpd; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJB/umpd"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35994d84c6dso2552702a91.2
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 16:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772844303; x=1773449103; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQK6TpOgxro8/DFxKJSKFYs9g8FfHGY7pR33jfs/nsw=;
        b=UJB/umpdy6p9W8Ml4JcPZwktF68AGDrvI2i+nXGchW2C0K11p7dYErQfgSvVUUh2Qn
         SIwoCCTA9W2CZNRQnGcf1LkgPV3AqidUd0aAfyuVkaHjgI49F9iwi/MQq6EfICc6z4Jz
         DGznoDPwkjw/Xjglq8rUAb8Mj514pcT7bJeWmRYF5nIH50LRs00lBmEkjEVGkYwaG9gy
         zhdQXucxfpiph+yGgRvJhwZxcbhStE5VUwUaSEHuK/EHGZmgSyL9YRh990FN0endIQw7
         kYm6EqcGzfKqTD70n1iErKqBixt7FsNS+tICsDvWYVITTHRze9pGzykqbzX7oro525WT
         admw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772844303; x=1773449103;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQK6TpOgxro8/DFxKJSKFYs9g8FfHGY7pR33jfs/nsw=;
        b=Ov2bZhooMuskpHRbaaE8R64xmjHB9rSDiowWayhskkrFmqml0QrBRXxcN2aX96HoUk
         T5/uaKaskIeedzDAlbZNLPvJzoFAXwVRT0jZDkEFnIA1DT+/EFduBKnmhd/58NHs0TQR
         HfbDuQu19rhf2/d08osR07u2vQPvvVmyXR+KOBzLmIkrVuQPyvYOclz6t2IZspeTuuk1
         E7MD9JF/HVnrCjODi4HSA/QgewbTAg+hOqsHfUXBmIj2nFHtBnWjM17RT6w+hmcJHFgu
         UBEHVswZgT7fzDliyEXVLDJKiFmpdVJjbjp9KbR30+JKuPoEgWLWQ9t/aAQxy4G7NjD4
         LLRw==
X-Forwarded-Encrypted: i=1; AJvYcCUkhIgyj8O2muvH3FMd3gmFWqHC7BLQ40aQr/atBsQamp9jHZ7UhRWBhNAuAgytL/aT5sT4v05aiZ5m+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfMeiibLDE8/L/OPF8+SbbQzvE2GH2lxqzegey9cqmGXR+Y5kY
	EaKKE8LooO5A7il0mmltMYUSnK1tA26XodG+ECs3P9vqZHTVSWd4rMFUx4e/YA==
X-Gm-Gg: ATEYQzw7euQjxXNHirM73LWYnK0VGRmVH0VDwB5QOx4YL2frwNm3in/c81Uspoq8K1c
	ij/BvZH/YTDIx/zDNTsDtw8tqNISmjO+wwA/POAiIRgwz2O280iJonrDczbVDmKaWvXEArETMq7
	uTUCiA1S/MkFrI1d0aZqQXHM+yzylceI8N6R7dmWWBInt6TSAnGFB9kKdIL4BOVSZlWIACRzCQS
	aN/BXMo5w2mFfGjeOdX3vIv0YgXBjg6dG+rQVnZmz2xqf1sm+GxHfkvudF9Gc0/dADemd00cYSk
	bh9xxKrFOOym/GL9NxnNAQXRoiGdLZfA+HQsm/176QAWK3Sv6DizGajd55aN4dcK18XFOD3QUfS
	Cw7L3loiOVk/t1Ivp7q/Todr1oZUPgwR8KZVGLQI/NMSXNixmOjbg4qOgW56J26y4k05pu4on7w
	yQ+ulYBZnYwO5uBAgjWqNoHIsKBt44s8b+QgtKbeZjqDOVlRDHy9NxB7ptE9lH6QlgHgMXb35Ce
	V9ajjLyCpUhBBTllPs4kUmOfdW0m/UOPgZIcZb/Dh0tDP9Y8DzYTq/9jRBX+o3kMmY4hV51Xcc=
X-Received: by 2002:a17:90b:3c90:b0:32e:1b1c:f8b8 with SMTP id 98e67ed59e1d1-359be375c6dmr3587963a91.26.1772844302605;
        Fri, 06 Mar 2026 16:45:02 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359c4eb8c48sm2402907a91.10.2026.03.06.16.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 16:45:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 07 Mar 2026 10:44:18 +1000
Subject: [PATCH] ASoC: codecs: cs42l84: set up PLL for more sample rates
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-cs42l84-rates-v1-1-1c55a5673031@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOF0q2kC/x2MQQqAIBAAvxJ7TjCVyr4SHUS3WggLNyIQ/550H
 IaZDIyJkGFqMiR8iOmMFbq2Ab+7uKGgUBmUVL3UchCejTpGI5K7kYW3qDRWKW2A2lwJV3r/37y
 U8gHhtsfWXwAAAA==
X-Change-ID: 20260307-cs42l84-rates-c9e23e20209d
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2501;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=3CihOmU9NGTH+pHKFRKG0zcs63q8aCSm+5wlrpjoVus=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmrS7lW2i8tNap/eq3206XX7yw/ySxqFNjbc6z3Zmvep
 O3cZYmmHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKm+ncTIMH+f9c/7winaFx6ncZmVGq0wrbjf923qEaXbSs1t1f+79BgZfnb/v9y
 W97DKTFp7tc/OtMyrAWUHLDr1Pva8mvj9zME0XgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Previously, this driver only advertised support for 48 kHz and
96 kHz sample rates, as there was no PLL configuration data
specified for any other sample rate/BCLK.

The CS42L84 is an Apple-specific variant of CS42L42. The PLL
configuration parameters for a variety of common BCLKs are
available in the latter's datasheet. What happens if we just
use those? As it turns out, they work just fine.

Fill out more PLL config parameters in the PLL config lookup
table, and advertise the corresponding sample rates to userspace.
This enables 44.1, 88.2, 176.4 and 192 kHz output and input.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/cs42l84.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index 1e1307a16f81..eba2c900b8e4 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -357,8 +357,11 @@ struct cs42l84_pll_params {
  * Common PLL Settings for given BCLK
  */
 static const struct cs42l84_pll_params pll_ratio_table[] = {
+	{  2822400, 1, 0, 0x40, 0x000000, 0x03, 0x10, 11289600},
 	{  3072000, 1, 0, 0x40, 0x000000, 0x03, 0x10, 12288000},
+	{  5644800, 1, 0, 0x40, 0x000000, 0x03, 0x10, 11289600},
 	{  6144000, 1, 1, 0x40, 0x000000, 0x03, 0x10, 12288000},
+	{ 11289600, 0, 0, 0, 0, 0, 0,                 11289600},
 	{ 12288000, 0, 0, 0, 0, 0, 0,                 12288000},
 	{ 24576000, 1, 3, 0x40, 0x000000, 0x03, 0x10, 12288000},
 };
@@ -670,14 +673,18 @@ static struct snd_soc_dai_driver cs42l84_dai = {
 			.stream_name = "Playback",
 			.channels_min = 1,
 			.channels_max = 2,
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000,
+			.rates = SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
+				SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000 |
+				SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000,
 			.formats = CS42L84_FORMATS,
 		},
 		.capture = {
 			.stream_name = "Capture",
 			.channels_min = 1,
 			.channels_max = 1,
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000,
+			.rates = SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
+				SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000 |
+				SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000,
 			.formats = CS42L84_FORMATS,
 		},
 		.symmetric_rate = 1,

---
base-commit: c40816209b5768d45aabb81f9c6ff8296ec58c32
change-id: 20260307-cs42l84-rates-c9e23e20209d

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>


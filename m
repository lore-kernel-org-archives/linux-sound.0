Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E2927466A
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 00:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773448043; cv=none; b=LncmBtKYlZsM+To4+R63VN61LKjex+Zchchvfv4XJwg1iI0Gz2amMgp0V19WO6VfzCz7ORGUT6oVoD+ZowdaW6CkStKM9kX3SpsqK5DBK3OTtsMFHT9T296/0nBhZQpNWiQIhqevyO0ncMxOGH1708XMyzv/gZF+s0e+AnN6/f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773448043; c=relaxed/simple;
	bh=Sqx3SXPJXXnhV+A3P+IhV85mWKhQbsDPRWBYpEMIubE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PiKLuplPTVYc4vUAwrfCuPs2oJ2e2arQlo6YZY963ZiUBet2Bb2lp7pOsa8oX2M1TRqqsWzQ8rjedTt7Njh4oMeEK6NBLbjL+iz14AiSK+zBIgOZ4Q8oNzZ91SvV9K7HsQeY/RNBtm1nXeD+SlCUIiFL76kEKeFIywEPIsSgxoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlKrXrEf; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlKrXrEf"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so1143099a12.3
        for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 17:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773448041; x=1774052841; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MEcjecI/5dgQBjsSrAQH+cGhELB2YBKO6wW+gUuNwdI=;
        b=HlKrXrEf9Flh9bmr24k89wwJRc98vvVeEChu7UDUn2hpHJur47ipVj9yLrWutv5UDC
         lAju5CUBxMkyQbCabCOP4yaFsLgBk3xbbdzw9M9yHqataKQqWZOXZNnhSpcAfXxJFoLT
         9u5kfX9IdSAI+es6FuFC9becwkNNEumYcP53jBTA1+cNZvOSuQlD1UDEY1i9qgY3hiFn
         DbV0ci/yVhZqXzp/Zzmnl6+wZxxXIozL2P1Hrlad7yoPlt1s/NBvnw6gugf2DcW/P+23
         L+JELVc7rIt+P3E3T36Ck2V42hNTaqa98hKzgFxFX9arxkkrjRoc7VDd7G8pxkpnLFXq
         xPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773448041; x=1774052841;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEcjecI/5dgQBjsSrAQH+cGhELB2YBKO6wW+gUuNwdI=;
        b=jfxUSOJP5K6/9fqt9uQTyvPP8lnxQAHx10cBrkSB4UNfmAJs1CZUlwwX6tMzruhzlR
         Pp1bofsgrJ3/USPhmlqNSJWmXcNFXYRpBQyvpvVxTOZrC7JUgOWlqrm8sNf7hhFVPBG+
         pxJfXzurZh5Ss+58fE4QskF01k8JN66hrWgq2GHSXAW6qCGKp2U2V3guFK229iRSKDt0
         sBEzbZPW/nWXsz+Y28iuCBp5EeggOMR4oBu/bips5pfgRKO9aGk/hzpcrZqjVdbzva3a
         RsfINMEw6Wr3kxnBgmmE//vfSrLqOd63c/gucJfUET+Kvdpz8WJr+OinJQvIAGoeDDiO
         rkOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsPxsgaMmaoxiCGfu/xuIskkvGvMuCvORXeP2CqeJWvp9ELEVReRe3kF47K5Os/57mI34YDgGGO28ZwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBvs6Hug4Da7m6m2oaBF4oQeb33lYaF9IT59N55xzk2pIgyUqt
	cjKuXWo1M44a15p126A1GTdGo0MsN7jEYEsS6ZF35yrYmdrweeQShQzLyyuPJg==
X-Gm-Gg: ATEYQzx9d5HORfIRCWMyhIrCQjtY10S13UMedgJtVjpAsWw1x/+riaa/4lfNqin/aPD
	XG5bL4hrOw7xwBbMfNoYGcQQWS2WWubn2EqRsh72QYPRXUORHzVT5gzzkIYBwrdxCAUqTg7+8xM
	sfRUzEvELEYF+egun2t4yTT6vwu6Y94pLb1EdTWB7INe5BKpEgph2Emi6ecn8xz1YK91dQ1foFs
	F22yB7V3MBIodUa3X+lAjFwD3IHCwYWS6c1wes01Y/a6GHz+MBSorKMr0H7MxJVXikJk5J5Gt++
	cT7JVwRqbHkKDVILRw0pL0OK6K92hli9AQtmkiRP+CbfujANTcLZp1wwpQ6vQq0rND6uPl5yb8B
	PGrD7cl0pGp4Kh6bNABtVEvxTjrc3wQtBsvBt2pNECDNtwE6N+nYSXRDNIQoPBJrm+QOA9RzXfD
	+INE9FvFza2Q5AqhuTjoCfppPsKy/dQQ2Up1P+y/wmbwC8+E31UmddGgQ1Ha4opSZ5N6WJ7ZbuF
	79jkXFHjWRXQHNuC9hTe2wK/iJPEkpxktZLmQvw3gJkewbkCPkZ1IjfNQLbHByi9Cre9Lr+1IMy
X-Received: by 2002:a17:90b:574f:b0:356:24f0:aef5 with SMTP id 98e67ed59e1d1-35a21fd71f2mr4196895a91.22.1773448041331;
        Fri, 13 Mar 2026 17:27:21 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02ba23adsm9409521a91.0.2026.03.13.17.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 17:27:20 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 14 Mar 2026 10:27:11 +1000
Subject: [PATCH v2] ASoC: codecs: cs42l84: set up PLL for more sample rates
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-cs42l84-rates-v2-1-ea8a5af52542@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF6rtGkC/3WMzQqDMBCEX0X23JT8GK099T2KhxC3uqBGshJaJ
 O/e1HuZ0zfDfAcwRkKGe3VAxERMYS2gLxX4ya0jChoKg5a6kUa2wnOt51stotuRhe9QGyyj7AY
 ony3ii96n79kXnoj3ED+nPqlf+8+UlCjx1jrbtEYa9RgXR/PVhwX6nPMXCa2Ft6oAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3538;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Sqx3SXPJXXnhV+A3P+IhV85mWKhQbsDPRWBYpEMIubE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJlbVqdMfPT4rqoTr8vCmf9uujN5Kt3/+VLs3ey88zq+N
 8I3Hm2I7pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy11wlGhme8M1OfVjmtmWp3daeHWcCy3fMlSjVreK5WCqZV5t86bMXIsGVOsg4
 T79rdTfefr9ynzCnwlmW2x12G9525rPVLO97tZgAA
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
Changes in v2:
- Added explicit handling of new MCLK values to MCLK_F config
- Added comment explaining the MCLK_F config process
- Link to v1: https://lore.kernel.org/r/20260307-cs42l84-rates-v1-1-1c55a5673031@gmail.com
---
 sound/soc/codecs/cs42l84.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index 1e1307a16f81..e590a43559e4 100644
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
@@ -408,11 +411,18 @@ static int cs42l84_pll_config(struct snd_soc_component *component)
 		CS42L84_ASP_FSYNC_CTL3_BCLK_PERIOD_HI,
 		FIELD_PREP(CS42L84_ASP_FSYNC_CTL3_BCLK_PERIOD_HI, fsync >> 7));
 
-	/* Save what the MCLK will be */
+	/*
+	 * MCLK values are binned into 12 or 24 MHz regions. If MCLK is exactly
+	 * 12 or 24 MHz, the high bit of CCM_CTL1_MCLK_F is set. If MCLK
+	 * is in the region of 24 MHz, the low bit is set. This seemingly
+	 * corresponds to CS42L42's documented INTERNAL_FS and MCLKDIV
+	 * behaviour respectively.
+	 */
 	switch (pll_ratio_table[i].mclk_int) {
 	case 12000000:
 		cs42l84->pll_mclk_f = CS42L84_CCM_CTL1_MCLK_F_12MHZ;
 		break;
+	case 11289600:
 	case 12288000:
 		cs42l84->pll_mclk_f = CS42L84_CCM_CTL1_MCLK_F_12_288KHZ;
 		break;
@@ -670,14 +680,18 @@ static struct snd_soc_dai_driver cs42l84_dai = {
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


Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E3486629
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 04:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866068; cv=none; b=U3YGgVXeeTDSAfxvZzAz4mH1Iyeyt0MBOaVpDZgJ2itpQwcYMMf9kk6P12AL/WCg8gi5EesjnDHiB26wiaQ9FQtqtiBIX0FyZic0mfAK2+WEZKbu1CE4Xi5P4UCor5FqyjPURMzWzwFFtOGVtGtQXTm6Nrn3mErXggsNV34SaDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866068; c=relaxed/simple;
	bh=8ybI1NEE7oS0ijxF/hUYf9i4DMISa6e27umN93+XVpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i7uEtUZyXdgTGyv7UAIq9WIuKUduNhueD8WMl/gGyFQPi113cc0aqemoeZL1Nn25UEZ2n+yFsbjjHyGfsxOohquelj2LREMbgP8XQMA22Jl0A2afPvt2rNqfgsxajjk705J0iNbgUxj2nHRkM/0gu6NZnP5JRei+jW1NlQxFpc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUyjMb/m; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUyjMb/m"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so20852635e9.0
        for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 21:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866062; x=1792470862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tSdVwuEfT+oowzv2qe/O1qt0nC5VzQNe1ZmUYrE7Smk=;
        b=dUyjMb/mguuM3nWTve6a2Rgr/DEiI45r3Be2CGmhG9dSo1/ptpwAae0rxcCTpfVmEq
         5YdrPaxADkJBA7Mf2TqcuA7FNOlJmV+9bGaEZX0JS0FhNRox9jTEn5phrZ7QrbI6afIT
         cx/oDzCVNUbgp7TsgxK/vBmyn+VIqBcio1cscCmxW9EPQmLl+/4ojVEzdmHkn4ZzCu/h
         f6R39ZHqczUBBTCdRbmUlA2py8ZvqDl0mkcXysWDEgl7bfQHXav8ymS+BBSWvdno5qBq
         v4+DWalRDpRY89PJ1lQGvQ4vorxIQsXMXZjJ3jl5pY2AX8x9mKKP4fI6ZwYHQt4pbgkN
         9TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866062; x=1792470862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSdVwuEfT+oowzv2qe/O1qt0nC5VzQNe1ZmUYrE7Smk=;
        b=o1bAAGHMvO1/WexGqJwNQ+9uMqIVl6MDFNhWzO5hODbR2QC/NLD475ds/OWSNyrp2b
         QUojMc/wgAPcwPBEXkVIaL9xdB8uWF13igbZV0haTYwrnAgyvNRhGK0fC/WnisuFrjWv
         zpKytgh1oHijTIFL7K4KWZ+bAA8H67fMUfZFLUjD+LbHjrflDf52A/a3wuokI+hMiah/
         b770LhT/pRRSXwZgEew2KEMR2Zntra09u3DyUc9jTjYz31jPycOI5ssthPo1mky9Ic23
         oWlUIvjCT3e/SqKzSNhhTnVSZhOnXLRRi/uu3n6tZdrw8Ye8tgp73bdXBSx/IP+BTd83
         sJng==
X-Gm-Message-State: AFq9FYKkKhK89O2vlzQqT7Bu20fHToUsEljjRUAPRei3g5+YBnQbG7ne
	aANSRD4/ATWBWY35PTzTERS/2bcUVtdIRvAWQYl3B7Wf4xYVwzeWJ6aDNmGA4JZu
X-Gm-Gg: AYBFou2fNxO5W/LGZ+pnlBUam3nuvzYl3145BSUUmJmZ5rj5IGvl2kV9CvaT8UVj/CQ
	L/LEHaZmO5yl5TI3ikNS3Iy0p10wj4A3iIPL7uanYVfDrDH9haDjkb8CqdLI8a5s5YvbOtYHiR9
	cDvmU9vX89sneHdWfHLY/KJKi4CZsoD1iNRVIKmMXgbvwJ/HRIzth3484XpgFiY9OSCeOO0hg15
	fs3yR4mOgiAm2zKgbmh8bydsfBwWcIo6fkRqREOLS7CsCHmkcDkHnBqruQeC2FyVvC92EDG7zRD
	KoKsivyrOxoFa7uhJ0eJIdGQT0udc3z9MoCow49YrHf+oZaD3CXpXJW37vcyLopcJTIpDJBb4Ya
	ti85ZmWMUhlGgw34XjKD5JDmJ+MfHPh/QEdmaOJ4cBrUta/gyDO6ydnFOSRg6DCaoS21590xuJo
	cUEoMQV4rYAq4LnPENWifKj0rtWPBLB/NmnDS0+7H4fOBCDtXdLVmSmHo4cUBwhA==
X-Received: by 2002:a05:600c:8a08:b0:4a1:96cd:2f72 with SMTP id 5b1f17b1804b1-4a196cd3235mr121700225e9.2.1791866062505;
        Mon, 12 Oct 2026 21:34:22 -0700 (PDT)
Received: from jo-Z6 ([2a02:586:e82e:5000:7fc2:feac:cb16:51fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0acb1ebsm2889024f8f.44.2026.10.12.21.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:34:21 -0700 (PDT)
From: Ioannis Barkas <jnyb.de@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Ioannis Barkas <jnyb.de@gmail.com>
Subject: [PATCH] ALSA: fm801: Fix probe error
Date: Tue, 13 Oct 2026 07:33:51 +0300
Message-ID: <20261013043351.77490-1-jnyb.de@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trying to use my FM801 card resulted in no sound card listed at OS
Driver probe fails, and no card is registered on my old test PC:

snd_fm801 0000:08:08.0:
 control 2:0:0:IEC958 Capture Switch:0 is already present
snd_fm801 0000:08:08.0:
 probe with driver snd_fm801 failed with error -16

snd_fm801 0000:08:08.0:
 control 2:0:0:IEC958 Playback Switch:0 is already present
snd_fm801 0000:08:08.0:
 probe with driver snd_fm801 failed with error -16

Identical controls already registered by AC97 layer when the
codec reports S/PDIF support:

  "IEC958 Capture Switch"  - added by the ALC650 family patch
                             (snd_ac97_spdif_controls_alc655)
  "IEC958 Playback Switch" - added by the AC97 core
                             (snd_ac97_controls_spdif)

FM801 controls drive different registers (FM801_I2S_MODE bit 8
and FM801_GEN_CTRL bit 2) from the codec ones. Give FM801 controls
distinct names to avoid duplicates:
  "IEC958 Capture Switch"  -> "IEC958 I2S Capture Switch"
  "IEC958 Playback Switch" -> "IEC958 FM801 Playback Switch"

Patch restores full audio functionality within OS

Investigation and patch development assisted by Claude (Anthropic AI)

Signed-off-by: Ioannis Barkas jnyb.de@gmail.com
---
 sound/pci/fm801.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 9cc96b807d..96fabb0c56 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -1018,10 +1018,10 @@ FM801_SINGLE("FM Playback Switch", FM801_FM_VOL, 15, 1, 1),
 static const struct snd_kcontrol_new snd_fm801_controls_multi[] = {
 FM801_SINGLE("AC97 2ch->4ch Copy Switch", FM801_CODEC_CTRL, 7, 1, 0),
 FM801_SINGLE("AC97 18-bit Switch", FM801_CODEC_CTRL, 10, 1, 0),
-FM801_SINGLE(SNDRV_CTL_NAME_IEC958("",CAPTURE,SWITCH), FM801_I2S_MODE, 8, 1, 0),
+FM801_SINGLE(SNDRV_CTL_NAME_IEC958("I2S ",CAPTURE,SWITCH), FM801_I2S_MODE, 8, 1, 0),
 FM801_SINGLE(SNDRV_CTL_NAME_IEC958("Raw Data ",PLAYBACK,SWITCH), FM801_I2S_MODE, 9, 1, 0),
 FM801_SINGLE(SNDRV_CTL_NAME_IEC958("Raw Data ",CAPTURE,SWITCH), FM801_I2S_MODE, 10, 1, 0),
-FM801_SINGLE(SNDRV_CTL_NAME_IEC958("",PLAYBACK,SWITCH), FM801_GEN_CTRL, 2, 1, 0),
+FM801_SINGLE(SNDRV_CTL_NAME_IEC958("FM801 ",PLAYBACK,SWITCH), FM801_GEN_CTRL, 2, 1, 0),
 };
 
 static int snd_fm801_mixer(struct fm801 *chip)
-- 
2.53.0


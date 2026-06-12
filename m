Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEF0392C32
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 04:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781240022; cv=none; b=P+kyNQCx1DU368R5Ds7/TKTNhDmXpFLkIubllycpRXRBcG3i7f48s281jaSXNwe3qXifbHlNnv5KYSvxTxTZf4UVhv9xoQCyeUz+Yj7cNy+WXtaYbDGKjaACsum8Qj4VcLD+fY4rKP4B7DJz56TAZ9N8NlAV852kLvANP0vNZO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781240022; c=relaxed/simple;
	bh=CGhgTSPUuG3/h/37fnI8HHvwTgVw8YUxMIQHvlZbnZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B7lJZR8pA/a0NGyCJtNAx0nh/nsMEaocsC4FoMcIYUIsvDC6AdZdRChzhqc98iKV70+TVT+U5PrBzn6/kEb5Msc20Z+7I5K2WYOsfJQSmkLnvDkeKIspsQS6LTQe6vr9zPeypiZnxUdLvN1Ow7elgG176v6vCuwgOhBVakfdjAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBE1ozHZ; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBE1ozHZ"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30749947917so1862448eec.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 21:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781240021; x=1781844821; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HeJ4qrD4m5ueNhte1ZJIj4N9NTPaQRT9I3KozN8emis=;
        b=VBE1ozHZ2VNAXl7+357zWFu+/LcyTb3B2uiATnokMnO1pKHl3DRZbZMHQZRapo6jGj
         +sEB69+qw7arSux52VlCGvws6guZLTcWgig7jpY8WPIEsNK005k1VGWl/lilZnxvSQ1Y
         349CUn16uPiVQb8EGDuhdrRQvfx/9CKy85RYVg+FX0RqPRk+udTPoG/BJ4YsnTp2bdPR
         wMnovwFrqkSR44RmUNqQBIIHX0yeAzRaO3P04Y1Ag1n6xAjvjJmgYpm1OxNwRitfXsfU
         FbyA5uw6MiNEyopUxYIIrnC/VGaNbNrh5PIKON3sskbh8HZuOFZt2xa7j2PG7afmKC2s
         5JGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781240021; x=1781844821;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeJ4qrD4m5ueNhte1ZJIj4N9NTPaQRT9I3KozN8emis=;
        b=qTjmPqokuUCPcnxVbauSxmMnL2mq6uwQsdCSUyyeOplEyDQ/7PXAcnNdFUyzPbOcmh
         HO0QMuJytSWPOewEfKOaYKhAkhNm9fqOws25RzVulcIQJuE84x5OIOU2N3APNPgO6Xtu
         62v7Sta6LK2aWFRIuX1NOsYuxPNpSdnUTsLnwvnLyecdPMCq7IZizRrSz3FmFM2ONIlm
         sx4Sp5kUbdlWvXtyhmIv4Hw6ujv6AVxH4Y3sowUPan0XtRYYItuRTRwto6ZbSTa4AYoG
         7Ea+581XPrsxxGfrAzcBj1Vul3BzcxHmFq7M2lMqL5cHOHoUN5giKvs90UuyWGSXtRjm
         ZQLg==
X-Gm-Message-State: AOJu0YyuNGxCMqf0FAvS5uuaSj82x6m52drrZdRnkHbzLG91RgJHCtgF
	C+UBgQtlyKwCcC15I4Vl77FhY0/+UTm5Xo3QyXZxiBKZ6EsSG7PHjK5g
X-Gm-Gg: Acq92OG5dWe2FT9bw++ZS1GNjch+m4DsrcPP4e2scHKXr0Gwz4iwjRColFSzLcStBI1
	a4eShgWGsPUrN+T49e5YUMPOOOU7mOATzoWeoVQAAh/5SD1A608PEF4c7NROGdSnMqRAJL9pqNZ
	TeXDcfzFxXlyfoDRo3a84AbTjrXgLGMQWtEKelfMrRl7Z93XP0yGgx91FNq7+napWLfCywdsQCi
	4lL4p48qolp9/OGdGEZo7VhiC4C9TRMal7MCHVrFEHozcCFbd0mevWYnnexAT5fmreA1CeL8t0M
	svIfiDsmDZ+zDpEHH+59ljwLx+FvZuQ4exYPM1RkgZ717dQ1vKqRJQs9wHx24Wshx6kQQfLVNMa
	QID6gkidPZl9cgaIvjYet+X2NIQEgfoByF5GQiX1Hc76oQ2SLFzjMeRiQ057RJ5wcrYVZ9A29KR
	4ueVVIcRF5b6NetbAhUTy6I/+7b5oI59uM4c11y/nOu4B317CCQBPd7Vvduzrzi39RDb6lIHQP/
	w==
X-Received: by 2002:a05:7301:60d:b0:2be:2cfe:68b7 with SMTP id 5a478bee46e88-3081ff9ae90mr764090eec.11.1781240020384;
        Thu, 11 Jun 2026 21:53:40 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5cea89sm1971217eec.8.2026.06.11.21.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 21:53:40 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH RFC 0/4] ALSA: Consolidate CEA channel allocation data
Date: Fri, 12 Jun 2026 01:53:22 -0300
Message-Id: <20260612-alsa-cea-channel-allocation-v1-0-b1bcbb6b1051@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDINRNzClO1E1OBWKgdF5qDlAgJz85sQSoT9c8LdnUyCzNJMUwxVgJaEJ
 BUWpaZgXY9GilIDdnpViIYHFpUlZqcgnIXKXaWgCOvnbXhAAAAA==
X-Change-ID: 20260606-alsa-cea-channel-allocation-7fc526f4d1d3
To: Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=CGhgTSPUuG3/h/37fnI8HHvwTgVw8YUxMIQHvlZbnZQ=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFnaE07dfrF84vWDxreuTPFd6MI2faXT8699bQWeWTenq
 nulny9V7ShlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJHBdjZDg6Z9W2GNPlx07P
 TVU6fN35050D544/atxQYnYoSfDnDLF2hv9ZzToHX7upvJsYKC4vrtF2Llsqplk2zOgnu76Zo5b
 WSnYA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

HDA HDMI and Intel HDMI LPE maintain separate copies of the ordered
CEA-861 channel allocation descriptors, ELD speaker expansion, and
allocation selection logic. The Intel implementation originated from
the HDA code, but the copies now differ in supported allocation ranges
and fallback behavior.

Move the common data and transformations alongside the PCM DRM ELD
helpers, then migrate both users while preserving their established
behavior. HDA retains the complete CA range and channel-count fallback.
Intel HDMI LPE retains its CA 0x1f limit, ELD speaker bits 0 through 6,
and lack of fallback for incompatible ELD data.

The descriptors and their derived channel counts and speaker masks
become compile-time constants. This removes duplicated mutable
initialization and provides one authoritative allocation table without
changing the existing allocation-selection policy.

No hardware was available to test this patch series.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (4):
      ALSA: pcm: Add common CEA channel allocation helpers
      ALSA: hda: Make CEA channel allocation interfaces const
      ALSA: hda: Use common CEA channel allocations
      ALSA: x86: Use common CEA channel allocations

 include/sound/hda_chmap.h         |  15 +--
 include/sound/pcm_drm_eld.h       |  16 +++
 sound/core/pcm_drm_eld.c          | 181 +++++++++++++++++++++++++++
 sound/hda/codecs/hdmi/atihdmi.c   |   6 +-
 sound/hda/codecs/hdmi/nvhdmi.c    |   2 +-
 sound/hda/codecs/hdmi/tegrahdmi.c |   2 +-
 sound/hda/core/Kconfig            |   1 +
 sound/hda/core/hdmi_chmap.c       | 252 +++++++-------------------------------
 sound/x86/Kconfig                 |   1 +
 sound/x86/intel_hdmi_audio.c      | 158 +++---------------------
 sound/x86/intel_hdmi_audio.h      |   9 --
 11 files changed, 271 insertions(+), 372 deletions(-)
---
base-commit: 0f6f60115bfc536c1935d3d0da66cf1d5c7d6055


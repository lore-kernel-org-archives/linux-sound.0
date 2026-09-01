Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050EF4A0128
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 19:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289449; cv=none; b=WLO99J5B2LLzFqQL9rRqV0xD1lm39ZWCunKUKghLbBywtRTliQ7crj/Ko8XPWhqOlXw1/Yv5SvWwKtha4UUKeAR/qLvsdqTGzGrgOS4/rYp4sH/vetiNjWRd0ogUweelKpiZ/pucFiDaySXCdUQxF23p8QS7gA8/5jJZheRGdsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289449; c=relaxed/simple;
	bh=Ch+KojnLx1nRTm3Lw+0dx7rapMhOShen6zf4qmU8y40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bst3aw8PI2pw7CVcKb/f0+Wwrj8sE62UNKQpoJsQFWTaGWFllsHzghAAC2AI/DI0CS6eYsQkRi4QpfgNkAjeAIWRh+ResFj3RqKHngBHWgWMVBC/7WlKIaUesdsAi6vCEsZ0CL73GFIbsC2KttLygnB9tSDjGJ3xCJGMmjgp624=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuuENTpK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuuENTpK"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48431648f33so1120008f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 12:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289446; x=1788894246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCJexXXMQ+OkFsGqv9GRcM92GmwmtyeV26+IDyfZO5E=;
        b=YuuENTpKFWvFN7bwtpAz/rkJfRg6Rexb1EQJCNAW89Es5G/JDCdnU/tdQK/lORdxy5
         N3G8tRLI2a7pso5KnR98pg7mxkdO+LxewCr3o6jkZSAjVHF6glg2DTd5Pgdm1aWinZOc
         fcXgBJNqL/Yntf/jiIOK4WGWAI56Uk4NYQ8yk3Dx52GogM+LTEE/rsd8ZD2K74Ts0npC
         DgDGLTeXO3rcJLGbJ8oX3fIfi6gg/zuIYmD0dg+syziH2nVfur2GYUUaTmY4OM6qVJpn
         yLMq3kGDozhvHRqlcanxvbPWaw6QebwDw/RPZt6yjCiNw8NNmfRMdd8DZQWWjHT+LNiq
         YhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289446; x=1788894246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCJexXXMQ+OkFsGqv9GRcM92GmwmtyeV26+IDyfZO5E=;
        b=Ofs63WwcM7n+zB6z1w/WJjVwdK8YKZ0kxb8w9OolXSfOBVsfsgs70i0RxcngivY/lr
         t0Rdy4abD/CmbDN0Od/Jx0X/h4OaWBQ96cPfhEY7NxmdjOpT8aX94ykjApbK7b3PmBmg
         EBCUETOT12TAeuCAOd+Bl+fGhJeSVJRzTUe8O4ZEo7gmhGYVpHlJkGVLLPhMgMKxu6+a
         O+tWWKPwK6eHq9EvaWK/RxtciMOFcYy+bQQRcGAXPLRH64epc1EipXO2LBQhSJpBarkQ
         UXs/ulJC2j9gSjUYfvk3dOFAIirBh8mmCcJbZoa7D63newCMEF6rouTigvsFTxpLdlHj
         gwcA==
X-Forwarded-Encrypted: i=1; AKwUvBx4eBajcTo6KqlS5F8o9k9gfut8sjWoieDThJmKmENBaes00IW2g3AHV/tXMo40Bi9nAxyD6JQESSQZ9w==@vger.kernel.org
X-Gm-Message-State: AFuF++m3Bv5Ffejq4oKbhMkqwuXPIsdkW/tL1Vr3HAO1t5RKPdpDz53h
	AmEI0UlpX3J/4PE0E1GUhKZWQkP6u2iJb+vWkvMkTlqv/EKtppsx885/
X-Gm-Gg: AYBFou1vYmTC7hH3OpUhTCKpCCRJxZ2HQj4X87UQMku66a3xz1+fCjAa1XU72SlE7tK
	jkIxYm17cH2BMZVdc5ThbGyhvhFsQb5phcJ68RpBKu9uIaVH9cy9sYwkqsib9gv7RtPodXRYAJf
	2n+C1fbG+cOSqqOCMqyegJZ5GoqxFW0fkbrpvEBs7LH3OkteuhS7S1YU0VTqhsJ0UAR2sKL4Rzm
	h39+7I0cEopIGMfLOZdSFZX6jmEmUV7vCULzFlaSIFJDFnj062ulSIHLZ2Z1eeIctLfsp6RUJxo
	hDua3WfntRJOUZvy/5yzBkl8bwePvhqy4cpvdSGLKx9A4YG31zMO4wD4dSpHbsRIoaQGpiPIGk+
	cDvUSBmyC4hFGFKEdZRsl/DrFK5QqRTPqckZK6Z6RNamwWC2Rpo8Og9qsEr+US6VzgNvCLeIM0I
	8db3lju4ELrNL1T34gmkfqQ+2FT3lZYMaRwR/5XPg6INefZXwg/mRlbSdE++i3HK5eLuH5Qh6hG
	HtwfC5eV3RmIRsJgCmS6rX82/kYAFycXJFBIt/w9e0=
X-Received: by 2002:a5d:6f10:0:b0:484:3311:2579 with SMTP id ffacd0b85a97d-484421d6913mr14780322f8f.13.1788289445598;
        Tue, 01 Sep 2026 12:04:05 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm802219f8f.36.2026.09.01.12.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:05 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	jekhor@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] ASoC: Intel: Add Yoga Book RT5677 support
Date: Tue,  1 Sep 2026 21:04:00 +0200
Message-ID: <cover.1788286335.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds the Cherry Trail machine driver and machine-table entry
needed by the Lenovo Yoga Book YB1-X91F/L with its RT5677 codec and
TS3A227E headset detector.

Only the SOF path is enabled. Legacy SST is deliberately not advertised
because it has not been validated on this hardware.

Changes in v6:
- Return clock-disable errors to DAPM callers.
- Propagate all headphone, speaker and ASRC GPIO/setup errors. Roll back
  the first speaker GPIO when the second update fails.
- Restore the mode-3 enable pulse and settling delay required by the
  external speaker boost amplifier, while checking every GPIO operation.
- Compact the SND_SOC_DAILINK_DEF() declarations and remove the redundant
  card comment.
- Restrict the driver and machine entry to SOF; remove the legacy SST
  firmware, board fields and conditional card naming.
- Remove snd_soc_fixup_dai_links_platform_name(). The card registers and
  all tested endpoints work without it.

Validation:
- W=1 build of cht_rt5677.o and soc-acpi-intel-cht-match.o.
- W=1 build and temporary load of snd-soc-sst-cht-rt5677.ko on the Yoga
  Book with Linux 7.2.0.
- PCM0 playback and capture.
- PCM1 deep-buffer playback.
- Manual GNOME Settings tests of both built-in speakers and microphone.
- No new kernel errors during the successful final hardware test.

The v6 series is sent as a fresh thread and Yauhen Kharuzhy is copied as
co-developer.

Maurizio Casciano (2):
  ASoC: Intel: Add Cherry Trail RT5677 machine driver
  ASoC: Intel: cht: Add Yoga Book RT5677 machine entry

 sound/soc/intel/boards/Kconfig                |  14 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/cht_rt5677.c           | 636 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-cht-match.c   |   6 +
 4 files changed, 658 insertions(+)
 create mode 100644 sound/soc/intel/boards/cht_rt5677.c

With Best Regards,
Maurizio Casciano

-- 
2.53.0

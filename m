Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491C2469857
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854365; cv=none; b=g4tiUZHW5HTVwhdEkKrFamh+JMygFxzJ+hV/ebczD3AalhHxlP3pDun0Lmr6YleztxBKCJM5virDKsDCbish6bPdQC5FUsEmA1FXu435XwIX9avIBQ4n1fSRJ/1C5D0c0q28UzNuO61ab/o9TGdgbJvopQoscig6Ys2Wf31QiAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854365; c=relaxed/simple;
	bh=VfBDgBywuHcUolB/YWcRwEoLGfwjCaSjkMUCi0RCP48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wig8vKiJXKatcKlzEZsHf2cmnpRhh9zi2wiW2NHGnGw/PcfZicvVuOAzmsoAGO7jnPgf40Slpbz2IDjxTs9F7e6HzYaSk8ouTJ0jT8DbzwZYghdbpxkob3b81Ff+bKSHo8cb4Qwjf+GFjRGIfjBAalXTJkzWexdnbh0a2TUkJkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4Eci3o1; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4Eci3o1"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482e4998d28so85106f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 11:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854361; x=1788459161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MjgsUEfJhTLWj4OhJtQc/ONYm7msM9cUfhdUubV3ctI=;
        b=X4Eci3o1+d2F7w4MLsfQSiWXIKpTBlZWt+hrInIHO5DBIro3F9OZ+r1xiS8FanGgvX
         Kw/+/IXr5aHn/TQ0lRvfsW8Q0mRRkhcfQxRrZDYOhg3fjXgGfYbOVF7LkFURtsDqCmbj
         bO8aOQUVgJGpTniH5k9noXQ1DZuVg10xRxmM7wdOIfU5NEloeE6P2+ZxNpNPDW54nrVX
         QeGzfsdkXv7Zj/g81Jh/yqc2IS6Hj2duKkNFMAF99uiJsnqkVyPGHcrNFkjoCCi8ELC6
         Rb9VMDx8p1HrQ9aTHAzrcSrTqpL5qH/k6j/HOE40zMiS/ed7YaziA7dEoN+0ZliRdi9y
         s/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854361; x=1788459161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MjgsUEfJhTLWj4OhJtQc/ONYm7msM9cUfhdUubV3ctI=;
        b=MHS6TchD/5tCYic0byunibimyyXZYTfCPmebDPjUyXMkaxy+6Hm24peih7LN9wM24a
         i55gPQRsckOdSsTgNYQOBxOgaPbEM/rlhlcZ5jAoyt7uqWC8Tha8VKit5js6A3Gkex+x
         wwxurGjUB250rQIp+QOkawNz7Y1xA4SNdXJq26EI9BLc13DenMSMK70dHShwnPvUQVwb
         ehqfsE6l7KEe0KugKD8AaMgENVaZSyWyDob/9gSbBpp4aFv/iCI3AOUdmEF5641nk+mE
         hUG6Zhb3zzKQSGWG/v1moqE7b9e3qh1vvbbwdmFnNw8nY9OjJImc8AQ5cPR6g5iVkFBP
         tSzg==
X-Gm-Message-State: AFuF++lgfW2+1X97wzmXRQUnnHsyzx2q6uWPWSBKRxdg/ATArNVSd7mT
	uMUqozaqdY7vYlHl+bN10/PpJ5ZYhd0WaXIm9GNwVwesT0mt9YVwabzD4yMNSDc9
X-Gm-Gg: AR+sD10hQZ0mxGgj5RMBnRXR9rb/wWjvXwWcm+tz0csmreUh8UY/Wh4/GQqDqlwA7tZ
	EdKHYX1z92New3yugO2osEgFpi3ylxm7RdvFEYB5arRX8MyXuZpcCHY0577yGsgk3J0Fx5Yuvei
	Q4Ll+iRo1aVdi3reLtPbmzmdwtPP1kY7GSoasx3MOXmSnv+MY1vaL7wWN2RAnPHgI/+qKJ+jI0K
	HBI4u6vDCVsNDqDqgQRDl3LeU7EPv/CoEuhfmXoxq1xRGh/FuOHY61pByNXUJf0tCIaDoNX1U5e
	N//ZNmfmE8/Nt2uaSfvGStwo9ao/GuNFj+M8uuI835utKu+rwhZhlxH78dl279V2C3aA3OwLM/g
	Ktzh5K8wnyS5ZRQdmE3nhoe26siFFdBZACblv4U7BNLj4J9XjwzmYVM4RsxFXRtXKKl/kcE/WxG
	7ONI97/alUoo1bNxzDtQbnVCFe0d+RWnaQKkzLQPN8VFxoTQwVVWmhQ0uEQdOnynVGVoHH+s6F7
	XOpnqBusyTnZXc3CiD/Fep19HWBCwgma9gneLMczSUhtRyDF27gTf4=
X-Received: by 2002:a05:6000:2288:b0:47f:e377:8d61 with SMTP id ffacd0b85a97d-482f79c9511mr902625f8f.11.1787854360471;
        Thu, 27 Aug 2026 11:12:40 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6917sm10189895f8f.35.2026.08.27.11.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:12:39 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 0/2] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
Date: Thu, 27 Aug 2026 20:12:33 +0200
Message-ID: <20260827181236.2421882-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
References: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91F/L uses a Cherry Trail SSP2 link with an
RT5677 codec and a TS3A227E headset detector. Its amplifiers and
headphone path also require board-specific GPIO sequencing.

Add a generic Cherry Trail RT5677 machine driver and match the Yoga Book
ACPI codec ID. The machine entry supports both the legacy SST firmware
and the separately maintained SOF IPC3 topology.

This continues Yauhen Kharuzhy's v3 work and supersedes my RFC series.
The driver retains Yauhen's copyright, Co-developed-by and Signed-off-by
trailers, and links to both his original implementation and v3 posting.

Changes since v4:

- restore Yauhen's Co-developed-by and immediately adjacent Signed-off-by
  trailers on both patches;
- format the complete trailer blocks without separating blank lines; and
- clear the existing PCM format mask before selecting S24_LE in the codec
  fixup, since params_set_format() is additive.

The series is based on ASoC for-next at 8a070652d919. Both touched C
files passed sparse 0.6.5-rc1. Strict checkpatch reports no errors; its
only warning is the generic new-file MAINTAINERS prompt, while the
existing sound/soc/intel/ entry already covers the driver. A clean
20-job bindeb-pkg build completed successfully.

Runtime testing used an integration kernel containing the same v5 source
state on a Lenovo Yoga Book YB1-X91L. It used the stock signed
intel/sof/sof-cht.ri firmware, version 2.2.0-57864, and the separately
maintained sof-cht-rt5677.tplg topology. The following passed:

- UCM Speaker1 and Mic1 route enablement;
- PCM0 playback and capture at 48 kHz stereo in S16_LE, S24_LE and
  S32_LE formats;
- PCM1 deep-buffer playback at 48 kHz stereo in S32_LE format;
- a bounded routed speaker tone and a non-empty three-second Mic1
  capture; and
- PipeWire playback and capture with advancing PCM pointers and clean
  PCM closure after each stream.

The GNOME Settings speaker and microphone tests also passed physical
verification. No SOF, IPC, XRUN or ASoC errors were logged during those
tests. The SOF topology source is maintained separately at:

https://github.com/Yoga-Book/Yoga-Book-Sound-Open-Firmware/commits/feature/cht-rt5677-topology2-ipc3/

Maurizio Casciano (2):
  ASoC: Intel: Add Cherry Trail RT5677 machine driver
  ASoC: Intel: cht: Add Yoga Book RT5677 machine entry

 sound/soc/intel/boards/Kconfig                |  14 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/cht_rt5677.c           | 612 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-cht-match.c   |   8 +
 4 files changed, 636 insertions(+)
 create mode 100644 sound/soc/intel/boards/cht_rt5677.c


base-commit: 8a070652d9194babdd35bf7cbd2c6722b441e8f4
-- 
2.53.0

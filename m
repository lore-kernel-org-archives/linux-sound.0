Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BEB424D72
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750628; cv=none; b=pXqJ3Dlj7HKtbk5pkPL/A7kBw01ZXmDF0GxhCueojbFqM0LWC9SS91//WUvipR74B2UqTPJLsWrm+Gm7TIqqD0lBtPkEqCLxq/icCVXL7tSXH3GzhkwRYIZfz1dsEE/toRkYWpmPjHltz89h67Tjwj8VYKYGajAHTksBFNTUn/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750628; c=relaxed/simple;
	bh=7X38G0Z4VI08zeq+bs2Aklw+SJfUlA4fk0CgX0jzgOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mpK8tfkLTUeK2xQ8GUcUjZ6pxNJa6sMcsbRkmI5IcWvQj+9bTz8NVQy3X8RmFtbASy0DDuxyHJfV6VneXEo6TBiCfhtl0nKOnxapM7YKLHH/2cTJXmRobggsmm6VwC6D1H3s5eUHA+V7phfIDzN3ZD907M8PZ3CvGBHj+JESgS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzC4oq6h; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzC4oq6h"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2529b3139fso71045666b.3
        for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750624; x=1788355424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=soL+tfR/sXZ1sbllaIWYt/dW8eXdLfAIcb0W5YoOWpc=;
        b=dzC4oq6hgwHVk9mZqjDczSSHTuq8z/TfQ+BxpEfY2yyICVyYl4wA65KLcu4bKlSAr4
         Eczalk6V43KZrpGmXG5u77MM2e11NF+HSoLzjVncfeAZsBgBytAV/EaW7UwLvIGowLjR
         NHISV4bHjmCgbiWvTcoq7BEWlSm4LgFuOjEYzaWPePSTU/wTDj8fZCoQEqPEL7nijBkk
         hNHgYRvZOsiybIZJUx+LwpbAiPWFAmfZjBM0WB/MK12n9h6razUMM5VVTB2Knek6zWVD
         F3/bKYk3Pc2IRyEaNTi959jXPfe3aqSQVPizZgt58ubAo4pt8CJFM94bXv9azkRP0XVU
         tuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750624; x=1788355424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soL+tfR/sXZ1sbllaIWYt/dW8eXdLfAIcb0W5YoOWpc=;
        b=Muk4qajtDX0bOtPZa6OBe09w6kiNcEWGZZe3kq/7MLtJMorMHSdZ9UsKp3PalY/fIK
         N7/bBJFqFp4LpFreHH9LH25NIZTn0GVytbQXPsgRTYgsmsv2+OzcBw9PCWgopqARf7ri
         dlDQlqtpCh3eXuqqZPpxhRjU0Ros351u0OsTi2fifgcPmMhDQlY0m1wecZQeNpIJt5/U
         rj9xTyjTlxXEijzOdlQyXqVFyGH5U+f+qJSP0yOhc+KOV01+hRzuMaABkzpVuNVtCYew
         MOdCQiWxGjQG2YtjH/9DmTPqtm6eb//MEwhipFRkDeCl/kcizz6rXQW253//qczBjnA6
         XETw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9Aax/4tFdJRJ4wZNQQ4b9d1Hy/jx33EEiUIcA8d1mD/FLW6w/blYSJWFD6lLK5afan919h1x+kp0tIA==@vger.kernel.org
X-Gm-Message-State: AFuF++l4cLLqQ7aN4FRKAr0gOjnTmFmOnHI+OpJsQ5mntD1YvGa1xBZe
	bhzMZ3bkTAL5kLpsGehE+8lH+/35whQ/Y17u7G1mkWq9komYYZqidzIK
X-Gm-Gg: AR+sD10+p7fv+LE5QiOSoa9AkWxoP+TREvBfJ6k3hFYx+fwZMrK3HN/DtxawqgP5XF7
	UW7+9d8MMGClme1cBUGIfnOLJ9IE1nQPW7f/q6IbMdVZ1MJaY8XBQUTaGtF1WqoqtqGpRoy99oa
	TmKWt5rCYxrfn9xCsTOkq3g1oZbKLZPWzoWBrcJF6fOoMvycxjOpZMGRIawmDyW0WxCV7Ot7MbP
	KKNa37vQ8M/qZfs7Po5LeSodo9qoOLEU9LUlvu3XchW2vDGRlcCVTPcHutrsjFgnCFlSf+0upiM
	7GAyhP2WwYf/yeX1AfAAxwFXPOpqn2VGRnsA19k6uX6gxuRVH2Qcf/g6GLPfhgoIyUGB2S85pKp
	eW7VnFrAEwVgI5PNApeZhXRfNmreviOMx61YpYuucnHcW7AzL8Yik7+dbfEZVh9AmM4JbOKSTs/
	t6TkkKpRna/L1OVgLncGeCewXnaY9rupe2WeC1LetgJiYs6I7vsSxSDlppNCYYdukANRy871LYj
	tcu1F6tlAsxx46qPhWDyDmiFCid1MP3Xfmfk+SZGr8P
X-Received: by 2002:a17:907:7ba8:b0:c25:2f07:6abb with SMTP id a640c23a62f3a-c252f076da8mr274159966b.13.1787750623988;
        Wed, 26 Aug 2026 06:23:43 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250f99f6bdsm376856066b.0.2026.08.26.06.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:43 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [RFC PATCH 0/3] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
Date: Wed, 26 Aug 2026 15:23:31 +0200
Message-ID: <20260826132334.3344395-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91F/L uses a Cherry Trail SSP2 connection to
an RT5677 codec, with board-specific amplifier, headphone and headset
detector wiring.  Add the machine driver, the SST machine-table match,
and the SOF topology filename used by the corresponding external SOF
topology.

The companion platform/x86 series supplies the TS3A227E device and codec
GPIO lookup entries.  The sof-cht-rt5677.tplg topology is maintained in
the SOF project and must be merged and distributed separately.

With the matching topology installed, the Yoga Book reaches the SOF
card-registration and stream setup path.  End-to-end playback and
capture acceptance is not complete, so this is posted as an RFC.

Maurizio Casciano (3):
  ASoC: Intel: Add Lenovo Yoga Book RT5677 machine driver
  ASoC: Intel: cht: Match the Yoga Book RT5677 machine
  ASoC: Intel: cht: Add Yoga Book SOF topology filename

 MAINTAINERS                                   |   1 +
 sound/soc/intel/boards/Kconfig                |  14 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/cht_yogabook.c         | 616 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-cht-match.c   |   8 +
 5 files changed, 641 insertions(+)
 create mode 100644 sound/soc/intel/boards/cht_yogabook.c


base-commit: a1a84efff65dd01a2608770d503ce297abf54c66
-- 
2.53.0

Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1FA3314D2
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 21:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645463; cv=none; b=ob8zit1sW4u5OC0PFL+HnalRCVoSjJnUVtzouOQ9J+cIkzp6RBBBYy8N7AQBYe+UTmZ4u69C3x4FvNiKbA2PnYBzw9dc9NYR4n9BCTiymETAh/esx5YsERAVAD4uO6h+vbFLOtmn++UlG+6Sz95JojOpOJvp2THufnSsiAtIPis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645463; c=relaxed/simple;
	bh=aSjYUFj9M6lwUgJXiT62heEojJOHFWj0uLGT527L3XI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/Wa8Kg+wksik/+UNRrRn1mP1HRqUJdgOCNRAJQpq5SI9Kt5ywRq4G9Y8elAzyWHnn/2P5kB9vyFMeZmM3DSFgdoYoh0Pj3AGDjUpS6rQgLQ5k9xSEWLizEQLlqTxpq4ZyUO1hcUCBt9TMvUeURTLZNWotwnt5lpXDBftcmziug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlCWFGzj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlCWFGzj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2adff872068so10936915ad.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 14:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774645461; x=1775250261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AX7iaJPKCeMvl6HxeWWpfYEWXz+yV+MPEoNkKjeVFMI=;
        b=ZlCWFGzjgqhhPjoL2BJdyUPjBw2HRRQnL5hEbIEH9JVhVH0ddLuthCkMEqKUS6aSU/
         jCjjLY/l4rbu9p00wlAt93HOo13apOLpF1Ce/vcpWbhH/kvaKUf5QgI16TmzdBKooAne
         ng+u/WKd3G72AvIz1pO3uHLIPubQLwYZWcLt15ujt2+P3eYg+CmKM0ZvO6MJPq9sKu72
         koE3xg+vJKnryC02eKnHL+p6W8qoIDuQuzzaK3Ff3fjs4doiHthiEol10u+G1Wb6chhT
         /N22dkr1OEJU0h4xA+ER4Y6WLecuvN6nSIFdKs8pEvFHSvUyrLQRmlYyCo0EHDzrab8n
         qhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774645461; x=1775250261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AX7iaJPKCeMvl6HxeWWpfYEWXz+yV+MPEoNkKjeVFMI=;
        b=OJgpE7ZWok0wMvxd91jqR6C9vq93hRcREdpqD+NLILhOwjokeI29h+q9kI4VF53Z7K
         bb7v4SiAofgtG84J6XwjHy4CNegDrsJ2mldn1B3Oi39jlpO9rPH6LhYVN/xAXNWIXsVR
         ZB4eh+IDlqF+821GJKbDRnwn3C/BltBMBnYwAf48j/pyLK/zO24/V00jZzY7Zneo53+n
         /tE5Gp6IjIZbmCZKHje5A7AmrclkBX9MJFfH02BUCspseZuGjhVlBZESRNsRRqVWcdS8
         jD2vMJuwMGMWyCR+wafcn3GkAQFpBKokoqTyIyhePN/m7ceNDGwEhW2GKiMLc0K6BPl8
         ikIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhAIWgKASGZcXMTcGxD6LG85zjW227kNBtmZUQNkvb4Cp6yJtP3SsHoICBsiNazWdtegMpVLhh+iIdGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjGid8IFQqPCGI4e0TG2crsQJ6G2keNOVDhD0m6xna1M5jbQPM
	BmU/EgXBBea6pv6oNJIH5NDFS9qvM8GJp4s2phabix8Nf206mH9Ubp8OngvrWdFsalc=
X-Gm-Gg: ATEYQzzxYZS9JRhPCQeZzpyM+1uN8bjkavLZF/uj6ZXiAzIVN7DohkBBvCpvN3x1Mr1
	7iU+IxOMt1qn/dWZjqpln7LAtzejvGzbZo7E9p6boLmomOVpW4HnobOf6h9sxowHNV7x7Q1KVPh
	RsIvCP49DNaXVdM89wZaupoq86c3XS6lrE2DY8veGp3zyuYEta9TEeHizuA5JDk1zbsc/XJ6Lfi
	YsZUk+PYL2JHvEHR+xJwGXRYSS8qBQ/MNIqbRMye+qa4kC5NzlBrC8RrLS0sdtcgJ2BmzofClxl
	3O8RwfVjW6BJoxrYFKQPSrKH0iLgn/y8n6L2cWjAMoTRzDRUo+8u+plj2d47swLEmh8XjwM1FGS
	DbdpUN4tuXmQl85fvSkEpThMx4+y1XXE4Gk/HMcDkUBI+XkmtCKyx8CI1g+gPgRIMdGurzF1x6s
	TLj+CEF+Uq/+ZH5cjeyoOYUqfgA+LdKN/8QnKPi01Xe8XYkgSlmMMv
X-Received: by 2002:a17:902:cf03:b0:2ae:59a9:639d with SMTP id d9443c01a7336-2b0cdbf7d69mr41662825ad.4.1774645461211;
        Fri, 27 Mar 2026 14:04:21 -0700 (PDT)
Received: from debian.killsync.com ([103.85.207.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24250b15bsm2358125ad.0.2026.03.27.14.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 14:04:20 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v3 0/3] ASoC: Intel: Fix MCLK leaks in platform_clock_control
Date: Fri, 27 Mar 2026 17:04:05 -0400
Message-ID: <20260327210408.430908-1-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

In three Intel ASoC board drivers, the EVENT_ON path in
platform_clock_control() enables MCLK using clk_prepare_enable(), but
error paths fail to call clk_disable_unprepare(), leaking a clock
reference.

Fix this by calling a clk_disable_unprepare() on error paths after MCLK
has been enabled.

v2: Guard clk_disable_unprepare() with SND_SOC_DAPM_EVENT_ON() to avoid
callling it in the EVENT_OFF error path where MCLK was never enabled.

v3: Restored missing clk_disable_unprepare() guard in patch 2 that 
was accidentally dropped during v2 rebase.

Aravind Anilraj (3):
  ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control
    error
  ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control
    error
  ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in platform_clock_control

 sound/soc/intel/boards/bytcr_rt5640.c   | 2 ++
 sound/soc/intel/boards/bytcr_rt5651.c   | 4 +++-
 sound/soc/intel/boards/cht_bsw_rt5672.c | 4 +++-
 3 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.47.3


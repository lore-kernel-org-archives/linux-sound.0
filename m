Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D57521218
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 17:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914277; cv=none; b=ftYrmdUs84dggXoCzQH53kTOjdXO2igWh7pzEV/QI18mqB7UNyXsSN4RnhGyHB4t6HCoK1eNQUTpT3p1t4mEvNmEaGL7YIhhXQFEZ6UKcBLstY9wDkuUuwrE5bD2ZElpSEnTk8wAytEsLzhqii4L7qKNn8j52wsA8hp3yEnCoYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914277; c=relaxed/simple;
	bh=GugSwvMULIKBhmXbHEwlcQ42TI86YVxrh5vB+fzkqc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EfwJL0B8Ww8UWeP+HtjHfRuxKs/GWZavQA8RNb4TBJwI3opitFFK4HIVvSK7XTUP/ztkBhWXn1dlaKDqixydJNzH65EvOfvDeb0xQu/EXjkPJyF8ja3ikEHrk+/Oxj7kDrGt4ekGhGRMoDx93cBEd+BoSuPgk8w7aM4jHpvTlLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKOOWfUm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKOOWfUm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a02718da81so26350165e9.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914273; x=1792519073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6ZTA5XoiG06DywZLo1HdZL0nmmg1bBIa4aTddTkmMk=;
        b=MKOOWfUmQEIt5C8mAFKmz6/x3xJrZ4SbFYAuyJb3z6diSUHP8rN10ysxSd6nWErz9c
         rYfBnZlEdzQ8jCid7o6v5JzzQuuHccw3s93E2FwJOnAcGrfZnZHmZP1gstWtP27yWdWi
         mzVTT6NHUua0wdkDPwRCkfUFsRdoAlgo95dYrdCDfm5W2ecuGYTvazqJy7sYQX9lMq48
         XDusO6PUDZzv/VUN3bZjH8vXFbGgbIMsj8V+YK4nnsD2qMofLDtlJqUaaUwnup9+J3D/
         /dGAZrV/hCDNsb1Q69g6FDWNXTQPZToHGdZDzzlIK9DHixhDxaN4BlVCb/s5IwSiigNV
         z9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914273; x=1792519073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6ZTA5XoiG06DywZLo1HdZL0nmmg1bBIa4aTddTkmMk=;
        b=c1kVJln2glB37p/yc6LvfXYGnjSMULW88007PLItpknlizrlJ1Oix8SFR04dP6pbni
         +evS+Rou7s/k8l+2C3ED0bDHEXa17hiYlc7PJ4z+5NA4wSUx1FFyTrhDS3UZZk7mI+mE
         z+xW/Z/OSOGvGcrsVgJeGQB/SjPyBQvD7J9ELOlnlSfN4LK9JFYtsblbd5p9oVu53Ilo
         MWw+Fo2p9q1Q1V8iT91yPYU5IjsbTAESyM/h/RSdDS68UynZqnpHfJ+QiIy6BobKSNVC
         D3xBPYITDpr/Q+g8iJfVu00XlsqrAwhGcP8yWY9QWocBwRUsg16l+EEUwIPv51dzZ7yY
         PZ/w==
X-Gm-Message-State: AFq9FYIRdbEIwR/Z8ZpfQzKLgkDMpGJyzbuKL1/h6Dlx5+85BzA++3oL
	gt+PSnss83s8epryunCdnsNCdcOsLcHlyjCXTVxA3QxGAu9x4q2xrJsI
X-Gm-Gg: AYBFou1GOnhzsBAcElVODxHdmoWtyMlfE1vWudk9n4bY01VwqkKuLkpMbQEty4dDHoP
	6ekKfQXCsbSDe0v9R8cDGX9qvhJsOCC8W07I7e2+/hdaAXTf9f4H+tJkygZUoyQwCTuLDLNDo/W
	dnODsQovTpOc6kjIUpp1tDpOkZJqfS8IC1AGHVkJJ/XfECIDwP8TCqq2FhnmtbN4CAEkLmTZgYF
	Oeb38FE7+GU1+tSiVLwyzZj5yczZEO88aAE2YZGqjgAl/ndrH1j9tDEYcdA/VcAv+1gU5++Of7+
	oZbPdGNJfv00PqcTlx1bm6ZLItTTVSlFg6H8g2iDSh1LvLMhormkqE26Z13OCOx4goXF9V3/+/f
	vZxAJur+xZwr6UrGB0KG4zl7ZHRjcJYDdU2Ml+mqThQd3IXIUCC45boBW//0U5vfrACuBr4EzxC
	ZzynCs9sxFa+Je8WK9/lMlMDLwOEP+XTpEctHB6L3fglF2SUFYBKseNtFHsRK3H9hnQSGpgeqfC
	7rUavopGqggBEB4zZl+
X-Received: by 2002:a05:600c:8706:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4a18e4b0f6amr249667145e9.20.1791914272805;
        Tue, 13 Oct 2026 10:57:52 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm447804745e9.1.2026.10.13.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:57:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Tue, 13 Oct 2026 20:57:30 +0300
Message-ID: <20261013175735.473704-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fortemedia FM34NE is digital sound processing chip used for
active noise suppression mainly on ASUS Transformers.

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/sound/asus,tf201-dsp.yaml        |   80 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  388 +++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0


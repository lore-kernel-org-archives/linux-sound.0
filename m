Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4063E38AC8B
	for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 16:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784995439; cv=none; b=j9jYPUK/3cf3R95znWo1E6p1bgc1tDMZ2/mJzwmacetole9dvcziTU2nD/vSA2Av51eDj2rzAF7inAduNGi1A+9GKIsoba3sUBYM7nYWqXrX6IDilWUfiG3DY71/NEI5mjWN/E9CCh0p2YKuWE4PH6XQR01bdbcR4sXWtwtHe3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784995439; c=relaxed/simple;
	bh=3L6pLBTx9VA6NBljNR1RnnktSuo8+gR3IdvZ9wv3SGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u3XWjuzSsn5zcYM7F+kYUi+HnTBThDcMWXjB8XAjfzCcWHer4A77B5ZwLBV6NVt0dsuy+H1N827PmSShPLH1+QsFEvGftCxCk8DYkHik7PdD7p8VqnyWqVpjiu3xA0/EPXWAh9s/SIckqlgU+H28Wo4cu6QD9f//gjJ8ZHjukjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4BGG6wM; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4BGG6wM"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84a652535dcso755111b3a.3
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 09:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784995436; x=1785600236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ivv3n1AxVp3OJWBisbchm/Ri3mmo/BxaikvmTeEl6YM=;
        b=n4BGG6wMx2xIXGZSPXQQ963g4wTZdiHgpgUIzFzEJgKOEv7cPlM7g1J7m9ew8LW3UR
         ci5qN2c05LloQ3dEgZELKhC1osp83wcGsnyxf9GDU3aIEPMJbvalZzkM+4NT8jvBB7Bs
         DmL5Vw0joFFmD0kP1wuf3Z68aln/ZmYxxvbjVenhMTG1kkYXvSg/t64cju8URvWcte2U
         1lF6amOz3S2/7LJsPZmokG8uZqge0WaZyZpmuTCuALqfloMO+mx0l21gM6dbKPejqQYq
         fNGN7mNVEGcG7oUZtwqcIh4swF5nis1ZwgqAYbmQoDyXs3qWNf6Oh4DIVt5oBZjvvz7G
         6w4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784995436; x=1785600236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ivv3n1AxVp3OJWBisbchm/Ri3mmo/BxaikvmTeEl6YM=;
        b=BAKnS0n9JxfCC2OEU+k4yX8fFTeKDe7niN86rD5XFBL184mGUmtDjVVf7gQ1Cgek9a
         iHlTbUh8auJf01kVAZevltp8I2Y+6kGDjKSmhnVyhGiZgYaLOohH9ZzRGKHYZzN5hFWz
         MBB8V4vJG/BoennylfZaOxDSTYH2GwSUbfgZjrSHjUXJebd1Dmu0lN6Otar/rmftT9CY
         njsA54/FfJTDQwPjfK4Me1TGb27JbZd9w/3frXQ/LTmV1E3+w9mVOWk2m3X3vsGRRc4P
         +HYedmbqLqARzaJaA2+QCcFxqNBqy9eQcF49FpNQG3YEX4+WDmTbbK1WGnpLz2RSSEXf
         7IDQ==
X-Forwarded-Encrypted: i=1; AHgh+RroRQVx9vY/GZn4AxTFFkszxvl4O2OlQA2E79tpItEP1e1VEp/BhUBPQfQPiJ7PT8dS2GMiCEzfbdk9YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOtQgs0ZcwxnT61zFAd7Ps715SYTydn3Q1DOnbUKiP+3Rr4qjm
	sqZMNrg+JYr1f0v8ratNixgEofplITuYEalggjJB98gN6kKkrzoWVxzz
X-Gm-Gg: AR+sD106x26lYG6S+vJC88A9bVyZypDQ6E90hJWYIB+0vr8XZ2N0HPSvxlr8O9aKI4c
	RGOhr/CYmKOFiYuU/SsGmUFTPexATpJarGJP0H9ZBDvdQLBHP7Z+6u85x1KHu06oDSqT+ySR3y7
	c9fjN9sURyXHUviPtE3WRJ45ai1v68CXIAD232ZBr+BR5pO1SMJw4wFUzYlGHhH2nPvRHorGDhl
	LR9kVMiEPba6YiwjAF2FmEdCEuBTpNIGTT3lZp9vIAz/CRGSr+N/wy3QFldTvTGYrU6qWOAy5hR
	/WMIrTYYT/tzkqE3sAsUKjXa3wlbVhRjitIDp99/vQS1pB39jMXmbK2mnxdYz0ljkpaJ+HYD3M4
	wlnI73CYLMN1znmkJCKHtKEEUOyvWR0wj4oqbNCWAngSp6wgFOjpF2NIV54tyM8CeE2qfpdcc
X-Received: by 2002:a05:6a00:1f05:b0:846:c7f4:74d with SMTP id d2e1a72fcca58-84e5955b5b4mr1823323b3a.41.1784995435584;
        Sat, 25 Jul 2026 09:03:55 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341d8f0sm1171554b3a.44.2026.07.25.09.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 09:03:54 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	sound-open-firmware@alsa-project.org,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: [PATCH v2 0/4] ASoC: remove conditional returns with no effect
Date: Sun, 26 Jul 2026 01:03:39 +0900
Message-ID: <20260725160344.916838-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series removes conditional returns where both branches return
the same value, so the check has no effect. As suggested by Vijendar,
the ASoC patch of the treewide v1 series [1] is split per vendor and
posted separately.

All patches are generated by the Coccinelle script, which you can
find in v1.

If you would rather drop any of the patches, just let me know and I will address
it in the next version.

---
Changes from v1 [1]
- Split patches per vendor
- Change base to broonie/sound/for-next
- Filter only ASoC patch

[1] https://lore.kernel.org/all/20260723184538.3888637-1-ekffu200098@gmail.com/
---

Sang-Heon Jeon (4):
  ASoC: amd: acp: remove conditional return with no effect
  ASoC: Intel: atom: remove conditional return with no effect
  ASoC: samsung: smdk_spdif: remove conditional return with no effect
  ASoC: SOF: Intel: remove conditional return with no effect

 sound/soc/amd/acp/acp-mach-common.c          | 11 +++--------
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  7 +------
 sound/soc/samsung/smdk_spdif.c               |  8 ++------
 sound/soc/sof/intel/hda-dsp.c                |  6 +-----
 4 files changed, 7 insertions(+), 25 deletions(-)

-- 
2.43.0


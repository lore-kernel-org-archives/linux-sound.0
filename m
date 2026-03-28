Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738C32AF1D
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 05:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774675589; cv=none; b=ehpJugX95IX+KUsSBAVYZp48gZxAmlFEvcU4i7C/zIw/yWhuDnTpqtHabpzVl2gLwMdChccGYf+ZTPNKIo2JmRiOm0cWcun6uKxvt2v6IVytBsVB0qFlwbYgj1G9P5cvGxF1C9/5Eck1AGeSjvQ5xvmMdA62JopVEecc4VaBA9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774675589; c=relaxed/simple;
	bh=OaTNHK421v9P5ArUO5x9BFubrdvQgCKsOKXrdPxtfME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IpqWpP0bCJa83QIFbwOp9K/m/VGMaXX3I13nc9Crs67KZpWgOCKAiinEflBtB2uNTZ+7wdqJZHBf3Jdau+uGtR8gkN+1Gf2yGYUwB7+1JGLFHBa1YiGmxo4CiXjXQMoI+HZ621fnuRG4z7pepb2a/oGA/hx1pFPfkH0knYeay0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKyukBcE; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKyukBcE"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82a07738118so1677816b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 22:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774675588; x=1775280388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFFoh3CyOeLt0Uxg0Nq/w5Z8lWNqgZKYp7YIVeIzttw=;
        b=ZKyukBcE+XisWTklYJ7XjQl1MRWDGAKY0xmwyS38KCO2U1AFU9XjEXHz+Syr2gkw3D
         nj8QVzJfFAtHivWGmC+WM+UXImkVAdqKFIeS/0RMtAEwTUMkgBJvXgRrJT8RW94UFvw+
         Sf/eiDHxa/AzsSG3Emo9IqGBjgXGvsoShMXEEcF6bSIyK5g4Vdr2Uy2fw6M1kgqWc7f2
         ydx41eLmHLqm104bYQmTUrdFbeY3sGIKjK2vHYFpSVYf4DAZFGOa8ELz8ix2XbZbwQJP
         c3STiGSPZe0kzK5B9cUbA8293gnZ0MfQceq9RAQoKnze0nEGZBDGD5GL5DnP+851+wBX
         bAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774675588; x=1775280388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFFoh3CyOeLt0Uxg0Nq/w5Z8lWNqgZKYp7YIVeIzttw=;
        b=lXJ1b1GCUMA5ND7chuY0MUXDTvbGMCW/v7mXgSRCTKeGKwuQxvlrSIwbs8ShDptWGK
         9fE08ucXh5t9MiXncsiApZpGTtttGkCSEXjSza+ZNulcInFfppE2jB8zy3maNUP8kE9Z
         x+bqOXx8kRywH2ohEQst+rXbw0z0DQSNqOdBQo/cCDoFr0/dec/we1MGKWy4rysUXzaM
         xvrSIXTc0tJo4QmqZNeWJe1fYfcf5SLDsFcg6Mv9ziKDr4pYxVQRizaXjsfpfTDEIDKw
         cSS+oxnf848Ar/8OqIrYyVIoeNW2yPk5uMQ8/AWBbYATE6wjPOZmW0DwrosTMmvu/jMk
         xp3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVsSQTK9CKq48uhPCpBfW+ZRcZcTiwQz+nGSb17AOF1xjtPDNS2JJaqQf/Q7q8ZI1xYju1sj98v+QC3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzCnYZzpV9aakMBQf3yTT63Gzcb+t2nREFxblQucLdz+iF+752
	IttgT5/tI6nErvP9bWuvUwtf3WxTzCBtBwrpekN6tDDAO7rqZ/qyTpr6
X-Gm-Gg: ATEYQzxKHSbCtoynTJJLHPJwF8AS2uG7p4h1B5YN4SMoa25z+7KCp54OsrR1+hn2it8
	BA2i7PaSQeaDm4BsgZII9rCeajJa06kdZqybcKXK8fyiNIw8PtPSYJBXDFVBVtT0bkX/JQ/AJLf
	l7wEsve05WiC3hy2VrxyRJ0bZMxCBPF7iXyf8h1K6Qw/+fghOpySQWVawhcXh+oC/ue7JZi78ha
	6TaOxNTytQGiV7/PTQrHOea8LATlcVjoBOJH7RE6TL1+nlxotZK6eU5F3ApiGeto8OtkpeYsdb2
	8JEPCwE2hync0fQNTR4jkGcUTlFDeko7yNiIAH0iczeh1cuRpKcSjQVpuhwEgoW5+o3vHZnSdkB
	T1vXxAuXVKTEV1HAVUd9EQrW4jaC35RvRDQeNJ7cc7PW8a64B1GrazOOST03eajJ2fLohGq7sK9
	Rrx6JLzDfXzDeX4RL7yrbmB1M1sL7LcAxxBtSeGRfra9quW46h
X-Received: by 2002:a05:6a00:1a91:b0:82a:6852:559e with SMTP id d2e1a72fcca58-82c95e5ab8cmr5003664b3a.12.1774675587591;
        Fri, 27 Mar 2026 22:26:27 -0700 (PDT)
Received: from debian.killsync.com ([152.58.216.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca86307a5sm923739b3a.60.2026.03.27.22.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 22:26:27 -0700 (PDT)
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
Subject: [PATCH v4 0/4] ASoC: Intel: Fix MCLK leaks in
Date: Sat, 28 Mar 2026 01:25:51 -0400
Message-ID: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

In three Intel ASoC board drivers, the EVENT_ON path in
platform_clock_control() enables MCLK via clk_prepare_enable() but fails
to call clk_disable_unprepare() on subsequent error paths, leaking the
clock reference.

v4: Split dev_err formatting fix into a separate patch 4 as suggested by Mark Brown. Add return code to the error message for better diagnostics.

v3: Restored missing clk_disable_unprepare() guard in patch 2 that was
accidently dropped during v2 rebase.

v2: Guard clk_disable_unprepare() with SND_SOC_DAPM_EVENT_ON() to avoid
calling it in the EVENT_OFF error path where MCLK was never enabled.

Fix this across all three affected drivers.

Aravind Anilraj (4):
  ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control
    error
  ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control
    error
  ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in platform_clock_control
  ASoC: Intel: boards: Log error code in MCLK configuration failure

 sound/soc/intel/boards/bytcr_rt5640.c   | 4 +++-
 sound/soc/intel/boards/bytcr_rt5651.c   | 4 +++-
 sound/soc/intel/boards/cht_bsw_rt5672.c | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.47.3


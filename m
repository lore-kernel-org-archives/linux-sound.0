Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF19931064B
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 22:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081133; cv=none; b=IW3owXo77knUiTJe6pLUTDtlJibrD44a7cBLC3zA3dgsY+vcInWTFWKrHQCjfCa9L4AF/p7iDnX4zMxeDEcUxYuhn7dVND1oJ1duZbuL4Q44vX/HGX8DbzSL/F/XZhWGFcG8z30N2eYidAN6dLmKMinaanfruPbpSyhrMCiJrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081133; c=relaxed/simple;
	bh=ICZEdNZ90UWWaUrt0lqxlfknui7puF8oczvy6ImHZHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UbzGpZ6DKpiRKU2WVt4hYZlo26pqxTcWIHcOERze/iu8iR6in3MUGnjdG2GqqRIYncZ58H3ftNJHQWUVyeZFw2Fi5+ArshG+flzREGNDQB9BstKxGzKjiHc/RxcWagQoCuax2kTxJmBaJfrlZZTy+yy/YTMYsv7xsqUPm3eoi+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+DENO67; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+DENO67"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b0ba3bfe16so11038765ad.1
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 15:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775081130; x=1775685930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmIXM0vUNAjfvYEiER9BuQzgzQDm80dQQomVM3H7Ah8=;
        b=S+DENO67WLdAXpKSbtPLB4kKeBSCmq3UbfeIaboggMAUThwO5ALXRtle2FSt8SCRbq
         JvaiP6y3JvFh4ewlHtil4nLRsaUu4KX7ENK9N3fLGC7s0aB3MhzXYU0r9xYdmg8SDZOt
         IU2CoMaBqEd9LYxqwM0hsxnYiLPh0kXkK8wn0Z+PEF5S/48wRB6ZCmihmT9wgyl/JEtJ
         j228EWNpwbwI4IS1KUNz7UVCDC4ICdpVXeID2JijADoGLR1SAb6h8qDIy6XFinWnWd2r
         kzCr4ZU02F2SBGT09M8dXJz3dusuQgIgQ9nGFdKDSAR7RGLzfBDl80xnvf0HO+xlIRqg
         kXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775081130; x=1775685930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmIXM0vUNAjfvYEiER9BuQzgzQDm80dQQomVM3H7Ah8=;
        b=Vhrtdrpvzgb53pkUCNcmDZ8MfqiptpD0aijYS0vb1TTdIGYekvQj9qM3n9eNLnq+5m
         aMWxjNsgDk8dNkpgB708eVMvaXsw5JobOm+frwE7TFbICqoKrlFzopwRte67REN662pG
         zEYNQfwByCNsmDY5kIvd9U2AsbDJiwHvNQTNlZXqb1x7hAS/Et2yGHPczh6f33TATWuL
         Wdd2mGETeZmO+KJ9uumdIMG938psn4Ne9F8UtKr0Id2YXaH+FjNwAGOL6drZs+uaM9mX
         qnNNtICEBIQJADUzhQ/1LU7ZQRN1Obd0u4r41E6Er7nVsd7BcT5/o2sES3U3d1/Mntlo
         5z+A==
X-Forwarded-Encrypted: i=1; AJvYcCW8Fawc2FWYwFX1+7ffjb2YgcIUPnK2NgVWFEotTZjgx0aK8H5i+2/RtAhppDcXBt7E5nisdf6ztO6mcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5X+5zKyMv3rq/z1qDFretvdCN2KcRwDz1EYMmYZFbjRBlhVnQ
	0KH2QZ1TadEngKw/Q4Dmjm9Hj7aTanZ+r7bCwosRv/45kXIAsKMoyZXt
X-Gm-Gg: ATEYQzyFN+hul1Yt5InH+yzDQEDmmfEdOkZ9uWd2AITYFMV6En6mlBVm6ULhARukjwW
	pZmHiTrta+p3jkXFtozl+J4N+HYLfqmdB1rW8aigHJIYg6m5Eow9GB14CxHP9dDg8NpHMIIBbM8
	kX5Y1dHZ1bZqAGMNVXw2pB43VMt8vGCV8iiSwh1uCZeDoOznIj4vW0S2STg9pmfDwyI3GG4BcVh
	nKLVzUJE/VULKiwaKOYX/hPYOPBM4zbKnoNaDG6BhEehnr94yAlr+p+8ILr1IlosaVYOrJcxRt/
	wzC0FnCatWeNz493T98WToe0beqkUBjKT1MhGEf1TJ7nX32TCg81scWfQ98ztnX2DQ/p7dR+3Ig
	j9Jq3E5abbk0aKMUQ1eYQewlgrlah7wtwpSA2gZSjUQfYGJr/3TKBrKa3aNygdZPhtUfwiFNZzE
	CL76yTQbQ84LIVPy7SizaAZuiYetgNSY021S7Fk8lxAC5F
X-Received: by 2002:a17:902:e78d:b0:2b0:b214:3bf0 with SMTP id d9443c01a7336-2b277e370a6mr559755ad.17.1775081130303;
        Wed, 01 Apr 2026 15:05:30 -0700 (PDT)
Received: from debian.killsync.com ([45.116.230.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af47sm9050815ad.42.2026.04.01.15.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 15:05:29 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: cezary.rojewski@intel.com,
	broonie@kernel.org
Cc: liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v6 0/4] ASoC: Intel: Fix MCLK leaks and clean up error
Date: Wed,  1 Apr 2026 18:05:03 -0400
Message-ID: <20260401220507.23557-1-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

This series fixes MCLK resource leaks in the platform_clock_control()
implementations for bytcr_rt5640, bytcr_rt5651, and cht_bsw_rt5672.

In the SND_SOC_DAPM_EVENT_ON() path, clk_prepare_enable() is called to
enable MCLK, but subsequent failures in codec clock configuration (eg:
*_prepare_and_enable_pll1() or snd_soc_dai_set_sysclk()) return without
disabling the clock, leaking a reference.

Patches 1-3 fix this by adding the missing clk_disable_unprepare() calls
in the relevant error paths, ensuring proper symmetry between enable and
disable operations within the EVENT_ON scope.

Patch 4 moves unrelated logging changes into a separate patch and
standardizes error messages.

Changes in v6:
Place cleanup logic within SND_SOC_DAPM_EVENT_ON() scope
Avoid redundant condition checks in error paths
Split logging changes into a separate patch
Address review feedback from Mark Brown and Cezary Rojewski

Aravind Anilraj (4):
  ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control
    error
  ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control
    error
  ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak on platform_clock_control
    error
  ASoC: Intel: Standardize MCLK error logs across RT boards

 sound/soc/intel/boards/bytcr_rt5640.c   | 4 +++-
 sound/soc/intel/boards/bytcr_rt5651.c   | 4 +++-
 sound/soc/intel/boards/cht_bsw_rt5672.c | 6 +++++-
 3 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.47.3


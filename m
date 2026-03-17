Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A1437FF5B
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 19:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774004; cv=none; b=rC2xeENK3insS/ETBTuSE66C6/cROCypDW4qX3QkKYSJ3BPFAzIwt320v1iRkL53rjefLQcNUySkvDVs9plsRIRJd12afWMcRA5wQ9unhpYIOdjIJPVkrFBMJqui+HMG2MUIOQtYLBvR7cE/TSEFD7GUPSfiUNPq3S3BczKw5zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774004; c=relaxed/simple;
	bh=7toBs7ZZhUyluOq0svKcjp6u10Tro12z91fbmv9V774=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjYDTizANVrDh90rlNacad/nnHaDU/G1/UuiZgi1gmBYqi5g3LStp2mywr4/fTBSl81KNsF4zrL7bPpZ48FbzpxIf5d94CMHImVCz+8KzuZdPhIfTVpQn18RzUYaBsYwcK3u1T2p5nzoRxypFTvUCx+Scdt0f+B6FIM+Dz1OHs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnwgLi/B; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnwgLi/B"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35a1f3f07ebso2528981a91.3
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773774001; x=1774378801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PcwMDnihsdnmKVOsfDRGKcGqZ39RTcsdWpVCxqwOIE=;
        b=JnwgLi/B7PR6QTTpALGIGGvsYdQe+j2j1HFQ2ktbZlbIPHWRPiQtzaco1IqdtDXCrC
         lSTjjsAtkMBmxvTDduAJTEyu/KlFUjcK3JfJ5dd8+lVad+5IDl6zOC7qb91xqCF4TgJP
         PoNFTrok3z9kL4n0uS6Wu70ofR65MogRYgeqSljKglx8mjeUOQy0dnIS4VVxCtW0h2uJ
         /wiXVwcddTTgOu83lMcFj//5IeMk+D/pE+pKOIdAJCPOBfA0eAqPS23nckHGi8xg5ubL
         fXFJZXoXmczb0B/NEPM7LSRWnT/i/ImqRRwMrKcC+vfIWDn2aNhu5mWhUwcL+LoK5ed7
         9/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773774001; x=1774378801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PcwMDnihsdnmKVOsfDRGKcGqZ39RTcsdWpVCxqwOIE=;
        b=HnCKaQsbkRSW5Bef/S6Dhh3pGtN4xb6Y1/NT6vdieZa6cIO2PdC3gf4z6kA/AgUBTc
         JxDogvlyViHbplpKcXY2mjXFH+5vXEvQRSwYFAB+KmZupaQeyjh5c2/VejyNuzn6tgCu
         CexX0+MmE0twjT52oww/O/1d8oCVUBkpxu0ctmd5pG9bTweakP5Fu71A06xhONXbDdbQ
         e8h2qJoYDJ21NwYLKJjeACY8JLdzO+3PWkz7SMv2rLg387384RBapwII7wrL3dwRbvRs
         m1hOPj2UvqmS6H3Bbi1udFBEDaYG3qImOasCvNs7n3PKSqUxjagzeHfDTvkgY9yRGBSC
         CNaw==
X-Forwarded-Encrypted: i=1; AJvYcCUU31YvnjdnGBrM4g1P8aQC9tWROYyKWaMy8fSpP+a+yAnBoz3idaFoRQK5gCFjNgopkh5EBCrcsd8Cow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXUhF0bGF8x+CQMmx/ji51KHS4BiS1ko3qbVmksHKNNhxdy6tA
	P0xrQM5Iocd+EHp4byPJ9RMqtX7YsnlNgXQ7EtMlkCZqR73pStrde47Z
X-Gm-Gg: ATEYQzxlOaL4WJa57fJa0yuvgidcZOMezNrdH+OdPuROtYuu3K2+1gKNb0I9hVF5EKT
	AA7f9jOohpJJGzJ4XZVMh/6CXI4yE3Qj62OQaxxgJVKcwiNCNayCgxLvZMAUFNV6nkyZkpBxcGK
	CzykvRv9iRop5y99smaoyCWXhlxqueWMGQIxNsfb+ez6lGC4odAnnhIRLEVVKTUs9a9y8tmH1r4
	Kzj7kzBbCZGemCYBqibfGnsjG7RbO4yOyb2lbyOcSTzvlgXE2pbwE3TKgc9RSsZnIKlNfqMq+ls
	dVNIMbSYb9zikTWjdzssW351b0tzZJCDonU6EfVaZlrHkELTHf0Q28r3YzaiS1mVi+xDjeZr25J
	8/ghJIlqBsasoF1+Ql5mwC0KCWmDaUxfJtKe5n8H78kVXnEwAbtV3W3Uj7p/u7ADrM48BtlvRmU
	6hXF+KBjV3OXerv90cvWtEMYWNw4Ml4ojsPWnHYPw/CbPHUdyAbznI/5GkRyJA8s3X7emq92bGz
	E6bGq6IuQm/FiuklBRPkKpy/zidlfooHPE1VWICem7aDTc3qY8Lf/KVmNsQT5RrJUmAxA==
X-Received: by 2002:a17:90b:1dcd:b0:34c:35ce:3c5f with SMTP id 98e67ed59e1d1-35bb9e45688mr490920a91.5.1773774001443;
        Tue, 17 Mar 2026 12:00:01 -0700 (PDT)
Received: from 2045D.localdomain (76.sub-72-110-123.myvzw.com. [72.110.123.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bba5a2c60sm196240a91.9.2026.03.17.11.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:00:01 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	dakr@kernel.org,
	rafael@kernel.org
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 0/4] debugfs: disallow NULL string creation and fix callers
Date: Wed, 18 Mar 2026 02:59:09 +0800
Message-ID: <20260317185920.43387-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent bug report [1] highlighted a NULL pointer dereference when
reading a debugfs string file created with a NULL pointer. The community
discussed the issue and agreed that creating string nodes with NULL is
invalid and should be forbidden at creation time [2]. Since no fix was
submitted following the discussion, I have implemented the agreed
solution.

Patch 1 modifies debugfs_create_str() to reject NULL pointers, returning
early and triggering a WARN_ON to expose offending callers.

Patch 2 is a code hygiene fix. While modifying the file, I noticed the
EXPORT_SYMBOL_GPL for debugfs_create_str() was misplaced far away from
the function body. This patch moves it to the correct location.

I carefully audited existing callers across the kernel tree. Some
drivers passing NULL have already been independently identified and
fixed [3]. The remaining two subsystems (soundwire and drm/i915) are
addressed in patches 3 and 4 by initializing their respective string
parameters to empty strings (""). The existing logic in both subsystems
correctly and safely handles empty strings.

[1] https://lore.kernel.org/lkml/17647e4c.d461.19b46144a4e.Coremail.yangshiguang1011@163.com/
[2] https://lore.kernel.org/lkml/2025122221-gag-malt-75ba@gregkh/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8cc27f5c6dd1

Gui-Dong Han (4):
  debugfs: check for NULL pointer in debugfs_create_str()
  debugfs: fix placement of EXPORT_SYMBOL_GPL for debugfs_create_str()
  soundwire: debugfs: initialize firmware_file to empty string
  drm/i915/display: initialize string params to empty strings

 drivers/gpu/drm/i915/display/intel_display_params.h | 4 ++--
 drivers/soundwire/debugfs.c                         | 5 +++--
 fs/debugfs/file.c                                   | 7 +++++--
 3 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.43.0


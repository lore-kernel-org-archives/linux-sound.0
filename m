Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E85A3D0935
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212264; cv=none; b=rZrhGxTZ1ZDLLzfwYxeM/HVOV89wRbsydoFa/beu1QFmY3hEn5zyQ4bHJMpuG+C0TfEX2vChrBPN/zQp/BmCsYSVmGLE9BdkI5qk/ib7mg5LBOVOnBF/p0g/PsBlrVs2ChbP0tvQUggbPyIhfvH/BqrFcg1kKyRbT/LwFbwBxiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212264; c=relaxed/simple;
	bh=TKYhzfs8VtgqqRD2PS/7BaDFJ8zd46QEOjrGAO7/Oog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FWQ0PAQOiWy3aKJWkYiWKutrg/CuokhMQkcgHyEPG6pIrMwXtsjSVvCjeopeib+gDSuU+TIWQNGHTt0ntk8bvP9JqHZPxLqfAwVq4z+IhUwMIcDzvPHxz/fFC/MO+r9xToGX91fcjYy3twSYJAFHbmfA9QA91pzAxMZs6IYLlFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZfvUPbq; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZfvUPbq"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8453a67659fso2998654b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 03:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782212262; x=1782817062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7r5rbaAzJXbJdKI5D18Ck1wPIXNOOhR7cgcimtV+0M=;
        b=CZfvUPbqGmh8/RBul8PfOUHtFzwNwyLhaiOaoGpxv8vJQ4GZwteHxn664N6r8tISdJ
         oyQ+t6BYPw8wPGof9VrkhyW7m5tll1Ep42590D4PflT/xyLCE0DBa0U7HPncFQw1/9ai
         WSdv87yYEAABB8MasVyseYex+45MhkHSnZ4Sdei0Bspvp4m76ncCiEBYrh1ogmVEr3ym
         fGNGhjiqvJqvB2TbCDZD86JNfFQayrgzzTaiKLXgHqr3l2bBrfjyY4NZ3w0AMtoVB2O9
         OyBVXXxmTuNOj5kJhfPb/ABjhzjKLso4eFR1RB6Epr10KCdf5qXvBfMauifsGORDe3X+
         FPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212262; x=1782817062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7r5rbaAzJXbJdKI5D18Ck1wPIXNOOhR7cgcimtV+0M=;
        b=K6gGrxM0wZB9A8S967+dYC7Ss63xv/Q4loVV/Xw3I5ragNkIEAesvhj5zaDhzzJucL
         sp7kSPcpMrGHk7SCaTROgBPY8mExxsFP7sCfrddwSLGMACEcn3hZoBj4WJI5OZ+nnRGS
         aYz6z4Mm4gFQG4vLjTKX4zntxr//FSCpyTQMALufkKevrfaw4bApj1/Y7ovgBZQsNlPW
         AYOsf/iintU05bAgzIRIcr+sf6R+FHUQbBULPPx1q4T6FfgSudZPR1XGOg1gaki8g0Wn
         DwhJ7b+jcuj6iQr6kuiyP4QmdBPjkaThTVzU5hJSPKoVofZVmI75J9QZF7VR7KodsOGN
         bzPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+V7jAHC+UoxI+ViNL//TxB0JyDltKrQQNQ8pvp4NGrEK8BvjhKYs590FW7EtJcC7wj9UWPMZbxszeXlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7/OQ1j3QdDm4hOGsphexchbSy9FYfp7RDyVdG/b1abAaA2Bwj
	NSjGid/0Txq/z23bJaUr1GJAGHBdaRzmiz3Xm7VIQgIweAgm5IIA4HUs
X-Gm-Gg: AfdE7ckp9RV6zM/QTAnRhv07qFc2w6Qrq1Gs0FcpG/yVDnzl7LcCT3x/1nlILJg1Ydr
	2Yvj8R1WPI5efYlix34RORNTOJu/0uJfldvpqR+DRgI9z7zbh9ekMepLKt0ElmvtAIWnXFzZNm1
	Co7u60dqJfuEW6JsbauIMdqociflGLf4bRgRFGb4nJR6thXoOFxktIy4Tt7Jwvhrt1rkRUzNZC2
	l8fs4xfuWcGib9Tt+VBySsvXUNA1im/K88m4NjVtaJWcQEnQWqQNOvrM+BEc8s5O7GO4vDl6hEC
	USledT1Kjmsep0Dw8/SYaAhcUDEezOvEGQxHhU4ALqsLL2D51g9uGikd+OQHamSaQR4487aGVhK
	DPOJo29wYvAmgpIFqVHYa69c1Aa6Ltfe9KKwdJNuzjoz94iJYH4yeW94TJCyEQdnFNqhyANWBW1
	aFuy/2bWjI57efdF15EEMUO/uX8TnAooXIcsVjD+OdRI438vI=
X-Received: by 2002:a05:6a00:4502:b0:842:2419:6c0b with SMTP id d2e1a72fcca58-845970652bdmr2689804b3a.10.1782212262282;
        Tue, 23 Jun 2026 03:57:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d68130sm12343868b3a.10.2026.06.23.03.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:57:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 0/5] ASoC: Intel: Convert locking to guard()/scoped_guard()
Date: Tue, 23 Jun 2026 17:57:16 +0700
Message-ID: <20260623105721.25865-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in Intel ASoC drivers
to use guard()/scoped_guard() helpers.

Most changes are straightforward conversions intended to simplify lock
handling and cleanup paths, with no intended functional changes.

The series has been compile-tested only.

Link v1:
https://lore.kernel.org/all/20260611115901.80438-1-phucduc.bui@gmail.com/

Link v2:
https://lore.kernel.org/all/20260618110649.227062-1-phucduc.bui@gmail.com/

Changes in v2:
 - Reduce the series from 20 patches to 4 patches.
 - Drop smaller conversions that did not provide clear benefits.

Changes in v3:
 - Drop the scoped_guard() conversion for the function that still used
   a goto-based cleanup path.
 - Move the __free(kfree) conversion into a separate patch.

Best regards,
Phuc


bui duc phuc (5):
  ASoC: intel: sst-mfld-platform-pcm: Use __free(kfree) for stream
    pointer
  ASoC: Intel: avs: Use guard() for locking
  ASoC: Intel: avs: Use scoped_guard() for scoped locking
  ASoC: Intel: atom: Use scoped_guard() for scoped locking
  ASoC: Intel: atom: Use guard() for locking

 sound/soc/intel/atom/sst-atom-controls.c     | 66 +++++++++-----------
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 58 ++++++++---------
 sound/soc/intel/atom/sst/sst_ipc.c           |  4 +-
 sound/soc/intel/atom/sst/sst_pvt.c           |  8 +--
 sound/soc/intel/avs/apl.c                    |  7 +--
 sound/soc/intel/avs/control.c                |  7 +--
 sound/soc/intel/avs/core.c                   |  3 +-
 sound/soc/intel/avs/debug.h                  |  9 +--
 sound/soc/intel/avs/debugfs.c                | 18 +++---
 sound/soc/intel/avs/ipc.c                    | 60 +++++++++---------
 sound/soc/intel/avs/loader.c                 | 14 ++---
 sound/soc/intel/avs/path.c                   | 29 +++------
 sound/soc/intel/avs/utils.c                  | 39 ++++--------
 13 files changed, 128 insertions(+), 194 deletions(-)

-- 
2.43.0


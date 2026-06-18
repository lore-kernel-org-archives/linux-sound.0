Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FDA35B64C
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780827; cv=none; b=SK5+nftssaw6CmTKG/2W1AgdIrVqCiyUcgCxHD585tQnsz7xu9qYlqL386HaGw6J7Pe9e7vQXT/if++n9o/Iiapw8SNKDvMtMI0CORlx2fw3XgUlPb9zaY8d48D6ly/EEERSpDBoYV6OaYTqD2OPLxP2h2ngvo524EEC9y0deqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780827; c=relaxed/simple;
	bh=GQHEzirgkef5rC4CXNXfLYBq7uN5akHXPsRJmPOdxvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QjOZNY+6EarGhbDsI90n2GeJ3+VBbxQeMUupIEpEyfOG67VLE3wZJXtDlPMZnCJ4Wikocdj55nnqE6KyQIuDrrA+80O88BpgtZIaLJFRuvMHsQskw4Po5Hl2PG1d4olyf3P+YhMkjIMn+PMtxgjw0Dnoye5NQPrdTCK6lVxdfI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddGwBKQB; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddGwBKQB"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37cb36ca63bso407538a91.0
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780826; x=1782385626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VmmDw/oybHuRsc0cVtluMFIpDH2hYvMB9amw/BJ7rr0=;
        b=ddGwBKQB3M9p17xIT/iNIXiBf6z753+qgi+SNnOYar+13waOaMg5YNlmwmPkAoUnyc
         WDka4TCE0A2NiZbNTahrpIPdjdhj8lbLfUBrfRWu38t4HhO30buOMOk0nO0UzmYyxq2S
         E7JBhSjNxP6w8pl8qA/LajAZfaI6xSb772gQwFlRlqnaKvK/5D/bGuweZuLF7mes0Yf1
         i1J6CyK3xPudajgsi4xS24Nf19ihpcG5Fvdc9uXxTZSIRjHbSTCIekvN4n5d0SYLF9AC
         +Avx1btZy3XyVLfoWjIlTMXdtUrH+suTkJfPdAzKolbH0DNCqdj88EYuCA7O8+RZkc9I
         bqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780826; x=1782385626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmmDw/oybHuRsc0cVtluMFIpDH2hYvMB9amw/BJ7rr0=;
        b=lFZHxogcd+yy/DypN+QoYaQJHt3klfW8rXsuLoL7Uh1jSpMEoQk522Ju9gLz5ZyYJC
         UJiFX1E6KRxFevnbcwdLH5WGO8FksJyavbe0vB92tOySzWov/2T/Rtel657igPNXw+7S
         H71WcNntBiI1iHxksy6oLf2vEC6TNZoy7O/0XuEroNpwZdQf2QZRaWlR3mJKXQ2RzGnF
         B1FuRkdOBTAMEYnmMZAj+cMOjNh2a4WBXw/f5Mmy01UiAmJv//wJr+bjT/+SgSapwtEl
         cgqHQQj+EzdtYwXcR0dDL+WJhQk/IHjtIMDz12kj4K/8xyuWv4bSIYNdJ5e3Q+fTqhF5
         SKzg==
X-Forwarded-Encrypted: i=1; AFNElJ/O8JY0O5xM6YvQi/6vN34ue7vsxzDOgMTsD+GQCgPzh4dcvctsm2kF0HBbQocjZIWwpoByr+rMDm1HqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiI7CLB8a3gXsIbX9YggVrkmbl9eio+4mEHDCwqwxc04loQpwi
	SLrNJ3q5L13qP8H2dgxvDc9AvvRAalVzQJuDy0Mv2+moqtKlUEUoJ5xW
X-Gm-Gg: AfdE7ckCfuF8M6poZ0nFobkZ1Sx/w5hI9yNYvZKxu3crGZ7aVjLfcZ0GNP0/YGC/NBy
	7NNpigg+2bQ8AleBe2pBFZXPfZlSQe5sgakDx4jt3s/rtQ0Rm17OdVRIuwlXzp5AEcy8kMv5eea
	4gm1wUY603aC1vANH3F6Q/2HDRJeGLAhQD5NHxbrZtzGK0sIQhJRPrFLe/24/sOQDLEBvoD5Rew
	DLSlzW9XZF3DqWv9amm5ZEn2cYys5MSeCjdyN4lgrMb6y+SFaHgARKGXXS2zP7Y+33G/QwvTbp+
	UU38io0T1ssTN/rXywgu7qwGKpCCEf5l4MjVuT2Er8sWflmhEVgipph+ZHmB1h6d48wQlWuu1/X
	mJx0mMCsFEE04gmcWheeAA6GU5gOuvYfnnUPd6O+NkOToMb2WuWNy0oUAL8aEWoWvtlrJuk+UiD
	pFm2xj0W3y6sZ4t1SqHcC2aHz9ypWYiEJvz0GV02NwWJIjO7M=
X-Received: by 2002:a17:902:ced0:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c6e52debf1mr33322495ad.37.1781780826151;
        Thu, 18 Jun 2026 04:07:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a1878426sm77828025ad.64.2026.06.18.04.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:07:05 -0700 (PDT)
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
Subject: [PATCH v2 0/4] ASoC: Intel: Convert locking to guard()/scoped_guard()
Date: Thu, 18 Jun 2026 18:06:44 +0700
Message-ID: <20260618110649.227062-1-phucduc.bui@gmail.com>
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

Changes in v2:
 - Reduce the series from 20 patches to 4 patches.
 - Drop smaller conversions that did not provide clear benefits.

Best regards,
Phuc


bui duc phuc (4):
  ASoC: Intel: avs: Use guard() for locking
  ASoC: Intel: avs: Use scoped_guard() for scoped locking
  ASoC: Intel: atom: Use scoped_guard() for scoped locking
  ASoC: Intel: atom: Use guard() for locking

 sound/soc/intel/atom/sst-atom-controls.c     | 64 +++++++----------
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 51 +++++---------
 sound/soc/intel/atom/sst/sst_ipc.c           |  4 +-
 sound/soc/intel/atom/sst/sst_pvt.c           |  8 +--
 sound/soc/intel/avs/apl.c                    |  7 +-
 sound/soc/intel/avs/control.c                |  7 +-
 sound/soc/intel/avs/core.c                   |  3 +-
 sound/soc/intel/avs/debug.h                  |  9 +--
 sound/soc/intel/avs/debugfs.c                | 18 +++--
 sound/soc/intel/avs/ipc.c                    | 73 +++++++++-----------
 sound/soc/intel/avs/loader.c                 | 14 ++--
 sound/soc/intel/avs/path.c                   | 29 +++-----
 sound/soc/intel/avs/utils.c                  | 39 ++++-------
 13 files changed, 125 insertions(+), 201 deletions(-)

-- 
2.43.0


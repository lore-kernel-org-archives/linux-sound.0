Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C809A3BED4A
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462564; cv=none; b=SLqx5J+oPz5rnqbodX2mNYR624d6WlDUpmg67vmkBpFCarWNXK+wa3VQJBFBbm4qvmTelahj4GmmSQ1TKX7XXKV5xR55KGGF1/dPd2bTJ1FjKW6bgtGiZCZyMt8zVqtWdqev0BRHoCV3J94hcU309gOOnINTYEfJtF2eut5o2BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462564; c=relaxed/simple;
	bh=f8L+TqItT/Z8tKGtAbMeXm3/lLAcmBXtJ5KoF4ClXxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F0MCrruuNaiDahH/vh7EP1wAq2YinRgAfV8hArPQINfwUGxDooXztlswA68y6swY4fpwPEUpLXmktQppyUXQtRwO4bf+1loF0dUSrDrnIpeFhH7mt/voykYvp7t/vdgQ/cTP9vyZg+HEeftZ68oUc72X9Mb4+7gh60f+BbNE3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCYwcvwD; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCYwcvwD"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-845a3c05df9so617922b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 01:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782462563; x=1783067363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rj32yaD7Sv+VU/HSB2N2NyDxsdpiGIfBPfxcey/0rdM=;
        b=SCYwcvwDkBldMuEBl1X1kC5CqRW3zHgdt1yBrs6XmC6lZytld01RvbJKNtbpVI7Uae
         2MwJHcWIDerCzdPn67jZvsmaJJtj8UhrNivkHnnBVuI1zD2ITWxsy/+ft0vL4fSr0fkV
         v2GoqRgW0z5Meop/r3HxDKZ2m8y1gymvXRwTfMcZ+t41mOpaGLITLCbVjqPbNOvznHak
         fZJEn/rrR1upswHXKcPxqfpfnMHpEJgTcyO6vdWjngOgITSsGNvqa7WMaoR4UNsEy8Eb
         4MSuDF1XUCw6XHhRoSrBVHUKoNvp4v/sC1+F5mYE/iYVjAZ3emY4HowCgCPr/hWDuY8J
         s15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462563; x=1783067363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rj32yaD7Sv+VU/HSB2N2NyDxsdpiGIfBPfxcey/0rdM=;
        b=mABP0IuPHAanJeFCtJv5x7KpXnI/j13BiTXW9qaZJLh+ndWRlAT+eWcGmXcdiDhTRI
         MNKXuNqInuIqQgNRyQspaFcU0/EBG/vq+wJFEHLt0cblRYnOUaB6F4kPMTk2gTmFPrHo
         2gQbi4LgkRNEXWr22UQukRj3rridJ0Un5Sgr2eO6xbXPa94sKhvY6llG+Kq7LSgxLdgc
         4z9zgNK/7I2N9f2w9Wf9WDuH7KXsAheeXRSeFosqEs3vr/zDG9j9L0f3W/KGp60cTmri
         SbUnNnJuRCNjfpN9RRHNaImh1L8bXLZsfF9sbkGDfADFTDBuWxeWDfYviYIyNmGZF3z+
         7+GQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKE4tf/uxNVilarc4/Vz/hxwpHyFzkNiMYAaV388Ct7fTMBvaBzIgZyDQlOnOo7q/BBmArfwlUKzrw5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAbX1Vjd8yVQgwTTLSPU73Nuptb5xo2qx1GGdqi5DIW8jNhRoP
	AUOVBaqLJnznNG0JpMkyqCQxRk+lDdWKNMjQMZBZK/qxSAVJKg+gYfgz
X-Gm-Gg: AfdE7cl8dZ132D3+kNSlQ8Ql53CCeIIc1oQ6zs4Ng/EDm0Rhymnd5+p4YRJSQyAyQim
	jvBOvXJEg8hR8pd+lPoLhsMhr4BD2BHRlXjn0E9XpiBagjNwHg6mQLXsXThER4Q2bQhoVrCnye2
	0KCe0XkPfZtgHGDiiEoVLQm6y/Psha5ouZN0metTUysZKCdE4JwPUD1Joyr/qQdPG1H8C4Pq6o4
	7LdUGgJ2k5AVnk+VrU0sNtviTCMdsKlYJSPN6hLulzR2UtPNx+wTjlZBhKYbYCRqHGIlFHIfBz9
	szI0E9q9+kc3L1GlN/FW2mHd8fDupC+zVpZmg39+4DVmiGsK1cu+Dl+hjQd29jkMBEaII010qtD
	qbJmpUwN8YOw+l1TIR6ifbDfmmOnFSQoocPwA8VG2s+dWZNBj+LvvWp5ulvWcd4DODp0qBRmPPh
	PCpq6PrX+s/8z/KzPo9IZc7pE7luFh0Ocf7Bi6fg2ZnGEJXA2TgzRtcjrKyg==
X-Received: by 2002:a05:6a00:348d:b0:845:34ea:75ac with SMTP id d2e1a72fcca58-845b38ed4edmr6498894b3a.0.1782462563135;
        Fri, 26 Jun 2026 01:29:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d234esm6708789b3a.29.2026.06.26.01.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:29:22 -0700 (PDT)
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
Subject: [PATCH v4 0/5] ASoC: Intel: Convert locking to guard()/scoped_guard()
Date: Fri, 26 Jun 2026 15:28:59 +0700
Message-ID: <20260626082904.32344-1-phucduc.bui@gmail.com>
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

Link v3: 
https://lore.kernel.org/all/CAABR9nGB9Z-caMwubqNAY1W9OwM6ZiFWqrqATJP9NtyNBbkL4Q@mail.gmail.com/

Changes in v2:
 - Reduce the series from 20 patches to 4 patches.
 - Drop smaller conversions that did not provide clear benefits.

Changes in v3:
 - Drop the scoped_guard() conversion for the function that still used
   a goto-based cleanup path.
 - Move the __free(kfree) conversion into a separate patch.

Changes in v4:
 - Add cleanup.h include where needed.
 - Remove unnecessary variables.
 - Reorder patches in the series.

Best regards,
Phuc


bui duc phuc (5):
  ASoC: Intel: avs: Use guard() for locking
  ASoC: Intel: avs: Use scoped_guard() for scoped locking
  ASoC: intel: atom: Use __free(kfree) for stream pointer
  ASoC: Intel: atom: Use guard() for locking
  ASoC: Intel: atom: Use scoped_guard() for scoped locking

 sound/soc/intel/atom/sst-atom-controls.c     | 67 +++++++++-----------
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 59 ++++++++---------
 sound/soc/intel/atom/sst/sst_ipc.c           |  5 +-
 sound/soc/intel/atom/sst/sst_pvt.c           |  9 ++-
 sound/soc/intel/avs/apl.c                    |  8 +--
 sound/soc/intel/avs/control.c                |  7 +-
 sound/soc/intel/avs/core.c                   |  4 +-
 sound/soc/intel/avs/debug.h                  | 10 +--
 sound/soc/intel/avs/debugfs.c                | 19 +++---
 sound/soc/intel/avs/ipc.c                    | 59 ++++++++---------
 sound/soc/intel/avs/loader.c                 | 15 +++--
 sound/soc/intel/avs/path.c                   | 30 +++------
 sound/soc/intel/avs/utils.c                  | 45 +++++--------
 13 files changed, 141 insertions(+), 196 deletions(-)

-- 
2.43.0


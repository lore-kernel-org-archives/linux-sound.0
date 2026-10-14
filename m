Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8940941D640
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959570; cv=none; b=hYAdwwTQAjzO7sfjnaDANH5PBhQkamP9IZtdIij8xRADQ3zj/jSACgbWyc6c1aKGoez6N2UNfEKy+EYewGlEl1dqtWXTRrgcA2/YCvfkqkg1yzj6pPu8DZLYtQmcBTzdmsIDIk2b11fWe4s915LWJR5zu9roVoLzJVM67q8QRK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959570; c=relaxed/simple;
	bh=ZbHKo6p6vHoGYZ7aFY/8EMx5pvZqBn9CREyLa80JF0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ng7P0PJbk85gaQLKTwkgc9f3pR9gIc/HcPGmuygt0AxChttPqsKCeDozIKaGYi0rkKpDRoE7OqQ2jt8kTao0c6jmt5BLmW/O23UtA5OUJBo31ER+nDexLBwc3acs9KzVui5aTutLY24lmJZUg7bWmDcUhR+pGtV0YkSXl+ilmv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJrfSQo8; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJrfSQo8"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1854595a91.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959565; x=1792564365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ysKN40C6ry6pqGOkJN7oQoGDbadfMse/W21xEe5fzHU=;
        b=MJrfSQo8SYPr9aEO8pUL4EOOf9jZFwHIordcIijqOmc13RmEoJaCimyK1zsiYS0Rb0
         PueXwgsQz2GPFw3G++56zo6kvoyEPtIus2ZndNtFlrP7B1Nx8Q7AJSM5wkBZSh/ksE0J
         4aC70Vc5PiHyjUKlNC8QgHRXAYgVPBV+oz0SRONcp4b2mQJoRIbaJY1zMGDgqvCznylB
         pXSa+I3zm827FZzt1f2yVnBQnVshIjJUm7rJI23F2STOHStuUOE1rfhXeRNkjQqCj6Uu
         ZJwC7COIhCedKTKT7Mrm0PxJpLOkT8/ywyWai/wmTqiBzhQR0qzzDL1iGRi/VoEduyAM
         4ehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959565; x=1792564365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ysKN40C6ry6pqGOkJN7oQoGDbadfMse/W21xEe5fzHU=;
        b=aY51mZ/pvlB03ejB4Jowni1FCK7dhcrAVLjrB7PyigCgi7UAEU5oKB3MQ2j3Ns0Asz
         +/7W1QLVoZ38HaXKuS98N7xjfgGZuKOvRoIYPMyWw5IWWvPH2Ml6IPP/QjQ3QsXkjKG5
         rxRrfTkTH5V3Iu585iF+Zb8MHPJNkqqc9F5aSds6IQb2l51lYN1wVgfsPnAMZG4KrFYb
         NTbpvjD1NiGOa2f4OlxGacBRPmL5hxErZDCgLM+y3jSzS0F4v8tPBy6h3vNkL7ze2osC
         qDtMnjLJyXxXGPmLOGvTM6ekNt0159OVQtHH3yTw5RxKe/qLwYZWPq/V7KwTnTxPujHv
         jR5Q==
X-Forwarded-Encrypted: i=1; AKwUvByTii8B+1f3h8d2DqZgnBzg07fF/gq22lEtObdlMRMpGFdXWSqdKkPpve14EW5wxx2mIiAwy/Rs+7ESKQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIRfcNMdnTkhfR+uIneq6aXUfoqWUFWud83+4KMrlDD9JM0VN8f
	Ho5CIT+KP6LsJihdsA/yczLExLaY64qxz4X0PemN2gCzHwnGGaMizc4s
X-Gm-Gg: AYBFou1XWXRT/CLpuDQDPEAttgNGlWu8HYg9jvD/myOTv20YFJLNd7PYvQKijEtZ8Ge
	T7NYXkXOds43ihSVegSZA02xct/erkF//yKpkhsXbbW9rO5to4J3kjqa4IoUVraq/Asm/doOFT0
	mjVPC+Zz9nG2UtxfaRotNopfabCuTngsM0S43Gij7csC15w1zayLbqMxZwk75Bmv4QPmzT+sF1D
	gqu+phIU/I2bTodExTmFN4ZdXXTkG+/9EXXoKk51OLArj4Ww43i3yNPlgPd+SVj2gd9wZG2c3em
	pxsTfxoIifJ7/VLu/UaCaonEzTfoZfBc/ncL4BPgKHTBaLEQRpqpNb3ROzf2MRulrKTshc3vkKu
	xnwhLOFP49YfsQkQAbLoDra0GfYttMETbVSQOADqrrwNi3swMiMer3lmFAxa7xDG3iDBsPM9q54
	/hdftZsoYl4HUNB5JMh4QrI5dUyK5KxJyYC4xHkG1l6Vm8ITNxGpPPWHaz+V0nqgdQ7QHirn0s6
	hXUaxcPYA5BYw96gOHBtJheYJrGkLx4tuq9Do5JHX3amgQK7pguGMLz3R5R/eyMxXJ+Ni18vVGs
	Yj/G+upQPg==
X-Received: by 2002:a17:90b:1dc1:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3ab3ac9f622mr10629302a91.27.1791959564784;
        Tue, 13 Oct 2026 23:32:44 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:32:44 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/13] ASoC: codecs: Fix Wolfson control definitions that write another control's bits
Date: Wed, 14 Oct 2026 15:32:27 +0900
Message-ID: <cover.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are more fixes found by the overlap scan from the first series
[1]. In each driver a control writes bits that belong to another
control, or writes the left channel bits for a right channel control.

[1] https://lore.kernel.org/all/20261008130953.2446692-1-sammiee5311@gmail.com/


HyeongJun An (13):
  ASoC: codecs: wm8990: Fix definition of right input PGA controls
  ASoC: codecs: wm8990: Fix definition of LOMIX AINLMUX Bypass Volume
    control
  ASoC: codecs: wm8991: Fix definition of right input PGA controls
  ASoC: codecs: wm8991: Fix definition of LOMIX AINLMUX Bypass Volume
    control
  ASoC: codecs: wm8983: Fix definition of ADC 128x Oversampling control
  ASoC: codecs: wm8985: Fix definition of ADC 128x Oversampling control
  ASoC: codecs: wm8994: Fix definition of WM8958 noise gate hold time
    controls
  ASoC: codecs: wm8955: Fix definition of Treble Cutoff control
  ASoC: codecs: wm_hubs: Fix definition of MIXINR to MIXOUTR volume
    control
  ASoC: codecs: wm8737: Fix definition of zero cross switches
  ASoC: codecs: wm5100: Fix definition of EQ3 Band 1 Volume control
  ASoC: codecs: wm8750: Fix definition of ALC Capture NG Type control
  ASoC: codecs: wm8510: Fix definition of ADC Inversion Switch control

 sound/soc/codecs/wm5100.c  |  2 +-
 sound/soc/codecs/wm8510.c  |  2 +-
 sound/soc/codecs/wm8737.c  |  8 ++++----
 sound/soc/codecs/wm8750.c  |  2 +-
 sound/soc/codecs/wm8955.c  |  2 +-
 sound/soc/codecs/wm8983.c  |  2 +-
 sound/soc/codecs/wm8985.c  |  2 +-
 sound/soc/codecs/wm8990.c  | 10 +++++-----
 sound/soc/codecs/wm8991.c  | 10 +++++-----
 sound/soc/codecs/wm8994.c  |  6 +++---
 sound/soc/codecs/wm_hubs.c |  2 +-
 11 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.43.0


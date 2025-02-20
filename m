Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00211FECD8
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 16:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068964; cv=none; b=SadlPjyJRrdhan/iXhU4D1eJeYTyDf81F1YwKgCoRnm/aVuDKp37QFkCb488j2wApqHsTE5LS7tvIIno301OjSZoSaFuo7F8qTQ4ApucLW2huklPiAuemkJDtFoDtdfBgtiyiDBIowRhOFbk0y7Pg7Tk2+Trvuy2he6h/vHmSKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068964; c=relaxed/simple;
	bh=zT+KI4WcFHKjsYVAFKapOCUJXXn7d1Fjj9NRnfss8wQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K+i/O74lcdlI6kKiJvd1aQSyh0SXiyjBMUJbnYIKNAkLLBPI75gO8APjQuHNwZESjiV82Oxj0KGM0yEvZXT7Gnx3oTirnkYSvQvNtE2QcGChqyvyLXAPo5i9Hw6PF/Oa1UsTHlUKlQBEpvR8dmz9MUgbmfxrnRYzUsDE7AlI6t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zYgSBQeO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zYgSBQeO"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f1e8efef5so690071f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 08:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740068961; x=1740673761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZKdzzhd6qiS30Fu8KqeF6do85NZpqdplWUIHWAq4YQ=;
        b=zYgSBQeOD6kC4CdHqhSobbv1M5PMIUhV+M9EKLzOmuXAoBegv4nu5B0VvVxrATsY+W
         mT8gU8d85ZdthO+gjJwk4SmmVMBJAENznnbNQzvolCNtdvn3UkEKrbJQr5Q4Ao4yuFGC
         neJUAJBbBTAegOlHDU5wI9HGKEyILUMg024Pr+mxj7M8QFhjIiKpsnERKhg5oEp4b+m1
         fQxONc9Cjzbl3O6PYelav18u31lqFmYTg5qV/7G/ectE3B5SPUr9K8vap5WM2l7ldLnR
         R9MQQiUeX+RmY4vfUdKlBlWdh0fhRnzuqYu7Ao5SyNOBGERgI/MmljBza6DokiTy4G8V
         SV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068961; x=1740673761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZKdzzhd6qiS30Fu8KqeF6do85NZpqdplWUIHWAq4YQ=;
        b=A/kHZpsJlRrpBd3d1XoLLqmZsdVEGIDH7pH9BoXVTYIqVhFEKmucN8om7MaVX1AAJP
         X7++/nFHutJucBhrUH62ujmU/WpGrBmKepHKHdn0zMgx+NHlHmO+9WpKGyq/2+lr+WH2
         7hl4VJm0I509yc/W0Xzu5SY2E73L3upyRblahQCRjCjBihoyscyLMEz3AcbHTfHzlUYZ
         ckZwoTm1w6yp54d4LYnDkLRo/Rhc5mp8ejVmMLcRxt+zxfUKk5siG8ucjLOWiIP7chdx
         xMI00TF1c0vjRi0v9Te9rXmDWYgJEKGUXmJM4UzDwa97xYxbMcj72RBhK6iSBIV8WcAA
         TrHg==
X-Forwarded-Encrypted: i=1; AJvYcCXrg0Fh8oi3vetUUSquxTs2A23ZUnfqZnnvhYW0k+d9kNCnol5seqFwyE1ZbDMif4IrIUJFi8s+QZENpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpViebuoR0O36Cb6U+XSz8gEAEg0HY3+QXRhKjfBqEczvVU5AJ
	07fivZCIWCijiqIsmmxTpWEhDY2xEsckLeCK1aVCKTyyS53EwnZdXzm7Wb2RxMA=
X-Gm-Gg: ASbGncuzYRG4RDB4tFIlYxWwfU5CoPAJELIPf26E1YKGEZmbbhUQ0CwDADZc5M68LwL
	MrRWn05Yz/GCkpzeuRr5Ejyploa3QDtTuly7zC5k/X9GrO/Q1SzUQNiuv+N3/ri2usr/mLZ48yd
	g4gr6rf02Dwqi82kU2YXkkg1qrsC4mAy4Cz2YkuKPCsKcFJpyW5+poyJDl/TlEf5WB4BEbHp914
	K6pxzH+WZDKnV0a20vzY2doOK5tTQ1vsmbCcDuCpmz26ODR2i+JyUL3VPS4buDYaVjBCIFN+t+2
	iAZwukdKXoz1rPctTbeKsuR/UwIPJ78MOuej6HIx
X-Google-Smtp-Source: AGHT+IH2gjQh7JBQ8ejAnR21ptNUN/KQFBPj5kyJgCsQVyb/b2MhEDxyhW0FhxZk7ZUcbhlqfOowSQ==
X-Received: by 2002:a5d:6402:0:b0:38f:2f0e:980c with SMTP id ffacd0b85a97d-38f33f57c13mr14497953f8f.47.1740068961049;
        Thu, 20 Feb 2025 08:29:21 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fabsm20813753f8f.45.2025.02.20.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:29:20 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/5] ASoC: q6apm: fix under runs and fragment sizes
Date: Thu, 20 Feb 2025 16:28:42 +0000
Message-Id: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Qualcomm Audioreach setup, some of the audio artifacts are seen in
both recording and playback. These patches fix issues by
1. Adjusting the fragment size that dsp can service.
2. schedule available playback buffers in time for dsp to not hit under runs 
3. remove some of the manual calculations done to get hardware pointer.

With these patches, am able to see Audio quality improvements.

Any testing would be appreciated.

thanks,
Srini

Changes since v1:
	- added new patches to fix the fragment size, pointer
	  calculations
	- updated to schedule only available buffers.

Srinivas Kandagatla (4):
  ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
  ASoC: q6apm: add q6apm_get_hw_pointer helper
  ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
  ASoC: qdsp6: q6apm-dai: set correct period size
  ASoC: q6apm-dai: remove redundant hw_constraints setup

 sound/soc/qcom/qdsp6/q6apm-dai.c | 94 +++++++++++++-------------------
 sound/soc/qcom/qdsp6/q6apm.c     | 18 +++++-
 sound/soc/qcom/qdsp6/q6apm.h     |  3 +
 3 files changed, 57 insertions(+), 58 deletions(-)

-- 
2.39.5


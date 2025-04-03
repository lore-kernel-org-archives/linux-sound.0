Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9000F24C09A
	for <linux-sound@vger.kernel.org>; Thu,  3 Apr 2025 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684181; cv=none; b=OOrTN9Q8I5U/06jdwgGutsZaSOH1YYXJLkvddixisOmQIeRnI8wV3HhYN6FGEr0zqQH/JqTPALEZbgQKsiC0Kg6YbnxY3sQkqKWoEWOc5XI7OPEy77DBJu5x8nQukANQxuHDwb553GwmdiAUZh1RQ9gE8wbM7g2xP+SYUoaN8sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684181; c=relaxed/simple;
	bh=urym1JFZ7iAPHT1OJuqUVs8u2iGfG/8qiqb58+toJQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kdmdaddy3nAMYl5tzJIUMFqDld2nlfmQ8bBn1d6Vmb26LuorWD4m2W8h6eZjZZg341HyyEV3wtV1Tw1ySmZbOJ9l3ejRPyvlkx9yz5i7brcZxgl2CdvnhQqu9XxONKnsNnjvQrRQ/m4sxsKT2K71QAuOtEylkjDgvbYafr+2Quw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZoPO2Ax9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZoPO2Ax9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso9019545e9.3
        for <linux-sound@vger.kernel.org>; Thu, 03 Apr 2025 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743684178; x=1744288978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YzB7kb5NWj/5ZVCGMWPj1RqYUOc5X04PDDVhW6vi2Rc=;
        b=ZoPO2Ax9a14/0l9+jQdlccZBa3n9SctcVSU6jQLWn6/GLeYASkHVLcLSQwnfkIKxMn
         KV7PWh7T/HEB866pT1lMjEcYbG6t10ts3RisRqeFK7rhocpu4QXHEXC1VmnZYUu9CJlc
         7eVpu9XnmoFAS01YHAdHe3dtVorRDq1TIeFDQr+hB08RktS61fWjghzTKCIC3KL7Fvoz
         /DnvV8ggWlXE4MXJ6Kb0616jJ6jXcyqlcA0vDUq0Vgs4OYMLcOPujOcN9mMRCtMeugAr
         obR/GLp6FEnyxL/EkmP2qxCKctwsjx2DrRDEwu0HT6hIj3gxQ/p5RYdQ4pGllukke/VG
         azHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743684178; x=1744288978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzB7kb5NWj/5ZVCGMWPj1RqYUOc5X04PDDVhW6vi2Rc=;
        b=jZZ5ABX8++Orx9X8C4NNHMmm9ERh7SrgINGzz+EbYPApa8DYcJ3SN5CD8z5bw5zfly
         RpAwloTe6ZyZ9PZOtNTHSFVwYvolOIYFhG9WfKNkpFiK5qes45LOQ7MKIvbYYjUGFwbl
         oFTl9x4D6RKS3fI+MlIoPbiNis/6LYdIzLGz5UR1hcnEw9FipmdKNpi8vrcj9M5lwDPd
         plO4E4m/T9dBGW/zrCeT6NRtksFPRA/BPTU+YN41tFYKczeaRkVJX6Lzm4CuAUYO3As+
         5D0wsABgzD95OXSE6KwPr5M3KVshU/oqDxxlXtn06Or+E6U3iCbpBV5zrfHFtGjbEwdz
         MJEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHbKvqoKXFlhMjgVdGZIkVLA8sv3NRxAexPJpKHNtucPkuITYhjCNjsGgdogNSrMApDuyhT4aullX4Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyc5CKPbmOsIY/1S6jBY94J010f1iw4H8GrptsPFEEe7rOToat
	ArQRkzW69c/nWGzNVTIja4oZyHC1Eepv8+2n+K5i9WD7yDs9FC614aNoY1VXHPk=
X-Gm-Gg: ASbGnctOgoqVCAHcEYf3jD6V481mrtR8ZqbLi0WIG4cpDbs9Qr07Ww1Rbm6Fglsj/80
	8/Fnz8eCDfPORTt2CNbSYYxzHNBb4ZgzPgXWiv1ngMatEMVLV34QgAEKaHv60g0cQmmL44vw70n
	aN5S33qV5g6kt+VzPM5q6KmGfMFp/0p2WGbbQGczp7QH2bUgk7TakL0ZfBiQwho8xKPG8XzsAmF
	hFXYkQ/rthveM43zKME9b8fW6jo8NbtmtvyB4NRQsCJ9P5cArXgS9q5fu3CJg1AvwfTN7n1XrAg
	OOUHy8DWh7+zAPdespxSgMptRpC+Om8v2slfBxtQiBoQhrxHxnOuTOOr5WLhl9/aUsE22g==
X-Google-Smtp-Source: AGHT+IEOhbCyRIy/amHn54GYprGgtCI+ApabyTh3ms9DkRPaodKNkM4sNUXh4kEaUnWGJsU5K4+dKw==
X-Received: by 2002:a05:600c:b8f:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43eb5c2102bmr68490445e9.14.1743684177811;
        Thu, 03 Apr 2025 05:42:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a7615sm17312505e9.9.2025.04.03.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:42:57 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/2] ASoC: codecs: lpass-wsa: fix VI capture setup.
Date: Thu,  3 Apr 2025 13:42:45 +0100
Message-Id: <20250403124247.7313-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This two patches fixes below two issues with the VI setup.

1. Only one channel gets enabled on VI feedback patch instead of two
channels
2. recording rate is hardcoded to 8K instead dyamically setting it up.

Both of these issues are fixed in these patches.

Changes since v2:
	- updated commit logs to reflect the issue.

iChanges since v1:
	- add missing break statement.

Srinivas Kandagatla (2):
  ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
  ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels

 sound/soc/codecs/lpass-wsa-macro.c | 103 ++++++++++++++++++++++-------
 1 file changed, 80 insertions(+), 23 deletions(-)

-- 
2.39.5


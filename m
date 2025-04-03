Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4825E250BED
	for <linux-sound@vger.kernel.org>; Thu,  3 Apr 2025 16:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696154; cv=none; b=IQ4fKsvQND7qqqqBzSm/W5CfrE4nwHb7hdhEHBXsXf4dpFBi4nxvmBjuZQkjowYu6hic6B5Idg+xLIWp12OKwefQNPtIcIkmdxlPuGbxEaZUXCxcBP2AKrwD4beYwESSnASFMdJFGdV34/jJhhczSwOsowDRiIrzTOFU0sZkjbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696154; c=relaxed/simple;
	bh=uyI8ktFjPz1/JmqLofQ8MKJWY0TulmaY0Zo/Dqh1Aq4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RbcbSUiH2KCiLpfJqu4ZN5rdgfu3jqUoNZ1wibezrYzHbqv1g3HisfuZltMAg5Jz0pIBAAyDVDlwZ+fz1nk839Gval87QU/WLXpsTYpT7DCCxNLDyDB+utxxg90LRbnoM7FsTCC5KHME+FGLwZvPa6Hs8OzRtwttqdquWpkTqX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XGu6wB0J; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XGu6wB0J"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so7019215e9.1
        for <linux-sound@vger.kernel.org>; Thu, 03 Apr 2025 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743696149; x=1744300949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wfqt6oJDOs0L+WJBkP8gI6GSekXwD/yId3tPbvhFbuo=;
        b=XGu6wB0JwSGTpmUX9eogAhbxK3bzflU3QkRtnPUTuEQfE2k3X/7wv1LMwWao2oWhBT
         +2Wx5VZkzCPXq8/skXiPR5qVw9MfYwOpMx7umBy1E3F1jPGIzwieccq5njcYJYRCl5Cc
         EN+Ba4Yh5MhoupBWG+VyXsPsN1rXxTMk7VChFFefd37a6GGK+7nHxY3kQmxbEP2iY7fx
         mk4QtOhpk7TuIAaHMeyVXqGE5h4COdiMhNthNwjWMNiPtveJgt1Jnvjbv0mk4fZbcOWD
         Z6NgFmcYQzxnXsF+ud65xuuGfmCQKi+v3M1ZroO0hPaqbLARgJ1t+P+llsjgOTnHS1il
         G17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696149; x=1744300949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfqt6oJDOs0L+WJBkP8gI6GSekXwD/yId3tPbvhFbuo=;
        b=GuGPgAU3BD8G1jEB2Pc+OWaXMhZM/A9BY9ktKTu7MXqu1JnG7HtxcAncHlebjbFFuO
         Zfeka4cgT0rOWMELufaLeurxK1GVaHaLz/9smMTZOod/QHKX6kdvXVeRulFqaQ1GImDp
         UYH6RtooJjVV47STiiWdrbfDSTOr6G1GYg3TidIw9zq1Az+ol0ezoZfqWEuFRO2a1THm
         D+Z/kxeNlHzLKNbdLM2vSHF7hqQedDAzCiywAADAzX0EW1O1gz3zOT8sYgA+hvfijkPs
         Wcw195DcNUQ1/E5cmUhErvtEef4dRnq5Co6S1KsrmNecS+XlQVOWdoQiP0ZA2YeCtVG6
         6AvA==
X-Forwarded-Encrypted: i=1; AJvYcCUWawbCblu+Cspiusk8kR+QqaQ/HOyDz3HuYEnIioniazW/l/Bi8fw1q1jNDADoJAxoZk0TRBlYrugtWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoGL9ZWz9l1kgDeLG4EdwaXsZZJsbC37bQOzq9LJs52ujLu/dt
	gobq4iS52D8f/7TMh1bp3VZ0qiw2kelZUJ81frhimcF6tsq9Rk0eK33hKiRnoZk=
X-Gm-Gg: ASbGncsEgSs/pk9pBuehS3kUdw3Mk+e2jqsnG+iJ+7otfUCvP4dcCENZzcvVkczHtr3
	L9EpZxaw9VVLgQwElQrpAmN2gQo7FNoL+5RXu3jd99kj6DvOJ63TSM8CsyCSZ9Y8fwTJ9M16Oxx
	3lyhmp82nrchrGjmEhelTmhWRbpzgn99oJlPPAEgDxZN7+6ZL9MNdq1dwREHdOp3SwN1jbgT2bT
	UhyoDv9EayAIsBExMv2BEaX3Xl3hOOcKrjUMF4ipFp3+h7s8lcjZZ/ifDH3olLmqTxRjqUzP7Aa
	xPgKPOtWGsTrNeokV/u5v1k71CmvbqEkJW5Zxt8yoYzBKDflDzbTYw8qzHJ4noRTYBsGJA==
X-Google-Smtp-Source: AGHT+IHuJ8392mvT5dwt8RhgEzBV5mNQw5Q0xJDXpgV/2MvZapYbCbI1AOfByBKlVYlw3/Bt0soryw==
X-Received: by 2002:a05:600c:4e10:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-43ebf6645demr44201835e9.14.1743696149385;
        Thu, 03 Apr 2025 09:02:29 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbc64sm21811285e9.21.2025.04.03.09.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:02:27 -0700 (PDT)
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
Subject: [PATCH v4 0/2] ASoC: codecs: lpass-wsa: fix VI capture setup.
Date: Thu,  3 Apr 2025 17:02:07 +0100
Message-Id: <20250403160209.21613-1-srinivas.kandagatla@linaro.org>
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

Changes since v3:
	- rearranged the code, and removed some empty lines.
Changes since v2:
	- updated commit logs to reflect the issue.

Changes since v1:
	- add missing break statement.

Srinivas Kandagatla (2):
  ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
  ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels

 sound/soc/codecs/lpass-wsa-macro.c | 117 +++++++++++++++++++++--------
 1 file changed, 84 insertions(+), 33 deletions(-)

-- 
2.39.5


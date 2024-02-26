Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237755B03A
	for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708948773; cv=none; b=KcbU7fAMx52cqvQY8Bc2nVsvtN8Q/QGbW8gRBAzzsOr4AJnjvvRn1vDps+6Mx9Qf146p+Hqcs0ybdUUMSKKJOr7G+6U0tpNTZppOgkHYj5WTCMg3BeJ0AjgO40p2NMj50CbYv2lvyMgbnvbWqJOho0AuS/vXWxrcxba72eIU3p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708948773; c=relaxed/simple;
	bh=1boF7Vn0lILkXSfRRTQEenr6/RP11nxQXsy3laGqUPs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kqpy33vdHOAYSMLLHPRaVO2lJxGOcxaWAZPKVv8jQMxOFgkEd1oTu6T33YB3mAdtjtcXNdZMp6BTj4Kx5JMN0W44gv4i8hN7mMJ9sO86ahMowGk5IMjr0hOGeWiaex+Cbi9uNxCJR41H57F3PpeIUM5ZlpJ7pv/TYaNYkGVIqpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YqqM70wL; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqqM70wL"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3e4765c86eso353344466b.0
        for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 03:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708948769; x=1709553569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6KSPDZCe1P34jJFcbH5CL7iIOfc7j2jHBH+bIt8aphM=;
        b=YqqM70wLqQMCPpbucp3zfmLlTUQsVB2zqYdApx9a3IgPd7/na9P1I6hpfb6fi0Ywc9
         MY+MKCTcrj9eFUjU2Ikr0aI8sPPRtFGj5j6IIPzTZf/GpQlIVI3ouWWyY8LHJdMOB08y
         hDGHdARwYHqNZVSZjt63x55D0jeSw6s6djdc/Ynkzy0ZRKle0vNtzQdc6KXaurHpHU0j
         pHPVoA7d8XiJzfmN6+KopJIZaKbOgU5kUKIYSJ2r37XmqejIt9hVNEp9KsxF+mhxjEPc
         G6/oTjayYNLDjsPz6bEbQrLkxq68Mx6puEwCvLNtH0nmHJXCV7Xs3ztYf39gNtjh/zrB
         3V/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708948769; x=1709553569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KSPDZCe1P34jJFcbH5CL7iIOfc7j2jHBH+bIt8aphM=;
        b=eOwdwlrMV7OtivWuaJdhrnQF3DohEoUPsiW7gEDRAMFzOwfHMd/ozCDks3KinYTfHc
         +RG773X0P3WSyeQM2hzk/0YC53edCMlo4pZcdK0tGVS9NN9eYUSifFS/NWlhRunhMuHJ
         GhZuVwsetmWz+BZRhwWl2+zoKkhZS6Fu5MUJ7BmhhzabKmreI5+KkDqlg8WIy/BdEyhe
         VYVoED3GRrRPc8O+SEC6sC/tSeuzkmy+m6umvOc2QkgMagFsmHYY1EHZGFzvSuM1oze0
         RAsrXHdYwAkotynHIgvClCTHy3BL26qW2rzhPsdyLl1WIunA5paZLHvMgl09X29GgHNA
         z4aw==
X-Forwarded-Encrypted: i=1; AJvYcCV+/e1rYDCY6ihAJZObHlU0PpA2jK0HRVKBA9N1JibnVEvDcXzrGcBvp4hLlaJt+4Ezlfd23YDF5Yr26ztvTa2DrdvBGbuCJ0ljN50=
X-Gm-Message-State: AOJu0YwqyCpKZ6q2/L5FXXOtYrym5Jf7vyyy15ptVqVv/fswjvLO5nOJ
	h3MDc5rHzkRBwKz5R9nX5Kc1hZ+BEKWz7grc+Sk7T9WicPcYZwn+bUtghKH8Ll0=
X-Google-Smtp-Source: AGHT+IFelND3oLFeUPIHV8ueOBEgfQjbSnO9XqLBf3TC4C9FNh0p6bg9Pg6LmuPeWh2Pp5yHNlg1lg==
X-Received: by 2002:a17:906:b189:b0:a3f:268:a8f8 with SMTP id w9-20020a170906b18900b00a3f0268a8f8mr4417682ejy.71.1708948769463;
        Mon, 26 Feb 2024 03:59:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id tb16-20020a1709078b9000b00a42ea030a6esm2311877ejc.82.2024.02.26.03.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:59:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 0/2] ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets on SM8350+
Date: Mon, 26 Feb 2024 12:59:23 +0100
Message-Id: <20240226115925.53953-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changelog in individual patches.

v2:
https://lore.kernel.org/alsa-devel/20240125153110.410295-1-krzysztof.kozlowski@linaro.org/

v1:
https://lore.kernel.org/all/20230717140138.201745-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  ASoC: codecs: tx-macro: split widgets per different LPASS versions
  ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets on SM8350+

 sound/soc/codecs/lpass-macro-common.h |   7 +
 sound/soc/codecs/lpass-tx-macro.c     | 679 +++++++++++++++++++-------
 2 files changed, 514 insertions(+), 172 deletions(-)

-- 
2.34.1


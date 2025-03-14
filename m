Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFBF204F91
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974523; cv=none; b=qDaJzw+m4wDvhW7U2cwWbN82MTo15DJX4+0Ow9pSPjmkgFZ1VY4Oyp8aHonZwGS1K/rWmy5/7WGCl9unJcFMuqMG5sY+QZ5B7+wirRVsCLlHTYLLKgmV1qYkARo27PNKpvpOBoZv37TLV+dpjJtul8vRVzvDRMB0GftqLBcjT1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974523; c=relaxed/simple;
	bh=WZz3v+vsHhPD1tXnM2Sgca+yquBEKJ/qJRDwgWjeJjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q07bgabaEbklpn7oMm49g74mWl/PKUA/Oiv/wyauk8ygUeJgV0PGYda7RxL5b1pjJwWM4US9scdB0mEW6Q6XhK1oXcVhqhUOPeSrGIvX+6o4/9NDQeXV07LXdFV+OBkQ5+etj71UDN2pKXVWxk/CwGx4HMG+eKUg0jcX2mTIN8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r86B2yOL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r86B2yOL"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913d129c1aso1913664f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 10:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741974520; x=1742579320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/0LkOzwwvJNcYMQhvQr0pJ6M6A5VssVoqwJh0FipfI=;
        b=r86B2yOLrp5ovBL+sphVOm7K+tIjuBHFQSZ4+WqizlY5llipVKCrSY84Wk8kFSlOwa
         jxc4o7LZHP5h1wT9oIiUfYqMwCZetBrYCywa0qOngkxNwfbFD8SEwMePLXaT9oUUldAE
         2vaHBFec4+lgB+ri/yRit/iclJ7YC3JNFIcdNQTWFfeyBvJGu2+uDOJO++VKsUgsYuLU
         gFSxpIBnvExg5ozA1LOC3LiDKy0rwzXM56xLvGvRKYWsdzKDC/ty8XxivYvWWs+ZH4ae
         7W4gYAk/tNYVWRcsTh6DDqni1hhWfg9cZuLHrrKyfcCdlZcaIpG71ftPZUhxUkgj+/BO
         FgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974520; x=1742579320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/0LkOzwwvJNcYMQhvQr0pJ6M6A5VssVoqwJh0FipfI=;
        b=p85ug18MsY7Ytf/S3v3ar4nRCCHUcjJATvsE0IBAqRm/q4w6EOEdk//m1bhP9dgME+
         jkkLtHgk15EI/auPCtKABZX5NYf03p0PjsFPtaHEakMeMkzTJdxnoh6lgRKLEBglMr8J
         GH0ukHwVWhNMSJ9ceLScdy9FaLfhhgk5u+Haz8fgvNIyNqtKCIjPOax6I0nvHbVJTgZm
         lVpulNyNh02IalJJ7UkIz7bTS25O6RbKtCbjdjDmgUcwZ/kRyQDwEax+snI08lvN2+a2
         VdqfKyKrchIi6XOtiunzU4md29JwweHZuktaHLBYOcoZMY1u8evjlDStD9e7tAIJdVXT
         pw4w==
X-Forwarded-Encrypted: i=1; AJvYcCXU/w60uEPtSzts8Up2igzQnYJMvLvyvuf86HXWyZnoah7ibE+oBDsD4G66ixg0JPcmYtTu1rXvX7RSag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvQ6koHS+VoPk8Q4s3AzIMI56jyrcIu74sFfXdSb1n1WvURPji
	nwOZJFtTO8SCRnzv12vIHMkdkxcYiD/1f5pHGwIqzKR+KN4Ahk2tFxxOqApHups=
X-Gm-Gg: ASbGncvr38XWuhn7JDNCN2ByvAF7KuRdvR74wpNDL/ufN1FRgU+SsS57oxUbMfTwXWh
	nyk4i3ww3/dkGTAnt08bmMKsihtwC7s4ZB98FkFiUNqd6+CRysKOV9B7m95nQNjEu2TSSwmzisi
	rqinpffb9dU7A6g4QNxmH4teSPnpNoBy2f48oBDHJOrlK3SkcBjwzVKMLPBR7fGFs15hYYwZvfY
	NJYWa2D/GwB2JjLBzD56AS4pQdloJfgusgT6NJXjB7phvbmOsTdMwGhAlrbzA61RKICM+ZH1MfS
	puV1UNa3TUkZ4vo4QgF0I9J/EvPh0ba3gPRVvcJV67li/FMssXaAz1KIx4YdtPU7LfWmfMTT/vi
	5CRj7
X-Google-Smtp-Source: AGHT+IFSURXCATif01r54d+KQHoWw2qah8uuJQ120su2MkweaWrQyfg3Zuqy7P/UA//iCx8NnbbY1Q==
X-Received: by 2002:a05:6000:1a8c:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-3971dbe80bemr5173220f8f.25.1741974519796;
        Fri, 14 Mar 2025 10:48:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975afesm6117243f8f.47.2025.03.14.10.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:48:38 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v5 5/5] ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
Date: Fri, 14 Mar 2025 17:48:00 +0000
Message-Id: <20250314174800.10142-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Period sizes less than 6k for capture path triggers overruns in the
dsp capture pipeline.

Change the period size and number of periods to value which DSP is happy with.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 180ff24041bf..2cd522108221 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -24,8 +24,8 @@
 #define PLAYBACK_MIN_PERIOD_SIZE	128
 #define CAPTURE_MIN_NUM_PERIODS		2
 #define CAPTURE_MAX_NUM_PERIODS		8
-#define CAPTURE_MAX_PERIOD_SIZE		4096
-#define CAPTURE_MIN_PERIOD_SIZE		320
+#define CAPTURE_MAX_PERIOD_SIZE		65536
+#define CAPTURE_MIN_PERIOD_SIZE		6144
 #define BUFFER_BYTES_MAX (PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE)
 #define BUFFER_BYTES_MIN (PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE)
 #define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
-- 
2.39.5


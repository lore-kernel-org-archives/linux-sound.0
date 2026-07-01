Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC5C390237
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 04:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782879234; cv=none; b=RvgSnKP44mYFCxZOzGpOaTxgnLIH0JrN1oZN7EM4x5LIEQ6hiODpXzm/+/5esOYPkSvcXxqpow77NRAUkprNWQGT5ozag+U6bHa5W+cZdkfK6WZn5Uqo0uejda2SwRmPWXMgeCd+zGAKTTQz9D83f1QTrAyWu4/4/fpWHAKo/BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782879234; c=relaxed/simple;
	bh=QV6BN6yvpQFvt/+yWvIYu9Zcz8/chzu6n/KTStfQdIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMV/QMjveBBcYkVcT0Shd0Vk2gs3B7ac8AqU7ea13h/qxWseuqUq+S1MOoeLQe10JBTg3C7OHwa8iTWpvwvgcLtMzfvVrNKxRr0uQ/BmItmO/zjQbobPYTNeOl2L8D+lFnro/AUnv3Ywl1+KAf3o3qqt8tyT8Eojofue9ybkKZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiQ3izmd; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiQ3izmd"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37fad5eca09so959746a91.1
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 21:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782879227; x=1783484027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ISxeHPMRNWAn38gbq9ABZr9k+q/G/Q7tNZCIdC3izg=;
        b=XiQ3izmdXKQdPTD6J3UF/95adBqw/OCWnSiYbHXA+38w5t1PCOHSf1aLYSC+5D9aEL
         QUo2ABcRQkwKlvGAULjfvNz1Ey9BFlHrKzQitZH5ASNYODhrcyaZsuesWzNFtOfq1y6S
         rsQ0u2Sx52lr9oQ+azZcuLE/4sO4dZBx7owYN33zRY39Q9s8MZWzNdRXC8gxMGnrKnps
         5oYPyLVzN0cwslCpZGW6wxLUVh34KiO2cZ5pRHZL9EFd2yJaCN7XI2AcMdPQWSYqO/Uv
         9SFgLztICNihqEetAEY6chdN3ilUs3RhOEo+x6MT9NGOcS4WfgVMi95gib5zBmaVjqbK
         tJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782879227; x=1783484027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ISxeHPMRNWAn38gbq9ABZr9k+q/G/Q7tNZCIdC3izg=;
        b=iuS6npqPk04aumn1AyKT5o4eBPXuOrbNa7kdLdUQCYsR7mxCtivRQmPQ6G/NzxKdti
         M+YagbMi8Cbn2I4A9N6L2y9HVIfdu3+E4ML0LytoVt7p15EoWrZrIOcEtYLJOtEyd+aa
         x1M8iy3zGiyQrIqPFBnff/n7jRZ3LGxqJVvfi/wtlPSCuzTA71y1KcVyX9CU8JkdwH9f
         H2fT3HemF8KSYCOp+bGABEA+pyUJ9WAsyZSg/6cOpDmOUI63TFq7w3B7kA8XXfQCObPb
         4SwZheN09y8wfaODm3s9/ksGBRNbOypf7YDZG2YSRMwgbwTtLD33LdE+Od11ztUxy8dC
         TKNA==
X-Forwarded-Encrypted: i=1; AHgh+RpZ2uooFYfT/Q3yutCMAVmed9Z/fFRzNCbedpEMsrUWwkwbOsMMAxpSTMYs57RTsKiLoJGxEYq1PoDBgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Ir42FGrOQoCP8vf3FHRfEhRjAvoj3aHBBIjAbfyAGsmWRy9H
	jEp0PERpseRx7I1DvjUjlUUEakSSmc6BGgmGS3013eIiu+Zf96MUYK7W
X-Gm-Gg: AfdE7ckxJC16GUh0elxD17N3suwjFKjcJ8hy42VmNDKGWZeTQTFZY8ksgLw/zNxwA4n
	S9f7Hb93glW0/liBPlNSNzJWenyV5667jrD+qhzymYDmUg5E00DgNLKRkEzRJ/ARdStihSVzeJh
	EuLI9/yvI1OWkWGMmtIvTPprIOWh0RoayaJR6/7rKC8bsD6fapDlJqPTk3V7KNDWnIiyKHHNiet
	ha940xnna3oqKtdfzlna25SIKNGTAa2O4nqOe0EurdMGfeIE6FDRc/gJSn/58cpcZ62cE7dROXO
	r3QUNtG3g3vPGk+1WL+DtxDftz0f6YZ+ej4yGD/KE8AUxk/iV/zyOjrrAyV3zrSsnbpaqZEBsop
	Uz55m9MxRBfOY+zWAOLckbFImilTu8Z+TzEtJcST0YQiFWzLTp/ClWrTYJv+gqpUQH3mlS1tnIw
	o4NepIb8YKqKvyVf/W1vdeNqBrWtzJAAikpLuHShieSuhJpLM=
X-Received: by 2002:a17:90b:5204:b0:37f:9e21:91d7 with SMTP id 98e67ed59e1d1-380aa1ffe6emr81423a91.14.1782879227070;
        Tue, 30 Jun 2026 21:13:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095e830ddsm963128a91.13.2026.06.30.21.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 21:13:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sen Wang <sen@ti.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: ti: j721e-evm: Avoid mixing goto with guard()
Date: Wed,  1 Jul 2026 11:13:10 +0700
Message-ID: <20260701041310.230725-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701041310.230725-1-phucduc.bui@gmail.com>
References: <20260701041310.230725-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The previous guard(mutex) conversion mixed cleanup helpers with
goto-based error handling, which is discouraged by the cleanup.h
guidelines.
Restore mutex_lock()/mutex_unlock() instead.

Fixes: 6f4cf77320ae ("ASoC: ti: j721e-evm: Use guard() for mutex locks")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/j721e-evm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index c214ae0d7b95..312298e0b004 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -4,6 +4,7 @@
  *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -263,7 +264,7 @@ static int j721e_audio_startup(struct snd_pcm_substream *substream)
 	int ret = 0;
 	int i;
 
-	guard(mutex)(&priv->mutex);
+	mutex_lock(&priv->mutex);
 
 	domain->active++;
 
@@ -303,6 +304,7 @@ static int j721e_audio_startup(struct snd_pcm_substream *substream)
 out:
 	if (ret)
 		domain->active--;
+	mutex_unlock(&priv->mutex);
 
 	return ret;
 }
-- 
2.43.0


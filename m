Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFFD346E5D
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 20:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773518786; cv=none; b=TF8N1rRfpTMulAR6VydkVqtPCrj151P9svypAvC/QaoTbPQjAiShKaX6onyTqPFvLCbdc2ck5a2J+r4ii/qZ6aeId9dHUM90kDGl+Ypp+tPmMeD9tbj4dpNKJ34FQYvssUTSIxyrcZvCb1UPPRm4s72xIsFXrWwAJTzpOkOy/LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773518786; c=relaxed/simple;
	bh=CRpVvHo5NMAWjnFPS+Xk6WuqTX911LAf9577oh6RjkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmbdLWejP/RdmQpFgBnzBf5283nyTG2ptcbZfTCVaxKr9yHeOeT2+xKdbcWiPFZ0p5j+ZbIoSTmakAxr3lVavrnBVIfQWf11QY6OkwI4Iy4WXzqAl0ghG6E1rqhUwG8A/zOj9UeEoZvAwPWTlfL/KpgvMbjltRaqyRFpIxwXp5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Or9a1UGc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Or9a1UGc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DC7C2BC86;
	Sat, 14 Mar 2026 20:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773518785;
	bh=CRpVvHo5NMAWjnFPS+Xk6WuqTX911LAf9577oh6RjkA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Or9a1UGcUEgYYtcwGOgGK8o0PexDylJuhhPEIJ4Yg7h5bo1gx42/DCPdzFOp/b3OR
	 b6HJuIwFvK7yXyClBQnOzV4s1ZVq3fdRyL6IYhwYS8OUxVMsFBpVbmfNTeqWM8fGDz
	 oCQkF/lzQCyopslPH9+hRDPXAqrKvz6RFzuZgCX72DBNHYcWb1L5p8szRu2cFuu+52
	 u+1m9eQsAZk3ZA60JzHO8VQ/yb9FP0T7+cVIfRS6yg5nXnIexCr9CsukgEWYz2K64f
	 cvYf+Xw01HJbLcPuzkhhbsZKWAjcW7ZOPyYTwiombnpGDwuUCLW5JscHs+XACgfcSa
	 uF/8CVkKD7pCQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 14 Mar 2026 21:06:20 +0100
Subject: [PATCH 1/5] ASoC: amd: acp-da7291-max98357a: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-asoc-amd-v1-1-31afed06e022@kernel.org>
References: <20260314-asoc-amd-v1-0-31afed06e022@kernel.org>
In-Reply-To: <20260314-asoc-amd-v1-0-31afed06e022@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

This driver includes the legacy header <linux/gpio.h> but does
not use any symbols from it. Drop the inclusion.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/amd/acp-da7219-max98357a.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 42aa009c4e13..3c08e6e17e41 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -11,7 +11,6 @@
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
 #include <linux/clk.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/driver.h>

-- 
2.53.0


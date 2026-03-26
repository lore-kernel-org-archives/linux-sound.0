Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E8F39BFE2
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 23:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774567607; cv=none; b=QFp2uFE/8SBbqKCHIjA6AKKMrMRTkMPy46TyW6TPH1yj+/UojnioCJlTe75v8GUIs5u80G6QZzca6q5yWQVJgdzyGIZca2S6ZZBuHx3Iwna31EYtbWFwiw2/3PDprBFt0OHlh1PYZ9iMg7ZWpYoE0Uge/0RwhdSAo+XAXD5l3SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774567607; c=relaxed/simple;
	bh=JljiDwC/NYaOK5xVqJhP4Wa5A57390WZIVPU6gtYkHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecDLGr6J47IkAFSaSt/zz/eedNuD9eFTFWmLmIbJNYhGkCSfkKM9cRcYOfjYnm2rLOz5/jf5A1j/mTweTbh2Y+6FWD4FpqxAtd7C9pMgCiFs6HW1JT+b8i1vB9l2RdtNeLmmmRe1vZTWVr7UUliikbCT1qyMfyhZxADsmKncgvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSr7NaH0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSr7NaH0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6D8C19423;
	Thu, 26 Mar 2026 23:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774567606;
	bh=JljiDwC/NYaOK5xVqJhP4Wa5A57390WZIVPU6gtYkHE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bSr7NaH0BISMIFo++ku1qgKnF9A5dEVNFXfuzqFEZYWfQyYAzSMHLTINZe2gDnI/0
	 +ubqs9Ebxrcl0fcvirEVE3VLmARzqQGLOvpV/xYApUlOYJ7wno0imOk9wJaLlp30Me
	 OcsI3XDhAxuIjiTNiSFQFd3WgQcrFAhPQ8bqUXbccXtHzCO0pByOkx+8jOOnDGDx9N
	 2Ylc3tI8BYdJvcXYyFcNbCXYycISqWYaI06i3g8qRi9JHxeVDi70YC0P2jUjayr9KB
	 38py0ZJdzjqQ0Q07FJ3GaHFch9aYUKy68hCcgJZjJT5Tns4QKtXy0PF86hhazK03ja
	 BE1GJ/LsdIk8Q==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Mar 2026 00:26:40 +0100
Subject: [PATCH 3/3] ASoC: ts3a227e: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-asoc-rt1318-v1-3-9fcecf868fda@kernel.org>
References: <20260327-asoc-rt1318-v1-0-9fcecf868fda@kernel.org>
In-Reply-To: <20260327-asoc-rt1318-v1-0-9fcecf868fda@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The driver includes the legacy GPIO header <linux/gpio.h> but does
not use any symbols from it so drop the include.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/codecs/ts3a227e.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/ts3a227e.c b/sound/soc/codecs/ts3a227e.c
index 5ce0db9326fd..5a7beeadb009 100644
--- a/sound/soc/codecs/ts3a227e.c
+++ b/sound/soc/codecs/ts3a227e.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2014 Google, Inc.
  */
 
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/input.h>

-- 
2.53.0


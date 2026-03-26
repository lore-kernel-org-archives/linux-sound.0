Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C17625776
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 23:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774567603; cv=none; b=WfmO0oD+w2Kv1GrTkI6QZKRagFEK6LfppAk1IKAw70VzWOYB4rKR+QVwH8i6o9SPSEGlqle9YGqQ1aet2bPpAZUvehzgYfvYXzT4eVHgsUQ3q1ZipPvws45M1+LL6++EmkVZrlceJlZnn3ur36Kx8LQPhfSbnNxbOkM4Q2V9F1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774567603; c=relaxed/simple;
	bh=Ta9M5Tlh8CsvBHhmP0Pv0uGnt2DddkTTppqsP1DTrf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ub5hnxpgVIvo6AaOSHwKUWUHNoGOUtpMDatdKACQvJHUlkjPwMq27eCV4TpVwXovRxndwV6hP0e5sr0v992mcTMIABQXMjfQza1K6XuECdN5v2NoMi40VEz9w9p/ItNQaOJAfjyyMcaiYjV/h0eAaccUw09mjR/EDLt0x+TWBjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgodW1w3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgodW1w3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1331C116C6;
	Thu, 26 Mar 2026 23:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774567603;
	bh=Ta9M5Tlh8CsvBHhmP0Pv0uGnt2DddkTTppqsP1DTrf4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MgodW1w35vhcTd24KbiTgQ3qRD4qqsjGZg5D+sFe5CPg1HZw0DaREK9Oji/sQxUcY
	 AZC/oSMUY8DE2slhf1SupGirB1MceigVABu0y6PL8qr2ag2XitPQecRh6T/Z0We/+m
	 Q8agiMn2cvDI1mCuXK8kABXI5C1aK9/9oLkpg/diG8WWlchrt3iQsHnBN06bqxfWhK
	 02HUvXwt1/ap4vLqYhrKL1tXYAyIQRmhqF6uB1kaLeljhj4icIVb0ldjYlI4ibp4SP
	 j1hDZH6e9EdBeUI08t/lKGzTO7Fpu88YQ9yUnPDi69rTjrRxYFaDyIImWteWhZZmiN
	 RRM/ssiMbkyYQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Mar 2026 00:26:38 +0100
Subject: [PATCH 1/3] ASoC: rt1318: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-asoc-rt1318-v1-1-9fcecf868fda@kernel.org>
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
 sound/soc/codecs/rt1318.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt1318.c b/sound/soc/codecs/rt1318.c
index 01c58b15fd91..a80643099644 100644
--- a/sound/soc/codecs/rt1318.c
+++ b/sound/soc/codecs/rt1318.c
@@ -18,7 +18,6 @@
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/firmware.h>
-#include <linux/gpio.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>

-- 
2.53.0


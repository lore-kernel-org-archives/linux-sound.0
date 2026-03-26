Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A6B25776
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 23:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774567605; cv=none; b=fqv6TBvTLZOzYjW61XOIRe4Cd7wGcavDocRP5cWxgI2k1sxWWUh2nEOoTz8XohuzAwfJhaNiGNh9Tspjy8t/PJL0MMFKDW8+M0gNSq5FNk8DNvQKqiCDb+/34ydldb4Qv02BFAChhKnd3VpaivjdQhYXaT17OHHRJCad3EIW1ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774567605; c=relaxed/simple;
	bh=A8B00xAWDe/ksq+PUptwdORtWkHp7FpCGHfnbbXNOXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gj707ury3OvYzwAqcylcmXggYVNxmMOzC6R1SmXjU5sWl3mnx5f1e95KUmYh4FKUS8Az5zLlpmwAvhYPAQC5QaVOq8Y0de6I4DeRh2reArktztYAnJzImm8u+81tmj3pc3l6GI41W/whGVloIKUuySPX+QI8wWLh4fdumYTLjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9jw+5jX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9jw+5jX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF57DC116C6;
	Thu, 26 Mar 2026 23:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774567605;
	bh=A8B00xAWDe/ksq+PUptwdORtWkHp7FpCGHfnbbXNOXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I9jw+5jX5QuOmvrxIUsVyiSzIDr6bv8Jv37fPirnunyhZ/QEvevjh3Fqs7tI84t5y
	 QqnDFfrJ4uwykAgXEAKz/vcp3gCGTp0uxmX1VBQWuiB/dv9/Bwq+DkohVTmwCkHUSh
	 bhxt6z/uD86uDsP3Qjmkco3b08+dPJ/CmXFMnOBON6oYg4u+TR5l6KEb3RklGT6/mL
	 Bia9euFGVqLvC50V3sSPuorxQTf68/V8J5KtMap16eaKvEV8ncjkJkCN7a6rreP9dN
	 +3iopRl+WBuyY5ZeG4LTEzXFSRDQGljxqd71q5P4EG2qRn9V5oUKZSYBHGZ4sjWFJ7
	 IV4X7AyAXGXbQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Mar 2026 00:26:39 +0100
Subject: [PATCH 2/3] ASoC: nau8315: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-asoc-rt1318-v1-2-9fcecf868fda@kernel.org>
References: <20260327-asoc-rt1318-v1-0-9fcecf868fda@kernel.org>
In-Reply-To: <20260327-asoc-rt1318-v1-0-9fcecf868fda@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The driver includes the legacy GPIO header <linux/gpio.h> but does
not use any symbols from it so drop the include. (It is already
using the consumer header as is proper.)

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/codecs/nau8315.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/nau8315.c b/sound/soc/codecs/nau8315.c
index 125742601f88..9ac2048ff0b0 100644
--- a/sound/soc/codecs/nau8315.c
+++ b/sound/soc/codecs/nau8315.c
@@ -11,7 +11,6 @@
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/module.h>

-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E2126E711
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 20:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773518789; cv=none; b=XLNsH4XyGszujfEIz7XpHFrXV0VPYKCJGIsIF3/KBNthGU70Q8bL3AWSdQWCxLq9g89ZVaViKaB9iGRCYPBv6WSEhqfOz3Zyon2+bpWy90z73MPYb8hQoc7mhwpMEEG1a0a9zQ4syhhxB34Fg5yoUpq3dhZdL3P/m/awAkzxe3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773518789; c=relaxed/simple;
	bh=p7ADeKzsQ7/SxMadf6D7WjbIukT2cxQ2Ao351hBU2oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LoAsLw9lAXmF5dRXqj2OKO2azVyzkz68GrzUpC2qLNupJB6N1r4gooSon3K/dJK0OboNgTWH8KfnkybwnYKFfXOoSJWas9LMosHYKB+S+ZV00w/I4rrFI8BE433XGo47/8sHMy63biEq7GIWKGdXsFmRsxspiwVt39RO+dvkgtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFCpozb6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFCpozb6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4306C116C6;
	Sat, 14 Mar 2026 20:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773518789;
	bh=p7ADeKzsQ7/SxMadf6D7WjbIukT2cxQ2Ao351hBU2oo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TFCpozb6IuQXtK2HIxsJXKEP1/CaPhRx97zAbYI4b2/vAt2arnm6+Ne2XL1bzGSkT
	 ojv5aXnsgzwZnxO3fopOIZSlv5oojxpFuPqcOqr0l1uzWTRO4lgCDLzcioTlZm+2Bc
	 r7U5AXVSjSNO31cgtkaAclsHdIq4/fRP+ky/F4A6YR6SPah0YsHmEr9IO9m/eFP1T+
	 qWWw7pG35hu1iamJGA6d0jrKS1cEnLaPlCMoC//CFh4n3yAZa5SwitfT4iq/cVg6Gr
	 fXEPsAmiznYuZ+wrtjjFA+ISoX2nJKCGf0tRqYREFafX/ad+kPmzXPbd+z9OIPasSx
	 8a9dnSCZ4QofA==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 14 Mar 2026 21:06:22 +0100
Subject: [PATCH 3/5] ASoC: amd: acp-rt5645: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-asoc-amd-v1-3-31afed06e022@kernel.org>
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
 sound/soc/amd/acp-rt5645.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/amd/acp-rt5645.c b/sound/soc/amd/acp-rt5645.c
index 11d373169380..894f530434da 100644
--- a/sound/soc/amd/acp-rt5645.c
+++ b/sound/soc/amd/acp-rt5645.c
@@ -32,7 +32,6 @@
 #include <sound/pcm_params.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/acpi.h>

-- 
2.53.0


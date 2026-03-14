Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EB2346E5D
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 20:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773518787; cv=none; b=UMUUt0pfivlL/iDRCL6FUJTAxa+++guFAXM9yOaFMZl0O/btR1Hmf4isA1/iPM1s148mVYOq40n/lPDmgG3EdJzjUJ+Pbm9mLyWXR7YMXchSniqu6XQK/N5Xss+EGhZ6/ngBX9fyHgOe95sllFJ4k92UG2CcRBHnIL8ya2AigM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773518787; c=relaxed/simple;
	bh=Airz6QKWfvk7jGoVBZQzTPLD8SL9R1+wdBtJv1KrezM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MsX+VzIFCXPSeedd3WIKoe7WKLYg1XUe8AceG09YyEf2TnOfAV2keNSChPcVJmRRDPg0eTZJd59RPITUNH4QcF75qoJtoipw4V/TijfDJSzmJWb64SM9eYS6mXwHxrwkg0RJeZO7vzTjJ3iUOTFMnwEVX3Oq12LfY/u2jOOis7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIA8GwJu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIA8GwJu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B323C116C6;
	Sat, 14 Mar 2026 20:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773518787;
	bh=Airz6QKWfvk7jGoVBZQzTPLD8SL9R1+wdBtJv1KrezM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OIA8GwJuU6ZlGSuyKnFsssdWuOvkpaDCz9v64+W0hWYBneeUt2gqapnQnGieHarPv
	 IgD3ENcXRwmWwi7heepnJb8wxKCL1ZQlyTd1558Vx+r+EUkdqVJ2ncpgtt6nScPqYc
	 atuKNcz1RF80ZsyrUfxkLgeH7AUfyxV5gjEi8EQxAbh/E30xMW5SZXcXnhYy3f/O+x
	 nWObvBTS57bm8NfL6DiBlOyZc67xcC7PbPHOkq5gh+EeFqvde8mAAFoZRGrZvFFk43
	 kJfAl04iwkhZTAzFM9075tiSS9ncmShCkogMZ0Asppz9I5GllOBPdVjDTvnKt8x9AL
	 o4DJ8kkuof8hw==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 14 Mar 2026 21:06:21 +0100
Subject: [PATCH 2/5] ASoC: amd: acp-es8336: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-asoc-amd-v1-2-31afed06e022@kernel.org>
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
 sound/soc/amd/acp-es8336.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index b16dde0e2987..9f3f11256788 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -11,7 +11,6 @@
 #include <sound/pcm_params.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/gpio/consumer.h>

-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91394383C60
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 20:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773518791; cv=none; b=GnvLxbXBDw9sg2YmrqEHBTJUZpB9Byid3h/PSHnNazhevhviTerUm1iw5MNcerE1vaK6hCptPpMOQ0+7BxAY+3Klt/DlPSapP2bclqot/u9ptBsGkBsMocWgKa+1jrtihlttTL8uYC3v76RH2yhUPcua2ApRy0VHMAH8Gp4Q5X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773518791; c=relaxed/simple;
	bh=ochsV4fpYTScVuvYcFWhfGIvcOLYT123ueGh5r1UqpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bqnpidjJGLcBfRPWHvurAP5tmosajKWQucyxdBdJsPdbpevbylKBJdwP9jF6WkpDtSoay6HGL2nukbOsm/O5BcoVZKoSFAGqhQg600AiG7LDZUVdo3qQRkuxDC69Hm+W+TXrm19Z2e2YTaOhpJpJMuZvSCdl5GBhVqKEBHvVDwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pd9Y3y5q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pd9Y3y5q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97ECC2BC86;
	Sat, 14 Mar 2026 20:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773518791;
	bh=ochsV4fpYTScVuvYcFWhfGIvcOLYT123ueGh5r1UqpQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pd9Y3y5qWq9wlF679A3o6q91QmLnY54TYnZLU0hErAnpxIY2iHKrt3cPK+wmmpczz
	 0Da2p08OkRCeeUi0URBEi6GMbMkLGzNQ86KQnS2hOOroWMTt3yZNb5/9DElMsBhSpK
	 teO9u8lCO4KWkF9SSNN97AFoL3YIDCueaGBfwWDN1AfK8Zw4M2iYagSKFQTrGOszZL
	 7mpmm9x7t9+sWlTD6AhMlLeQm3PJmLF3okkZP8szKjZ42LYohWV7mMOfLsclxA8Gr8
	 zpzR6sHd8FAQ88/0cJJuhtWiIBFr/rM62GIBBIgsullMI2CBf33qz8bUdeCJ0RExgh
	 d2FuaztZ4PANQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 14 Mar 2026 21:06:23 +0100
Subject: [PATCH 4/5] ASoC: amd: acp3x-es83x: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-asoc-amd-v1-4-31afed06e022@kernel.org>
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
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index 141ea4787d99..46fff565d732 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -11,7 +11,6 @@
 #include <sound/jack.h>
 #include <sound/soc-acpi.h>
 #include <linux/clk.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/i2c.h>

-- 
2.53.0


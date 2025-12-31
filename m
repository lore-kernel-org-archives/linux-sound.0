Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5CA30DD19;
	Wed, 31 Dec 2025 20:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767211487; cv=none; b=oM/LudmZmgmarAD/jOUrKwk0zpSxI0XAOBtcUBjOVu8vAKJuR96KlbjeI4dtH/CRxavSyzfPxoAP/0hhPpee3sacdBORFUnjIMSA7LYbZFLoBs3WPcyYlp3E8szz7kJ7nShf+E2dywHogOgEV1+ZytL6IBPobtJBfEyyl1sQE44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767211487; c=relaxed/simple;
	bh=G5tbss/I9BerqD7yyqFl5i2+sbkH+2tcNPOQsdt7FAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dlVZ8zlqjm7mne7jWzsDd9uR7qmd7ujlh5MycK8dAK/hG5nM03pwtdHAyXDlgGQwcUPKBCqHaMy0XECWoT3VNiwFCKsrV/FPjjytYX0epuGjAHsRnr/fNNJDlMTm2Ii3Fg8vYYzXBAUd6oZ2I00mE14S6IV3DOjL5DSlWh+r/d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a2JCYNeF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a2JCYNeF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767211478;
	bh=G5tbss/I9BerqD7yyqFl5i2+sbkH+2tcNPOQsdt7FAY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a2JCYNeFNK0OMuHhdOniUS4T9bsFy7b/BewAmhYxJjDckMjXFVpbXWewaH0SLat2I
	 UoloAUYJi2BMx6xIV1whA7LKN3f4FpNpT5hw3KS5oQYX0HBQ/v2shCJy0BZ4F+YR/L
	 IgXFHgHsC7C0O380UfmvZLNvXB4h811h9kpqxM3CFUSwdTsxkVWdotTafpkwuXI9+w
	 DJYr0oSyAWSwY6304rSB0gEpU2dOME/ZWTBYevwJSNGHIL2lBRWZYxbcogTUvChKUK
	 8lmExbkmTKQf82Iqc/O3FvElUuCZEgjAEmOsnT+Bh+d4qyux4vhwatHeGofh+hr7Py
	 XZgtVremR3vfg==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 66D6B17E0EFE;
	Wed, 31 Dec 2025 21:04:38 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 31 Dec 2025 22:04:21 +0200
Subject: [PATCH 7/7] ASoC: nau8821: Sort #include directives
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-nau8821-cleanup-v1-7-6b0b76cbbb64@collabora.com>
References: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
In-Reply-To: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Seven Lee <wtli@nuvoton.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Make sure #include directives are ordered alphabetically.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/nau8821.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 181214fa792d..ffb526de0021 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -11,10 +11,10 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
-#include <linux/init.h>
 #include <linux/i2c.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/math64.h>
+#include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <sound/core.h>
@@ -24,6 +24,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
+
 #include "nau8821.h"
 
 #define NAU8821_QUIRK_JD_ACTIVE_HIGH			BIT(0)

-- 
2.52.0


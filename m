Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9781F5433
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740052914; cv=none; b=s0sgNRCwMX6c9IOjVcyXDw/quGqEmV73t2OX63kixSh3vipc2bQ5cVCEFoz1qRpwK6JeHHfE9gB/EmYfkGAJEh+nYWq7bZ45Ez0i2UasUY9HF0lcXWHIJ4Wex0BT6tMKPQ2KkSldb8/pEtdBb40IS3QRURH5B5WB/KfUEJOvUTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740052914; c=relaxed/simple;
	bh=+cjoYnPhl7go8vNPd0AzCZxrUj9Vc0ZTGF3CSggyUh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N4pIWCxkK4CGsDesKr1KVhhGel06nt43J2nOvA5pu/xOAcY2GsLA+tSequ4UW3oUpDT+XRQxvsVrLYeuMXhxBacYZw3JLP7QsZxiMwTD+xkGHuoEDMXjkv8zUcV1d61csPSnooN8Tgv8AUx9LZZJ82v0Xr6Ev+9EBT60st8CVH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aAkr6XlP; arc=none smtp.client-ip=95.215.58.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aAkr6XlP"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740052901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mgkXS4965mRZXXmxJJl0d53HLCngL7V5dDdxIELeblI=;
	b=aAkr6XlP1qCgm2YwlGLBOsB7XXQ63mlMaWwlaKKe7XtPkaA19Ubno4hqmG2U+bYqU+l/z0
	8185mxXHilAly9FBeTi/yObE8+N3ehEnbV431B/rBWMSa8UckbA97vEQgpyq510orKL2V3
	WOvhw2Cxr/YjgXgHIN8oxyTS2yN6qYg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Benson Leung <bleung@chromium.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	chrome-platform@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: cros_ec_codec: Use str_enable_disable() helper in wov_enable_put()
Date: Thu, 20 Feb 2025 13:01:01 +0100
Message-ID: <20250220120100.1530-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_enable_disable() helper
function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/codecs/cros_ec_codec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 11e7b3f6d410..571222ec520c 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -21,6 +21,7 @@
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -657,7 +658,7 @@ static int wov_enable_put(struct snd_kcontrol *kcontrol,
 					   (uint8_t *)&p, sizeof(p), NULL, 0);
 		if (ret) {
 			dev_err(priv->dev, "failed to %s wov\n",
-				enabled ? "enable" : "disable");
+				str_enable_disable(enabled));
 			return ret;
 		}
 
-- 
2.48.1


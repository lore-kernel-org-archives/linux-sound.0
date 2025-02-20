Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199EB1C831A
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740052965; cv=none; b=uEq/vvxk92eS4oOuxSdAtNd8JnWJgmz5LnkvIfrbmxz3N9IC68wb1/80lNgBD0GOMwAQ0hCSs9aVHkAWBPfG8eiXhKmy+IrxUeUYQGbilV6wwcQ9nXYsiFXW9xX07e2jZ0UGBUztDh3GmOsM5K+BKLN2hZEmOXsQGD13ymy9elg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740052965; c=relaxed/simple;
	bh=Qh1fDdbVWoq5LmRU/PBLbEoDH0O/VJX/C+u+qo4SX9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mip02n0b8IQDxNQIjHv2t3ohQGcCn/ywhD/jnmuNgkmtynmLx1ifE0ZKrqKoKLOliMXi26/vr6ZV/9hqxrHBqC6zxv1iKAvqav7gQf42kwtgqWVJ/6F1m4Bk1ZpEmPti915vnj6gldAbA+7qhNLI0aXakMTlbhfKeqG+b6XM3q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mYoaUp7c; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mYoaUp7c"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740052952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iLQeHtr7dflWJfJVnMor0B3u6SKiuchpxdMV07r+zUk=;
	b=mYoaUp7cfmCD080PuBawihKZxN4gl3FHZeyOHfVnkA9xFkTkxg28KIBPKWgFOtlZ/3bnAM
	kVJNXyctksMYXFJvXcHxjir2Tpt0hRgDD26dyXYM/4VSKkcjl8NKFkFuvipDL53NwGRFu1
	APdwEn5ztzmq+uC2KXDyM/nhmdRGD6g=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: soc-core: Use str_yes_no() in snd_soc_close_delayed_work()
Date: Thu, 20 Feb 2025 13:01:56 +0100
Message-ID: <20250220120156.1663-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_yes_no() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/soc-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3c6d8aef4130..c5a8d5ad8c34 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -32,6 +32,7 @@
 #include <linux/of_graph.h>
 #include <linux/dmi.h>
 #include <linux/acpi.h>
+#include <linux/string_choices.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -430,7 +431,7 @@ void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 		codec_dai->driver->playback.stream_name,
 		snd_soc_dai_stream_active(codec_dai, playback) ?
 		"active" : "inactive",
-		rtd->pop_wait ? "yes" : "no");
+		str_yes_no(rtd->pop_wait));
 
 	/* are we waiting on this codec DAI stream */
 	if (rtd->pop_wait == 1) {
-- 
2.48.1


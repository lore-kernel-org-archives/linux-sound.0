Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8431FF7C8;
	Thu, 11 Jun 2026 02:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781145508; cv=none; b=hX+B981Dvg/w9oU3H1rjTMEEh5lUZjJSIUKCN5nTeHXJAqtpBnyL6PYvJbjr2L6la6aAacFaFTUGeqFOdEE1GhVQq9cEVUHk98e4vg2707j2JsKbo1XlK6xpqWaZiK8VNuFEwzeRknfnoKHsTIw74iGe4osvPmwXc/sNVgC49nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781145508; c=relaxed/simple;
	bh=9EGRLZY5AilKpFg28ZJo7UnJZmaVd78LGr7niIZFQu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t3AezSGQsatpAM9tViiNg5SkpWMuv0qKv/vxUJkR1epTam1vihhKUUK+i9M+T3hlHTfVUpXwpbNqbNbxd1VVcEwTIpyx92cY+3FlJOS+ADIjwoe1lzmFOt84RD6PR9ve3b1yG50o7RnN1UgkvUD552fnyN3J6lkcZwRINC4Fv9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=X552yT9d; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="X552yT9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Y4
	5EceXZv++lmBKFRkFB8qV0AsO0n/Zj7USjbV2HcIg=; b=X552yT9dMAs55hOwTn
	oDQFJeeepXm3bdgsYyVoPXVt4TkYwmxAF4LfCWLGjzfUH2+MlOZVSoqjV36qWf7E
	hFgKZ4kBZpaDHYjnNKmGfGSjnygvgk/XiUh3oG37PoyA/XELlVL6z3IgRWCdx4aY
	2wATO/uv8D1ydhiEfjHBSaUxI=
Received: from debian.lenovo.com (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBHJh5PHypqjZc_Bg--.28741S2;
	Thu, 11 Jun 2026 10:37:04 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Kean Ren <rh_king@163.com>
Subject: [PATCH] ASoC: SDCA: fix NULL pointer dereference in sdca_dev_unregister_functions
Date: Thu, 11 Jun 2026 10:37:57 +0800
Message-ID: <20260611023757.1553960-1-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgBHJh5PHypqjZc_Bg--.28741S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr18ZF4rJFWUXryUuFy3urg_yoWrJr4Upa
	s3Ca15CrW8Kr4vgr4aqF48GFy3GF4ayw4SyrW8J342gan8Jr93tr4ktw1Fqa18JrWfAF4x
	ZF1DXw409w1DAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRiYFJUUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC3xABr2oqH1BfzgAA3-

sdca_dev_unregister_functions() iterates over all SDCA function
descriptors and calls sdca_dev_unregister() on each func_dev without
checking for NULL. When a function registration has failed partway
through, or the device cleanup races with probe deferral, func_dev
entries may be NULL, leading to a kernel oops:

  BUG: kernel NULL pointer dereference, address: 0000000000000040
  RIP: 0010:device_del+0x1e/0x3e0
  Call Trace:
   sdca_dev_unregister_functions+0x37/0x60 [snd_soc_sdca]
   release_nodes+0x35/0xb0
   devres_release_all+0x90/0x100
   device_unbind_cleanup+0xe/0x80
   device_release_driver_internal+0x1c1/0x200
   bus_remove_device+0xc6/0x130
   device_del+0x161/0x3e0
   device_unregister+0x17/0x60
   sdw_delete_slave+0xb6/0xd0 [soundwire_bus]
   sdw_bus_master_delete+0x1e/0x50 [soundwire_bus]
   ...
   sof_probe_work+0x19/0x30 [snd_sof]

This was observed on a Lenovo ThinkPad X1 Carbon G14 (Panther Lake)
with the SOF audio driver probe failing due to missing Panther Lake
firmware, causing the subsequent cleanup of SoundWire devices to
trigger the crash.

Fix this with three changes:

1) Add a NULL guard in sdca_dev_unregister() so that callers do not
   need to pre-validate the pointer (defense in depth).

2) In sdca_dev_unregister_functions(), skip NULL func_dev entries
   and clear func_dev to NULL after unregistration, making the
   function idempotent and safe against double-invocation.

3) In sdca_dev_register_functions(), roll back all previously
   registered functions when a later one fails, so the function
   array is never left in a partially-populated state.

Fixes: 4496d1c65bad ("ASoC: SDCA: add function devices")
Signed-off-by: Kean Ren <rh_king@163.com>
---
 sound/soc/sdca/sdca_function_device.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sdca/sdca_function_device.c b/sound/soc/sdca/sdca_function_device.c
index feacfbc6a518..b5ca98283a88 100644
--- a/sound/soc/sdca/sdca_function_device.c
+++ b/sound/soc/sdca/sdca_function_device.c
@@ -82,6 +82,9 @@ static struct sdca_dev *sdca_dev_register(struct device *parent,
 
 static void sdca_dev_unregister(struct sdca_dev *sdev)
 {
+	if (!sdev)
+		return;
+
 	auxiliary_device_delete(&sdev->auxdev);
 	auxiliary_device_uninit(&sdev->auxdev);
 }
@@ -90,14 +93,24 @@ int sdca_dev_register_functions(struct sdw_slave *slave)
 {
 	struct sdca_device_data *sdca_data = &slave->sdca_data;
 	int i;
+	int ret;
 
 	for (i = 0; i < sdca_data->num_functions; i++) {
 		struct sdca_dev *func_dev;
 
 		func_dev = sdca_dev_register(&slave->dev,
 					     &sdca_data->function[i]);
-		if (IS_ERR(func_dev))
-			return PTR_ERR(func_dev);
+		if (IS_ERR(func_dev)) {
+			ret = PTR_ERR(func_dev);
+			/*
+			 * Unregister functions that were successfully
+			 * registered before this failure. This also
+			 * sets func_dev to NULL so the caller will not
+			 * try to unregister them again.
+			 */
+			sdca_dev_unregister_functions(slave);
+			return ret;
+		}
 
 		sdca_data->function[i].func_dev = func_dev;
 	}
@@ -111,7 +124,12 @@ void sdca_dev_unregister_functions(struct sdw_slave *slave)
 	struct sdca_device_data *sdca_data = &slave->sdca_data;
 	int i;
 
-	for (i = 0; i < sdca_data->num_functions; i++)
+	for (i = 0; i < sdca_data->num_functions; i++) {
+		if (!sdca_data->function[i].func_dev)
+			continue;
+
 		sdca_dev_unregister(sdca_data->function[i].func_dev);
+		sdca_data->function[i].func_dev = NULL;
+	}
 }
 EXPORT_SYMBOL_NS(sdca_dev_unregister_functions, "SND_SOC_SDCA");
-- 
2.47.3


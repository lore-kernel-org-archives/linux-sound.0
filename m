Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5865B2BDC00
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 20:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755118581; cv=none; b=fH+OauaOIdB7hkqENA1aieOQohH+hYlve8pHbyoGfC/wA0xAFAXOBphR5YQmgMQmwse/FBqIUAGuhU1y8dEYgjRP3jCVHLw+VXC4nHNQiveg3Qq1JhmWMAPm9xBUhXa011SphCnsMZ3mkO6GwLv6AvNJKRWmJAmkDFAUlLIbd54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755118581; c=relaxed/simple;
	bh=JSLDnzUEROhn9DqEvlIOVti7KBHDKlVXMUvzgA4iXuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1PgFrVvAX9N8dT5YmoF3/CdGYWqiElos1MWMUpJ4JJ4cERlWHR3ZxRo7MQQRKcTJFIUn1TKj7YXISeDNWupYk+hV3jLqKPb+t57mZJ7xDIrUuhVTbXIwuL5mw3ej3yZjh5LoWP3SvLv+60o6tWDpZwjBJMggZ3Sv/Cf0Xu9YL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PFCsQaSo; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PFCsQaSo"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755118567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zis8OIa6L0oQE6Xe1X36zgq5KrCMHrQD4UX7YdcdMJY=;
	b=PFCsQaSoMaFbsgdinKL6q9BkxnaNqfZ2Ubz3t0896tRmUPzYMV1OO1Xo7TdU/vQ39lUvU+
	NZ5TvB1OO2IBnmypqWBH5IvGAUuPBBkPNkney16/iwe2Q8HzRTgqFrACVW4G7YpvVk3U5Z
	PORunNfd3Ao3clwJHccfIz8EBhWacE4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Wentao Liang <vulab@iscas.ac.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: hda: Use min() to simplify snd_hda_get_devices()
Date: Wed, 13 Aug 2025 22:55:02 +0200
Message-ID: <20250813205507.215658-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use min() to simplify snd_hda_get_devices() and improve its readability.

Change the function parameter 'max_devices' from 'int' to 'unsigned int'
to avoid a min() signedness error. Update all related local variables
and the function's return type to 'unsigned int' accordingly.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 include/sound/hda_codec.h |  4 ++--
 sound/hda/common/codec.c  | 11 +++++------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index ddc9c392f93f..006d4e4a8195 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -360,8 +360,8 @@ int snd_hda_override_conn_list(struct hda_codec *codec, hda_nid_t nid, int nums,
 int snd_hda_get_conn_index(struct hda_codec *codec, hda_nid_t mux,
 			   hda_nid_t nid, int recursive);
 unsigned int snd_hda_get_num_devices(struct hda_codec *codec, hda_nid_t nid);
-int snd_hda_get_devices(struct hda_codec *codec, hda_nid_t nid,
-			u8 *dev_list, int max_devices);
+unsigned int snd_hda_get_devices(struct hda_codec *codec, hda_nid_t nid,
+				u8 *dev_list, unsigned int max_devices);
 int snd_hda_get_dev_select(struct hda_codec *codec, hda_nid_t nid);
 int snd_hda_set_dev_select(struct hda_codec *codec, hda_nid_t nid, int dev_id);
 
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index eb268d442201..ce25608beff5 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/minmax.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
 #include <linux/pm.h>
@@ -323,18 +324,16 @@ EXPORT_SYMBOL_GPL(snd_hda_get_num_devices);
  * Copy the device list. This info is dynamic and so not cached.
  * Currently called only from hda_proc.c, so not exported.
  */
-int snd_hda_get_devices(struct hda_codec *codec, hda_nid_t nid,
-			u8 *dev_list, int max_devices)
+unsigned int snd_hda_get_devices(struct hda_codec *codec, hda_nid_t nid,
+				u8 *dev_list, unsigned int max_devices)
 {
-	unsigned int parm;
-	int i, dev_len, devices;
+	unsigned int parm, i, dev_len, devices;
 
 	parm = snd_hda_get_num_devices(codec, nid);
 	if (!parm)	/* not multi-stream capable */
 		return 0;
 
-	dev_len = parm + 1;
-	dev_len = dev_len < max_devices ? dev_len : max_devices;
+	dev_len = min(parm + 1, max_devices);
 
 	devices = 0;
 	while (devices < dev_len) {
-- 
2.50.1


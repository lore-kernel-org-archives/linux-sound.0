Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FED82D3A77
	for <linux-sound@vger.kernel.org>; Thu,  3 Jul 2025 22:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751583219; cv=none; b=dLq9t9HJL+yWtLi8GS2nnrvtA+2fSNa8H6a484VF0xG2HtvQDbD9f12vZt0trLaKehNfr5jzh9kclm6ryYkEXARUzQCwkGwp+PM9qr/glnPyzUOtj6FrUEbo9SfBYZ4qkgFsrZd+L9AmGNO6+pMl0t+ey9jHlDVnx3v6E0lCkek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751583219; c=relaxed/simple;
	bh=ULQqKoYh2RjDI9TSKSxCqwj9ka7ofVBZbeuB6/CEVgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qhcMJJiR5jt2irAKLRKm+eS0+WF2DMD/nr05rT0WnBHcg0KeL9umF4sWU5qswVQLiJKIzMStv4PG1ja+yMLwmE4ozsfsMJvC/yqRmXpJyyT7cVZCQIJUaFbiEgRReSzDCh4ZCuWjtKOxpf1R4NlI8cilX8ZX/wXx5mrS0Sidr9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=urFHdEeZ; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="urFHdEeZ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751583213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oIRglgn/9ldYHUc7IhNCSY6KbnwH4OkGlYmr7LfN2B8=;
	b=urFHdEeZN0hDQWUseEy8s44kzzllwidfjnHyb36vx5P+MKIsquEq9KFnGgf4vuudfvv1Bv
	Xmx5kX6L9mSIhuNLS/MuIWwQu/JaeIBVRjA5CeRiUHmTF095dqBHlYnA/eYhOFJ55cTanu
	dPSjDQvyUIUL7E95JipuXeoxUE1qhb4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Wentao Liang <vulab@iscas.ac.cn>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda: Remove old commented out sanity check
Date: Fri,  4 Jul 2025 00:52:36 +0200
Message-ID: <20250703225238.308359-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The sanity check has been commented out for more than 12 years since
commit d5657ec9f4ad ("ALSA: hda - Disable the sanity check in
snd_hda_add_pincfg()") - remove it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/pci/hda/hda_codec.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 5508381a1833..cb72e9655c8a 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -479,15 +479,6 @@ int snd_hda_add_pincfg(struct hda_codec *codec, struct snd_array *list,
 {
 	struct hda_pincfg *pin;
 
-	/* the check below may be invalid when pins are added by a fixup
-	 * dynamically (e.g. via snd_hda_codec_update_widgets()), so disabled
-	 * for now
-	 */
-	/*
-	if (get_wcaps_type(get_wcaps(codec, nid)) != AC_WID_PIN)
-		return -EINVAL;
-	*/
-
 	pin = look_up_pincfg(codec, list, nid);
 	if (!pin) {
 		pin = snd_array_new(list);
-- 
2.50.0


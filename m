Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5777021770A
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770204365; cv=none; b=YN7KHtnbYqn6z/b5eTVRdz8U4C44LDvkT4rPY16DEpYcrPq1nG2YihU8JF6Z5mW+G+bwJycLpNhbt2ZSOe46x1Iq6dd9a29nIPOBuyPPpbnbXHMlTRBhwkanIKgVwoe1aT6sY86SQkw1vi0w/krY64kyc5F18DkLDkby3pBdONo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770204365; c=relaxed/simple;
	bh=H1XpLGEKiYOHkXl4No/l2dci2t0+/z4MTjHIVxdNzdE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IytzcY7VGonc0xhL2utUHu60IkzQAOCgbwngLwn8Mb93WatXKnpHo30lcVuShNeBU2CJ9JEoZQ0Umrf4blwW8VlY30RhNqmRn+4w3tf/+IvOoqEQnMVKdsyZflL8qf+8DzHm7iDeKyyJsd6PuRwxZjYekRjZm2rA9WCQn6V/7To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUyZR0Fp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUyZR0Fp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770204365; x=1801740365;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H1XpLGEKiYOHkXl4No/l2dci2t0+/z4MTjHIVxdNzdE=;
  b=EUyZR0FplHOMEkQmcyJfTW+licsn+zIw9+mYpTOTd7UfjEG7x/S+XjCF
   7r7iMQvQqOKXKsKJwKqfiCMWNhvcDAWtrglTFAtXkE4UjOv/UIXz8Fs9P
   cwD9iqJ1jNHjIi4B6gemFhUUnvSUsDcGX+SDbi5hV/VndVB4aA7iyjOMO
   nwTsAm8KEfcJISr+uzcN6DMGNJqR3daUmB7kYRyPakUdQYfXKxmABcDzD
   Z8bRsqPzSlweCL/Ww0kQbbPXn+SHYHZHsXqUNm6D6bGNnhcxnuoXj1c9o
   kz3MdhFyFHAtQbTbfYCsvUqS9tIYKHuU3waJG7MM8jHzJYfHFCFKt80H0
   Q==;
X-CSE-ConnectionGUID: hM3f/bCrRu2PPdPd9xp8FA==
X-CSE-MsgGUID: eGfuJX5fSPOGyoSqSggZwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96841301"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="96841301"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:26:05 -0800
X-CSE-ConnectionGUID: FrILtubbRdOvsQD28CybFA==
X-CSE-MsgGUID: vzzWbNynSymj5+vgFFBPNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="240822479"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2026 03:26:03 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2] ALSA: control: Verify put() result when in debug mode
Date: Wed,  4 Feb 2026 12:26:09 +0100
Message-Id: <20260204112609.127085-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The put() operation is expected to return:
1) 0 on success if no changes were made
2) 1 on success if changes were made
3) error code otherwise

Currently 2) is usually ignored when writing control-operations. While
forcing compliance is not an option right now, make it easier for
developers to adhere to the expectations and notice problems by logging
them when CONFIG_SND_CTL_DEBUG is enabled.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v2:

A number of fixes as suggested by Mark and Takashi. The initial version
did not account for possibility of invalid payload sent from the userspace
and was buggy.
- enlisted ->info() operation and reused existing
  fill_remaining_elem_value() to sanitize the 'new' value provided by
  user
- fixed size provided to memcmp()
- the 'original' value is now initilized with memset()

Readability improvements suggested by Kuninori.
- added conditional #define snd_ctl_put() so that no additional
  if-statements are needed in the actual code.

 sound/core/control.c | 46 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 9c3fd5113a61..6515861bbd84 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1264,6 +1264,49 @@ static int snd_ctl_elem_read_user(struct snd_card *card,
 	return result;
 }
 
+#if IS_ENABLED(CONFIG_SND_CTL_DEBUG)
+static int snd_ctl_put_verify(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *control)
+{
+	struct snd_ctl_elem_value original;
+	struct snd_ctl_elem_info info;
+	int ret, retcmp;
+
+	memset(&original, 0, sizeof(original));
+	memset(&info, 0, sizeof(info));
+
+	ret = kctl->get(kctl, &original);
+	if (ret)
+		return ret;
+
+	/* Sanitize the new value (control->value) before comparing. */
+	ret = kctl->info(kctl, &info);
+	if (ret)
+		return ret;
+
+	ret = kctl->put(kctl, control);
+	if (ret < 0)
+		return ret;
+
+	fill_remaining_elem_value(control, &info, 0);
+
+	/* With known state for both new and original, do the comparison. */
+	retcmp = memcmp(&original.value.bytes.data[0], &control->value.bytes.data[0],
+			sizeof(original.value.bytes.data));
+	if (retcmp)
+		retcmp = 1;
+
+	if (retcmp == ret)
+		pr_info("kctl->put() returned the expected value of '%d'\n", ret);
+	else
+		pr_warn("expected kctl->put() to return '%d' but got '%d'\n", ret, retcmp);
+	return ret;
+}
+
+#define snd_ctl_put(kctl, control)	snd_ctl_put_verify(kctl, control)
+#else
+#define snd_ctl_put(kctl, control)	((kctl)->put(kctl, control))
+#endif
+
 static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 			      struct snd_ctl_elem_value *control)
 {
@@ -1299,8 +1342,9 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 			result = sanity_check_input_values(card, control, &info,
 							   false);
 	}
+
 	if (!result)
-		result = kctl->put(kctl, control);
+		result = snd_ctl_put(kctl, control);
 	if (result < 0) {
 		up_write(&card->controls_rwsem);
 		return result;
-- 
2.34.1


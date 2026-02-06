Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E4735F8B2
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 11:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377568; cv=none; b=n3qrtRw8TqJ4fA2DQw6HLorP2A59xDRKKzwpvEPh3AUPB+BC6cIDwfhF4PAQdsfh3m4N3JYQRzhAgeh5OAM9ii+eD42BrexzJIQwT2iXOpc7yoqWN9lCu4wIX8ErFP0oqDGWlbOrSYydxcauv/1XfcRRi+8G2r4lnWFUGNzKJVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377568; c=relaxed/simple;
	bh=pMk3ZlIS/mpPGQ4lAS8x90Wz7iD0YuUEpwvVwoT7WQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K6FAvicbgDhSuolcMCnwU8huYJ5+GlqQ+Q5E19sBbOq7gViDMh64PL5++Jpis/e62mBTUDWj2VT444VWjlIwzcbKVfJFPr5k7TAtNhC+EDzNFXHVquQDhWE5KfO2soYmRvLUBwLYlJ3sbbIjUsJ6WpPsZrpMAnedPzui2lQrlwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y76DTqAN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y76DTqAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770377567; x=1801913567;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pMk3ZlIS/mpPGQ4lAS8x90Wz7iD0YuUEpwvVwoT7WQ8=;
  b=Y76DTqANyQov8nUZeEbeHl5e8OhDNhGuehDBQI1+KbF+aHRi4BvOq9Yp
   RXMem0DKbrgwvBZXnWSCt9N44n9PqY1RcF6enKEidIKoGsbG6iSjweKjn
   f9RiQhkUgLzjMFlNy0lHQllclkrlgUUsh3ikdJ9Sm76HpzIkwEadpjh1F
   hf4gFD2lfKYnFvZ987sxJTuaEAg5QGq5xDG5d1lm7Yx1Ujt8+Fm6/sxvb
   o59P8Jk7OrBzK2ulD+ld+YagnYbU1CO+bjFb1fDHBHUu6gQeMORWTUe0z
   vbFa9NPPEQzwgGfFemCOIzZQ8AaLbSHFUUG9Ypkfn3APz7VAYK7vesZ2G
   A==;
X-CSE-ConnectionGUID: HLR4IdgAQiWAoLRPqAVXcw==
X-CSE-MsgGUID: JDx7KZzrTnCt03MYBLSF7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71483414"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="71483414"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 03:32:46 -0800
X-CSE-ConnectionGUID: 0KZBQeRdS0SmlrqaqES1eQ==
X-CSE-MsgGUID: cOLj5EO/SIaEoqm9gI4+Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215821327"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2026 03:32:44 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3] ALSA: control: Verify put() result when in debug mode
Date: Fri,  6 Feb 2026 12:32:50 +0100
Message-Id: <20260206113250.207179-1-cezary.rojewski@intel.com>
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

Changes in v3:

- simplified the memcmp() as suggested by Jaroslav
- added ->access verification for SKIP_CHECK and VOLATILE as suggested
  by Jaroslav and Takashi. For that very purpose I've deviced to use the
  kcontrol-volatile (vd) pointer that already part of
  snd_ctl_elem_write().

- as things are more complex now, replaced snd_ctl_put() macros with
  functions. This aligns with suggestion previously provided by Kuninori

- reordered operations within snd_ctl_put_verify() so that it's more
  intuitive to read, at least in my opinion:
  get/info/put -> info/get/put


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


 sound/core/control.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 9c3fd5113a61..18ddae138795 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1264,6 +1264,60 @@ static int snd_ctl_elem_read_user(struct snd_card *card,
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
+	ret = kctl->info(kctl, &info);
+	if (ret)
+		return ret;
+
+	ret = kctl->get(kctl, &original);
+	if (ret)
+		return ret;
+
+	ret = kctl->put(kctl, control);
+	if (ret < 0)
+		return ret;
+
+	/* Sanitize the new value (control->value) before comparing. */
+	fill_remaining_elem_value(control, &info, 0);
+
+	/* With known state for both new and original, do the comparison. */
+	retcmp = memcmp(&original.value, &control->value, sizeof(original.value));
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
+static int snd_ctl_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *control,
+		       unsigned int access)
+{
+	if ((access & SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK) ||
+	    (access & SNDRV_CTL_ELEM_ACCESS_VOLATILE))
+		return kctl->put(kctl, control);
+
+	return snd_ctl_put_verify(kctl, control);
+}
+#else
+static inline int snd_ctl_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *control,
+			      unsigned int access)
+{
+	return kctl->put(kctl, control);
+}
+#endif
+
 static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 			      struct snd_ctl_elem_value *control)
 {
@@ -1300,7 +1354,8 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 							   false);
 	}
 	if (!result)
-		result = kctl->put(kctl, control);
+		result = snd_ctl_put(kctl, control, vd->access);
+
 	if (result < 0) {
 		up_write(&card->controls_rwsem);
 		return result;
-- 
2.34.1


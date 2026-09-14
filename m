Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963539463
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381118; cv=none; b=ndTxkAwUiGWp40euuQBGO/ERqiLyDTAVDKV7msRVF2+iJoOBR3tXg3Z1jZ4RZk9Y6Xkx2QWI1WTQFR7Dst6YQnt8PgToUzDQOYGgk6NBTVjbVac8I9pNoqkTgGkL6wCErvYSc0YFAEBPer423L3m2kWgs8VhozuFEAfj2pKiKRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381118; c=relaxed/simple;
	bh=23yxMQqM++xSh0YisGolCP4NxBs0TVeZbBo/aRdP4gA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KBsJz33k74zKcexywrA3tav3jtqrY8r6hxJy1FouTmXzKhi+QI1GByL0vNT0BbQs2X8Usiz+6HmMKU3ukpJ6M/+aJXYu3TOiXQmeUjbjbZCNDKUrIvHgMvXrDQNUejse9lTkfsEAs1HlNnprHB2m647A88tCUIzK/Z+2NRAkj0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQS70zlV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQS70zlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789381118; x=1820917118;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=23yxMQqM++xSh0YisGolCP4NxBs0TVeZbBo/aRdP4gA=;
  b=mQS70zlVwvMG+w9C+rfrIPoYpJyTAMkc3Qh1oT+LyIrTpAUKAHe3LuWE
   Sds1+Y7To5/kGpHe+MTFjOVAZmO7RpzXoelvKYxEZkQIxPwLR/CFGZP19
   kPCxo9ICVC0zAI28QIdsEriEpuUVluq/kEeY7UwAj82G7ieKFjtNbnCb5
   NGYcAZXMVWzi63kv9bf7D47p7nFXrWYwRxyvN8ByAppvBGkppagdqDWnC
   28IoM2xM7K4kWXgxNeoBp9GbzJyJJC9MT081y5RXLw/9cDFJ/d72KkU2t
   k7pTtMklqiC8JwGA/ow2MTgoXttw2h9VKlke7+2enR36vA8vLGYFGL5RB
   A==;
X-CSE-ConnectionGUID: ieEAwQ1fSpmCAMXPh/sLrg==
X-CSE-MsgGUID: wf97JPjpSwuUVHcVykyYng==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89494212"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89494212"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 03:18:38 -0700
X-CSE-ConnectionGUID: ITA2SkLlTu6oBLM5QiHSEg==
X-CSE-MsgGUID: h8Ofy/olQfShNQsP41LEEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="269971558"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa008.fm.intel.com with ESMTP; 14 Sep 2026 03:18:35 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ALSA: hda: Allow for codec model selection with module param
Date: Mon, 14 Sep 2026 12:22:53 +0200
Message-Id: <20260914102253.2969724-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Model selection allows for customization of codec behaviour and thus
dealing with various problems on very specific configurations. The
parameter already exists but is part of snd_hda_intel specifically.
Non-Intel HDAudio controllers and DSP-capable drivers cannot benefit
from it.

The common place for all the bus drivers is snd_hda_codec. Add modelname
parameter there and honor it when initializing codec->modelname field.

Link: https://github.com/thesofproject/linux/issues/5683
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/common/codec.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 7d17d773cfbf..73b0009a0395 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -32,6 +32,10 @@
 #define codec_has_clkstop(codec) \
 	((codec)->core.power_caps & AC_PWRST_CLKSTOP)
 
+static char *modelname[HDA_MAX_CODEC_ADDRESS];
+module_param_array_named(model, modelname, charp, NULL, 0444);
+MODULE_PARM_DESC(model, "Use the given board model.");
+
 static int call_exec_verb(struct hda_bus *bus, struct hda_codec *codec,
 			  unsigned int cmd, unsigned int flags,
 			  unsigned int *res)
@@ -966,6 +970,7 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 			bool snddev_managed)
 {
 	char component[31];
+	const char *mname;
 	hda_nid_t fg;
 	int err;
 	static const struct snd_device_ops dev_ops = {
@@ -988,8 +993,9 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 
 	snd_hda_sysfs_init(codec);
 
-	if (codec->bus->modelname) {
-		codec->modelname = kstrdup(codec->bus->modelname, GFP_KERNEL);
+	mname = bus->modelname ? bus->modelname : modelname[codec_addr];
+	if (mname && strlen(mname)) {
+		codec->modelname = kstrdup(mname, GFP_KERNEL);
 		if (!codec->modelname)
 			return -ENOMEM;
 	}
-- 
2.34.1


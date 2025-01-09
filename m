Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AA3216E12
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424501; cv=none; b=rLv8PovfoxJV5sGVjkcKnEE76HNTnESjUXOLVRKjH0rv4dFGJBYazo9PGrf50qkgiCrmQlh6HPAnkrZvKesyYeWSpfPYRi/aoH96ti5I2VjOGLxLpAFZFJ0OAjdmTvHtticIWaI94pnaVyMy4EbRLC6NtD+XMUnv2Y4uBYs83k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424501; c=relaxed/simple;
	bh=EfaGDe+nUOpdSt8pi7KSMTvsjLRfg5ffBULqssoLNWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0gCzxST0eOxNTf6Kh6uJKP44xFzaoOVwoUd538OB3GJ+yjPd89tCOw2FDgOMSvILfVO0/IEH1vqZXnFboPr3ElKfV6gT+0vzJb0tVDH+NJj2KBHZX7hB5e78z8vDF38aoiOiay0tJZG47odA0iblRArwxzWfGWkQ/kXqDdU7PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZTj1Q+y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZTj1Q+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424500; x=1767960500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EfaGDe+nUOpdSt8pi7KSMTvsjLRfg5ffBULqssoLNWY=;
  b=VZTj1Q+y69ao3YWQH7zqAzzTDlojTHNRrcAMpS6CJ7vIhhX6EDhgpqtw
   9TC9qv8FnWZk+biWxK2hm9FimdFTwxb1U3XFJWR4tzxc6EUpP3aooIWum
   cqDSHJZCVUEJyPpWJGPI56n1snxU4CmERW2A6Uk5j94LYkaBM9rsoS6a1
   AjILHSfCDpijAYGIVaeWiYzh3Ug/9XsyehNzrZsMeluCAqCxqIScn2t4m
   ZhDVU3bCuRez/N52aHWvmhOsYTGiSsDp9Vz3XTtp+dwbAp24SWCYIKb8W
   fgCQA5ueFZWqQ/vmuKJrwnTORG35zO/HN/pByl4Ste2EEGlsSh2/B0cyt
   A==;
X-CSE-ConnectionGUID: lj3fO4wLQgWr89Q+kyAA8w==
X-CSE-MsgGUID: toezZcPITo2lR9p+lwi6hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179576"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179576"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:19 -0800
X-CSE-ConnectionGUID: vdWCFcDHTsyBO3vY77CZyQ==
X-CSE-MsgGUID: i1XiJEHPREySXESFDGml7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710308"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:15 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 04/13] ASoC: Intel: avs: Fix init-config parsing
Date: Thu,  9 Jan 2025 13:22:07 +0100
Message-Id: <20250109122216.3667847-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109122216.3667847-1-cezary.rojewski@intel.com>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

When parsing init configs correct token should be looked up.

Fixes: 1b4217ebbb3e ("ASoC: Intel: avs: Add topology parsing support for initial config")
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 5cda527020c7..d612f20ed989 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1466,7 +1466,7 @@ avs_tplg_path_template_create(struct snd_soc_component *comp, struct avs_tplg *o
 
 static const struct avs_tplg_token_parser mod_init_config_parsers[] = {
 	{
-		.token = AVS_TKN_MOD_INIT_CONFIG_ID_U32,
+		.token = AVS_TKN_INIT_CONFIG_ID_U32,
 		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
 		.offset = offsetof(struct avs_tplg_init_config, id),
 		.parse = avs_parse_word_token,
@@ -1519,7 +1519,7 @@ static int avs_tplg_parse_initial_configs(struct snd_soc_component *comp,
 		esize = le32_to_cpu(tuples->size) + le32_to_cpu(tmp->size);
 
 		ret = parse_dictionary_entries(comp, tuples, esize, config, 1, sizeof(*config),
-					       AVS_TKN_MOD_INIT_CONFIG_ID_U32,
+					       AVS_TKN_INIT_CONFIG_ID_U32,
 					       mod_init_config_parsers,
 					       ARRAY_SIZE(mod_init_config_parsers));
 
-- 
2.25.1


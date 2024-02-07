Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895FE59B73
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 12:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307779; cv=none; b=bmTyTKfXTQQIW2wtnsrMNDAXCJwGzTT+VQlca8YNyUnhDwKI3f4jmdgGQCTdi93ylFQV2jEC0DkvsEWSyWs5dL1XPPy53PlhKlOBDnE+/URDOD/DjaQYRA4tMNoMIO2h2AKPTdFKN7RlMVSzhuDlUjgTU+/LyOWiIx8E1pBAXyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307779; c=relaxed/simple;
	bh=Ko10ZkzkLNKDt3XPWSA4Pl4GxMkRRlKq5pWgyGeCp8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IYsJUlQ8e/nFOi9dhVrUzzFmppFfUcJv7LmogXSZUxs0M9hoHHurQGeqkKboSEjtaHxzGczNrLoULkiYpuf2oNfTqhsI8RFn5Nlb+FF55AcrnmQZb6v6Je46NzcmPh/idlXvIlQC+WMpN2JGcVkefyGKzPyu+BmuhrP6oXmP++k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bT4Jdjdz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bT4Jdjdz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707307772; x=1738843772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ko10ZkzkLNKDt3XPWSA4Pl4GxMkRRlKq5pWgyGeCp8g=;
  b=bT4JdjdzGe5I+jhHYUP8JxWNujYewUAX2ExvTI8UQSvbG9I5nQdmyQXu
   mSDBgG0ABT89OQt6ctUEs7Ors+Vs0tLsPiNdiaVTxLJch9rAKrUGV4mqy
   mCWsLgiljJ/Pp2DRdP1UOVmXE9k/r7QR/4MunfCDetalKsB4byhkHv5P4
   8c95RLXJOSVN2zCe/vLvCd+5daYFtxR2Xup1cvUvT8+kfLK8OHB03kTlr
   6o/TypBokcFvu9rD0aB9juvkvMHJT+OiDRLt+3r2PMJ9LNmU48OiChG08
   Q566Yp66ek+xtUTp2CkICvNV5LkrTUeEcC+xhFYEa4EOZmN8MvBDES5iq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="4757859"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="4757859"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 04:09:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1631810"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 07 Feb 2024 04:09:22 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 3/3] ASoC: Intel: avs: Send initial config to module if present
Date: Wed,  7 Feb 2024 13:09:46 +0100
Message-Id: <20240207120946.2140480-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207120946.2140480-1-amadeuszx.slawinski@linux.intel.com>
References: <20240207120946.2140480-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If there are initial configs to send to module on init do send them.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/path.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 3aa16ee8d34c1..e785fc2a7008f 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -547,6 +547,33 @@ static int avs_path_module_type_create(struct avs_dev *adev, struct avs_path_mod
 	return avs_modext_create(adev, mod);
 }
 
+static int avs_path_module_send_init_configs(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_soc_component *acomp;
+
+	acomp = to_avs_soc_component(mod->template->owner->owner->owner->owner->comp);
+
+	u32 num_ids = mod->template->num_config_ids;
+	u32 *ids = mod->template->config_ids;
+
+	for (int i = 0; i < num_ids; i++) {
+		struct avs_tplg_init_config *config = &acomp->tplg->init_configs[ids[i]];
+		size_t len = config->length;
+		void *data = config->data;
+		u32 param = config->param;
+		int ret;
+
+		ret = avs_ipc_set_large_config(adev, mod->module_id, mod->instance_id,
+					       param, data, len);
+		if (ret) {
+			dev_err(adev->dev, "send initial module config failed: %d\n", ret);
+			return AVS_IPC_RET(ret);
+		}
+	}
+
+	return 0;
+}
+
 static void avs_path_module_free(struct avs_dev *adev, struct avs_path_module *mod)
 {
 	kfree(mod);
@@ -580,6 +607,12 @@ avs_path_module_create(struct avs_dev *adev,
 		return ERR_PTR(ret);
 	}
 
+	ret = avs_path_module_send_init_configs(adev, mod);
+	if (ret) {
+		kfree(mod);
+		return ERR_PTR(ret);
+	}
+
 	return mod;
 }
 
-- 
2.34.1


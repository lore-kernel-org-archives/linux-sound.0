Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B382165E3
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 10:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786860; cv=none; b=PIifVfQ9N8rq7si4mhMYqimYy8t7QgZxF4zEKwWvwCfGjNevODKlIo5e/DQ6bqOiSw4zyfqLWXjOuHkcLo4H5bjC4hfsMvuK3HzlR/zhJzpoq9e+VZv/z0naUCsxVx7gOWKlrDtcBwNYoVFJr5XJiD1mnOkG6bpsM0J9fNcs6fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786860; c=relaxed/simple;
	bh=Z9wYJSdPhi3GkG4catQnHY9r2j1Sf1qWKaNVh/ObkTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sJ24uHni7ZgfUJBcoHLAU7P72tZVUp0k2/FHYdm3Vfph83HWCvIZQEl5K6Qb4FEFR9Rj/q9r6lVrKBcQ+g4vj6HwUA7EMdo7O1K8hawpdPmiNR6uwW+/tyAXjEuoli355upZ81ohebpXm5JIaSfa0YsbNFw/1+0oNgueJNaKum8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ry4Cv1PT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ry4Cv1PT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739786859; x=1771322859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z9wYJSdPhi3GkG4catQnHY9r2j1Sf1qWKaNVh/ObkTQ=;
  b=Ry4Cv1PTHE960qpnshIYCKAvYCyO8rooX4ZMxCqeMKjcMuDHmM6UWgNE
   zDebwBE5u9GEYkk1d3mNFNOt9kr0HPbuGDz7V1vVkKRNPWqRsSuo5mBUI
   dW5ZURzDWzV5jGZZbwPA0EF9S3rC9wezUMbVzWQ/Eadux4GXYMYurZe7i
   gdFTq2IHm/i+d5tOy0RXlmkKIUhAm5S/N/KGH1bGU2EfK7nsV8OX1lZbf
   uAWQRFstx0k0hkNo7kiufJhg0s/MEjTjcIsZAR9vj3TksvpyyiyZmICKj
   TinF/Wdik+eZK2NIe91Yj9uOhcdNCHWgPxsIPZyqv1CzFhGJaW42yYr0S
   Q==;
X-CSE-ConnectionGUID: 4qptTQZRT72HFFQGpu6cAA==
X-CSE-MsgGUID: L1qs54TSTIy3sGIX/B0E7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="65818342"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="65818342"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:07:38 -0800
X-CSE-ConnectionGUID: 7EhWxeYySDq7xwi+i2jZQg==
X-CSE-MsgGUID: 3r7NH+CnQMazvWn+TL96Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118219080"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2025 02:07:37 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 10/10] ASoC: Intel: avs: Support multi-channel PEAKVOL instantiation
Date: Mon, 17 Feb 2025 11:21:15 +0100
Message-Id: <20250217102115.3539427-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217102115.3539427-1-cezary.rojewski@intel.com>
References: <20250217102115.3539427-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PEAKVOL module initialization procedure allows for specifying
default configuration for all individual channels. To reflect that in
the code, first update avs_get_module_control() to allow for selecting
Volume or Mute control based on needs and then apply the settings with
newly added avs_peakvol_set_volume() and avs_peakvol_set_mute().

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 403510494e77..ef0c1d125d66 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -300,7 +300,8 @@ static int avs_whm_create(struct avs_dev *adev, struct avs_path_module *mod)
 	return ret;
 }
 
-static struct avs_control_data *avs_get_module_control(struct avs_path_module *mod)
+static struct soc_mixer_control *avs_get_module_control(struct avs_path_module *mod,
+							const char *name)
 {
 	struct avs_tplg_module *t = mod->template;
 	struct avs_tplg_path_template *path_tmpl;
@@ -316,8 +317,8 @@ static struct avs_control_data *avs_get_module_control(struct avs_path_module *m
 
 		mc = (struct soc_mixer_control *)w->kcontrols[i]->private_value;
 		ctl_data = (struct avs_control_data *)mc->dobj.private;
-		if (ctl_data->id == t->ctl_id)
-			return ctl_data;
+		if (ctl_data->id == t->ctl_id && strstr(w->kcontrols[i]->id.name, name))
+			return mc;
 	}
 
 	return NULL;
@@ -398,17 +399,11 @@ int avs_peakvol_set_mute(struct avs_dev *adev, struct avs_path_module *mod,
 static int avs_peakvol_create(struct avs_dev *adev, struct avs_path_module *mod)
 {
 	struct avs_tplg_module *t = mod->template;
-	struct avs_control_data *ctl_data;
+	struct soc_mixer_control *mc;
 	struct avs_peakvol_cfg *cfg;
-	int volume = S32_MAX;
 	size_t cfg_size;
 	int ret;
 
-	ctl_data = avs_get_module_control(mod);
-	if (ctl_data)
-		volume = ctl_data->values[0];
-
-	/* As 2+ channels controls are unsupported, have a single block for all channels. */
 	cfg_size = struct_size(cfg, vols, 1);
 	if (cfg_size > AVS_MAILBOX_SIZE)
 		return -EINVAL;
@@ -420,15 +415,28 @@ static int avs_peakvol_create(struct avs_dev *adev, struct avs_path_module *mod)
 	cfg->base.obs = t->cfg_base->obs;
 	cfg->base.is_pages = t->cfg_base->is_pages;
 	cfg->base.audio_fmt = *t->in_fmt;
-	cfg->vols[0].target_volume = volume;
 	cfg->vols[0].channel_id = AVS_ALL_CHANNELS_MASK;
+	cfg->vols[0].target_volume = S32_MAX;
 	cfg->vols[0].curve_type = t->cfg_ext->peakvol.curve_type;
 	cfg->vols[0].curve_duration = t->cfg_ext->peakvol.curve_duration;
 
 	ret = avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id, t->core_id,
 				  t->domain, cfg, cfg_size, &mod->instance_id);
+	if (ret)
+		return ret;
 
-	return ret;
+	/* Now configure both VOLUME and MUTE parameters. */
+	mc = avs_get_module_control(mod, "Volume");
+	if (mc) {
+		ret = avs_peakvol_set_volume(adev, mod, mc, NULL);
+		if (ret)
+			return ret;
+	}
+
+	mc = avs_get_module_control(mod, "Switch");
+	if (mc)
+		return avs_peakvol_set_mute(adev, mod, mc, NULL);
+	return 0;
 }
 
 static int avs_updown_mix_create(struct avs_dev *adev, struct avs_path_module *mod)
-- 
2.25.1


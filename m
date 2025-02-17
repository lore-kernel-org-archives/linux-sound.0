Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2D62163BE
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 10:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786849; cv=none; b=PnFUcH/HuIMv77yyLWfgT0Gbo3H0r3AiTXclBkE51zNcwztc2gQEk0TUK6bzY2QxZmy0Q3qcs22lp4eusM5YsFV9uEiP4BigGEMGP0XnpfAJ4OdNPbQBEtNZz+4PZTd953qksWRoMNhGupC273NPBxESue/Vuk+Zknq8BdNDODc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786849; c=relaxed/simple;
	bh=VSFQ1+OqMh45NluE6eD9gJk608lQBlfkAs2964sulyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K1rhztknMabjL0RE3YHw1AFQbfQVbb0/CV/EX3HELyUpN2BcrhEc0PHbcRsjn1NVildy/2zUSJKLEFSyhLy4i4DagMNB13I2c8I6fT7oJRedVcaxnhOIPw9SXbXRS1yjyj9Qd1OS2tcMeq+1blpVN33DQ7L0EPc+C34IVNGGq8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=el+VJeIr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="el+VJeIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739786848; x=1771322848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VSFQ1+OqMh45NluE6eD9gJk608lQBlfkAs2964sulyU=;
  b=el+VJeIrZ7vsVuuY7irCbFyaCnc9gBdDU+bRfErdv5Yq03QvRwUW4LZk
   FbWW4u8Vwc1BD3rLsYrwJ0C1Dj++QeFLNcdszWOml/FJOftga2U2D7CH4
   QbBbLuUMoOoFjQVlNQ1I92+ZJ651XbnLFiqun/OcHybI2mQMhSQP1AqPP
   1fNyk3IBLpom6RCtvP5ev7uwP3plmFpgYQVEhdd0nVgI2rcPwHkhHc8pH
   b7/T9VSbgjyHvHIUrPEsn8EtguirUhEZS6RvZAUVK4bi7/iWELeKgIyPR
   t8JLAOKOjoLDMNs5yAGHK6FWN0w23eVnDD5mgFTkcym7uVtzagascahuD
   Q==;
X-CSE-ConnectionGUID: OULV8zxqSaGN/fuiWZnAlw==
X-CSE-MsgGUID: qoDzyyEvR2iGoJ0+fN8rmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="65818301"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="65818301"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:07:28 -0800
X-CSE-ConnectionGUID: S8KfAmeRRK+H/xtomHwdqA==
X-CSE-MsgGUID: gKKQfMZKRQuoZVX01suA7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118219058"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2025 02:07:26 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 04/10] ASoC: Intel: avs: Add volume control for GAIN module
Date: Mon, 17 Feb 2025 11:21:09 +0100
Message-Id: <20250217102115.3539427-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217102115.3539427-1-cezary.rojewski@intel.com>
References: <20250217102115.3539427-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

The AudioDSP firmware's GAIN module has same initialization payload as
PEAKVOL and user volume setting can be applied up-front. Update existing
code to account for PEAKVOL and GAIN both.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/control.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/control.c b/sound/soc/intel/avs/control.c
index dc7dc45e0a0a..a55723289600 100644
--- a/sound/soc/intel/avs/control.c
+++ b/sound/soc/intel/avs/control.c
@@ -31,8 +31,11 @@ static struct avs_path_module *avs_get_volume_module(struct avs_dev *adev, u32 i
 	list_for_each_entry(path, &adev->path_list, node) {
 		list_for_each_entry(ppl, &path->ppl_list, node) {
 			list_for_each_entry(mod, &ppl->mod_list, node) {
-				if (guid_equal(&mod->template->cfg_ext->type, &AVS_PEAKVOL_MOD_UUID)
-				    && mod->template->ctl_id == id) {
+				guid_t *type = &mod->template->cfg_ext->type;
+
+				if ((guid_equal(type, &AVS_PEAKVOL_MOD_UUID) ||
+				     guid_equal(type, &AVS_GAIN_MOD_UUID)) &&
+				    mod->template->ctl_id == id) {
 					spin_unlock(&adev->path_list_lock);
 					return mod;
 				}
-- 
2.25.1


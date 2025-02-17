Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A525217640
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786845; cv=none; b=NWnPZi92Fr/9cNi0lLB9ThRNLoMOWoLOsGvxuT9nIA8M1iqPBPNPDbUNmkhRw46QstkQLMfGDu+i8xsIGtjADQes4a5z350z4hAfDtFfi+wtnAEQ0N4MgGEUbw8dVMjorGwvLzaAPqF85uKS8mjV1oTAVxsAdspHLfUg9gBaB9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786845; c=relaxed/simple;
	bh=qKrmFCBEgtqtvdzp713AgRbN8E46ev7KL/H1e3DRpTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mvn3r1J+qkAhCSf/j2ujAyLli5gUskRfvbHYEqBnuO+xfZDp5I/ULQRJliYNil3rAzhMOEkig4uJEKVanNIBc0gU2ZI4CPMt674YrD1HcvLpeRDXUUpzby0aCDYqmj62503Yr1ZjNMdBpD1eccmxu/Yum1uNH/I2Cr9dkRXIW0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLNJ0Ewm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLNJ0Ewm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739786844; x=1771322844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qKrmFCBEgtqtvdzp713AgRbN8E46ev7KL/H1e3DRpTw=;
  b=lLNJ0EwmjhHxbGZvN3eKArWiUxYHxNPuLJ1KAVqwW0Y95KMKmS20iL0y
   uG7Z1LI4NBJmXzm7SQkKCkv8wfMKKWowNazuYJKDbFh2Sfny2nvoIfENt
   7jDBshvs6Q3bDoetZup4GeruXpZ+deApzj/9ibpu4whNVOq6I0iPKDGy8
   0WwuLwBTXPKYTfCtwtv2rCDSV6U5axxVDYpVxCebS805VuCiqHmgQDOWs
   acfZEIv5D61yj6kiXyy1gZ2IHYnR8fIS9rSAz3pt0rIaKyekYWb0qYu3w
   HMYCXDsivperKbL3WCqvbpzAHSVqd8W6f84kETxyGPqvnnrZ07pY75uP2
   g==;
X-CSE-ConnectionGUID: w/l78jxHSo2GSZq+nNsG8w==
X-CSE-MsgGUID: x4/ZxWMcSAiqC9KWYBNWxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="65818284"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="65818284"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:07:23 -0800
X-CSE-ConnectionGUID: q6S+kMzZSN+Nyh/dFOCLHA==
X-CSE-MsgGUID: gPGgLni1Qf2tdJ0fuC3Y7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118219049"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2025 02:07:21 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 01/10] ASoC: topology: Create kcontrols based on their type
Date: Mon, 17 Feb 2025 11:21:06 +0100
Message-Id: <20250217102115.3539427-2-cezary.rojewski@intel.com>
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

Fields ->ops.info and ->type of struct snd_soc_tplg_ctl_hdr denote
info-operation type and control type respectively. These are two
different pieces of information. The info type is represented by
SND_SOC_TPLG_CTL_xxx and SND_SOC_TPLG_DAPM_CTL_xxx on UAPI side whereas
for control type it is SND_SOC_TPLG_TYPE_xxx (mixer, bytes or enum).

The type of the kcontrol to be created is currently guessed based on the
value of the ->ops.info. Use the ->type instead to correct and simplify
the code. With this change ops.info() can be customized by sound drivers
utilizing the ASoC-topology just like ops.get() and ops.put() can be.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-topology.c | 54 +++++++++++-----------------------------
 1 file changed, 14 insertions(+), 40 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 9f4da061eff9..921521a84e29 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -220,15 +220,6 @@ static int get_widget_id(int tplg_type)
 	return -EINVAL;
 }
 
-static inline void soc_bind_err(struct soc_tplg *tplg,
-	struct snd_soc_tplg_ctl_hdr *hdr, int index)
-{
-	dev_err(tplg->dev,
-		"ASoC: invalid control type (g,p,i) %d:%d:%d index %d at 0x%lx\n",
-		hdr->ops.get, hdr->ops.put, hdr->ops.info, index,
-		soc_tplg_get_offset(tplg));
-}
-
 static inline void soc_control_err(struct soc_tplg *tplg,
 	struct snd_soc_tplg_ctl_hdr *hdr, const char *name)
 {
@@ -992,35 +983,26 @@ static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
 			return -EINVAL;
 		}
 
-		switch (le32_to_cpu(control_hdr->ops.info)) {
-		case SND_SOC_TPLG_CTL_VOLSW:
-		case SND_SOC_TPLG_CTL_STROBE:
-		case SND_SOC_TPLG_CTL_VOLSW_SX:
-		case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
-		case SND_SOC_TPLG_CTL_RANGE:
-		case SND_SOC_TPLG_DAPM_CTL_VOLSW:
-		case SND_SOC_TPLG_DAPM_CTL_PIN:
+		switch (le32_to_cpu(control_hdr->type)) {
+		case SND_SOC_TPLG_TYPE_MIXER:
 			ret = soc_tplg_dmixer_create(tplg, le32_to_cpu(hdr->payload_size));
 			break;
-		case SND_SOC_TPLG_CTL_ENUM:
-		case SND_SOC_TPLG_CTL_ENUM_VALUE:
-		case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
-		case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
-		case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
+		case SND_SOC_TPLG_TYPE_ENUM:
 			ret = soc_tplg_denum_create(tplg, le32_to_cpu(hdr->payload_size));
 			break;
-		case SND_SOC_TPLG_CTL_BYTES:
+		case SND_SOC_TPLG_TYPE_BYTES:
 			ret = soc_tplg_dbytes_create(tplg, le32_to_cpu(hdr->payload_size));
 			break;
 		default:
-			soc_bind_err(tplg, control_hdr, i);
-			return -EINVAL;
+			ret = -EINVAL;
+			break;
 		}
+
 		if (ret < 0) {
-			dev_err(tplg->dev, "ASoC: invalid control\n");
+			dev_err(tplg->dev, "ASoC: invalid control type: %d, index: %d at 0x%lx\n",
+				control_hdr->type, i, soc_tplg_get_offset(tplg));
 			return ret;
 		}
-
 	}
 
 	return 0;
@@ -1184,13 +1166,9 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 
 	for (i = 0; i < le32_to_cpu(w->num_kcontrols); i++) {
 		control_hdr = (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
-		switch (le32_to_cpu(control_hdr->ops.info)) {
-		case SND_SOC_TPLG_CTL_VOLSW:
-		case SND_SOC_TPLG_CTL_STROBE:
-		case SND_SOC_TPLG_CTL_VOLSW_SX:
-		case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
-		case SND_SOC_TPLG_CTL_RANGE:
-		case SND_SOC_TPLG_DAPM_CTL_VOLSW:
+
+		switch (le32_to_cpu(control_hdr->type)) {
+		case SND_SOC_TPLG_TYPE_MIXER:
 			/* volume mixer */
 			kc[i].index = mixer_count;
 			kcontrol_type[i] = SND_SOC_TPLG_TYPE_MIXER;
@@ -1199,11 +1177,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 			if (ret < 0)
 				goto hdr_err;
 			break;
-		case SND_SOC_TPLG_CTL_ENUM:
-		case SND_SOC_TPLG_CTL_ENUM_VALUE:
-		case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
-		case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
-		case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
+		case SND_SOC_TPLG_TYPE_ENUM:
 			/* enumerated mixer */
 			kc[i].index = enum_count;
 			kcontrol_type[i] = SND_SOC_TPLG_TYPE_ENUM;
@@ -1212,7 +1186,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 			if (ret < 0)
 				goto hdr_err;
 			break;
-		case SND_SOC_TPLG_CTL_BYTES:
+		case SND_SOC_TPLG_TYPE_BYTES:
 			/* bytes control */
 			kc[i].index = bytes_count;
 			kcontrol_type[i] = SND_SOC_TPLG_TYPE_BYTES;
-- 
2.25.1


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A252165E3
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786851; cv=none; b=oVbnJA2FioggKRR95uPO4qIgGiBeDZsJQERPu4JrkXENDN910hW9PPmcrH0IU6KJfEtiXS5jcAy7n95e6hpwC94QX6MrcEh30ed6YDiobwKwNuShkTF1CnLS0Ej3Cx8ppVjI7uf8wKQrc4r+Xg8OwIN/DxsGbRx44HkG78Ny5yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786851; c=relaxed/simple;
	bh=vTRXd0I/aQQjPyyC2HNjH68ASaCkmdRhYjovBkp8O8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XQQuEyoztkMvOrgwQ+OQKuWJ/sf1f2NV5pN50bsrVnG1fLS0d51m69LsBUEj3BN9/bq0mdUAsFR+bwEbnzqSkGFKP88K26u9akvWfNh/SXDauYJOT70CFCsaRD7ZjmCEsCxj9gAnrB7LoKcGi9nINBPdNhQZ3IcPNeKBUXhFqds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iB4nBNz2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iB4nBNz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739786850; x=1771322850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vTRXd0I/aQQjPyyC2HNjH68ASaCkmdRhYjovBkp8O8s=;
  b=iB4nBNz2GpAyZ0P5rKJ95kiEyeDAMTKxx9+FHQrsxM6I3+a6YcbpVzgs
   wWwFdhVo/M8IKZXn2keuJJDhd26gzWroIlgePcWFJ2NFJQbstc3Kq+uO6
   6mISUSfftPoMG5VpEc8maUBMxK4VuGgLffbqQRMI7BVSjo0hyNP+TlhjH
   ymcUCnvybkK3bnka8MOYrO6u0ergbZ7BdVmvssUoJdawezxE2b/bmnbhX
   G/fV7QDzx/VpJESjKtrh0U5pVwFCw7csiXpXJyLFIPkAHKJzhlyzsNbbi
   2X+P6uGjp78NHFkCKax31e85hy7dJPP1R4BA3/y8GvEX74IuXXoFqfEqO
   g==;
X-CSE-ConnectionGUID: PL392DRRTuWJArtoWZAM1g==
X-CSE-MsgGUID: iHnAH+0mTRy/clQW+nlq2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="65818309"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="65818309"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:07:30 -0800
X-CSE-ConnectionGUID: G24sFP+FT6ipufSo7vyW2g==
X-CSE-MsgGUID: EI+icq1dTHCXi5r/HOrqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118219061"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2025 02:07:28 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 05/10] ASoC: Intel: avs: Update VOLUME and add MUTE IPCs
Date: Mon, 17 Feb 2025 11:21:10 +0100
Message-Id: <20250217102115.3539427-6-cezary.rojewski@intel.com>
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

For mute kcontrols to have an effect add IPCs for triggering the mute
operation on the DSP side. On top of basic get/set, an aggregated
variant of the latter is provided for both MUTE and, to already present
VOLUME IPC. It allows for efficient transmission of multiple parameters
at once.

While at it, sort the functions - getters come before setters in the
AudioDSP firmware interface as well as in the kcontrol one.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.c | 111 ++++++++++++++++++++++++++++++---
 sound/soc/intel/avs/messages.h |  24 ++++++-
 2 files changed, 126 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index 242a175381c2..a5ba27983091 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -677,13 +677,6 @@ int avs_ipc_copier_set_sink_format(struct avs_dev *adev, u16 module_id,
 					(u8 *)&cpr_fmt, sizeof(cpr_fmt));
 }
 
-int avs_ipc_peakvol_set_volume(struct avs_dev *adev, u16 module_id, u8 instance_id,
-			       struct avs_volume_cfg *vol)
-{
-	return avs_ipc_set_large_config(adev, module_id, instance_id, AVS_PEAKVOL_VOLUME, (u8 *)vol,
-					sizeof(*vol));
-}
-
 int avs_ipc_peakvol_get_volume(struct avs_dev *adev, u16 module_id, u8 instance_id,
 			       struct avs_volume_cfg **vols, size_t *num_vols)
 {
@@ -706,6 +699,110 @@ int avs_ipc_peakvol_get_volume(struct avs_dev *adev, u16 module_id, u8 instance_
 	return 0;
 }
 
+int avs_ipc_peakvol_set_volume(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			       struct avs_volume_cfg *vol)
+{
+	return avs_ipc_set_large_config(adev, module_id, instance_id, AVS_PEAKVOL_VOLUME,
+					(u8 *)vol, sizeof(*vol));
+}
+
+int avs_ipc_peakvol_set_volumes(struct avs_dev *adev, u16 module_id, u8 instance_id,
+				struct avs_volume_cfg *vols, size_t num_vols)
+{
+	struct avs_tlv *tlv;
+	size_t offset;
+	size_t size;
+	u8 *payload;
+	int ret, i;
+
+	size = num_vols * sizeof(*vols);
+	size += num_vols * sizeof(*tlv);
+	if (size > AVS_MAILBOX_SIZE)
+		return -EINVAL;
+
+	payload = kzalloc(AVS_MAILBOX_SIZE, GFP_KERNEL);
+	if (!payload)
+		return -ENOMEM;
+
+	for (offset = i = 0; i < num_vols; i++) {
+		tlv = (struct avs_tlv *)(payload + offset);
+
+		tlv->type = AVS_PEAKVOL_VOLUME;
+		tlv->length = sizeof(*vols);
+		memcpy(tlv->value, &vols[i], tlv->length);
+
+		offset += sizeof(*tlv) + tlv->length;
+	}
+
+	ret = avs_ipc_set_large_config(adev, module_id, instance_id, AVS_VENDOR_CONFIG, payload,
+				       size);
+	kfree(payload);
+	return ret;
+}
+
+int avs_ipc_peakvol_get_mute(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			     struct avs_mute_cfg **mutes, size_t *num_mutes)
+{
+	size_t payload_size;
+	u8 *payload;
+	int ret;
+
+	ret = avs_ipc_get_large_config(adev, module_id, instance_id, AVS_PEAKVOL_MUTE, NULL, 0,
+				       &payload, &payload_size);
+	if (ret)
+		return ret;
+
+	/* Non-zero payload expected for PEAKVOL_MUTE. */
+	if (!payload_size)
+		return -EREMOTEIO;
+
+	*mutes = (struct avs_mute_cfg *)payload;
+	*num_mutes = payload_size / sizeof(**mutes);
+
+	return 0;
+}
+
+int avs_ipc_peakvol_set_mute(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			     struct avs_mute_cfg *mute)
+{
+	return avs_ipc_set_large_config(adev, module_id, instance_id, AVS_PEAKVOL_MUTE,
+					(u8 *)mute, sizeof(*mute));
+}
+
+int avs_ipc_peakvol_set_mutes(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			      struct avs_mute_cfg *mutes, size_t num_mutes)
+{
+	struct avs_tlv *tlv;
+	size_t offset;
+	size_t size;
+	u8 *payload;
+	int ret, i;
+
+	size = num_mutes * sizeof(*mutes);
+	size += num_mutes * sizeof(*tlv);
+	if (size > AVS_MAILBOX_SIZE)
+		return -EINVAL;
+
+	payload = kzalloc(AVS_MAILBOX_SIZE, GFP_KERNEL);
+	if (!payload)
+		return -ENOMEM;
+
+	for (offset = i = 0; i < num_mutes; i++) {
+		tlv = (struct avs_tlv *)(payload + offset);
+
+		tlv->type = AVS_PEAKVOL_MUTE;
+		tlv->length = sizeof(*mutes);
+		memcpy(tlv->value, &mutes[i], tlv->length);
+
+		offset += sizeof(*tlv) + tlv->length;
+	}
+
+	ret = avs_ipc_set_large_config(adev, module_id, instance_id, AVS_VENDOR_CONFIG, payload,
+				       size);
+	kfree(payload);
+	return ret;
+}
+
 #ifdef CONFIG_DEBUG_FS
 int avs_ipc_set_enable_logs(struct avs_dev *adev, u8 *log_info, size_t size)
 {
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index f44fcfc81de7..2f243802ccc2 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -814,6 +814,15 @@ struct avs_volume_cfg {
 } __packed;
 static_assert(sizeof(struct avs_volume_cfg) == 24);
 
+struct avs_mute_cfg {
+	u32 channel_id;
+	u32 mute;
+	u32 curve_type;
+	u32 reserved; /* alignment */
+	u64 curve_duration;
+} __packed;
+static_assert(sizeof(struct avs_mute_cfg) == 24);
+
 struct avs_peakvol_cfg {
 	struct avs_modcfg_base base;
 	struct avs_volume_cfg vols[];
@@ -896,6 +905,8 @@ static_assert(sizeof(struct avs_whm_cfg) == 108);
 
 /* Module runtime parameters */
 
+#define AVS_VENDOR_CONFIG	0xFF
+
 enum avs_copier_runtime_param {
 	AVS_COPIER_SET_SINK_FORMAT = 2,
 };
@@ -914,6 +925,7 @@ int avs_ipc_copier_set_sink_format(struct avs_dev *adev, u16 module_id,
 
 enum avs_peakvol_runtime_param {
 	AVS_PEAKVOL_VOLUME = 0,
+	AVS_PEAKVOL_MUTE = 3,
 };
 
 enum avs_audio_curve_type {
@@ -921,10 +933,18 @@ enum avs_audio_curve_type {
 	AVS_AUDIO_CURVE_WINDOWS_FADE = 1,
 };
 
-int avs_ipc_peakvol_set_volume(struct avs_dev *adev, u16 module_id, u8 instance_id,
-			       struct avs_volume_cfg *vol);
 int avs_ipc_peakvol_get_volume(struct avs_dev *adev, u16 module_id, u8 instance_id,
 			       struct avs_volume_cfg **vols, size_t *num_vols);
+int avs_ipc_peakvol_set_volume(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			       struct avs_volume_cfg *vol);
+int avs_ipc_peakvol_set_volumes(struct avs_dev *adev, u16 module_id, u8 instance_id,
+				struct avs_volume_cfg *vols, size_t num_vols);
+int avs_ipc_peakvol_get_mute(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			     struct avs_mute_cfg **mutes, size_t *num_mutes);
+int avs_ipc_peakvol_set_mute(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			     struct avs_mute_cfg *mute);
+int avs_ipc_peakvol_set_mutes(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			      struct avs_mute_cfg *mutes, size_t num_mutes);
 
 #define AVS_PROBE_INST_ID	0
 
-- 
2.25.1


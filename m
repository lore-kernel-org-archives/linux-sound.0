Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9BD328243
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864679; cv=none; b=sPj98a6iDABf9NdgP9XhtNwebkpN3MZWn5se8/Lz7xkETD/HXGwIPs7E5rEWbJzoXf5tOwNs1lfpyo72H8fenOdHfZ2jti6EAIxcMqSDpVVXfL99yT7SLqZ5qNO/CZJEDJfE0WXnOIGPvKCshtVmEgpCU3juM1V7IdYJiVBh7n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864679; c=relaxed/simple;
	bh=jgHTpGZpEigDMtmAqAw8hcnALkwhBPdvaljpnSOaL8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EETM+HRgV0do1nlz65zM7CminypnV6oBGUEp3yIrxORw7BTOvLxthy7uxEritXcRVMHrQ+HN//P2cKXVr8w/he8lu5FPmosP9WS9maezy3D7rNgaZVMhibPMbwdAzQIRmpRD3fAyUMv3fPj7tzS0ScaxQ6vzM6cDspnEtasCpcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYi3I/gi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYi3I/gi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762864678; x=1794400678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jgHTpGZpEigDMtmAqAw8hcnALkwhBPdvaljpnSOaL8k=;
  b=jYi3I/giErJHoluH1rckUfe7wmZnggFPJVYj6e+WVlPM2Go6AvSkSsPt
   JvKSjNh26uvsXb2+sFHfN8kQ6JsDtnKzUGKBCIbL797m4lrvfEZFzX1zH
   izq9YqnqVNXnnqho9I6RSI3BLi9q4eIW3z68CVfEcpDnCr1Gv34ox3Mdo
   3GoQ8qqNMghkdsjUdaDxBjE/31roCofXOon6CtdH95QYh1z8V41INGKBG
   yXw2kDhYqL5LzvIk4rOK01A0bpFlVpkfI7Hw/1qQZYt7thF8F4SIeHWIY
   x0KNTb+VG9nthe1y2rBz9HnmiHIoETaERCdpigVUkaLPe1A+XSDK3DWYn
   w==;
X-CSE-ConnectionGUID: eRUjqncVTOOO6bkyWdfa2g==
X-CSE-MsgGUID: 74g9v022TSu72PLRQXYA0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64129482"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="64129482"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:37:58 -0800
X-CSE-ConnectionGUID: rSUWfREsTeqHtGJr3X1how==
X-CSE-MsgGUID: 0wGcjh1YTx2gO/pgSO9Hdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="189217543"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:37:56 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH 4/6] ASoC: Intel: sof_sdw: create BT dai link if bt_link_mask is set
Date: Tue, 11 Nov 2025 20:37:35 +0800
Message-ID: <20251111123737.246626-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111123737.246626-1-yung-chuan.liao@linux.intel.com>
References: <20251111123737.246626-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bt_link_mask value is from NHLT. The BT dai link should be created
if bt_link_mask is set. Besides, hda_machine_select() will look for the
topology with BT BE.

Suggested-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index a7f39b83bef7..cb57c5b3a2dc 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1138,15 +1138,22 @@ static int create_bt_dailinks(struct snd_soc_card *card,
 			      struct snd_soc_dai_link **dai_links, int *be_id)
 {
 	struct device *dev = card->dev;
-	int port = (sof_sdw_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
-			SOF_BT_OFFLOAD_SSP_SHIFT;
-	char *name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
-	char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
+	char *cpu_dai_name;
+	char *name;
+	int port;
+	int ret;
+
+	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
+		port = (sof_sdw_quirk & SOF_BT_OFFLOAD_SSP_MASK) >> SOF_BT_OFFLOAD_SSP_SHIFT;
+	else
+		port = fls(mach->mach_params.bt_link_mask) - 1;
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
+	cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
 	if (!name || !cpu_dai_name)
 		return -ENOMEM;
 
-	int ret;
-
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
 					    1, 1, cpu_dai_name, "dummy",
 					    snd_soc_dummy_dlc.name, snd_soc_dummy_dlc.dai_name,
@@ -1243,7 +1250,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		mach_params->dmic_num = DMIC_DEFAULT_CHANNELS;
 	}
 
-	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
+	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT || mach_params->bt_link_mask)
 		bt_num = 1;
 
 	dev_dbg(dev, "DAI link numbers: sdw %d, ssp %d, dmic %d, hdmi %d, bt: %d\n",
@@ -1298,7 +1305,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_end;
 
 	/* BT */
-	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
+	if (bt_num) {
 		ret = create_bt_dailinks(card, &dai_links, &be_id);
 		if (ret)
 			goto err_end;
-- 
2.43.0


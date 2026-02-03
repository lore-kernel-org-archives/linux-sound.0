Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2180B36C0A6
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 07:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770103464; cv=none; b=qetoiAaer6uMDF5DfqVdn5Mk+rMQx5awLfVNfZgVl40JrJBHXiXw3W4pnLrqnYyRgCA/rioH1IlJMs5+OI9lb75F3ts7r1MACT5LZzYHvvGUy1oeTNypEA5glTe4Dg+XSparT0dtXOBMTSd/2wOrOdJtHV47XbqC98Z5ITplC/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770103464; c=relaxed/simple;
	bh=KtSmuKVJ/W16VPHZF+u5gne9Ldvlrgy9jFXWWBU0SEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kZtfehpVScPbi9uidqqeyOM7VBvcFUH/QLUetr2bRorpj8/k2dvnAO9V1zNfS7zW3o1TRJBtaoqy25FdBMy6INlgFmfPQ2N8ETS6+JiPmf7F/GRt/AOsZo0JgV3rRMaxZMIYxw8zn4f7w+r1V72Sh4NFzlL19QS+6AdwDd9PJ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ip+yA2U3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ip+yA2U3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770103463; x=1801639463;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KtSmuKVJ/W16VPHZF+u5gne9Ldvlrgy9jFXWWBU0SEE=;
  b=Ip+yA2U3prtl8PvYLNCORT5v5C/Va6usG9EtkCv5Ml+fyioez/56oldX
   icXcqOLDdLGvOPPurH2iFvivnBoTroLiDC8bjW4CYMsgKUYl3DfyaBi+a
   CmORFeGi2l3scFrT63IbzM2H+2wQK3qp4+QS4j9TIv9EWocFlkg+XmYAk
   NeCtonc/TdcUUycIXOclCHRveGvXLJDJz/T0W+AtSaOUcAQf+N6053jE/
   ecwFU6wMXgjXOJUcmdyLdRhg9mVVLHguKySpUm1jSG2wjUSKmciIbIFaG
   tyBFY2G42c74QuUSM3g9bpuWHg6J9XdiByoFcP6UECVN09L3Cafzv5WJa
   Q==;
X-CSE-ConnectionGUID: 3Fs9ZIoASXGmER5ceeWyBg==
X-CSE-MsgGUID: 6OOWKiLXRtyBm63V99rFnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58848159"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="58848159"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 23:24:22 -0800
X-CSE-ConnectionGUID: iM7xwi06TF2j30v5Re3U9Q==
X-CSE-MsgGUID: jYNW2H3KR12Pvk9xPix/gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209774156"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 23:24:20 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: use hdev->info.link_mask directly
Date: Tue,  3 Feb 2026 15:24:05 +0800
Message-ID: <20260203072405.3716307-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The link_mask variable is not changed after setting to
hdev->info.link_mask until it is used for another purpose to get the
used SoundWire links and set to mach->mach_params.links. Besides, the
link_mask variable should be reset before any link id is added to the
link_mask. To fix the issue above and avoid confusing, use the
hdev->info.link_mask variable directly to check if the SoundWire link
is enabled.

Fixes: 5226d19d4cae ("ASoC: SOF: Intel: use sof_sdw as default SDW machine driver")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index d88ec66728fd..f1b58b822598 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1304,9 +1304,8 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 	int i;
 
 	hdev = pdata->hw_pdata;
-	link_mask = hdev->info.link_mask;
 
-	if (!link_mask) {
+	if (!hdev->info.link_mask) {
 		dev_info(sdev->dev, "SoundWire links not enabled\n");
 		return NULL;
 	}
@@ -1337,7 +1336,7 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 		 * link_mask supported by hw and then go on searching
 		 * link_adr
 		 */
-		if (~link_mask & mach->link_mask)
+		if (~hdev->info.link_mask & mach->link_mask)
 			continue;
 
 		/* No need to match adr if there is no links defined */
-- 
2.43.0


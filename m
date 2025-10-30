Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE72C333444
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 06:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761807316; cv=none; b=dNDlfaGebJWYnG+wv8FtVRpw2rMPp/m9lS7rG4bXR4psgX87f92l4B2kFkhW7QTYTvjTO4QgmEjeHHcHd55V9Uj/oQAhtmIhj3hyX8Nkydyo8MqFYddjIk8G/EBJej1S0JPZtPHHwMI6Zb2T81NhJdkKTgGexXo2TmKKThW1v1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761807316; c=relaxed/simple;
	bh=tLWkrPvjskGwcbgWZ5gEZLLIqS82dXoxcp+wgT21EdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sBLl4eDCBzCA42EFqonScxSRYGeLKvh4IcUDrhUMpUZdbw53PRtTnTw+3547pr+MxkxrkMekxrWPtZalzZWmMNrHmAJoAYorzZRVLnSSVj3E36xZ3gJi8iQFkq20afZeeJHB1fGBrrlVEn7MQ9rFU8xWqA2GNLW6UGQqbyb6N3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bc900hj+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bc900hj+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761807315; x=1793343315;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tLWkrPvjskGwcbgWZ5gEZLLIqS82dXoxcp+wgT21EdQ=;
  b=Bc900hj+4zI6jRsRLV5uDRjoXYPzR7BRB6cjdRgj/V081lbuW8AEIBji
   7fJor7O41L2kD4akY9edqwdim/qEmNoJchKnVIz28krMtEtpuCY7/M2gv
   hTNeslOSsUAQ4Gs5ciEsagAq3PgLNpfX3QShW8cb6s/+2LIkVTD0FZji3
   Bq+YhL8y9b7T9aqiN1kWF3i1mARj+v6twBqT8kG9I1nTZ5GmzNEfVRBly
   NrA56TGdwYleHI9alGdfydwEJGkJvFhOPQr3GULIN6Wu5cAX/OmR1xZtb
   9XE5RG9AqmzPT5SVvgH6DOWU9KwNH3JaFj10zM/nFc4eGPaNYOItksYaQ
   Q==;
X-CSE-ConnectionGUID: A3yENAvXSbOFi9hQulqLuA==
X-CSE-MsgGUID: mLNYWWBeTXO9MqTQBttqGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="62962650"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="62962650"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:55:14 -0700
X-CSE-ConnectionGUID: I82QGNlqQ/6qV/79zQjbVA==
X-CSE-MsgGUID: sx5WdUP8SnqmuK6C/FNhxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="185529311"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:55:13 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH] ASoC: SOF: Intel: remove hyphen from AMP<index> name_prexix
Date: Thu, 30 Oct 2025 14:55:03 +0800
Message-ID: <20251030065503.1216419-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For those amp with "AMP" name_prefix in the codec_info_list[], use the
AMP<index> format to meet the UCM expectation.

Fixes: 5cd5f8fc29fa ("ASoC: SOF: Intel: add hyphen between name and index to amp name_prefix")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 4a59dd53c569..c1518dbee1b7 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1260,7 +1260,15 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
 								    "AMP", *amp_index);
 			break;
 		}
+	} else if (!strcmp(name_prefix, "AMP")) {
+		adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
+							    name_prefix,
+							    *amp_index);
 	} else {
+		/*
+		 * The name_prefix will be the amp name if it is not "Left" or "AMP", set it to
+		 * <name_prefix>-<amp_index> format. Like rt1320-1
+		 */
 		adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL, "%s-%d",
 							    name_prefix,
 							    *amp_index);
-- 
2.43.0


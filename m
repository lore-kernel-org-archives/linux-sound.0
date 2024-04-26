Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48CE14A60A
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145445; cv=none; b=TfMqEDKO2eBlINaLYaU1XqyimFZ941JnB76zh7D3Kf/zFsUvg42DSRMxPKrIWDSqt5M30UzKjBpDIVkZNptvKA6YaLXUbC292GGyqdZPHv7oefFKISXEESXJXgSz6jhI4tvWz0oHq8kBAetqpd6pdfC9oKmug8jw4gUaWwmxPww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145445; c=relaxed/simple;
	bh=afNPpg7IcB0U1xO1E01+CCTCyRfcQ0s3E68EgzwcE7s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q3e+KoYpwhqBoddK4i88S3itfHE0ad/v1s8Fa06NaE2NUY4O2fVOc1cR0h8GHSYH9F2rROO5c6zXt/t7tVzMtw7bDC/pajQeXXrP2MGzXCEwnI0LPqFnrvsBuj1ZTdPwvcbGkGGplfjVh8Zo6dvlfwbswB4UUu57fLi2yZhxuIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgpddTP8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgpddTP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145444; x=1745681444;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=afNPpg7IcB0U1xO1E01+CCTCyRfcQ0s3E68EgzwcE7s=;
  b=UgpddTP8EMiliXUG9G+UDmZEkXhAyWVUSu7mYuLwcijrv/vayfLZaKxZ
   xuXvifIrQtf9MfneI4Wra0l/BdbqmDQxliAB2s/aZVoWaGvRfpKgxo7Tc
   321cUtxtzWXVNewuC8Uy9rAFAiEGsiztsGrl96p+3cHv5bRR8YqLqPdlR
   mpVwwxcgin4DffQW+JvVTCCYpAtBC2lCjezvweyFFWAFY12MrPcLWgH2o
   BBLU85s0JMX+x9pgQueI7evvbNCs+trrLaXw7rahglcBfokHqlrO732LY
   dIFDTfLihz9e5b7BLZB7q6oiAphmYoyPpzMFXhV6Bk3ZRNirWGh/FAj5u
   A==;
X-CSE-ConnectionGUID: dxe5iYp7QlikIC8EsVYIgA==
X-CSE-MsgGUID: kQzvDWFpT1uTtMJoNMF5zw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9735871"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9735871"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:30:43 -0700
X-CSE-ConnectionGUID: 365IZgBqSfui7v+Dvgp/fw==
X-CSE-MsgGUID: DiKeK3Q4SxCGFfjESkzewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="62929466"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:30:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: da7219-aad: fix usage of device_get_named_child_node()
Date: Fri, 26 Apr 2024 10:30:33 -0500
Message-Id: <20240426153033.38500-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation for device_get_named_child_node() mentions this
important point:

"
The caller is responsible for calling fwnode_handle_put() on the
returned fwnode pointer.
"

Add fwnode_handle_put() to avoid a leaked reference.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/da7219-aad.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index 6bc068cdcbe2..15e5e3eb592b 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -671,8 +671,10 @@ static struct da7219_aad_pdata *da7219_aad_fw_to_pdata(struct device *dev)
 		return NULL;
 
 	aad_pdata = devm_kzalloc(dev, sizeof(*aad_pdata), GFP_KERNEL);
-	if (!aad_pdata)
+	if (!aad_pdata) {
+		fwnode_handle_put(aad_np);
 		return NULL;
+	}
 
 	aad_pdata->irq = i2c->irq;
 
@@ -753,6 +755,8 @@ static struct da7219_aad_pdata *da7219_aad_fw_to_pdata(struct device *dev)
 	else
 		aad_pdata->adc_1bit_rpt = DA7219_AAD_ADC_1BIT_RPT_1;
 
+	fwnode_handle_put(aad_np);
+
 	return aad_pdata;
 }
 
-- 
2.40.1


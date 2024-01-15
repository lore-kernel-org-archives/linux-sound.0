Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA48C2C2
	for <linux-sound@vger.kernel.org>; Mon, 15 Jan 2024 09:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjfSzTst"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705310480; x=1736846480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1CvfkUtJbnvNLxhokgGMJOSdnVq23dy+lml6OzvrKVA=;
  b=MjfSzTstYoZ6Z5bTyftmKX1cnybxuvqiEpNxAlSB5Mt7E6aZ6u63vsza
   kquM4VSpm8YxbxukRrvBYIBvGYv721dRsA86ZxGxW96FBiGqvgUok31gN
   ThvaCNM3NlL9RaQmY1FJmOrHzBCj0aklljmOT6+e8szxADmlV3gQFuq01
   yvNuUtnK/Me58Mgc2DoYeV8Jd88Y0HJV3HTImwGMUq7d39SLo91jJ+KjV
   gLOhhdh8meblejvpKS+lSEbX4Te+s2rFvXWvsjkN06G0LUxUYi4GJMrJ+
   rSK8m35jSrOzuJ8VNsQyH47FcEWtpA8zkrkqhmQP+xf372H4TTD8WEvRB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403332410"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="403332410"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 01:21:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="733250993"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="733250993"
Received: from jofuegbe-mobl.amr.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.54.217])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 01:21:18 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	rander.wang@intel.com
Subject: [PATCH 2/2] ASoC: SOF: ipc4-loader: remove the CPC check warnings
Date: Mon, 15 Jan 2024 11:22:09 +0200
Message-ID: <20240115092209.7184-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115092209.7184-1-peter.ujfalusi@linux.intel.com>
References: <20240115092209.7184-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Warnings related to missing data in firmware manifest have
proven to be too verbose. This relates to description of
DSP module cost expressed in cycles per chunk (CPC). If
a matching value is not found in the manifest, kernel will
pass a zero value and DSP firmware will use a conservative
value in its place.

Downgrade the warnings to dev_dbg().

Fixes: d8a2c9879349 ("ASoC: SOF: ipc4-loader/topology: Query the CPC value from manifest")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index 3539b0a66e1b..c79479afa8d0 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -482,13 +482,10 @@ void sof_ipc4_update_cpc_from_manifest(struct snd_sof_dev *sdev,
 		msg = "No CPC match in the firmware file's manifest";
 
 no_cpc:
-	dev_warn(sdev->dev, "%s (UUID: %pUL): %s (ibs/obs: %u/%u)\n",
-		 fw_module->man4_module_entry.name,
-		 &fw_module->man4_module_entry.uuid, msg, basecfg->ibs,
-		 basecfg->obs);
-	dev_warn_once(sdev->dev, "Please try to update the firmware.\n");
-	dev_warn_once(sdev->dev, "If the issue persists, file a bug at\n");
-	dev_warn_once(sdev->dev, "https://github.com/thesofproject/sof/issues/\n");
+	dev_dbg(sdev->dev, "%s (UUID: %pUL): %s (ibs/obs: %u/%u)\n",
+		fw_module->man4_module_entry.name,
+		&fw_module->man4_module_entry.uuid, msg, basecfg->ibs,
+		basecfg->obs);
 }
 
 const struct sof_ipc_fw_loader_ops ipc4_loader_ops = {
-- 
2.43.0


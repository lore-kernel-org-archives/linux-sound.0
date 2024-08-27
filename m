Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEDA1BC097
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761966; cv=none; b=CSbpUkj3tNM3R2Xl2xU+SkVhsEl6Fz4Hgq4O79IC0eZp9ChOKyLjEeAUd+ZHnfLGeC0uuCrfB0nzMXBXJ26AjDaD44ZiRt5bEl46Vo5P/f3ne6hPxXEPq0BSuj6wcFwKL2NQzpkOOQNhZqjeyGoLn5jGRYgDKY03/LQXCFdPQk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761966; c=relaxed/simple;
	bh=+erI0cZfbAPbte3WK3rAmGM0TnJT/SoElDyA6rCuVSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDx2p/akwk97mly5zPlenDW3wD+t3gNTJNOOusDvGFCyEHvwTiPblrNsgKiSfapb2FP40XYySy8P2ZVu0L66EIouEshORWWNrlPKrEWK0jR7NiXa2fCIA2xOR80V8qppHXuV80s3ds78mbhncE/imqRxhwumtbtTZqiNCGPA3Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2THlJpV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2THlJpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761964; x=1756297964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+erI0cZfbAPbte3WK3rAmGM0TnJT/SoElDyA6rCuVSc=;
  b=a2THlJpVl5ah4qKSrfM/9PnYJi9Bg4DfPaU6Lf2mSFRP4iqrop/vZDEd
   wZIuM2mJ5teMCdYdepR4SHnluGVFXODID0Pe1I2A5PzoRm/eVvYWUstLD
   8KADIPjd8/yp14smylGIvNLRAixFzcWTyHP+NQVSzSwMGjMX/HWEToyzl
   ykMc3rBnmZNr6l/FMnW9FsHfdvt5hfXuaBo1xhIlyykGbDql2FbXuUWoI
   OnLYbnhVBu5qMtPjD1YZCaVS5eRRof6Td/HV+OnlJxj5J7mSDAqD4nnmV
   Nc4LcRBXi1dWoyJdw8DL4njGI9kwnuebMRdHHcgXmcAzdjxmiMHnzv04n
   w==;
X-CSE-ConnectionGUID: p5q54yoSTMC3fq4uJq/zmg==
X-CSE-MsgGUID: 7pmBBucBRImAlUd5R1uOYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235501"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235501"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:44 -0700
X-CSE-ConnectionGUID: aocFy+k0QPyPn0kQrEMzIA==
X-CSE-MsgGUID: +1zbyfXqScexuf+01Teaxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676783"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 06/17] ASoC: Intel: sof_sdw: move ignore_internal_dmic check earlier
Date: Tue, 27 Aug 2024 20:32:04 +0800
Message-ID: <20240827123215.258859-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dmic links will not be created if ctx->ignore_internal_dmic is set, and
dmic_num should be 0 in this case. Move ignore_internal_dmic check
earlier where dmic_num is set to get an accurate dmic_num.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9b642c6883b0..3781a27bfbed 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1102,8 +1102,12 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		hdmi_num = SOF_PRE_TGL_HDMI_COUNT;
 
 	/* enable dmic01 & dmic16k */
-	if (sof_sdw_quirk & SOC_SDW_PCH_DMIC || mach_params->dmic_num)
-		dmic_num = 2;
+	if (sof_sdw_quirk & SOC_SDW_PCH_DMIC || mach_params->dmic_num) {
+		if (ctx->ignore_internal_dmic)
+			dev_warn(dev, "Ignoring PCH DMIC\n");
+		else
+			dmic_num = 2;
+	}
 
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		bt_num = 1;
@@ -1148,14 +1152,10 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	}
 
 	/* dmic */
-	if (dmic_num > 0) {
-		if (ctx->ignore_internal_dmic) {
-			dev_warn(dev, "Ignoring PCH DMIC\n");
-		} else {
-			ret = create_dmic_dailinks(card, &dai_links, &be_id);
-			if (ret)
-				goto err_end;
-		}
+	if (dmic_num) {
+		ret = create_dmic_dailinks(card, &dai_links, &be_id);
+		if (ret)
+			goto err_end;
 	}
 
 	/* HDMI */
-- 
2.43.0


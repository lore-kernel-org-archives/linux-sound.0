Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F2B14C59D
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145143; cv=none; b=qPyO+PMZO8jEYMscf8t8wFcuo1k3euPqTbek0MYDbup8i1GFayty0/WeOx0M7dPpQRuJr3TGIAQdgRac3gHo6G52OAvqZ1kwJi9cocZO2aIWvd0q2fxeGe/CpTQIYFG9lPbdAy62bi+hTwIEiepnOQGW369M8+u5PWoG6Q084u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145143; c=relaxed/simple;
	bh=4wYpaW/veAtO2vwG8e0UooFeD5U0wu5kYAtQpfMg8eQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q5Tn5HDf6YdWjGquRcjwm060wlqg4OgKEmE4Jv5PzFZgbhxrBBt2hQZ8mlXYXEoFuoKDsovjfJSvWeeZ1m2y92pLuY0gdLC1NXWjJBWlyqc0LqoUEK1LfltdGHO+GG+cV8WkRrp0yKwUJ0ekXkEIbXeV+a/nsG/6v7fS6GIzJL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRa/LFx3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRa/LFx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145142; x=1745681142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4wYpaW/veAtO2vwG8e0UooFeD5U0wu5kYAtQpfMg8eQ=;
  b=fRa/LFx3J3IjKiNidyk4BieikJx1RHF0up/cHUmwMVwESDLNM4hP49n8
   4p+W5/+tSM/XBXOtRHZ2mkFDoIo52shAg6pytuYI6dxdIdvTSUZAt12DG
   6tn622mrJ2eoCBVOw1ZYshSUQkJHm0LG8CZh/xWLrmb4EJPQdgXr5iODz
   ZMb5KfoQkfePcYZUP20Ey7gwW2u5ROsW4cX7r5aMCZ/1YjZY0lRmwtKbw
   NudCZyiXald713c5SO7hcbPt6SAnGc39F0nsjJArAHyDPbW3zQ08vZfPS
   QWiEBoZRL8jekGL7UpzwwtEzsbQQfmH/Bek0CioB328VmZyBOSjFuxD7s
   A==;
X-CSE-ConnectionGUID: amhzMUPKS0K4LKOObDspEg==
X-CSE-MsgGUID: 9+bROi9tTmq8x/G9IS2qcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291289"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291289"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:42 -0700
X-CSE-ConnectionGUID: Os5DUSiNSpKi7HJtCfW3yQ==
X-CSE-MsgGUID: cpzlOexZQH2Y5sy5QKMhEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259546"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/23] ASoC: Intel: sof_da7219: support MAX98390 on cml boards
Date: Fri, 26 Apr 2024 10:25:11 -0500
Message-Id: <20240426152529.38345-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

For cml boards, MAX98390 speaker amplifier is supported by machine
driver bxt_da7219_max98357a with sound card name cml_max98390_da7219.
Use same name for backward compatibility with existing devices on
market.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 33 ++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 69555eee7c7a..0abb71a10a72 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -313,6 +313,7 @@ static int audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct sof_card_private *ctx;
+	char *card_name;
 	unsigned long board_quirk = 0;
 	int ret;
 
@@ -332,6 +333,21 @@ static int audio_probe(struct platform_device *pdev)
 	if (board_quirk & SOF_DA7219_CML_BOARD) {
 		/* overwrite the DAI link order for CML boards */
 		ctx->link_order_overwrite = CML_LINK_ORDER;
+
+		/* backward-compatible with existing devices */
+		switch (ctx->amp_type) {
+		case CODEC_MAX98390:
+			card_name = devm_kstrdup(&pdev->dev,
+						 "cml_max98390_da7219",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			card_da7219.name = card_name;
+			break;
+		default:
+			break;
+		}
 	} else if (board_quirk & SOF_DA7219_JSL_BOARD) {
 		ctx->da7219.is_jsl_board = true;
 
@@ -341,13 +357,20 @@ static int audio_probe(struct platform_device *pdev)
 		/* backward-compatible with existing devices */
 		switch (ctx->amp_type) {
 		case CODEC_MAX98360A:
-			card_da7219.name = devm_kstrdup(&pdev->dev,
-							"da7219max98360a",
-							GFP_KERNEL);
+			card_name = devm_kstrdup(&pdev->dev, "da7219max98360a",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			card_da7219.name = card_name;
 			break;
 		case CODEC_MAX98373:
-			card_da7219.name = devm_kstrdup(&pdev->dev, "da7219max",
-							GFP_KERNEL);
+			card_name = devm_kstrdup(&pdev->dev, "da7219max",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			card_da7219.name = card_name;
 			break;
 		default:
 			break;
-- 
2.40.1


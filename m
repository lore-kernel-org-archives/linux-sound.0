Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772EF6AD7
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272472; cv=none; b=M0BaO9Cs0ideDMs7iv6DoSixnzV8C2KrWjPVemY4oe88H8Hvn5TGOdW4vDIJXq7O4VyX8G7ZTxPKb7uGwKTG3L+QiE3he6K0h1/3wlY7rUttCZE/5qgtBKQNl9fUaXOs1SIGT2AZ/8g6m9OSb39wtki3HtSHdskokfvCvZubhBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272472; c=relaxed/simple;
	bh=qo5W3WVaGz8/mgvn8RbZc8l6wDB12RWBBTmmLIzvsBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NU/Ehx0PuF8k0fKY9N76m8Cjl1LINXOyMNrtoBu58vivbgL6O58glv4Y6loBleul3KCkiqgYt/maLO86FUzwsRegbbxO6vQE1ZhokKrWpDaCmEIG+qgqGhuNfG1rgcszHl8yhLt6wtHbWcI+3tUfwPJ901mJB3yFLpaTLSbxy0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDQS70sI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDQS70sI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272472; x=1746808472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qo5W3WVaGz8/mgvn8RbZc8l6wDB12RWBBTmmLIzvsBw=;
  b=LDQS70sII5EBTo93BoixKk+aMswFDEoVUbJBCSBZVyzeofmbu2Ze90A9
   OjXFCeaDHXPW3aePBtmEY6xjICt/wJHqen9+ihe4oY5XMz18k6g9aidlW
   M3MO1JbwJ8aGfUOGVHPGU7Xg4v19PLHu/wNI0qxKc+bmWLxZgP0RXzcVH
   BrstdTYAywm9Z+FtRyCJGnY1d9byZeEjjfGZ54rGhuWUcA5K3smYc4u45
   WOpMTeRIB0MXa1+NtwVkC0ltzSmR1KyS05CK0Vn/JCSBEwwDdORuJZy5I
   ltIqaBUV9SP74BJYNvWfOZZR2w2yFULyyepR51LKlg/sxIeLy7iuTmDUk
   A==;
X-CSE-ConnectionGUID: hiCVpYcSS4m4bNnrmHVn7w==
X-CSE-MsgGUID: VQb8dxZCQKe4VTCPqQFCRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017564"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017564"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:30 -0700
X-CSE-ConnectionGUID: 9J2HQQTmRw6IDBQCOfsGNQ==
X-CSE-MsgGUID: Tp6pM+CnRs6n0Ni+H22edg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33761018"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/18] ASoC: Intel: sof_da7219: use max_98373_dai_link function
Date: Thu,  9 May 2024 11:34:08 -0500
Message-Id: <20240509163418.67746-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Use max_98373_dai_link() function to initialize dai link of maxim
max98373 speaker amplifier. No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index d7b605896f89..886771e9b9d6 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -275,9 +275,8 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 		max_98360a_dai_link(ctx->amp_link);
 		break;
 	case CODEC_MAX98373:
-		ctx->amp_link->codecs = max_98373_components;
-		ctx->amp_link->num_codecs = ARRAY_SIZE(max_98373_components);
-		ctx->amp_link->init = max_98373_spk_codec_init;
+		max_98373_dai_link(dev, ctx->amp_link);
+
 		if (ctx->da7219.is_jsl_board) {
 			ctx->amp_link->ops = &max98373_ops; /* use local ops */
 		} else {
-- 
2.40.1


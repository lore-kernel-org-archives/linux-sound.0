Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFED47A0DD
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322648; cv=none; b=Tr+ZhBrZOd3JB5hsA33038yMmGS2RQlew89qZKv4rvNUC+lKxzig39ZZEejr/9Gt3BGCl3Blf8n8VY8q3aNPma3HyGNlgymPSDsnYnpFC2RTYVMC1ZapQOpBGH43JtymdV25boJgdoyyi4y4afYB+ZnNVUViwD1Z6Hhfc1YvdxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322648; c=relaxed/simple;
	bh=EDkhtJx9AKCrwVxSOm/QnOaFoK1tEnV7nkODS/aBDKM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BYtUnkpLylh75WLqjXGpGsLtcQW4H0pN9Ha6ABDi/XIpIRxk2hmMd879o/bV66hDYTx9DXUWsl8IMslGT/dB1/Tpwq11DaPAd6REzbUNbqHz8dPfVB9jRD/sSWwAhhz2TyGG1VmXUIUwUtSB7Ekz3x9XdyNZFHUj3WxtJg9VF1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldjJxWYE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldjJxWYE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785322647; x=1816858647;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EDkhtJx9AKCrwVxSOm/QnOaFoK1tEnV7nkODS/aBDKM=;
  b=ldjJxWYETIQcJQtRfiVajOklcYW0EXt9HGIWUKlCvu0CpH7tCFPXsmkY
   HXqgH8nAzqh2giCXGMCn0iMmNZP3FFMTLu8r3tprsawRcFxclLoe9LKwP
   P8DVWbWinWiZrCqZJ8dHfcOx/Nbf+ZEF05QfD+exyYPeqj97xmLgupa/B
   1abOSHPWdhzUSRTVLi3BtjRwW7SPrvyNSTSxSvL8MTuyoseDfmtMLZzf4
   /8ilIlWBfE3Sa/CjY1J2n8s1PC1IoCzfBC7JQB03ZXVsmGQpqpd/GnfkV
   81vIPLzyTga83yAET7r5nRsoCmisnahSBvwLOYaFdLroh3g09pnBN9dq9
   A==;
X-CSE-ConnectionGUID: yuFWRxxZSCSbmQtH5Os7sQ==
X-CSE-MsgGUID: HAV5Lrp6TAqs8tzIecPqEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96583869"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="96583869"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:57:27 -0700
X-CSE-ConnectionGUID: Cxse4wZqSfC48VYlBGmXAA==
X-CSE-MsgGUID: LjZ4oOP4Sm2ZtOE2O6+trg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="255676003"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2026 03:57:25 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 8/8] ASoC: Intel: catpt: Streamline control-variables naming
Date: Wed, 29 Jul 2026 13:00:57 +0200
Message-Id: <20260729110057.342447-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729110057.342447-1-cezary.rojewski@intel.com>
References: <20260729110057.342447-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two naming patterns exist currently in the code:
'kcontrol' and 'kctl'. Pick one and stick with it.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 12a5226cf12c..f23c580ba051 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -871,8 +871,7 @@ static int catpt_set_dspvol(struct catpt_dev *cdev, u8 stream_id, long *ctlvol)
 	return CATPT_IPC_RET(ret);
 }
 
-static int catpt_volume_info(struct snd_kcontrol *kcontrol,
-			     struct snd_ctl_elem_info *uinfo)
+static int catpt_volume_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
 {
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = CATPT_CHANNELS_MAX;
-- 
2.34.1


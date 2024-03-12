Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E067A73F
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 16:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710259958; cv=none; b=RZK+3lfmLq+uUi0BlABBTVwyfYVxI99PnLqDj4Sm708o71XbvXNMcZzY0CsF98GK7uuX8fGr0fFwkTtiaH81L9oYXKLC3DcXMB8CyNVNGSvcikZ8wXh0MdAKvdPZJwRb2t4YCcR2x/+cbYllmqjbqmAAVIr24akgrDj4BK8DtiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710259958; c=relaxed/simple;
	bh=LJp6ddIBxKSeMRxJ3S+DBK5ZXqlfGj6rcL3czL4Snfg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G8y7ym8dmOw/V9knJfby5ab3aYtyfCoE8wqXtrB2eD7/ZnVEFNIje9FJoiCC+tHI2O5kREtCG1m29xTbWZpQAL938a/fo6R50pK7gjNSZAwqT1pkMzFgqdSjECZG+zYgBG286OWhoXTJZWxlUDi6naiicfw2mTxY4SgT5Eq22dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XL5pqhPg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XL5pqhPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710259956; x=1741795956;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LJp6ddIBxKSeMRxJ3S+DBK5ZXqlfGj6rcL3czL4Snfg=;
  b=XL5pqhPg4+bET1aORyIRXAlmQkXGVyvwoSSCygJ15S5NWhuWnJswmwSb
   OIQev6FvhRLty6W46lF8PlzZdjPrMXLG5iFb7N4Zp/CnoKG+IHu/jAEu4
   UAKpcdt00Cz9V1C9qG4GOi6CpmXvPFm0g2EhN7MiTMXHSSniI5RsK26UR
   TT5SAv20clyvVek4fmD/GqGINCTODr6CIexi5QxnqMguwcC8ndFdmzF4T
   pG+M7+qGgMkxGLIdJxvFdZ3FqIStCbe4SvrQBcZfruIbXi2bshkmsbcDa
   p2giHuP+yqLJgegidSFl9W8qRhLyUyT6ve+l9PqxPu513YVsIZ4R5SqPa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16379604"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16379604"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 09:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="11493432"
Received: from yinnielx-mobl.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.74.193])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 09:12:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	Gergo Koteles <soyer@irl.hu>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ALSA: hda/tas2781: remove unnecessary runtime_pm calls
Date: Tue, 12 Mar 2024 11:12:17 -0500
Message-Id: <20240312161217.79510-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The runtime_pm handling seems to have been loosely inspired by the
cs32l41 driver, but in this case the get_noresume/put sequence is not
required.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/hda/tas2781_hda_i2c.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 2eb1f9e443c0..4475cea8e9f7 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -796,11 +796,8 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 	pm_runtime_use_autosuspend(tas_hda->dev);
 	pm_runtime_mark_last_busy(tas_hda->dev);
 	pm_runtime_set_active(tas_hda->dev);
-	pm_runtime_get_noresume(tas_hda->dev);
 	pm_runtime_enable(tas_hda->dev);
 
-	pm_runtime_put_autosuspend(tas_hda->dev);
-
 	tas2781_reset(tas_hda->priv);
 
 	ret = component_add(tas_hda->dev, &tas2781_hda_comp_ops);
-- 
2.40.1


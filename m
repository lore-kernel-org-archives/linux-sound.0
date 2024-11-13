Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FAF17C98C
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 06:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731480105; cv=none; b=aLRhNpDoBhfyxqOnUma64lgw7BaShYfEtjshuqQQf0umVyNhWX+KzA93Dv3f0hERB5c9F5IGWJ9twiT79U2TRFZVaKZqMANNm8qZUNPJmNk9mrt4o5pooRcEYL9eDEBwL67tg74fpalCBxufAzguFillp3DJN2q8TR6Xgs9j/n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731480105; c=relaxed/simple;
	bh=8RK9CjKR4R0VLPeK1x5WqzSTdufQn/nlvvJjf5697/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jSUnMlGwiZJxPcFW0Lwjasitp2LAmAkinG9qGwFcGT4sBB1+uIIbpQ2cha/ZA9VFHfa/FDALZNydfMX/9vfoDTnw4DIDsOuzgFnV/HGwRTWOVYdzp7vgQ1JK2FsW8y/amvojQzOh7h9Raj5t2ooSqlCW8HJS5K9JNt2FP9D+u6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3Bko92u; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3Bko92u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731480102; x=1763016102;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8RK9CjKR4R0VLPeK1x5WqzSTdufQn/nlvvJjf5697/s=;
  b=D3Bko92u/WTt40T+/U0ZcB7Qy0/klLK6fky+QLiDM9xrgt9NhTmHEJcE
   D1fMXsFyBngX71IpN6/lh5u89KUdM53jc1tKZYDwl30f1e22O8XYSz5sN
   4gPCdHmiEB0aPKJUjhH7ZJ1iuAx1j3Y6jaUeClTd4RYIuYdfqp+nuhxDT
   WiDUtDEIKRlOxg4bSVqt7O1v2ZsWZ2ylS9IEi3OjsOyEjgm6L7DXH/VKQ
   N1NYad4q9H67ZfGcjUMrdplKE1dnG06+T8MhmBvjeb/QlfaAe+xUr2xy8
   DMtjo1cX8Afg/C177raW9g8oSxX5Kyszdg16ezGHOR7VIeFbewK7NosxI
   A==;
X-CSE-ConnectionGUID: PZfzvVU/SYG8nhvR3SJdKw==
X-CSE-MsgGUID: DQTfmWGbTjm+iY2G3lcOWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30755377"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="30755377"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 22:41:41 -0800
X-CSE-ConnectionGUID: r3Tsubr3RyWp3tQNYK7feQ==
X-CSE-MsgGUID: CuxMMteRQCeodc0fgLDT6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87761486"
Received: from sramkris-mobl1.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.154])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 22:41:42 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: sdca: test adev before calling acpi_dev_for_each_child
Date: Wed, 13 Nov 2024 14:41:33 +0800
Message-ID: <20241113064133.162501-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sdca_lookup_functions may be called by a Peripheral that is not listed
in the ACPI table. Testing adev is required to avoid kernel NULL pointer
dereference.

Fixes: 3a513da1ae33 ("ASoC: SDCA: add initial module")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sdca/sdca_functions.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index a6ad57430dd4..e6e5629c7054 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -165,6 +165,10 @@ void sdca_lookup_functions(struct sdw_slave *slave)
 	struct device *dev = &slave->dev;
 	struct acpi_device *adev = to_acpi_device_node(dev->fwnode);
 
+	if (!adev) {
+		dev_info(dev, "No matching ACPI device found, ignoring peripheral\n");
+		return;
+	}
 	acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
 }
 EXPORT_SYMBOL_NS(sdca_lookup_functions, SND_SOC_SDCA);
-- 
2.43.0


Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C55C182BE
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 08:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707811452; cv=none; b=kwsYP2ZtCNa2kSaQCn750tFSTpf/IoAQy5vsbXQrDn/xYh09I7+pH9e3W/ThrQuwFPj/mftBwGSaUztnZOWoUKLnVeoobrPkty+OuksW8dZMD9h8YtQwvDcMNSVCtahBBT+Q3v+d1Ceh2Jea4v/Emv8msdg6QPiqBiQPer2l5Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707811452; c=relaxed/simple;
	bh=/9iz1st9syDxUPiA5f7oWXMFL2JOLWk87lCGfBxvITc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jZ1SaCWtELGbtmvboTgUhaXC4FfyQfzFSL9Pe0u2rE1wpxbWqKa6A4A9nbg5Hlo1OE7ScGrqDu9I4BAYk02j2llEbvFAG/tPY3iPxjCsvpveTZ4D6ABlhKSien9QifyveCsO46mAdCjKU4SmenQslPaPndJJ22tzi4bmhOI1v34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TufEVttH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TufEVttH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707811451; x=1739347451;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/9iz1st9syDxUPiA5f7oWXMFL2JOLWk87lCGfBxvITc=;
  b=TufEVttHd+baW9jBgimGBa6FGEjElP2bGs7PqIO+o7fVwVctnMp6umn4
   CbqSjbw4Z30SsvLBqXbjtpCQTbDxkChQQCX/25B0Drh75K3JU+Qvq9y6l
   S2jvANKdWXTJ5gdkMuejFi9fP96JDH6PGGJfgGVVgfjpBq+OCLIguqUY7
   HSFn5AjI3M+8vndX52P91Vt2F37Y3taG4zFQPT5Ko0I9FxoEhp9eiKsxI
   4iZ61K3EOd6nrWxda3Lzew/Fg/D5q76EcPeHOLWrzZPMd0ljo8IT9F8zj
   CXAd3gYevUSjcUw05OFHZqDuqrFKwHsg/+I9KSkBxbJ6H3Y4aRLetbsWc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1713096"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1713096"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 00:04:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2804282"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 00:04:09 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: Intel: pci-tgl/lnl: Change default paths for IPC4
Date: Tue, 13 Feb 2024 10:04:16 +0200
Message-ID: <20240213080418.21256-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Align the IPC4 firmware path/name and the topology path to the documentation:
default_fw_path:     intel/sof-ipc4/{platform_name}
default_lib_path:    intel/sof-ipc4-lib/{platform_name}
default_tplg_path:   intel/sof-ipc4-tplg
default_fw_filename: sof-{platform_name}.ri

Tiger Lake and Lunar Lake support is not yet available via the official
firmware release, the paths can be changed now to avoid misalignment in the
future.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: Intel: pci-tgl: Change the default paths and firmware names
  ASoC: SOF: Intel: pci-lnl: Change the topology path to
    intel/sof-ipc4-tplg

 sound/soc/sof/intel/pci-lnl.c |  2 +-
 sound/soc/sof/intel/pci-tgl.c | 64 +++++++++++++++++------------------
 2 files changed, 33 insertions(+), 33 deletions(-)

-- 
2.43.0


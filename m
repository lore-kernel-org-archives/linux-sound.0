Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7261328B4E2
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804066; cv=none; b=cJoqaSOYwQSOZ217X140wCBXRHIsc0fipbfpKDFPHMDCSNjtw7DAsTIK7vBwcUP5oDnuOz4nbw3UPni97Ja6Mryf1phpSVD01ERsymi8EtM7SkL29Bn+jScN6f0FV4RNX51fr5IL3Sn14/AABqfd6JCfooPw/1dMhy8GJf5uyVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804066; c=relaxed/simple;
	bh=njqKJjCfliFosZ9Z1nuUW7Eo8UwEgZz3NVGZozUHivY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DYKnEKt944MPg5fI9MG8jK32iEHVP/kPLxMNJlaFLf+6gkz6Cd62SKMLOoLmTGkYdB5H2xZvswVVQdguh9hTi4p4HhwEMz2oVdnVrLZJ+VqV43ANnQCEoCdzUi8Y48fthEQc+atnfrtkZU6P2QVRKr9LEzyOm8wL8SMwavYqPEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxvN6RyP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxvN6RyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765804064; x=1797340064;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=njqKJjCfliFosZ9Z1nuUW7Eo8UwEgZz3NVGZozUHivY=;
  b=YxvN6RyPmpkdnr+EWj9l/GT1u5rBmVXfHU06GZ41vijAHaYm6q4uOa14
   mdpDPMKSDF8jbxCgUnpVOyfcfkiYyDZUxWymeBSECSh5d/KQT/SdyXD9H
   D809NrqVd2QRlGuIhqJ7qp3GkNplspY7EtYZT7kwjjO3sC/P6uTAq9QQA
   rHyzu1+ot6KnZ9ujg/jaioQvdCi66xGMK+U1bptJPmGFwIPGRe3F7Kq7b
   KvuLu6yIlp0hqb3NXm424g0F98pqPjcyh8+pyqjJQE4wM78IduisoowK6
   bkbm7CeuygLDe4gTZAk+0N/xrnQgLxkv/rrcYxq5YtkQdzYjOjLyAsK2X
   g==;
X-CSE-ConnectionGUID: FR7L6NtoS1W4VOQSKic/EA==
X-CSE-MsgGUID: uoCUdY+iTICtYa1hZ6jmdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85115232"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="85115232"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:07:44 -0800
X-CSE-ConnectionGUID: ru6QJHrUQ+uu2uh4s1nMAg==
X-CSE-MsgGUID: u7TO8bmFTgah+iQiHboqoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="202630437"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:07:41 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH] ASoC: SOF: Intel: pci-mtl: Change the topology path to intel/sof-ipc4-tplg
Date: Mon, 15 Dec 2025 15:08:05 +0200
Message-ID: <20251215130805.31146-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default topology path for IPC4 is intel/sof-ipc4-tplg with a symlink
to it as intel/sof-ace-tplg to support old kernels.
sof-bin has been released in this manner for almost two years now, it is
time to change the default path for MTL family.

Link: https://thesofproject.github.io/latest/getting_started/intel_debug/introduction.html#topology-file
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/pci-mtl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index 7b2533999195..23adc5d765b4 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -47,7 +47,7 @@ static const struct sof_dev_desc mtl_desc = {
 		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/mtl",
 	},
 	.default_tplg_path = {
-		[SOF_IPC_TYPE_4] = "intel/sof-ace-tplg",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
 	},
 	.default_fw_filename = {
 		[SOF_IPC_TYPE_4] = "sof-mtl.ri",
@@ -77,7 +77,7 @@ static const struct sof_dev_desc arl_desc = {
 		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/arl",
 	},
 	.default_tplg_path = {
-		[SOF_IPC_TYPE_4] = "intel/sof-ace-tplg",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
 	},
 	.default_fw_filename = {
 		[SOF_IPC_TYPE_4] = "sof-arl.ri",
@@ -107,7 +107,7 @@ static const struct sof_dev_desc arl_s_desc = {
 		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/arl-s",
 	},
 	.default_tplg_path = {
-		[SOF_IPC_TYPE_4] = "intel/sof-ace-tplg",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
 	},
 	.default_fw_filename = {
 		[SOF_IPC_TYPE_4] = "sof-arl-s.ri",
-- 
2.52.0


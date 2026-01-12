Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C107352C46
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217509; cv=none; b=NXwa7E1DTLXaSevAtaa3yw+J55thca/d5BTwAbw1EyCXQdlDIGG6h4p7Bxks8ipRs70di6rzAygHpW1j8SNRd2LoVgsr6MR9ZDMxE7swnOEpKw1YTeWGysAGQuG6P2LMGhqUBIeyrxEfqF0/1k5IO1NB9pIeJkdhlF+M6kLYwUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217509; c=relaxed/simple;
	bh=epkppI4621IL0s8Ov1ZSOZBemLVz6F0y/pYTi2fiFUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tLmJw2VKfVZl9WGcj+6XsIkSqhR4t8ONS8rkitO6cKwloxeI/pM7T9dCDyJakU5d36aeXIs6QISlFgn1exqmL2eXUfujJPS8SAKp14u/6rXyabl6pNEILtDk7kKs3xt3HAyKVVJtdvrmRBOBYtGjbYsCrgcY80o5IzDcM60rhCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8AF0Yz7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8AF0Yz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768217507; x=1799753507;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=epkppI4621IL0s8Ov1ZSOZBemLVz6F0y/pYTi2fiFUE=;
  b=I8AF0Yz7BT/SB/6msgf/7LxgOP2q3TWUx/xHejb9PGs/iFFy+z1FISwC
   Avuehjp41nXx3NEQg4tCTNoqzQZR6CW6xcDGaHbRoewF6I0ULPWQfXy82
   PgqWTyHsq9nJ2ICzC4piVJaLQharxW7Iyd9pFVoY3q+VQR7r2CWK9LZ6z
   UbrHggsHOKQgmio66pLY2UlYZfJOuFdJOS1RBCLfetgT/XxpeBVv+ic2N
   jB6mP3m20D05+AlhLIN67lb++TUb6ozcQKkXUVo5OSzEj03ALt3CKZzYk
   crJ/8XRWMpjU40mdhx+ClJ17iz84BKUu99I6Kiwbv8O688FX4/8Yd/UBB
   A==;
X-CSE-ConnectionGUID: ejiuVpq8QcGWSUZNesCKPg==
X-CSE-MsgGUID: Fp4eP2zERleJNMP0Ti38hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69539735"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69539735"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:31:46 -0800
X-CSE-ConnectionGUID: C4j8+ATMSb+H2L+BJ2HCVQ==
X-CSE-MsgGUID: WFQfyLMFTTWots7MTFT2Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203224319"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.204])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:31:43 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	guennadi.liakhovetski@linux.intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH 0/4] ASoC: SOF: ipc4: Send heap/stack bytes via new ext_init
Date: Mon, 12 Jan 2026 13:32:17 +0200
Message-ID: <20260112113221.4442-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Add new module init payload (this has already been partly specified in
SOF FW src/include/ipc4/module.h) and use that to pass new topology widget
properties to FW.

The original ext_init payload extension for this is already already
supported by the firmware.

Regards,
Peter
---
Jyri Sarha (4):
  ASoC: sof: ipc4-topology: Add topology tokens domain_in stack &
    heap_bytes
  ASoC: sof: Add domain_id, heap_bytes and stack_bytes to snd_sof_widget
  ASoC: SOF: ipc4: sof_ipc4_module_init_ext_init structs and macros
  ASoC: sof ipc4: Add sof_ipc4_widget_setup_msg_payload() and call it

 include/sound/sof/ipc4/header.h | 75 +++++++++++++++++++++++++++
 include/uapi/sound/sof/tokens.h |  3 ++
 sound/soc/sof/ipc4-topology.c   | 91 +++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.h       |  5 ++
 4 files changed, 174 insertions(+)

-- 
2.52.0


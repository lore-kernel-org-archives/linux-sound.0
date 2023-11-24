Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXW29nmX"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61DC719A6
	for <linux-sound@vger.kernel.org>; Fri, 24 Nov 2023 07:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700838503; x=1732374503;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=foCso91LWcsKZgmNc1lRmkzfnoe8b8XHwcibymER+ME=;
  b=CXW29nmXDiMTgTiiWFr3wHuaUCBjdfRj4oUwNSjkJ+MZwI7g2kB1v+bU
   JdMnhonh2gsDyWsihGGl0twnBR6JnEpbSIAZO0yMXzjl+lJVtgkampOvy
   JyKVbEyNgqiit2CVX1xCm48GdhquVn8X1m4mg56KKoY/STzXfHejdYkKV
   XpoIliD2PhoCHgqw2Q+uDSEYOHyqWfvHm8PhsujW+VuQYu2Zw6QHYi5Bo
   Et8aQu2mxOLemiET5HWR1rYSp5lkKZ+97Vd+EugLTASfMQePqGGLZF4wl
   FOIvizoG6OTPJWL1ooV1iW53w1icUwboja/PwvpsApxsn6LbyWSDSvW2L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377477022"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="377477022"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:08:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="743915673"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="743915673"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:08:20 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 0/4] ASoC: SOF: ipc4: Add support for control change notification
Date: Fri, 24 Nov 2023 17:08:49 +0200
Message-ID: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds support for handling control (switch/enum) change notifications
sent by the firmware.
The use case is similar to what is already used by IPC3 version: the firmware
can update the value of an enum or switch and sends notification to the kernel,
which in turn will notify the user space of a change.

Regards,
Peter
---
Peter Ujfalusi (4):
  ASoC: SOF: ipc4-topology: Helper to find an swidget by module/instance
    id
  ASoC: SOF: ipc4: Add data struct for module notification message from
    firmware
  ASoC: SOF: ipc4-control: Implement control update for switch/enum
    controls
  ASoC: SOF: ipc4: Handle ALSA kcontrol change notification from
    firmware

 include/sound/sof/ipc4/header.h |  29 ++++++
 sound/soc/sof/ipc4-control.c    | 179 ++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h       |   3 +
 sound/soc/sof/ipc4-topology.c   |  20 ++++
 sound/soc/sof/ipc4.c            |  57 ++++++++++
 5 files changed, 288 insertions(+)

-- 
2.42.1


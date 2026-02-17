Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAB3205E26;
	Tue, 17 Feb 2026 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771371358; cv=none; b=qFy3Gf6xUdFy10SKjH6CyhFcNguyIbE2EYRG8Keifk79LUOOUwJyxYYmOGb/CxQbNuqOQqttSuuF+9E0NS/+5DFNaGGc5Oyd4hd4Qu50XDoHbQ5gzO2fedEjtjE21k8Uw/SdFdlhkK++RZkvDrq6qPGYwuAVUaNt/3MrJogp59w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771371358; c=relaxed/simple;
	bh=QpJjtruo52LgvTqkTKjaRaU6hTtSuOUdoez7GydQl70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qxNio2NQMGPVVrYVnKtCwumecfXczr53kDyP50IBiyI4wDSo0HmOg1ATwyQUDTHEQifur2MVsXQTbjlpcQOjsxyF1QJq2o3lHhtFnWkWNbgLFM249QprVAklIhWY8gT0L6U5CaCn0yYHt5pEJw2WWn5zcZmcgHX6cM/zAJz1fb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
From: Cole Leavitt <cole@unwrap.rs>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Cc: pierre-louis.bossart@linux.dev,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	cole@unwrap.rs
Subject: [PATCH 0/2] soundwire: suppress expected unattach warnings during codec reset
Date: Tue, 17 Feb 2026 16:35:31 -0700
Message-ID: <20260217233533.4716-1-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On systems with CS35L56 SoundWire codecs (e.g. Lenovo ThinkPad P16
Gen3), every boot produces misleading dev_warn() messages:

  cs35l56 sdw:0:2:01fa:3556:01:0: Slave 2 state check1: UNATTACHED, status was 1
  cs35l56 sdw:0:2:01fa:3556:01:1: Slave 1 state check1: UNATTACHED, status was 1

These fire when the CS35L56 driver triggers a system reset after
firmware download, which physically detaches the codec from the bus.
This is expected and handled gracefully -- the driver waits for
re-enumeration and the codec recovers within milliseconds.

The warnings were added in commit d1b328557058 ("soundwire: bus: add
dev_warn() messages to track UNATTACHED devices") to debug genuine
attachment failures. They remain valuable for unexpected detachments,
but firing on every boot for normal codec operation degrades their
diagnostic value.

This series adds a simple boolean flag (unattach_pending) to struct
sdw_slave that codec drivers can set before triggering an expected
detach. When set, the bus layer emits dev_dbg() instead of dev_warn()
and auto-clears the flag.

Note: There is also a separate set of UNATTACHED warnings during
initial multi-device enumeration, caused by the known PING frame race
documented in cadence_master.c. That is a different problem with
different constraints and is not addressed here.

Cole Leavitt (2):
  soundwire: bus: downgrade expected unattach warnings to dev_dbg
  ASoC: cs35l56: set unattach_pending before SoundWire system reset

 drivers/soundwire/bus.c       | 9 +++++++--
 include/linux/soundwire/sdw.h | 1 +
 sound/soc/codecs/cs35l56.c    | 4 ++++
 3 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.52.0


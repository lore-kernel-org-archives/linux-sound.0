Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0206B348440
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 17:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707413; cv=none; b=SOLQtMXIvVuTrS2jfqF34DyFFGc4/Hj1nRXtG7mwY6smysuZlUathmgwzGUrkXxJm7A2S6I1EcE5bT3DpvgTIcIpUiVEkJbo9MQ9pBOYS7rPve4Tw/y1wEpCFic+wRp7nbIeX0VGHZT1Laxi/JSvQRmLprcagQ2rZIl4q35c27c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707413; c=relaxed/simple;
	bh=SvH0AoqLQBztfThT9P/LUln8AmuAYBxZPjT9Lgf1hcI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WRIOCHkNwlC7szzPpe5k39Bqf/vypn1zUItDuxQe8TwtpFOn1p5Rp6FprYfgNwgmnocrE/Or9mjybu4gal6TLmVL91QxJvtjNifApj0yw6+rxASeeFtaM5SnSHqKHnKWWwXaJroKOZ/jWAyK8i3yFf6DcjnK4xR9J7oXCDEr9RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bxe51VTn; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bxe51VTn"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769707399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TF8JgnJjP3MwCPu1WCIn/bHY9tGL0Ps0MgNVk/UJcAA=;
	b=bxe51VTne6PAUnEHSsR5xlFrzoUdmewfCiBqJfHClN6TTC/C5hcpEKBTbJyiR4740jI5qQ
	MxMrBgJgXhRJYpMS5E9GHU3/7kmiEu5fRtbO45BdITYMg8gnKIrUvyNpfa9heGvyectkMZ
	fmkCmyfYsikoXQQiLBDSxDIN+ikpfTQ=
From: Sean Anderson <sean.anderson@linux.dev>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>,
	Takashi Iwai <tiwai@suse.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] ASoC: xilinx: xlnx_i2s: Discover parameters from registers
Date: Thu, 29 Jan 2026 12:23:13 -0500
Message-Id: <20260129172315.3871602-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Xilinx helpfully included a read-only "config" register that contains
configuration parameters. Discover our parameters from this register
instead of reading them from the device tree.


Sean Anderson (2):
  dt-bindings: sound: xlnx,i2s: Make discoverable parameters optional
  ASoC: xilinx: xlnx_i2s: Discover parameters from registers

 .../devicetree/bindings/sound/xlnx,i2s.yaml   |  8 ++---
 sound/soc/xilinx/xlnx_i2s.c                   | 32 +++++++------------
 2 files changed, 13 insertions(+), 27 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


Received: from mta1.migadu.com (out-166.mta1.migadu.com [95.215.58.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0163D5227
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 20:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353646; cv=none; b=JMahNgar8tLx6yTN9y/Xxs3bbMHZ9KJs4Mf1ys0grcN2AQdrdKOcl5ZkyE738CXz4hm81jXGhDVQXKEmwG70bzax+ITcjM4MvrXv+TcCoYJ4/c0ge4zlesfg5cEi+Pvj7RYwW5hD6tqEDOUgvtTZGmXe+c9oSNNz8/A44Ny+xJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353646; c=relaxed/simple;
	bh=f7q/ezaXUB2hFLKCf9Th5cEVNpk4qP1pbitPiHm5Two=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gKbhTvzJNh8R6GGbhgtj/LdN+tTn0Q5WIPAE74oUfPcvkmUfBEJDelDNqXWPkV0Ng9U6CqXutBHghYgjkNw+1DlphGSR7Re9+kLr4VjgDqIUmL7ggMm2Bc+bqwNXdr/ROCRtIc102F0lvJEqkRrWZxRHKuRSR6ISCYvwMjUy1L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LaO9RTRd; arc=none smtp.client-ip=95.215.58.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LaO9RTRd"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=f7q/ezaXUB2hFLKCf9Th5cEVNpk4qP1pbitPiHm5Two=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792353641; v=1; x=1792958441;
 b=LaO9RTRdxPnyTEwlhlpTdnaYwAp0xw6P8wgSxTAFMMTvMtTCC7xrhqMQr5cYuESEpLTQAxy7
 rhHhB93X9sOfaimtfxOSf+LingW3hnQvX5UialFGr8aHFcThSleyj+r5kVf8QRfDwxhxxvQAP5a
 FM2OQJcPtgcgMB5q2F1xZVyc=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 27d430874cd37018;
	Sun, 18 Oct 2026 20:00:19 +0000
X-Mizu-Trace-ID: 27d430874cd37018
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: broonie@kernel.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andrey Golovko <andrey.golovko@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Niranjan H Y <niranjan.hy@ti.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Lee Mann <leepaulmann@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ASoC: tas2783-sdw: volume and firmware load fixes
Date: Sun, 18 Oct 2026 13:00:05 -0700
Message-ID: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three tas2783-sdw fixes found while bringing up the ASUS ROG Xbox Ally
X20 [1], whose two TAS2783 amps share a SoundWire link that is powered
off when idle. They don't depend on that series and apply on their own,
but they were tested on the X20 with it applied.

Patch 1 keeps the Amp Volume and Speaker Volume settings in the driver.
The register cache is dropped on every reset, so the controls fail with
-EBUSY while the amp is runtime suspended, and on a link that powers off
when idle a setting is lost on the next wake. It supersedes Lee Mann's
patch for the volume lost across system suspend [2].

Patch 2 loads the firmware synchronously instead of waiting up to three
seconds for an asynchronous callback, which could leave an amp with its
firmware but without its SDCA init writes, or run after an unbind.
Patch 3 then refuses playback, in hw_params and in the port prepare of
a resumed stream, when those init writes failed.

On the X20 the firmware download takes about 1.2 s per amp from cold
and 0.2 s per amp on a wake, when the program RAM is not downloaded
again.

[1] https://lore.kernel.org/r/20261016232416.2628603-1-matthew.schwartz@linux.dev
[2] https://lore.kernel.org/r/20261016102846.22908-1-leepaulmann@gmail.com

Matthew Schwartz (3):
  ASoC: tas2783-sdw: keep the volume settings across resets
  ASoC: tas2783-sdw: load the firmware synchronously
  ASoC: tas2783-sdw: refuse playback when the init writes failed

 sound/soc/codecs/tas2783-sdw.c | 253 ++++++++++++++++++++++++---------
 1 file changed, 188 insertions(+), 65 deletions(-)


base-commit: 2450a9bcd3423612f614ea15ff44966fed189191
-- 
2.56.0


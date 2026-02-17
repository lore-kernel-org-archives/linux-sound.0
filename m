Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AF42D7D47;
	Tue, 17 Feb 2026 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771371358; cv=none; b=bNDqp8omvDvNfHGj6swmtXsoattc6jMJSVBYyhkmqF8fIP09kqb/vuUX8IJKkrPL/ysnQo6rncgNqj/jaZ0I5oZs5swzvV8LkRArXxnOV+RsWLVE1fA+9aRd6OfApH3pnnr0J5sVdDDmBO5laIgazzn8LpwtG79JS6D2EnvC884=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771371358; c=relaxed/simple;
	bh=Z5rLsdcetRawaXfWJMg3rS9yrgIvWSBJ7nau4HA2BVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8ZcbUvpPdsrVajivTVYL1/IfoL0KP9UH3hFWiuJGTgVIhbgEEZ2KNimRIhz9LqcGYB/MLJQlzokOH3L7ydUQJOiJ8HBS0sTkPR9AkKohws3tqqtPME5Dd0W2aNnPEN+OiFhH7TatuVgDkNHt4h80CG+y3fQje9FC7v2fpI4kIo=
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
Subject: [PATCH 2/2] ASoC: cs35l56: set unattach_pending before SoundWire system reset
Date: Tue, 17 Feb 2026 16:35:33 -0700
Message-ID: <20260217233533.4716-3-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260217233533.4716-1-cole@unwrap.rs>
References: <20260217233533.4716-1-cole@unwrap.rs>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CS35L56 driver triggers a system reset after firmware download and
during initial probe when no hardware reset GPIO is available. This
reset physically detaches the codec from the SoundWire bus while the
driver waits for re-enumeration, which is expected and handled
gracefully.

However, the bus layer emits a dev_warn() for this intentional
transition to UNATTACHED because it cannot distinguish expected
detachments from genuine failures. This produces misleading warnings
on every boot for systems with CS35L56 codecs on SoundWire:

  cs35l56 sdw:0:2:01fa:3556:01:0: Slave 2 state check1: UNATTACHED, status was 1
  cs35l56 sdw:0:2:01fa:3556:01:1: Slave 1 state check1: UNATTACHED, status was 1

Set the unattach_pending flag on the SoundWire peripheral before
triggering a system reset in both the firmware patch path and the
initial probe soft reset path. This allows the bus layer to downgrade
the warning to dev_dbg() for these expected transitions.

Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
 sound/soc/codecs/cs35l56.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 2ff8b172b76e..6566350a59c7 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -807,6 +807,8 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 	reinit_completion(&cs35l56->init_completion);
 
 	cs35l56->soft_resetting = true;
+	if (cs35l56->sdw_peripheral)
+		cs35l56->sdw_peripheral->unattach_pending = true;
 	cs35l56_system_reset(&cs35l56->base, !!cs35l56->sdw_peripheral);
 
 	if (cs35l56->sdw_peripheral) {
@@ -1903,6 +1905,8 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 	if (!cs35l56->base.reset_gpio) {
 		dev_dbg(cs35l56->base.dev, "No reset gpio: using soft reset\n");
 		cs35l56->soft_resetting = true;
+		if (cs35l56->sdw_peripheral)
+			cs35l56->sdw_peripheral->unattach_pending = true;
 		cs35l56_system_reset(&cs35l56->base, !!cs35l56->sdw_peripheral);
 		if (cs35l56->sdw_peripheral) {
 			/* Keep alive while we wait for re-enumeration */
-- 
2.52.0


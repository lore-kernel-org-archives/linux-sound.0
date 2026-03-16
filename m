Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AF133A03A
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 19:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.133.245.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773688719; cv=none; b=DERcl9BE1jQC/HgJoILzWMbnXYJG4vJhI8YtAxn14tM3LOES+MnSyEOo0vAZ1ZKZKcCu3Q4on4KxnB9sqS/8XNi0aXd5izkwcyHyXtfExOmp3PcWBczv/pYduj7UCZB0ryl04I/4ehzbg7/H77bW+s4vUB+0gbMgCVNG0P9F1LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773688719; c=relaxed/simple;
	bh=jBFaxbPcLumDJmvk7B4IVWigww+k8VYarEk03GTGXsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=llJXwIxa2H+PTZlDcNBGDDubu8D9f032U3P0WpC94k5KqdDPP9FiAr8uoI9LLi6zL40+WLE8ihmSJyJUdEALK4OcFTMEzgNIL7rdHP+3U9PxbeP3qZ31Cm4vZU3xTzd+gqn1L8qW0S7DaC4gUrbPHvwtuNl1OmJwZY6pLjN2GcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru; spf=pass smtp.mailfrom=nppct.ru; dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b=VB46iteS; arc=none smtp.client-ip=195.133.245.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nppct.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b="VB46iteS"
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 7F2B41C0F8D
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 22:18:30 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1773688709; x=
	1774552710; bh=jBFaxbPcLumDJmvk7B4IVWigww+k8VYarEk03GTGXsQ=; b=V
	B46iteS6WkxLnDzVO6g6NXj/cLrNrhNYClGqSp9GmNST3w2DAfsCdlMxd6ABz/mY
	6jQmtPLDNenLT5cZAugPEyoGd9AzOYdpgJNWbOCfigP80pmQULuMCxS+w/CBNZYb
	GPPa6wZIMIEsLfhM58yQNOVit4v4V3iaNOoIjoMVkI=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hBFC6jwEp7ig for <linux-sound@vger.kernel.org>;
	Mon, 16 Mar 2026 22:18:29 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id BACD21C0EE6;
	Mon, 16 Mar 2026 22:18:28 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Clemens Ladisch <clemens@ladisch.de>
Cc: Alexey Nepomnyashih <sdl@nppct.ru>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: firewire-lib: fix uninitialized local variable
Date: Mon, 16 Mar 2026 19:18:22 +0000
Message-ID: <20260316191824.83249-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to commit d8dc8720468a ("ALSA: firewire-lib: fix uninitialized
local variable"), the local variable `curr_cycle_time` in
process_rx_packets() is declared without initialization.

When the tracepoint event is not probed, the variable may appear to be
used without being initialized. In practice the value is only relevant
when the tracepoint is enabled, however initializing it avoids potential
use of an uninitialized value and improves code safety.

Initialize `curr_cycle_time` to zero.

Fixes: fef4e61b0b76 ("ALSA: firewire-lib: extend tracepoints event including CYCLE_TIME of 1394 OHCI")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---

 sound/firewire/amdtp-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index e97721f80f65..8e70da850fac 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1164,7 +1164,7 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	struct pkt_desc *desc = s->packet_descs_cursor;
 	unsigned int pkt_header_length;
 	unsigned int packets;
-	u32 curr_cycle_time;
+	u32 curr_cycle_time = 0;
 	bool need_hw_irq;
 	int i;
 
-- 
2.43.0


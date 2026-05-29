Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E793E63AA;
	Fri, 29 May 2026 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068269; cv=pass; b=W7Z5XyradQpM1+JmlgXdgeKbRS31bFlEE6vrJ6BrnCmeWrk9V8w/ZQZOd2J6rFKbblU6+NVk0T1HYsMNvhdbuDX3HHDGuXmwFaUPwuS6Bx5JSBB8OgNEICXjL+etrBGzIfvnrWaiYQFPpGkiVMBXuOE6dOsGJfJcASuVvD7JSRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068269; c=relaxed/simple;
	bh=koZll/LcAsYOmGcp0LckoM2j5T+1kiSQyX2+KJDeDWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qdhiWTsiH4XosJWrGr3G5bQ4uvFE5evo/2xxhTWkiSEgdMGzEKq2HaGGwQ2VglXovLDM+j/5lTIrDPS1B3KzFRovKHTqc3uqL1rdhcIqZLjiiMcK0+RcXFuq+XSuy8Ws1DHdXMUmZq4BDUuEVSz+CfFgJ9vw+XelKNr+sPeub40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hartkopp.net; spf=fail smtp.mailfrom=hartkopp.net; dkim=pass (2048-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b=Ujnx24H5; dkim=permerror (0-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b=3Z6Gdu3q; arc=pass smtp.client-ip=85.215.255.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hartkopp.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hartkopp.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b="Ujnx24H5";
	dkim=permerror (0-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b="3Z6Gdu3q"
ARC-Seal: i=1; a=rsa-sha256; t=1780068248; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GdmopT0cp3dhTRWkHoyjokJs0yKoB6PaxxdxixTqxY0Ed0iUwWlYBbUqtyoh6RdeQu
    97tHYutM73aV7fBmzueTcxhoTJCWgPcZwUAd8xM9ptdHcOh6yj9QtUCdKk19rgD1OCIv
    pLQdFvOOIExyWbr7+Jq/V3XVwuJqfGEnma9INDruyWwJE+zwV0HZDOpS2ujhV/11mXht
    uS7HilglTNAk6ljau4ZWESkbdyycUcRh9Yk9IvGme/zTAycZk4QjcNiz4ocr8k5ufrTU
    9WeVweVAnWVPmtVRuPbObv+CTj+Ov2U5E2aoCxVLd25lyQ2ZBItAUK8glT3l41406d0V
    xwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1780068248;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=K5LgLTISGFzUNy5DXthROo0rliO4dSdaFMVPigXZ3Kw=;
    b=EDYEwPllo+To69ZciuAE3smxMEbT6OeZbKjPeDCprcqTPbhuZlya+fMCeKemmHgaud
    DC8u2w9NPRZgh2yvtXy3T5EzHwKWqGdp1DcroQ2MGyNH5DX/ukEV72YShlfPRXETVwQo
    K2//Fubi0Dez+0I0krTRfuZlb2axYNTGSq7wBd3vTNhXpRSVEKTP14MPK3pDaJfxhDnW
    3hkQRJYOP4HDaHbDEon8bjfF59K7avlrkdDpEtoPyk3hlt2Lh2H82imrml/Aqop4QNup
    TSfbBFFstJlolpnIB+3ZWPPQJGTbclRyL8qszqawdd5KF623ikGf4swBCqBAfk8Kb2tb
    Ekuw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1780068248;
    s=strato-dkim-0002; d=hartkopp.net;
    h=Cc:To:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=K5LgLTISGFzUNy5DXthROo0rliO4dSdaFMVPigXZ3Kw=;
    b=Ujnx24H5JjSw1+P7BAyuPOa+6u0ImjoaEIWVbfffdBwJpaU0YpwQW2fJh+/0g2Ehu3
    SUPXdkmPqODsm/xh7ReSnLs/UYe+1ThcisDK+jSMDc2ObC4AiQQO3WEWQOYYc/V9Aq3w
    9LVl7GNmCc+2u9z7pJx4jdEm3zVMq/0bTeaKVw43n0sqlkBQKzILcwP430qkoAJWiT0+
    LuRYaUXfs4I2/HjuNZKodnVeymbhLKoid0GBPp9Kd2NUhuxfrLMfQNxbyWEULL2uFdhQ
    vuo7fB9r+oegxfBPW5BJrt/5zupMNXfj/gLzW6pIdAMrUTE/U47jkNBu+J9dDiPo7p0V
    8gww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1780068248;
    s=strato-dkim-0003; d=hartkopp.net;
    h=Cc:To:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=K5LgLTISGFzUNy5DXthROo0rliO4dSdaFMVPigXZ3Kw=;
    b=3Z6Gdu3qBB9vPr0acAPnwscMjtZVHFV21MXPt3IzqvVYre7k+m/Ce1YVKlur/l4odp
    wQX+TXlNb/LBUqHLO4Aw==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjH4JKvMdQv2tTUsMrZpkO3Mw3lZ/t54cFxeFQ7s0ZDT0tksFSR+Aix0esQJVIAlZEg=="
Received: from [127.0.1.1]
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id Kba96d24TFO7zpD
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 29 May 2026 17:24:07 +0200 (CEST)
From: Oliver Hartkopp <socketcan@hartkopp.net>
Date: Fri, 29 May 2026 17:23:59 +0200
Subject: [PATCH] ALSA: hda: fix Kconfig dependency of HD Audio PCI
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-hda-kconfig-v1-1-4a2c6a0efd56@hartkopp.net>
X-B4-Tracking: v=1; b=H4sIAI6vGWoC/yXMQQ5AMBBA0avIrDWpCsFVxKKdDoakpEUk4u6K5
 Vv8f0EgzxSgSS7wdHDgxUVkaQI4ajeQYBsNSqpSFqoWo9VixsX1PAhNCgtpqjxDC7FYPfV8fre
 2+x12MxFu7wLu+wGVMNOjbwAAAA==
X-Change-ID: 20260529-hda-kconfig-ae2c50b831cd
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Oliver Hartkopp <socketcan@hartkopp.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780068247; l=1499;
 i=socketcan@hartkopp.net; s=20260128; h=from:subject:message-id;
 bh=koZll/LcAsYOmGcp0LckoM2j5T+1kiSQyX2+KJDeDWs=;
 b=2NDWLSdLayGAHAalZvAL9HAk1d0TK8MlAsl7AHfsciyPgTw30Dj0pewsWli7wGZhLgnzqvACV
 mlXPLBjmoTwBxtar+xYh280GJZdS+pbxQh5dAhSSIDm9bF/q5RpN8rY
X-Developer-Key: i=socketcan@hartkopp.net; a=ed25519;
 pk=/gU/7/wBqak3kTsTeFbCCqUi9dnh+1i6ITEkfPj/BvU=

With commit 2d9223d2d64c ("ALSA: hda: Move controller drivers into
sound/hda/controllers directory") the HD Audio drivers have been moved
from linux/sound/pci/hda to linux/sound/hda.

But the Kconfig dependency for SND_HDA_INTEL stayed on SND_PCI instead of
depending on PCI directly. To make the "HD Audio PCI" configuration entry
visible it is currently needed to enable "PCI sound devices" although
no PCI device in the submenu needs to be selected.

Make SND_HDA_INTEL directly depending on hardware/architecture like the
other entries in this Kconfig.

Fixes: 2d9223d2d64c ("ALSA: hda: Move controller drivers into sound/hda/controllers directory")
Signed-off-by: Oliver Hartkopp <socketcan@hartkopp.net>
---
 sound/hda/controllers/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/controllers/Kconfig b/sound/hda/controllers/Kconfig
index 72855f2df451..5d6a77e68588 100644
--- a/sound/hda/controllers/Kconfig
+++ b/sound/hda/controllers/Kconfig
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config SND_HDA_INTEL
 	tristate "HD Audio PCI"
-	depends on SND_PCI
+	depends on PCI
 	select SND_HDA
 	select SND_INTEL_DSP_CONFIG
 	help
 	  Say Y here to include support for Intel "High Definition
 	  Audio" (Azalia) and its compatible devices.

---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260529-hda-kconfig-ae2c50b831cd

Best regards,
--  
Oliver Hartkopp <socketcan@hartkopp.net>


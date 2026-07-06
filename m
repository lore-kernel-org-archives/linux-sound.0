Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FA61A3029;
	Mon,  6 Jul 2026 03:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308441; cv=none; b=Czhy4c126UYAsqaAlhNOr5dR3z6s9OPePkiTBUURUjjzKVINfmjdvHsYvmhEr/sNMJHdH+L6hSyuGG+/QqDp1DhQEorsFjHHv9AttuC3csJsVHyyJo6WriVm8j2Cpaxz85vMUWu/get33E2Iy+olKCZDsPwgoaGzVvXBkWrfq2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308441; c=relaxed/simple;
	bh=JMrooj3PO5vN+326MB1uLo3JMtq8I9oSxrm4pJt09+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKUoQm+1BefFLLi8gkJyJqiCzXRQQQfCI97sl2IcbIHHwdXyA4uocI4fTuWrUmhy/kQsXz2VbauZsnIcsDaioamimT+v21biCTRrBZTTVKhPoNBZSOgPvmT1xSogF3cQET+V7ZnLz1NqSy/ziyFPOMCfQtHhMgX4bIvOsC5PglI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Uu2cRwYP; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Uu2cRwYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2D
	NJ4S80QbsOaJ8COpIKroW6opo35Y+7iofDFR2LhuI=; b=Uu2cRwYPBJlAYM0MLm
	lfv7raCpJPxtt1GI61cA/LG3X8+rh7LhB1fpqBRGnM5xPSFySw9O/p44dR9Rvw7c
	Kk+ywryS8pHQSWxvffd21dxO38DlZ7ftnhGHMOwUY1T3uFDKK5KWxaWhoE8j88Cv
	OaSkn011DBYHwMMBCyaRE+d3E=
Received: from XLL-9950X.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3z_1pIEtqiZloHg--.58754S2;
	Mon, 06 Jul 2026 11:26:38 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Clemens Ladisch <clemens@ladisch.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: firewire: Drop redundant mod_devicetable.h includes
Date: Mon,  6 Jul 2026 12:26:39 +0900
Message-ID: <20260706032639.273929-1-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3z_1pIEtqiZloHg--.58754S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrW3KFy3tFWxJr1DWFWDtwb_yoWrCw4xpF
	s0kF4xJrZ8Jr1UC3W7uF1jkr1kXw1DXr4UAry0g3WDJrnFvwnag392vr9Iqr1ru3yqkF1D
	WFW3JrW8Wrs0grJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UL6pQUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC2w6QiWpLIG5mswAA32

The ALSA FireWire driver headers include <linux/firewire.h>, which
already provides struct ieee1394_device_id via
<linux/device-id/ieee1394.h>.

Drop the now-redundant direct <linux/mod_devicetable.h> includes
from the per-device headers.

Signed-off-by: Longlong Xia <xialonglong2025@163.com>
---
 sound/firewire/bebob/bebob.h         | 1 -
 sound/firewire/dice/dice.h           | 1 -
 sound/firewire/digi00x/digi00x.h     | 1 -
 sound/firewire/fireface/ff.h         | 1 -
 sound/firewire/fireworks/fireworks.h | 1 -
 sound/firewire/motu/motu.h           | 1 -
 sound/firewire/oxfw/oxfw.h           | 1 -
 sound/firewire/tascam/tascam.h       | 1 -
 8 files changed, 8 deletions(-)

diff --git a/sound/firewire/bebob/bebob.h b/sound/firewire/bebob/bebob.h
index 4d73ecb30d79..41e019b9e24e 100644
--- a/sound/firewire/bebob/bebob.h
+++ b/sound/firewire/bebob/bebob.h
@@ -13,7 +13,6 @@
 #include <linux/firewire.h>
 #include <linux/firewire-constants.h>
 #include <linux/module.h>
-#include <linux/mod_devicetable.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/sched/signal.h>
diff --git a/sound/firewire/dice/dice.h b/sound/firewire/dice/dice.h
index 7744ea6a0791..5abae26d2bba 100644
--- a/sound/firewire/dice/dice.h
+++ b/sound/firewire/dice/dice.h
@@ -17,7 +17,6 @@
 #include <linux/firewire-constants.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
-#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
diff --git a/sound/firewire/digi00x/digi00x.h b/sound/firewire/digi00x/digi00x.h
index 82b647d383c5..60d17a6fddd1 100644
--- a/sound/firewire/digi00x/digi00x.h
+++ b/sound/firewire/digi00x/digi00x.h
@@ -12,7 +12,6 @@
 #include <linux/device.h>
 #include <linux/firewire.h>
 #include <linux/module.h>
-#include <linux/mod_devicetable.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/sched/signal.h>
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index 7e42f5778a8a..c9c35c67db27 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -12,7 +12,6 @@
 #include <linux/firewire.h>
 #include <linux/firewire-constants.h>
 #include <linux/module.h>
-#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/compat.h>
diff --git a/sound/firewire/fireworks/fireworks.h b/sound/firewire/fireworks/fireworks.h
index c8d5879efe28..a8aadf754e72 100644
--- a/sound/firewire/fireworks/fireworks.h
+++ b/sound/firewire/fireworks/fireworks.h
@@ -13,7 +13,6 @@
 #include <linux/firewire.h>
 #include <linux/firewire-constants.h>
 #include <linux/module.h>
-#include <linux/mod_devicetable.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/sched/signal.h>
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index c66be0a89ccf..7333a76b50aa 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -12,7 +12,6 @@
 #include <linux/firewire.h>
 #include <linux/firewire-constants.h>
 #include <linux/module.h>
-#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/compat.h>
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index 39ea9a6dde33..aeb83e1595b7 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -9,7 +9,6 @@
 #include <linux/firewire.h>
 #include <linux/firewire-constants.h>
 #include <linux/module.h>
-#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/compat.h>
diff --git a/sound/firewire/tascam/tascam.h b/sound/firewire/tascam/tascam.h
index d07ffcb27be6..9c42c9b48f21 100644
--- a/sound/firewire/tascam/tascam.h
+++ b/sound/firewire/tascam/tascam.h
@@ -12,7 +12,6 @@
 #include <linux/firewire.h>
 #include <linux/firewire-constants.h>
 #include <linux/module.h>
-#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/compat.h>
-- 
2.43.0


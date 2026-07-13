Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEC3345CA8
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 18:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965789; cv=none; b=dEnV/2l9n8dhkGEm9/hjhkC17+shAynUM0oqTIkdzmTk8LKYeUFHOMWTz0B5rVR2KdklZ/p9Db/bxCKByNPcgYbDOBTtGb4y46RcP1BLqQGdlDSCJh7OQUZCIv0fwU7rHHfzVao92XnBAQoccI8EVc+FNwLjuFAA+FIB1YWaVuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965789; c=relaxed/simple;
	bh=r72F4CGw3Iylk5pZ9eZ804rg1QXgg+rKI/6MfPtGX28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQr35DN2dxDJckFZ2dH5Vh5sV+8RTkje04nC+ThfnF5wAhHMeSiTP4eJhEYFBZQ30lx7/dH+T7wKsI8u3K5/rPx6J6BNqN+x7McEWdtAO9eq+5U0byAaSK2uzFCDK17uM6guHbdv/oVbH+mW22jgysqvtgRAy+UYIZJwkN7+Cag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wZQu23C7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wZQu23C7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=GoFRZ8wIgxg0bGVnauZkNrwgpErezfg2g4cPAboahRk=; b=wZQu23C73puZjh2j1pRbXGlmGz
	N2IdUzN/GTVaWiIDp4tr+qrbRwMR1qXiBDnaM1FJzfCSlZowNPdMbgmBys5nu4ioevGZWlmvN0VRU
	CLYtdwxRPbzMyJhUXN3vRS/h5IeW+UcVasYjPgr9YtdZgXkJYX0hnJTKdAk8L3WUCIZEC56egP5oJ
	J3dBz1GZmL2mhaeyL/YKRYxDFoHvxsdpTSS9IysnFO7z3JSaCDAdncpK5IEKoweiva0JBq2vBmrX9
	FPGzf+e0uh8CbAUofN8QOwxy4WjL3/KwJqBTWnf+snHtpgU7qjbqYtQ/eXjfwtF5x73rhQUVdtz0/
	YoUEpErw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKzj-0000000AAVv-0T2H;
	Mon, 13 Jul 2026 18:03:07 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/4] ALSA: usb-audio: um144mkii: use "var" keyword for data
Date: Mon, 13 Jul 2026 11:03:03 -0700
Message-ID: <20260713180303.526409-5-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713180303.526409-1-rdunlap@infradead.org>
References: <20260713180303.526409-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the "var" keyword when describing data definitions to avoid
kernel-doc warnings:

Warning: sound/usb/usx2y/us144mkii_pcm.h:14 cannot understand function prototype: 'const struct snd_pcm_hardware tascam_pcm_hw;'
Warning: sound/usb/usx2y/us144mkii_pcm.h:21 cannot understand function prototype: 'const struct snd_pcm_ops tascam_playback_ops;'
Warning: sound/usb/usx2y/us144mkii_pcm.h:28 cannot understand function prototype: 'const struct snd_pcm_ops tascam_capture_ops;'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>

 sound/usb/usx2y/us144mkii_pcm.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linext-2026-0710.orig/sound/usb/usx2y/us144mkii_pcm.h
+++ linext-2026-0710/sound/usb/usx2y/us144mkii_pcm.h
@@ -7,7 +7,7 @@
 #include "us144mkii.h"
 
 /**
- * tascam_pcm_hw - Hardware capabilities for TASCAM US-144MKII PCM.
+ * var tascam_pcm_hw - Hardware capabilities for TASCAM US-144MKII PCM.
  *
  * Defines the supported PCM formats, rates, channels, and buffer/period sizes
  * for the TASCAM US-144MKII audio interface.
@@ -15,14 +15,14 @@
 extern const struct snd_pcm_hardware tascam_pcm_hw;
 
 /**
- * tascam_playback_ops - ALSA PCM operations for playback.
+ * var tascam_playback_ops - ALSA PCM operations for playback.
  *
  * This structure defines the callback functions for playback stream operations.
  */
 extern const struct snd_pcm_ops tascam_playback_ops;
 
 /**
- * tascam_capture_ops - ALSA PCM operations for capture.
+ * var tascam_capture_ops - ALSA PCM operations for capture.
  *
  * This structure defines the callback functions for capture stream operations.
  */

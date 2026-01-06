Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B224D21773D;
	Tue,  6 Jan 2026 18:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767725996; cv=none; b=klJLJfCEOPixB2uQIB1iFrifRm6ysclBkXPxrEVVywGJOuv8uFOwODXOtYFlPbrv0+jADydWQKjk99YQ45jCSZfa6mZDPfX22TpmKE53geSNeTZWHK99Slsscpn9X02P+xsSDWwEz94JFLainf+nq35vIc3vgxV1qwsCZcJ7YBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767725996; c=relaxed/simple;
	bh=NImc7X1bSmhIiPX4xxkstO6jcsen+PY+FqaGI5K32ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5TQqMPdaHR8NM4tackeaQWFrkzvI146LD7/HNNIcY5+DkBWnlIcqTgBzZc1OOZqVeQoF3hYVeGXrtCfip+/H5EtLM3VZQF8cTfEVlX9QM1G0ensn/K6gWWv4lsqX8CTqmRqYZhGksLLECX4LbAjmwyQAI1bwBvxjVLvhm+b/og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=0oWkUv36; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0oWkUv36"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=KWwu7gzcrT8fPYzVq8+pH93aIYrfm90edSFghDaXqX4=; b=0oWkUv36CVS7YXEqcEUdHkyT8r
	BjuTjO9m6fZJnn2EFZO7efyzrZHMm53ywcVNjScJGuMPiDr+MQKLih13fRqBIGPQAghecH75F9Rvo
	2b5GtBm1i+bwmXC9VUXRkUAuwJh635+NVFv0R84KExipU+m6V5X/yms8jCDDmEJAQy9bzwNjnQ+oL
	d6TlfSfNhAXODmdZ0YG2aLXNbmJGw79zUnmo4kuWq/D7yIveeujBvcqSEONheXJfalWBSnwQtuIJC
	FLsMAgZZXOCQCY8e9PjulRycTnuDvOK31ffzK1y+p5kkyW2/POB0G9KKsC1ym2r7fJA1MX+Duxarc
	ozWI8ppw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdCHY-0000000DjFh-23Du;
	Tue, 06 Jan 2026 18:59:52 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Nikhil Mahale <nmahale@nvidia.com>
Subject: [PATCH] ALSA: hda - fix function names & missing function parameter
Date: Tue,  6 Jan 2026 10:59:51 -0800
Message-ID: <20260106185951.2179242-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the correct function names and add a function parameter description
to avoid kernel-doc warnings:

hda_jack.h:97: warning: Function parameter or struct member 'cb' not
 described in 'snd_hda_jack_detect_enable_callback'
hda_jack.h:97: warning: expecting prototype for snd_hda_jack_detect_enable().
 Prototype was for snd_hda_jack_detect_enable_callback() instead
hda_local.h:441: warning: expecting prototype for _snd_hda_set_pin_ctl().
 Prototype was for snd_hda_set_pin_ctl() instead

Fixes: cdd03cedc5b5 ("ALSA: hda - Introduce snd_hda_set_pin_ctl*() helper functions")
Fixes: 5204a05d70d9 ("ALSA: hda - Add DP-MST jack support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: Nikhil Mahale <nmahale@nvidia.com>

 sound/hda/common/hda_jack.h  |    4 ++--
 sound/hda/common/hda_local.h |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20260105.orig/sound/hda/common/hda_jack.h
+++ linux-next-20260105/sound/hda/common/hda_jack.h
@@ -82,10 +82,10 @@ snd_hda_jack_detect_enable_callback_mst(
 					int dev_id, hda_jack_callback_fn func);
 
 /**
- * snd_hda_jack_detect_enable - enable the jack-detection
+ * snd_hda_jack_detect_enable_callback - enable the jack-detection
  * @codec: the HDA codec
  * @nid: pin NID to enable
- * @func: callback function to register
+ * @cb: callback function to register
  *
  * In the case of error, the return value will be a pointer embedded with
  * errno.  Check and handle the return value appropriately with standard
--- linux-next-20260105.orig/sound/hda/common/hda_local.h
+++ linux-next-20260105/sound/hda/common/hda_local.h
@@ -424,7 +424,7 @@ int _snd_hda_set_pin_ctl(struct hda_code
 			 unsigned int val, bool cached);
 
 /**
- * _snd_hda_set_pin_ctl - Set a pin-control value safely
+ * snd_hda_set_pin_ctl - Set a pin-control value safely
  * @codec: the codec instance
  * @pin: the pin NID to set the control
  * @val: the pin-control value (AC_PINCTL_* bits)

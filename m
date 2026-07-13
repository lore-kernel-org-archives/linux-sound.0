Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ABC34D3A9
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 18:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965789; cv=none; b=BmU50f9LBP6fayKVKakF3JoNvpyfeNArq5RprA10/TO8ktfjR4/Ap89H59mpIcF2snjpYhXn8R6TcCFfwxwiLb7j4gSgeL9dfg9FY3123Bw/Vy1XXbb+moBioYgNAHVLklRFNZYSC5GOw6pqvyRH1CK9a3smfb8B75yB0BMQ8Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965789; c=relaxed/simple;
	bh=ouVwzUOX+9dgOZVEe5fHJI6vPN3m2tyLn6Rps4krpEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jh5GUT9JMuGIY1KUbhPWcb27NQkL/2QvBOHKRP2aAoz9JIoSjQoD3M7/mOtg/CZUFC1nyH14/XB767EsMyNYQWCCOjh0hl1GYnrhkizXLAEZF5QPY+J1LEB2HWui/FlNdFR1sjH2PK/7biVLgKPNvYaDcf1DCoceNohBh7WRAzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bltnlb/b; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bltnlb/b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=XzlTJhm59v9Kev7MnaIFs+z9gdJyy10PBCaMlDAdt/M=; b=bltnlb/bQdc9IU7ARgVtgXjmtp
	qV7p2O3fU2EzTvRCuW5Mgr5ewF5tgg2SA9VvgIlroNmuxXIjvLuENC2I5LeTYaQwbuIhM+Rv7LBm0
	OAzL8Cgxp6WbOOoYAZfzGOS90O3r+GDqNzcj/fe/tBylZdyXBef+95TICuyOKi0dTSFPR2KetAUmv
	g3dNIiq27djQBYw3lKrW3H+dQE2ktLvzLy3MUstz3/XSfvsvfBBrZClfNRpTwlvLKRDSLpSZo8A/8
	z2rZM1titCLyiaKq60uGm6Ztu7kCFTaUhTcAhassi2mKgiCQbs7GHmE3ZWxiaz4LeZIGdLj9M93/5
	lRzPUtzw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKzi-0000000AAVv-1CQI;
	Mon, 13 Jul 2026 18:03:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/4] ALSA: ac97: use struct keyword for kernel-doc comments
Date: Mon, 13 Jul 2026 11:03:00 -0700
Message-ID: <20260713180303.526409-2-rdunlap@infradead.org>
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

Inform kernel-doc that the comment block is for structs to void
warnings:

Warning: include/sound/ac97/codec.h:46 cannot understand function prototype: 'struct ac97_codec_device'
Warning: include/sound/ac97/codec.h:62 cannot understand function prototype: 'struct ac97_codec_driver'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>

 include/sound/ac97/codec.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linext-2026-0710.orig/include/sound/ac97/codec.h
+++ linext-2026-0710/include/sound/ac97/codec.h
@@ -33,7 +33,7 @@ struct ac97_id {
 };
 
 /**
- * ac97_codec_device - a ac97 codec
+ * struct ac97_codec_device - a ac97 codec
  * @dev: the core device
  * @vendor_id: the vendor_id of the codec, as sensed on the AC-link
  * @num: the codec number, 0 is primary, 1 is first slave, etc ...
@@ -53,7 +53,7 @@ struct ac97_codec_device {
 };
 
 /**
- * ac97_codec_driver - a ac97 codec driver
+ * struct ac97_codec_driver - a ac97 codec driver
  * @driver: the device driver structure
  * @probe: the function called when a ac97_codec_device is matched
  * @remove: the function called when the device is unbound/removed

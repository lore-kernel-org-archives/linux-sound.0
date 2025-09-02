Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE74A2E8B68
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828184; cv=none; b=TI3eq6JumWKv+K2f76ObPFBrPop+h1t+616oK5LK89gFdkJU1OTRzamE7fgt+ZCXR4LmwKHK5c/z5h5Xwtt6IXlzdNV5/GfnX9+EB2+SCIOp6DkJT4ssvgtW5wvhJkp+txeKVAoO1GEyTuA9ydJEJOaBF6iwlsdInHZBWXeL1AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828184; c=relaxed/simple;
	bh=GfKvp+lWp4pDl+F4HAi/ffLkDmbqVxkZi9rQVn5iVpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q9QFs5qJpxT5j0zP2YN5duNhcSKnpyzLoRtswymx4aKoqMPjZ+M0YhEVvU7JNDf/kpULxTLoMg4zHatrfhcPMJmr/DdVmUzDSH9sfJvkYS89DFfaoAZj0mTYoCxDVHqdrlRT65jc/obvn13VCqI3METtTrkKoU9Fbq6pg/6fQPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=es/TZHVQ; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="es/TZHVQ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756828179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8x5w68yf3Af8nxe3BL7wYw1TQsHaAxRinJcTtpFvXT0=;
	b=es/TZHVQgvzG8f6T1erx6DDmo4HpoPWny4bktD1QFKblYA5QWlEw2wvSQelfxWRgIPFjB9
	QeEI3tdGUQhBZ2am/Kb/SS6gE+IYwSBYpbzZuGwJatt6PLMOzYfDf1pdS/QsuYKXaE5+z+
	6wA39BitRgzRxuu0AWe2NAQMev1+YgM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vasiliy Kovalev <kovalev@altlinux.org>,
	John Veness <john-linux@pelago.org.uk>,
	bo liu <bo.liu@senarytech.com>,
	Jackie Dong <xy-jackie@139.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Oldherl Oh <me@oldherl.one>,
	=?UTF-8?q?Jaros=C5=82aw=20Janik?= <jaroslaw.janik@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/conexant: Fix typos in comments
Date: Tue,  2 Sep 2025 17:48:41 +0200
Message-ID: <20250902154858.86102-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

s/OPLC/OLPC/

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/hda/codecs/conexant.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index c881bf213ebe..5fcbc1312c69 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -32,7 +32,7 @@ struct conexant_spec {
 
 	unsigned int parse_flags; /* flag for snd_hda_parse_pin_defcfg() */
 
-	/* OPLC XO specific */
+	/* OLPC XO specific */
 	bool recording;
 	bool dc_enable;
 	unsigned int dc_input_bias; /* offset into olpc_xo_dc_bias */
@@ -407,7 +407,7 @@ static void cxt_fixup_headset_mic(struct hda_codec *codec,
 	}
 }
 
-/* OPLC XO 1.5 fixup */
+/* OLPC XO 1.5 fixup */
 
 /* OLPC XO-1.5 supports DC input mode (e.g. for use with analog sensors)
  * through the microphone jack.
-- 
2.51.0


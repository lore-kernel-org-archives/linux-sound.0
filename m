Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ED33793CA
	for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789233667; cv=none; b=sOgr3Skzx4iPul5KAc+MWngjWsK5aZph/TSw78QAZbkbeow6km+S94YYbPVZ6kJTtrmJXlzewz/F46vEPt1LzL9zARDKIbC8+4ZUAPl3/FHp1QVZy1wuWB921ewd2xJzAwjkn6hI4Q1aovIO85UCoTQL75f/M0sbBqIP0qASxsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789233667; c=relaxed/simple;
	bh=vXXGCo/Cvd8orX5ZHIf26NBPMR725nb7AVPQUDI/1eM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PJ6TOL7p6Tha3rxWwePEfeleBiJzh8vAT2h2mZA9kcMWU8ksaTN1yyOeF7WCS9Ws5JaNST/j6hKYVzDhDK4OVqRMhVHZ1yIDO8G7p1K+wLiej6b1IhQ8GcE3rVLui7wl63aEBkx+nZZASxufuYzSxyWMpZ/YDbyCNMgujUCBRro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FA3OWHNt; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FA3OWHNt"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5bso8346201fa.2
        for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789233663; x=1789838463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mebu2RW2U3weGUDhTYy7W+gVJ+9xcUZXKXTexRRpr2s=;
        b=FA3OWHNtuOkj5X5mTwULnmQsqRmI+Gl3u5x93b+Y1+w8mrz79wGwz9KP9AyNvhPV0X
         8AVUlsEIFngLKxvrRwWvqjS5FNGq+w0U+Xhld0d+ER7TfRJ79NsgVzccM2DRfyAeSh52
         5aVzSd2jXjtyRLWMMwcXQm7kvUUKc6x7jMMUljSHWQz0Pjh7leRqU40ZSHX8XkXDGATS
         WWzqMrCilwJ8zkTxwfIHzOSjRzpaFF5KT7F5JUg1zqC22aO/ZSK+LXvb1PeS02TJ8VXj
         GFwfbDRhYQMo2yh4A8zpC4ZYx5VAj0f2M5nL+52b6fIVy8VI8+xmw8YTqI2KjvAlaiez
         Ta4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789233663; x=1789838463;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mebu2RW2U3weGUDhTYy7W+gVJ+9xcUZXKXTexRRpr2s=;
        b=Cy18N8+JRmD+0eYAz8KV4sgvbBPqd9Vd8YjSLOsC7hYpfBxGZRoUJp4YgehveoswYj
         f4HniqlrE7VjZpLeqhA6Xus9GRDxfpWpYWVP3lkXegZklw8OjVwft4gJpmRBkTrhFt4q
         3jNFAROs3kelwm+njWtDXl5IR9mKkw63Q+Fl2OPMI1ZG3dIBHlfBAh5FQFYAvmThdcMt
         a5q3oWaVDjMH8SrhH4IOmYznX674mMPITq1g3kWh74xl0ig6Z+WAHuSEdBHxTFERBEtF
         NOy33TVecKjRx16cG2A3Npn0X0+j88eYDvY177JJhoz7yxFlpvr8phY1Dw3Uqht+BwAL
         Zk9A==
X-Forwarded-Encrypted: i=1; AKwUvBw6JU7z56iYs7xbkWwKQ94OSwgc/BaGsPQS5/nucmTLiH6k4d+pX6t4iWpVooM6bWDQzQpCPdIgBt9yOQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lXxfTzIgxOuXyO1TyirPbGzCFYw/PaO1ez8hZ0thDvkziiAovF
	PWwfeeWVxfktweVI2BSgCdjOBtUn3V0fpMZiff5yFUVNxFlShmmjyEM5
X-Gm-Gg: AYBFou3O0/MIylgHutSqlBeMPQhNGtmPxcclYsRIpF3FmaseGab00ItXRHtpsChO3ce
	krvxsOca5VPm1r4+9VCT9xJDyz8mH7LIVN4vgxQdi6TPZpbnhM7dag5vkYfhYw0KkvWT0dMlK6t
	l3rvOnVEG1sH7KymTeiyc+IOHB3E+WhmAK9MHIuFl9/KWvjenEvdyE6TvYH5Qd6k1CTBYMv43Yr
	epGI5cgpnYO9p5aAwzuN2ELE9WZBxLkaaed9x3Gb3rMs9qVJTXw+dHPusamDLkzr/w16hzOUT5h
	OJb9bli5WRSALHQuTDnl0YOoG97RCzOmv1cBLlTr+adbtOjrTBC/hlJNmdrCD3hB6V2L8/0gnDo
	2VWjoSt2FjSrNHcCEW6EIZM742+d7KMpO+IKsFWEbFdEkbq8NTpljSfwO8mEATw0SO2bKmwpSze
	yhdhWx6ybO+uTd3TCDZzokk6nOKrf8pisaugWKPPRose3HxQqUO5sM7ohO1v3W96NDWt8vgdFbg
	ITF3YL0UvMwNdrD5eiLfO0bhTy9/R/3IqzSY9obAiOc
X-Received: by 2002:a05:6512:33d6:b0:5b0:113d:8ae5 with SMTP id 2adb3069b0e04-5b8a02fa142mr4002643e87.10.1789233662685;
        Sat, 12 Sep 2026 10:21:02 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a03a8009sm1377546e87.7.2026.09.12.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 10:21:02 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tas2783-sdw: stop describing the Latency and XU ID/Version Controls
Date: Sat, 12 Sep 2026 19:29:50 +0300
Message-ID: <20260912163500.8412-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The read-only Control list and tas2783_sdca_mbq_size() still describe the
Latency Control of every Entity - twenty-one registers in all - and the
XU ID and XU Version of the Extension Unit.  The driver never reads any
of them, and the platform firmware seen so far describes exactly one of
the Latencies (FU21, as a DisCo constant) and neither of the two XU
Controls.  XU ID answers COMMAND_IGNORED on the bus in every power
state.

Since commit f4ffa3820949 ("ASoC: tas2783-sdw: do not cache read-only
Controls") they have no defaults and are marked volatile, so every
access goes to the bus.  Remove them from both tables: the driver then
neither declares them readable nor sizes them, and the read-only list is
left with the readings the device actually reports - Clock Valid, the
actual power state, the protection status and the algorithm ready flags.

No functional change for the driver itself, which does not read any of
the removed registers.

Link: https://lore.kernel.org/all/70a91202-e801-4008-bec8-883b229f9f0f@linux.dev/
Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
---
 sound/soc/codecs/tas2783-sdw.c | 53 +++-------------------------------
 1 file changed, 4 insertions(+), 49 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 1d31b3bfb1ad..8dafdc7af129 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -333,7 +333,6 @@ static int tas2783_sdca_mbq_size(struct device *dev, u32 reg)
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU26, 0x11, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_TG23, 0x10, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x01, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x08, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x0a, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x10, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x14, 0):
@@ -419,7 +418,6 @@ static int tas2783_sdca_mbq_size(struct device *dev, u32 reg)
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU127, 0x0b, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU26, 0x0b, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU26, 0x0b, 1):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x07, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x09, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU21, 0x12, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU26, 0x12, 0):
@@ -431,27 +429,8 @@ static int tas2783_sdca_mbq_size(struct device *dev, u32 reg)
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT21, 0x11, 0):
 		return 2;
 
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU23, 0x10, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT21, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT26, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT28, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT29, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT23, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT24, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT25, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT28, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT127, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MU26, 0x06, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU127, 0x10, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU26, 0x10, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x06, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x12, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x13, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU21, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU26, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_SAPU29, 0x05, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x06, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU26, 0x06, 0):
 		return 4;
 
 	default:
@@ -465,47 +444,23 @@ static bool tas2783_readable_register(struct device *dev, unsigned int reg)
 }
 
 /*
- * The read-only SDCA Controls the driver describes: the Latency of every
- * Entity, the Clock Valid of every Clock Source, the actual power state of
- * the Power Domain Entity, the protection status, the algorithm ready flag
- * and the Extension Unit id, version and firmware download status.  None of
- * them is a setting; every one is a reading of device state.
+ * The read-only SDCA Controls the driver describes: the Clock Valid of every
+ * Clock Source, the actual power state of the Power Domain Entity, the
+ * protection status and the algorithm ready flags.  None of them is a
+ * setting; every one is a reading of device state.
  */
 static bool tas2783_read_only_control(unsigned int reg)
 {
 	switch (reg) {
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU21, 0x10, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU23, 0x10, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU26, 0x10, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_XU22, 0x06, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_XU22, 0x07, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_XU22, 0x08, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS24, 0x02, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS21, 0x02, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS25, 0x02, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS26, 0x02, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS28, 0x02, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_PDE23, 0x10, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_UDMPU23, 0x06, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_SAPU29, 0x05, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_SAPU29, 0x11, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_PPU21, 0x06, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_PPU26, 0x06, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_IT21, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_IT29, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_IT26, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_IT28, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT24, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT23, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT25, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT28, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MU26, 0x06, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT127, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU127, 0x10, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS127, 0x02, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU21, 0x08, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU21, 0x04, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU26, 0x08, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU26, 0x04, 0):
 		return true;
 

base-commit: 604ac544390f420332b10738cc10b29a2e91bac8
-- 
2.53.0


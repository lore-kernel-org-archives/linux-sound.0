Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028581;
	b=A+DHQKwvdcqMSa5IcULxRc9ITMUE5ft6y28eB5w39BlnnaYg40LJ4GCHYruN/QDrlxxg
	 33dNG+GyB5BkP08WFxmbRQYngtSYyrxP/JLQpM9c8EOtiuqFrtRMi6Baf+H0CPyDv/zWT
	 2jON+SoS9E6OpzVuBhI1DrCoNIHOSmCiKalm4XSdg5hYhUHh8SVdUy8l3Qr1cCcmJb1UO
	 Uiei4Eg2tXM2cXIuIk72B0ifer5iVqv3vlAixyKiBQocpeI1PG3hEfoR4+wU5LN41Rmhc
	 wa/WgTecJUeL8Ps+SDHbuST+4QxemeOFEWmhjahWgA6/SZ6sdOoSartQWS7vhDVgPYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028581;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fE7VdjAJ8HG88lk20OuuGV2FvNzTYaiGn85G2m9Qh4w=;
	b=ai5HH2cQuQmZmrZS15v64rB6ew6MUa6dE22/RBaSVy/XChHBC6EuVuPbWrzAn4dRda/h
	 S4y5JgF10EJRXGe7H8fwlCE+9rkbL3ypw9mr7t89y/xw5bPT6O5DKlKH8YtWGPjQrs7HV
	 oyb1heBQQ2bA88WvJoMQoRY4AilELUUV9Qczeybm2kmVu4e1sZrJicv3NSRT/X70E1/Oz
	 Jpq8uy9xbb3odQi9J83/mWanGZreBeARq9kTePwivosPtbpY53G9LDJDOY1mSO5jJrsG1
	 eyRa0Y8yPHan9wtA9v1d5ifaBbcPWUWJgbL43gOyKDQwL0XeK8o7nutJD3IvoBnzySA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=oadRs9Nk;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB71606A32A
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB71606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=oadRs9Nk
X-Virus-Scanned: by amavisd-new using ClamAV (21)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028579;
	bh=fE7VdjAJ8HG88lk20OuuGV2FvNzTYaiGn85G2m9Qh4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oadRs9NkfAv+qMjbzmEmp/Jq1Eldm1RWIqHO6R/wO85Mm0dj7WVflF+4NzG96veBa
	 M+9JU1DccyEbbREbgK8WrCrLMN32bn1pYP5MD8QI5rBABxklZtJpY0WMixcDNKR4o5
	 a5Cpe1f4ced71aAfqama9nRGiwYgrStstjflYMqleCwzI0BqWD97MGqmpHThS5XLy6
	 z8O4N9EhPOZJGKU0HagZxqltgj9goQbOMR8CoG5YXFavviE/fY33sBitLUVk7W3twc
	 jshyAX8bkcnI2jy2gH3dAj76T/30MElniMlWHNjmiQfvxxk4yCCTjD23s8dJRox1Hy
	 hIQ7jFCeFpclg==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id A7F941BE909;
	Wed, 18 Nov 2026 20:02:59 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 05/22] ASoC: codecs: rt700: Remove orphaned declarations from rt700.h
Date: Wed, 18 Nov 2026 20:02:02 +0100
Message-ID: <20261118190219.316811-6-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118190219.316811-1-amade@asmblr.net>
References: <20261118190219.316811-1-amade@asmblr.net>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rt700_runtime_pm and rt700_jack_detect() are not defined anywhere in the
tree. Remove their orphaned declarations from rt700.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/rt700.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/rt700.h b/sound/soc/codecs/rt700.h
index 491774d207de..10d5b6fdb937 100644
--- a/sound/soc/codecs/rt700.h
+++ b/sound/soc/codecs/rt700.h
@@ -8,8 +8,6 @@
 #ifndef __RT700_H__
 #define __RT700_H__
 
-extern const struct dev_pm_ops rt700_runtime_pm;
-
 struct  rt700_priv {
 	struct snd_soc_component *component;
 	struct regmap *regmap;
@@ -166,6 +164,5 @@ int rt700_io_init(struct device *dev, struct sdw_slave *slave);
 int rt700_init(struct device *dev, struct regmap *sdw_regmap,
 	       struct regmap *regmap, struct sdw_slave *slave);
 
-int rt700_jack_detect(struct rt700_priv *rt700, bool *hp, bool *mic);
 int rt700_clock_config(struct device *dev);
 #endif /* __RT700_H__ */
-- 
2.56.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028598;
	b=1z88D+3aGe12AzVMNAfBf/Vlk9FdIwjuQbXGNctu0O6PBlvFLRtrLUKoQZIvswA9a7Pz
	 /46XhJttQcncsB6yU1uNn7zpSju6uuaSaGHDZt9ESDLS85ZTCS7o9L8I025zYn08klPBQ
	 aVd8H29YXoRZ2Ek8NhkITDUfpse7/Eim7PwsUbYZluPLuURNr96PBipp16opGpJYjMeke
	 3NhdPHTPOsZ/YWR9Rx9uow0uULmcbAeaR9f7Qyi1XSHTwch0jD/MqrSliYPq9kB/8l5ak
	 F2L84i714Y4CIo9ILrPAxHETYj9Wfcf1RSMA4lTj7UnHKssuWGlizyQK21Xukj8oJ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028598;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mm9QaFbKIKikZiRWS8vSCD6OPVeoUmKjFL8nCMrRDYo=;
	b=GxbexnY0FOxhw1hXS0sswZotWwBistbQsBirdYgpZyMcVuwVH/xnxZjdenIjb+9q5yxB
	 wB1cFGIZcLYPNPOlX71z3qKn60BYhTmnuNylTqcn6Bs9vWSOi+vvNsmv9YeAtNYcbzRzw
	 6X/wURV1hY1feOjZCW6Wh3jII38gDrbbx4uBpbQYOIqiGmPwSWlB5bm6rp+Vwu8SLOAgJ
	 qe/5c2a6VB7XDn7TyMVU82BcE78tAvGVrCWv72n9AEbW9af+YxYOOH7tfE0SOqUDqwMVv
	 KL1f4Kze5a/bT3IDOHdaV+kPX4sUc5O/9JcfqMTe5eyB9tPq7pLSBVaCFddbV4Huh7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=scXBejnd;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C99606A32A
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C99606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=scXBejnd
X-Virus-Scanned: by amavisd-new using ClamAV (25)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028596;
	bh=mm9QaFbKIKikZiRWS8vSCD6OPVeoUmKjFL8nCMrRDYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=scXBejndyaiaUtcpJcEjb9nkoZgJBXDRg4AIhMf1un9GjMWLNLODa3W46l0CvHz+L
	 QMThQ7JiDT+u+eSDzofPI0hfS8Kz0lBeFoFRdzEksi0EkRWhHyiuz3Sei4wsgWRtJN
	 s14i5zlY5dagijELQUeDJXgspIgTWpVlsUEfN8VEefr7EIJP5iYzZTyXungGYDyGp/
	 WmuJ2yg7gAwIgKVNEL5xG6EgIr6PE6FztH5llfm2AfHsqpwLK/bPDa1YEh6ZFNz0eM
	 nBHg4o9W9QxOb0UPaCGdVXFCmE2IAXmVCZeYacesvlpkOs0YiziJ4SZBEBFQJ1XUiw
	 N1hSn5faCoegg==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 74BEB1BE521;
	Wed, 18 Nov 2026 20:03:16 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 08/22] ASoC: rt712-sdca: Remove orphaned rt712_sdca_jack_detect() prototype
Date: Wed, 18 Nov 2026 20:02:05 +0100
Message-ID: <20261118190219.316811-9-amade@asmblr.net>
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

rt712_sdca_jack_detect() is not defined anywhere in the tree. Remove its
orphaned function prototype from rt712-sdca.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/rt712-sdca.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt712-sdca.h b/sound/soc/codecs/rt712-sdca.h
index 7e6ee21c8a17..80c50bf2dc90 100644
--- a/sound/soc/codecs/rt712-sdca.h
+++ b/sound/soc/codecs/rt712-sdca.h
@@ -282,5 +282,4 @@ int rt712_sdca_io_init(struct device *dev, struct sdw_slave *slave);
 int rt712_sdca_init(struct device *dev, struct regmap *regmap,
 			struct regmap *mbq_regmap, struct sdw_slave *slave);
 
-int rt712_sdca_jack_detect(struct rt712_sdca_priv *rt712, bool *hp, bool *mic);
 #endif /* __RT712_H__ */
-- 
2.56.1


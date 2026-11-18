Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028655;
	b=MukdBCNbG8FGtHX/oEauiHS2wknhkQqgrBpS7ousrLPfben6PpoDaqU2iN8s8xdn1K9r
	 808vI25fXs1LQm9E9uAail/Kk4XZyWQLkrFvr9Q6E6RYmJ2qCYipo7jWtyBV8b14SJhEC
	 WHRDGV//eDI43NvLVS10J+ohi1oMtHdXTOW2cDkrZ7GIxYqSccN2Rze/uzW5MdvWXJY17
	 370Lj5wbXVFmULs3WcEqDhrrR0sspM+egE195ewDycSOu8HqfprZi4sd/72+pHWcMmajy
	 JaSxADBcTE6yjzURH7D1tXOxXiy3Pb5aWd0MXrFrpH5JDcfVGhUKad+gDMXpjEgXsuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028655;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2abqccefKWRQHOkcV1smKypUk13BYB6mjKmssqVa6Jc=;
	b=i4KbRtV6XSadFfo7F5qUC9SoLK5yPYiYjOD0WqiVAu4jJIf7WF/atic7U1i+aVYVZVU6
	 cF6+g7wngVE8yLgnJwEnLPQKVwiijKG/ArOKQ8suI9EbiCL4BJJP6udVJGx0ecI/2yYGU
	 w6BJAHxk4giQrdJCD3EbxTDTUAPCafW59gRzpfu8Sn3aDlT4rGmGDN1hQqcIYg40H8iN/
	 g2KwPN+kDoUK5v95D4qcmn4jE+kjWGqokr362PBtT1559+Fn75QGNCVxIa3rqXeoYfnjQ
	 9c1mOvaAPTQ0I1Rvmo6kzXT7ZHS2KwigMvZJl1ZvhOun0P8AeWV5+EvuUij/EM9k2yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=cm4iHs+9;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79033606A32C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79033606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=cm4iHs+9
X-Virus-Scanned: by amavisd-new using ClamAV (28)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028652;
	bh=2abqccefKWRQHOkcV1smKypUk13BYB6mjKmssqVa6Jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cm4iHs+9S5RS40r16ambp5WhhiHdrwNRkCdNIAGpIywgpn3KcrqjT0soNUUgv+AvX
	 Jq4XKA1nPvfXbykLNL9Nr/rFwVL1PajVx+/C8XW6nc1RBVmGbh3IPWfDiXXu++nQ+P
	 ChUVThDRXuGH90TD7mcD/6T/KY6h0DGs+xSCxqKgG2wF0/4UeV776oKYgrrNZLJYxt
	 3HRM2ZcWvwAWr8y25cPpsFGFwkriwXMSV1jHnE6KjJCSvITjiNpzLjmwwWX/ZTmb9B
	 4F7C+NwJ5wzbdAOcToWcIDjUClzM5CHdHau9ZMZo0QujOJX2KfA0Sm5eS/H8cP+YOR
	 QI2HtYLBSCtAw==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 604DA1BDF70;
	Wed, 18 Nov 2026 20:04:12 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 18/22] ASoC: mediatek: mt8196: Remove orphaned mt8196_dai_set_priv() prototype
Date: Wed, 18 Nov 2026 20:02:15 +0100
Message-ID: <20261118190219.316811-19-amade@asmblr.net>
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

mt8196_dai_set_priv() was declared in mt8196-afe-common.h when the
header was added, but was never implemented. Remove the orphaned
prototype.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/mediatek/mt8196/mt8196-afe-common.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-common.h b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
index 4951a6f32abb..83310f55cb39 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-common.h
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
@@ -199,7 +199,5 @@ struct mt8196_afe_private {
 int mt8196_dai_adda_register(struct mtk_base_afe *afe);
 int mt8196_dai_i2s_register(struct mtk_base_afe *afe);
 int mt8196_dai_tdm_register(struct mtk_base_afe *afe);
-int mt8196_dai_set_priv(struct mtk_base_afe *afe, int id,
-			int priv_size, const void *priv_data);
 
 #endif
-- 
2.56.1


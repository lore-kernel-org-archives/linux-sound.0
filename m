Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028649;
	b=tsN2y6Qzw60Lt0WoGMFEE7jlDpWN+xBOh2USYiL4pjV22CFA2VNaAZ8DaYsb11wpasL8
	 qI3ElnmyiDT/HIm8PWgu7xuX/NQ3enK5PGMA0MdqtXd7MRMjtPaC8KrbaaTxKa+POjNU4
	 ACdgdTXvIwV5GqNGeIAhUTi7tiqwj/F/IuElOVKxw6oXfSF4I4C2h6yPdXZBfOg+n2O4Q
	 LcVmBYNC2ex+dgo3KFt6IZnbwderMK2wK/Sc/lm5t35wG15XB/Zv1ZACmmK1zrPi5mAdH
	 Bc3NBmXCkUBwWcbqXRHWQtLcovdDSoytC2zJ48xCp86THD75JcrFrjDI8PO6wQzgUQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028649;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NahAt//3CCEdNCnRd891uXOX/giRcGXh+SVrLMlqasQ=;
	b=cYbd4SpFL2mNLxToUABxlqA3ht+AC6lhNFDwi6ogaESI4OhdQyj0fZvzdyE30YfhM5Gy
	 QNmyWuIe6TX8KeK23PH94TX6iS6gJvxmtAFT4iYrB+IKczPelVFFpKgxBfnSbd2bxwwpL
	 sLcfbgjvJs+vrem/29yz5/rUqRaWtNVpIHp9fDBvlH7Ci+m/+9hGW7KK5vA5ZVeIl3Mv8
	 VcSHO4lzE66d3U9/9J3+UCWPv/y8E6SOcShvEMCuqgCswtKi3IU08y8gjiP4TigdgSvXy
	 yLRamWihx6M2TRazXUJBHngo42gPA7Q3fJVRHG3lPIfBE9YUKMvFrJAGf7KJX97XRNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=uC7SGBol;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04873606A33B
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04873606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=uC7SGBol
X-Virus-Scanned: by amavisd-new using ClamAV (4)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028646;
	bh=NahAt//3CCEdNCnRd891uXOX/giRcGXh+SVrLMlqasQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uC7SGBolpdNNg6SFe6KxBfXT0m8bW6u1Z7XMaIU17AhGqzz+SHYonwalLst6hGo3s
	 Rsq5G9FehYvM9Saae0R8+Cjb+8z1FU4EadDs3r8YHskkFtBc2I8KvxTLy/HdfAIpU5
	 klgEqzTJh7tbHqqtC7dufvalIQ4Rnd0h3avHR4WgVbxWH2QbwS3vZUl/0Joeyy8not
	 nvSRnokIFS3HyOj2hFCXXqy8Zfckip7dSPZTmoIHBBLOG9HJ3mE+mVfzR9CbCKCMUG
	 cSMGKGydvks2pMhisCCvLRzISGtHPVLh9lqqkvT2ulTJ+RRR1OCeEJ4psJ4GOSi0iw
	 jiU//HLk+hrXQ==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id C451E1BE3D2;
	Wed, 18 Nov 2026 20:04:06 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 17/22] ASoC: mediatek: mt8192: Remove orphaned DAI registration prototypes
Date: Wed, 18 Nov 2026 20:02:14 +0100
Message-ID: <20261118190219.316811-18-amade@asmblr.net>
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

mt8192_dai_hw_gain_register() and mt8192_dai_src_register() were
declared in mt8192-afe-common.h when the driver was added, but were
never implemented. Remove the orphaned prototypes.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/mediatek/mt8192/mt8192-afe-common.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-common.h b/sound/soc/mediatek/mt8192/mt8192-afe-common.h
index ad461dcb6ee1..cd5630f26615 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-common.h
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-common.h
@@ -154,8 +154,6 @@ struct mt8192_afe_private {
 
 int mt8192_dai_adda_register(struct mtk_base_afe *afe);
 int mt8192_dai_i2s_register(struct mtk_base_afe *afe);
-int mt8192_dai_hw_gain_register(struct mtk_base_afe *afe);
-int mt8192_dai_src_register(struct mtk_base_afe *afe);
 int mt8192_dai_pcm_register(struct mtk_base_afe *afe);
 int mt8192_dai_tdm_register(struct mtk_base_afe *afe);
 
-- 
2.56.1


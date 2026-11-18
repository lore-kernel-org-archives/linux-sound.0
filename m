Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028677;
	b=LB3kfvr5675IjSXN6Iv3zAciKS+T+rWciH9PfZrhw3mCWOvsx0PapayejLnnJyJarL7n
	 KxVE4Asexi+nCZanAKt/aErwY/KM3D438kD20+Zc/YIhY8vnSsKLOMj2lhTAlUGedOwI0
	 5gwW2Qaq2O3Qsch7zQ48TX3BLRTJWx2CzKl+Gp76eh4aiic/RsgPR6Poq6Tvheifit1V9
	 2jxA65s3+i9u1uUuR8P/aw0b/Spstvt6dhnR717FgZ80rbXQRV6JjjTX1dnOug+VpHJXz
	 UiJUfmXJkM103He+UhKyngz9OyS4cisNuLmZCzF7cSRSOmSrTck7VtRdHoRZFNVd3XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028677;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XuLb5Ws3Jx6nZsAzV9S0AukBu5fQv5yUBrj+MHfjhv0=;
	b=2aslW5mOCu3DhPSfrf4Rn1PIWe9IVNuDxs6irleHU21pCUbVIpkB1nv01iznAh31qEWY
	 ea2s7NX8aSMjhEusCBmZ5QCvsZfx+v5SmVW1Uu7ISddJugfq9WAcR/Fml1fd7qjBS0kea
	 JvPv0eRdsFueMvF9KC1QR7CkTQNb4ZQ6w0h1WGZwkff8T1860ceLiiPkyl5H5l2Rhouch
	 ESvD/b53ikCoFfG7afLoy28l6v71QSp2PMhTsyI7NCZAc7tOVyh3bmsjT7f7YRm+6A67g
	 tSENytJ91356TQFs8XxMx7unCJAENcjYhhLD+ZhWcGLgS9RTqTXpsotf8BvUwXbsWqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=NTMuOHsu;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E09C606A32C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E09C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=NTMuOHsu
X-Virus-Scanned: by amavisd-new using ClamAV (2)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028674;
	bh=XuLb5Ws3Jx6nZsAzV9S0AukBu5fQv5yUBrj+MHfjhv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NTMuOHsuQ4PXpc5e0f5QQBHoKq6GOZKgh7cUMYN2k/d9/CFwlP3RynzC7gmSXvMNe
	 k+niNXkQ5pPg4DncGLwtWLoOIHIP1vJgTWVrJBlvNw3RvoT/5nHasiMR2YCTaKAAmh
	 oChCTBxWHfWEMSdqwR72lbChAt9GEg+QJKvsFyyAkXEn44LkJJQWooxtSLGOnI54r3
	 5vCAYsp34rxHyJc6LmH8/hs8ClWDizKq9nPh3QAx8tL6oaSDte8Y+lrnLbwCyb9nB3
	 m9wCcaeslfk0/8cZ7R0rdTb74HSVuaYCt12fj7geXY/clx8cftkx7zR4LVhYFFvViQ
	 pxf1md+NT9UhQ==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id A20CD1BAA0B;
	Wed, 18 Nov 2026 20:04:34 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 22/22] ASoC: ux500: Remove orphaned ux500_msp_dai_set_data_delay() prototype
Date: Wed, 18 Nov 2026 20:02:19 +0100
Message-ID: <20261118190219.316811-23-amade@asmblr.net>
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

ux500_msp_dai_set_data_delay() was declared in ux500_msp_dai.h when the
driver was added, but was never implemented. Remove the orphaned
prototype.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/ux500/ux500_msp_dai.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.h b/sound/soc/ux500/ux500_msp_dai.h
index 7ca7144f5652..7e63e8c0b5b4 100644
--- a/sound/soc/ux500/ux500_msp_dai.h
+++ b/sound/soc/ux500/ux500_msp_dai.h
@@ -48,6 +48,4 @@ struct ux500_msp_i2s_drvdata {
 
 };
 
-int ux500_msp_dai_set_data_delay(struct snd_soc_dai *dai, int delay);
-
 #endif
-- 
2.56.1


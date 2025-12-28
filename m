Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAE227E077;
	Sun, 28 Dec 2025 07:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766905848; cv=none; b=AA4+ngmfOOJZEW3txSTRfGAw44NVMuLcQXvoyTsr1G2URM3To7yHSpue0bl83NAPuOBdrZwWj9TFWLJCUlde2foaaPbTSf2PevDBbmvIPilmvoCy1T4P7H3yfrY2Axr9QNk0ufkyOWrAPsIs22vyYJzuTsx5Qg2Rp2TnkKhL0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766905848; c=relaxed/simple;
	bh=oVbI1OINkWIZzkGWs2jsH2fQ0RvaeRCZ7tkw2V3CoKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qlQzoLZjCXOJHFkN+3ghHGw+XqTvImxqz5sVhX13+2E5Ih+0ERrjQ9ewukFx6EG4japjwOTr7+SaMBCBa6Cf03nd+69dOQSqv90+UR2NA9aVHO4M2wilx1SkoBHhsaa+PiKG3Y3wYs8ubxk5r3MZorksFugQEmNVJB6OwvdabBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pq8Ego9v; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pq8Ego9v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9wMpsIKtKlBBHkIflbaKqArf2l+TBlvDYa2sfvLCjcQ=; b=pq8Ego9vSpsfukJ3m52FZqJIoE
	EqQk1Imb13+PNguAEfMXKx/GJjmP0AqKmpYCc+FQytTLeClfNHnlJ/qE1+E0NvOzoeWoQuuvthRnR
	jTFJXifYs10zixwMwwX1uDGZoIqBfkTTvM097YMoplH8AmoWstVSM7A+mOMqT5GHejufQaQ0vNGaD
	E06PxeCkwCyOKq8Lex+9mr+L895pqx4dYtBEf+PRec7ZQio38rlszrjgKm/Zdrcuo0ZaV03BUVVwZ
	LD2/v+Ko62rKhLtCZcwdct/mNEkzirMzL4CQbrh2+QqW3XGKe99gONigFGFb7FMNPoBWS6BBf1iLN
	TgHVl6bQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZkvK-00000002ZI1-0eRE;
	Sun, 28 Dec 2025 07:10:42 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: pxa: drop unused Kconfig symbol
Date: Sat, 27 Dec 2025 23:10:41 -0800
Message-ID: <20251228071041.2246718-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop a bogus dangling Kconfig symbol for select SND_SOC_AC97_BUS_NEW.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216748
Fixes: 1c8bc7b3de5e ("ASoC: pxa: switch to new ac97 bus support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>

 sound/soc/pxa/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20251219.orig/sound/soc/pxa/Kconfig
+++ linux-next-20251219/sound/soc/pxa/Kconfig
@@ -18,7 +18,6 @@ config SND_PXA2XX_SOC_AC97
 	select AC97_BUS_NEW
 	select SND_PXA2XX_LIB
 	select SND_PXA2XX_LIB_AC97
-	select SND_SOC_AC97_BUS_NEW
 
 config SND_PXA2XX_SOC_I2S
 	select SND_PXA2XX_LIB

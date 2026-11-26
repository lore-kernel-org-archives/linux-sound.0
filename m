Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654407;
	b=LYlc7shRcxnlgvjspQOk0WRld1V9Wx9HeKUUvRk891f38gp+JvmcCtmWkDhA66++E8lz
	 svmERWg1+Q+ZjYYzblAUAETOT0anIShsLHWymLkBCOr+zXYgeMAacidDIK9xMd7UcCEYV
	 qib/HouZ5DSbldCspL886pE6kmC2j0+jpETEfHM89bXKHSOubeHupjK+rGD3S2k7ReiS1
	 WgnkpZuCW1PLgBycQpMoomgRMpIjhEnkgWbN1I+BsBJMLPjy9xCt8xZFhR0TF7twWD1r2
	 chEcx6UfyppYoAs9DOhj4lasbKa755mLSTlVDxvtSrFjKQ1zDJkyvJAYMnDQvho/iUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654407;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SAlISZPlGKgE20NTOOmnOxWiPG/pnscyYEr/0HgCOWM=;
	b=eWvOcoAedZDCKOdpGH8+0avscu8gBHGJkQzVmmmKd+cDGPol3ioCL+igHRoF/L5lM5kK
	 FMe3nbcSC37Doy7gv1FyG0P0iQ+aBJ8mNFKB9HOM7lb/bQT8PWSrzpA7n10bdWi1oRks6
	 hRZsyQAlGPCC+gFi/0zr/ANClr+FXQ0R4ziVmS53LOHIcCw8EOhqocdgDLDYM1vCZSIVB
	 APna4o8y3hAtN+0z0vx1Y0gi2wikDf7tCrxHJHTuTpvF/vFnQy7JlDEreUPZpHWzknpH+
	 xqo9phYpGLSQ2u2DXYsSZa0zds8ODQalWSiK97IGMAupgdi244Dr1bZlN6Yc3QOWQEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="F13E/eUn";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB8A606A323;
	Thu, 26 Nov 2026 00:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F13E/eUn
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654406;
	b=s+rglzAVPWk5L/tloduIk2SA1s9KS3kfHwj4nvtrquOPRs5C5Q2wCNQLW1/b1lUXecyF
	 xt9XWQqww8InM5/S8KyWFMcyiOxebQcOf+H7qTnuS0vw4YWENtYQx/oOG48+feV3+oY0s
	 0OQr1nYhPZoAGpfJSDRFp+X6iUnqQz6LQYd0W88qeo2rcYDEQdRNCW7DENhhxWpBUk6vw
	 CIT7dR9HU9qs7qH8Z+jq2rXpA6btnv8U43J1dqh9vcB6xKCvpkmhn83t1x4El5rhy6Bgt
	 78NQGAs5QwL+gCtLhVAAkXy14oOKZ3LG7XRovwzUYe04pIpLwg00KbNNsRt62bXfzUA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654406;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SAlISZPlGKgE20NTOOmnOxWiPG/pnscyYEr/0HgCOWM=;
	b=dU95FOjJJeE9opwqd7WVXFlD4Aym4h7KXGlQdqsB5HrE7xWq50MailffAiPLK+sY6p/K
	 12ZEzcuhVVeIDYvjcdWFl4T5U6B/BVOmio/R8nXSUu4XBi73xYECuY/seK2UrrBS3oReQ
	 z6SBuA2AOnyLJPFhuLeMNOXiSADiI27tvA77cKWQwh8PYC1DNgR8QP44tDq8My8asnQWa
	 ZmXh23QSdrr0hv6v1stUMw1MT1uKhAjdPk/bgJDrw0J2e7g9sx0bnRa3CnkVnx5azTQeA
	 ND5uKg4UYgak8JIKpkKuLD0K2PzIlLZA0dKLAf9yodqb5ZiEgOBamiMOJv7efbqo3pw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AC641F000C6;
	Thu, 26 Nov 2026 00:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654406;
	bh=SAlISZPlGKgE20NTOOmnOxWiPG/pnscyYEr/0HgCOWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=F13E/eUnebHnngKUoE9DfnBnfJpWG9/YbsF0HoKkou91n1WuFsxTA/q3hOhiOYw9D
	 vtOon3GZ65yQoXPM/eD51Bpaxicju15U5TgaFt5YiUzjBEERrmKIMRb/ja3I2xPjI1
	 SMBAegEUQf/nUREl2SwYxbuGDfEC7+KDcukXcvUBZFUq3ao06fnY/oJUwgc2Bj7ZzG
	 YhhLO+ltYalFuOJl8HV72MkcALzKc8kjvBTe+oJC3yuMO0ArqZQSnfadVejE1qPZ/x
	 9dJwqS98u965iR7fZ6+uxzlIhddpZKFJt9HXa7yReA11/x9si/zGEjlsK9fehRtMWL
	 i7gdcXTiPuaZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E31DF4D119;
	Thu, 26 Nov 2026 00:53:15 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: mediatek: mtk-btcvsd: check bt_reg_pkt_w for
 0xdeadfeed in btcvsd_tx_clean_buffer()
Date: Thu, 26 Nov 2026 00:53:15 +0000
Message-Id: <20261126005314.71606-2-iasnezhkov@gmail.com>
In-Reply-To: <20261126005314.71606-1-iasnezhkov@gmail.com>
References: <20261126005314.71606-1-iasnezhkov@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654394; l=1768;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=od5JgiRPKhJS8T2nyAhO51juiYOD8biytma5Vs2f0n4=;
 b=0x0khT7NbeBEi+gu6pYGVAaIuWAMKLi2x60dVwh5I9qZLlynk19VXXXdkGP4QwFE7QcJubYOD
 pEl9zSUNn+cCkAw9SJpX6FkTwL1p337hT3xy+B8HqvWBaAgbkI/FWR3
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com
Content-Transfer-Encoding: 7bit

From: Ilia Snezhkov <iasnezhkov@gmail.com>

mtk_btcvsd_read_from_bt(), mtk_btcvsd_write_to_bt(), and the loopback
path in mtk_btcvsd_snd_irq_handler() all read *bt->bt_reg_pkt_w and
bail out on the 0xdeadfeed sentinel returned when BT connsys SRAM is
unpowered or resetting.

btcvsd_tx_clean_buffer(), called from mtk_pcm_btcvsd_hw_free() and the
TX mute path, writes mute frames directly to previously cached
bt_sram_addr[] addresses without checking whether BT connsys SRAM is
still powered. If BT entered sleep or reset after those addresses were
recorded, writing to the cached SRAM addresses accesses unpowered BT
SRAM under tx_lock.

Return 0 early when num_valid_addr is zero so closing an unused stream
does not touch BT registers, and otherwise verify *bt->bt_reg_pkt_w !=
0xdeadfeed under tx_lock before writing mute frames.

Found and drafted with an AI coding assistant while bringing up MT6789.

Fixes: 4bd8597dc36c ("ASoC: mediatek: add btcvsd driver")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 19329dd..752856a 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -335,6 +335,15 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_snd *bt)
 	dev_info(bt->dev, "%s(), band %d, num_valid_addr %u\n",
 		 __func__, band, num_valid_addr);
 
+	if (!num_valid_addr)
+		return 0;
+
+	if (*bt->bt_reg_pkt_w == 0xdeadfeed) {
+		dev_warn(bt->dev, "%s(), connsys_addr_tx == 0xdeadfeed\n",
+			 __func__);
+		return -EIO;
+	}
+
 	for (i = 0; i < num_valid_addr; i++) {
 		void *dst;
 
-- 
2.54.0 (Apple Git-157)




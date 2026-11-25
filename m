Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795650524;
	b=Tpb2tdJbk5vMLsu1xjhB0Ldws6bod0R+qcqeuRUmWAcv2KPE6YoQkjHR7xPt5Fp+l04f
	 9vtvbXV9EKTKLVV/GpybgUlPeE8vEG/vDrbnqIRWGkSVBm9b25I9i0dEcpZvugKTdUn9r
	 qDFH58Cc7XpMDzdUMsfLeMcB4Mstmr9bEPh8CMWRpV7TmWtxnDCAx5zA27L/oBHd9Y7tC
	 ITk0cS6nx3WoGEq3gqpvUSodhZ9LbI9ORb2C1n+uKB0QLRveBT5JWR3Vnozwry8nGiRoW
	 7LFCGaHUaXqoDKApJjH7T9UTlIh7jAIRbGDBWRkaJ7tT3jggzBX6AbNQjr7YpCyMJCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650524;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=6WScmZhGnz6xs9qVATpJ7harTen3WQLAwO1wmN8eQAA=;
	b=LeOn7GWGz3eks8NJ+DBYY4hIJti0Sqn9NDjfUjS0CSfirqkvW24asV3OsmSXLjQijrog
	 Fi5dOFP4CjKZpn/9nbh8XXPHDo+bFcS0O3evGbqgKg+QuLX0A+Ypipw/QCDrFPLubLdhS
	 ruvo0HMt9D37zKI3hbSVD9p97RxNSXoInVtF324swx2E52GLpxjx+qgAS/34ENhV5OuQ9
	 2YH+41vWVBiEsMlci43dd0rqOqNTrs/BPV/vADaBife9Fe7Ao3Dro4AjdLgXD71XA8xvS
	 Z/AFyh8RkCHgfl3HWqKcSUXmaxqds+jdJEFapk28ZOWzH0Ihwe/mKhcUNuB675dsfIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijep9NGn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E817606A32D;
	Wed, 25 Nov 2026 23:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijep9NGn
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795650523;
	b=izMk7UwZ7c7G2Gsv341NaPLB9KQ8gkcCra4qT8kxeKuh8rEKjyoFFigY4FyO7mN4l36Y
	 /HKkkQK7Qe190bXzfZMtxruQm+uJIYNXcOhWDaJtV956UdSdy7vETe/iHGLHnOoYLsevf
	 TOmECViBqboVyqA2pMeGTdc1Pikg6jyfsimRhBHpWyBiwfUuoA4GD/vXP/nR0bYHIg37P
	 9cSSP34lV5GrwCQlZIENOAAkBy9xeurprIUHA2/umgjj2GxWhj2MbamY9HcYg3MHPZa+/
	 4WJbErGLtoKm8lM56xgVbga6BSEUK/KaLWD/TsXzU3cVFYtARGsqkhylbXQR8H1unDg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795650523;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=6WScmZhGnz6xs9qVATpJ7harTen3WQLAwO1wmN8eQAA=;
	b=uL8u1tr17KZPfZ0QvrjJVlLRrMygqXJga/Gqp7yoQwl2ihEgLIUwzrJqgKeIXyX1Tf19
	 Mk8REus7TqL6dmSI0g12LY0P0sfOFTQ9Imd806tqDNFmQ+uiXEi2lDqYwjmPKck838BIE
	 D9HZD1F4tKKiBFLSlbGXrM8HLxeL357ficEInmDStanj8pG3YQaqCPR90sQqXLw3kKq1A
	 P3LkuChIE9a4hwpjeU12a3s982lGo0oij0NN8BWHZzTt9gHWd9YoCrZPjTcR+pA6VYl5f
	 TK9ETVm3Xk3O19kObmoORW8zVckpyXD07S1O1PvZ3xqEIQRHEK6J8F1bUlXhDP8NkbQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8BD101F000C4;
	Wed, 25 Nov 2026 23:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795650523;
	bh=6WScmZhGnz6xs9qVATpJ7harTen3WQLAwO1wmN8eQAA=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=ijep9NGnKaFYAr4/8k8Oh9YjfIbH62AVLHx0UnmV9Nr+gbIe4X+3KD2nUkz6HJbjQ
	 cy6lSYNKeIaFTfiz7r8hmZpQXxRzYmugDmEFTI8kYj+J3RBDbCeLYOOVvftMEpJUJo
	 BsPyiBkFQR2t3w4GFoVM5VH01qw/S2yHjziayuU01XX3MT6ukf+Of5rfEjQE5y0H2I
	 cQzS0+7kpuiTkERVj/2WfrqaV7Cj2iMY88jblrMWyf4i7xU2p6A+Xh6fBWxfWt4ib8
	 Dxc72tNbok/klaJQFivxUdH6FnM94GU5SxrC6qOAPxsegH4x3eVc2JuI6937iVakgr
	 MYsRPegnzT3Ug==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 14CD34D0CB;
	Wed, 25 Nov 2026 23:48:31 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mtk-btcvsd: guard against 0xdeadfeed in
 btcvsd_tx_clean_buffer()
Date: Wed, 25 Nov 2026 23:48:30 +0000
Message-Id: <20261125234830.94895-1-iasnezhkov@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795650510; l=1783;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=W9UyHqccaU9sJaYlkqCsX581VyBG8Z+037komTBj1Ts=;
 b=F9wU7UgJiGB2P7BStff8lAWPeen21Nkm66rJ9rRHWpCkZFY0WYH0G/B5l0W93ngFGlAbZw9Ud
 4ETAUZd1+ooDxOSjHeaJt/7+hfBhl3sX3fMZ/KatqJ8iz7nMHDgESuG
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com
Content-Transfer-Encoding: 7bit

From: Ilia Snezhkov <iasnezhkov@gmail.com>

mtk_btcvsd_read_from_bt() and mtk_btcvsd_write_to_bt() both reject the
0xdeadfeed sentinel returned by the BT connsys SRAM pointer register
when BT SRAM is unpowered or resetting, and check the SRAM address
before dereferencing it. btcvsd_tx_clean_buffer(), however, casts each
stored bt_sram_addr[] entry straight to a pointer and writes mute frames
through mtk_btcvsd_snd_data_transfer() without checking for 0xdeadfeed
or NULL.

If an invalid or reset SRAM address is recorded or cleared concurrently
around hw_free / mute transitions, btcvsd_tx_clean_buffer() dereferences
an invalid address in atomic context under tx_lock.

Skip any bt_sram_addr[] slot holding 0xdeadfeed or 0 before transferring
mute data.

Found and drafted with an AI coding assistant while bringing up MT6789.

Fixes: 4bd8597dc36c ("ASoC: mediatek: add btcvsd driver")
Fixes: d067b3378a78 ("ASoC: mediatek: mtk-btcvsd: Add checks for write and read of mtk_btcvsd_snd")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 19329dd..1f52567 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -341,6 +341,10 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_snd *bt)
 		dev_info(bt->dev, "%s(), clean addr 0x%lx\n", __func__,
 			 bt->tx->buffer_info.bt_sram_addr[i]);
 
+		if (bt->tx->buffer_info.bt_sram_addr[i] == 0xdeadfeed ||
+		    !bt->tx->buffer_info.bt_sram_addr[i])
+			continue;
+
 		dst = (void *)bt->tx->buffer_info.bt_sram_addr[i];
 
 		mtk_btcvsd_snd_data_transfer(BT_SCO_DIRECT_ARM2BT,
-- 
2.54.0 (Apple Git-157)




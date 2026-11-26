Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654402;
	b=iTShjS4tOS21ci8Z9bEZNArAe/2gua3FN+sU0t+C/Pqi83WzoPrpUYAb9rX7UkHFiiou
	 39T+el8Dbzv0vXwXHBeY33pe9WmMG6V3W/PPa/xsb0rirKMx2DsYFcjybZ3uNG2nobyrT
	 c4zPyntJVC7mkN7DC1i6cma33d3uYeFvvk23s8/1Sn2Z/UcX9TdF3K3slSr7SpHSWU2m0
	 9Y2sQ7VeQTOmiHQqZa4RVsY7rrzriNjdOsJgp9QkeAakcYe35RcqPqtG+GAn7RAH6gtsu
	 KewqLUT2CsG1HbR4A/MSqZ5KMIobW/ZZU7FaeQyPVS9S7IR98S5/DMqJ1TsU1AHMe3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654402;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+/bIrVInONR+XJXRCb4gtlY7/LMelusfalrzxxtW9MM=;
	b=XaykdyAfpHLIBIFlc5m2l25GCyw88o0jLj6yxTAvIK78xdAg0yRElz4CN5Puqq0jxlbn
	 EKaDOTHSEyP+X/VWeNmTRbzQf4/bzaQcvfAr0+Nl0hPoh9jNmPqTkwUkrq4l50pIxsoNn
	 3lS3H5Yt+FV7Fj9ZBNW3gZOB9Wmu9SXlyi1soB6qkqPgqTQg8T1rqEuQhnVB39Uq17qNm
	 QxiUPj4/P/MAI3E7DGft3ck5l8kxWWA1OSlhK5ziwJYzNYJxCXLyP/nmshs00o56FRXUu
	 s+f+gH+zqyR6qRBeCrWHhHCD2w1EH+MwVh7SZEHejK06kk0dIqCkxGauRvWtdnQThkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bP0iFo9e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F292E606A32E;
	Thu, 26 Nov 2026 00:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bP0iFo9e
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654401;
	b=S9uosQGiVKHcS0QYQaTCgqC1tVxQEJiz0jV4YhZ2mjZAQuyBxkHDXrglugnMse3ildQ6
	 PkxtRlzATU/6x1emi+bHZD2Xq9hjF4HtzFAFGhx5CscPLSGR3cx9jktfiE7v6HoRE/F2m
	 oYpvfk9bx0mX1kCRjVwZI90fQaIvOxrFaOX5AOnOkg+ZACc2HS3WcDGUfZjw3kmbfoGxa
	 eqyBfBtDU6BiGNRIGKvebehS+yh1JOgHXtu4WfVLdAPPb93s4Po6siInIUPhqGoKcFx09
	 /gPCZSmyka7vmBiOQIdX4MDEwctY7oIuygDOSehhPPVrEoPyixdCzTM81xI7iwa11rg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654401;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+/bIrVInONR+XJXRCb4gtlY7/LMelusfalrzxxtW9MM=;
	b=i6C2fhDUMj6sMwJEbRYK/m92yJpQLyQig4r0PSmD/CO7adSZQt4oZuZym+RSTg8xjqgx
	 kHEUXLkVQqTFv/DMWACJvxLgvmHVRofbJ6Hffwrm0EDLMD0wv989RQ/kg7ZkJLCN+G7iH
	 AObJIiyfsqOoqk3TavIXwgAvF4Z1fDFXQwc37GZ3kjIO/lMFTUvWHovbWf51KRydD88AV
	 CupC1cBNE6oCbOsc22EfeTzMeiA1fFwIf8gl8K+K1l9FBevvRPsE7BnhQo6rbpywHu45v
	 pz+jM1CiVPcXP2TcGaKOWEVyQkrIWNAQ67t1RXLt9CSwSjfO33n7mfTO/+827rlx1OQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84EA01F000C4;
	Thu, 26 Nov 2026 00:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654401;
	bh=+/bIrVInONR+XJXRCb4gtlY7/LMelusfalrzxxtW9MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=bP0iFo9eAe6OMf9UKKjrS4i6bGXdfOYPavF2qPUhbQ9Edxd0E0qWYIYGA7QP2BRzc
	 A25pD3vuVCLf+j5dNaAJU8gOjh5xP5EvwT+fvxtsoevIqXFksh2KFd4vVFKcCScOt8
	 EtT6UEzXUkuU+CVHEhJUoak7Z8f5dz/Gk9MfUnPJNpMF3YNH7BSTuko2D7VUkbSHhk
	 AhfCP31s2NBofLfKeBMldphbCNSr0036uUizWf2O49ll2787w6Cb+l6xrn8CAwVreT
	 sOaTpsJMAVdGLC6KRT/UTLRJ29hp8QyROGBHrNRnuHGpQMOkUla+nkMWl6e9GUEtoU
	 Vp4lyQXxoSE8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0F4464D121;
	Thu, 26 Nov 2026 00:53:16 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: mediatek: mtk-btcvsd: bound bt_sram_addr[]
 writes in mtk_btcvsd_write_to_bt()
Date: Thu, 26 Nov 2026 00:53:16 +0000
Message-Id: <20261126005314.71606-3-iasnezhkov@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654395; l=2237;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=9ux9uWFLOH2k0sXAf5BIFccI/VfvFaqk+pxBS8OV1FQ=;
 b=sxViQTOIXvR9gTPR1kuw9wCzmYkm5MD0oresoHVsiSj8O4Gd+jsjJWH8N42jQz1v1X3BMCUEX
 dCBA1zT8fh0DHQKBL/He63v5rchZsgNHdPJMlR63kJMpTtpDya30zIN
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com
Content-Transfer-Encoding: 7bit

From: Ilia Snezhkov <iasnezhkov@gmail.com>

bt->tx->buffer_info.bt_sram_addr[] has a fixed capacity of 20 entries,
but mtk_btcvsd_write_to_bt() unconditionally increments num_valid_addr
and writes bt_sram_addr[next_idx] whenever a new SRAM offset is seen.

If more than 20 distinct SRAM offsets are ever observed (for instance
during BT subsystem resets or corrupted register reads), this writes
out of bounds past bt_sram_addr[19] into adjacent fields of
struct mtk_btcvsd_snd_hw_info and surrounding memory.

Check next_idx against ARRAY_SIZE(bt->tx->buffer_info.bt_sram_addr)
under tx_lock before storing the address and advancing num_valid_addr.

Found and drafted with an AI coding assistant while bringing up MT6789.

Fixes: 4bd8597dc36c ("ASoC: mediatek: add btcvsd driver")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 752856a..362d608 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -466,15 +466,22 @@ static int mtk_btcvsd_write_to_bt(struct mtk_btcvsd_snd *bt,
 	}
 	if (new_ap_addr_tx) {
 		unsigned int next_idx;
+		bool stored = false;
 
 		scoped_guard(spinlock_irqsave, &bt->tx_lock) {
-			bt->tx->buffer_info.num_valid_addr++;
-			next_idx = bt->tx->buffer_info.num_valid_addr - 1;
-			bt->tx->buffer_info.bt_sram_addr[next_idx] = ap_addr_tx;
+			next_idx = bt->tx->buffer_info.num_valid_addr;
+			if (next_idx < ARRAY_SIZE(bt->tx->buffer_info.bt_sram_addr)) {
+				bt->tx->buffer_info.bt_sram_addr[next_idx] = ap_addr_tx;
+				bt->tx->buffer_info.num_valid_addr = next_idx + 1;
+				stored = true;
+			}
 		}
-		dev_info(bt->dev, "%s(), new ap_addr_tx = 0x%lx, num_valid_addr %d\n",
-			 __func__, ap_addr_tx,
-			 bt->tx->buffer_info.num_valid_addr);
+		if (stored)
+			dev_info(bt->dev, "%s(), new ap_addr_tx = 0x%lx, num_valid_addr %u\n",
+				 __func__, ap_addr_tx, next_idx + 1);
+		else
+			dev_warn_once(bt->dev, "%s(), bt_sram_addr table full\n",
+				      __func__);
 	}
 
 	if (bt->tx->mute)
-- 
2.54.0 (Apple Git-157)




Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654399;
	b=Tyw9IqFD8w/MRsqPXF9g4OSfjJe820VNqM6Q5W2+H3z9Khtnrm6sMHpRJqbHU5I6radU
	 sEKmnCiLtqrOA42GaTQEHEpdZR0lSzPdPch37uXcl+KhxgeL4WpDmBe9R/98eELMMO9dj
	 bcpGhsy+9eza7WY7nNP1kd3Fim2q8s2fC6YlbhyiQJ4N6JL0TM9ZnRd24LEp0fyschd6w
	 lUViYt41iUT8yi74cCPQBX0igVwaNKHT7UCD2Z2ltg5PpBQgf89nF2r7xoPmjYy6WtjX2
	 VMCrYFQAgFUK2uIhfgjBSwR3JWkIDLH106FPVHjyHgDHVajjIKH5gXP6DWtiohp84Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654399;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=FnYWH85VdSRHZN+nvi/clH5gT1Faosi93zXA3ZngnAM=;
	b=COLS/2nWE8HHI5qMaQx5GzTJL7VqXNtmg2ZWAaJ7ytJyIaXoJYIvyeRlG/WVTDlAyY7d
	 ybJ+2lCJLA3qwtPqcQm1vgYBfv+41DnpGNOmMa8JVR4vZE4pcrwg93VC0hIzqN1hwhkim
	 gqNs8NwJDBS1G4AkoZww4uGLFV/2/Az3t/ijx9mQbapRO8UnzLy5h3XXAAPZmepTO94L7
	 o1imCidzlBzg3sjkLIn4aF3LhkRRxE+nDC1uH8ea2getcKSlFKz0dYWw/cPycLPYz4blZ
	 qTOsTYQshO1Z+/rNTbgA2BZ8YFA/0Gqos9m91yWH2qc7x/TnOPiUvQlBTaYSkDilwsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f0v4haXp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E8606A31E;
	Thu, 26 Nov 2026 00:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f0v4haXp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654398;
	b=YIRiuTG2NzjzRMXGUJOb8ohNY3gKpN1m7zlGZM2tXm+hrpuZrT/A1zTI2wiAhvJt9pU6
	 PuO9xi1lp8SEPATOvxemqg8bqVSDI9A6jjtHQSTDUTU2QOdMKJnbPOwO8qUU0xX8Gca4D
	 oMBBB5Fk4Y/O6I8Jf2a8XrwDloh+9RKmhDE+AwKSvQbIzWCiu0nOv7md0/6IbvcIzmOFm
	 g/bHEf/KLlEcEkqbvYarkYyGFlUVbYSmFvyi4S4A4o3GZU6Q3s9EOGbNpQOhhQCE/QRQT
	 9/SzaIam3GxZm2trFhR+0c4M35q1jC5aU9Q55NQ3T/xOezpLSpa6njIt8KlNfKyRykQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654398;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=FnYWH85VdSRHZN+nvi/clH5gT1Faosi93zXA3ZngnAM=;
	b=ZIfz5C/zuWKv4EPzR/r6yUdSTljtxxGzCnXIeAvYaaqidFCyAAPovbAkBXETeIS1NPQ6
	 grX1NlI5JXHS/egbcW4Ra7x0fTHX2WGsDHlXD2PZLr2a7IE1T9CYieLYRAgIRet88kwx+
	 GP/bTXw/hnEX+xuVyYErJcIxRhlVnSYFbSdlmI8Y3/xcGlv3e7Ctl/Pt1IKyEQAqE9+9R
	 13aJt0VSvIzcNBJO9fmvfaJzdYyndgVml3mYaedhw33unSfwgrcPo+BYx0lrwQiYb+ZRK
	 7FZoNGjEIQuzvjllS7q/c9ns8NxswEvf01d4kdWG5IjgY6dACHjRpOKFo2FCR0+Mp8w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AC311F000C0;
	Thu, 26 Nov 2026 00:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654398;
	bh=FnYWH85VdSRHZN+nvi/clH5gT1Faosi93zXA3ZngnAM=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=f0v4haXp+bHJtWDvxpOFgZNMngtuwWHfjH77DxiFJ/eYsMelZSECDW5dCGyfWEFn8
	 gZGyUdL4nZQXNVO+LNmAwqDLzJQEy3owbBBYbYEc1lUdz/5yOYbKcPS8IH3gkIUEZL
	 ICUshexMEpnVMfLytvlXzbLVPaq6i9xEiJyRfENCcpWEkk5WkBBDVZ3plcDxyZSQEN
	 exWbQEXvf4rZS/skmpffqjRSiIhldORcLiVIDKMUkI0K86DTCtKxDJMIy8j47kATRx
	 tkz0OHYWWWY0wrGcaT1pxGLurIKUpVn2ZrFh0E793S1aIRgYdW3yNzyWo0+1rvx0Q7
	 c3Iwo7AJKqXIA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BCD314D11C;
	Thu, 26 Nov 2026 00:53:15 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: mediatek: mtk-btcvsd: fix 0xdeadfeed check
 and bt_sram_addr bounds
Date: Thu, 26 Nov 2026 00:53:14 +0000
Message-Id: <20261126005314.71606-1-iasnezhkov@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654394; l=1430;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=x5ID1NUyDxYewEijuwziJ4VLj2wpR1LC5OkbG06mBwA=;
 b=In6UhFWhii9n4hlSRerstvYRzmXPkYxqcFJTQLbDdeGZLXxZAE5TcoTib6ZnxCTFYZr29YWaT
 ixKnNQGulV9B7b9LMNc9zyddSLC4gqTkhpp7+iVg9JQkBgQY+/s4snx
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com

This two-patch v2 series addresses two safety issues in
sound/soc/mediatek/common/mtk-btcvsd.c:

1. Check the live *bt->bt_reg_pkt_w register for 0xdeadfeed under tx_lock
   in btcvsd_tx_clean_buffer() (after skipping the empty num_valid_addr
   case), matching mtk_btcvsd_read_from_bt() and mtk_btcvsd_write_to_bt().
2. Bound bt_sram_addr[] writes in mtk_btcvsd_write_to_bt() against
   ARRAY_SIZE(bt->tx->buffer_info.bt_sram_addr) to prevent an
   out-of-bounds write past the 20-entry array.

Changes in v2:
- Replaced the ineffective check on cached virtual addresses
  bt_sram_addr[i] with a check on the live *bt->bt_reg_pkt_w register
  (returning 0 early when num_valid_addr == 0).
- Dropped the unrelated Fixes: d067b3378a78 tag; kept only
  Fixes: 4bd8597dc36c.
- Added patch 2/2 fixing the unbounded bt_sram_addr[] write spotted
  while auditing mtk_btcvsd_write_to_bt().
- Link to v1: https://lore.kernel.org/r/20261125234830.94895-1-iasnezhkov@gmail.com

Found and drafted with an AI coding assistant while bringing up MT6789.

Ilia Snezhkov (2):
  ASoC: mediatek: mtk-btcvsd: check bt_reg_pkt_w for 0xdeadfeed in
    btcvsd_tx_clean_buffer()
  ASoC: mediatek: mtk-btcvsd: bound bt_sram_addr[] writes in
    mtk_btcvsd_write_to_bt()

 sound/soc/mediatek/common/mtk-btcvsd.c | 28 ++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

-- 
2.54.0 (Apple Git-157)




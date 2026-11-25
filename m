Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650999;
	b=lgfWA0a2t+hLWUI64O8heo3VwAyYqXA7z4Rojk46vpYt5i1yon2uxLEPOFlJaRTJVEZf
	 XkugXpdV96YPgSv63SZdGvm1EfUAQTpa6G0tBYuEO5SykdCUlRGGCokbM8eLV9QcLe/NJ
	 950AhDqREjTFdO8aPsJvkxlkAYlaa5Ab0xGTGK5cJbEQkQCOkUi6q90DXWONRhrWwID6P
	 XzYMV4DqrSJ93CIE3ifXujQ0T+9E5mE9q3NhzWbfb8WtM/8+8tSL6+rvrT8fA0YYYuZfl
	 QvvhWJ4UmA4ochC+XErEDY/utnQ019zwhPWWyTOsAq+2Yq/oViSeFucbmFbHYWh9lig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650999;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aMO5yS9ZguTO218Z9/py9RTbh8xc1n6S7g48Yg1ePOs=;
	b=jmjNW6STcKJLZ47x89RmY9aDN4n0vohO3ZRW3yga6+WHs/ANIUVnoE4X1lrtkD+xDt+i
	 czU2c71MiFfUgXlm853GSiwgVJ8HcpGZ3p0flgJYqXCjvLdB7KkAIC0jUWYceHiLVURdT
	 ClJqH0IAUQ5O1lApRt3XCsBzAd7MTchY8poN2PfAaZPDy6aFrBdvO9ShCCfKHBC+WDuOC
	 5YkhKV6gWlM1kvqIdJcGM0Z8EyUUJJQ4MDJdFzOEvUzUaP0hGEz+wdaIYeo5/5a+mrPa5
	 sDodUZDBTsSkyJfypBkiSqfi+Th4z2x/DchcnGkkutSTd0WIUBVcRoiKjxWAEwVOoIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XnPDizBJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AD2606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 23:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XnPDizBJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F011F000C0;
	Wed, 25 Nov 2026 23:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795650998;
	bh=aMO5yS9ZguTO218Z9/py9RTbh8xc1n6S7g48Yg1ePOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XnPDizBJuqodrZOJaa054BkAsiEtS1hKPdKI6ybEho7UFn1/yf+OuhlcHBHiXvpna
	 edaKARw0CbUxFt6+ZiUI2yDCO1Y1+Gx18m+TDRnYtMvU6LmrNDCwTbcHVugb6QZ8bd
	 od8MS6w8cOCcFwgcb2BSVlYkd/1PogbBtlvalJPpg5QOaqojceW19AS6kdIpgtiyn2
	 bWdQC2Io01rFUTzkRakWJ8DxTxghgCIvY6mxPSXabEvAMH6BJViwsh33TTauLLF6yo
	 1Tyf7HzjtLd9YrlaUaPvB8FIxy99exGtSc7gVPEGTe7LfC4NCfkuUnyYZOhJZhColP
	 bxWoYqKs7I8CA==
Message-ID: <sashiko-outbox-234420@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: mediatek: mtk-btcvsd: guard against 0xdeadfeed in
 btcvsd_tx_clean_buffer()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ilia Snezhkov" <iasnezhkov@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261125234830.94895-1-iasnezhkov@gmail.com>
References: <20261125234830.94895-1-iasnezhkov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 23:56:37 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ASoC: mediatek: ineffective 0xdeadfeed check in
  btcvsd_tx_clean_buffer()
- [Low] ASoC: mediatek: unrelated Fixes trailer d067b3378a78 in commit
  message
--

commit ed1dbfaac1e6a9adfd651ed2d3dd40c2aaf8a20b
Author: Ilia Snezhkov <iasnezhkov@gmail.com>

> ASoC: mediatek: mtk-btcvsd: guard against 0xdeadfeed in btcvsd_tx_clean_b=
uffer()
>
> mtk_btcvsd_read_from_bt() and mtk_btcvsd_write_to_bt() both reject the
> 0xdeadfeed sentinel returned by the BT connsys SRAM pointer register
> when BT SRAM is unpowered or resetting, and check the SRAM address
> before dereferencing it. btcvsd_tx_clean_buffer(), however, casts each
> stored bt_sram_addr[] entry straight to a pointer and writes mute frames
> through mtk_btcvsd_snd_data_transfer() without checking for 0xdeadfeed
> or NULL.
>
> If an invalid or reset SRAM address is recorded or cleared concurrently
> around hw_free / mute transitions, btcvsd_tx_clean_buffer() dereferences
> an invalid address in atomic context under tx_lock.
>
> Skip any bt_sram_addr[] slot holding 0xdeadfeed or 0 before transferring
> mute data.
>
> Found and drafted with an AI coding assistant while bringing up MT6789.
>
> Fixes: 4bd8597dc36c ("ASoC: mediatek: add btcvsd driver")
> Fixes: d067b3378a78 ("ASoC: mediatek: mtk-btcvsd: Add checks for write an=
d read of mtk_btcvsd_snd")
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>

[Severity: Low]
Should the second Fixes: tag for d067b3378a78 ("ASoC: mediatek: mtk-btcvsd:
Add checks for write and read of mtk_btcvsd_snd") be dropped?  That commit
only changed mtk_pcm_btcvsd_copy() to propagate return values from
mtk_btcvsd_snd_write() and mtk_btcvsd_snd_read(), and did not touch
btcvsd_tx_clean_buffer() or 0xdeadfeed handling.

> diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/=
common/mtk-btcvsd.c
> index 19329dd7c0d75..1f525673c463b 100644
> --- a/sound/soc/mediatek/common/mtk-btcvsd.c
> +++ b/sound/soc/mediatek/common/mtk-btcvsd.c
> @@ -341,6 +341,10 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_=
snd *bt)
>  		dev_info(bt->dev, "%s(), clean addr 0x%lx\n", __func__,
>  			 bt->tx->buffer_info.bt_sram_addr[i]);
> =20
> +		if (bt->tx->buffer_info.bt_sram_addr[i] =3D=3D 0xdeadfeed ||
> +		    !bt->tx->buffer_info.bt_sram_addr[i])
> +			continue;
> +
>  		dst =3D (void *)bt->tx->buffer_info.bt_sram_addr[i];
> =20
>  		mtk_btcvsd_snd_data_transfer(BT_SCO_DIRECT_ARM2BT,

[Severity: Medium]
Can bt->tx->buffer_info.bt_sram_addr[i] ever equal 0xdeadfeed here?

mtk_btcvsd_write_to_bt() is the only place that populates bt_sram_addr[], a=
nd
it checks the raw 32-bit register value connsys_addr_tx against 0xdeadfeed
before storing the translated virtual address ap_addr_tx:

sound/soc/mediatek/common/mtk-btcvsd.c:mtk_btcvsd_write_to_bt() {
    ...
	connsys_addr_tx =3D *bt->bt_reg_pkt_w;
	ap_addr_tx =3D (unsigned long)bt->bt_sram_bank2_base +
		     (connsys_addr_tx & 0xFFFF);

	if (connsys_addr_tx =3D=3D 0xdeadfeed) {
		/* bt return 0xdeadfeed if read register during bt sleep */
		dev_warn(bt->dev, "%s(), connsys_addr_tx =3D=3D 0xdeadfeed\n",
			 __func__);
		return -EIO;
	}
    ...
		scoped_guard(spinlock_irqsave, &bt->tx_lock) {
			bt->tx->buffer_info.num_valid_addr++;
			next_idx =3D bt->tx->buffer_info.num_valid_addr - 1;
			bt->tx->buffer_info.bt_sram_addr[next_idx] =3D ap_addr_tx;
		}
    ...
}

Because bt_sram_addr[] caches previously computed virtual addresses
(bt_sram_bank2_base + (connsys_addr_tx & 0xFFFF)), an entry never holds
0xdeadfeed, and the cached entries do not change to 0xdeadfeed if BT connsys
enters sleep or resets before mtk_pcm_btcvsd_hw_free() ->
btcvsd_tx_clean_buffer() runs.  As a result, btcvsd_tx_clean_buffer() will
still write mute frames to BT SRAM while BT connsys is asleep unless it
checks the live hardware register *bt->bt_reg_pkt_w =3D=3D 0xdeadfeed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125234830.9489=
5-1-iasnezhkov@gmail.com?part=3D1

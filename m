Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814023;
	b=Qr46WEF9WIWLCFvOTnDte0shQRPuT9Gux3Td61VGWhrEVPHXs+/lhXg5hx9o/9JihB8f
	 uT1HW9i99S61T61LHnRgUbjJ/XrJ+VIx/IphglujxD3N3UURmD8a2o0CJiqE1dtkN1hVa
	 EwJY6rgcVaJzicCXASJ+x83Y/zuqUZEj3GMJh9DC5VClicmCKQVWzEZbCRZYPkb23a6QT
	 rnQHL8XS9hh/iY0XNR947qi3JbiBPgq5b2rxS7eDyFWilBc/d2YBBVmujzG09ZNOfNKUR
	 dcte7Gt8mNAf99wtGLmXcyVe1W7eUiMQ1HZR2IfemIvzYXOKE0GfUIlzBx2WXTKqgCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814023;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1ELlTHsX7MWi1F2xb1UhzBFJcLpNsaPIltuvAh1A7y4=;
	b=2BbeK6pHm1xwezRKIpCQDdacpHgHtvdOg0he4IEtZrkqeItKKn98CAwheI2mscmQM+r1
	 JWBu7F8hMfFUfHtsBZRhWc91ptWiSo1ECRGXNKoTga4BVfGXs80hy3OpFnUcJ8zDygsfR
	 i8E/foKVVI2FjaHZk1tT3mro/4f99rx2kSE3j35NUjJ3Ug7ewqFziJaxv5cuFJl1Sgkjs
	 OeFHc6JvRzeD6UxWpQZNrrp7RfrvM+8pMprmM5A7ubAqzN2RE+t7xxTEaOCpwMx1OovY+
	 ON4OUyDc3Ak/TPzpHgzLGQczW6gAvrkcDRs2nVhkf2w9U5FfJ4+9XQLnswQfRX854EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhYX20Ni;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569EE606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhYX20Ni
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5151F000C6;
	Mon, 16 Nov 2026 07:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814023;
	bh=1ELlTHsX7MWi1F2xb1UhzBFJcLpNsaPIltuvAh1A7y4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=lhYX20Ni94uh3AbBWWo/Okm/ONqB2yNdoZ3hZ2St2NqcZqxDqKtNz/28p1WBSk0ur
	 /fwq4nGr7U9GebNKpfN3DWlSdGQzeNgIpJCfGhVsxBjjhFVEfFW9ucfXdMfQaHSm4t
	 nYvHI8qjYJAbEcfOIQrlWIvBV0A1Deg03O1vounIgLaWu70NIkGOBXdwDHHyqK043R
	 Nwu+XPnOZ2OKmbDA4ApecEsNVMNv8dEQcDYCVErErONldz+cJrAKXdUjq6I0gqQPjB
	 UZs5MCVBTIrwX+nItay5dmMVA5N/KZnFdvYfPLrqb4bOgFUVCe1cT5iElpJTGXptMO
	 jB35b7o83ZjPQ==
Message-ID: <sashiko-outbox-216422@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: wcd937x: bound the DT channel mapping to the
 channel
Reply-To: sashiko-reviews@lists.linux.dev
To: liuchen <2508871010@qq.com>, linux-sound@vger.kernel.org
In-Reply-To: <tencent_5E8B535138DB2906DF4871E24590DA458A06@qq.com>
References: <tencent_5E8B535138DB2906DF4871E24590DA458A06@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:27:02 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] ASoC: wcd937x: single-word handle used in Signed-off-by trailer
- [Low] ASoC: wcd937x: stale ret check in wcd9370_probe() after clamping
  size
- [Low] ASoC: wcd937x: Fixes trailer cites wrong commit in commit
  message
--

commit e110cdb8f270ccdee8cfffae54f7844e1377eb32
Author: liuchen <2508871010@qq.com>

> ASoC: wcd937x: bound the DT channel mapping to the channel tables
>
> wcd9370_probe() copies qcom,{tx,rx}-channel-mapping into the per-channel
> tables with the length of the DT property as the loop bound.  Nothing
> checks that the property describes no more channels than
> wcd937x_sdw_tx_ch_info[] (11 entries) and wcd937x_sdw_rx_ch_info[]
> (8 entries) hold.
>
> The DT binding requires exactly 12 entries for qcom,tx-channel-mapping
> ("adc1, adc2, adc3, dmic0, dmic1, mbhc, dmic2, dmic3, dmic4, dmic5,
> dmic6, dmic7"), while the driver's table stops at WCD937X_DMIC6, i.e. 11
> channels.  Any board that follows the binding therefore writes one entry
> past the end of the table; both boards in mainline that use the property
> do so (qcm6490-idp.dts and sm7150-xiaomi-davinci.dtsi both spell out 12
> values).
>
> Both tables live in .data right next to each other, so the stray write
> lands in wcd937x_sdw_rx_ch_info[0].ch_mask.  The 12th value, 4, stores
> WCD937X_SWRM_CH_MASK(4) =3D=3D 0x8 into HPH_L; the codec then asks for
> SoundWire RX channel 4 (EN_CHAN =3D 0x8) while the AFE keeps sending two
> channels (active_channels_mask =3D 0x3).  The CDC DMA never completes a
> block, the DSP never reports WRITE_DONE, and playback on the RX codec
> DMA path fails with -EIO after the wait_for_avail() timeout.
>
> Clamp the property length to the scratch buffer before reading it and to
> the table size before filling it in, so that an over-long mapping is
> ignored instead of corrupting the RX table.
>
> The overflow was found while debugging RX codec DMA playback (no
> WRITE_DONE from the DSP, playback failing with -EIO) on an SM7150 phone:
> a temporary printk showed exactly one entry of the runtime table
> differing from .data, which led to the 12th iteration of the loop.
> Diagnosis, patch and this changelog were produced with the help of an AI
> coding assistant (Claude, Anthropic); the submitter reviewed the change,
> built it for arm64 with W=3D1 and verified on that phone that playback now
> completes and that the codec enables SoundWire RX channels 1 and 2
> (EN_CHAN =3D 0x3) instead of channel 4 (0x8).
>
> Not done: qcm6490-idp was not booted, there was no KASAN or reproducer
> other than the phone, and the DT binding still advertises 12 TX channels
> while the table holds 11, so a conforming mapping now has its last entry
> ignored instead of written out of bounds (binding update left as a
> follow-up).
>
> Fixes: c99a515ff153 ("ASoC: codecs: wcd937x-sdw: add SoundWire driver")
> Signed-off-by: liuchen <2508871010@qq.com>

[Severity: High]
The Author header and Signed-off-by trailer use a single-word handle
("liuchen") instead of a full real name as required by the Developer's
Certificate of Origin in Documentation/process/submitting-patches.rst.

[Severity: Low]
In commit c99a515ff153 ("ASoC: codecs: wcd937x-sdw: add SoundWire driver"),
wcd937x_sdw_rx_ch_info and wcd937x_sdw_tx_ch_info were const arrays and
wcd9370_probe() did not parse qcom,tx-channel-mapping or
qcom,rx-channel-mapping.  Should the Fixes: tag instead point to the commit
that introduced static channel mapping support:

  Fixes: c06c4f7cbea1 ("ASoC: codecs: wcd937x: Add static channel mapping s=
upport in wcd937x-sdw")

> diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sd=
w.c
> index 57549518767ce..baacfef6c9cb4 100644
> --- a/sound/soc/codecs/wcd937x-sdw.c
> +++ b/sound/soc/codecs/wcd937x-sdw.c
> @@ -1003,6 +1003,8 @@ static int wcd9370_probe(struct sdw_slave *pdev,
>  	if (wcd->is_tx) {
>  		master_ch_mask_size =3D of_property_count_u8_elems(dev->of_node,
>  								 "qcom,tx-channel-mapping");
> +		master_ch_mask_size =3D clamp(master_ch_mask_size, 0,
> +					    (int)ARRAY_SIZE(master_ch_mask));
> =20
>  		if (master_ch_mask_size)
>  			ret =3D of_property_read_u8_array(dev->of_node, "qcom,tx-channel-mapp=
ing",
> @@ -1010,6 +1012,8 @@ static int wcd9370_probe(struct sdw_slave *pdev,
>  	} else {
>  		master_ch_mask_size =3D of_property_count_u8_elems(dev->of_node,
>  								 "qcom,rx-channel-mapping");
> +		master_ch_mask_size =3D clamp(master_ch_mask_size, 0,
> +					    (int)ARRAY_SIZE(master_ch_mask));
> =20
>  		if (master_ch_mask_size)
>  			ret =3D of_property_read_u8_array(dev->of_node, "qcom,rx-channel-mapp=
ing",

[Severity: Low]
Does clamping master_ch_mask_size to 0 before checking
if (master_ch_mask_size) leave ret holding the stale return value from the
earlier port-mapping read when the optional channel-mapping property is
absent?

When qcom,tx-channel-mapping or qcom,rx-channel-mapping is omitted from the
Device Tree, of_property_count_u8_elems() returns a negative error code.
Previously, if (master_ch_mask_size) was true for negative values, so
of_property_read_u8_array() ran and set ret to a negative error code.
Clamping master_ch_mask_size to 0 skips of_property_read_u8_array(), so the
subsequent check in wcd9370_probe():

sound/soc/codecs/wcd937x-sdw.c:wcd9370_probe() {
	...
	if (ret < 0)
		dev_info(dev, "Static channel mapping not specified using device channel =
maps\n");
}

evaluates the return status of of_property_read_u32_array() for
qcom,tx-port-mapping or qcom,rx-port-mapping instead, suppressing the
fallback message when port mapping succeeded.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_5E8B535138D=
B2906DF4871E24590DA458A06@qq.com?part=3D1

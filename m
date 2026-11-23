Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454773;
	b=yaAFvmdT+mvspcP6wqMhgc17EUlpKzic4jBs09S8StfEmZ4o2bZNcKj4YC16ili7mOEM
	 49NakNlvc/0IW5xs5JAnRRqCPOpE7KJpGLlnh4k8SBU8WQfPUVK5NflUu/chgYXFdBSpr
	 Wf8qWA55Ydw2Zjo3wWQaVBLw4mcsI0t63sBWsVWdcHUpjflWp7/48IVdCxGkKmgt3NGLF
	 J/q8deGuFH5sNeq7mNnzVpb8Qrs4mXaJ9xC7ETDtwB77jxoyCr4yDuLpRDJyYfm9nJhDN
	 UTOsgLllnttwXKcC4y1pvOQU/e7MP7qficPiKZ/GVADyFGyHiWwq9V5t5t+rzsA+afw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454773;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nwyEfY5aRu6ya42hZkQYSi5D/mRQAowxPPDkUtFyWWY=;
	b=Sm5NUtAkZ/2Zwj+GZp+i6B0sBhBNfonlBWKZ0ZPpHOgx/ScZTXLx2qIpYvJ8xEyyFs61
	 U1iiLrxJI71QOu5BsaHzkFBi4LZXRxbpKrk4R9Y36a02y1GI661u/kDEVV+0yOypMYOk9
	 TyOwHaBYZU0yk1NZLPTOr2k35Q28ucA9On+twlJf97YktDy5Q3cpJjLilhZtqE+jzcq0X
	 VOh+WhQkYzXX3MaE755/Wq55e5u36e8l9k7vUUBnG6mKKDpZb57tLA3vtoKtx4M+xhtKc
	 H58vAFZipZVtqlwqVlOoa4cWBKe+4wSwSSvhUjL08rhd+JanGTDWHBQgX/6o5PCHVCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i1KFYUQf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7983606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i1KFYUQf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B011F000C0;
	Mon, 23 Nov 2026 17:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795454773;
	bh=nwyEfY5aRu6ya42hZkQYSi5D/mRQAowxPPDkUtFyWWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i1KFYUQfIyvQVsvLX6BOFv/oAw/tp7uKJlpX28VylpvrQeJU4eJULgPP8++FCer/G
	 63FBStO84o7S6SowrIK9ric19H4mJtfCyXcMh6IuvQRBVePE33xmHZrEkQllRqE1Z0
	 /CaphWiUpxEU3PXbSyvvtcChKu4yBMChXNMZcMK42ESQ2ZeHXQ8G6YJlPnVCsCjHKg
	 2Fg1f5C8ca/vekCzMlDuT88yKzw/XiDH1xJI3/Y20G4/7L3HhBog1SWcfaey55two4
	 1xYjDJJxtB0FdkIgG+Y6XjN1eBQOhOlfSiPjewZ5gRmJHe/32QiD3DEK+yjMfzptCa
	 ZZjsXMeNIqhsA==
Message-ID: <sashiko-outbox-229735@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: SDCA: skip port channel mask for Output Terminals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261123165612.440542-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261123165612.440542-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 17:26:12 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ASoC: SDCA: broken OT channel constraints in
  sdca_asoc_set_constraints()
--

commit 635257264d5313aa7d4b4104f59cbc1b9c469fe5
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: SDCA: skip port channel mask for Output Terminals

This commit skips intersecting the channel constraint mask with port_ch_mask
for Output Terminals in sdca_asoc_set_constraints() so that DPCM front-end
capture streams are not restricted to the SoundWire port's channel count.

> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index aaa84156f20a8..6e42f5262aa77 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c
> @@ -1645,7 +1645,14 @@ int sdca_asoc_set_constraints(struct device *dev, =
struct sdw_slave *sdw,
> =20
>  	constraints->channels.count =3D ARRAY_SIZE(channel_list);
>  	constraints->channels.list =3D channel_list;
> -	constraints->channels.mask =3D cluster_ch_mask & port_ch_mask;
> +	/*
> +	 * OT paths may re-channelize downstream of the port, so only
> +	 * narrow with port_ch_mask for Input Terminals.
> +	 */
> +	if (entity->type =3D=3D SDCA_ENTITY_TYPE_IT)
> +		constraints->channels.mask =3D cluster_ch_mask & port_ch_mask;
> +	else
> +		constraints->channels.mask =3D cluster_ch_mask;

[Severity: Medium]
Does dropping port_ch_mask unconditionally for all Output Terminals leave
capture DAIs completely unconstrained on links that do not fix up back-end
channels?

sdca_asoc_populate_dais() advertises 1..32 channels and relies on
sdca_asoc_set_constraints() to narrow them, while cluster_ch_mask is
currently hardcoded to UINT_MAX for non-IT entities right above this block:

sound/soc/sdca/sdca_asoc.c:sdca_asoc_set_constraints() {
	...
	/* FIXME: OTs should inherit cluster information */
	if (entity->type =3D=3D SDCA_ENTITY_TYPE_IT) {
		ret =3D get_cluster_mask(dev, function, entity, &cluster_ch_mask);
		if (ret)
			return ret;
	} else {
		cluster_ch_mask =3D UINT_MAX;
	}
	...
}

On non-DPCM links, DPCM links with dpcm_merged_chan, or DSPless links
without be_hw_params_fixup, userspace can now request more channels than
the SoundWire source DataPort supports, causing
class_function_sdw_add_peripheral() to pass unsupported channel bits in
pconfig.ch_mask to sdw_stream_add_slave().

Even on DPCM links with a DSP graph, falling back to cluster_ch_mask only
avoids restricting fe_substream->runtime because OT cluster inheritance is
not implemented yet: an Output Terminal's cluster describes the internal
SDCA Function channels upstream of the SoundWire port (for WCD9378 OT 36,
the upstream IT 33 cluster is also mono, 0x1), not the host DSP output.
Meanwhile, dpcm_be_dai_startup() aliasing fe_substream->runtime still leaks
back-end wire constraints onto the front-end for Input Terminal channels
and for constraints->width on both terminal types.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123165612.4405=
42-1-srinivas.kandagatla@oss.qualcomm.com?part=3D1

Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8EA20FAB6
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 19:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744228610; cv=pass; b=Mp2wgO1n3ifMj/7cVOeZPdQ5nx6n+wnsNWHgK6QP12d9W0w0t4OHXYb/f6W3jfZawtQOWYYVW5d4JwlL0OaBRfEu+OwovTohuczfkAl57sYv9cH4/JV5+rUZCjXpVfefQwOtrZIuOTCbSz9D8frZWGvXdcEycFiTvnD8osgrlhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744228610; c=relaxed/simple;
	bh=TPWyt1Jw2HUQRwF/A7hr62iFKrlNDFEBzfGcLQRtuZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hDf32qcwBXSyJZEn4w3eQ9KGrcMM5NUJWDcnSZ899I+EJ+UKrClUTpnDSHmCksqJ39vlVnFmPpJBpOAj8nzcXLFqLdUjUbW/uZpc46nk2BeXxHYhmv2HqaaBtn8ymNLHepTW32BekjEw+1Bp6+XiVFO8QbeXzZ2nN8Zh74j6ebA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=hRhhBi8t; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="hRhhBi8t"
ARC-Seal: i=1; a=rsa-sha256; t=1744228600; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ew17pKysGJgnLVOZAewOVs2IO2O5A4E2wo1LJU1GGXEvfIoEniYOkEukwexLRH9Y+4nOPyMfL6UB46pmwUnc9rBqSBnB0LPYYB+a5Pz7JW5CPfAId1lESxu/Ya633wjT3bl6uJfP9xM90WNddV+uM8Iv5Ddb7gArDSb8alcx8JM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744228600; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OrW6wNh4NJBegeSeNPqsjC5PKPScxYnsdFAoxGXm8Gw=; 
	b=KLKbPj+tPzTGvfe3dxjeb5WhZbPDdhtbMTSDtbvvfE03RwedexutcWgE1cJOaCe4ry91D9ENgvCjWeruIdlMVtvpR1XnELaEtFdK3xipjH5RHSrjfxGbAJoJjCoq8lkgis5s9i85XOe/+1AWgR8Qo6XPT3uJPbWHN+Ju7ay0KOw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744228600;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=OrW6wNh4NJBegeSeNPqsjC5PKPScxYnsdFAoxGXm8Gw=;
	b=hRhhBi8tMhm/8ZfucGLFP/FQH01GQr/FHVfVnEy64vsyf/elGge2avmAWUWbqo4X
	DYs+eyY4Fa5sBy3P+rV4D+aqCkneD+GWB1IH6MBuMu8QE/T5rEU1HDiQo6MdaDSsUsC
	sumDNeSdXjt2sTClMDA0PWLIGZZYN0vgRJM0smjI=
Received: by mx.zohomail.com with SMTPS id 1744228599390607.8696276072129;
	Wed, 9 Apr 2025 12:56:39 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: Debugging CPU-side DAI hardware with a dummy codec
Date: Wed, 09 Apr 2025 21:56:35 +0200
Message-ID: <5586956.31r3eYUQgx@workhorse>
In-Reply-To: <e649be07-108a-4f7c-9471-74b74a4f73ad@sirena.org.uk>
References:
 <4927043.LvFx2qVVIh@workhorse>
 <e649be07-108a-4f7c-9471-74b74a4f73ad@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 9 April 2025 17:01:58 Central European Summer Time Mark Brown=
 wrote:
> On Tue, Apr 08, 2025 at 09:58:07PM +0200, Nicolas Frattaroli wrote:
>=20
> > So I set a driver override on my dummy-codec node:
>=20
> >   # echo "snd-soc-dummy" > /sys/bus/platform/devices/dummy-codec/driver=
_override
> >=20
> > And hope to now be able to bind the snd-soc-dummy driver on the faux bu=
s to it:
>=20
> >   # echo "dummy-codec" > /sys/bus/faux/drivers/faux_driver/snd-soc-dumm=
y/driver/bind
> >   -bash: echo: write error: No such device
>=20
> > Clearly, that doesn't work.
>=20
> I don't know what specifically you've tripped up over there but there is
> a little bit of special casing for the dummy CODEC since it's intended
> to fill gaps with partially configured DPCM stream, not actually be
> used.  If you just care about the signals then it would be easier to
> pick some simple CODEC with no registers, as a bonus you won't have to
> futz around at runtime overriding bindings.

I actually ended up finding `sound/soc/generic/test-component.c`, which alm=
ost
works for my purposes bar not having any tdm slot callbacks, which makes AS=
oC
core not use it for TDM. That's simple enough to add:

=2D--
diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-co=
mponent.c
index 5430d25deaef..89b995987e2d 100644
=2D-- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -140,6 +140,15 @@ static int test_dai_set_fmt(struct snd_soc_dai *dai, u=
nsigned int fmt)
 	return 0;
 }
=20
+static int test_dai_set_tdm_slot(struct snd_soc_dai *dai,
+				 unsigned int tx_mask, unsigned int rx_mask,
+				 int slots, int slot_width)
+{
+	dev_info(dai->dev, "set tdm slot: tx_mask=3D0x%08X, rx_mask=3D0x%08X, slo=
ts=3D%d, slot_width=3D%d\n",
+		 tx_mask, rx_mask, slots, slot_width);
+	return 0;
+}
+
 static int test_dai_mute_stream(struct snd_soc_dai *dai, int mute, int str=
eam)
 {
 	mile_stone(dai);
@@ -203,6 +212,7 @@ static const u64 test_dai_formats =3D
=20
 static const struct snd_soc_dai_ops test_ops =3D {
 	.set_fmt		=3D test_dai_set_fmt,
+	.set_tdm_slot		=3D test_dai_set_tdm_slot,
 	.startup		=3D test_dai_startup,
 	.shutdown		=3D test_dai_shutdown,
 	.auto_selectable_formats	=3D &test_dai_formats,
@@ -214,6 +224,7 @@ static const struct snd_soc_dai_ops test_verbose_ops =
=3D {
 	.set_pll		=3D test_dai_set_pll,
 	.set_clkdiv		=3D test_dai_set_clkdiv,
 	.set_fmt		=3D test_dai_set_fmt,
+	.set_tdm_slot		=3D test_dai_set_tdm_slot,
 	.mute_stream		=3D test_dai_mute_stream,
 	.startup		=3D test_dai_startup,
 	.shutdown		=3D test_dai_shutdown,
=2D--

I also had to use an audio-graph-card instead of a simple-audio-card, as the
test component only supports those. So the DT just consists of a dummy codec
node with the "test-codec-verbose" compatible, the dai properties, and a po=
rt
with an endpoint pointing to the CPU-side DAI endpoint. There's then also t=
he
dummy audio-graph-card, with `dais` set to a phandle to the CPU-side DAI po=
rt
property, and the CPU-side DAI with that port property and an endpoint with=
in
it (pointed to by the codec) that points at the codec. It works, and if I g=
et
the time I'll try writing this all up into a fitting way in the documentati=
on,
as no documentation references to the test components exist.

>=20
> > I hope someone can shed some light on this, as it seems like something =
audio
> > controller developers would be doing all the time.
>=20
> I suspect most people test with an actual system.  A bunch of things get
> easier if you can actually play and record sound.
>=20

I did try that, with no success :( The shortlist of codecs that do TDM, com=
e on
affordable dev boards I can get my hands on and have a mainline Linux driver
came down to basically just the TI tas6424. I stared at it with no audio co=
ming
out before I had the logic analyzer. Debugging 20 or so wire connections for
serial audio, I=C2=B2C codec control, amplifier power, amp mute, speakers, =
etc. was
a very large problem space to explore. Even if I had the logic analyzer at =
that
stage, I would've had to have minimised the risk of getting distracted by
simpler hypotheses than what it actually ended up being. Turns out I am som=
ehow
sending TDM data on the second falling bit clock edge after frame sync goes
high, whereas the codec (and most things doing TDM'd I2S I assume) will want
it on the first falling bit clock edge.

Thanks for the reply, it gave me the push to go deep diving into what sort =
of=20
codecs I can use in the DT to get to what I needed, instead of trying to bi=
nd
a driver at runtime.

Cheers,
Nicolas Frattaroli



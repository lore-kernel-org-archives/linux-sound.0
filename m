Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3CE2C030E;
	Tue, 21 Apr 2026 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787956; cv=none; b=CCljStympmwglKJf/+FcWbI75Qm4vB9XEDyQGnDgyxeKpOnMW7OnP48CeFZPclK3DbVJL70AkBMmU8Ks4SEKENwsuahDTTrhyhfB2qIjzeOYbin2pRfgOEr3IsdDvF5O5Shhqff+VBKmQDeo+NiLZY0qPSE/X8ukY1oMDabZGJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787956; c=relaxed/simple;
	bh=SY3KSOzcorJWAw2/d/aJ85FElGX/2fzt0R+jpBBMhAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNjp9O6sY7DuMHu4aBLkvQUdQoeG6DjnFY19HCX2kKYnpOHRqTSAhqFtgCLzuVODbgvPnABv6fHtklQXEKB6aqBRpcE8USRumGaJ2wS5xyRPNXJpoDbpehvhsGL5EoR+o4rraMj00zRwLD0FSZd6W6sL6sTdo5UJiVxP4wRC4Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wFDi2-000000003X7-2yFJ;
	Tue, 21 Apr 2026 16:12:22 +0000
Date: Tue, 21 Apr 2026 17:12:17 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 5/9] ASoC: mediatek: mt2701: add HDMI audio memif, FE
 and BE DAIs
Message-ID: <aeeh4TW0IHLU5zB6@makrotopia.org>
References: <cover.1776646435.git.daniel@makrotopia.org>
 <59f911bb1a855a00c0d9dd4760f10ff0030fedb6.1776646435.git.daniel@makrotopia.org>
 <95e1067c-3c8e-4dd4-997d-f3be9d2cba29@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pghGe5VQSM39F6vG"
Content-Disposition: inline
In-Reply-To: <95e1067c-3c8e-4dd4-997d-f3be9d2cba29@sirena.org.uk>


--pghGe5VQSM39F6vG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 07:08:01PM +0100, Mark Brown wrote:
> On Mon, Apr 20, 2026 at 02:13:34AM +0100, Daniel Golle wrote:
>=20
> > +static int mt2701_afe_hdmi_trigger(struct snd_pcm_substream *substream=
, int cmd,
> > +				   struct snd_soc_dai *dai)
> > +{
> > +	struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> > +
> > +	switch (cmd) {
> > +	case SNDRV_PCM_TRIGGER_START:
> > +	case SNDRV_PCM_TRIGGER_RESUME:
> > +		/* Ungate HDMI and SPDIF power islands. */
> > +		regmap_update_bits(afe->regmap, AUDIO_TOP_CON0,
> > +				   AUDIO_TOP_CON0_PDN_HDMI_CK |
> > +				   AUDIO_TOP_CON0_PDN_SPDIF_CK, 0);
>=20
> It looks like we have clock API clocks for HDMI and S/PDIF on this SoC
> (see clk-mt2701-aud.c) - are there going to be problem with peering
> directly at the register?  We do manage some clocks via the clock API
> but not those ones.

Yeah, you are right. That came from a super-old vendor driver and I
didn't realise the exact same gate bits are alrady driven by the
clock driver. I'll drop that and prepare v3...

--pghGe5VQSM39F6vG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABEIAB0WIQQ8WXOkSQLJP/KOu5qX7zeyq+FyywUCaeeh3gAKCRCX7zeyq+Fy
y111AP0QTyLAlHpoP5/XuWLbe7t/+Ru+GlYU61Ygpcl8Nz3O7AD/UuXFl5391unL
s39J8r1DHhIewBnqoLCXVLsvqeLMKUw=
=j9TW
-----END PGP SIGNATURE-----

--pghGe5VQSM39F6vG--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C69408606;
	Tue, 30 Jun 2026 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826143; cv=none; b=rCZD0+ap5PGpFCzw6hAOpTFq+g7EaJCwh4b5oNyLccxVRnUkReo2IxJCQrHam1jGWfzbalAITnZhDnMrujq8E4LZnsm9MsERp5zz2U7JNeXjtZpWNJ/fJoTXUe+J5E+j6bTydHwzGg6AnEMLiZz3HoQYSq0CO0fv9p2O0lhQ7qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826143; c=relaxed/simple;
	bh=XTwrjdJOHQxdpu3yBE8uaXoDsCfzkT9Eqb6uKyK8g8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsJ248exGVYHHtFIqqzZdDL+IXLpDlldW6T+i6UTYauMoCROEC0dS36s2BcpmzdhqFgQBm6H8TNyzFki47e9vjU8OEvfak9gHWJ84uypbLSbpUY7fI2YZ61wqllednpsKIVondPrvld/UNiv+eWXZM+p6Pwtubla9vjS3TIAZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKmCj9qb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKmCj9qb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105D11F000E9;
	Tue, 30 Jun 2026 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826141;
	bh=ac1w5UDndWpfCVQuaUsP7m+pP7PCwbr3gsBFVFw2qGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QKmCj9qbPK0we9uPiMzsH/1QI6avTbJheXUhzVhwkeaYfI+Jpd3HS4x2mbeB0dwYn
	 d8w/RNPjSGg1L53htA99jxAztPNEoxgurte9Ag5XBLdJWWnV6pfG1EK1qEySHdavGc
	 ngO2XsQhNwQBud6rWIBkjjZGZvfYKPDjXo9OPJZ77+7lInP4qC6tu8kNDBlWOCoQzs
	 9Fa24EWY9G8HarZsR3tucNx7Kw+HzhBCAUZGAWMRaH6vbicVMmsu16Kk2c6l9peDWy
	 TATPkcMk7V/VBzym6rD71QDQlndxoibjFncQuW9RyKVxpgnzkHkRqA2B+Z9WKIaJRp
	 S3lJH2JULnXDg==
Date: Tue, 30 Jun 2026 14:28:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com, Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/27] ASoC: codecs: idt821034: Use guard() for mutex
 locks
Message-ID: <f5ab965a-9640-4df0-8108-7877f34b6950@sirena.org.uk>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
 <20260630063449.503996-10-phucduc.bui@gmail.com>
 <20260630092821.650c30ec@bootlin.com>
 <CAABR9nG5Wo1Wb+2_T6dR+6XTw8Vs9awSpQrSZ+k6=jp_ogoGCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YvGUs531CHtahqis"
Content-Disposition: inline
In-Reply-To: <CAABR9nG5Wo1Wb+2_T6dR+6XTw8Vs9awSpQrSZ+k6=jp_ogoGCw@mail.gmail.com>
X-Cookie: Air is water with holes in it.


--YvGUs531CHtahqis
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 04:14:33PM +0700, Bui Duc Phuc wrote:
> On Tue, Jun 30, 2026 at 2:28=E2=80=AFPM Herve Codina <herve.codina@bootli=
n.com> wrote:
> >
> > Hi,

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--YvGUs531CHtahqis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpDxJQACgkQJNaLcl1U
h9DhNQf/XmcvwsWjntcyq28UDoJfIndKAZ0IelWf8Emc+uAmXZNPOWpTM0uqDZes
/u7MDWAJqUVrhYSkVnpJHeqxagbMgkx8LTWcL9BnkPiUdZCLvpEdsUFp/JUQv6pO
G8cTLXcjn6emBGCu8fhDirNEMVIAc9OU2Sck85rDBWPz2TCNklkyQs4/7OJCLFcL
zMkFBQviyoWI3SmaGdbyfEBaC9bKtnapaXKXHNaf34EBXup36NEgzi5akVxGZ1Au
ZLbaF0yTkzZ1amPpEz3/apXiNcqeqX4XkBDT7VrtCHCEWwL5opd3/Y/JPPy6zeZP
iOKnlSkh2KUc6XIBbcGg+ofuL0J8+w==
=Bcef
-----END PGP SIGNATURE-----

--YvGUs531CHtahqis--

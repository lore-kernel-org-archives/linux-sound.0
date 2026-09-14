Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801013A1A27
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 19:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412543; cv=none; b=FRUItOf6XOa/H9Hz4rZln8dqW6S50qIcLq70UNcKQO5yRWHOif8kU/S3RO0wrqL6MrM6uff7YczGmq4Ew2Y1/51Pj1hGBW34XPzSWsJHfbFHXMV/tjNyszWB+Xd3aQhWKyIvzSOxZytjiMNDiKCOK9RJKyGnYei96jeVvAbHszw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412543; c=relaxed/simple;
	bh=qAEXRQu9HzXc5JP4TUIbjym/zJGs3QD79P1AMz8u6H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ipk9FTyTm74SvWK+5yAjnPuiWjzT/lZaFeR3lMTqnQrf5OyzCymqg0nAftcbe2HRmdrZiTr3O39JSQcS+/KY3/NeMpzfXbL6qSvzDUyRDP1jtrHXLJdZS2uT44CvefX2p9EMqB7Xb9T1nLz+3QPcX33AuboehTRVM7U1CJcfQQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VARZBUSf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VARZBUSf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C24E1F00893;
	Mon, 14 Sep 2026 19:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789412536;
	bh=qAEXRQu9HzXc5JP4TUIbjym/zJGs3QD79P1AMz8u6H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VARZBUSfbGrIYfv13lrAbcMCqsBaCyIhnMtak8pxDDfjRCGJq/lgEgVx86BJwkh1A
	 mF+YepHXNHIT0Kc4Kk+BXUhXkL+emXyZINXBXCGCrY4yqrPRYvBZAkT/ltu8e1Bz4g
	 /7OhCz5RSZRsgqhRxomuOwcAwhCt2zvEqitixJEmRmLuEbh+neMxZ/v9jrWltMREWj
	 EGTqydrU/Z4rX2XeuGAdqKvPRYwczba0EoOVBThLNH5BcM3jPFC2lndnUbVWhYNnYp
	 ZLiQvR3XOKvbg6Fa3D7yS9m6isRvUGtVasLqHbWJx+k9WXZgJLnzydEIkw3pUhbYt7
	 EulXgjqVaDlmw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 8E38FFF5654; Mon, 14 Sep 2026 20:02:00 +0100 (BST)
Date: Mon, 14 Sep 2026 20:02:00 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
Subject: Re: [PATCH v3 18/26] ASoC: SOF: ipc4/ipc4-loader: Add SOF_INFO and
 CODEC_INFO to fw_config_params
Message-ID: <aqhEqOUf90j9YDzu@sirena.org.uk>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
 <20260911112152.28528-19-peter.ujfalusi@linux.intel.com>
 <aqRsL8fZercsabgU@sirena.org.uk>
 <30950a7e-25ea-4b32-94ee-70c7357ffcaf@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="akl1Wx4tZcItUKy3"
Content-Disposition: inline
In-Reply-To: <30950a7e-25ea-4b32-94ee-70c7357ffcaf@linux.intel.com>
X-Cookie: Orders subject to approval.


--akl1Wx4tZcItUKy3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 10:28:41AM +0300, P=E9ter Ujfalusi wrote:
> On 12/09/2026 00:01, Mark Brown wrote:

> > tuple->size can be 0...

> It cannot be 0, the tuples are built in firmware and they are guarantied
> to be correct.

> I guess I have added this check based on comments, but I would rather
> remove them.

> s for the specific CODEC_INFO, it is also granted that the tuple->size
> is not 0:
> https://github.com/thesofproject/sof/blob/main/src/audio/base_fw.c#L111

> In fact, all tuples are added in a way that the size cannot be 0, but
> the check in the code is incorrect, it should be:
> if (!tuple->size || tuple_size > sof_info_size - offset) {

It's not always super clear when reading a diff what's being parsed
=66rom a file loaded from disk (which could just have been corrupted) vs
what's been sent from the DSP.

--akl1Wx4tZcItUKy3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqoRKcACgkQJNaLcl1U
h9CB3Af/VRHz8tsE2Zura9GqrdVYz9LRwgFj/lmnSKzXCNbcTdc9VWA9qZkv0AM+
TOXRpxvj/s8rigxfZTVhj1cnD6hRo2aB3cV88ssTkubIP814aFC/06Zqnn9zxubK
kcuCHghI2CqOZlF3LK451ncua9zFkQJXVQGWbBWaDavIriDcrxMQekD0dwu22ZbX
Nos7jpgUPqu81EOOcrcvvNkq9g7WdYp9zU5OXSypb5mCUzrMBAaVUXQY9wy2OCtW
cp7NthUFUs95Ob+pyN85F3fGsoNHo7UWRSqSyZlkV4zP8c8lMmIV72vXCk/ROiXC
veR55B+eE5/4uoODRo7ZLIp2Lztoeg==
=ljZc
-----END PGP SIGNATURE-----

--akl1Wx4tZcItUKy3--

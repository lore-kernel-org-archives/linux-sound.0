Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF66635C19F;
	Fri, 17 Apr 2026 22:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776466381; cv=none; b=oIFgZSNBLz9sNdFcP6fiio2+GW8AOUpx4DAbZopeKHP50UWtq5pw1FTY+dauXNmQgdk8hm+Vg1k/NCU5s3CcgyNWJrzMS82SgVf8/Wz8vwt7zC30rWmpOh7VW0xb273cGq7pJAI1EeadQJ9HVotg9RPq6505txW5Jj8h72C4IJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776466381; c=relaxed/simple;
	bh=Frw2WIcsMXau1lzNqvo61mU42MBSPeG0i7j4l0PnqU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUq28zEi+P+GYxXcBos/xuLuHHvL+9uR8zGknZiGl8xD9iZYWZcSIricdoPB0NSSziXSGWqFrTrrim/CUIQqe+s5W66g6hq2gBkkxtgDjNCqEMNZXJQvRYHPPgZ2Rkz/z239buxEzfsPSWZASF8vZS1UYtE8S6mNgJN4URDvmFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WD+AArgD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WD+AArgD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEE8C19425;
	Fri, 17 Apr 2026 22:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776466381;
	bh=Frw2WIcsMXau1lzNqvo61mU42MBSPeG0i7j4l0PnqU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WD+AArgDs+vyowQlE5XeV2t9ZJObt/J1PFD4+zhCh6pjvkZOkeoXeGlT4FIcuTw5d
	 6KOggY7yyvLsa/1jBjN3oYKmfuPg6aRAEc1FjGGRfsMhpwJH4JR3XFR/SJQ/i5buOr
	 qBefF7+8NhwuMHxxCC/vuAg+nJcsbFwbIgeZ9nY7KqnRbVrLq4EbrnvFJlz4B3QNeA
	 w8vHjVGd1bLmbjN1VPlzPpyd8PFVKr9QsgM5qcBB4niTWCjQNzt+7851Rp+s10t0e6
	 7qlfMxBT4PPAPYsPiV0pMnI48o7oUnxCe+BeYGRWyF25EwJMaxaPQepQK/IyHnirWU
	 zXKGRPvcAlgyg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3C6671AC57F2; Fri, 17 Apr 2026 23:52:57 +0100 (BST)
Date: Fri, 17 Apr 2026 23:52:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Cyril Chao =?utf-8?B?KOmSnuaCpik=?= <Cyril.Chao@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Darren Ye =?utf-8?B?KOWPtumjnik=?= <Darren.Ye@mediatek.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8 08/10] ASoC: mediatek: mt8196: add platform driver
Message-ID: <aeK5ySqgvHdBvuuB@sirena.co.uk>
References: <20260324015719.17543-1-Cyril.Chao@mediatek.com>
 <20260324015719.17543-9-Cyril.Chao@mediatek.com>
 <892468cc-7eb4-411e-b91b-f14789d8da0c@sirena.org.uk>
 <da5752796e1774b6bbc24f5ef1ab2529e24a384f.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Z+JCqeY2FxPdfrp"
Content-Disposition: inline
In-Reply-To: <da5752796e1774b6bbc24f5ef1ab2529e24a384f.camel@mediatek.com>
X-Cookie: Victory uber allies!


--1Z+JCqeY2FxPdfrp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 05:53:25AM +0000, Cyril Chao (=E9=92=9E=E6=82=A6) w=
rote:
> Thank you for your assistance in reviewing. Could you please also
> review the modifications in the diff? If everything is okay, I will
> include them in v9 in the next update.

That looks OK from a scan through, though it's possible I'd see
something else if I review in full context.

--1Z+JCqeY2FxPdfrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmniucgACgkQJNaLcl1U
h9DACwf9H2I11k4JlXEGCoDjtI4sgy3/SrHG9jWgFJ4N+WaSWg5a00Cs1icay7Lz
CrAmRcjVbCuLniYSP18LS3Mbv8dtKs98W60KdDGGHDz3pxFCKGYr4pnhkXdM/SFz
D0PbcBHlaj11Abd4kUSeTG3JO4GiEUidCja0vZX+YYGVaPJjWeA3SJwZuvkSjUcM
FJ6hhGnvDJcyhwt29fV+FTYVe8gYxUYQFELH0vKUwsk5gj58vi6ZFHo+1GDSwBbC
KfCAO2nvkF1mJhLJckU2xca67RoYdMULyNCkh5ig/8g6/u54TuD5smI4wByhHmwK
Qw+KSoMw96DdwqNqYYb0Ewhh9pl92w==
=Ugrc
-----END PGP SIGNATURE-----

--1Z+JCqeY2FxPdfrp--

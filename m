Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067913161A1;
	Mon,  3 Aug 2026 02:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785724203; cv=none; b=f4wT1mhgf0za1CwaKC9UbOuX5XDN7WaiYFbFV6aOJM9m0iGXfOBNpL0kkRK0BFOtwrdghDlv+ZhyU9xH7KId2eZD0HwbxJDAvv5M8mrShDCurS4EeQZNRtEQ7JfXvkY1IR5Nu6Tze2nV0b3nVY8Cl1uJ2axBevfOZD7Ycf6/7Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785724203; c=relaxed/simple;
	bh=Iqo4tA56AgBDsZpUf2sIFNX+cYV6PvHpqKqxKhwHc3A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=ocXZIVHrR0cENSYTtRDoyqPXddR0EvykZ0MmMYcg04QF0LbJc+9R6RxpH78eLdiE+m3z7OyV9021/SXIfNPsmKlJjLBL8bhlZ4pNPPdVvdjbDDD36BHeQrLkyO2uG+cg1pglrcbjlrXTqRSCu1xdRo1KnwTyDpFR4qZXW4hDdNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=hyk0gBOw; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="hyk0gBOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785724191;
	bh=XreocC4a0nsXO2Wrw1QqhlxohulSMdKlZ7zx/VQQVog=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=hyk0gBOwIeowNBGC6LGgpAQuHpKGn6Q25F3Fzw3XLJdUUs+cNSjt1MCtAfByyNTep
	 FSOgh9chkl4U3zgTq826p/o478XWdvnhOZLNpRxlF+7yCgm7yDPJ1WKXwhSLjosPoH
	 6rFjgdQtwV32BpVMxR33HiXDJ4O1WzJbizlHB9gc=
X-QQ-mid: esmtpgz13t1785724186td5e4bdfc
X-QQ-Originating-IP: Rhdr5C5Udr9yd4G4Y4lT5pqjZ0A4wVk50i9uCzyoX6M=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Aug 2026 10:29:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1045208562662155205
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b221c2993898b54412cec0db06be210fff76d164353ddb68c3a0007334fe;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 02 Aug 2026 19:29:42 -0700
Message-Id: <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Goko Mell"
 <goku.sonxin626@gmail.com>, "Jinmei Wei" <weijinmei@linux.spacemit.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "bui duc phuc" <phucduc.bui@gmail.com>, "Yixun Lan" <dlan@kernel.org>,
 "Takashi Iwai" <tiwai@suse.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Liam Girdwood" <lgirdwood@gmail.com>
In-Reply-To: <20260731101539.36290-2-phucduc.bui@gmail.com>
References: <20260731101539.36290-1-phucduc.bui@gmail.com>
	<20260731101539.36290-2-phucduc.bui@gmail.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N4ZILu3POr3OIwaScrzSHsHAx2AD1tsLkZJrdeRwcgDkagHzwhwBb9Ce
	w1UGftSbluNRxHkXxg4DcoGamtUx/LFXiRZQR9jFeg81ElILvDG7eVVB4EqV9YHeOtTE5gc
	K6O4SphAyb2yYIGcBq8aOQ8iRhpMfG9cGkkvaURZMHTXoiompJpIykSfV2/TeVP2jcPYnKX
	W+h4d+8+i0zxw+GZeitJWu5HQviVq1cZiiCUjTq8orcitofD+wcVlr/EesdaBqjgVwbISwI
	cKWdkCH9ElZqkYQdS9cmowB901pPJQ3KNOrcoTMOqO9ybTX5w8dwI6u+7jnXc1ZyJh+c4Nx
	JbUT4jDrJA5RefinYXUfn6JalVxcI7mKfWceUdeja23CK4ZaKtDr6knMVhtUnSjraO+1BlR
	HRWY3HLUkbqhHAv0+N43+3VbIMOQS/OarPIqqMWUhrBbklhK1ljKTYCrtoa7X46WDz1zLy3
	X1hmyZ4jaS3o5sti79SjlAcaWjJtZ6bgRn9ICitbFlU0DnM6hlnc0WbcfYd58HDhZmOgpc6
	E4EW8bwYLWQ00+grdFio1Ti0qFJzXrRiqckzvB0GIUVGJs18C/GrzYBPkIr8PfrTJlc+0Ri
	mtqU6QWtMZd0Wz11RsGn22mOMMBNH9af5heeS/A61u4DZVO9hvvklANL8BZSPtnVfcq6xwr
	qwDTIL0V6T+HWwiVScWZGxdZPY/W8WXnMyfMtgdniFG62XCPfEmtsq+0Bmw9C/X5DkI6NZ0
	ElaacXPjybfTMfa0C6UAX/IKsNKY3BTpRPBRpErgBvCbNgQQNOw2cBMXmoMAO5kAubdD/lv
	7b1THsxTj7I960MzorMD4SjSl+8uGtYAG8d0PkunQjwueuLv9EVOEcn4frWhF6BpMUOch+8
	ep3d60iPGUoDcyLUSZibXA/cJ3zWSu8wDdAArTkD5dF+mZEUjPFX9AvRkcKHTt1Gbq8fQQm
	lgWEIQ1E7j0uwX9ovspa7dUhGOoKmpEX7VN0TGu5FhFralyraAz/WN78Ws1SSEM6idtnRgw
	EcK7SPYIPZ4acDjqvDv1pI9vBY9jgjEW+WiWHBOJZXkqlRHj61M9IxDAdUMU+Qo0fHgIuw+
	A==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

--b221c2993898b54412cec0db06be210fff76d164353ddb68c3a0007334fe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> The current caller does check the return value before using dp, so this
> isn't an active bug. Still, initialize *dp to NULL upfront as a defensive
> measure, consistent with how core helpers like _snd_pcm_new() handle
> their optional output parameters.

If devm_kmemdup() fails, spacemit_i2s_init_dai() returns -ENOMEM. The
sole caller checks the return value and returns immediately, so it never
accesses dai on that path. On success, dp is non-NULL and *dp is assigned
before the function returns.

Therefore, I do not see a path where initializing *dp to NULL has any
effect. Could you clarify what case this change is intended to handle?

                                            - Troy

--b221c2993898b54412cec0db06be210fff76d164353ddb68c3a0007334fe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCam/9Fg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvFGcA/R3CHaTVtH2RGXHY16xO3fRcol8fUVuIUUe+TR1t
9JgJAP91jUDciFgUl5vhTEeiVakcOt9V0hoWOqKp3sSSP0aYCw==
=VXsS
-----END PGP SIGNATURE-----

--b221c2993898b54412cec0db06be210fff76d164353ddb68c3a0007334fe--

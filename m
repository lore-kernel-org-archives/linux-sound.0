Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310213;
	b=p954lKlGJOIfK7Xr/LhptyAVu4qWv2MTRzwGapG+d4QumEIeCcfOksKOuiyPNrMPnVYH
	 XPWPy3/QYIO0mI1wZ1oVU8DYDhwj5/Wx5rNEipjxpBuy8Z/ZvT/61gG6LCzkB56Qchm+i
	 tQoECyuO3GRau2puEtBXFFm9Rff/DAi0ZmqfBZQv8e0AKabyWbxVo2V0/TSdRfhX60CwN
	 FMpCWGV8YinU13aiD7p2HYBMW1VGAnR0ufCnjnXj88HhID53MU7ADhJTX7oRu4CYmYbYY
	 mSu0B0bDBFKyd4GgwQgVz4QZ/hlXwId+poZ6noK3DHvJ/ipE7+A+WhNE3r2PYUg/xpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310213;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=hNzhzzDWVOicaiHX2YgXwVI6Ivy5qz0qawZZSN4jOOo=;
	b=BKqtJ7j0/HP8xal9dlyLz/eeNPycODs4MyWFCvhSQYf6xDUoYlhfEfG7EYO1pzkSNmKY
	 VKOsAM5AXOiIeKg0EOYMSJBidFqRk1k1olWa2cNnrGPZdNFd5xBt2B+8VFynyxyWG+Ns0
	 mFmUE4UD5OhDbgy0EtihqmR9mkDrC7D2HzD7prxUZ6ukUIof3KRVH/kZ4LFCmTwBkyCJ2
	 o75o0AdNjsDSkEmkAwF8QKIAbLZkSEqC2LxlkccvUjCGQrK3k3Ho/FuZjOXUGr7RbMr7x
	 qFtvXI6aNahloNgpGbgFJ6bjkPxbVAT9KmaKu1/Wek5xXguvJzQUl6y6Ul9+ued/yDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GevCfeUx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14079606A32A
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 11:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GevCfeUx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342591F0089F;
	Tue, 10 Nov 2026 11:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794310212;
	bh=hNzhzzDWVOicaiHX2YgXwVI6Ivy5qz0qawZZSN4jOOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GevCfeUxLUVJyRx1j0UdF2D+Apbfkg+SAc8s1m1iDrajTFZompTS25cGbnA97hrVW
	 HOtXH69t9TNs+7/HbxdyqUEXSA/4Oid0ItzhIQROLOwb7Xz2odDpRNBkdPRV2i5Pei
	 KlMw/VrmJVsFDMDN/KiZxYuIeSpthLoSV1W1Kh8KdNJDdvVlkm7OF2IHyru7MLT4z2
	 HpSyR/ZEdUaTzMw7j6pjEcURR++26SDz9r1jbBk2qV4Y5UJWHJwR4aAb9B6nZfvlSE
	 hc+uBN8u7YYKayJPr/4acqBHI6Fy/jG00DvaCIdrcltvdH8ABFnCrvumpECHj9YD5Q
	 N5MSQA3DL0xMw==
Date: Tue, 10 Nov 2026 11:30:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Qianghua Wang <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	bo liu <bo.liu@senarytech.com>
Subject: Re: [PATCH v2] ASoC: sn624x: add support for the SN6245 part ID
Message-ID: <bd49b599-1571-4948-bf8b-3bd507b95834@sirena.org.uk>
References: <20261110032012.711191-1-qianghua.wang@senarytech.com>
 <20261110034736.742465-1-qianghua.wang@senarytech.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TjfaQ0cDiex3p2In"
Content-Disposition: inline
In-Reply-To: <20261110034736.742465-1-qianghua.wang@senarytech.com>
X-Cookie: You can't take damsel here now.


--TjfaQ0cDiex3p2In
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 10, 2026 at 11:47:36AM +0800, Qianghua Wang wrote:
> Panther Lake systems such as the MECHREVO YAOSHI report a single Senary
> codec on SoundWire link 3 (mfg_id 0x0496, part_id 0x6245, version 0x3).
> The SN624x driver, the sdw_utils codec info table and the ACPI match
> tables list 0x6242, 0x6244 and 0x6247, but not 0x6245. SOF then logs
> "part id 0x6245 is not supported" and falls back to the HDMI-only HDA
> machine driver, so the speakers and the headset jack stay silent.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--TjfaQ0cDiex3p2In
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzAD0ACgkQJNaLcl1U
h9DDzAf/aUwLn2/fZTes+HkknnRxBL101rhhCNuK8kTVsW9P/v7iRlSkeZdSSEhD
ul6yQwpn35pdq2RZo46emIaWguyR6XcfjGo33GRf/ZXH1TY9vsAz8qqDi+SI/bxb
4NJqEaewVCUS+byQoVocbyJRWuFbo9NukfiHr+7Mic6gfXJt4imkD6BA9NS2Z3kk
Oyzdh4YsRoPwe23zUIFYalz88TgHBoVeZGXhn+sgnQ2TnQa9lwetX14uyo6N5Hsv
oIa3TAaPwh6DjUGQXoZvR95BuxnL0Be+0VqsHjeVmaBFklLzPb4Ffm4wRaJCCAQl
BTaj3LiMt3wz8r4lv4n3SsjuIODGxg==
=FFDV
-----END PGP SIGNATURE-----

--TjfaQ0cDiex3p2In--

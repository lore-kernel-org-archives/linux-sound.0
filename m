Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67443391835
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 12:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624005; cv=none; b=QQiwBZK+y+6SQkYvz/1gmymLfQVX1UCUgvuG0ynfNNyok2owjforqHsy7BwnUi18JSxurTj3nrtkRjT2CD8ptUSjZtlv0v/nG7H7XpOn3D6TsG1YjBZXv/InEVqSVAIleWcJxa4STSR7W81src1/X/Q/YjyuT9hh2OFVWu/pQoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624005; c=relaxed/simple;
	bh=q32Ug0DVNKaYb8vkerPNKRtXm+pKjTDxiKCVi2gcuFE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PO9xzaIyAiD5CzaXMiG/GSMbh9n2TrktuOzdBo2HQULq00djFHMgCc7I7zWVKjtjv77IhQRzJ8lWx2yOYX61S9oYVCfMg7Hp+F3ALLXdEvXKlv+sg/Sxha+78L6dkggeffyh0p5yv5pf5DcgJvwS6RKYWfpTv4REZ76sVVTqAqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=JRWVi5XY; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="JRWVi5XY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1786624001; x=1786883201;
	bh=os7DnR8Xbg2zP8Zn2jhUydepFzP2B3kXgx2s5Nng2WY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JRWVi5XYegTUATvjSNC9+e3neAYvQVknyp6KQzJc0ADcTmQaX/LBREIeuQsgJhba6
	 X0vRxt9xsunGVHxtSMdBGy/057RVRqzVsPqYKPprIzIket9fAiAhXeuxt7pmiVeffs
	 3NOLS8LNNSVzlQeyWtHR9vxA1HgqMkwkEgx91W5IrxzabhsYwSSv3bX3fmKNpS0XGJ
	 xSm/8vMgb77tDrP6v5lVILS0cW8X6HRPW4SllqISufB5xfst6Y1hXabKNE8koefVm3
	 sCDd4Zgeb9Y2tty/1wTgMJPe2Q+AGIz7BqjXOpb4Y3s5rPyFHAFF8WcFdeEnYBWzHM
	 9FrwIhFBWK4TA==
Date: Thu, 13 Aug 2026 12:26:35 +0000
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, linux-sound@vger.kernel.org
From: Robin Everaars <robineveraars@pm.me>
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello <Mario.Limonciello@amd.com>, "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, Syed Saba Kareem <syed.sabakareem@amd.com>
Subject: Re: ASoC: amd: acp-pdm: full-scale burst on every DMIC capture start
Message-ID: <20260813122632.9851-1-robineveraars@pm.me>
In-Reply-To: <20260813121645.15370-1-robineveraars@pm.me>
References: <20260805181130.75314-1-robineveraars@pm.me> <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com> <20260811123336.197402-1-robineveraars@pm.me> <25022e80-1dff-46d8-891e-5fe7219f7331@amd.com> <20260812134148.17343-1-robineveraars@pm.me> <759b61f5-6584-4397-bd61-8995bf5aa5fe@amd.com> <20260813121645.15370-1-robineveraars@pm.me>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: 4083069658069897ee9ccb33f998833556b51d23
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------8da1d97778046387133b3e218c35887f8996d1af7748a5c18772336c7824b44d"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------8da1d97778046387133b3e218c35887f8996d1af7748a5c18772336c7824b44d
Content-Type: multipart/mixed;
 boundary=8ca8de3e9643a3479502fa0769161ddaa6add023e80b81abfc52fbcbd0b2
From: Robin Everaars <robineveraars@pm.me>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
	linux-sound@vger.kernel.org
Cc: venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <Mario.Limonciello@amd.com>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
	"Syed Saba Kareem" <syed.sabakareem@amd.com>
Subject: Re: ASoC: amd: acp-pdm: full-scale burst on every DMIC capture start
Date: Thu, 13 Aug 2026 14:26:32 +0200
Message-ID: <20260813122632.9851-1-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813121645.15370-1-robineveraars@pm.me>
References: <20260805181130.75314-1-robineveraars@pm.me> <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com> <20260811123336.197402-1-robineveraars@pm.me> <25022e80-1dff-46d8-891e-5fe7219f7331@amd.com> <20260812134148.17343-1-robineveraars@pm.me> <759b61f5-6584-4397-bd61-8995bf5aa5fe@amd.com> <20260813121645.15370-1-robineveraars@pm.me>
MIME-Version: 1.0

--8ca8de3e9643a3479502fa0769161ddaa6add023e80b81abfc52fbcbd0b2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

One clarification about the isolated -EIO mentioned above: I removed patch 2,
rebuilt and rebooted into the earlier patch-1-only module. Its SHA-256 was:

  cd55e119961b80066c66ae7abb5f05ca97fa2747de7887a17ee45c724f19fc9d

The first runtime-suspended capture after that reboot again returned -EIO
before delivering data, with no matching kernel diagnostic. The next three
runtime-suspended captures each delivered all 48000 frames with no clipped or
>=99% full-scale samples.

I therefore do not attribute the isolated -EIO to patch 2. The reproducible
patch-2 regression remains the scheduling-while-atomic failure from msleep()
in acp63_pdm_dai_trigger() during active-capture resume.

Thanks,
Robin

--8ca8de3e9643a3479502fa0769161ddaa6add023e80b81abfc52fbcbd0b2
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - robineveraars@pm.me -
 0x8B6BA132.asc"; name="publickey - robineveraars@pm.me - 0x8B6BA132.asc"
Content-Type: application/pgp-keys; filename="publickey -
 robineveraars@pm.me - 0x8B6BA132.asc"; name="publickey -
 robineveraars@pm.me - 0x8B6BA132.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuMTAuMAoKeGpNRWFoOGxaUllKS3dZQkJBSGFS
dzhCQVFkQWFSa3p2ZTQ5ckJFSk1LSkg3NDZSWEhZKzJmVDc3b3hST2k1ZAo4SnBMKzY3TktYSnZZ
bWx1WlhabGNtRmhjbk5BY0cwdWJXVWdQSEp2WW1sdVpYWmxjbUZoY25OQWNHMHViV1UrCndzQVJC
Qk1XQ2dDREJZSnFIeVZsQXdzSkJ3a1FIY1YvYThzR0dvcEZGQUFBQUFBQUhBQWdjMkZzZEVCdWIz
UmgKZEdsdmJuTXViM0JsYm5CbmNHcHpMbTl5Wng2VjVxUzg5dzdDRFlTSXNjNU54dVBKSTFyZ29F
eVkvdjhkYlAzSApxa29OQXhVS0NBUVdBQUlCQWhrQkFwc0RBaDRCRmlFRWkydWhNcmIyWHVqRm5G
akxIY1YvYThzR0dvb0FBQVpzCkFQOXpJS1d3dWJDbEZFczBKNmpwUUhUS1hGVHErOTlNUmtmREtx
SVRidW1RelFEL1IyT2F6VHA0b0NKTzJiT0QKTkZsaVZBbTh5WFA2QSs1ODZ6UjJZS3QwUkFiT09B
UnFIeVZsRWdvckJnRUVBWmRWQVFVQkFRZEEzcDVGN2I1TwpGc1dLclNXRW1FSGlhL29lN25vLyta
MVcwT1BmZllyRFB5OERBUWdId3I0RUdCWUtBSEFGZ21vZkpXVUpFQjNGCmYydkxCaHFLUlJRQUFB
QUFBQndBSUhOaGJIUkFibTkwWVhScGIyNXpMbTl3Wlc1d1ozQnFjeTV2Y21ldlVkUisKViszVWd2
SVZqcURMRk9XeXlHcDVoNEpYQVBmWVpzRC8vUkhndlFLYkRCWWhCSXRyb1RLMjlsN294WnhZeXgz
RgpmMnZMQmhxS0FBQm9GZ0VBOGU0ZVNMU2FMbXY4L2UyVzFMOS9WS0FiajJaN0pFUzZLQXBpOUJa
Nm5RZ0JBTmhaCkZoTUZ6c3l6dTJZWXRhQjhTWXRWdGhKSjYvZUlRVFQ2VWRRRUlZc0YKPVlLaE0K
LS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQ==
--8ca8de3e9643a3479502fa0769161ddaa6add023e80b81abfc52fbcbd0b2--

--------8da1d97778046387133b3e218c35887f8996d1af7748a5c18772336c7824b44d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgmp9t/sJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmejuvbAxNh7OWI21JWsXWHkFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAK8rAP9N8W7hITHRsT1l1N6UnX5ZU2UAOGEG98+RLG+h
nsH87gD/VgZdmUvZiUCt52xJU7bo9EjlwV2OODWq7Ph15txtMwY=
=DNvL
-----END PGP SIGNATURE-----


--------8da1d97778046387133b3e218c35887f8996d1af7748a5c18772336c7824b44d--


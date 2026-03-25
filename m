Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4676940FD85
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774461551; cv=none; b=DzN04Mw6MX+4BhChN4lnc4+R+hm6Aan5gnK4oaAXlARN+gvxkhkUDCSPNmKiLny61xSqZysg3VP2mEskh38cEf7yeWSsXh35x5KfCzse3jxooCKydYZBfEq9mqM42T3K3nPilLj/NKR0Z4Lv4rqTEk5QyE7AbaRodJnNVLzL6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774461551; c=relaxed/simple;
	bh=zSzmMPqos+6L3YNuPKJXR4v6pKwXXIEAvRw0cH+axxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jxw2i7ZMocx+wU0T0w8ij2uS8a3qBSobfL0opXsy3FwIxT68QIqSZw6HSru6m8I8F9/bim39zC9UAS4j7bXHtXE+NZ5czL4thwFFt8+cJdCtansS6p35vZdb3US+g7O50hnMe8p6D4jr0GIUXvhTdMfc6EzJBZBf98IBhPJUjko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgHWqyVi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgHWqyVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F9EC2BCB0;
	Wed, 25 Mar 2026 17:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774461550;
	bh=zSzmMPqos+6L3YNuPKJXR4v6pKwXXIEAvRw0cH+axxQ=;
	h=Date:From:To:Cc:Subject:From;
	b=EgHWqyViq0V/VE+cAXd+XfhbB5O1dGSYRiY0ilySHsUfxM9g071mXCBx4qHWZ4Fu6
	 LSxjtwIJxJZF7qSXNCnjE/6QhnmG05LEVYfnSZbSLDKwAYDR71IAMNWKDjGmhhVUAm
	 sYnRBh142k/jFi4lDIcPgmcgOT47Ae11YKXZSdketiGAIT/BLdS4ceE4pS0ftsYLQZ
	 Hi3dxNsD/CT6gjHk943Oj7gux85/vZkk+mHQQfPGAOUgdnsoper405DtKZb2gtMr2i
	 +mlzuYrSKFUSQg+6OzU/+YjiIm23gLwn1h3Ev6ghLM+oTMh2Uss8363sxeBN6GTDz/
	 XR05J2xHEq3jA==
Date: Wed, 25 Mar 2026 17:59:07 +0000
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: KASAN issues with the Cirrus KUnit tests
Message-ID: <5adc73ab-596b-4dd7-a51f-ba8e9f8fc78b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4xp3WUD3mFiWUF1j"
Content-Disposition: inline
X-Cookie: -- I have seen the FUN --


--4xp3WUD3mFiWUF1j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I tried turning on KASAN for KUnit with --kconfig_add CONFIG_KASAN=3Dy
but it fell over in the Cirrus tests:

[17:46:43] [PASSED] cs1234 dsp1 fwf_name: system: alsa_name:  expects:(cirr=
us/cs1234-dsp1-mbc-vss.wmfw cirrus/cs1234-dsp1-mbc-vss.bin)
[17:46:43] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[17:46:43] BUG: KASAN: global-out-of-bounds in wm_adsp_fw_find_test_pick_fi=
le+0x8cc/0xc80
[17:46:43] Read of size 8 at addr ffff800081e5ffe8 by task kunit_try_catch/=
18349
[17:46:43]=20
[17:46:43] CPU: 0 UID: 0 PID: 18349 Comm: kunit_try_catch Tainted: G      D=
 W        N  7.0.0-rc5-g0e67ecdbbc43 #20 PREEMPTLAZY
[17:46:43] Tainted: [D]=3DDIE, [W]=3DWARN, [N]=3DTEST
[17:46:43] Hardware name: linux,dummy-virt (DT)
[17:46:43] Call trace:
[17:46:43]  show_stack+0x18/0x24 (C)
[17:46:43]  dump_stack_lvl+0x60/0x80
[17:46:43]  print_report+0x17c/0x4c4
[17:46:43]  kasan_report+0xc4/0x108
[17:46:43]  __asan_report_load8_noabort+0x20/0x34
[17:46:43]  wm_adsp_fw_find_test_pick_file+0x8cc/0xc80
[17:46:43]  kunit_try_run_case+0x14c/0x3b0
[17:46:43]  kunit_generic_run_threadfn_adapter+0x80/0xec
[17:46:43]  kthread+0x2ec/0x380
[17:46:43]  ret_from_fork+0x10/0x20
[17:46:43]=20
[17:46:43] The buggy address belongs to the variable:
[17:46:43]  0xffff800081e5ffe8
[17:46:43]=20
[17:46:43] The buggy address belongs to a 0-page vmalloc region starting at=
 0xffff800081af0000 allocated at paging_init+0x510/0x5b8
[17:46:43] The buggy address belongs to the physical page:
[17:46:43] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 p=
fn:0x4205f
[17:46:43] flags: 0x2000(reserved|zone=3D0)
[17:46:43] raw: 0000000000002000 fffffdffc00817c8 fffffdffc00817c8 00000000=
00000000
[17:46:43] raw: 0000000000000000 0000000000000000 00000001ffffffff 00000000=
00000000
[17:46:43] page dumped because: kasan: bad access detected
[17:46:43]=20
[17:46:43] Memory state around the buggy address:
[17:46:43]  ffff800081e5fe80: f9 f9 f9 f9 00 00 00 00 05 f9 f9 f9 f9 f9 f9 =
f9
[17:46:43]  ffff800081e5ff00: 00 00 00 07 f9 f9 f9 f9 00 00 00 00 00 00 00 =
00
[17:46:43] >ffff800081e5ff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9 =
f9
[17:46:43]                                                           ^
[17:46:43]  ffff800081e60000: f9 f9 f9 f9 07 f9 f9 f9 f9 f9 f9 f9 00 00 00 =
00
[17:46:43]  ffff800081e60080: 07 f9 f9 f9 f9 f9 f9 f9 00 00 00 00 00 00 00 =
00
[17:46:43] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[17:46:43]     # wm_adsp_fw_find_test_pick_file: pass:16 fail:1 skip:0 tota=
l:17
[17:46:43] =3D=3D=3D=3D=3D=3D=3D=3D=3D [FAILED] wm_adsp_fw_find_test_pick_f=
ile =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Could you look into that please?

--4xp3WUD3mFiWUF1j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnEImoACgkQJNaLcl1U
h9ALpgf/c4Txk83SnUG24ZMWgLhEKjp/wQqv4kSaDZeC6yEmxJLBj04H96p5jtyZ
UUuCUP19TBlK+06+KUnvryRw4jvoSBu4Ey3p18QFYEr6H/dyTulpnTg8Lid4dncO
yJG1ViClVLCTiXzE4G2HLDxipU+g8+Hk9Se2gkSAsEoTw1Pi79zKD9HsDd2lqWXQ
jAGA8vmtLqd8mKP3S7W6N8lFGT6L6ZhLWag/sTZlOxTOQcEh3LKgR1SkWQFNt3q8
2xmq96HJfH471UZTyDCEcj0p1gk9T/aiUEEX7TbwJnAhzketq0k+Wi5RudWPZuN1
wQRoac7sc/x/mz0qTdNzAD+lUMg9AQ==
=6pC1
-----END PGP SIGNATURE-----

--4xp3WUD3mFiWUF1j--

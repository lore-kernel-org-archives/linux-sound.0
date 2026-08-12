Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4FD28CF4A
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 13:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542121; cv=none; b=OQT7h9fm8wHXkoqhg8Yl1ukLYKyopUd1deFKFF+9kl1I6aIGRfEi6HQe+ejDxu4ccJDZfet7lfEsBSmIxdIlvSWbEYsEqx2FS4izBSuiZFuEukIYkjYEXkt7tpmd4yadw16c08BOGlvySx6fElcX/3Op0ISQdexF4fJcJwdx8mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542121; c=relaxed/simple;
	bh=vRids8bgN7eBcIWQI9+z35fegJuTdJ1v/G8SdMTcGe4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WIyQIyPzxK+xb7Leb94DpOBf0BCI8m/aq0fn0kQ3BiGK5JBWsaKzdrRE0Uaqawm4uJO0Iqhyy4cFWSqTJ0/ngEbph0jdAEhVnT9o8NG6FJ54PRrgO3VOlFHx/9PH9MRHhH32bKTf+HEKp0lidbqM68y/7tVHDTJL+wFIL6RzHXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=VXBbAfMo; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="VXBbAfMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1786542117; x=1786801317;
	bh=ixSS+8clg3W+fMA63xweINRnbByDRd46aRL7Mw+dOOc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VXBbAfMo0/PqWc5ExgQsYd9my2GhKwOf813hqiXETG+PbwBsvoU5C/4dQkhDwz/a/
	 vDGtX50nnUPZO5BHbrOdGx3Vrwf9NUml1RXNavogHEBxv7aoI2iGp2ncRg6cCmEpap
	 fXxE3HAk6kcUiXnvCJqi0C1mZeaOzh0OmfePRkmrPp1tFKLgcCS/ThqvYm8M7K1NO5
	 vbKh7KvvTpSHaNXMubOAUCQ3UPFnGU4i1g0Oktdhudc1oZGqRuAZf7hnFAiBReA4Kt
	 9O02aklBSEfDYkvwWSAWNDkOqKm1KgrtPz8hLUbTWaRdNil4zoXtUBlQKOcMIBST0c
	 uXXDhU5DaPnFw==
Date: Wed, 12 Aug 2026 13:41:52 +0000
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, linux-sound@vger.kernel.org
From: Robin Everaars <robineveraars@pm.me>
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello <Mario.Limonciello@amd.com>, "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, Syed Saba Kareem <syed.sabakareem@amd.com>
Subject: Re: ASoC: amd: acp-pdm: full-scale burst on every DMIC capture start
Message-ID: <20260812134148.17343-1-robineveraars@pm.me>
In-Reply-To: <25022e80-1dff-46d8-891e-5fe7219f7331@amd.com>
References: <20260805181130.75314-1-robineveraars@pm.me> <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com> <20260811123336.197402-1-robineveraars@pm.me> <25022e80-1dff-46d8-891e-5fe7219f7331@amd.com>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: 94d9dc06a58d9ceb9b84470944ff71c60e8f71f5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------be951bfd63fb864069fb584dfee3dcbd628a2eeaf4c3919899fac03a3d4802f3"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------be951bfd63fb864069fb584dfee3dcbd628a2eeaf4c3919899fac03a3d4802f3
Content-Type: multipart/mixed;
 boundary=780a12e0d46d03834e602c45cba845550fe6bf8dd219e02ca4cb94c36350
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
Date: Wed, 12 Aug 2026 15:41:48 +0200
Message-ID: <20260812134148.17343-1-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <25022e80-1dff-46d8-891e-5fe7219f7331@amd.com>
References: <20260805181130.75314-1-robineveraars@pm.me> <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com> <20260811123336.197402-1-robineveraars@pm.me> <25022e80-1dff-46d8-891e-5fe7219f7331@amd.com>
MIME-Version: 1.0

--780a12e0d46d03834e602c45cba845550fe6bf8dd219e02ca4cb94c36350
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> PAUSE_PUSH should leave the decimator running. That is the safer ALSA
> design and avoids both the transient and a 300 ms pause-resume latency.
>
> Try attached patch.

I tested the exact attachment against v7.1.7 on the ASUS ProArt PX13
HN7306EAC. The bound module was snd_ps_pdm_dma from the rebuilt
sound/soc/amd/ps/ps-pdm-dma.c.

The normal start and pause paths work:

  - 5/5 cold starts, with acp_ps_pdm_dma.0 confirmed runtime-suspended
    before each capture: zero clipped or >=99% full-scale samples in the
    first 300 ms.
  - 5/5 warm starts, with the device confirmed active: the same result.
  - PAUSE_PUSH/PAUSE_RELEASE: 3/3 with a 0.5 s pause and 3/3 with a 2 s
    pause, no ALSA error and no full-scale samples.
  - prepare followed by close without START: 3/3; the device returned to
    runtime-suspended after the 2 s autosuspend delay.
  - forced XRUN/reprepare recovery: 5/5; each recovered block had zero
    clipped or >=99% full-scale samples.

Eac
h prepare took about 304 to 309 ms. A one-second capture took 1.43 to
1.48 seconds wall time, so the expected start latency is visible.

There is a problem on the system-resume path. I kept an ALSA capture
running across one s2idle cycle. The process reached the real ALSA
SUSPENDED state. Immediately after wake:

  SUSPENDED boundary=101384
  RESUME rc=0 (ok) state=RUNNING
  XRUN boundary=101384
  error: Broken pipe

No post-resume sample was delivered. A fresh reopen after resume worked
and contained no clipped samples.

That matches the control flow in the patch: SUSPEND calls
acp63_stop_pdm_dma(), which disables PDM, while RESUME enters
acp63_start_pdm_dma(). That function enables PDM and DMA together when
PDM_ENABLE is clear, without the 300 ms wait or FIFO flush. prepare() is
not called between SUSPEND and RESUME.

Could RESUME use a settling helper before arming DMA, or otherwise force
a prepare/recovery path? I have withheld Tested-by because the in-place

resume test fails. I can test a follow-up patch on the same hardware.

Thanks,
Robin

--780a12e0d46d03834e602c45cba845550fe6bf8dd219e02ca4cb94c36350
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
--780a12e0d46d03834e602c45cba845550fe6bf8dd219e02ca4cb94c36350--

--------be951bfd63fb864069fb584dfee3dcbd628a2eeaf4c3919899fac03a3d4802f3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgmp8eCAJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmfUHkNIYEWUlttXIb9yKSjsFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAJbmAP9XNwDBTB4jcYpMs+N5RzZJruoHe8RRXHVtdzEz
UjS+gwD/TPcyG6yWUVAJ6mpcYBeEL7+iVJt5fwidD0ZQYkzxGQU=
=oPMS
-----END PGP SIGNATURE-----


--------be951bfd63fb864069fb584dfee3dcbd628a2eeaf4c3919899fac03a3d4802f3--


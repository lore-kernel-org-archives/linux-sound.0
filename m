Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783C242C4F8
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 13:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579250; cv=none; b=J3z3iGQSS+zKwLmWyI50Rb/qAshsmSAqucSMWxLazo591yuWv7EpIpcyxixwRT/WERiBLinm905KIo8289hitE+oPChwSO77bJm3ozdD5CVrSR3DIrso3lLIpcB83hrxlgDign9LAmBy0rRmlVY92AYUC1MZ1fZtXp0VjhtnNNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579250; c=relaxed/simple;
	bh=rr2ctyA22wLcrXT/vtqWTeyp5eTC3US4aMLqkqmEyVM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBL4AfWPC+HsHk9bW3RbywlnVKVQsyBmcvD9L6rOfKQn+ishgUvgm0jJvjgiltaB2AEsTFT1tUC/IbxBa+bAC4pgksAD6aAhzQsN3Kl8MemaGjKckfnAB305bDBLSlv7zavJxqgmXLMbHqyyZtpiWf3kWMDBoo5vBK4WNQqYeLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=PNfBU/VZ; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="PNfBU/VZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1787579233; x=1787838433;
	bh=syuBE0/7DXOVKJ0onXzwHthJiVrTRDqdAq24LTT2bUk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PNfBU/VZvBngpTpitl+61+X9Irm179FZqDyV3kdLvepdwn+8USDWbYQov2qsKw64h
	 jWlEJpj9bnaQFhSO2afd9mtlcGy2Mq6MsPOvBsPlwoYwrd3yt9FpdMi9Uzpx4flmFt
	 XvejiGd8eUrZ+wAHaw8QShElwRdiZPVsjWN8uqqs0obIcvG5CSa3HwJ6On24Hr6sFz
	 +eTOadq29UC4l0hF8EGDDKawBddFSzwAKeTFpAjLdHjsGQWKAf3LMDBdCi8c2nEzo+
	 uFROPNstZJdA4OOArbAslId6iCE4ibYCGPpTD+/L6EK7ltF0bmPW2uh69aMm+pmGME
	 Qi5e5+1mA+6GA==
Date: Mon, 24 Aug 2026 13:47:09 +0000
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, linux-sound@vger.kernel.org
From: Robin Everaars <robineveraars@pm.me>
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello <Mario.Limonciello@amd.com>, "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, Syed Saba Kareem <syed.sabakareem@amd.com>
Subject: Re: ASoC: amd: acp-pdm: full-scale burst on every DMIC capture start
Message-ID: <20260824134705.21940-1-robineveraars@pm.me>
In-Reply-To: <4bda8125-c90a-4f8f-bf78-2b05cf0c905a@amd.com>
References: <20260805181130.75314-1-robineveraars@pm.me> <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com> <20260811123336.197402-1-robineveraars@pm.me> <25022e80-1dff-46d8-891e-5fe7219f7331@amd.com> <20260812134148.17343-1-robineveraars@pm.me> <759b61f5-6584-4397-bd61-8995bf5aa5fe@amd.com> <20260813121645.15370-1-robineveraars@pm.me> <20260813122632.9851-1-robineveraars@pm.me> <4bda8125-c90a-4f8f-bf78-2b05cf0c905a@amd.com>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: 4c46a085979a6ffb0a05f28ca619f4f863475ead
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------122bc1b2fcf5a8e5ce080121101a496d55319adccf990dc33ed85878f09d16e2"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------122bc1b2fcf5a8e5ce080121101a496d55319adccf990dc33ed85878f09d16e2
Content-Type: multipart/mixed;
 boundary=f03055be1bfa4f7611b40a4622dbaa530f024972b0ab36cc1df20bb2271e
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
Date: Mon, 24 Aug 2026 15:47:05 +0200
Message-ID: <20260824134705.21940-1-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <4bda8125-c90a-4f8f-bf78-2b05cf0c905a@amd.com>
References: <20260805181130.75314-1-robineveraars@pm.me> <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com> <20260811123336.197402-1-robineveraars@pm.me> <25022e80-1dff-46d8-891e-5fe7219f7331@amd.com> <20260812134148.17343-1-robineveraars@pm.me> <759b61f5-6584-4397-bd61-8995bf5aa5fe@amd.com> <20260813121645.15370-1-robineveraars@pm.me> <20260813122632.9851-1-robineveraars@pm.me> <4bda8125-c90a-4f8f-bf78-2b05cf0c905a@amd.com>
MIME-Version: 1.0

--f03055be1bfa4f7611b40a4622dbaa530f024972b0ab36cc1df20bb2271e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Could you please re-test with the updated patches, particularly the
> active-capture s2idle resume scenario that originally triggered the BUG?
> The expected result is a clean resume with no scheduling-while-atomic
> warning and successful capture continuation after resume without
> requiring a fresh stream restart.

I tested the three exact attachments against v7.1.8 on the ASUS ProArt PX13
HN7306EAC. Their SHA-256 values were:

  patch 1  87c2462d4528f13ee14e28df805a7a220b463cf05f59825bdfe4fd70be7cd8a7
  patch 2  6ad1a74b4e276126a2d6d7518b27651aa2d38996e77cffba6f07034d29fc4661
  patch 3  d1af42b8ee371af99cc7056c59cc3feae17cfd69f2f83a89a8ebee47be63e199

The loaded snd_ps_pdm_dma module matched the rebuilt artifact. Its SHA-256
was c2e1a7390584918bab6893943f5231b156e3e9d5db89c307cb9bf7c1e150c63c.

The ordinary paths behaved as follows:

  - The first runtime-suspended capture after boot returned -EIO before
    delivering data and had no matching kernel diagnostic.
 The next five
    runtime-suspended starts each delivered all 48000 frames with no clipped
    or >=99% full-scale samples.
  - 5/5 active warm starts delivered all 48000 frames with no clipped or
    >=99% full-scale samples.
  - PAUSE_PUSH/PAUSE_RELEASE passed 3/3 with a 0.5 s pause and 3/3 with a
    2 s pause. All six recordings delivered 144000 frames with no clipped
    or >=99% full-scale samples.

Active-capture s2idle still fails. I repeated the cycle twice. Both runs
reached ALSA SUSPENDED at the same frame boundary and produced this result:

  SUSPENDED boundary=97284
  RESUME rc=0 (ok) state=XRUN
  XRUN boundary=97284
  error: Broken pipe

No post-resume sample was delivered in either run. There was no
scheduling-while-atomic warning, BUG, Oops or PDM kernel error, so moving the
sleep out of the trigger callback removed the atomic-context failure. It did
not provide successful capture continuation.

The expected 300 ms settle was also not visible in t
he PM resume interval.
In both kernel traces, the interval from "Suspending console(s)" through the
ACP resume message to "PM: suspend exit" was only about 10 to 12 ms. By
comparison, the same userspace test measured prepare() at 304 ms. This makes
me suspect that acp63_pdm_settle() is not reached from acp63_pdm_resume() for
this active stream, although I have not instrumented the callback to prove
that.

The first fresh open after each resume returned -EIO with no frames, as did
the first cold open after boot. Subsequent fresh captures worked and had no
clipped or >=99% full-scale samples. I am keeping this first-open behavior
separate from the reproducible in-place resume XRUN.

There is also a hardware-coverage gap for patch 3. The patched
snd_soc_ps_mach module was built and installed, but this machine binds
snd_acp_sdw_legacy_mach for its SoundWire card. snd_soc_ps_mach was never
loaded, so I did not exercise the nonatomic link change.

I have withheld Tested-by 
because the active capture fails 2/2 and patch 3
is untested on this machine. I can test another revision or an instrumented
resume callback on the same hardware.

Thanks,
Robin

--f03055be1bfa4f7611b40a4622dbaa530f024972b0ab36cc1df20bb2271e
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
--f03055be1bfa4f7611b40a4622dbaa530f024972b0ab36cc1df20bb2271e--

--------122bc1b2fcf5a8e5ce080121101a496d55319adccf990dc33ed85878f09d16e2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmqMS10JEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdKIgitka2ZAKcW2XCCml/XFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAIS5AQCxnV9KdYuZ/QQf6SA/5ripU6jChs04+5z4bEmQ
v3aEGgEAy9LM8dkgc8AdRMDQoRXM9KCjtzNnkcOayfJFyznkjws=
=/Dhg
-----END PGP SIGNATURE-----


--------122bc1b2fcf5a8e5ce080121101a496d55319adccf990dc33ed85878f09d16e2--


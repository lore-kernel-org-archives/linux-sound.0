Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149ED3AC0EF;
	Thu, 13 Aug 2026 12:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623425; cv=none; b=lmt63eDM+6GqH0zVYnjsboEniUSgXjHGdrUG1U7redPIO23RqK9W/5TjeYbuhdaspLOLIx1S0sDP57N6o+LHoNytfufDPYTg+cQy4joCeAVZtfHCedgp6QX9LsVXd/fbTDuLG/JqyjSHsCgg8RY9hrk9xnCbON/5Ebfv0SVOwPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623425; c=relaxed/simple;
	bh=kmouqm8SkvRUJY3ZPgrzRUVhdV+rk4EleN3abSBY2ls=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tcLe26hrXQcDwHLOnBUsxVuVBQgvbRudPJE8mttJYHmZyAo/V9FX7T8FV++LAZsjs7/ahvdYdKz8Ze/PruroXg8i8HDhyQlOyjz2Qq9JnH6d3gLYtPSzDxPZotaOXEYYkqMRkdlVyHczJmdOmsbeVXwfkyYOzg/b5OvqwpcQPmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=TbeQ+8YJ; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TbeQ+8YJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1786623412; x=1786882612;
	bh=KdzjffwG40yGC0jFidoxH5/KGXAydmp33nURpur2L+U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TbeQ+8YJo2VlnAxVuKstdDyqVIFxJd/bsW9RY15ubdLKcUBIEuW7lQuFKYxxTwIvQ
	 r5BaLwVZr+0aZi4DE4BZwSc3ProHEvanexogBZsQE9an5PQ7WZJRm4nl50JCOVkpYR
	 lRKpDd1+CBvIX10arbLEe4Sm4jkFjDJbN+C3ujVVi81v34tYEBfH/C1uTtA4WdKHe0
	 +yIj5Y2admDxRgmfOvWlvCy+GbekkKd05bMoa6hLmgOwC5V1oLSqu/okuhQbJRRq5c
	 /vzCXzsF5vDwrInhAR+Ct3XEoLZHa287gvZq2FFHIerUwNqeHXfAuIl9CmIALm7Xs/
	 dtLHYQW7QtmQQ==
Date: Thu, 13 Aug 2026 12:16:48 +0000
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, linux-sound@vger.kernel.org
From: Robin Everaars <robineveraars@pm.me>
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello <Mario.Limonciello@amd.com>, "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, Syed Saba Kareem <syed.sabakareem@amd.com>
Subject: Re: ASoC: amd: acp-pdm: full-scale burst on every DMIC capture start
Message-ID: <20260813121645.15370-1-robineveraars@pm.me>
In-Reply-To: <759b61f5-6584-4397-bd61-8995bf5aa5fe@amd.com>
References: <20260805181130.75314-1-robineveraars@pm.me> <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com> <20260811123336.197402-1-robineveraars@pm.me> <25022e80-1dff-46d8-891e-5fe7219f7331@amd.com> <20260812134148.17343-1-robineveraars@pm.me> <759b61f5-6584-4397-bd61-8995bf5aa5fe@amd.com>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: bd33debcf60b952d97f2e127bc694fc121475477
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------ee20000a9a555471188f42be2786f95c488e589710f0a9f2f8058ab770e00651"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------ee20000a9a555471188f42be2786f95c488e589710f0a9f2f8058ab770e00651
Content-Type: multipart/mixed;
 boundary=592e8f6824db24ded7a8911e423ba6b4bbb9341649cd6a93abba490fc1bb
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
Date: Thu, 13 Aug 2026 14:16:45 +0200
Message-ID: <20260813121645.15370-1-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <759b61f5-6584-4397-bd61-8995bf5aa5fe@amd.com>
References: <20260805181130.75314-1-robineveraars@pm.me> <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com> <20260811123336.197402-1-robineveraars@pm.me> <25022e80-1dff-46d8-891e-5fe7219f7331@amd.com> <20260812134148.17343-1-robineveraars@pm.me> <759b61f5-6584-4397-bd61-8995bf5aa5fe@amd.com>
MIME-Version: 1.0

--592e8f6824db24ded7a8911e423ba6b4bbb9341649cd6a93abba490fc1bb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Please try attached patches.

I tested the exact two attachments against v7.1.7 on the ASUS ProArt PX13
HN7306EAC. Their SHA-256 values were:

  patch 1  c7e60e6850e3e61582d00a419f20afba863cee8253a3c5afe79a80de9464d8d8
  patch 2  ceda8170c0307415c8d2aabea652b667391801c19a2c34e67eca3216b750f5bd

The ordinary paths remain clean:

  - 5/5 runtime-suspended cold starts and 5/5 warm starts delivered no
    clipped or >=99% full-scale samples.
  - PAUSE_PUSH/PAUSE_RELEASE passed 3/3 with a 0.5 s pause and 3/3 with
    a 2 s pause. All six complete recordings had no clipped or >=99%
    full-scale samples.
  - prepare followed by close passed 3/3, with prepare taking 303 to
    304 ms. Runtime PM suspended the device afterward.
  - forced XRUN/reprepare recovery passed 5/5, with clean recovered
    blocks and prepare times of 304 to 308 ms.

One initial cold attempt returned -EIO before delivering data. It did not
recur in the next five runtime-suspended starts and ther
e was no matching
kernel diagnostic, so I have kept that observation separate from the
reproducible system-resume result below.

Patch 2 cannot sleep in the trigger callback on this path. During a true
active-capture s2idle test, ALSA reached SUSPENDED at frame 90128. On
resume the kernel reported:

  BUG: scheduling while atomic: pdm-alsa-lifecy/13258/0x00000002
  __schedule_bug.cold
  msleep
  acp63_pdm_dai_trigger+0x10d/0x2fc [snd_ps_pdm_dma]
  soc_dai_trigger.part.0 [snd_soc_core]
  snd_soc_pcm_dai_trigger [snd_soc_core]
  soc_pcm_trigger [snd_soc_core]

The comment stating that TRIGGER_RESUME runs in a sleepable PM resume
context does not hold for this ASoC trigger path. snd_pcm_resume() never
returned to the test program, no post-resume sample was delivered and the
program later received SIGSEGV while querying the PCM state in libasound.
The kernel logged a second scheduling-while-atomic warning during core
dump handling.

A fresh capture after resume worke
d and delivered 48000 frames with no
clipped or >=99% full-scale samples.

The settling operation therefore needs a sleepable path before DMA is
armed, rather than msleep() inside the trigger callback. I have withheld
Tested-by and can test another revision on the same hardware.

Thanks,
Robin

--592e8f6824db24ded7a8911e423ba6b4bbb9341649cd6a93abba490fc1bb
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
--592e8f6824db24ded7a8911e423ba6b4bbb9341649cd6a93abba490fc1bb--

--------ee20000a9a555471188f42be2786f95c488e589710f0a9f2f8058ab770e00651
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgmp9tbAJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmcUf7dELrF3wwU4HJUAtdl+FiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAABI7AQDMbQ88mSb9tp0f/F+vD+JWJnJv+KUQ5YpqlGUU
PLXBlwD+JMRNujyq2Vj/PtW5jbK7iEh8CTr+qNsYLFJRbOQLFAM=
=gmcH
-----END PGP SIGNATURE-----


--------ee20000a9a555471188f42be2786f95c488e589710f0a9f2f8058ab770e00651--


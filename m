Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AA830B529
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785953510; cv=none; b=SY7Jy2aBNcSNO0NOXtWJpUYEKuq4+/oY7KwtcAkqLWPLVhG38TtEIKYmQoC+v6kDhXujzqMqjpQ36uftpqugpEuF31hT/xNk64Dd91rCGgva3Lr0ikBy8KxWSHUlxAkT5J02ny50V5yVgWbhcWg8EziuoFkjm/xpT/LpOKKgIOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785953510; c=relaxed/simple;
	bh=q/1cv6RS+2BmrI6EN4MURzuz31PsFnFyCUI/xSxiS9A=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ie4Ew4AKpppsAfayHgmt3LsmpEdWVBkk+g3hNKKbybLmNJCKt3ThF8BIAAQSGRj7IQBXtXojYmnPrMPfKgbNO91n2jbK3NQnecfswq6xUO8lcLRQAC6bZt/R5xgSkMCk1un1SwjGyP3uUBcofsAO7XSzL4Mnwpjsv3d0/rvw6H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=RsG4YAln; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="RsG4YAln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1785953500; x=1786212700;
	bh=EmQeLx8kEPMNmm9fwvfObpvyaKb8uYwr8B23HTJPZvk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RsG4YAlnR0XYFozzorGb/ziytPySYUEDYjD+p3Bi77iHPcnBiYYyqvKQjc7EjbdZP
	 ZTddwO8TjkQNJ6hJ14iHUL3m2acQU1pQTi7f82TU4s8HHxpT/rWnejOeLFyy2voB+N
	 W+Kuff4xH7sCoqsGp/1BidsHYgvQ6rfQt99JGx5VOUjCYX0twcTgpnil5gKxXpa0zP
	 sJSorT0O7R7KY//KHr6GWReNkrgBvdPBEYREbjDRQZ4Txby1tPL0Q6erQgFFuQB8Ik
	 G30EsIdoybczRoq1U4UymMq1mox7kjKgk6vYKWusDgr/BlauXa3UY+/AIP2+lMJF2H
	 kY+YI4HeVMGuQ==
Date: Wed, 05 Aug 2026 18:11:35 +0000
To: Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org
From: Robin Everaars <robineveraars@pm.me>
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org
Subject: ASoC: amd: acp-pdm: full-scale burst on every DMIC capture start
Message-ID: <20260805181130.75314-1-robineveraars@pm.me>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: 158f30ab5e67ea3d215687ba9deccfdb422b1af3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------913aae90ffdf8e6fecdf87b0c497d9e9126bd7e3773e7b69df492bcd36284d80"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------913aae90ffdf8e6fecdf87b0c497d9e9126bd7e3773e7b69df492bcd36284d80
Content-Type: multipart/mixed;
 boundary=9b6e520eb092c9461aa11bec743821f23568e386ae9f44bbfd4945311f50
From: Robin Everaars <robineveraars@pm.me>
To: Vijendar.Mukunda@amd.com,
	linux-sound@vger.kernel.org
Cc: venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org
Subject: ASoC: amd: acp-pdm: full-scale burst on every DMIC capture start
Date: Wed,  5 Aug 2026 20:11:30 +0200
Message-ID: <20260805181130.75314-1-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0

--9b6e520eb092c9461aa11bec743821f23568e386ae9f44bbfd4945311f50
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ACP PDM DMIC emits a full-scale burst at the start of every capture stream.
It is loud and it begins at the same frame every time. On a cold start it lasts
long enough that the far end of a call hears a click on join.

Hardware and software
=====================

ASUS ProArt PX13 HN7306EAC, AMD Strix Halo. Card 1 "amdsoundwire", driver
amd-soundwire, longname
ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC. The DMIC array is
/proc/asound/card1 pcm4c, id "acp-dmic-codec dmic-hifi-4", reachable as
hw:1,4 or hw:amdsoundwire,4. Native format S32_LE, 48000 Hz, 2 channels,
single rate. Kernel 7.1.5, alsa-lib and alsa-utils 1.2.16, PipeWire 1.6.8,
NixOS.

What the burst looks like
=========================

Capturing 3 s of a quiet room at 48 kHz gives 304 to 310 samples railed to
+32767 or -32768, and every one of them falls inside frames 21 to 177, i.e.
the first 0.44 to 3.65 ms of the stream. After the first 10 ms there are zero
clipped samples.

The shape 
rules out an analog transient. Printing the first 40 frames shows an
exponentially growing alternating pattern that collapses into a rail, that is
a Nyquist-rate oscillation at 0 dBFS:

  (336, 2529) (311, 2454) ... (4765, 1614) (-14926, -7363) (-32768, -32768)
  (3598, -3283) (-817, 2296) (-32768, 32767) (32767, -32768) (-32768, 32767)
  (32767, -32768) (-32768, 32767) ...

Left and right are in antiphase. That reads as an unflushed decimator rather
than anything acoustic.

Reproducible frame for frame across runs, and across every rate, format and
channel count the PCM accepts.

The cold start is much worse, and it is the common case
=======================================================

The 3.6 ms figure above is the WARM case, where the ACP was already awake. On a
cold start, meaning the ACP had runtime-suspended, a second and far larger
excursion follows: it rails from about 15 ms to about 50 ms and only reaches the
noise floor around 250 ms.

That is the c
ase that matters in practice. Any userspace audio server suspends
an idle capture node after a few seconds (WirePlumber does it after 5 s), so
every real call join is a cold start.

The driver produces it
======================

Identical through plain arecord with PipeWire out of the picture:

  arecord -D hw:1,4 -f S32_LE -r 48000 -c 2 -d 6 -t wav /tmp/x.wav

gives 304 railed samples in frames 21 to 177, against 305 to 307 through
PipeWire. Same start frame, same duration, same shape.

It also survives band-limiting. Low-passing to 8 kHz and to 4 kHz still leaves
an audible click, so a call codec does not remove it.

Where it comes from
===================

sound/soc/amd/acp/acp-pdm.c has no settling delay, no mute and no discard of
the first frames. acp_dmic_dai_trigger() enables the PDM controller and the DMA
in the same breath, so the decimator's first output words go straight to
userspace. A PDM microphone needs time to settle after its clock starts, and a

CIC or decimation filter chain needs to flush its state, and neither is waited
for here.

Other ASoC DMIC paths handle this. snd_soc_dmic has a wakeup_delay module
parameter whose msleep runs at DAPM POST_PMU for exactly this reason.

What would fix it
=================

Any of these, in rough order of preference:

1. Discard or mute the first N frames after PDM_ENABLE inside acp-pdm.c, where N
   covers the decimator's own settling. That is the cheapest fix and it is
   invisible to userspace.
2. Wait for the microphone to settle between enabling the PDM clock and enabling
   the DMA, rather than doing both in acp_dmic_dai_trigger().
3. Expose a settling delay the way snd_soc_dmic does, so a platform that needs
   longer can set it.

A separate, smaller thing on the same device
============================================

There is a standing DC offset of about +0.06 FS on channel 0, roughly -24 dBFS,
present with no acoustic input. It is passed through to user
space, so naive
level meters read about -23 dBFS in a silent room and any AGC treats it as
signal. After an 80 Hz high-pass the real floor is peak -45 dBFS rms -62 dBFS.

If a DC blocker is expected somewhere in this path, it is not running here.

Reproducer
==========

  # cold start: let the ACP runtime-suspend first, then capture
  cat /sys/bus/pci/devices/*/power/runtime_status   # wait for suspended
  arecord -D hw:1,4 -f S32_LE -r 48000 -c 2 -d 3 -t wav /tmp/cold.wav

Then look at the first 300 ms. Any tool will do; the railed samples are obvious.
Repeating the capture immediately afterwards gives the shorter warm-start
version, which is a convenient way to see both.

I have no fix to offer, only the measurements. Happy to test a patch on this
hardware.

--9b6e520eb092c9461aa11bec743821f23568e386ae9f44bbfd4945311f50
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
--9b6e520eb092c9461aa11bec743821f23568e386ae9f44bbfd4945311f50--

--------913aae90ffdf8e6fecdf87b0c497d9e9126bd7e3773e7b69df492bcd36284d80
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmpzfNcJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcme2wDcuviIR7dgQCxWvKq69FiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAALhmAQDJ0oaNvGvT+OhbGD1tpDFTcehtC3B8Ke1ykrV/
MAOMowEA4wBErxNIklxjQ6ODdflDulysRaKsyvjtJtP5wuU3wws=
=S6uJ
-----END PGP SIGNATURE-----


--------913aae90ffdf8e6fecdf87b0c497d9e9126bd7e3773e7b69df492bcd36284d80--


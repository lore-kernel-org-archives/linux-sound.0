Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262014;
	b=S5g7KV8lgdwNdxIqOvOJ8xBjWxbL6P6tuL2sz3g4YgXxC5nYwDLwMtxngGuQ4udD+O6M
	 9srYvdQw/jFD9a1AAfgVxnC+lzGR198e+dL4panZyb2hH5bofFJPWpdkeTbYVb8ppG+Ko
	 mhpf54ueB+3DlC7h+taNCAQPmHfnmLy0U6xVmtDQGnvVvFpj6cuqt7Leia3D6+LN8jHuk
	 CB97AJ508nx8yeKFzew4DU9uuvtlgOcMD/soNDvhOqzbvIw6HatuwcSFvkUbQJME6tj0U
	 CTDBMo5ZKQWTvOITkwiE1iAhhbqSnmpvI+pl2cw5MbdqFz06sD+ybIuyxJhOtBLR5uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262014;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type;
	bh=h/b/EWhQoNmGskeuVo8AITXFwoDM6XOl682bEGKfuaA=;
	b=Bwxzx1c2PKOUUgdnNtMzgtpKqaLOAuk6vcDrQWvnqDSNC9WLJ49r3j8IeOujDY7agUta
	 Lz7bHTGaQECrjvAYtJuxEiMjUI7oX2fvwAn3j7BYrrmetq0VX1EtexKrfEQX5gtmC3Rdx
	 3e8Nkbj1AXCS+QjWdKEvCpcDOKCVWhAucicB34PHBLMQcY16CiRK8O5D0fse5QNxpAoU7
	 tv77TmupTEAbllt18VTcprf7jvMYioG9Z92FjrXDaAa8h/85g2dBoCu32ZZ0B46E97DJz
	 ajgFZOmtUK1853TZ6PStE/hA8Mb6iLS1Q4T0+M8LTaxz29UvRNJ7k8NybAcZKKGr++Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=evxbvS4V;
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B12606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B12606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=evxbvS4V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793262011; x=1793521211;
	bh=h/b/EWhQoNmGskeuVo8AITXFwoDM6XOl682bEGKfuaA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=evxbvS4VathbcqXtzWPJMRlPMNQb0b5uUxmU4Q9wZImvgUqDItJ1+UFLJJwX6QiN4
	 XEs2VaBEJgdmqt1zaKuDUcz68aQxh5DVYvgl/1khWyhrY+kDuTMnsbg4XjW3BHsAhE
	 /wd3jJCUNu3wu5UJJmGnGRQNmXfoSiAMXeHSiR54w1HBNJ2btvD9T4dy6W8JDYzSbK
	 5kOCwVnm6aoxjjysaQenxuTRd9JLoBhcXSjV6Bk4S/cPa6sEx3us7kYg4V9/OgJ/cy
	 XpL7Ql7Z+y8I+rof0wMT6I3oKgBUcXRE4lBdysWYEY3YRPrnQLG3MWSGlNzLddckZH
	 4qc8NjStfRkjg==
Date: Thu, 29 Oct 2026 08:20:07 +0000
To: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>
From: Mads <mhbn@proton.me>
Cc: Takashi Iwai <tiwai@suse.com>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Subject: [BUG] ALSA: hda: cs35l41: amp dead until reboot after one failed system resume (shared reset)
Message-ID: <NTfSz65gX8wGLl8ueVKxyXJfip46Ee4dbabGMaNtaILRK2MyqyTacUI4ejqeTur-CkARIxoLYIeyoKVMwaDHVuBhg6p2vfhRcUlOJDAdGTQ=@proton.me>
Feedback-ID: 46771976:user:proton
X-Pm-Message-ID: 6bf9c0a4d503ac1981e1f88ab5e73d61df51107a
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------77115f033d7d33d90c807276282612b0fd1898528fb60cd2d7b6845c46d80aa8"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------77115f033d7d33d90c807276282612b0fd1898528fb60cd2d7b6845c46d80aa8
Content-Type: multipart/mixed;boundary=---------------------bc87a21b8d74f8f0fd99240ef3390b35

-----------------------bc87a21b8d74f8f0fd99240ef3390b35
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi,

On an HP Spectre x360 2-in-1 14-eu0xxx (SSID 103C8C15, Realtek ALC245
+ 2x CS35L41 on I2C, CSC3551, BIOS F.13) the right amp
(i2c-CSC3551:00-cs35l41-hda.1) often stops working after s2idle resume
and stays silent until reboot. On one boot it was dead after 19 of the
last 21 resumes. Two things combine: an occasional resume failure, and
an error path that never recovers from it.

Kernel: 7.2.5 (Omarchy distro kernel linux-omarchy 7.2.5-3),
linux-firmware-cirrus 20260810. I have not tested a vanilla build, but
the code paths below are unchanged in mainline as of 75c1cb8178fe
(sound-7.4-rc1 merge). The kernel is tainted OE only by an unrelated
out-of-tree camera module (intel_ipu6_psys).

1. Trigger: shared reset line on resume

The two amps share one reset GPIO. .0 owns it, and .1 logs at probe:

  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Reset line busy, assuming shar=
ed reset

cs35l41_system_suspend() on .0 asserts the reset and leaves it asserted
across suspend. Only .0's cs35l41_system_resume() releases it, and .1
has no reset_gpio. With async resume, my reading is that .1's
cs35l41_system_resume() can run while the line is still held, so its
first read NACKs:

  [21168.849823] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Asserting Reset
  [21168.852794] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Failed waiting =
for OTP_BOOT_DONE
  [21168.852960] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: PM: dpm_run_cal=
lback(): cs35l41_system_resume [snd_hda_scodec_cs35l41] returns -121
  [21168.853110] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: PM: failed to r=
esume async: error -121

This happened 3 times in 25 resumes on one boot, always on .1, never on
.0. It fails within ~3 ms of monotonic time after the suspend-side
"Asserting Reset", so it is a read error (-EREMOTEIO) and not the
100 ms OTP_BOOT_DONE poll timeout.

As a workaround I have set /sys/power/pm_async to 0, so resume follows
dpm_list order with .0 before .1. It is too early to say whether that
stops it; I will follow up. A device link from the amp that shares the
reset to the amp that owns it might be the proper ordering fix.

2. One failed resume leaves the amp dead until reboot

cs35l41_system_resume() returns early when cs35l41_wait_boot_done()
fails:

	ret =3D cs35l41_wait_boot_done(cs35l41);
	if (ret)
		return ret;

So pm_runtime_force_resume() is never called, and the
pm_runtime_disable() done by pm_runtime_force_suspend() in
cs35l41_system_suspend() is never balanced. After that, .1 shows
power/runtime_status "unsupported" (.0 shows "suspended").

The amp still works in that same cycle, because the error path leaves
regcache_cache_only() false. It breaks on the next cycle. The amp was
runtime-suspended, so pm_runtime_force_suspend() returns early.
cs35l41_system_resume() then sets regcache_cache_only(true), and
pm_runtime_force_resume() jumps straight to "out" (needs_force_resume
is false and the status is suspended). cs35l41_runtime_resume() never
runs and the regmap stays cache-only. From then on every firmware load
and every playback fails with -EBUSY:

  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: Failed to read algorithm=
 info: -16
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Cannot Initialize Firmware. Er=
ror: -16
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: Failed to read SCRATCH0:=
 -16
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Enable(1) failed: -16

This repeats on every PCM open/close (274 failed loads on one boot),
and the right speaker stays silent until reboot. A later resume that
hits -121 again "fixes" it for exactly one cycle, the same way.

Unbinding .1 in this state also gave repeated "IRQ sync failed to
resume: -13" and "WARNING: kernel/irq/manage.c:1008 at
irq_nested_primary_handler" (Primary handler called for nested irq)
from free_irq() during devres release.

I'm happy to test patches.

Thanks,
Mads
-----------------------bc87a21b8d74f8f0fd99240ef3390b35--

--------77115f033d7d33d90c807276282612b0fd1898528fb60cd2d7b6845c46d80aa8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmrjAawJEBcwQI9sml54RRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcme3ElJgVbRXBlDiBOxtcxAC4Fl+BPnEd3KCkEi0
9qF1zhYhBKrdUMiR2NqyOetv1hcwQI9sml54AABtEgD+MDCgP4qpgbJ7PNM2
ePc+Qh0vM2RgrlXYT165tqZvinUA/3amopb6Ux+zV1SAXKOvOgSpFq1ngyYG
+3kmCicHPWsB
=jbHP
-----END PGP SIGNATURE-----


--------77115f033d7d33d90c807276282612b0fd1898528fb60cd2d7b6845c46d80aa8--


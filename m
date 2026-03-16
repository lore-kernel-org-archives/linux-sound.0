Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967EC3B2BA;
	Mon, 16 Mar 2026 01:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773624104; cv=none; b=DLPvYcF4NsQuWgsbW2JkCvBfpcg4Tfd8dTOt5WNN87JFjbjFh7HeCOZgL6PUVsXjf82AVvlvkQZ56zngCFDgWFmil9npEKmF8Zob/0vnFH2feJopelnoZ/gPYfvFXTwrylD4dRLiCGSkYv9xnmRcnk7VxdTgCoULCgOGMVFS4pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773624104; c=relaxed/simple;
	bh=uRFNMu55UrMfF33xM6CqHxM2AI1ior1dfFzpFTHUrO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Su1aVXbfh9dToGcqcZCcW/DE8RBsAlfkHkLE0aSjYVWzYNHPHaGwc2Uhwmw2FGX/Fzk0BgubapJEnrWJAsEtuymw7TatDtN1ECWo8tpn75vwJHnUh35S10OiDJauoQOTNxM5IuBtZjP9dLJNERiGt5PREzTIRr289gwKF96TKdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owmkjVIR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owmkjVIR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F4BC4CEF7;
	Mon, 16 Mar 2026 01:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773624104;
	bh=uRFNMu55UrMfF33xM6CqHxM2AI1ior1dfFzpFTHUrO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owmkjVIRS7okt6YIXEChEse72uYX1lt4s4FIeZAj1dUiY3BfbCYTPSmwdJjjP8y0+
	 6Czu+ELkuVfn3xPo96+/4/qbkTLs2f/brjltCVAZncy83pR3JCWkYIy3axvg8yN5oR
	 sGmxSSDoGgTXKVnJFpYX6R+xja2skdcjDuskjAWSt5/bVVjaKCjiULsEZpaEha5DHx
	 AJe8i6j9SRHXWPcIpGi7EZpGX73slBrb/T6AXZOCzDRLe40cDt0c/khknb+m1UGlSK
	 Bfb+8Lxw0voJB3SWvwa1vPzQyo4ox0EZ9Yqb5EigcKuoCpchopWOC7Tot5AOnX1ajP
	 XdIAuh9Hs9PLw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 413651AC56E6; Mon, 16 Mar 2026 01:21:41 +0000 (GMT)
Date: Mon, 16 Mar 2026 01:21:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Cc: pr-tracker-bot@kernel.org, Takashi Iwai <tiwai@suse.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linux Sound Mailing List <linux-sound@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: Re: [GIT PULL] sound fixes for 7.0-rc4
Message-ID: <abdbJW1YANlTtiFs@sirena.co.uk>
References: <87cy17bwxz.wl-tiwai@suse.de>
 <177342322339.1438840.10045618627804918846.pr-tracker-bot@kernel.org>
 <CAOKSTBuRwm=d+rU-0=gax03t2=x8F7LE3xkTr5v28+DrpbvWZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VtaEFl+ugIGiC71a"
Content-Disposition: inline
In-Reply-To: <CAOKSTBuRwm=d+rU-0=gax03t2=x8F7LE3xkTr5v28+DrpbvWZA@mail.gmail.com>
X-Cookie: Identify your visitor.


--VtaEFl+ugIGiC71a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 10:11:02PM -0300, Gilberto Ferreira wrote:
> I'm truly sorry to respond to this email, but unfortunately Linux
> 7-rc4 is not working for me yet.
> Still no sound output in the AMD Renoir/Cezanne HDMI adapter.
> I notice the renoir soc driver are loaded but no Cezzane included:

Copying in the AMD driver maintainers, not deleting any context for
their benefit.

> lsmod | grep renoir
> snd_sof_amd_renoir     12288  0
> snd_sof_amd_acp        69632  5
> snd_sof_amd_acp70,snd_sof_amd_rembrandt,snd_sof_amd_vangogh,snd_sof_amd_a=
cp63,snd_sof_amd_renoir
> snd_sof_pci            24576  5
> snd_sof_amd_acp70,snd_sof_amd_rembrandt,snd_sof_amd_vangogh,snd_sof_amd_a=
cp63,snd_sof_amd_renoir
> snd_acp_config         24576  10
> snd_rn_pci_acp3x,snd_sof_amd_acp70,snd_pci_acp6x,snd_pci_acp5x,snd_sof_am=
d_rembrandt,snd_sof_amd_vangogh,snd_sof_amd_acp63,snd_acp_pci,snd_pci_ps,sn=
d_sof_am
> d_renoir
>=20
> That's the audio devices in my system:
>=20
> lspci -vv | grep Audio
> 04:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI]
> Renoir/Cezanne HDMI/DP Audio Controller (prog-if 00 [HDA compatible])
>        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI]
> Renoir/Cezanne HDMI/DP Audio Controller
> 04:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
> Audio Coprocessor (rev 01)
> 04:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Ryzen HD
> Audio Controller (prog-if 00 [HDA compatible])
>        DeviceName: HD Audio Controller
>=20
>=20
> Best regards.
>=20
>=20
>=20
> ---
>=20
>=20
> Gilberto Nunes Ferreira
>=20
>=20
> ---
>=20
>=20
> Gilberto Nunes Ferreira
> +55 (47) 99676-7530 - Whatsapp / Telegram
>=20
>=20
>=20
>=20
>=20
>=20
> Em sex., 13 de mar. de 2026 =E0s 14:34, <pr-tracker-bot@kernel.org> escre=
veu:
> >
> > The pull request you sent on Fri, 13 Mar 2026 15:55:52 +0100:
> >
> > > git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/so=
und-7.0-rc4
> >
> > has been merged into torvalds/linux.git:
> > https://git.kernel.org/torvalds/c/56cf10db2ae0bb90c69b644d639b559106d52=
a8d
> >
> > Thank you!
> >
> > --
> > Deet-doot-dot, I am a bot.
> > https://korg.docs.kernel.org/prtracker.html
> >

--VtaEFl+ugIGiC71a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm3WyQACgkQJNaLcl1U
h9AjXQf/eIBHi9in+65ttB91Lp3Pcggy51/Jr5C84sQuFgBW6q2xd9hh9IPK6cTw
S1USlpXp3syhz3PXuRcUHt8uq6xrQyfAQdaZxAShNbhZ0PvA+7ZBEqRdiBbABTZZ
tTGT40jSXUowfweEpnJNQ1Aj6w5JwRfDct1w0i2X3Ld6rBzDHwufw1rasc2/GjNl
klT73hBj9k0VLeAZv8uJhke3YkkIKRQEWue+NTtgAa1hUANquwLWF1/TnLVfd5A5
t7wXTDgYYtq5W4OyxNLLmB7ZehYOv8iclEbTv4jx9ZhI47a1lGztsEJ4f7StbD/h
ekEDRI7GYEYa53cU6kiECjCX4y4CQw==
=XsZ0
-----END PGP SIGNATURE-----

--VtaEFl+ugIGiC71a--

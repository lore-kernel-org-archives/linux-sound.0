Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263568;
	b=4un4Ypi0UPoBTPjtodyX5TRqZb5neDMhivJUYLNNd9yHJ48pvhZO27DCpJ+A7HhZzPld
	 9v9EJQqGieZgP1UBoCsVEASDV8lMo92X7CMKcc9JZ1bwABrfu35AyghllZYLVt/kKUFak
	 0yP0OhHGme6ZDER8XsZxIe16H3A0JQ1RM4St56JtCqV0n5pcIq4ql1S+9zrGfDxQFCpm8
	 OyvaZpULlaR2kUetuI8sLM/9+1JF3Lm+pJWYzbrbE/1Wb1qOwS6qyQvkRxOC3iye/rOrJ
	 WEGQeCxSmP3Pi7x54mlXRx6sTbpA19Cl7iC+hlNzwFz34wHgm2U9/CmfzXyjf15DNRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263568;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type;
	bh=3i1Ss1/LEW5xM/O4Uf6Evq/gd84FCKkrCeu1OzEcG+Q=;
	b=3t1XvxcH7YvBIpwcd1BwGytKKhZckuIYsZhyyR0CFIwfN12dUs0bm6qG31P66sO7UGj7
	 MjA9XAetFkgB03QP7xy6qwjPE8lv7fGchdFqi1wNWnGviaqtOLyzIevNsmzs1+FwrNl/n
	 sMPG9ByW90aSd71ATuPP3yPND2Z0XJDAUjpby+gyFfhUN++cTqPI2CQcEbjd8vnl7Rn9B
	 8dOsMSUuI574G6A75gMHxcIlYMGtvhymTn/LaU/oC2swgXSfh7QZMa54Xv3kUui7aU8h6
	 j8jroLdcirlWdB9z1QKaY/dJMPQ4VoRLNMZfeIAILq9iUqA6BgKGeZCmyEKgyZIvwDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=mcrZ6pnJ;
	arc=none smtp.remote-ip=79.135.106.29
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E55606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51E55606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=mcrZ6pnJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793263565; x=1793522765;
	bh=3i1Ss1/LEW5xM/O4Uf6Evq/gd84FCKkrCeu1OzEcG+Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mcrZ6pnJklxMF9AmG07AA5Fvr4fKVUAawGzoDblEn5MaV1PMBrL0gjqj4TssoPnxY
	 y42+okPVrIxbnf+1NXBdpicmF/usbswYT+BPYTlMoW5cvGKeCbDaHl2dV4cHv5fRc3
	 fNl4DdjxDT7pscEQ6m2Np95UJGJRKYXikUy8eLH7aSkJIUA9EUuyn9pcrXdU1PL35C
	 QLmmVyf/ckE3HooYY6v10Cf3MOBlfr8dVdh3cDOlyKJVJci4bNbOi3kGYo8NM7dA3P
	 /tQmAUvEmsbKhpLzEBD8i3Qm26Zyep5lsz09t4R3CSf7xKTvzewOBmxyBZvSxiYF4E
	 GynDT+gFB04Sg==
Date: Thu, 29 Oct 2026 08:46:01 +0000
To: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>
From: Mads <mhbn@proton.me>
Cc: Takashi Iwai <tiwai@suse.com>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Subject: [BUG] ALSA: hda: cs35l41: stale cs_dsp.name after component unbind breaks firmware load
Message-ID: <dD5GFAprPRxWfPbbbrhD_wor9MMiT3a4ONaybCd3jr7tBR5xKw2oIcpfDhFtSiXUOsmHcUUUH_UNMBMvm57yTY1MMHqjriZRLAP4XvHrdmY=@proton.me>
Feedback-ID: 46771976:user:proton
X-Pm-Message-ID: e55efd899896104cec384d7f99f44229ef302ada
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------9b070fd6c0b2b25878603b7f851a4023617296d5c4f8d15adda1f3e183033f45"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------9b070fd6c0b2b25878603b7f851a4023617296d5c4f8d15adda1f3e183033f45
Content-Type: multipart/mixed;boundary=---------------------6f1ed0560da74235093d354cd5e9486d

-----------------------6f1ed0560da74235093d354cd5e9486d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi,

Same machine and kernel as my report "amp dead until reboot after one
failed system resume (shared reset)": HP Spectre x360 14-eu0xxx, SSID
103C8C15, 2x CS35L41 on I2C, kernel 7.2.5 (Omarchy distro kernel). The
code below is unchanged in mainline as of 75c1cb8178fe.

To recover the stuck right amp without a reboot, I unbound and rebound
only .1:

  echo i2c-CSC3551:00-cs35l41-hda.1 > /sys/bus/i2c/drivers/cs35l41-hda/unb=
ind
  echo i2c-CSC3551:00-cs35l41-hda.1 > /sys/bus/i2c/drivers/cs35l41-hda/bin=
d

.1 came back fine after a fresh probe. But .0, which was only unbound
and rebound as a component, could no longer load firmware:

  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Falling back to default firmwa=
re.
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Unable to find firmware and tu=
ning
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cannot Initialize Firmware. Er=
ror: -2
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cannot Run Firmware, reverting=
 to dsp bypass...
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SSID: 103C8C15=
, BST: 0, VSPK: 0, CH: L, FW EN: 0, SPKID: 0

The files exist, and .1 loaded the same .wmfw a moment later. Toggling
"L0 DSP1 Firmware Load" off and on gave the same -2. Only a reboot
fixed it.

From reading the code, I think it goes like this. With
firmware_autostart, the first cs35l41_hda_bind() calls
cs35l41_smart_amp() -> cs35l41_init_dsp() -> cs_dsp_halo_init(), and
cs_dsp_create_name() allocates dsp->name with
devm_kasprintf(dsp->dev, ...). Because that happens inside
component_bind(), the allocation lands in the component's devres group,
and component_unbind() releases that group. cs35l41_hda_unbind() does
not reset halo_initialized; only cs35l41_remove_dsp() does, and that
runs from remove. So the next bind skips cs_dsp_halo_init() and builds
the firmware file names from the freed dsp->name, which is a
use-after-free. The freed name also shows in .1's own messages during
its unbind ("DSP1:" becomes empty):

  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: : Failed to read SCRATCH0: -16

I have not confirmed this with KASAN. Possible fixes: tear the DSP down
in cs35l41_hda_unbind() (cs35l41_remove_dsp(), or at least clear
halo_initialized and dsp->name), or keep the name allocation out of the
bind devres group.

I'm happy to test patches.

Thanks,
Mads
-----------------------6f1ed0560da74235093d354cd5e9486d--

--------9b070fd6c0b2b25878603b7f851a4023617296d5c4f8d15adda1f3e183033f45
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmrjB78JEBcwQI9sml54RRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmcDJA8xjQHF3iWbOPXPg1xtRmigRdUuiLBtTR25
IZEVhRYhBKrdUMiR2NqyOetv1hcwQI9sml54AAB4pQEAjDiqA9W+r/ZjXbDt
YXogzM6S5mIBbGJbSHceepiZrSkA/0E4pQXC9f3Q+vyvXAbCQ67AO1Rdzt7m
yNoR6URDfPsH
=pF+d
-----END PGP SIGNATURE-----


--------9b070fd6c0b2b25878603b7f851a4023617296d5c4f8d15adda1f3e183033f45--


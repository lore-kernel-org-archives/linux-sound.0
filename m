Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191774;
	b=Ujim6MraBA1nNEGHhOT30gSRACUFNKK3WJkRB/Kopmihq0zFFLvQYXHGTav4+/3UGvCt
	 cO3Rxg0CEhGjMN7Fxf32OlTjC51dWP3Y7Zk+7zyyEyVzBTpQRlCS9vW+qdh0g6A+86/F6
	 wjB/p1wRdZCqcogcnYN5fHy2IQ83tR3feDPR2pxzvmJADadUk3StkzIxbyf0I5K4uQEXw
	 IIIpflg++BQCXIFVKSO9Tg3uaRZSDCUA4xUb1KutUC0AdeEb6UhsRMbNJyIWH1jrpkO+u
	 j75kB8sNcLAyWfRfoRrfpjz5gGNdd8aM8fETOwIKYpl5VQUm8qxgVqVZTxhwVrGooQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191774;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HZkKgO7Q+uLALgFFBP6a/CKYA4G/g6jmD4vyeOPLFIA=;
	b=R1h4qBHcvTrbFZ4uHsz5S2gbd9Cp/p8CsluSWCaoud4uRYAGQXY50aHs+dOBF46fYqyR
	 Ae1uML3HkfpnDESQUo4Nn9Qgy48s8Hm3qaR2OGSxTf5wCBIrB2XmL5yVjl+L3YZeDHtu+
	 ojkL3y/QO3eRnwh2CTNU+RuoFP9kTmJsetGCNr1hlgOW1MyXKYcAAClWdcAjVwjb2EQsy
	 Y444erMajUK5IeZbdR+7p6Gs/SJtPDC6sEQLskdSVYgMYoaBoJV78swGT6w113QJZt4Nh
	 /Ur1+yz/x4cUTB+W5YcWSZf9/U4LiIwJDdwH544sysmiT/zr2lURdj4NjCgIZLgMIZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e4sApNP/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0738606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e4sApNP/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B0C1F000E1;
	Fri, 20 Nov 2026 16:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795191774;
	bh=HZkKgO7Q+uLALgFFBP6a/CKYA4G/g6jmD4vyeOPLFIA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e4sApNP/3qskYVTbtO5KbXx9cnObj1Qrbo50IVbWN6hGA6iOmCYXydx0K2VmvVnKv
	 VrdOBPQQYL8aZM539ZYQn+2bsKUOJRHckgLSxHJnZ0TK3RB/nGJpyZKyUhEznkYu3g
	 9cZ5poFHCsb7m5WbZ3tgtmxhUiMKWRRyt04CxAGFmiiWejQM0GWwJYLdug6PMMv0Cb
	 oQjq8xeFDiUBvWkG6kyy/8xGOoqG/qqz5Y8EhcsxvPIYhZmoKvndscYXNcyLatbB3q
	 v1kEIfNdgUwLYFcsoPHnpYANeWb5jWMk0BN9WsNUIj8xCGdWSo8UFGI1xszW9hEXod
	 fRdKaWCaS1Xug==
Message-ID: <sashiko-outbox-225562@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/7] ASoC: cs35l41: Prevent software reset when using
 SPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Binding" <sbinding@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261120161136.157593-3-sbinding@opensource.cirrus.com>
References: <20261120161136.157593-1-sbinding@opensource.cirrus.com>
 <20261120161136.157593-3-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:22:53 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ASoC: cs35l41: missing Fixes trailer for
  cs35l41_reset_and_boot() SPI fix
--

commit c3f7f4bdf676f39aef6330251414c7d8f0d98d22
Author: Stefan Binding <sbinding@opensource.cirrus.com>

> ASoC: cs35l41: Prevent software reset when using SPI
>
> If there is any SPI Bus activity during a software reset, even if the
> chip select is not set for that Amp, the amp may not boot.
>
> This affects both CS35L41 ASoC and HDA drivers. For HDA this also
> affects system resume.
>
> Whilst the driver needs the amp to be reset when coming out of system
> suspend, the driver will always toggle the reset GPIO off and on to
> ensure this occurs. If a reset GPIO is not defined for the amplifier,
> the amplifier will not probe - unless the amp is using a shared reset.
> In the case of a shared reset, the GPIO will control resets for both
> amps anyway.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221161
>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

[Severity: Low]
This fixes a boot issue introduced with cs35l41_reset_and_boot().  Should
this include:

  Fixes: 9bfbc1af0713 ("ALSA: hda: cs35l41: Add common wait_for_boot api an=
d reset_and_boot api")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120161136.1575=
93-1-sbinding@opensource.cirrus.com?part=3D2

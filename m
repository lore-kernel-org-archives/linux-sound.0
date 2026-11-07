Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794050664;
	b=19ygBhRj++BHOH1Tke5GegIG5qVhwx0NbGE/5Nh06tyILkxsCjEklCjMrpE30o8ycEtV
	 CCirYQwuNubepzc3gfM6Rktx/IVuc+fVBqTZNp7JcO8ycqsNhiOKyKVL7tdK6GHeYuWb+
	 9TSz4XXqwzyH5RfyBMQcWxOQofR1wiHWCi4ZqTPeI3j6wtT0p7pYKZmcj4POmUkJSpWaq
	 2C5VHYeJ4PD4dlJgnzyo2GCyf3j+vFGOu7N2OrueZGXlqfuJykZckQyBlLeTZH9BHd3yV
	 YqNdCluAchGD4zR+JORpsaaWxbjRcuHpfOIEokpgVAf2cw3EOYBJmdjAic09RYLQ4Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050664;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=o3FnEpPPeeVN7veQWUCkiyXNbkWvxZrHsqijwgLy9vQ=;
	b=PeBhxfDSSzFTR7SSMXC7vyQNnlp3ZHVsPLsBExqWtx/kc/Y2lB0VO5mQ369lUxi+rHKp
	 TRFCNNLLMv/EWl+sxPB+XaqoWll6UuRfok6tSrp5muGA5sNPb0Z3ij7YJMLue0rtaNVIX
	 L7P5J3AKH2sR2Vrvb19LJ55v14pcyzT4EuyehF31ea51psWcpfrFhnjxKrKIFrzAtlYcO
	 w0zM3Ad08BtUy4DIj9pYLO81znFBphC7L9U1fIBm0H5Mt2QB+4rVDqFYDm8/sS9fLktJI
	 HNsfDzDymGjPbWE2o2106TcizhEX9Qerokefpz3I95e4RZiON9taWJVE4MrwNUGQcaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PWKrxIg5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC22606A32E
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PWKrxIg5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117371F008A1;
	Sat,  7 Nov 2026 11:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794050664;
	bh=o3FnEpPPeeVN7veQWUCkiyXNbkWvxZrHsqijwgLy9vQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PWKrxIg5CYCx8c1SbTvfuPQbzLrlZc14mHgS5Ds1579+/fkO9bT0qKe7YRrofTvdJ
	 3PzRmngVZ+qQ+rGvOFOL4pa87OOmPcNKwFtglqABDFNWGFvuoPzq8QAR/ffGCNyMLz
	 Kamjk7ZN+Zl5GCPD30DVdwM8wIJKyApctbjwntfj/iSeUtucJ3ohQy9+8giDhfSCtm
	 1IpsRTWDD0AYz0dstjhzYCMOGUJBB8/vNjVCBGTj+hXhUvRLtaFgFC1BhlXOCSE5ox
	 K4/NOIY14dFnk8uK9WUJvuOzhoE6f/bmFrNx4ggD2qXeuPjnI3VnmHqI9MXnjNcvwQ
	 JU5YGJ3at82+g==
Message-ID: <sashiko-outbox-202853@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ALSA: ump: clear stale RPN selector on NRPN change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alyandra Zahran Nadhir" <alyandra5b@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107111056.667-1-alyandra5b@gmail.com>
References: <20261107111056.667-1-alyandra5b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 11:24:23 +0000
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
- [Low] ALSA: ump: missing Fixes trailer in commit message
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] ALSA: ump: improper RPN/NRPN state reset in reset_rpn() [1]
--

commit e95e219dab86391e1d43f84e1ce499ca3011380d
Author: Alyandra Zahran Nadhir <alyandra5b@gmail.com>

> ALSA: ump: clear stale RPN selector on NRPN change
>
> The legacy-to-UMP converter keeps separate RPN and NRPN selector
> flags. When a stream changes selector type without sending data first,
> both flags remain set and fill_rpn() gives RPN priority, so subsequent
> NRPN data is emitted as RPN.
>
> Clear the previous selector flag after flushing any pending parameter
> data and before recording the newly selected parameter type.
>
> Signed-off-by: Alyandra Zahran Nadhir <alyandra5b@gmail.com>

[Severity: Low]
This fixes a bug in the legacy MIDI to UMP RPN/NRPN converter.  Should it
include:

  Fixes: 0b5288f5fe63 ("ALSA: ump: Add legacy raw MIDI support")

> diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
> index ecbd894f4c83a..fe7d3ee3c6b1f 100644
> --- a/sound/core/ump_convert.c
> +++ b/sound/core/ump_convert.c
> @@ -378,6 +378,7 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_um=
p *cvt,
>  		switch (buf[1]) {
>  		case UMP_CC_RPN_MSB:
>  			ret =3D fill_rpn(cc, midi2, true);
> +			cc->nrpn_set =3D 0;
>  			cc->rpn_set =3D 1;
>  			cc->cc_rpn_msb =3D buf[2];
>  			if (cc->cc_rpn_msb =3D=3D 0x7f && cc->cc_rpn_lsb =3D=3D 0x7f)

[Severity: Medium]
This problem wasn't introduced by this patch, but does fill_rpn() calling
reset_rpn() [1] drop consecutive Data Entry updates for the same
parameter?

In MIDI 1.0, an RPN or NRPN selection stays active across multiple Data
Entry messages until a new parameter is selected or RPN Null (0x7f/0x7f)
is sent.  However, fill_rpn() calls reset_rpn(cc) after emitting the first
UMP packet, clearing cc->rpn_set, cc->nrpn_set, and cc->cc_rpn_msb/lsb
along with the data flags.  Any subsequent Data Entry message for that
same parameter then sees neither rpn_set nor nrpn_set set in fill_rpn()
and is silently dropped.

[1] https://sashiko.dev/#/bug/linux-552af5af-5e38-4c5d-9b46-76886460e72d

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107111056.667-=
1-alyandra5b@gmail.com?part=3D1

Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A75B3D561;
	Mon,  5 Jan 2026 03:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.196.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767582955; cv=none; b=IHGxSYnKiQ0Q9fOY9sQ5F//J4lDtIathjcuBUI6PZ8qqMiyxgo33sGPoZUcy0tcFM4ym6/WukhNaDmTZsW6D/ukOGjFhO0jUsxJD1mvDU+Kk/Y+fOEOWP1O53/pYVVnk9evwUHBizoTRgVcNk7ss8HbyDS9601AZFHvAFFUj/b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767582955; c=relaxed/simple;
	bh=PRWsrjQN5fV6IBHibze5Lz5bXzuPreu95fcZbiS+agM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WKfE8ij0TGpHqkpY+KFqQaMliVuUmbwnKG0F31EtN/CnWR+5iUr80ATsAQbVra8YGBizPGFV2znkCS6yCUBDGAKgD2j164Xj2f9YiUP1c3i4Gbi6VNwTTVvHLCJXAN9ELl+RDXFXfY4kdRwUDhh6BMpT0KSjANy5k0fvqLbEMX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=XHK96aYE; arc=none smtp.client-ip=135.181.196.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="XHK96aYE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1767582597; bh=PRWsrjQN5fV6IBHibze5Lz5bXzuPreu95fcZbiS+agM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XHK96aYEeC/iamA3N4E9lgDEgrPbdRZzt4iRQegzs+sx7YMAF1T87q12rgb/qzg/V
	 bMPJtJ2v5SVPyd9Yf5ZydtRdlKPKxELyEuYR9YUjqy2qdZ17qAOZOxTIRgW1HjCPjt
	 bLOoFViFvxZ/66EIGKFzBbRLMiRlrUENgI1Z0ZFl9TT9+ECGvEfQrAmzxhIQN7p+LG
	 dlaEzbpr5wsNTYCjxrLWcAwVZ/Gs2hGV85+DNXXQpfCTthzev5iuwEdiKypR1gFWjR
	 kCpEU20cw6urbyasaITt2GT170Mx1q08gx4O1hpbYRhxQIL/z12V8F8iOFHb35T4Ss
	 q6Nhi1OJvBF/A==
Received: from pliszka.localnet (79.184.51.180.ipv4.supernova.orange.pl [79.184.51.180])
	by ms.puri.sm (Postfix) with ESMTPSA id 3C7F01FC1D;
	Sun, 04 Jan 2026 19:09:57 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH RESEND 0/4] sound: codecs: wm8962: Assorted fixes
Date: Mon, 05 Jan 2026 04:09:55 +0100
Message-ID: <5999268.DvuYhMxLoT@pliszka>
In-Reply-To: <20260105-wm8962-l5-fixes-v1-0-f4f4eeacf089@puri.sm>
References: <20260105-wm8962-l5-fixes-v1-0-f4f4eeacf089@puri.sm>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On poniedzia=C5=82ek, 5 stycznia 2026 04:02:07 czas =C5=9Brodkowoeuropejski=
 standardowy=20
Sebastian Krzyszkowiak via B4 Relay wrote:
> Bunch of patches developed while working on Purism's Librem 5 phone.
>=20
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
> Sebastian Krzyszkowiak (4):
>       ASoC: wm8962: Add WM8962_ADC_MONOMIX to "3D Coefficients" mask
>       ASoC: wm8962: Don't disable SYSCLK if it's enabled via DAPM
>       ASoC: wm8962: Don't report a microphone if it's shorted to ground on
> plug ASoC: wm8962: Don't mark WM8962_ADDITIONAL_CONTROL_4 as volatile
>=20
>  sound/soc/codecs/wm8962.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> ---
> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> change-id: 20260105-wm8962-l5-fixes-8cde049eb67d
>=20
> Best regards,

Sorry for an instant resend - this is the exact same content as the origina=
l=20
patchset that at first appeared to me as if its sending has failed, so I=20
retried through the B4 relay just to see them both going through... Please=
=20
ignore the extra copy.

Thanks and happy New Year,
Sebastian



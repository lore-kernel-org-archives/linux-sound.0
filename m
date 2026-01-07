Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7F42DAFAA
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781078; cv=none; b=Qdy1Jm0rLj8utK9ZQH/8ial+XYOFD7R3AQ5u39Tmlbic8fHxfC3sQfD4IAmgn+6kAlU4kypVHJVJctJinrbptnGVK/CyR2tzjWmBiRldEEGva77W/1QBkZnu8LW54lAoJIPZs3+qaJZUfoID3FcitVJkNFdd9nNZzi/BCxkgHGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781078; c=relaxed/simple;
	bh=d5Tul0I5OkuQDh0YBzdiueZlU98VBQ7KXZx/9nBJD+s=;
	h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:Cc:To; b=EAdYfdoKSoV8P1marraWBjgk3w6Hxf0ixlFmpxZ5z1KmFCbLE1FrIwKHuTKLZd8somlf8no2EK830sTNaGwY4ENIJ2JI3h4YNNQ/zEJvWNum+QmUNf/V23AEwOKxa/509gqHJHnZzvi0Qvf0E58IRbLDAGyOAIw1NGnkMlmIjV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BI4/JpAe; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BI4/JpAe"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767781073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RDb8WpHL1/wcyAtMAFuF5D6gi4j628897ntQvkZicKw=;
	b=BI4/JpAeglGFwF6wrdv3dAyNwdGS1oIlS9rYt0nxIVUwQ7fKWuK5g4DP4/2uLeq7O2NALp
	cz8hEMrqxcLWrNaNU2/hZAUajyyEdfO+vnp//EF/RRXX2UghM0Mw6M9oI22n5IvQ2RtHyV
	L7fHBnacDIY4v//q2wFJ+sRQTlM7Smo=
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Prevent throwing away custom calibration addresses
Message-Id: <862C1A43-9C43-404F-A940-920FCD7D1919@linux.dev>
Date: Wed, 7 Jan 2026 02:17:35 -0800
Cc: Shenghao Ding <shenghao-ding@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 tiwai@suse.de, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Antheas Kapenekakis <lkml@antheas.dev>
To: Antheas Kapenekakis <lkml@antheas.dev>
X-Migadu-Flow: FLOW_OUT

=EF=BB=BF

> On Jan 7, 2026, at 1:32=E2=80=AFAM, Antheas Kapenekakis <lkml@antheas.dev>=
 wrote:
>=20
> =EF=BB=BFThe V2 UEFI spec for per-device calibration data in TAS allows fo=
r
> manufacturers to specify up to five custom calibration register
> addresses and values to optimize per-device in factory.
>=20
> A basic description of the spec is found in a comment in function
> tas2781_apply_calib(). However, currently, for the condition of
> p->dspbin_typ !=3D TASDEV_BASIC, if custom calibration addresses have been=

> provided by the manufacturer, they are ignored and the ones listed in
> firmware are used.
>=20
> In case the manufacturer chose to change different registers other than
> the default ones (r0, invr0, r0_low, pow, tlimit), this causes the
> UEFI calibration data to scratch different registers and cause the
> firmware to misbehave. This is true in the Xbox ROG Ally X, for one of
> the firmwares, where it pops and has audio dropouts after the
> calibration data is applied.
>=20
> Therefore, add a new bool to indicate that UEFI supplied custom
> calibration addresses, and if so, use them regardless of dspbin_typ.
>=20
> Link: https://lore.kernel.org/all/CAGwozwFQKoQgo_Q=3Dqdr-FTD+uoVWA8AtHyDmK=
wTOV4ZU6+F3SQ@mail.gmail.com/
> Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> Closes: https://lore.kernel.org/all/0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@l=
inux.dev/
> Co-developed-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>=20
> ---
> @Matt: can you kindly verify this patch works for you?

I=E2=80=99ll have time to debug it more in the morning but the patch does no=
t work, it=E2=80=99s still using the same calibrated data as before with dro=
pouts.

>=20
> Then verify your sign-off for the coby tag. If you would rather a
> different acknowledgment tag (e.g., tested-by or suggested-by), lmk
>=20
> Thanks.
> Antheas
> ---
> sound/hda/codecs/side-codecs/tas2781_hda.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/codecs=
/side-codecs/tas2781_hda.c
> index 96e6d82dc69e..6efdf0a3442b 100644
> --- a/sound/hda/codecs/side-codecs/tas2781_hda.c
> +++ b/sound/hda/codecs/side-codecs/tas2781_hda.c
> @@ -64,6 +64,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p=
)
>       TASDEVICE_REG(0, 0x18, 0x7c),
>   };
>   unsigned int crc, oft, node_num;
> +    bool custom_addr =3D false;
>   unsigned char *buf;
>   int i, j, k, l;
>=20
> @@ -104,6 +105,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *=
p)
>       for (j =3D 0, k =3D 0; j < node_num; j++) {
>           oft =3D j * 6 + 3;
>           if (tmp_val[oft] =3D=3D TASDEV_UEFI_CALI_REG_ADDR_FLG) {
> +                custom_addr =3D true;
>               for (i =3D 0; i < TASDEV_CALIB_N; i++) {
>                   buf =3D &data[(oft + i + 1) * 4];
>                   cali_reg[i] =3D TASDEVICE_REG(buf[1],
> @@ -151,7 +153,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *=
p)
>       }
>   }
>=20
> -    if (p->dspbin_typ =3D=3D TASDEV_BASIC) {
> +    if (custom_addr || p->dspbin_typ =3D=3D TASDEV_BASIC) {
>       r->r0_reg =3D cali_reg[0];
>       r->invr0_reg =3D cali_reg[1];
>       r->r0_low_reg =3D cali_reg[2];
>=20
> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> --
> 2.52.0

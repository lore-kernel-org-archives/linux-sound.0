Received: from mail.sonarnerd.net (rankki.sonarnerd.net [213.186.235.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83DC38D694
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 13:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.186.235.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148774; cv=none; b=k5MW5HXC2nGpCJqYnm+yTs3+u7bnowf7bUc57f0rFODlVONrQhO4pNm0nzgK8Y3+NF7AHhGDH8Ls9hJPoRvbdoDgmZuMOwPh+6udjGaSNRW6F8n1fuZ3LF7GHEc9OnWlwfbWs8zEawe1o0vSSgP9/bK9aE4ZHj7Srt2Av7Ka0uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148774; c=relaxed/simple;
	bh=HrDV1kgypu6BVDY0MU7OS5H1Cfmd39DcgsUebLQ7J1o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=KuoKokyr/IZQXZKS8aKKRr29rr8//VFLdAazo/C2OrhmCHg7hzb/EcXZyjCIKuVa1tOk1TYb49WJxn6WS8yAYHoHBu2RiiSZmj2RXQ2EdZ6/OlmPB4uGsUJUzs/KuK3Ebwdp5IrmoIy0FBC1yLBtbKjnmKIR/o8FYmgpc1z0qhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sonarnerd.net; spf=pass smtp.mailfrom=sonarnerd.net; dkim=pass (2048-bit key) header.d=sonarnerd.net header.i=@sonarnerd.net header.b=nz4/h7fy; arc=none smtp.client-ip=213.186.235.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sonarnerd.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sonarnerd.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sonarnerd.net header.i=@sonarnerd.net header.b="nz4/h7fy"
Received: from smtpclient.apple (87-196-82-49.net.novis.pt [87.196.82.49])
	by mail.sonarnerd.net (Postfix) with ESMTPSA id 89008231133;
	Tue, 10 Mar 2026 15:13:41 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.sonarnerd.net 89008231133
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonarnerd.net;
	s=dkim; t=1773148422;
	bh=1MXWgdy0VolXeqnmoulN8UrTfwwO1VLVbQjgTq7RILI=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=nz4/h7fyqEHUSNDdfDdNjbkRJLTBC3K8L4heHQLxiqaoK8M+hzDTDRR6fuAN7P6+P
	 2BxrCxiw02bt1bZBLVQrNB9QbkeZI2t0OmnE6hybidWzy0hydAPdjym4IhAIEJIZbH
	 vyCZOCSMc+41+ldP1/Z9iuREtiCriVPU9RX2vwWFnvffN4U8siQJYvYauKr7mlXCFo
	 8ZeV8bAMQiRA6FpPG1B+NDQVcq1XamoTfy+kH+uxUH/l3fWMqxsq4FS8IJ0hPyxBmy
	 5S5cmJca/hU19/a4StWogWyu/jIah1rT8oua3vOgilygwM5MH4RnWyOUE5uKdBrQEr
	 rT8fd2j3KICOw==
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for USB
 Audio
From: Jussi Laako <jussi@sonarnerd.net>
In-Reply-To: <TYUPR06MB62179ADCD1B86A7E0C73E53ED246A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Date: Tue, 10 Mar 2026 13:13:29 +0000
Cc: "tiwai@suse.com" <tiwai@suse.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A67CE55-CD09-4574-85B4-2C4F770497BB@sonarnerd.net>
References: <TYUPR06MB62179ADCD1B86A7E0C73E53ED246A@TYUPR06MB6217.apcprd06.prod.outlook.com>
To: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
X-Mailer: Apple Mail (2.3864.400.21)

I would suggest to include information about the actual hardware device =
in the comment. =E2=80=9CUSB Audio=E2=80=9D doesn=E2=80=99t really tell =
anything here=E2=80=A6


Best regards,

	- Jussi


> On 10. Mar 2026, at 8.33, =E8=83=A1=E8=BF=9E=E5=8B=A4 =
<hulianqin@vivo.com> wrote:
>=20
> Setting up the interface when suspended/resumeing fail on this card.
> Adding a reset and delay quirk will eliminate this problem.
>=20
> usb 1-1: New USB device found, idVendor=3D0666, idProduct=3D0880
> usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
> usb 1-1: Product: USB Audio
> usb 1-1: Manufacturer: SPACETOUCH
> usb 1-1: SerialNumber: 000000000
>=20
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> ---
> sound/usb/quirks.c | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index c6a78efbcaa3..3352e3538a19 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2241,6 +2241,8 @@ static const struct usb_audio_quirk_flags_table =
quirk_flags_table[] =3D {
>   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
> DEVICE_FLG(0x0661, 0x0883, /* iBasso DC04 Ultra */
>   QUIRK_FLAG_DSD_RAW),
> + DEVICE_FLG(0x0666, 0x0880, /* USB Audio */
> +   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
> DEVICE_FLG(0x06f8, 0xb000, /* Hercules DJ Console (Windows Edition) */
>   QUIRK_FLAG_IGNORE_CTL_ERROR),
> DEVICE_FLG(0x06f8, 0xd002, /* Hercules DJ Console (Macintosh Edition) =
*/
> --=20
> 2.39.0
>=20


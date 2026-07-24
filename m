Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2050E253B73;
	Fri, 24 Jul 2026 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784900425; cv=pass; b=fItef73ikcjBG/7mYj7sCX3XX449RhjPzMkNppZWyEU7uzcW9GPDIU885S0OFsGt5fXihAMqeEwbj3nM9jNm84luA7w8cjz4JZXYA6lYudWGqE7qYvknX7qSmxm4T7OTT7uD2t+3dyIiN/z7Mn9bJLAlZ9rlvc3l1gcn2kS3JdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784900425; c=relaxed/simple;
	bh=GeCLox5Ws0jPd6YyqhoT3hHH0wnGtX4vSgx0NbYrMeo=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=herEYRgmXOdHttW8uFJplH7u4DBUbNN0rJxKkMmJ3OVXJV0P10NCXHr2ZYVKQ/z7Xz5uDOrb/XPOxxQGtCdmVSjF29xPmhabivx8N+rF6UPe2jsP/JyQvYzE817rm1T1Xh9Qfec863oFiQG5nBjJmxNQ8AWPkQ1FBmVpUT+N8qQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=q2022lQs; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="q2022lQs"
ARC-Seal: i=1; a=rsa-sha256; t=1784900412; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bfPNFqgnDxYM9fMUduzR9vd0gk6RFTEf+k8UXiPCs25qWhtRmFrErVnFdH4HIKOZlTbKJg7t/c3UBC4SPSYWSPLpYcDfamx/ijbps/032HWuh3pcRtKeEMLiuW1bGTXmvihpSKy3nq0eGogAxtXVcdXfNy5s88ywFnpEtKn4Igc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784900412; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mvPMfSgM16bUnnOgLDifTXufSWhuvhTGMnK5PKebKVs=; 
	b=R53s9kLFag+va4Jx+sFuOUXpVWMSQAGk5Uqtvef94ls2pJsh/84/tsfHQVVptxuCM/ZWWzkaPYvAfyQIterpAf2togOi2siRLUl1AiMEMOJckqcteTnXMY0z5xcR9HrgbRhkAbsVRyAWXdJxe9nKL2tDS3tlyj/kOXh5EDq3pv4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784900412;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=mvPMfSgM16bUnnOgLDifTXufSWhuvhTGMnK5PKebKVs=;
	b=q2022lQsCezHTgisIblCKZL5IyLrShFJEDRjqrUWW9XSdiLSu9ICQor2Wj/Vza73
	1QCv8vqEABe9IDgg7WVbElE38m4MYaJtsUrSEfFYjmlOXyxi0LKt2g7d0JB0iPZUNtd
	FYlJPKlpdjNv4Jj5tS3bdQCs5SlY+Yqe+GPzidFrdavcACF0vG/RwSRno96wqECJq43
	nyVHJihEVqInLr4gjuN+n3M3jmVGHv/4hTZU27ffN2JYL27ARSglWoDzCQ+x48cvZed
	CqqGeagsubdl68GZ7Jaq9A7Pw/CTCBYGKHlGfFk9AucLEGw521LB17XhqS0lnXd319o
	3jDirWJdMw==
Received: by mx.zohomail.com with SMTPS id 1784900410207711.2294371822604;
	Fri, 24 Jul 2026 06:40:10 -0700 (PDT)
Message-ID: <3f2f544c9bea578f7d39ebbb6da25c85fa798d62.camel@rong.moe>
Subject: Re: [PATCH v2] ALSA: usb-audio: Add iface reset and delay quirk
 for JKY Technology Q2A
From: Rong Zhang <i@rong.moe>
To: =?gb2312?Q?=BA=FA=C1=AC=C7=DA?= <hulianqin@vivo.com>, "perex@perex.cz"
	 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
In-Reply-To: <TYUPR06MB6217566CFD33F57D3AE46816D2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: 
	<TYUPR06MB6217566CFD33F57D3AE46816D2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 21:39:43 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10 
X-ZohoMailClient: External

Hi Lianqin,

On Fri, 2026-07-24 at 12:46 +0000, =E8=83=A1=E8=BF=9E=E5=8B=A4 wrote:
> Setting up the interface when suspended/resuming fails on this card.
> Adding a reset and delay quirk will eliminate this problem.
>=20
> Note: This device's VID conflicts with Apple's (0x05ac).
>=20
> usb 1-1: New USB device found, idVendor=3D05ac, idProduct=3D110b
> usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
> usb 1-1: Product: Q2A
> usb 1-1: Manufacturer: JKY Technology
> usb 1-1: SerialNumber: 330270D2251225
>=20
> Suggested-by: Rong Zhang <i@rong.moe>
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> ---
>=20
> Changes in v2:
>  - Remove matching Product
>  - manufacturer,product (new line)
>  - Add VID conflict information to code comments
>  - Link to v1: https://lore.kernel.org/all/TYUPR06MB6217BD7BF1AE9B308295F=
FFCD2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com/
>=20
>  sound/usb/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 0de7c9d94259..13863e966347 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2200,6 +2200,9 @@ struct usb_audio_quirk_flags_table {
> =20
>  static const struct usb_audio_quirk_flags_table quirk_flags_table[] =3D =
{
>  	/* Device and string descriptor matches */
> +	DEVICE_STRING_FLG(0x05ac, 0x110b, /* VID conflicts with Apple */
> +			  "JKY Technology", NULL, /* Q2A */
> +			  QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
> =20
>  	/* Device matches */
>  	DEVICE_FLG(0x001f, 0x0b21, /* AB13X USB Audio */
> --=20
> 2.39.0

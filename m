Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2293C10AE;
	Fri, 24 Jul 2026 11:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891648; cv=pass; b=KCy4vK9Hk3s1LKLkTAIfiI3f9Ht0jmxymO42tB08jkI/dveUkD4l0nK+nwiZE0T9u8Vpcxx99xw2tH7st2nxhv2/g4556Bvs6I3vVyjQ2Iq94rGVoi3ZrOQAXIfyryTZYUtqN2qJy0/ckcghLR8PAYuwKuhdoB5U7fGmytoYOTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891648; c=relaxed/simple;
	bh=x078Qu+OnLoSlzQPM0bmkTYnAMSDCcHhjayvfK6whHU=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ex99Dhsv8aJG3LM/LZBQX0kH2tkqw3YjcuOxkPqbyWhmDWL60qOTMsPgL/WsP/lb0TK9KXrlbvpF6vsuBvkPXRU3LHYpnn+cMknelxlE5OT2zZhGp8vFl1ogHJ7cqfZN4d+bEOD/tSBccfkGzGGFOFr8Ol6FRNpfGhqgIYMx0y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=bSD21utu; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="bSD21utu"
ARC-Seal: i=1; a=rsa-sha256; t=1784891628; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JeSXQ8nXMxkJpjHr/hR5z/Y8I4k79/u02jYiFHXc0penzZko5bwy7Nx5hIvUc7XpqWeeiS2lJquKClDJCr+EezYj4GkVkLq2aQ/jwIbroeRsaRwIS+cDc3DoAhPMWXjodol9xFAYKvgmmBxHODnA07+zVNuoeUZy3pLyzxvMb9k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784891628; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hoHfMDLxILE5jLX57t0bQXyvR1ibcGTAJFBk8z76s2I=; 
	b=jM7zhebEeiG81Cn6KmH6gDUsZ3NGcravukhHjuO62XcYvJlfCdw3rL+s5X2XTbubeixEANmTwmp66aLlsDwuxcAu5aYeJGFS8DJx3+q1OPAxxmh8pw4SeyNRPFXZg8cOXCtmW5yGHGfgnvI2YDZQfq/HqCus1SMhfh97nL9PXmo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784891628;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=hoHfMDLxILE5jLX57t0bQXyvR1ibcGTAJFBk8z76s2I=;
	b=bSD21utu6Pza/7Ok1V6esLbuNWmU0XJtQifIFWN7Y7HC+r5KeKmcUM49UeE01nJj
	9PghZvkHFg2z5dJxp1hisV0NfHabxHbmPCiJbhwS//6wTczIayRokk5tTjNX+nnyCM3
	P4xAn0XDCswPWm+LBY2ivxui4VWb3CoZfjfmcyXPRfF8P74egeFdtWM+5es1KF4020M
	o8vBs7x7vh2WHJR1WiDri38dhTl7XTjSa7wWuIh/9Iiq5G6eQekm/UAiqK7alPpzTNn
	/a966xZNOfYXLfGn65TIGbMse1JR9lVVGS80B6jrjVygT3MCZdxk21a6XijCIfblb1e
	RT4f2Y/ZSg==
Received: by mx.zohomail.com with SMTPS id 1784891626086488.1666071154665;
	Fri, 24 Jul 2026 04:13:46 -0700 (PDT)
Message-ID: <2cb27fb80f6fbdbd3b72138ce2d33c878e4e8049.camel@rong.moe>
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 JKY Technology Q2A
From: Rong Zhang <i@rong.moe>
To: =?gb2312?Q?=BA=FA=C1=AC=C7=DA?= <hulianqin@vivo.com>, "perex@perex.cz"
	 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
In-Reply-To: <TYUPR06MB6217BD7BF1AE9B308295FFFCD2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
		 	<TYUPR06MB6217BD7BF1AE9B308295FFFCD2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 19:08:38 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10 
X-ZohoMailClient: External

Hi Takashi, Lianqin,

On Fri, 2026-07-24 at 08:29 +0000, =E8=83=A1=E8=BF=9E=E5=8B=A4 wrote:
> Setting up the interface when suspended/resuming fails on this card.
> Adding a reset and delay quirk will eliminate this problem.
>=20
> Note: This device misuses the Apple VID (0x05ac) & PID (0x110b).

The device's VID conflicts with Apple's, but there is no PID conflict,
right?

If a manufacturer uses other's VID, it's a VID conflict. The device
falls into this category.

If the manufacturer uses the same PID among different products, it's a
PID conflict. I don't think it's the case of the device, unless JKY
Technology reuses PID 0x110b for products other than Q2A.

>=20
> usb 1-1: New USB device found, idVendor=3D05ac, idProduct=3D110b
> usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
> usb 1-1: Product: Q2A
> usb 1-1: Manufacturer: JKY Technology
> usb 1-1: SerialNumber: 330270D2251225
>=20
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> ---
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 0de7c9d94259..ad2ce384e32d 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2200,6 +2200,8 @@ struct usb_audio_quirk_flags_table {
> =20
>  static const struct usb_audio_quirk_flags_table quirk_flags_table[] =3D =
{
>  	/* Device and string descriptor matches */
> +	DEVICE_STRING_FLG(0x05ac, 0x110b, "JKY Technology", "Q2A", /* JKY Techn=
ology Q2A */

Hence, I don't think it's necessary to match "Q2A" here.

Meanwhile, in any case, the comment should describe the VID/PID conflict
instead of repeating the string descriptor(s) being matched, and the
strings should break into another line.

See how commit b13031ca112a ("ALSA: usb-audio: Deconflict VID between
Focusrite Novation & MV-SILICON") describe the conflict and arrange
lines.

> +		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),

Bad indent.

This is the first DEVICE_STRING_FLG() item, so please don't set a bad
example. I would prefer:

	DEVICE_STRING_FLG(0x05ac, 0x110b, /* VID conflicts with Apple */
			  "JKY Technology", NULL /* Q2A */,
			  QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),

Thanks,
Rong

> =20
>  	/* Device matches */
>  	DEVICE_FLG(0x001f, 0x0b21, /* AB13X USB Audio */
> --=20
> 2.39.0

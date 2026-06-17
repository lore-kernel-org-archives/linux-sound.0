Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D4D4503B;
	Wed, 17 Jun 2026 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698615; cv=pass; b=Cl4GVy/Bw8PdtGUYrBCwfF4S2BqbToJK4TpUURT40J7nZz8ipPHnw2Ek0ktpz8AzJM8Rzmmo3B/EKHiYzko5vBYjAXwHUwTRtn9nJJ4gWG/wirDFck6BvqZZOBOiveDOnGuckjr8o95Ta9Y05tKVN4A/V/aW4x6GEIYBHISnsFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698615; c=relaxed/simple;
	bh=MElwZo4ADOgbhuIrEuU9LZ+fUHtWkyPUtvbCJ25cjMM=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VZFUZaah34SKZdOrxQiobe0uSVGsMC+lyRETbrrsDDGNdt11IYd0hsxicQxNLVSRYAJZpLQAY8x0KXZYU95ALi6siBPwpFgeEGCuMjyQbz8mmtvTms9g0KN1CfmhujRW0nyUHe+tQEJQPkvyeBFsfxL2g94P30CUG0GLFQJZVus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Z864r1Cj; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Z864r1Cj"
ARC-Seal: i=1; a=rsa-sha256; t=1781698574; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PW9x/wLNLMLngbpetUt575x202ENdzfVhOtt33BBAwoqh2w3JO6pe/z6p7FbMqd75voLLN8lGT20EUZq9abFnCekhoduxgkOoalMdHNkZimLmvgYuoRHricy2EefCS1DAS5QL1NxeZULgCO5v9AAVMKw3elyy4Ve5QcxGUFajYg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781698574; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RfANY/ODf0qfEK0sHIOkwCu6aUJeagXFbtFrKPVqIrI=; 
	b=eDl82S6zE2lfTh+snGlfh75z0VKjKbEHYqIIRl6vwTml+wTsAq3blRxIFRPkbAeILVn5yaQvEGdzPnBit1IOnMtImRe9O7DAH/LnArbh2WnS2CNHYE6sn5Lq+VJ2KWq4UUPNZLEDU4jXgQ77osBkiI242geKoZ49HWBoyinO9Zg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781698574;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=RfANY/ODf0qfEK0sHIOkwCu6aUJeagXFbtFrKPVqIrI=;
	b=Z864r1CjPJEDfUs8Gcm0QAr/IAc598ksn8Ua0tQm5acs3sVPQrPED558C+LQum/J
	cq0MBHp/+saCKN8wmUrmFN6ix4oHyV2e1DNIrsUIBvjabc/02u0uZBJA4sli+oJt1pb
	In8bPQLV02tPrGZDXei/k93B119brrfVlTVgVbpsFmcqTFecXsFAAMxTCLtUVoWDMNI
	QWqncBUtOTzKMvjsmGBRFUz1BZJTtc9l/rEIn2Kqo28TcoOFJl6KZsi1krnZ2fn4eNh
	ww95sOYWUpudfxd0mUbA4kpvF8e0Dd/f/2VFtmDSIqbj3TYtDKUmVY4AabL4EqbiPf8
	EP1yMMGuuw==
Received: by mx.zohomail.com with SMTPS id 1781698571931257.44314839897424;
	Wed, 17 Jun 2026 05:16:11 -0700 (PDT)
Message-ID: <3da80349ce573419ace8bc907e23ce9beae5fac6.camel@rong.moe>
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk flags for SC13A
From: Rong Zhang <i@rong.moe>
To: Ai Chao <aichao@kylinos.cn>, perex@perex.cz, tiwai@suse.com, 
	hulianqin@vivo.com, g@b4.vu, cryolitia@uniontech.com, pav@iki.fi
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260617025234.3344935-1-aichao@kylinos.cn>
References: <20260617025234.3344935-1-aichao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 20:12:38 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Ai,

On Wed, 2026-06-17 at 10:52 +0800, Ai Chao wrote:
> The SC13A ( VID 0x1ff7, PID 0x0f81) not support reading the current
> sample rate and results in an error message printed to kmsg. Set
> QUIRK_FLAG_GET_SAMPLE_RATE to skip the sample rate check.
>=20
> Quirky device sample:
>   usb 3-5.2.4.1: new high-speed USB device number 11 using xhci_hcd
>   usb 3-5.2.4.1: New USB device found, idVendor=3D1ff7, idProduct=3D0f81

IIUC, the VID is owned by CVTE, and the product name matches their
naming convention.

>   usb 3-5.2.4.1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumb=
er=3D3
>   usb 3-5.2.4.1: Product: SC13A
>   usb 3-5.2.4.1: Manufacturer: Linux Foundation
>   usb 3-5.2.4.1: SerialNumber: 000002
>   usb 3-5.2.4.1: Found UVC 1.50 device SC13A (1ff7:0f81)
>   usb 3-5.2.4.1: 3:1: cannot get freq at ep 0x86
>   usb 3-5.2.4.1: Warning! Unlikely big volume range (=3D4096),
>     cval->res is probably wrong.
>   usb 3-5.2.4.1: [5] FU [Mic Capture Volume] ch =3D 1, val =3D 0/4096/1

Most CVTE webcams also ship with a microphone. Does it also apply to
SC13A? If so, it probably needs a mixer quirk too, e.g.,
QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL, QUIRK_FLAG_MIC_RES_*, or a device-
specific one.

Thanks,
Rong

>   usbcore: registered new interface driver snd-usb-audio
>   usb 3-5.2.4.1: 3:1: cannot get freq at ep 0x86
>   usb 3-5.2.4.1: 3:1: cannot get freq at ep 0x86
>=20
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 46718c5499df..e6c011cf8ffd 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2413,6 +2413,8 @@ static const struct usb_audio_quirk_flags_table qui=
rk_flags_table[] =3D {
>  		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
>  	DEVICE_FLG(0x1bcf, 0x2283, /* NexiGo N930AF FHD Webcam */
>  		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
> +	DEVICE_FLG(0x1ff7, 0x0f81, /* SC13A Webcam */
> +		   QUIRK_FLAG_GET_SAMPLE_RATE),
>  	DEVICE_FLG(0x2040, 0x7200, /* Hauppauge HVR-950Q */
>  		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
>  	DEVICE_FLG(0x2040, 0x7201, /* Hauppauge HVR-950Q-MXL */

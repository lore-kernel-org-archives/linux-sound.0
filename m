Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5982C2EF64F
	for <linux-sound@vger.kernel.org>; Sat, 30 May 2026 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780139479; cv=pass; b=SsKKf6XhY9vqvLKxvWOA15mSByjSvJZ1Y86a0ioq5DeDLjwDAJjDamPmvalkSOoXs3n5ikAabd/iw08Qo0UrWeqTFr6AeOcihutDqB5DBtwAL77BFUP6jm48tDKYzpS5SwdPGCEMAZa1nAJXayO/z/zN5HbzbCcA9rhXXAkxxJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780139479; c=relaxed/simple;
	bh=Em/q7g+BHrTDIHuK+HtErSiQk0CdvSTMp32ptuYUbtk=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mGt5qu7PNnFKjU1zN6tV7SEH7jsDmDFTkOY58K8rwEDeQelapVjRnqpXjCSHG4px4u2mamf3EZwAeOf+3EJpdU3Ssi2CYy/BEfqY3DdSR05rsUjPBAvlHfkgpGuz1vVAhMw7XfYJyG6Q7cAPV8i/f1tUr2Cm8fz1sRs0qQxj7qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=QtKDtkFu; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="QtKDtkFu"
ARC-Seal: i=1; a=rsa-sha256; t=1780139470; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WxpKhStveGCxdnn76FTBoVY1lcWytHm4cIdKrnJHaYVmvCVjlcolzFwhdaP94eCMDR3hUgIGsEJnwKGAEl+KktnU4dSRhAzr9l0mseIWVqrZgEULtInNLh5+HHNmrbYiIGf3Hxmd7atITDVrFc6ulzCxmih5JpZTwBj0c6kSQmI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780139470; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bvFwWsLbiz5ukAVR2OeIqxm7eHHaETJLYhmquSAVBjM=; 
	b=juasyqI7bMq18Vd2I/AoQC92oNm5Jg8nIzY+6+1uLNB4Q98iAMdGFD17/z+PkpjvDMcb+PwXRFsGW+1HC+7XDDIHnXgPckL73SPIqZjgFo5hUtKftKtghWeLdkoH8R4dhCSfcoUH1ZwKUXykpn/sc2h0QZNQyXsYJnllx+YyG2g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780139469;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=bvFwWsLbiz5ukAVR2OeIqxm7eHHaETJLYhmquSAVBjM=;
	b=QtKDtkFur50XW0j1Fh676DOJxyhgplKsEaL4t0fZVL05ipGmhxyn5i7A1a1sAp7O
	2gRFivEKt3LmsrVjfmWxz/YrrYjv4C8/X7GaUSpALJnoW9QElq3LfHNcyTpauMdx4rf
	/p+HC9BdVDlfKtdar1xNe3qBgVqcxMj1DYTjifCo72hL4sxZL43vIZctVEmf2XyJiwv
	AYtH6DaaoZoaD5DPAfkkXL+mITcgybuVjdx6tZePeQ41k2CpBp4VxkVskGeAbs4ah5f
	Uu8apwPP20WGZ6q5s4whVLa9Da6PKYloU13du5QLLp4dIRHzd/txRHHSXt9tsPbdccK
	01s4UEWSrQ==
Received: by mx.zohomail.com with SMTPS id 1780139468631846.1514651687035;
	Sat, 30 May 2026 04:11:08 -0700 (PDT)
Message-ID: <50261203461f3b56c0bd196c1d9a754f84a4d8bc.camel@rong.moe>
Subject: Re: [BUG] Audio regression in 7.1-rcX; low volume on Edifier MF200
From: Rong Zhang <i@rong.moe>
To: Steve Smith <tarkasteve@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, Jaroslav
 Kysela	 <perex@perex.cz>
In-Reply-To: <CAHLWS5HrOUGw8KiPsZPV4im3jKLd1YOoRs6szvLjusHQm1dmZQ@mail.gmail.com>
References: 
	<CAHLWS5FJCx66GQ-O10pu+nEudEo_QgQAM9vt76T7vT0zGPPC1g@mail.gmail.com>
	 <87wlwmr32n.wl-tiwai@suse.de>
	 <b25d12e13bffefb926d92464eda1f66cb26f5dfa.camel@rong.moe>
	 <CAHLWS5HrOUGw8KiPsZPV4im3jKLd1YOoRs6szvLjusHQm1dmZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 19:06:03 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Steve,

On Sat, 2026-05-30 at 12:34 +1000, Steve Smith wrote:
> On Fri, 29 May 2026 at 22:07, Rong Zhang <i@rong.moe> wrote:
> >=20
> > Hi Takashi, Steve,
> >=20
> > Hmm, the dmesg dump is, however, for a good commit. No wonder we
> > couldn't find the error message... :-/
>=20
> You are correct, apologies. rc5 (broken) dmesg attached; it does have
> the following line:
>=20
>     usb 1-3.2: 9:1: sticky mixer values (-32768/-32513/1 =3D> -32702), di=
sabling
>=20
> > Steve, could you please attach a dmesg dump for a bad commit? And could
> > you please test if setting QUIRK_FLAG_MIXER_GET_CUR_BROKEN on your
> > device helps? See
> > https://lore.kernel.org/linux-sound/20260529-uac-quirk-get-cur-vol-v3-0=
-bde363188ca4@rong.moe/
>=20
>  I can confirm this works:
>=20
> * Applied above patchset to its base commit; volume still low.
> * Added to MF200 to the quirks list (see below); volume behaves as expect=
ed:

Thanks for testing! I will submit a patch for your device with your
Tested-by tag.

While a correct fix for your device is a said quirk table entry, I will
also submit another patch to improve the error path of sticky mixers as
I've said in my previous reply, so that future quirky devices can mostly
work fine before someone submits a quirk table entry. I will add you to
the CC list when I submit it. Could you kindly test it (without the
quirk table entry for your device) to see if the soft mixer works better
when you receive it?

Thanks,
Rong

>=20
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 149f2009df12..6af5a18ad88c 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2475,6 +2475,8 @@ static const struct usb_audio_quirk_flags_table
> quirk_flags_table[] =3D {
>            QUIRK_FLAG_CTL_MSG_DELAY_1M),
>      DEVICE_FLG(0x2d99, 0x0026, /* HECATE G2 GAMING HEADSET */
>            QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
> +    DEVICE_FLG(0x2d99, 0xa024, /* Edifier MF200 */
> +                   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
>      DEVICE_FLG(0x2fc6, 0xf06b, /* MOONDROP Moonriver2 Ti */
>            QUIRK_FLAG_CTL_MSG_DELAY),
>      DEVICE_FLG(0x2fc6, 0xf0b7, /* iBasso DC07 Pro */
>=20
> Thanks,
> Steve

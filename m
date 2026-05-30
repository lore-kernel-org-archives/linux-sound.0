Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D8B3AFD10
	for <linux-sound@vger.kernel.org>; Sat, 30 May 2026 12:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780143761; cv=pass; b=NIGmW6NloJuX2kJu++cTS1MrJIpCvjWxUEWH0hnCoCWBL7T6eYHH9gCDpXhLBGD6+yA1qr+FHrQ6ZQAWTcV/AdA/A58Q1b+sr/iGRyNwSPR3IuO2YM9y6TWdm2sqFTK5s/xSPe1ZbKWtdy/DgOR6cIr0ROu52TIHnd6hnWuLeYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780143761; c=relaxed/simple;
	bh=ykCaK6wPgPWdGUV/fHD9gI5oxVYknGrSTtjLdh7PNvk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Zz4UyF8T39UKr1UZoZEHoOolsvlTRZU2QQTkt8cBC36DFU+ViUyVpyoWyysODQjLozjo60y+e18UGMnImyw1Hc1SuDmww1D5+WaQq8BbLlAhzi+u0YeJfNQi7kNWO9x9ErXNeG1XU5EFXOwsk+bdKZ5VHpEsbiXFUZQkabwTGAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=HMGZs0ju; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="HMGZs0ju"
ARC-Seal: i=1; a=rsa-sha256; t=1780143754; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=avm47q9swNdns2FWouopU2nEbfC08oZMk1EmYHCjVQZk1AZTCJ5rYwmv9xbUOPRmOcRQeKoiDh587yyeUVaB1h8N4aGTy5PbhdTobLv6HwxIpY3afYlpwDh5QOsHnbTTN1OSthCyz0vQ/UXfsY45nBpi4B95ua60MjCUhAJeNZ4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780143754; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=moCZwDF9e4ooIeDhNzL7hsW636D/w6/vb1uWnbO6ISE=; 
	b=CidaL79q0+1P5f9cV+gAuo0VHSZgZOY2IrfEPChYWHqE/xS3YuvXyM9iZkTHW/5HdoKG8nbZRio2jWFzT/Y4w7ccZiE8iPdrLXOkGLI3OFTre3nXCnZ1eJUtDgClwWN9nuFDmLW32G43jnTsTL6XgkrL5KpYn8KmFADqv4ftZA8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780143754;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=moCZwDF9e4ooIeDhNzL7hsW636D/w6/vb1uWnbO6ISE=;
	b=HMGZs0juvmuvRkp0wnmlSOR8X4VIm8fmF1TXOsH62m2fcMbPTYoNGKTCBEWVAZQ6
	iLnDujPzE+9UQHy/NtF1C6AEKnA6O+7Ov7+EeUze0KBDurIDJ1XTc2JYTUsJc0gdKfT
	5fdJd0lx37JIIRF4pqzms3TocsVWP979ExE+KiV9z5TZD/5RtaOIQ0QCkk4U6HB+Acj
	IMAgehWgCq0zGc/xcwzH6l31V8RFuCVxBDxCPFnXMdTnGsm61dmEzvCAtmuLpzMgIVM
	YwKPLNBGQEcSzYMByWv3aZuQq/M9EYogB0AugriOecnhN+ZCMty7u/OkMyYOD5co5Re
	jPfYcCWprw==
Received: by mx.zohomail.com with SMTPS id 17801437516841013.0826179547513;
	Sat, 30 May 2026 05:22:31 -0700 (PDT)
Date: Sat, 30 May 2026 20:22:23 +0800
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>
CC: Steve Smith <tarkasteve@gmail.com>, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>
Subject: Re: [BUG] Audio regression in 7.1-rcX; low volume on Edifier MF200
User-Agent: Thunderbird for Android
In-Reply-To: <87ldd1p09p.wl-tiwai@suse.de>
References: <CAHLWS5FJCx66GQ-O10pu+nEudEo_QgQAM9vt76T7vT0zGPPC1g@mail.gmail.com> <87wlwmr32n.wl-tiwai@suse.de> <b25d12e13bffefb926d92464eda1f66cb26f5dfa.camel@rong.moe> <CAHLWS5HrOUGw8KiPsZPV4im3jKLd1YOoRs6szvLjusHQm1dmZQ@mail.gmail.com> <50261203461f3b56c0bd196c1d9a754f84a4d8bc.camel@rong.moe> <87ldd1p09p.wl-tiwai@suse.de>
Message-ID: <1B383455-B0F8-4B67-92AA-559D3F638999@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Takashi,

=E4=BA=8E 2026=E5=B9=B45=E6=9C=8830=E6=97=A5 GMT+08:00 20:09:06=EF=BC=8CTa=
kashi Iwai <tiwai@suse=2Ede> =E5=86=99=E9=81=93=EF=BC=9A
>On Sat, 30 May 2026 13:06:03 +0200,
>Rong Zhang wrote:
>>=20
>> Hi Steve,
>>=20
>> On Sat, 2026-05-30 at 12:34 +1000, Steve Smith wrote:
>> > On Fri, 29 May 2026 at 22:07, Rong Zhang <i@rong=2Emoe> wrote:
>> > >=20
>> > > Hi Takashi, Steve,
>> > >=20
>> > > Hmm, the dmesg dump is, however, for a good commit=2E No wonder we
>> > > couldn't find the error message=2E=2E=2E :-/
>> >=20
>> > You are correct, apologies=2E rc5 (broken) dmesg attached; it does ha=
ve
>> > the following line:
>> >=20
>> >     usb 1-3=2E2: 9:1: sticky mixer values (-32768/-32513/1 =3D> -3270=
2), disabling
>> >=20
>> > > Steve, could you please attach a dmesg dump for a bad commit? And c=
ould
>> > > you please test if setting QUIRK_FLAG_MIXER_GET_CUR_BROKEN on your
>> > > device helps? See
>> > > https://lore=2Ekernel=2Eorg/linux-sound/20260529-uac-quirk-get-cur-=
vol-v3-0-bde363188ca4@rong=2Emoe/
>> >=20
>> >  I can confirm this works:
>> >=20
>> > * Applied above patchset to its base commit; volume still low=2E
>> > * Added to MF200 to the quirks list (see below); volume behaves as ex=
pected:
>>=20
>> Thanks for testing! I will submit a patch for your device with your
>> Tested-by tag=2E
>>=20
>> While a correct fix for your device is a said quirk table entry, I will
>> also submit another patch to improve the error path of sticky mixers as
>> I've said in my previous reply, so that future quirky devices can mostl=
y
>> work fine before someone submits a quirk table entry=2E I will add you =
to
>> the CC list when I submit it=2E Could you kindly test it (without the
>> quirk table entry for your device) to see if the soft mixer works bette=
r
>> when you receive it?
>
>Rong, if you work on the improvement, can you try to have a small fix
>that fits with 7=2E1?  We can merge whatever for 7=2E2, but 7=2E1 is alre=
ady
>at a late RC, so I'd like to avoid to drag a big series of fixes
>there=2E

Sure=2E I will fix the error path for 7=2E1 while adding a quirk table ent=
ry for Edifier MF200 for 7=2E2=2E

Thanks,
Rong

>
>
>thanks,
>
>Takashi

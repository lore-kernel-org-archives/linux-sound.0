Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2292DCC13
	for <linux-sound@vger.kernel.org>; Thu,  4 Dec 2025 21:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764883716; cv=none; b=LxUaqZbmh7i5ihV/4hba6bsYF1pAZPKGYDDlKz7njlakh2lZCkUe68pAafNJAHfujGetOpvhKWE8/4p8W8BKAL5uQdUkG7AWNkyAUyHoRXmDBgQVep67CRwBCN+ooi/hgcGK3K07mImINOAhqXCOhlukqvqlFnpspInfqLEMZPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764883716; c=relaxed/simple;
	bh=PjqzH3r6Vo+Ufmbw1cbrpycwF7XAp2Q1TQT6DzBHuzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgkWS6+2YAclQ72cQJGj8GE3Dnj5Ipw8pscPGBTHxyxmUWYdfFd4IR3KAKF9r0GJKR44TSmawW6kQOB4KoFXVJPe9TEqDg4btT21fVitq2DWdryprGZtUbWq2qkC+YUh8cCckfUvpLRfZettJvCut6GX4m7/g7F3ldwIcMXC1Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=DFycKoGa; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="DFycKoGa"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 49140BD9E0
	for <linux-sound@vger.kernel.org>; Thu,  4 Dec 2025 23:28:31 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 74DF1BC570
	for <linux-sound@vger.kernel.org>; Thu,  4 Dec 2025 23:28:30 +0200 (EET)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id D92B8201CC2
	for <linux-sound@vger.kernel.org>; Thu,  4 Dec 2025 23:28:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1764883710;
	bh=PjqzH3r6Vo+Ufmbw1cbrpycwF7XAp2Q1TQT6DzBHuzs=;
	h=Received:From:Subject:To;
	b=DFycKoGaiVUHLY9tQKaRqq3BD/RXP6ey5S8PvECP83ys1ZPmoVzz3GP/xLqpymI/s
	 SleOiohCplUx3tyqYQ8slT+3Cx9kwb0No0Da1qnjO/b9ZlrDokpWR7nT1wVEoUOb2B
	 eE4ogCiCUXoP/hLWF2V94I8LcOsZut39HzGLwbn/HOUc1RgSLpnDPGBMhzDjFor7u8
	 HHnwWIo8ScMy21uWkMcV0LgvybHCxb3mzPFaDNBmHIlTc9i4v1E6a6cu4NzVLVvcp0
	 gGTAuIcaBt/tdqFAqJGAT+zWJBOn4mRJ4lxy9kDVCguFNrxdCH4vDuyxocSCXuYBe1
	 gmGG94OC34LQw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-37bb8bef4cdso12674121fa.3
        for <linux-sound@vger.kernel.org>;
 Thu, 04 Dec 2025 13:28:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXbkJF51v28DzZ/pVqQOH+nFDPVhNwNtGZM4KB8idelCbSt/PKWCeS+WYpmp4FWkm5jxDkxSGZNV2gMIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrlkQbl46yQQzzjokIMjACfz0KAUQw9zXHLmV5zb7JIzLD5XWm
	dhKGulu44zJFEYFLJ/7JNDEe6k+0gUIgnix/Rm3d0r8axKv6TcRsfmFEwcRrj8NbRcy28byv114
	WnT3f203eEZgIEx+4ax2KSEkXBTha35E=
X-Google-Smtp-Source: 
 AGHT+IGih8uIly4HD+k347BWNnGSGbbhZNyyUFPj9xrlobY1bUjYPo8n75+ynjMDj552hiWjh+BQ1bQMwgZ+tR2BhPA=
X-Received: by 2002:a05:651c:31d9:b0:37b:ad8b:7680 with SMTP id
 38308e7fff4ca-37e6dccaea4mr13412531fa.9.1764883709459; Thu, 04 Dec 2025
 13:28:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev>
In-Reply-To: <0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 4 Dec 2025 22:28:17 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGsSFj6P7_QtiR2CAA5tEBufLaQO4qRLQ5N2_HiddcB4A@mail.gmail.com>
X-Gm-Features: AWmQ_bnqVgrQAY2-HWKbIn1TtsrWvFSCmCBCfUTWTpfy9ptGklKJi6pSN5937qE
Message-ID: 
 <CAGwozwGsSFj6P7_QtiR2CAA5tEBufLaQO4qRLQ5N2_HiddcB4A@mail.gmail.com>
Subject: Re: [BUG] hda/tas2781: ASUS ROG Xbox Ally X audio issues with default
 firmware
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Baojun Xu <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>,
 linux-sound@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176488371009.2866862.17188553486337208275@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 4 Dec 2025 at 02:47, Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> Hello,
>
> I have an ASUS ROG Xbox Ally X which uses hda/tas2781 for the speaker amp=
lifiers. I am splitting this out into a new thread based on the suggestion =
from [1] to fix the remaining issues with the device's audio separately.
>
> I built a kernel from tags/sound-6.19-rc1 in tiwai/sound and included [2]=
, which seemed potentially relevant to the issue that I describe below.
>
> By default, my system loads /usr/lib/firmware/ti/audio/tas2781/TAS2XXX138=
40.bin.zst. With this firmware file, any sound above the 70% volume limit r=
ange starts to become distorted and frequently drop out from either one or =
both speakers. I've included an alsa-info.sh report with this default firmw=
are at [3].
>
> If I run sudo mv /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13841.bin.zst =
/usr/lib/firmware/ti/audio/tas2781/TAS2XXX13840.bin.zst and force the other=
 firmware file for Xbox Ally models, my speakers work up to 100% without an=
y of the drop outs I experience on the default firmware. I've included an a=
lsa-info.sh report with this renamed firmware at [4].
>
> I took an acpidump at [5] and extracted the dsdt table at [6]. Please let=
 me know if there's any additional information I can provide from the devic=
e to further debug the sound issues with the default selected firmware.
>
> Thanks,
> Matt
>
> [1]: https://lore.kernel.org/linux-sound/87zf8jesp0.wl-tiwai@suse.de/
> [2]: https://lore.kernel.org/all/20251126141434.11110-1-baojun.xu@ti.com/
> [3]: https://alsa-project.org/db/?f=3D840337cab11f6aa70cf48b15d55ac45e402=
7ff41
> [4]: https://alsa-project.org/db/?f=3D6e482f72765d89520ea171f15641228bcad=
efcf0
> [5]: https://gist.githubusercontent.com/matte-schwartz/d7ff3c857b45cca197=
f3d3adc16df0bc/raw/2e3267b8d1a9d619ecd8157e4da426be756b6497/acpidump.txt
> [6]: https://gist.githubusercontent.com/matte-schwartz/4042dcd3779c3738af=
60536a9d4050d6/raw/5227717c6d40a2dc4012b95f7fefc6cd50ba784d/dsdt.dsl
>

Related to this I have a follow up patch that fixes the audio jack on
the Xbox Allies which regressed with the initial quirk applied. But it
did not seem to help here. I will send it soon-


Antheas


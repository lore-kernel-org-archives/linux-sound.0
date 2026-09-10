Received: from mail-107171.simplelogin.co (mail-107171.simplelogin.co [79.135.107.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3808334EEEE
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=79.135.107.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048281; cv=pass; b=p5fceDCMUQz9gpU8xYQvvJTTpk1j3orJ98dzDDi9rMH9+Qutme7BmzaY7via1IYITKhSCoBQDT/547gEr17/ZqhmHQ762fQ7eqk/rZEj2CCJgYuBHPG83r2FEQaorKU/QFhNIM0qk86l0/lzORxfTj0ENQKAbLakm+6LMi+fkZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048281; c=relaxed/simple;
	bh=mDjxfGWd/j76vxpHZSgxa4R8J/8Z1U7z5G+GJvcZ3tc=;
	h=Date:MIME-Version:Subject:In-Reply-To:Content-Type:From:To:Cc:
	 Message-ID:References; b=gGnPrV27hpH48ADObFB3rCCPJPHzPNIC1WyNyA8w9UAgU/AOZSJOQ+KDPF6OG8LKQaWYRzbf4tNWP82AHq3wNSx1QjHOTLj1AO1XGBgRIErBICszf+0+qzOSi5Xiz3e8SD/4MU8I7VDZ7Xk2/Ig8vxtWtL8+VVTl92fZsZryo1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me; spf=pass smtp.mailfrom=slmail.me; dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b=egG21gms; arc=pass smtp.client-ip=79.135.107.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slmail.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b="egG21gms"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1789048276;
	cv=none; b=KXsMGIwm5APEx0QDh+CKkEd7ckUOWfVRz9dS0j8xaex27nX1hwwN70zG+riyGeyr0ZnJY6vot7/Cl51T66h9WZ8JrB5W60LjbIzSJLSIw2R67BOOAcazfGRRFvMcYhVnySTYMogYL3kaMfuD72qYPmpnNs+clTSCdl2oVCmPAlX7m9UWo21Ig59k/ZfVni0OazppYxqsqdFdLRkdq1AuWN/UJTVP9eioIzaiw4B1R/ypNM2vXXjHtK3XPuTRB3P1N79hpiPnkRcuNjaPDT8hMVvNAW7QgxahUb/Y6mI76f0Ug3zkciBVmaHmBvO2iUq8xEj8pCP5++fw6GPrsc1vLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1789048276; c=relaxed/simple;
	bh=mDjxfGWd/j76vxpHZSgxa4R8J/8Z1U7z5G+GJvcZ3tc=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=z9LG5QXsz19x6NeYHCAScMecp9RxZ2KBxmS1wetbvji5xdiXIC0etz+8XgfVw/HUQHiToQE+OVtRSTB4BBdt/G38R3uT4NYe4cbhqq3LbXlF5Q0DqDIsskVhTG35Gplmp7V5JG3K4+JHESwucrhvvDt1uFIjqyzcLuTRLmWeU++/zaIEySiN3LqtKhmi3d/QwCaFaobQ3AWw9mBE+OEKmF15D6OPlwfesitCeZn8Oo+UMvAK08e9hZvO6ZW8YISOXSRF7rln2Y5+Vb3YUU90Ad8lJb/VCCkzxEpzI855u1sZFtl46rWQ01c76gkZzxkbqqnKszjtmxcQhK1rfaG/ZA==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=slmail.me; s=dkim;
	t=1789048276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/uWjHVcQ0yZIo8NoW/AuyUWQq515bA5VCw7UGi9dpBM=;
	b=egG21gmsnih4o+vIv2Qg7P6Nn4X4rW4D1rffNm+iJ/Qy9V96YLDagUpRafbbKtXPzCUxSr
	uXW9C/zmzhJJn1db+6x92yrwemJpiJvrXdPzwu+0lypaXd4FLkE7llBZTnXexr3UsTdB1G
	khA05okaQTZw9wbOhg7L/auneJFFDd0=
Date: Thu, 10 Sep 2026 14:51:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: snd-hdspm: add PCI ID 1d18:3fc6 for RME HDSPe AIO firmware 200
In-Reply-To: <87fqzsb043.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
From: AtmanActive <alsa.atmanactive.3dfqt@slmail.me>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Message-ID: <178904827476.7.2964197537734761535.1610750460@slmail.me>
References: <178674392532.7.10140952469564861620.1550442282@slmail.me>
 <87fqzsb043.wl-tiwai@suse.de>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1610750523
X-SimpleLogin-Want-Signing: yes

Hi Takashi,

I verified the equivalent of this patch on the original RME HDSPe AIO
(firmware Revision=3D200, PCI ID 1d18:3fc6, rev d4).

I could not rebuild a patched module right now (that card is
temporarily out of the machine), but I previously tested the same
pci_device_id match on Fedora with the stock snd-hdspm driver, like so:

 =C2=A0 =C2=A0 modprobe snd_hdspm
 =C2=A0 =C2=A0 echo '1d18 3fc6' > /sys/bus/pci/drivers/snd_hdspm/new_id

Result:
- lspci showed: Kernel driver in use: snd_hdspm
- /proc/asound/cards identified it as RME AIO
- hdspmixer meters responded to analog/digital input and playback
- alsamixer was able to control all card parameters correctly
- playback and capture worked at single speeds (44.1 kHz and 48 kHz)



Please add:

Tested-by: AtmanActive <alsa.atmanactive.3dfqt@slmail.me>

If you still want a rebuilt-module test, I can reinstall the card
and repeat it. I am not a kernel developer so will need to
dual boot and follow the instructions.

Thanks.

AtmanActive



On 02/09/2026 08:09, Takashi Iwai - tiwai(a)suse.de wrote:
> On Fri, 14 Aug 2026 23:45:17 +0200,
> AtmanActive wrote:
>> Hello,
>>
>> I have an original RME HDSPe AIO PCI express audio card (not an AIO Pro)=
.
>> RME's current Windows driver identifies it as:
>>
>>  =C2=A0=C2=A0=C2=A0 AIO, Revision=3D200
>>
>> After the RME DriverKit firmware update, the card enumerates as:
>>
>>  =C2=A0=C2=A0=C2=A0 08:00.0 Multimedia audio controller [0401]: RME Devi=
ce [1d18:3fc6]
>> (rev d4)
>>
>> The current snd-hdspm module only advertises the older alias:
>>
>>  =C2=A0=C2=A0=C2=A0 pci:v000010EEd00003FC6sv*sd*bc*sc*i*
>>
>> Consequently, no driver binds automatically.
>>
>> The PCI revision is d4, which matches HDSPM_AIO_REV (212/0xd4) in
>> sound/pci/rme9652/hdspm.c.
>>
>> I tested the stock snd-hdspm driver by adding the ID dynamically, with:
>>
>>  =C2=A0=C2=A0=C2=A0 modprobe snd_hdspm
>>  =C2=A0=C2=A0=C2=A0 echo '1d18 3fc6' > /sys/bus/pci/drivers/snd_hdspm/ne=
w_id
>>
>> Result: The card is working 100% correctly for single-speed clocks
>> (sample rates 44.1KHz and 48KHz).
>>
>>
>> Could PCI ID 1d18:3fc6 please be added to snd-hdspm for original HDSPe
>> AIO cards using RME's DriverKit-generation firmware?
>>
>> Please let me know if additional tests or diagnostics are required.
>>
>> Thanks.
>>
>> Regards,
>>
>> AtmanActive
> Could you verify whether the patch below works?
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> Subject: [PATCH] ALSA: hdspm: Add a new PCI device ID (1d18:3fc6) for RME=
 HDSPe AIO PCI express audio
>
> The RME HDSPe AIO PCI express audio card has a new PCI vendor ID (1d18)
> while keeping the same device ID (3fc6).  The card seems working fine by
> just adding the new ID.
>
> While we're at it, use the standard macro to cleann up the existing PCI
> ID entry, too.
>
> Reported-by: AtmanActive <alsa.atmanactive.3dfqt@slmail.me>
> Closes: https://lore.kernel.org/178674392532.7.10140952469564861620.15504=
42282@slmail.me
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/pci/rme9652/hdspm.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
> index d8bbedbc8ff6..95fd82bb1c6d 100644
> --- a/sound/pci/rme9652/hdspm.c
> +++ b/sound/pci/rme9652/hdspm.c
> @@ -1071,14 +1071,8 @@ struct hdspm {
>  =20
>  =20
>   static const struct pci_device_id snd_hdspm_ids[] =3D {
> -	{
> -	 .vendor =3D PCI_VENDOR_ID_XILINX,
> -	 .device =3D PCI_DEVICE_ID_XILINX_HAMMERFALL_DSP_MADI,
> -	 .subvendor =3D PCI_ANY_ID,
> -	 .subdevice =3D PCI_ANY_ID,
> -	 .class =3D 0,
> -	 .class_mask =3D 0,
> -	 .driver_data =3D 0},
> +	{ PCI_DEVICE(PCI_VENDOR_ID_XILINX, PCI_DEVICE_ID_XILINX_HAMMERFALL_DSP_=
MADI) },
> +	{ PCI_DEVICE(0x1d18, 0x3fc6) }, /* RME HDSPe AIO PCI express audio */
>   	{0,}
>   };
>  =20


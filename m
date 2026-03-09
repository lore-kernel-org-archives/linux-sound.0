Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB9B17A305
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065727; cv=pass; b=q1so/YH9D+uUIQJNUV4S9CoxiZjij2Sl0JuBvwAp6FTi2ha9EAhLjM28oYocI1CNN/XrGrLvBarLdDOOjkBX7YqE39B0K3VIGRRGfoxKhAhT8vXsvU/MwLO0gGrTpVkroa2P5bGmFf7SVIXRN1cjTcpRKFAVN3NJukq25/h7PvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065727; c=relaxed/simple;
	bh=JpvyowwjJqUMxxpMhS8Z6tBi+B8sFuq0zHv9nZ2G7So=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ka68BZR3tVZQFKkeHcAOSJ06zZsE++4N5GkD2CiHrsJvCzteKDtCKf9Brb3rMfx4w9m9bh33jWIQr+3h8QJrZFoPAczG6HqaG0LD8YJeuLk074jxUS5NGEGzypa26z4gvSs52VoYjujjSzr7jTB7C86xDkKSFkp8WN0HYbJh3xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCWW2zeI; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCWW2zeI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b7c2788dso5928264f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 07:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773065725; cv=none;
        d=google.com; s=arc-20240605;
        b=Qrds4oeJBt1Kcg3WqsQ9bOwD2pA6mQk+mfuRIL9GHsMHRzH7YV0e3MpPbj0nGiYuE4
         0n2+apuRyJNHScIcMP0vGyxdnBRWoyLPKlSubwvmgJL5CyPUaH6OTwc25hofdcyjsu/j
         hMh4UYTQTphwlHdKZ8INiBE4QQ7dNEJ6Edg58PkdHQSWmv0KVLKMXVtZ/ysjRQH23AMj
         7n8eojwzJ6jgoKIhTDsei6RzlyU1IQ4GBqkus1flEoPx5HVRLBl7qjupu7oHHKqbwU+C
         92uUUO2SqcC5gcDkOzH5IZqVCYECvxS3FuURBU8iDOCy5uiYXyu1lJisAEQdn55zC0A0
         SZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zBQ7yTeMlOSx8yDtU6I6Xf3dvPv7ggCCxqy4w957OOg=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=DdsupVJnhYnv25E7+FQNR6nO4C6FHT+8GyPOkLP2y1zSXtCdHTr54UmgnsqpjFRYz1
         5hsp6s5vBP1dAG7govCxBghxjBSR7MBqthmYJQG6P1+12aCMGEbJ9RPfqxCUHAM2lZUA
         /81ngRxeSyWoX9Pm2QZ+ceck5k4y0lF+rT0ShKn/68N3sXoa5FIHfIQE9cjcAOQwM5Hp
         FxPKgjviOtiL5wW2cr9T+WQL7CQijlxgNz4l5qRZS6WPsnxryUTbFF4WpxgEr4GKDvJc
         VwkB5ROmQ+9gVyvyWR6TKolAggCI6qCFHExv5trb9gILYI/9jpXL6lGUZI7iQviuT1xw
         FUvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773065725; x=1773670525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBQ7yTeMlOSx8yDtU6I6Xf3dvPv7ggCCxqy4w957OOg=;
        b=TCWW2zeIpqaF/EEI/g4WxXAipp8lz9ZlQjL6kjsHe8f0ENRXNoWL8tVcSsOzI8LzWs
         B3yDXDBuwxAMT8fK/S4GVrdYgmURvElMYYZGRsYErwfpPU1+dmLq1z9UmtNb5kTZ6W4f
         c+jutIk40EI14bl7NCjf3UAabAJ8BpfLlCePvrXOz8jrlW1KpHZ9Akc3Vj8TW8P8uRIq
         LO+ZAjYcmo7iLwWTNlDiR2vomoaYukVtjxihT4wkt3lIfTm+NG7Nh6NXmgE96uMGlKfJ
         6Yj0ZlixXeS/GWnRD5rKN+JH54yPb2IOdP7RLOE4bbvJnvsM171yrhv4kS+MvYx99cUY
         Dfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773065725; x=1773670525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zBQ7yTeMlOSx8yDtU6I6Xf3dvPv7ggCCxqy4w957OOg=;
        b=CzxbMaY4lmYsHnaO8bu03VrUZmzOIpP2/9m/1sAZ9ZXmYMrS/NfOfccF7DCFDVWoEI
         xC+hghqRZ9c+AwYf+SKZwUPGchFuVwy3/aJUucPWcbWW6uTttu2jd8PsuOq0vHyHnyMi
         rT1z9iFUmXKBvQbc838jI5NCataBByBoFw2/PJdRp3ZD9PqUkoQLU7ULNzXFdGGASap/
         jqbel6K9JDvZhAkr3Iiak0rhK4WZ047AW5WxESOEdKWck828gCIgA/n/1ZTMv3Y3aCfN
         2JMhI2C4WtCnb4anJGer/dqVD3VWQ2EiFLw9bmelVsM6RuaSg71Lr2YOeOis7yvPzSGe
         hIAA==
X-Gm-Message-State: AOJu0YzO8BhrRpkqgakIysdY87ToTEHFcmmVD2TWQJsdfJMvGaNugn4f
	9CIT1as2I6Z1MBBIE5bex9DAcSfTdWz0vAWePCXDxR80Y6gc2kHgopRMDnCbKDoE5KP1AntuTVG
	xAp85fOPrA+xe0Pln1B4n4JOFe+oTEHQ=
X-Gm-Gg: ATEYQzxduQTkB7jVnWVFKNeBs8et8nB6j/myKlmcOel88e+czHwgo6hDVLz/jBf66VN
	5KBgxOCkyXogpaKEzO6ZQlPx+SmXQEgnbjDFEbDSXrhiYCG1NnGhg/P/E9APUA+g0o9qZ5kiObv
	4ImwrXQkxPmaJPH8N8NNLe/bTfUap4an/2qz0xMmqo4jLuDTon8rVMFEfZPLl9Sah+BSyIzLc0g
	xjcNor6QWQ7tPRBF8ianaE4XTOv3R5AhQ/SRiSh/ie9t5G3NEfrx5/f24wknlDRg5UI6JS1nTiZ
	DBLyWo4K4wwVVJbq7jcqMyR8nT/18VdNNKbCKr8=
X-Received: by 2002:a05:6000:2003:b0:439:c6d0:b0d5 with SMTP id
 ffacd0b85a97d-439da3514bdmr20480891f8f.15.1773065724334; Mon, 09 Mar 2026
 07:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
 <87qzq2kxrc.wl-tiwai@suse.de> <CAOKSTBtpqPEnihFhopocV_RC8VR_RribXctUayEkUCav3omr3g@mail.gmail.com>
 <87ldgakvsc.wl-tiwai@suse.de> <CAOKSTBvbopXOuOfstmasijZgUnT9_qW_dsaeMcHUXhyjj3iRmw@mail.gmail.com>
 <CAOKSTBsWiwwwrmBt3dshrYYo3fQN9eF-gi2Z7BoX6c-Nb3ZoHg@mail.gmail.com>
 <CAOKSTBvND=d4Fq7mt=36p2Y+hKr6aDUbJ6zA4wDOWASwcWjmNQ@mail.gmail.com>
 <87h5qxl8tj.wl-tiwai@suse.de> <CAOKSTBtQi6ZmLmy6u5mP9_gLKZTZHmbb9S36hO99xSsk_EEbcA@mail.gmail.com>
 <87ecm1jii6.wl-tiwai@suse.de> <CAOKSTBtdt=enKSv4ZF7VxDD4QF8+ntyFM5CPJ1Y1QQ7M6TsiKg@mail.gmail.com>
 <CAOKSTBuOV0=1Y62sqf3QALgR+_He=tKLPQ7LZN+xFC6oGWEKVw@mail.gmail.com>
 <87y0k6whm8.wl-tiwai@suse.de> <CAOKSTBuUnS=stepHySGVYH4GbQytEQL45cLj4eV8u0KAsquF5w@mail.gmail.com>
 <87jyvlm6w0.wl-tiwai@suse.de>
In-Reply-To: <87jyvlm6w0.wl-tiwai@suse.de>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Mon, 9 Mar 2026 11:14:47 -0300
X-Gm-Features: AaiRm50D9tUfOuow5ayf8MWwSor_mII0i0NwUFkIPfLoLJvEJSdm1pLSkTNcBHI
Message-ID: <CAOKSTBv102MCFnnm9JPp9Zaz_MQNBxu5OnWOCGw29MN7xLbXHA@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>> At best, please try git bisect.
Sorry! I am complete without any acknowledgment on how to proceed in this.

>> Or if it can't work for you, ask your distro people who can help.
I have tried 3 different distros! I don't think this is some distro
related problem.

>> And, I'm afraid that it's not the sound subsystem but the DRM graphics
>> driver that actually broke.  In that case, you're reporting to a wrong
>> list, and further ping wouldn't help.
>> (And for figuring it out, you'd need the bisection, so going back to
>> square...)

Hum... In that case, I will address the right list.

Thanks
---


Gilberto Nunes Ferreira

Em seg., 9 de mar. de 2026 =C3=A0s 11:09, Takashi Iwai <tiwai@suse.de> escr=
eveu:
>
> On Mon, 09 Mar 2026 15:02:17 +0100,
> Gilberto Ferreira wrote:
> >
> > Linux kernel 7 RC3 is out and still no HDMI sound.
> >
>
> At best, please try git bisect.  Or if it can't work for you, ask your
> distro people who can help.
>
> And, I'm afraid that it's not the sound subsystem but the DRM graphics
> driver that actually broke.  In that case, you're reporting to a wrong
> list, and further ping wouldn't help.
> (And for figuring it out, you'd need the bisection, so going back to
> square...)
>
>
> thanks,
>
> Takashi
>
> > ---
> >
> > Gilberto Nunes Ferreira
> >
> >
> >
> >
> >
> > ---
> >
> >
> > Gilberto Nunes Ferreira
> > +55 (47) 99676-7530 - Whatsapp / Telegram
> >
> >
> >
> >
> >
> >
> > Em qui., 5 de mar. de 2026 =C3=A0s 10:06, Takashi Iwai <tiwai@suse.de> =
escreveu:
> > >
> > > On Thu, 05 Mar 2026 13:54:45 +0100,
> > > Gilberto Ferreira wrote:
> > > >
> > > > Hi there...
> > > >
> > > > I just installed ArchLinux, because I thought that perhaps
> > > > Ubuntu/Debian was the culprit.
> > > > So, I went ahead and installed linux-mainline from AUR.
> > > > But I get this same result.
> > >
> > > Then please try to git bisect.  That's likely the most straightforwar=
d
> > > way to figure out the culprit.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > > >
> > > >
> > > > ---
> > > >
> > > >
> > > > Gilberto Nunes Ferreira
> > > > +55 (47) 99676-7530 - Whatsapp / Telegram
> > > >
> > > >
> > > >
> > > >
> > > > ---
> > > >
> > > >
> > > > Gilberto Nunes Ferreira
> > > > +55 (47) 99676-7530 - Whatsapp / Telegram
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > Em ter., 3 de mar. de 2026 =C3=A0s 09:17, Gilberto Ferreira
> > > > <gilberto.nunes32@gmail.com> escreveu:
> > > > >
> > > > > Well... I really don't know what happened.
> > > > > Probably my fault, as usual.
> > > > > I do this:
> > > > > git clone https://github.com/torvalds/linux.git
> > > > > cd linux
> > > > > git checkout cb9b6f9d2be6bda1b0117b147df40f982ce06888
> > > > > make mrproper
> > > > > cp /boot/config-$(uname -r) .config
> > > > > fakeroot make -j$(nproc) deb-pkg
> > > > >
> > > > > But after that, the result was
> > > > > linux-image-6.19.0-rc1+_6.19.0~rc1-00011-gcb9b6f9d2be6-1_amd64.de=
b!
> > > > > I don't get it.
> > > > >
> > > > > git log shows me this:
> > > > >
> > > > > commit cb9b6f9d2be6bda1b0117b147df40f982ce06888 (HEAD)
> > > > > Author: Vivian Wang <wangruikang@iscas.ac.cn>
> > > > > Date:   Thu Jan 29 09:56:09 2026 +0800
> > > > >
> > > > >    ALSA: hda/intel: Make MSI address limit based on the device DM=
A limit
> > > > >
> > > > > So, basically, I give up!
> > > > > When this issue gets fixed, I will try kernel 7.0 again.
> > > > >
> > > > > Sorry to bother.
> > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > ---
> > > > >
> > > > >
> > > > > Gilberto Nunes Ferreira
> > > > > +55 (47) 99676-7530 - Whatsapp / Telegram
> > > > >
> > > > >
> > > > > Em ter., 3 de mar. de 2026 =C3=A0s 07:48, Takashi Iwai <tiwai@sus=
e.de> escreveu:
> > > > > >
> > > > > > On Tue, 03 Mar 2026 11:27:24 +0100,
> > > > > > Gilberto Ferreira wrote:
> > > > > > >
> > > > > > > Sorry... I am not an expert on this stuff.
> > > > > > > I just like to compile the kernel...
> > > > > > >
> > > > > > > >> You need to *compare* between two kernel logs.  You can st=
rip the time
> > > > > > > >> prefix, and check which lines appear and which disappear i=
n the new
> > > > > > > >> kernel log.
> > > > > > > How can I do that?
> > > > > > > Via journalctl -xe -p3? journalctl -r -b?
> > > > > >
> > > > > > You can run "dmesg > dmesg.log" on the running kernel.  And you=
 can
> > > > > > get two outputs.  You can strip the time prefix from there by s=
ome
> > > > > > script for easier comparison.
> > > > > >
> > > > > > > >> And, have you tested the revert?
> > > > > > > I don't know how to do that.
> > > > > > >
> > > > > > > If you can point me to some doc, it would be nice.
> > > > > >
> > > > > > Have you ever built a kernel by yourself?  If yes, it should be=
 just a
> > > > > > git revert of the suggested commit and rebuild / retest.
> > > > > > If not, which (distro) kernel are you using?  Usually you can a=
sk
> > > > > > distro people to build a test kernel.
> > > > > >
> > > > > > In general, please be more specific about your system and
> > > > > > configuration.
> > > > > >
> > > > > >
> > > > > > Takashi

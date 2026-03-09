Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A302472A5
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 14:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065776; cv=pass; b=SY64OFCxu7LUxjV+sxwHYAp56WLLDuFAFdIoGycielmHSws5A2SIwZt9t0UxQ8h8otQxmOzm9fhMYE2kROSdvfzxjseqlKI/QmVQWQpmdFsRsEJnasg/ZckNS37DYbJQTuXBYXH/9+qP9E5NCv5nvmJ+Xz5NixVBRA1s4eHF+kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065776; c=relaxed/simple;
	bh=kXwbzJQvDK+yRgw1Q9IjAWmBxViva6B0HDlmTgDDm4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzeUbOaEyqbo0CHcGuZtfq/Ffon9zUzz3mUOQt1kBhMnEM5E8NnR4L35Z0QDNSBc/2sFHAHbyek5pTTSDzzyTfJm0flfYUrWQcYU/iYm6gg3SsF3ev+hcbRhvg8NVlk9QNMCojCEhoq7/uaME4PfqG7SC6evuWUnGcVYcxRsO/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqgcQCCP; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqgcQCCP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso3881332f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 07:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773065774; cv=none;
        d=google.com; s=arc-20240605;
        b=Z+tjjO8YAxD+n2OR3v+jbATHX+vznwtLlbTgXrt+7WFJys6hXQofMKFVmFhAQmlkFG
         ZQS19d44MHeMAD4IoEIq+Oq9op6oZ/omeA0CAHnn1RDJM7OuJb0j4PvjSj+G9u8dippD
         m8JnHCH8c9ePWuOISan/ZVclw/gTKFOJ8tJhDHMhA4OelJ2kZhkLDA0GI/1pE7lCeeI4
         utqGGhgT3Nq+8zlN5lbZ8VtcVeRi3u39IKjauEf+NeVZsjXg1fBgz3Y+ff05nQ3Cu480
         mhoWTEiV6R7PamtERS61D1gOPiGRfVQvVaNqFFv4Vz4eeemAIlp76rt6tXCQ8mNyocBA
         BoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ok2TtDbmYb9qI+YISYHKpzZZuebQBUTi31kGKrddoeM=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=BDyl9ybPDog4CuAfKV74qVuv8Fvur4STclzg4rRJvBJDInbEBr6Cv2Yv82QnrIP4Uc
         2IlUI9i6Dpx2K4nLRtml5++CWdUlZKJxBgdCCcfNCvvjBJbttimBZYVKNoB3WMzAGdxd
         EierIC3l39PGMx+mEdeFd5A8LCBivdOFybsyp6xTTHuI2Q9fhZngHOXsKfuSakigjCXQ
         oFIPlE32CWjbkXVvKhg3wsrmlAFTCpTovxNMjlTX/9f+zLlWRN9SB3wyickmdXM4SPan
         VDw+DAsNPmCvLpVtVvvbrueOiTsqkWXiJlsKRKPqYGFH4E0dErDuO4w6DBbDXlKMJkvt
         8JIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773065774; x=1773670574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok2TtDbmYb9qI+YISYHKpzZZuebQBUTi31kGKrddoeM=;
        b=hqgcQCCPYb86PH3nuJrWybeXeqF9MgSqzEb177lvjlF9l4NrBLg9Xhg7sCgcNtNUS0
         hXD9XczyiKNfTHvQ0Uhlvi+u5VukXFN2p5hwuRlHE2tPy5YhyBXlW0Nby0aDOvoUZ3R9
         QnuGyrujdBgVnMLvAXSizKM2ikk1BAIPnrXotFxYEXikVpDziHCXqjXMQOihzeHDzBSH
         /F93YS+vwdPtKXuwfKnVEJaiU2buL4k9yfSCQcw44TVc/8vrovs56eYPyq6wY+tdHUPm
         oRju8zMzyn8CCgZ4HeNMDlrjVxEX/5mVmrl/gsUwOezOIImL/076XFzgFAkl65G52XMV
         /GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773065774; x=1773670574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ok2TtDbmYb9qI+YISYHKpzZZuebQBUTi31kGKrddoeM=;
        b=XlSyFhMrTVcKX+k6R//ffv4pUbJ2mpvwGBANUUyRmxBeqhyXviJGJQXq6yH+0MBuI7
         7C/Nc8USEXuf07e3/2w9Of0K448G0F1xUtt+B15KLG7/+WoY8+Ccrwj0dqY8m6GKM0zs
         yV7/OEmNv2xo0d0Mw6tyUnAd6BXBRLu2ykh6s+iYhFC4vFNei37eWyWwOcbBXSodf4e1
         cB3j1YDClBdwZjwSuhYygXfXDu94srJtlYf3/KW6I+kGzG9HKmQ7RvFAJn/LwgOWKa5G
         NlyVMTdFt/s59k9h+8NrsaoDMBwyyTL+X/F41ySieBqMPvleltIFT5f79MYl0/b8iywL
         Fg8g==
X-Gm-Message-State: AOJu0Ywc3r1N0tcaz+FO5qYT8L3xfejqHXknqj1zWazuDwjmUQBUyO9G
	s9MTdzqA6SZ2E4CBkUnFkydm2P3CtebPMdejXQPdv10iSt1TnT+qCicP+5BJfYGgN6vSrRmY6DK
	vOjHlVfTystd/FXGMQ5i4ymhRX1W+lCI=
X-Gm-Gg: ATEYQzyhw41Xk0wflAarIh85Sjqc2plCQxbKGjBdHkWDiV3zdVncc2l4aB8XYsx7Ary
	cvh7A7A3EIzn1zpPUW2NEezoYsvu8kNoESRpb9cu8uI47uFOTdxaIT+8xHbE+Mf5hIa3WgDHgTO
	A49LFmv6vM8xLH6/Te6yfVrwf5lq/hUOZL7K2OlaCGbfF0RLLlYjAKxFbRIl5UiRJcJOAVewFLS
	cgMPcM8T8ApwLNMPYEgOd8RFBjaf/0hS/r4fIORwVvNi+aa9Vy2+JuroVkLs1x0zNklSYtkh6yo
	17MZDmAelWlf0LS65/Z0TRGf9pWQoI8PlKyCvUs=
X-Received: by 2002:a05:6000:310c:b0:439:b636:1fa4 with SMTP id
 ffacd0b85a97d-439da8951damr19638823f8f.48.1773065773579; Mon, 09 Mar 2026
 07:16:13 -0700 (PDT)
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
 <87jyvlm6w0.wl-tiwai@suse.de> <CAOKSTBv102MCFnnm9JPp9Zaz_MQNBxu5OnWOCGw29MN7xLbXHA@mail.gmail.com>
In-Reply-To: <CAOKSTBv102MCFnnm9JPp9Zaz_MQNBxu5OnWOCGw29MN7xLbXHA@mail.gmail.com>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Mon, 9 Mar 2026 11:15:36 -0300
X-Gm-Features: AaiRm53E9m9DZ23zbHRlnLNUcr2BMKZ6odxmUkgvKvWhjiufCiSdjJdiGjU-0ys
Message-ID: <CAOKSTBu5cQSaGyLza6HWV6F21HZnxY0nTP3sNXbUoq9srxj++g@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry... Not acknowledgment but "knowledge"


---


Gilberto Nunes Ferreira




---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram






Em seg., 9 de mar. de 2026 =C3=A0s 11:14, Gilberto Ferreira
<gilberto.nunes32@gmail.com> escreveu:
>
> >> At best, please try git bisect.
> Sorry! I am complete without any acknowledgment on how to proceed in this=
.
>
> >> Or if it can't work for you, ask your distro people who can help.
> I have tried 3 different distros! I don't think this is some distro
> related problem.
>
> >> And, I'm afraid that it's not the sound subsystem but the DRM graphics
> >> driver that actually broke.  In that case, you're reporting to a wrong
> >> list, and further ping wouldn't help.
> >> (And for figuring it out, you'd need the bisection, so going back to
> >> square...)
>
> Hum... In that case, I will address the right list.
>
> Thanks
> ---
>
>
> Gilberto Nunes Ferreira
>
> Em seg., 9 de mar. de 2026 =C3=A0s 11:09, Takashi Iwai <tiwai@suse.de> es=
creveu:
> >
> > On Mon, 09 Mar 2026 15:02:17 +0100,
> > Gilberto Ferreira wrote:
> > >
> > > Linux kernel 7 RC3 is out and still no HDMI sound.
> > >
> >
> > At best, please try git bisect.  Or if it can't work for you, ask your
> > distro people who can help.
> >
> > And, I'm afraid that it's not the sound subsystem but the DRM graphics
> > driver that actually broke.  In that case, you're reporting to a wrong
> > list, and further ping wouldn't help.
> > (And for figuring it out, you'd need the bisection, so going back to
> > square...)
> >
> >
> > thanks,
> >
> > Takashi
> >
> > > ---
> > >
> > > Gilberto Nunes Ferreira
> > >
> > >
> > >
> > >
> > >
> > > ---
> > >
> > >
> > > Gilberto Nunes Ferreira
> > > +55 (47) 99676-7530 - Whatsapp / Telegram
> > >
> > >
> > >
> > >
> > >
> > >
> > > Em qui., 5 de mar. de 2026 =C3=A0s 10:06, Takashi Iwai <tiwai@suse.de=
> escreveu:
> > > >
> > > > On Thu, 05 Mar 2026 13:54:45 +0100,
> > > > Gilberto Ferreira wrote:
> > > > >
> > > > > Hi there...
> > > > >
> > > > > I just installed ArchLinux, because I thought that perhaps
> > > > > Ubuntu/Debian was the culprit.
> > > > > So, I went ahead and installed linux-mainline from AUR.
> > > > > But I get this same result.
> > > >
> > > > Then please try to git bisect.  That's likely the most straightforw=
ard
> > > > way to figure out the culprit.
> > > >
> > > >
> > > > thanks,
> > > >
> > > > Takashi
> > > >
> > > > >
> > > > >
> > > > > ---
> > > > >
> > > > >
> > > > > Gilberto Nunes Ferreira
> > > > > +55 (47) 99676-7530 - Whatsapp / Telegram
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
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > Em ter., 3 de mar. de 2026 =C3=A0s 09:17, Gilberto Ferreira
> > > > > <gilberto.nunes32@gmail.com> escreveu:
> > > > > >
> > > > > > Well... I really don't know what happened.
> > > > > > Probably my fault, as usual.
> > > > > > I do this:
> > > > > > git clone https://github.com/torvalds/linux.git
> > > > > > cd linux
> > > > > > git checkout cb9b6f9d2be6bda1b0117b147df40f982ce06888
> > > > > > make mrproper
> > > > > > cp /boot/config-$(uname -r) .config
> > > > > > fakeroot make -j$(nproc) deb-pkg
> > > > > >
> > > > > > But after that, the result was
> > > > > > linux-image-6.19.0-rc1+_6.19.0~rc1-00011-gcb9b6f9d2be6-1_amd64.=
deb!
> > > > > > I don't get it.
> > > > > >
> > > > > > git log shows me this:
> > > > > >
> > > > > > commit cb9b6f9d2be6bda1b0117b147df40f982ce06888 (HEAD)
> > > > > > Author: Vivian Wang <wangruikang@iscas.ac.cn>
> > > > > > Date:   Thu Jan 29 09:56:09 2026 +0800
> > > > > >
> > > > > >    ALSA: hda/intel: Make MSI address limit based on the device =
DMA limit
> > > > > >
> > > > > > So, basically, I give up!
> > > > > > When this issue gets fixed, I will try kernel 7.0 again.
> > > > > >
> > > > > > Sorry to bother.
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > ---
> > > > > >
> > > > > >
> > > > > > Gilberto Nunes Ferreira
> > > > > > +55 (47) 99676-7530 - Whatsapp / Telegram
> > > > > >
> > > > > >
> > > > > > Em ter., 3 de mar. de 2026 =C3=A0s 07:48, Takashi Iwai <tiwai@s=
use.de> escreveu:
> > > > > > >
> > > > > > > On Tue, 03 Mar 2026 11:27:24 +0100,
> > > > > > > Gilberto Ferreira wrote:
> > > > > > > >
> > > > > > > > Sorry... I am not an expert on this stuff.
> > > > > > > > I just like to compile the kernel...
> > > > > > > >
> > > > > > > > >> You need to *compare* between two kernel logs.  You can =
strip the time
> > > > > > > > >> prefix, and check which lines appear and which disappear=
 in the new
> > > > > > > > >> kernel log.
> > > > > > > > How can I do that?
> > > > > > > > Via journalctl -xe -p3? journalctl -r -b?
> > > > > > >
> > > > > > > You can run "dmesg > dmesg.log" on the running kernel.  And y=
ou can
> > > > > > > get two outputs.  You can strip the time prefix from there by=
 some
> > > > > > > script for easier comparison.
> > > > > > >
> > > > > > > > >> And, have you tested the revert?
> > > > > > > > I don't know how to do that.
> > > > > > > >
> > > > > > > > If you can point me to some doc, it would be nice.
> > > > > > >
> > > > > > > Have you ever built a kernel by yourself?  If yes, it should =
be just a
> > > > > > > git revert of the suggested commit and rebuild / retest.
> > > > > > > If not, which (distro) kernel are you using?  Usually you can=
 ask
> > > > > > > distro people to build a test kernel.
> > > > > > >
> > > > > > > In general, please be more specific about your system and
> > > > > > > configuration.
> > > > > > >
> > > > > > >
> > > > > > > Takashi

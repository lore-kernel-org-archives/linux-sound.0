Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075053090C5
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772533684; cv=pass; b=mSYqgKK7y6XGo8GIxtiRmgaXSUf1tnnQ9wyUT2+m/bKSk33F/XfpbvZK/EwizP+0j/gtPiQcTumAbZd0hi35YA2yA6iJqwokm9HgLF/7mH36P1EQLF231mHRTlZ9HsnkhjLIm2JRuDm/kdaQQ1lvDpnaf/3By+V4GuVayzVrxT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772533684; c=relaxed/simple;
	bh=F8fSIlrbGpTwPSs4tePme8eV1lOBC1TWFiHUqgyg4V0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YL17Giubrs9VTh+kqdcuOZfEtlz/jGtZFWzoXU1UK6NidS0VQgCClutflWQjwzYQAFPRcKwgi+3nMvSLO8J4RPeNCWKEoXO236tAUOpdUOoYe9ydEs7+fuy2xuEQ8XypJEugjMb/Hqv39+YdCFYfgizuaC5qN1Vxx9YVj4S230E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyQ2LE/5; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyQ2LE/5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so1611017f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Mar 2026 02:28:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772533681; cv=none;
        d=google.com; s=arc-20240605;
        b=I2cjS9gBDhlOYGbfnrR16QsHQ1Y3cTGYt5IoQMr3DztXweMk5fzQCz06/e+GTb88ra
         k7p85c7lFqPUJLeMC792e/VkV073Py4iNJpuC75iPb5iqmtRaBrkp4TIrQmaIohLKsDX
         ApRJC2+L42yoHtT8MTgSC8xGmRFecUF8qYku1zp0TK5nECBtyhmmPwcaDQgKLXb3tcZ3
         AcVz5bOYC5O/5mlr3UCNUjLUyEOBV9hpDNG3xKquiSGczc6Yf4hBfWllKK+YM+k4l0YR
         qTGlqUfUaa95c+bw8OzN6jPu73fQT+wljhDEy8u8T7rc4TjtEfdtZSECu1GngjeQJ2/F
         7/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nh1F71xhn/gfVzHSfHqSRk3VvkCsPoO2b7Ux7gLiqhc=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=YOE9EEioqy+B567Ll6eEeITp0qU7LU6H4lLic3nm+kaFkAw8n5ExpK0jZ/aWe4d3FW
         yfqZ175nqRCaegZ3AGtOzBTASBNhY2YMybm6pUWRxF8mPGEKLM0gRvIvlSfrRemlbdlt
         Bt5UNOlkUfIHH/6FSgWjGgr+yaoSc9GQUYRCJ4kDhoIXOBGJGHXHz6Q8vmavVLt5h6O1
         gyl2KCR7PHKjpyiohb6z1onoc4uNiydSdjThOW3MaA3gWnZ6nr4ZludHxu/Vr0mpGBfE
         8nWuz8lVHFN5Dvvr2rPV1rMd+SrOtXGjwNUJBBlMbG+iSMrZxhOm74e+rQfKCrMMHmDy
         5xyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772533681; x=1773138481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nh1F71xhn/gfVzHSfHqSRk3VvkCsPoO2b7Ux7gLiqhc=;
        b=JyQ2LE/5I61XlWgv2wwL2miRzeomc0AXef1FinJITKUUZSR/AU/3z1U+ygdtFFnfpQ
         B7pdv9Z943YuG/RBAeWFHaBWkNGibpAPKVyvGay0wM9rYZ+ufl0K8qa2qPMfKX93tgZt
         1zGVh7fBFaHmUf/OwyRWhXQuxOWlgcHHNYEDREOSCd0FThvE5AyVxhBAXxTDp90zJygU
         8U9NRkIAlv/9Cty6L5FpkYKagw8d3vm3qQgvekWdkXTW3jBTLO2Jtb1+ibTF0RzOpMkm
         nEdj4+Gb6gATT3sPEKO7Uk0cWMAi6gMFmgQ+lY0hhQWSI5isOQBWI2IdlUEO+TSXOV2R
         7yAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772533681; x=1773138481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nh1F71xhn/gfVzHSfHqSRk3VvkCsPoO2b7Ux7gLiqhc=;
        b=i1N+0dPAupFllvKRirXpbE04tNLpDFf45guUczktjLr5f8IPaXqzCfxaIJ4BEvhrP5
         DJESsKjEZqwgaA+6X/mxQDutF8iER3u7V/rlFwLK3MEKj+HGYbWbfl9Prl/CFqBS78R9
         iZa0X9jBN0MyXtsA5UdOEO7EgfzZEn6kEE9gpfdCFnsLggc8tDwhpcG77R5cf4G05EvI
         pou1qAV125JtDIqmCx/YXLulEOY1oAvqI50maGqDrZLbkz83IFz9/LxrwsQ6b9pesK0H
         DiTl4oYzOzDF0qvYNGiOAGzxQS13BP2V6s3YOWhuDlzjHdC+uv7v+abXLGbuu7ExUz4I
         O4bg==
X-Gm-Message-State: AOJu0YwXhE3D9OOWdaosoNLk3xbUGfpHWUNpzPJJOL16hJw1e/FkGU3t
	n0sjwPPlL93t0mDTGJRQRP3iwx4hFEIoU7jPeLgiZiQ75juJKVquhi3TeurR3jMGJBMQhAX+8R9
	Pz5RrXw5YTIfIUJD6zZ7LidHe74lrzBHFek8DiS3kBK/X
X-Gm-Gg: ATEYQzwp5Ftb86A8PErfzz7AG+zy0eUz+xjmiBesEJadiNH53tFnsCQnPNuzfs1fyoU
	WugYsSFAWKQXk89yUUzCqbgyGWdEt4v+wGI6Wcllvnq1fneHLUD1pMVIl3wWjRZTNpbSTs1vijS
	rMiCnsbOdGgtc/fadmC1UUnUdc2YnvyOGUQR5iSzQ+oC5L49r4th8362z9HVZiK64BtU3I7mKB2
	O0h2fSHoLpyN23p0Ka/OcIJ2gC3/QguZIMEVPTEos//7xPSTGxmBS3VocBZKOUfJBzAdSaFI1Go
	hzcx0rBydVMiVFhMrsNndsI3G6dvAxIFJ0+g8VZIZrXfrLiBzbk=
X-Received: by 2002:a05:6000:1885:b0:439:befa:91cb with SMTP id
 ffacd0b85a97d-439befa9385mr4770374f8f.45.1772533681076; Tue, 03 Mar 2026
 02:28:01 -0800 (PST)
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
 <CAOKSTBvND=d4Fq7mt=36p2Y+hKr6aDUbJ6zA4wDOWASwcWjmNQ@mail.gmail.com> <87h5qxl8tj.wl-tiwai@suse.de>
In-Reply-To: <87h5qxl8tj.wl-tiwai@suse.de>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Tue, 3 Mar 2026 07:27:24 -0300
X-Gm-Features: AaiRm502kHO8E7uFNNK04bE3uCKnOOlo0ClEP2NngdUZGdgp2ulHY3739Te9bV8
Message-ID: <CAOKSTBtQi6ZmLmy6u5mP9_gLKZTZHmbb9S36hO99xSsk_EEbcA@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry... I am not an expert on this stuff.
I just like to compile the kernel...

>> You need to *compare* between two kernel logs.  You can strip the time
>> prefix, and check which lines appear and which disappear in the new
>> kernel log.
How can I do that?
Via journalctl -xe -p3? journalctl -r -b?

>> And, have you tested the revert?
I don't know how to do that.

If you can point me to some doc, it would be nice.

Thanks

---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram

---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram






Em ter., 3 de mar. de 2026 =C3=A0s 03:35, Takashi Iwai <tiwai@suse.de> escr=
eveu:
>
> On Mon, 02 Mar 2026 19:28:48 +0100,
> Gilberto Ferreira wrote:
> >
> > I don't know this can help in some way, but I got this ops
> >
> > dmesg | grep hda
> > [seg mar  2 15:26:10 2026] snd_hda_intel 0000:04:00.1: enabling device
> > (0000 -> 0002)
> > [seg mar  2 15:26:10 2026] snd_hda_intel 0000:04:00.1: Handle
> > vga_switcheroo audio client
> > [seg mar  2 15:26:10 2026] snd_hda_intel 0000:04:00.6: enabling device
> > (0000 -> 0002)
> > [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
> > CX11970: BIOS auto-probing.
> > [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
> > autoconfig for CX11970: line_outs=3D1 (0x17/0x0/0x0/0x0/0x0)
> > type:speaker
> > [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
> > speaker_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
> > [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
> > hp_outs=3D1 (0x16/0x0/0x0/0x0/0x0)
> > [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
> > mono: mono_out=3D0x0
> > [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:    input=
s:
> > [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:      Mic=
=3D0x19
> > [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
> > Internal Mic=3D0x1a
> > [seg mar  2 15:26:12 2026] snd_hda_intel 0000:04:00.1: bound
> > 0000:04:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> >
> >
> > I really don't know what that means...
>
> You need to *compare* between two kernel logs.  You can strip the time
> prefix, and check which lines appear and which disappear in the new
> kernel log.
>
> FWIW, the above is the normal information from HD-audio at parsing the
> BIOS info and at binding the interface.
>
> And, have you tested the revert?
>
>
> Takashi

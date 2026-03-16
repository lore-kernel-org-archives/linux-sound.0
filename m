Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB33243376
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 01:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773624609; cv=pass; b=ZFmRD1TQisnCJgKuzo51B66KMkK+jbwEjSPItmX8gl7aV2K4cjDXvvqLrtSTFI+dT05gHuKAdf9XX8iA4oLozcLd5N5uveYnyf2xsP3HU2JZf4tj8QRhpgCHFyKc282fFSzmiA4KCbHG5S0EYcH7SKbjwi8U7OMcj43t3G7ifY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773624609; c=relaxed/simple;
	bh=+pv0u3nookkdCLSxn7NnexhxP2hxHvlcHUU21Q0AV8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iR4jSF/BDfSHpsp9R+WPUQa/wCpo8iHlcQ1PLkw5EvocB5AuNFLlrgFm3fxo0abZr2aO8tHtET8aVv7sC165U3P8kVNhr//RgTzsqOeW2wp4T4vVxHLm6yfnf+EtdeQS47tOc5p05XkJg1Fj3lFQIEqSFV/QJzDbqCurISSkGRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRdlKVeK; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRdlKVeK"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b3cfc38edso1293042f8f.3
        for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 18:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773624607; cv=none;
        d=google.com; s=arc-20240605;
        b=gV61UM3U/IqD4Z9U/9lHg92MgYUfcJDn6fil0/mryzTEdeiUaVnxZq/3wIkBU4tIyr
         vFiZwu0Klt2CiTmlO/Jsgrti94bCUOE9dOPgcqynSWqhcZ9UdintAZlJQvrGBVmiNruS
         DUysggtO0IyLe2bnxNDZ88trTmOb61hasO45eApNh+kX3iLeqOx2y/dCuNLSA1WSPz6e
         jLSi2x9m88d+5kVwicOwiRcQksIsFR9bDY9sgVmQcEeQGzUZxz3cjVmaYNN4M5n0yCVu
         D/UN3O9touyQju50SUZlxfqOhI0uV1HotvJ642cKtwvO6jZQdXcKBtX4Xj9dKIHunP5T
         qbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RxvFtiJdeYABAFuLQ63HjhfZJQouwlO0TMFKV+DLaJg=;
        fh=ojQC6Dyv/yFpl3J/ouotalrHAAaS/OJWM1rJKyLBvHM=;
        b=dT6W17rWfVEmhRyyzuj4zbWp2N34AYde9RuOVzhUrJV8BBk1R7pDDJjlXB+J9ZJWhy
         YXFSdGOup89DRl1QnCNSk1hLMc+ceAWLXMM3whS3/DfJBUMaoesKBlP2e9NhDf6xsdWI
         TR8T0eQxMvBNZswV/tEGFN3rsy4xwjsx19uJhk8B2KdQhjS4a/cpS8edLW9sRgnx6wyA
         mV5JKuNjSXxHDlG7M1k6IwEU3ZqaEUChbHpmbEnZ2Ltog5C7ffBfQeJcbOcRUFCEXt4K
         kIenrL9Z7f/PgL+N7tr2IG6n17Lnl5akZDCprXZPi2t24qIEf6USMxzwvxuzT/4yPxVw
         TcUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773624607; x=1774229407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxvFtiJdeYABAFuLQ63HjhfZJQouwlO0TMFKV+DLaJg=;
        b=BRdlKVeKxC+ytt2fLyuccDW67/IAsA8dT18ssKzKh4ioM1ya1cpgnHWxZbUp1/C6s3
         M4UW8ZIdt4D6MFWjJ2TfkCeB3ZJSoDFON/d+Yd7iGf5/G0XJBgzgle4uHwAIjr9YrHF+
         rn3C0e9PT35+YfsLG8afUmFZDTOurcN4ugire70bSGRc0KsIE+k8h4fOz2sRAc/BxXgu
         X6ZRdaLyhhm1BTzxQRgynQnqgxPhYD6X52fzaJcvn83stvKclyGmWpa3nE2PA0yqjPbo
         gR9SLf4NXMcqd5n5i0aD4rORBVBa7mg5ZLLzk/35rKDRh0gdNClMovcfwU77lG9+oOcd
         NGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773624607; x=1774229407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RxvFtiJdeYABAFuLQ63HjhfZJQouwlO0TMFKV+DLaJg=;
        b=jmDwJ0naC/R0YIYL7+1IAqDgeIYzztX0knTzPh68CZcfjawKiZwj3SLfghHVR90mVB
         KREf5WAjpUPxXHPgNrPwQVSvtwOtQc2USR3wdljXlyNkuYr+M18hKyu3QWAGrhS1QmjV
         w7xSGYWRwtQ7iKv2m9MI+vSIl7Z2fsE4gGmBs7hardfIee3fu0lk9D7gIYyLQ68iwE28
         S21UYftZ8CJRAT/GMkFd+7VjsOeD6BGaUrtNrXsmcKtDUwkU5vQTyWXqk0Lv8QU1nn8m
         sqkHAQksW6aZkovvhTDnILvTDGZU8by4A5+5E95FSYBR4/DPH9DBJFKrRNlSOpv00q7k
         Qg2w==
X-Forwarded-Encrypted: i=1; AJvYcCX4KRg0J4w17f6YSoAWfOZ7B3R6MPOs+769eemf2d3c5Ae+FfPIN4cU4vq1AcFAA8zuauqaiKg6DN/tuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0naXi16EZGPsxseqa3CUXQPMJMnRg/NzGbKssHSw9L4qqfSM+
	TVO6w9e+NmzIJOBjwMN3Vx/bJbFDnV27Um9wOfFMUQI0jsegAbErD0JEjgZCPKPHgjqf/pMT6w8
	/Zsd4Z/9vNAPxHbLAg1oaf4Xk3MjGD1M=
X-Gm-Gg: ATEYQzz30oUaASiKLfwTLF7Dy6boKlwVtEvotGEuYD1o4+M6mfTkJNy7WVR8AtBrxJt
	fuU6nx1glkX8qcK7ZblFVjTVAOQ92DMkfB9xac+Sj+PxIpKex1+5tmM400chAKCRaYOUoCXweE5
	+YPxhut2Z9ixY8SQNHv6GNJwB5YR5yuhurUB2w3dZu21wFUHgK6tCnQS/bcMEQQZ/rjLHixcGZ7
	q9Lp7strq13ySyb65psiDMUqGscZCvZmTVTBX0WVe0QBWR9o6O8FJKyXZ0UkABHVTSQsz2q0L8D
	aoIsDLtSLOtZl5BT69XAswPuBPoPdb/7SHv0mJNxaVcMJ4r/VA==
X-Received: by 2002:a05:6000:1849:b0:439:beb9:5a96 with SMTP id
 ffacd0b85a97d-43a04db6013mr18746193f8f.31.1773624606482; Sun, 15 Mar 2026
 18:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87cy17bwxz.wl-tiwai@suse.de> <177342322339.1438840.10045618627804918846.pr-tracker-bot@kernel.org>
 <CAOKSTBuRwm=d+rU-0=gax03t2=x8F7LE3xkTr5v28+DrpbvWZA@mail.gmail.com> <abdbJW1YANlTtiFs@sirena.co.uk>
In-Reply-To: <abdbJW1YANlTtiFs@sirena.co.uk>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Sun, 15 Mar 2026 22:29:29 -0300
X-Gm-Features: AaiRm51wSTvaDLJ2oEIArATDX8JrBfuf_Pk9f21q7rDjy_OjdYbfW8qhaEwCUGc
Message-ID: <CAOKSTBuSXpDtSk6kct4ASdNiKiT3fqZRoAZ0jUdw6s5CqcotFA@mail.gmail.com>
Subject: Re: [GIT PULL] sound fixes for 7.0-rc4
To: Mark Brown <broonie@kernel.org>
Cc: pr-tracker-bot@kernel.org, Takashi Iwai <tiwai@suse.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Linux Sound Mailing List <linux-sound@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As a supplement, there are other people who have been affected by this prob=
lem.


https://gitlab.freedesktop.org/drm/amd/-/issues/5052

---


Gilberto Nunes Ferreira



---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram






Em dom., 15 de mar. de 2026 =C3=A0s 22:21, Mark Brown <broonie@kernel.org> =
escreveu:
>
> On Sun, Mar 15, 2026 at 10:11:02PM -0300, Gilberto Ferreira wrote:
> > I'm truly sorry to respond to this email, but unfortunately Linux
> > 7-rc4 is not working for me yet.
> > Still no sound output in the AMD Renoir/Cezanne HDMI adapter.
> > I notice the renoir soc driver are loaded but no Cezzane included:
>
> Copying in the AMD driver maintainers, not deleting any context for
> their benefit.
>
> > lsmod | grep renoir
> > snd_sof_amd_renoir     12288  0
> > snd_sof_amd_acp        69632  5
> > snd_sof_amd_acp70,snd_sof_amd_rembrandt,snd_sof_amd_vangogh,snd_sof_amd=
_acp63,snd_sof_amd_renoir
> > snd_sof_pci            24576  5
> > snd_sof_amd_acp70,snd_sof_amd_rembrandt,snd_sof_amd_vangogh,snd_sof_amd=
_acp63,snd_sof_amd_renoir
> > snd_acp_config         24576  10
> > snd_rn_pci_acp3x,snd_sof_amd_acp70,snd_pci_acp6x,snd_pci_acp5x,snd_sof_=
amd_rembrandt,snd_sof_amd_vangogh,snd_sof_amd_acp63,snd_acp_pci,snd_pci_ps,=
snd_sof_am
> > d_renoir
> >
> > That's the audio devices in my system:
> >
> > lspci -vv | grep Audio
> > 04:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI]
> > Renoir/Cezanne HDMI/DP Audio Controller (prog-if 00 [HDA compatible])
> >        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI]
> > Renoir/Cezanne HDMI/DP Audio Controller
> > 04:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
> > Audio Coprocessor (rev 01)
> > 04:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Ryzen HD
> > Audio Controller (prog-if 00 [HDA compatible])
> >        DeviceName: HD Audio Controller
> >
> >
> > Best regards.
> >
> >
> >
> > ---
> >
> >
> > Gilberto Nunes Ferreira
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
> > Em sex., 13 de mar. de 2026 =C3=A0s 14:34, <pr-tracker-bot@kernel.org> =
escreveu:
> > >
> > > The pull request you sent on Fri, 13 Mar 2026 15:55:52 +0100:
> > >
> > > > git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/=
sound-7.0-rc4
> > >
> > > has been merged into torvalds/linux.git:
> > > https://git.kernel.org/torvalds/c/56cf10db2ae0bb90c69b644d639b559106d=
52a8d
> > >
> > > Thank you!
> > >
> > > --
> > > Deet-doot-dot, I am a bot.
> > > https://korg.docs.kernel.org/prtracker.html
> > >

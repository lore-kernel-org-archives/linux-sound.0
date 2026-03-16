Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39213A244
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 01:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623502; cv=pass; b=pQP4I2K4CPsODzEt40Nn2WqOFsXB0mP/tgMWTmLt/0BM9qnawsLb5afsoM+3CDt58FnrM1JTwhRgpTCQmGd+d+GDMAO4quFOLlDy3odoKjvaJr8MVBrQSDL9RTyqvNikBuv991IgRV5hXg/PAJ4KEb/DyecSKd5KPJryl0NPQUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623502; c=relaxed/simple;
	bh=4GzFFLQtdRT5pF/MLN6H0LagUIyrZ7j33JhlZs3jRIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjB4L+M4+QfoxKNwLp45b7q3xXp/xN4jFzY3JZ9Xu5Cvw44QbuY6IAZ/Zd0vhZAKB4PslY/I8X3GKrhpZuJk7qqmEMYZauHELgOW/nH08bg5ZZLVZCvYecOcrXSuo0KGSJWR9/2P+roxlTicDuA4PgTjKfkUE6/ycIoGQ/s6r/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJH32ZqF; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJH32ZqF"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439afc58ac7so4713880f8f.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 18:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773623500; cv=none;
        d=google.com; s=arc-20240605;
        b=JprVcceei063S/+mx1gItOl/y3/6TMLrr7T/L0/RwtULAAFVnJWomMBeeX6ToI4OUz
         1p/vGZXloTThq0f+o4qpufboTvgXwUv1l9kllpW4VoTvMwlOD85ZcusFma+dkCSfQZ+t
         ty0E8PYvVSFQS1oqV4W4AfodDEK+Pe9VBwXQ+EovG1AjdH8bWsT1LkZNTaCB/DDZd9Hb
         FptGrQ6XjqoDIGKtrcJz7aTK9aPiDe3WU9ZWVu4P3KZKezpJSh/YEeKMRJY/yTvKBHUA
         Mzla1qGgIywZ9WXIsRPmnOiQnKciDm7bdnMbOHexqRDe9jHlEqRfMrzIIfQV65X/Eeas
         p9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vWuJ8JVqaa6K1HDzpytsKtytncnnGE/RinQZTRwx/xY=;
        fh=xnQ5dag2Yd3kwzYlk+At4WwUjgXChTVU7E8w8T0NuHk=;
        b=M/cWOeus4/ESB7Sqlfyud7Lt0HPRzvFv+I7f3iV+qnQ+aLlC7eceT+26vPShPrOwyP
         wj48ES1aaT++Pt8snMwflQihZR8hHcr5mP09KxIvMC7SlwYU/ibn7N7WlvATuWodiw8f
         p8lAjcEdqs13cnjCq4E04Oi8IA3q4Y54ivDGYLJD51hrxIv80eGsT+a1ayx9xIeFInLO
         l3qKn2wjMOMftlKgeUP5LS8ngG4hRQp37aJveFuMh/MrggNYRc7YtTMIEjvTIiA4LvZ7
         OoKYJirFZrTmB8KizUrTfMyRIB3KIxAmr1papBxxs5UKMA0Cr0IfH+56PtUOQw4/x11l
         qALw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773623500; x=1774228300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWuJ8JVqaa6K1HDzpytsKtytncnnGE/RinQZTRwx/xY=;
        b=ZJH32ZqFS8/fxxvGzioUrP7hyUOsasXkddJKXMHbBSpFWZa6ONd9DtBZ6k4dE13IWn
         SIBgHzskIT0+1d+RHSpaIMEeVfTt7XPACZtS2d6gKR2dl/tVAzIW/Ugu5abe/WSY4N9a
         aN7FyvqyJwwLfTUlNjd5bro7saeoVOkjKEb7LrMtUm8sr48hy5FVTNCHUY9skPdN+giT
         NbPHtdrmIkdG1kh47CgOU7U6sdB7vrSu5FRbV8Rn5actzaCKE+aMhKtdUW1Y3Po/vAYv
         0Bw36X0MQrfdOOlOv9KBS+ANBhXOmDVPmUFNWm9c4sPZGsxrDjST+FbrzO10gsJlbpwr
         jWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773623500; x=1774228300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vWuJ8JVqaa6K1HDzpytsKtytncnnGE/RinQZTRwx/xY=;
        b=KEF+fjb8ThASlk2WmdD2d2C30Xue2YxbOqMsMPOBFHpPL+5/XF/aZU2xK/WXIjX1ah
         6aD3pOPhY4RZeCFKlQhLHDhXkUEfndb1n1LiKNjBQ/gvZPNoQLBb1VQoyv6qT+hzV/gz
         7VWu7amqJ2u0669tV+0Hk2B5nkcHEJYsR/bIatyqFfFe0ib00b9NRwn6t3NN4KNu8Bmx
         JD5tmSo6R2e2KKqMznovrkGRwOG0ISoefVJbVqwpvohdCiuf8rb4XRWThYWQ41QaXuAW
         CSVBqZbf78UDBnpRc7/froe8STXvYo1ReTbZU6+9HtYmeUTNGiW4ahf2Sxt9YgCQ/4jt
         kQjA==
X-Forwarded-Encrypted: i=1; AJvYcCVpNWfVOVLUaaCMhkrBt4/73StDzU1q2JCCNd9ob4ccMhFyVVgLcCrwSjqYzMuNcQMFrD4ipjvHERvNpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+cBdaDS35NZ8efTjXxwG/YpzTn4nvd3JXWPg1E3bFAMi6+a3H
	Yboi0JxRkYZXXHFR+XSchIvov++E3dm3e/ATF9+tsOe+bI29iOJdvIavlrZ8v5F8VcgBRCW34e0
	X/f5U2XJvLcOVZK77yYH0EugL3TtBbuY=
X-Gm-Gg: ATEYQzwLRFQsqmSWdtWurYktBcnDOVKDRxHO2xxA4R0zHF3tdagotuzudzofFAFFdmE
	iA71VEg3KcggySwQHSVixkRsTH2+qdQkkBkRdeqYoP08g5cJBO20se5EnQ/DCL9zKtCYgydWcFQ
	ci0W6G7dnIsch9YCpm08J1e5YMEigxk4/yEDs63qPGqw8XFGr/4Zxyr+div6gax/dC5y09io+dD
	whXxus7Rqf9qXUYkTc50Tpp6kT7Ga5CIFTHMi3LbbJM1w4Oq8D+0DddNQ/jDRe5Yjg4pM8ab1Iq
	bYEZGC8GXGpa+5PoNbH/Lr0fiEbAvMpb1rTRn4dZ
X-Received: by 2002:a05:6000:420c:b0:439:ac98:751f with SMTP id
 ffacd0b85a97d-43a04d8ccbbmr20245489f8f.23.1773623499255; Sun, 15 Mar 2026
 18:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87cy17bwxz.wl-tiwai@suse.de> <177342322339.1438840.10045618627804918846.pr-tracker-bot@kernel.org>
In-Reply-To: <177342322339.1438840.10045618627804918846.pr-tracker-bot@kernel.org>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Sun, 15 Mar 2026 22:11:02 -0300
X-Gm-Features: AaiRm52EhbrNRx-rwRPOscbfl7MuZSaa6Rwol0DWxauRtgICtSbBYff5h9kEPxY
Message-ID: <CAOKSTBuRwm=d+rU-0=gax03t2=x8F7LE3xkTr5v28+DrpbvWZA@mail.gmail.com>
Subject: Re: [GIT PULL] sound fixes for 7.0-rc4
To: pr-tracker-bot@kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Linux Sound Mailing List <linux-sound@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm truly sorry to respond to this email, but unfortunately Linux
7-rc4 is not working for me yet.
Still no sound output in the AMD Renoir/Cezanne HDMI adapter.
I notice the renoir soc driver are loaded but no Cezzane included:
lsmod | grep renoir
snd_sof_amd_renoir     12288  0
snd_sof_amd_acp        69632  5
snd_sof_amd_acp70,snd_sof_amd_rembrandt,snd_sof_amd_vangogh,snd_sof_amd_acp=
63,snd_sof_amd_renoir
snd_sof_pci            24576  5
snd_sof_amd_acp70,snd_sof_amd_rembrandt,snd_sof_amd_vangogh,snd_sof_amd_acp=
63,snd_sof_amd_renoir
snd_acp_config         24576  10
snd_rn_pci_acp3x,snd_sof_amd_acp70,snd_pci_acp6x,snd_pci_acp5x,snd_sof_amd_=
rembrandt,snd_sof_amd_vangogh,snd_sof_amd_acp63,snd_acp_pci,snd_pci_ps,snd_=
sof_am
d_renoir

That's the audio devices in my system:

lspci -vv | grep Audio
04:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI]
Renoir/Cezanne HDMI/DP Audio Controller (prog-if 00 [HDA compatible])
       Subsystem: Advanced Micro Devices, Inc. [AMD/ATI]
Renoir/Cezanne HDMI/DP Audio Controller
04:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
Audio Coprocessor (rev 01)
04:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Ryzen HD
Audio Controller (prog-if 00 [HDA compatible])
       DeviceName: HD Audio Controller


Best regards.



---


Gilberto Nunes Ferreira


---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram






Em sex., 13 de mar. de 2026 =C3=A0s 14:34, <pr-tracker-bot@kernel.org> escr=
eveu:
>
> The pull request you sent on Fri, 13 Mar 2026 15:55:52 +0100:
>
> > git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/soun=
d-7.0-rc4
>
> has been merged into torvalds/linux.git:
> https://git.kernel.org/torvalds/c/56cf10db2ae0bb90c69b644d639b559106d52a8=
d
>
> Thank you!
>
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/prtracker.html
>

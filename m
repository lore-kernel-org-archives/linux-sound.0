Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2F61E7C18
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 17:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772472077; cv=pass; b=Ot1YkBWol4mlFuYuJfpITv3WUOxOUAX0ssB6m80G3sBExAJ0bwWnoSFBLdswer8z4+KPhNdIhEtskSPJEOnvRRE7R77cXI7EqdLze52UhY1ueEdCnbphn0KG/HVW2S1vEiQdQj6JtoXD9gP90eGeWZrLvibG15ptzkYjWAkbBAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772472077; c=relaxed/simple;
	bh=qPogRS8HcoXra/L264rrUmvzQtKh/H9o4dz7hWtYfFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfX6gupq1oSctHMqTe2WeUg40gB63hvZbwtcQ3CfRNyy9u88YPkInCCGD7ObbKzPBMdkllXDO401paEA3/7T3bwpL/Sh3I2PejzkQpKR7kNaiQ98nqeSrwxnE0vhiMT9IRVNzsPtDgTUXq5tCNrzpdmZoDZx91GGGithMdA4g+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+nK7Rwz; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+nK7Rwz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48069a48629so51933235e9.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 09:21:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772472074; cv=none;
        d=google.com; s=arc-20240605;
        b=Q8NZQuPeRH23sOpesoYhkWkVmd+YCKfz2o8HeY9qEeRo0gdwRAnQVHuawph3iw6QCj
         mNmffbJPmAmrCt9/Gb1S8IGYr9a3JO7zRo/ENTJ4ZcOSY11+QsKnu1D8msFBX8GGKYJI
         0xOOdc/jK/NbBwCyXZSmBd1LsPnrlBHqTOUScYB1C8qHXNpDkrcJdWEbkDrOiUB0kVVN
         Ddz5Lv7ko51or3GAoguKSSsYtk+xOyqZCJCBCkDFKdjD7ybpwRFwCn7sbn57Dg9rNIce
         XoUy1dQMNWKlY1OHgg4RnrWu5gUYC6xz/YVvwZ+x6oXSzXO9lbTuWsic114JzCRxxwxZ
         FBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NwSTWwtghu34l200XTSNEnBKuM+jm1/0MuH3YXehVOg=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=Lc/eAgxynlGFi1g58tEry9BGaeIJosKwkzVBXG+DMu7bTCb0732MAp9qunOedbUsne
         AbodHYcxTE8DJgwXC5YLkuhUOXl6R7N+nN83s1q/SG6U6JzDl7g3w/LKSYZINsDc7P7U
         Cj5ntJw8FdOdfGNAS8Elipp9neFOrlhOj8CUuFB+80zmXhzYocoSUYbXLPdz+jT6Qh96
         83REk+M9CDniqGiAnLd0lnk4c5s3oho1SlR+Eb9OqtAkJsSebLy3UyPmNTmGIi87euwR
         2Oqd2sVi7xlTa2XfwcpbkGnhKjkfZqj4Uji5S2HmwQLUSmeQ+Q/8L9HfSgK+04StjQBy
         FwPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772472074; x=1773076874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwSTWwtghu34l200XTSNEnBKuM+jm1/0MuH3YXehVOg=;
        b=H+nK7Rwz9IYng6MnvuioRwsJl0syQyvYhPKVNexsaFSfyyhslTUZON4LdJ3RSZ3Yev
         w1GdW4iLuO3Btaop3pqpGQQXEwzACHKkGkss8YNKFSWzfUCsgjEpmda4B16wSYAhiCY7
         R2jQL/GG0JaPbQVlXdyJDCu/RrlVf4GbqQ/0YSg+FmOUVwq2/+0lB76KEEqowGfpUodJ
         ISQuOgvV64kXVTWQR5qkzaL/tWDr6lhIZBIr0Hg/yfH+gVg1MKG4oiCTKlCrCDWUVBWB
         pybi7erNVlIJG+xu1AemiNumj43pabS4eO3fToUDV2hRNToEKE1AXZNboCg7RKqcLMFe
         32nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772472074; x=1773076874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NwSTWwtghu34l200XTSNEnBKuM+jm1/0MuH3YXehVOg=;
        b=XDdbwhhHPVOrzbyFAho/ZoD1puFvm/ZptujnU+nDySJ9A98r/UaDKZUF/NlIWoYCf1
         NvbaJ0YHMfJDHX5XTIcJeMAbk/Xm06klBp0vMdG2XFnJCG7GKVYuLpETsOf1mF+G22Xg
         xngeggQ2e7Pf9WvLsFbRDYirX58cA44R4vNx7LyVPahvC1P7Gd3QTC0CNu4iA9+rIOh1
         7uG1Jc+d2AQTMa6+45k9A/2zHPEWWSYEpPaXvbeixhDMeGTjYE9j+sSNK6BaRqZIwdj3
         cOPP4KeiuI8dNOaQKAMjget7EADaqts/8r5W2A3C44knoK1CvMRM7N2vgC55hmjvbdae
         M0Jw==
X-Gm-Message-State: AOJu0YzJB9DykJUVjzrb+78UFOFddsF7cZsxpjUhhEqdmxt2rE6ai1x3
	epTeaRNvMvkHyzsvY+VCScyuRCGLAZquid6leLoxcWtU8oNZ1mDH49X9zX8bnTKSLhp324J0/Ed
	2FvJmC2bp4tgB/t0ZoG1LIrvZNnfB3wLIv71JOCVYeBWO
X-Gm-Gg: ATEYQzyevenYKySGOIHP3d7MVjDvuxkUVGFoDt20tHetpgNGSXNg+Pm+Eulru9nSBGh
	C4TNQLVAJSU/tG7FcbflNADERnV36oiEfzrnrUM+Af4pwWmDz0UA2xpwzB4EtxcwH5I+7B/KzWM
	XLBdHznyAcCd3ipm7375U3c+6UAOeP52JJk+SYj+/4EzSvwFSwYmIc2ygnW4sYsnsCDWuQVOV/0
	JInS5SOakPL3VEgL3LQFuaHxhtV6I67ca7QgalEgpsr77e3iyrZ070up+KeCWdpZ2S82T5K2iJ9
	uNwEa/cBlrG0ydkRQ+mjZmUS2p57CxHUHDZJLIM=
X-Received: by 2002:a05:600c:8106:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-483c9bb6559mr213060345e9.4.1772472073980; Mon, 02 Mar 2026
 09:21:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
 <87qzq2kxrc.wl-tiwai@suse.de> <CAOKSTBtpqPEnihFhopocV_RC8VR_RribXctUayEkUCav3omr3g@mail.gmail.com>
 <87ldgakvsc.wl-tiwai@suse.de>
In-Reply-To: <87ldgakvsc.wl-tiwai@suse.de>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Mon, 2 Mar 2026 14:20:37 -0300
X-Gm-Features: AaiRm52ip2c6SZ4ZCnsUaJkKYD6JLFv22VPiR7NrS9YD0tv_xW5HIrokjU3o550
Message-ID: <CAOKSTBvbopXOuOfstmasijZgUnT9_qW_dsaeMcHUXhyjj3iRmw@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>>    ALSA: hda/intel: Make MSI address limit based on the device DMA limit

>> Please try to revert this and check whether it brings any difference.

I am so sorry!
Can you tell me how can I do that?

Thank you.

---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram



---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram






Em seg., 2 de mar. de 2026 =C3=A0s 14:04, Takashi Iwai <tiwai@suse.de> escr=
eveu:
>
> On Mon, 02 Mar 2026 17:56:48 +0100,
> Gilberto Ferreira wrote:
> >
> > Hi there...
> >
> > When I boot with kernel 7 RC1/RC2, I see the Firefox playing and there
> > is audio activity, but no sound on TV speakers.
> > When I switch to the onboard card, it works fine.
> > When I boot with kernel 6.19.5, both cards work fine. In fact, it has
> > worked since 6.19-RC2.
> >
> > This the output of the commands:
> >
> > With kernel 7.0 RC2:
> >
> > $ cat /proc/asound/cards
> > 0 [Generic        ]: HDA-Intel - HD-Audio Generic
> >                      HD-Audio Generic at 0xfccc8000 irq 71
> > 1 [Generic_1      ]: HDA-Intel - HD-Audio Generic
> >                      HD-Audio Generic at 0xfccc0000 irq 72
> > $ aplay -i
>
> Not -i but -l.
>
> But this doesn't matter much now, as the HDMI audio devices seem
> enumerated.
>
> > ALSA lib pcm_dmix.c:1000:(snd_pcm_dmix_open) [error.pcm] unable to open=
 slave
> > aplay: main:850: erro ao abrir =C3=A1udio: Arquivo ou diret=C3=B3rio in=
existente
> >
> > I tried with kernel 6.19.X and got the same output.
> >
> > This is the onboard sound card:
> >
> > cat /proc/asound/Generic_1/codec#0  | more
> > Codec: Conexant CX11970
> > Address: 0
> > AFG Function Id: 0x1 (unsol 1)
> > Vendor Id: 0x14f120d0
> > Subsystem Id: 0x278212c2
> > Revision Id: 0x100001
> >
> > This is the HDMI port:
> >
> > Codec: ATI R6xx HDMI
> > Address: 0
> > AFG Function Id: 0x1 (unsol 0)
> > Vendor Id: 0x1002aa01
> > Subsystem Id: 0x00aa0100
> > Revision Id: 0x100700
> >
> > I am using KDE Plasma Desktop 6.6.1 with alsa, pulseaudio, pipewire
> > and wireplumber installed.
> > But I don't think this is something to do because everything works
> > fine with the 6.19 series.
>
> So, have you compared kernel logs from both working and non-working
> cases?
>
> In anyway, there haven't been so many changes in HD-audio driver
> between 6.19 and 7.0 about HDMI audio.  Maybe the only relevant change
> would be the commit cb9b6f9d2be6bda1b0117b147df40f982ce06888
>     ALSA: hda/intel: Make MSI address limit based on the device DMA limit
>
> Please try to revert this and check whether it brings any difference.
>
> If not, most likely the regression is rather in the graphics driver.
> But, it'd be best to do git-bisect to figure out the culprit.
>
>
> Takashi

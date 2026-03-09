Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD643C2781
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773064977; cv=pass; b=RAWYJ+2w38lfu7RuEhZzayE5iLDuBkC/LVfLnTWgto3DOAy8ERR9W2WITurWnOxac8VkXijXj4A5Y4YXO7U/NUaR2l6exSo8VwMyhueUM6lqByyc+PCSpne0sbOVXX3wR7c/DnYIkE0kTHPcN34apo8TfUPYGODsKSA6IYs+OPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773064977; c=relaxed/simple;
	bh=eS9fhLLqDJTHY91baTA6w5oY7zcCynBm2pTAMayjydI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNn8KX5tk3ec4JzXsPpHPO0s6ZZb12p3DBWrWDNOHRq2+o3u76KHxyWuMcMUgB19/9awgJpeGl4shOwNNfO/Y8MQZdK45vvBiqgxuwTPC6Kw8kcVW17kOZjZDaoePHwVVE/1jfLJhskdR6sefk6rcmipd01sabviZjjEzR+j0U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pi9b8d/O; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pi9b8d/O"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b7c2788dso5916183f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 07:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773064974; cv=none;
        d=google.com; s=arc-20240605;
        b=OOLwycmevi0swGDXkZYhXzSXDKqEfbOrMsOTj4zkN/BKg01yIDBLHwCENxQCymL+Se
         MmIoc/yOHPZzTHiY/J7UlhNnstKgKu1JOiyiiXLdq+d99rcX2FnNqCfSBw7cEnnt73pH
         Rxp+MGD4B3qcPOhT6PO/bjs5MjCDptHxdCzY36X5ms12fXC/Z+x/kMYT1lLZImknIuwQ
         UG1GadEPDPs/PQP8jo+6eadh2p+ZICljQd3fU6Y9WDxKCC1FdekCYZybf0ZPqpWBkRVd
         S5jmk2sHleVmIjegz/4G82xVxE3cYdKEXQ1EUhD8x+/i6bGVgXIxEc3q4o5orDJK+kyN
         J+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=azYKkAJ/Pjym6jZWTK+th+Pxad4zfYpNRYlPPjQXN8Q=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=bMQJZMzyiQTTSKbXyhWdcLLvwtvjqldCiGWAethIdCwyxfBRfUKSkKFvkj0gY11XJG
         LDvosRsn1wgTzPF8H172vJ0DNZtkXV/qAiyFBY4jZyciYnOq9DgQ6mQiyr34Z5YNwTws
         2vd6ZZXfZkZ44/3/uzxflNwjCHW2qBoarNiK2bVW7SvezoHeRhSbvt4IVXFqMJ2uKOE7
         RHvP/ZIeVbBSKKbHtLOJ0U0Fz2pCPX8uvfY6hykAGuPZAm6yjVF3I1ooiUOfhB20bXeK
         zSgeqmdrt0j3scENmLlNzGznnI/u1FLOxNwUFONGIZ6vYV92RPhZuomsoIkM2hdR5uem
         bo7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773064974; x=1773669774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azYKkAJ/Pjym6jZWTK+th+Pxad4zfYpNRYlPPjQXN8Q=;
        b=Pi9b8d/OnlA4ktFaWhm/Au4vswa1FInXF4jOM4xdMw96x/cPMPMQg7dazCCio51hBr
         qMzi2ZmbfRNI1venjIHtd8SUP5QU7AIDfEwLBRvAW4lg6al4vcRFzvsi4Illbjv24uJg
         fEv7zBjlDFP1BaC7rBKYjtGbNx/RMHyGQVuGF3FYmqX7LRN8YKZelkPCHf0zl55nasoq
         0mJYzcLxOiQdo0gOkX1UezmDVbEQ+tLJabNDRJQ+leFn2L2wJ0wjav7iJT8FsEnnrmAD
         nulpKSS6sTdSMDERDZefWkd4nkS+gabbWU4zgIOOYJC9e9iTSgsdfcBNtVYQfyYrujpp
         vjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773064974; x=1773669774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=azYKkAJ/Pjym6jZWTK+th+Pxad4zfYpNRYlPPjQXN8Q=;
        b=XK/Muwsl1/46Ths9Mn+zK5pbXbTuc4ksEH7wCoghNdzYYnUx8oWi12Rdu4m7biVEFX
         QJyIJ4wzJXKMujGWeC3zoBjdQEAapFkc6ti0c4IjPYGfOmx/06UsoaDbscsgqc1to7sA
         sikTnhDReM6aogx84COtV1vzDl3u4hkNOusqUnyVGL7fqHQI3pdYEVuFxYY33ReffBXd
         X2rozt6KQwBsZcEXtQCHNiGMN7d/R/VOZ2ribKSptiXGAG1QjgzVu9Nv4opu8pl2NV90
         ssDtRiPIbCfmA7UdCWDP6qNuQ0QHXac+/ZNmIBWmSgDN7LgxOT57RluaRk+aY8HpoxDA
         Cbeg==
X-Gm-Message-State: AOJu0YwCHzFe6SLxhWhuCz3WXf9y9CRNcsvmm8kJWswSPponpnfMsvZ8
	dwPCftqYU4NhGRNYU9iFpex+/0GqVPFrCdUuf8NtRZlGIlm9eLMXStnWs2E9lZwbeAciJ9AiSQ2
	ksQSvWDZzHWwiy73DTcEkycTG8l9xkQrZJj9AM4ewGA==
X-Gm-Gg: ATEYQzz8CjsQkAn2X9TDMiE/LHIfsTwK+Pwe9nkCnfp5UbHeUB9M8+sy94zEHFm7Ywh
	Vr0gOlDGEK0dOo+tVt/LsQpaVAz+0lpQ9caNjMgV+72cYnOaY/bPU3d4+iMtNMAZr9v95LzQdPV
	vFbZ5oG9iMc2BjzPkeziTSXS1EaZ2D45xHPqwmT1+k/H5V5XoDpIZcF6w7lOee5qJv0P7VMXmij
	bu3orUR4cj9Z/vVRhNPgwmXOUFaN7wOkDGnr0gijS3wQy6sgHramWmXZNDCmC34jK2Mq5JbnBuz
	tmJhgDHVfGhxVYCSdlK0W/7xAEWgawdagsRWtnZTY+j5ygOHcA==
X-Received: by 2002:a05:6000:2012:b0:439:abcd:b317 with SMTP id
 ffacd0b85a97d-439da351ae3mr20823829f8f.14.1773064973961; Mon, 09 Mar 2026
 07:02:53 -0700 (PDT)
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
 <CAOKSTBuOV0=1Y62sqf3QALgR+_He=tKLPQ7LZN+xFC6oGWEKVw@mail.gmail.com> <87y0k6whm8.wl-tiwai@suse.de>
In-Reply-To: <87y0k6whm8.wl-tiwai@suse.de>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Mon, 9 Mar 2026 11:02:17 -0300
X-Gm-Features: AaiRm53ANEDefvXULp74OudujLid5zCmH9DP3QOfcka3kvc4pi-XMxrptyo-dAs
Message-ID: <CAOKSTBuUnS=stepHySGVYH4GbQytEQL45cLj4eV8u0KAsquF5w@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linux kernel 7 RC3 is out and still no HDMI sound.

---

Gilberto Nunes Ferreira





---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram






Em qui., 5 de mar. de 2026 =C3=A0s 10:06, Takashi Iwai <tiwai@suse.de> escr=
eveu:
>
> On Thu, 05 Mar 2026 13:54:45 +0100,
> Gilberto Ferreira wrote:
> >
> > Hi there...
> >
> > I just installed ArchLinux, because I thought that perhaps
> > Ubuntu/Debian was the culprit.
> > So, I went ahead and installed linux-mainline from AUR.
> > But I get this same result.
>
> Then please try to git bisect.  That's likely the most straightforward
> way to figure out the culprit.
>
>
> thanks,
>
> Takashi
>
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
> > Em ter., 3 de mar. de 2026 =C3=A0s 09:17, Gilberto Ferreira
> > <gilberto.nunes32@gmail.com> escreveu:
> > >
> > > Well... I really don't know what happened.
> > > Probably my fault, as usual.
> > > I do this:
> > > git clone https://github.com/torvalds/linux.git
> > > cd linux
> > > git checkout cb9b6f9d2be6bda1b0117b147df40f982ce06888
> > > make mrproper
> > > cp /boot/config-$(uname -r) .config
> > > fakeroot make -j$(nproc) deb-pkg
> > >
> > > But after that, the result was
> > > linux-image-6.19.0-rc1+_6.19.0~rc1-00011-gcb9b6f9d2be6-1_amd64.deb!
> > > I don't get it.
> > >
> > > git log shows me this:
> > >
> > > commit cb9b6f9d2be6bda1b0117b147df40f982ce06888 (HEAD)
> > > Author: Vivian Wang <wangruikang@iscas.ac.cn>
> > > Date:   Thu Jan 29 09:56:09 2026 +0800
> > >
> > >    ALSA: hda/intel: Make MSI address limit based on the device DMA li=
mit
> > >
> > > So, basically, I give up!
> > > When this issue gets fixed, I will try kernel 7.0 again.
> > >
> > > Sorry to bother.
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
> > > Em ter., 3 de mar. de 2026 =C3=A0s 07:48, Takashi Iwai <tiwai@suse.de=
> escreveu:
> > > >
> > > > On Tue, 03 Mar 2026 11:27:24 +0100,
> > > > Gilberto Ferreira wrote:
> > > > >
> > > > > Sorry... I am not an expert on this stuff.
> > > > > I just like to compile the kernel...
> > > > >
> > > > > >> You need to *compare* between two kernel logs.  You can strip =
the time
> > > > > >> prefix, and check which lines appear and which disappear in th=
e new
> > > > > >> kernel log.
> > > > > How can I do that?
> > > > > Via journalctl -xe -p3? journalctl -r -b?
> > > >
> > > > You can run "dmesg > dmesg.log" on the running kernel.  And you can
> > > > get two outputs.  You can strip the time prefix from there by some
> > > > script for easier comparison.
> > > >
> > > > > >> And, have you tested the revert?
> > > > > I don't know how to do that.
> > > > >
> > > > > If you can point me to some doc, it would be nice.
> > > >
> > > > Have you ever built a kernel by yourself?  If yes, it should be jus=
t a
> > > > git revert of the suggested commit and rebuild / retest.
> > > > If not, which (distro) kernel are you using?  Usually you can ask
> > > > distro people to build a test kernel.
> > > >
> > > > In general, please be more specific about your system and
> > > > configuration.
> > > >
> > > >
> > > > Takashi

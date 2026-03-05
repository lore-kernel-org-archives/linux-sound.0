Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5A257423
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715325; cv=pass; b=dQt8+PFR20tkUwtKB0H2Xk1wdLejAUd2f+PjcOO4fZV8Dsq1epYpJj0HplmTI2vrULi2kKNJcp/1N8+jW3VyTMFU34dRFf/4iBWTxntgJyE+tZUodCjyAbTdWJBUOCsY//flTJtUYMKLhiX3k4iTP+kFaxh7UF2yv3Xn/8K/j4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715325; c=relaxed/simple;
	bh=4QX30NsBFS8YmcCrei3bHj3DZZK+8tKkCUjyir3tiFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GUSy5J/ObZiF6SrB5/oLQiMyWMJOq9iqDQ/R7si5lbwyB/vjatN0RegcxDLT0mzeWRMTuAb7ZLCDqorXk2sYKVeMMVG3+TyTkx/eOpxefhdzu12Qj152UQ17JGnMI/AC8tSYzQ+metXVmtX8G0WYTbxO34hT53wCl8OaIHEfp7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/aFr5tI; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/aFr5tI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439cb5af25bso1499980f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Mar 2026 04:55:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772715322; cv=none;
        d=google.com; s=arc-20240605;
        b=iAjXosIL4lvRjuTQDjrASelhyDBb/YBaRJzW5u9DLB2LEQJXaXMUxPyjJ+1OZSpmgO
         S+ZigGcEfmnoMfUjaGDg0a5c9Eu2hLhOthHXzp7KHlVi0S7DGW0/0cs3FLmrzLFfxuBq
         xYg/FzHNjnaAGyrqMjy6FBl74uzeA89hr+8yd5aIhhu0YZUgdY6s1THPJIkGyPku0BLv
         B67qXBYmlGVd5lSQHE98RzD9cv3sKPr/9nOzTaSldZ8DUFWCooHnRlg3VhfstjW1F6RV
         BKqaT8IVxyuOPUAoWOT26QrS5NsNfSi6gh0vNU/2Yfhxipbtmskv5SrctW84lQKOYrEA
         P1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RmTa4VpH+ZpsG7URyawBohKxOSx3xeqrF6ZosPQkF9M=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=iucNG8zWKEiM9qbX55HONKenl38EgX24F/+OXfaHHYihayZXG5hceW/f5lWCL+MSER
         92lOId7koib2C8U9t8iD9RByRdFKOBiqUAEvvPoAamT4xNQmXZ5STsHI+f306bAUm8fb
         cg/pSczQou8jkP/F7KdQkruz/T26GXRXqpWmLHd4s8jcGVs6rGLfVTM9/wiVIMWWJ6Bj
         ZgQuDFCfRhXJZNUXNc45h4LA/sTwoVu82bd2h/4029014AGfGI9RNmTpbpj2WCC1ZuAC
         nYGv3a+/2+5t9ii8glF/7bbHnHhpMTQyOoh1j6udontfZuok6gnL6hxRwouXfHzC3/Oe
         CC4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772715322; x=1773320122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmTa4VpH+ZpsG7URyawBohKxOSx3xeqrF6ZosPQkF9M=;
        b=V/aFr5tI7a0oy48Zk8GDSYAGFfazotvtG+xY//F4gdjMIxraFF/WbNwny34kqdHbtJ
         SkewmrdUJemrGIK3YN3f2R5kgCbmWj77lrJ4LPBZ3bwgAa+pncZt51ZgleOW1dgdf6JK
         Nnca8TH4j3dvvEIospkCqEJ96qnikwwYCGJ/kI6l/bcUJR+PabYJp81GDpqUPJBLH3kA
         sdKy1TngXTUUkI7mvGYB00NANjb0uxTeEOzPBlV8ZtbxJYqbui75U0ZvVyI5/3H6+pry
         uFWtBMH3lJWYqrT0IyN8q+fTzsCO0VD1aA3pR4mymzs5zFkpUX1b9glKbHJ2myMWEyXp
         hd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715322; x=1773320122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RmTa4VpH+ZpsG7URyawBohKxOSx3xeqrF6ZosPQkF9M=;
        b=TF0mGt5VGcDgtdDIknIZQW3UttvuBeANuui2RReuCoG94bicaH1WG/g9BorCcISZsz
         AqQCzE5Cushe40QP38hUcQFmrPvVHLkyieEaf9OscvXDBDXIrdRTx6RkRhjFRfKxoFzf
         5NbP+tcs7yr89+gX9UiGzdtVc6CfHnEwWcZT1OLQ2miLiOYYHswpyAlmrLVrpZIgH4Kt
         QB2FYqvYF/sJ/P3oUYPJuSpoX50QH5IMS4aklZ60q2YCbWLaLg/jQGvSLol1ttcBq3ME
         1RVBXLSopgupqiTGjDN4P6eXh9JfDnat2EWjd8V6Obm/y6vAGqIlOFsNQIlGXLazUnL9
         S1RA==
X-Gm-Message-State: AOJu0YzKAeJYMa+ogb0MQw99GbnxN2zHlB8Iw5BUfP8djUbpd76a4CTD
	HaPd/b9Vh7nCuABP/mlqkhOyB+JL5h3poOKVKJ8890BVgGGK5A11/8mR2lYuU4VxsbqioRCoqID
	qkevh99JFifEawvlEgbhfiMtcavMbzn0=
X-Gm-Gg: ATEYQzxrmdQ2K7i3H7IOIrnXZ2ECT1s4AUKMUKK//YCYZbVvOaFTFbpc9Ft15yzy+0q
	At86Z6R0nRIyhDc3+Qvksovw4oG8k+nQXMUpyAezy7BueT4z90Hf5yJB15UuoiSe/KPXxKlcUFA
	KERYhchFxi3if7qZ2xn/5niUHXo7WtdbDajAVIvsFt6l2G3WpFAJZd4mBkFutEZ4fvVXw5c0In5
	uMOX/+DEraVMjV/qh7Uj5j9YxybJS4vpWk9oaul5NoXR24r+a0wK1uR7uVShueOtErhIXZKPKqv
	egyO58L7zuhy/gp53kxR4lKwKXD3GREKnVWN/8oV
X-Received: by 2002:a5d:5d0f:0:b0:439:b858:1d30 with SMTP id
 ffacd0b85a97d-439c7fe8c8dmr11190738f8f.41.1772715321941; Thu, 05 Mar 2026
 04:55:21 -0800 (PST)
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
In-Reply-To: <CAOKSTBtdt=enKSv4ZF7VxDD4QF8+ntyFM5CPJ1Y1QQ7M6TsiKg@mail.gmail.com>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Thu, 5 Mar 2026 09:54:45 -0300
X-Gm-Features: AaiRm51MrRlvLBewDeZqoT9g4S--HbK9KfE-gTlFDwSoCTTDpTScby2xgI4QExM
Message-ID: <CAOKSTBuOV0=1Y62sqf3QALgR+_He=tKLPQ7LZN+xFC6oGWEKVw@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there...

I just installed ArchLinux, because I thought that perhaps
Ubuntu/Debian was the culprit.
So, I went ahead and installed linux-mainline from AUR.
But I get this same result.


---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram




---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram






Em ter., 3 de mar. de 2026 =C3=A0s 09:17, Gilberto Ferreira
<gilberto.nunes32@gmail.com> escreveu:
>
> Well... I really don't know what happened.
> Probably my fault, as usual.
> I do this:
> git clone https://github.com/torvalds/linux.git
> cd linux
> git checkout cb9b6f9d2be6bda1b0117b147df40f982ce06888
> make mrproper
> cp /boot/config-$(uname -r) .config
> fakeroot make -j$(nproc) deb-pkg
>
> But after that, the result was
> linux-image-6.19.0-rc1+_6.19.0~rc1-00011-gcb9b6f9d2be6-1_amd64.deb!
> I don't get it.
>
> git log shows me this:
>
> commit cb9b6f9d2be6bda1b0117b147df40f982ce06888 (HEAD)
> Author: Vivian Wang <wangruikang@iscas.ac.cn>
> Date:   Thu Jan 29 09:56:09 2026 +0800
>
>    ALSA: hda/intel: Make MSI address limit based on the device DMA limit
>
> So, basically, I give up!
> When this issue gets fixed, I will try kernel 7.0 again.
>
> Sorry to bother.
>
>
>
>
>
> ---
>
>
> Gilberto Nunes Ferreira
> +55 (47) 99676-7530 - Whatsapp / Telegram
>
>
> Em ter., 3 de mar. de 2026 =C3=A0s 07:48, Takashi Iwai <tiwai@suse.de> es=
creveu:
> >
> > On Tue, 03 Mar 2026 11:27:24 +0100,
> > Gilberto Ferreira wrote:
> > >
> > > Sorry... I am not an expert on this stuff.
> > > I just like to compile the kernel...
> > >
> > > >> You need to *compare* between two kernel logs.  You can strip the =
time
> > > >> prefix, and check which lines appear and which disappear in the ne=
w
> > > >> kernel log.
> > > How can I do that?
> > > Via journalctl -xe -p3? journalctl -r -b?
> >
> > You can run "dmesg > dmesg.log" on the running kernel.  And you can
> > get two outputs.  You can strip the time prefix from there by some
> > script for easier comparison.
> >
> > > >> And, have you tested the revert?
> > > I don't know how to do that.
> > >
> > > If you can point me to some doc, it would be nice.
> >
> > Have you ever built a kernel by yourself?  If yes, it should be just a
> > git revert of the suggested commit and rebuild / retest.
> > If not, which (distro) kernel are you using?  Usually you can ask
> > distro people to build a test kernel.
> >
> > In general, please be more specific about your system and
> > configuration.
> >
> >
> > Takashi

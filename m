Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1422725F7A5
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 12:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772540265; cv=pass; b=auhlG5pEIWsRaI1DcbaSn81tI8jCAgdfu8RDOUwwr3La35YWXNQk4AafiCCevdIagCN1RHCP2IMFzlseknCX8HqzlKIErbIOHTgTgFNVZ7ay1Y4ySFAncYvDCqROSpomOOaJ+KKdN3JbLRjs1KL9y6BbFL5WYY6jCbYDgcAYITA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772540265; c=relaxed/simple;
	bh=bvzhtx+FGu1xxotHnZZQAPPY3OIUwg2a5ra2FINlZSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFgtZKtoKMomSlMt5BGNmejw6VttP0mTDP+/P090S2YiphvQw2M/PCPVn2rFi0RytsODhc2tvkACyP5acr518khdwm/5vlNVa44ngYN9SZQnLdK3ICUfFzIPX9Po4N2yqp8FCVqbAHzsVk0EqZO3zsMjgCMCg7q9YCNTukDFU7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eM1oQV1I; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eM1oQV1I"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439a7b48df2so2373703f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 03 Mar 2026 04:17:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772540262; cv=none;
        d=google.com; s=arc-20240605;
        b=k6QZjGwL8cwL43A66DwlTKle1NNvaQiKc7G10nMi1hUhWq1d3+k2BhafzcrXaox0pX
         4td5L24AtiAAVo+Ako42J0wyQjAUhhtzUYL852dU7J48zyCbQEjOhpgK2wQQ/hRbcyLM
         J5Y4yidzl8SxZgM1q+MQkRsD+j8IPQ33ltHyadLZs8APZsi+nnw0UJ1felCudg/6AQWl
         DeAnIeaQrNF1T1jIZSivr8bwAKSDX27/0iuCQkl/moccRgh67vWKrVpfsCwxJBCiXDre
         Mcud8ALSWx0SV0zZVa2bDYtMy3ei1KHC3aCEGX5CMtDclQTUsxP9QjWq0v7C6VMp+Q0A
         7vSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wru8A5TizOl//nb7mqw4WHEfnfNTrZUb6Yk5NL0xwU8=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=aIkE3PWdUNi9euRvh6vHQiW6GVBC9fFGdlmP3O7XDH3VdCQbVGRMHltjEksOpLiVZZ
         u+nh2WP7Dmd65U6gzyRbbWCbwx/vGhXQw5RyCG0OWDKxuo/PQYxhhlWqYa71SnN4VXXR
         QVa3x28G4tVtFu16MydqKBEEI4DKclqTBfXspVonOXLfo4mtQpYxTMu0YS5vzg3ZWO6m
         4yit7hzfqsISurlHsAJ80ITcd57vkih8lHSXQs2nScYyjqPqm6p1AkFHpGpkezbm5yOx
         WV9Eeheyh/pymSo0+qRE817BTHXB+Kw3lR+t3ZlHbxcn3hJgc9f7YpfgSz5XQQ5j/w3M
         f+Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772540262; x=1773145062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wru8A5TizOl//nb7mqw4WHEfnfNTrZUb6Yk5NL0xwU8=;
        b=eM1oQV1I7YHsnUoM+plhMuNC5gwMCcOWIuL90RuMBOg2024RCApNN1PjMlmVyoWnF2
         mnlk+BvmvtEuQsNo6EyBNliUL2GWzNWx0DrGlYKW0OSEjE7xZvy0wNtWBhETJa4U45TJ
         7xG+4YUfxGq08ZVbg7+Q3/UaPOZg6mXBMF03PC4plEtIcGcZlpV/k2XICj02HTKgZyo+
         duZ/p3OmziHlkmwP4q4TsNVUqRu2zT8YKyIRrn7mZYQDlNPY/wCpYkDlJFhIZPD27/qC
         CV79lLh0oRhHAK4nGrQk1fzRFeOD5u9BM/q+tkF0j0jhcGXIvDr2198iHnEqO/h8nZKg
         ZMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772540262; x=1773145062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wru8A5TizOl//nb7mqw4WHEfnfNTrZUb6Yk5NL0xwU8=;
        b=S1BV7QjS70kRCfhJnsgkPysP+sMWSSH1GtgkwnLdkQ0KLPAgmerx5D2ingGE18G/TR
         Rf6WFdDokElkVxNhomclXtL5t2SJfEXlnaFrGD5IumMJspUNTq3LxHA+tk+6jWGE7Lfw
         aIGTACcOWRdZP4sH9TwhImNjIrGeYkbMkI75MUybe3K56uuO/kZsXl2CaUQHs9aeYp2E
         Wja6+WABs9aa98g9qEk4N9sRaZM85uSJD4OOGwVNq+zPawwgLq1RIsbxtKKZPzjkYvE+
         BL57E1mS1qtQZeFCmyrqoQiHQPeqHh5aCUlvKk9DuBKckGB3ntoxvh0VJ65YwQ0UvgLQ
         3+JA==
X-Gm-Message-State: AOJu0YyqlSOTgMlstE120jDfBfaS7KGeri7XiIEoaWTNL8m8Qc4EE4uC
	GYxncZUuQuN5V8ma+IGnc7H5SotHA2G3k/Jo9ZtEGiJw+IZPWy++Coal4GjE8C6KDPwZnRxjI3V
	cIdAlxrAapXTGTyTVvQ45kLb26FBZssQ=
X-Gm-Gg: ATEYQzxvDntwJDVq1+tPg6ZRcCqpuSLZFtzCOnly3A/gie4AP4LV3UKK6AAEgGoMG7b
	2VTGGmPDZfKGG+E3xQNNkMwRbUyD4/VB/Xo8Gfo4UwUVPVtYa107cMWKuz2zye45YgFD+1TCdEU
	OBJdsEAIlGWZdhS0R13X86o/ZDF7JH6WLd6Ro5giMgr/trMx/FR0G61CQYyI8tbreCYtHTRUkVF
	A0sEK5o2lG4zcbnNxxMLjx26e1YnBWKpK33d8DdBz5kG8Ne3gJqsT8HjdWv5NI2yB3MfF0ULBld
	Fdr6I8GKMhkOuijrSypNjyTBhZNDYVjeyTUkSSDW
X-Received: by 2002:adf:f211:0:b0:439:abcd:b314 with SMTP id
 ffacd0b85a97d-439abcdb6e2mr14264544f8f.18.1772540262102; Tue, 03 Mar 2026
 04:17:42 -0800 (PST)
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
 <87ecm1jii6.wl-tiwai@suse.de>
In-Reply-To: <87ecm1jii6.wl-tiwai@suse.de>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Tue, 3 Mar 2026 09:17:04 -0300
X-Gm-Features: AaiRm52elnAHqibQ5u0-lBFTJcrAcfqorjA1O880j5BuKMi9K3DwCpf_WR5Y1qc
Message-ID: <CAOKSTBtdt=enKSv4ZF7VxDD4QF8+ntyFM5CPJ1Y1QQ7M6TsiKg@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Well... I really don't know what happened.
Probably my fault, as usual.
I do this:
git clone https://github.com/torvalds/linux.git
cd linux
git checkout cb9b6f9d2be6bda1b0117b147df40f982ce06888
make mrproper
cp /boot/config-$(uname -r) .config
fakeroot make -j$(nproc) deb-pkg

But after that, the result was
linux-image-6.19.0-rc1+_6.19.0~rc1-00011-gcb9b6f9d2be6-1_amd64.deb!
I don't get it.

git log shows me this:

commit cb9b6f9d2be6bda1b0117b147df40f982ce06888 (HEAD)
Author: Vivian Wang <wangruikang@iscas.ac.cn>
Date:   Thu Jan 29 09:56:09 2026 +0800

   ALSA: hda/intel: Make MSI address limit based on the device DMA limit

So, basically, I give up!
When this issue gets fixed, I will try kernel 7.0 again.

Sorry to bother.





---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram


Em ter., 3 de mar. de 2026 =C3=A0s 07:48, Takashi Iwai <tiwai@suse.de> escr=
eveu:
>
> On Tue, 03 Mar 2026 11:27:24 +0100,
> Gilberto Ferreira wrote:
> >
> > Sorry... I am not an expert on this stuff.
> > I just like to compile the kernel...
> >
> > >> You need to *compare* between two kernel logs.  You can strip the ti=
me
> > >> prefix, and check which lines appear and which disappear in the new
> > >> kernel log.
> > How can I do that?
> > Via journalctl -xe -p3? journalctl -r -b?
>
> You can run "dmesg > dmesg.log" on the running kernel.  And you can
> get two outputs.  You can strip the time prefix from there by some
> script for easier comparison.
>
> > >> And, have you tested the revert?
> > I don't know how to do that.
> >
> > If you can point me to some doc, it would be nice.
>
> Have you ever built a kernel by yourself?  If yes, it should be just a
> git revert of the suggested commit and rebuild / retest.
> If not, which (distro) kernel are you using?  Usually you can ask
> distro people to build a test kernel.
>
> In general, please be more specific about your system and
> configuration.
>
>
> Takashi

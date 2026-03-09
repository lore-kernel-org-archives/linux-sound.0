Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C6F345757
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773066396; cv=pass; b=iv7XIeX8uQG5PuZ/oxuv1p7O+4p+DXlfajdrMHwobbcUYi/MGSh4nTHe5VCbRSEQldkv+HXvgB2M0Mie5rCGC8GwTl47oD+BJjbQryKU/ABLyXIOFAMfxPtKud8fzl8g3LWVU+I/udPHgE4rtmsffh21fKOz9KS5nPuxQJGidUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773066396; c=relaxed/simple;
	bh=mpnx6X3i4s0cxTex22gG4uezFDmuSVoR68xDibWOnj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=by5GDNLUpXhiAzBY0U78Kb9Jx8fBjblYt+0qUM4x5tNZjN+MmpN39iOhNaUCglZeiMzhqBwR5gMKXru3ljz+KWPC2K99zYlwmiATBuCaJp+sUhmF9rFkTl55sgrsM1KUezAAmsUldLYrDqgNF6LaOZs9fhWn/h6/gwzKYZ874po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THtAPwUJ; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THtAPwUJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439af00d33cso8793673f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 07:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773066393; cv=none;
        d=google.com; s=arc-20240605;
        b=gqPRxVkj2J107ffvPsvGTg4A+8r68lWLG0WgBnTEuyrGT+M6FsL0SoBY308+9zWeLi
         nK76WszzI4lWNTB6mPUg0NcASsb9tMxoVLJq0+iB7Eug235khU8DreRdDNDUuWDTp48B
         p580QVbRmFTRXJeNAALO+tUcBWKoFv5+4SXci2CZ0IjDLQoDIX8RMWO1ASkWXGfjfR3i
         EjR8Uutz1mrQhslxHT/hmBuJK8huVg2GcUOBbYLqd1HbgT6teD2U0UqgFTgUeZlrVlpm
         vQ3WnUKTWWFeXugFEjsI8Ye9ZneukOM2oU8ZcZc+DhI50O9kcx1NDL1as2tYABBGxcwc
         Ld0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XfhcAZMr5qOkk1cWyKDG1bAFgnhQFcV3NHe2n+wNbiE=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=aAqyEJOyPUrGF3XlGc/EByBrQVSpcysNrm8G/PLfPFJBT6WKOKCXL3kyZ08+D+hn6k
         Wi/Yrbl7a7MJjv/3IdCVZlJREyVaueL2SQJgK3zzJAvo42WqimLdUSyafgbYTevwY8Ov
         J7XwXbD3PcLl0xCPqaBGKvu1gHkrVFWsSAhrtaondWllxrCbDtN0WXzP4ygSuyL0Pt9X
         v7hO7aBFA2jB7qhXTeINkn7ZQ1jEKQAaBM0gX5Tg8Bw3ZifMoP9Ua3x2q+NWuNGGtjTk
         zCqklO+XhPjAvHr9vG+lY6Q4DdF9HQ6UoNBszO6TTdRs86FoYK+UisvMgSQVs3iVS3lH
         3QOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773066393; x=1773671193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfhcAZMr5qOkk1cWyKDG1bAFgnhQFcV3NHe2n+wNbiE=;
        b=THtAPwUJZp2VSOMCYiQuKthZVYSHqgQgQc0xXPJ396ZaJbEejvz/sWuARAYqYnqsEE
         t4HEzIyyt+p0cERhmhJ1KXyJoBGgH2iymHMCOxmS3eKHBHwoP4c/8i4/iSbRatua2zJI
         +ZU7kLRP5+ODwuVzaKlqXi3vw7YVl4xO3KX5GFebt1U6QYeRthqBzsvWBeuyarjw02pa
         DGX8tGqW9t85LxdOrFKFMS0WfFXuEOBL1jl/+0mhcGIk6a2SxgaGZ9SpqfpcE6RTAtCi
         kwCzVNKhVrZr/o1jy12tjXXX7dbiqNxrT4w4ofUMTf2EwEEWRTAdA2NmqOdcpS/I6qDG
         FxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773066393; x=1773671193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XfhcAZMr5qOkk1cWyKDG1bAFgnhQFcV3NHe2n+wNbiE=;
        b=EYQNGUWGzwabTlpSeLFDIOfWjwzPdw9LTPaBcDoc8JL+mdlczhX9DCpoma873cL7Gx
         eAx1k9x16jiCMOUf9Ls4iyLE1x7WZ1cY+Ku8twROUltDP7jO6pqYQipu1RzcZtDTUUMR
         FAI+qxmBNkbzuDCNyhzHz/cRGkVKhmjB/KkehCDCZcnY8dAmJl+ghD9geacVkjoYAadm
         zDWepsIAWqdMTCneFP3Ehust9WLIMTTmUy87WvURkcj0n2gW7jLYc4vKT6a2mlPiVFsV
         ZOa8vBgh0IOvirkZc55hsyYex8tF8aOoXOxW5EllthttC7MudktX0ziquuXrKs1GEeHY
         sDvg==
X-Gm-Message-State: AOJu0YxTLE3u7yo5IBsmhsWuqDjoMGv5HEx5OkXl+bN6dErvdv3j9hqM
	SME1YRTAbAtwlgdm3Jmq94zU0qH1JbuDgXL2a/pVwNrwEU6GkGZbr8Dkt5F8zQqHwGVTaCRe0gF
	2/gTt0jwApQMWZ3REmVZ58aPkqTfgFPRm6cLyE+zAGw==
X-Gm-Gg: ATEYQzwS4hKz5cI9/t8afDrnrLIFVFvnadq18gh36veSJ6ZwVobRJQqre9Oujy7DQz0
	nwImJ5I/L2yaz7BGuTnsrKl/iCotNJ7o1opRmurncRXPxxuL86SvOsjq0/zRfGqMFANe2Skfwje
	06qvvejhyRMQX2nKifEEyP/JV02OPcR18yzwdWQOfd+Jv2XYoqdYKJy9Cr0yCmvOi5f6Dq92zU8
	vyraqmpCytCSzTI/xvWTcqOV2Z5IgBYLrtbteZUtRMfKEcPWjsoxQU1ppk2Oc7Hdw1dFp0SaSGd
	++jWT/Gzemw6dtjNjDifhbWKeINOg3AVcZzs7Hg=
X-Received: by 2002:adf:ffc9:0:b0:439:df0b:2885 with SMTP id
 ffacd0b85a97d-439df0b28e1mr9520381f8f.58.1773066393205; Mon, 09 Mar 2026
 07:26:33 -0700 (PDT)
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
 <87h5qpm67n.wl-tiwai@suse.de>
In-Reply-To: <87h5qpm67n.wl-tiwai@suse.de>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Mon, 9 Mar 2026 11:25:56 -0300
X-Gm-Features: AaiRm51kvbAFoYpGUcdAeWCCLbnLfyiy9-4qqKkFelYgXfAVKNx7fF1o2bj7nNw
Message-ID: <CAOKSTBv3meaMDrJ2tn-dX6agFbTwiEmUeDYu2NTVzc559zd2OQ@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh! I see. Sorry about that.

---

Gilberto Nunes Ferreira





Em seg., 9 de mar. de 2026 =C3=A0s 11:24, Takashi Iwai <tiwai@suse.de> escr=
eveu:
>
> On Mon, 09 Mar 2026 15:14:47 +0100,
> Gilberto Ferreira wrote:
> >
> > >> At best, please try git bisect.
> > Sorry! I am complete without any acknowledgment on how to proceed in th=
is.
> >
> > >> Or if it can't work for you, ask your distro people who can help.
> > I have tried 3 different distros! I don't think this is some distro
> > related problem.
>
> No, no, I meant you can ask distro people to build a test kernel, etc,
> instead of you.  And, it'd better to ask distros whether you are the
> only one in the world who hits the problem.  If it can be reproduced
> by others, they can help debugging or bisection, too.  Pinging
> repeatedly here on the list doesn't help much, as you can't build and
> test a patch, unfortunately.
>
>
> Takashi

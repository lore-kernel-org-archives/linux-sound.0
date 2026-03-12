Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73F134251B
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322577; cv=pass; b=PCi28GEWTqWwRP4T7lIC4xyWLNlWPaxTXk8c1Ag7zcBkwuBYAZupf/9aEGzNTYe21YR6OQY176RRYciqCu/p0fjRt3zKe7y5eY5KK4LcCM+8FI1XsGmF1jCddCTL8pmNI+XidwAsEy8God/aOPXhbAhOMPnJMbK0rjF6krNFeyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322577; c=relaxed/simple;
	bh=ZC1Agrejx07YScpBBr5bIbAkgOw32aKKzS+oIWVkVjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZocTb2HFx0iqaVskx7FrSCiX0JbWTwR+W21zR+Nd/to+pfjcsYBXiHR4wQcmt828xKcFjZz0BFZplItZOvzE8o06SMVpuGRwprYDVPCTybB89vqtTyw0QvgaZ+jTF+AFBO9jPEYmzpsDk8aZO5GglipcO6L5fIsDz9HIfdurDm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsmHm5HI; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsmHm5HI"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439afc58ac7so1297857f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 06:36:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773322574; cv=none;
        d=google.com; s=arc-20240605;
        b=BsG/Sh+NQXPzEmKsfXTZLGhjvgp2nyRPBW5uN/8OaCVbdnVnWWsRDkkbQ2bgS6dzue
         cCmQEH4HewSaH1xOOttvLFxRmSiFfvLCv5qkKpsudzCwwFGDBWavotYbxPdJmqrsmR4k
         Ez3t1oPcH++zxyLi9wZq9MiTTl6TbBRfW15m9cmH3Vr7YMY48Hl8jAMsyhv/TZW910Sh
         /CvZLOPt8RG4jplV4T8XNXiPX2oKTC08+LHPUmnRPya4RJNWR7rxnLnif/v32OXmmOMa
         Wgm685orUsMfo0eEVkqWYXH+z1OQ5V8WK/eAxHEVrpXiWo/4aLR7CPpPwFBzGnc4fkV3
         l59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5LiNYEcPmVnhkTpDFLg9wRo5LV1cuPc+EdJpz7uAFmI=;
        fh=7I/ZLmDt9Om+3AO9hjVEfDKt6c/Gn3i61lLOyAN9Iv0=;
        b=J7dbnQbucsKaLdsh4xYrRxn9wAy8LlQ5LDhCtMa3xFkmNQaHcsamwQWJf9ugmtTSg1
         PSeo69RRclZrSKZ8+k5CtgiGZnay78oJKgO3Ma8Ndw2B7/G9TsuB5rP9vGDIyamqxXrG
         IAZGTsOko+bTZtzVUXjKRIEHZQymhD1+mDo3OfcKaXK88pHCTNyE5sSI/UdVnu9NrJum
         zUUAlkV0MynAuK7nnMfeMGveuBp8u3aOYlHEIniSoGGuVnSs4kk5g3De1mC+TYsWskj4
         kzTru5ODsl113YMt/IAyLrcM7OD3nTYzdmcAHdW376ScpyKQxrZnZfPXQIkLxasiQ5w9
         JBQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773322574; x=1773927374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LiNYEcPmVnhkTpDFLg9wRo5LV1cuPc+EdJpz7uAFmI=;
        b=QsmHm5HIZn3nK3rqfztfrGG4F44xDx4HiYp3IhUI6xUAxaZmh3P0Z3b8sIyGrqNJfE
         ZfoY6e5kBBgl31gmLJD7PQZ21jwKeWoycWCUMes7i6y9KD4NlWshZnH8NWBhX34IfEoM
         Pu5aCaqC4AacqVHdyOtEhVwWVVC9eJnAxiVAAwL7a1vQ2IFjjWbioBRC0EK6phcYsaMh
         qYSKe6CZGVQSjw2Lruiq/6LM4gPKQbtyYoR2rKG5++dKken0T/3gE9e2TptElP++wmjt
         m9IqlL7jx4uQHpACRls1HcXBl93LO6OrkD7rxGNw6lhQ3oOKR2dN6Z10/PzydJKa+z1H
         87GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322574; x=1773927374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5LiNYEcPmVnhkTpDFLg9wRo5LV1cuPc+EdJpz7uAFmI=;
        b=oROoZ1pYWHcfXLu0rstVCuOeLWp/1w4pnXOHg6ukJosUgaZ36nxC7jA8ZzdDco4KJ6
         wVNZSnbKDciTQ6ZuYf2H1u1F6LT476Ab6Of6s66apas+WbGQvFXVZhxg3p4YRPCt2iow
         q1LdDdfM8DE3hXulQnr8nnd/zYm1Ey3Bb6iT2X26nOola/9Xk8giEhzcAo5gWQa7SfYr
         5vTaehqR2WVtJwajn8jch1FPFQ1x/+jmMzW05qsVZwgylyNJ+HA5Qcpod7/cNe1lpCWM
         LDHHLGoOumAPFW9JLKLo9Cpzyp3NttzzAyMozLrfrQ/QULo1RFobhmfqGnifLD4M5H0H
         GwCw==
X-Forwarded-Encrypted: i=1; AJvYcCWWf+OTh1j0R8TeqZLaGtjeQy0oJ73ixcRSzOzdF04YZFQ3jC3F67Zudl1rGnNSwABpyEUkQib592puCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAn6rBBCPYtZDmMoTh/Clwj54SGWZFEPStFWNu3tzhzZPLHE0t
	DkVirYnaoUyw4lzWlm4zV+L3+auXMSdVtR/trQBOxn6MufCNQsuH8rEcXiRkFlzr/ROSdM/pF84
	KB5xUrkaPLvdZjDWBCoUckxZl8G2ntOc=
X-Gm-Gg: ATEYQzwPw7lz7RBgXggyFKswvBS8vXkfRK3dQvyzewjSDcKfOQMJyhgn5YUqEbV+z2j
	XpN/acxYdns/C1y6Q65sFAc4Wx6Z9LUWAlOQluQpOzBQHisUHHqlL/DZTDHuz9QNNrUVjuVDD8N
	WiavYzw+aRA6rTFhyyO5uCeBEzkmXojSkKQeppCkHbaUErDPuWGZTFP+S7cQWyPjlZ8NSrZIiNV
	16XFDEE8zBdqkI/ZEQtg4iqcd29GL5tvNn3tnGf6eIxAUV1g7Tgg1LGo4YiK12rw1oLwF0klMdV
	wr7hXonRQwCf5p2HQsF3PYInvYr63dYDbPmHh3bw
X-Received: by 2002:a05:6000:1acc:b0:439:ba4d:bf40 with SMTP id
 ffacd0b85a97d-439f821fb27mr12938287f8f.43.1773322573935; Thu, 12 Mar 2026
 06:36:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
 <87ldgakvsc.wl-tiwai@suse.de> <CAOKSTBvbopXOuOfstmasijZgUnT9_qW_dsaeMcHUXhyjj3iRmw@mail.gmail.com>
 <CAOKSTBsWiwwwrmBt3dshrYYo3fQN9eF-gi2Z7BoX6c-Nb3ZoHg@mail.gmail.com>
 <CAOKSTBvND=d4Fq7mt=36p2Y+hKr6aDUbJ6zA4wDOWASwcWjmNQ@mail.gmail.com>
 <87h5qxl8tj.wl-tiwai@suse.de> <CAOKSTBtQi6ZmLmy6u5mP9_gLKZTZHmbb9S36hO99xSsk_EEbcA@mail.gmail.com>
 <87ecm1jii6.wl-tiwai@suse.de> <CAOKSTBtdt=enKSv4ZF7VxDD4QF8+ntyFM5CPJ1Y1QQ7M6TsiKg@mail.gmail.com>
 <CAOKSTBuOV0=1Y62sqf3QALgR+_He=tKLPQ7LZN+xFC6oGWEKVw@mail.gmail.com>
 <87y0k6whm8.wl-tiwai@suse.de> <CAOKSTBuUnS=stepHySGVYH4GbQytEQL45cLj4eV8u0KAsquF5w@mail.gmail.com>
 <87jyvlm6w0.wl-tiwai@suse.de> <CAOKSTBv102MCFnnm9JPp9Zaz_MQNBxu5OnWOCGw29MN7xLbXHA@mail.gmail.com>
 <87h5qpm67n.wl-tiwai@suse.de> <CAOKSTBv3meaMDrJ2tn-dX6agFbTwiEmUeDYu2NTVzc559zd2OQ@mail.gmail.com>
 <CAOKSTBv4GHxQGOhK2NR6QsJERsWSoh6RMp+yv-cV7QBsSgx9iw@mail.gmail.com> <f701e9c6-51d2-4388-9162-f02393d6e8b2@leemhuis.info>
In-Reply-To: <f701e9c6-51d2-4388-9162-f02393d6e8b2@leemhuis.info>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Thu, 12 Mar 2026 10:35:37 -0300
X-Gm-Features: AaiRm51s_oFy66ESvTdjN2WKqy3d5UeJXzbU3KDSFxjaUudrSkvEvBMlQStow5c
Message-ID: <CAOKSTBtF9LPtFktAF-357RT_w2bWW9Xg7NimQsizn0VwmR1DJw@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten

I think this is exactly the same issue.

Thank you...

---


Gilberto Nunes Ferreira



---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram






Em qui., 12 de mar. de 2026 =C3=A0s 10:24, Thorsten Leemhuis
<regressions@leemhuis.info> escreveu:
>
> On 3/10/26 13:32, Gilberto Ferreira wrote:
> > I am sorry to reach you again, guys, but now I noticed that dmesg shows=
 me this:
> >
> > amdgpu 0000:04:00.0: [drm] Failed to setup vendor infoframe on
> > connector HDMI-A-1: -22
> >
> > This never appears in the 6.19 kernel series.
>
> FWIW, there is another report about broken HDMI auto with amdgpu here:
> https://gitlab.freedesktop.org/drm/amd/-/issues/5052
>
> Might or might not be the same issue.
>
> In the end the problem remains the same afaics: you likely need to
> bisect this (or hope that someone else that has the same problem does).
>
> Ciao, Thorsten
>
> > Em seg., 9 de mar. de 2026 =C3=A0s 11:25, Gilberto Ferreira
> > <gilberto.nunes32@gmail.com> escreveu:
> >>
> >> Oh! I see. Sorry about that.
> >>
> >> ---
> >>
> >> Gilberto Nunes Ferreira
> >>
> >>
> >>
> >>
> >>
> >> Em seg., 9 de mar. de 2026 =C3=A0s 11:24, Takashi Iwai <tiwai@suse.de>=
 escreveu:
> >>>
> >>> On Mon, 09 Mar 2026 15:14:47 +0100,
> >>> Gilberto Ferreira wrote:
> >>>>
> >>>>>> At best, please try git bisect.
> >>>> Sorry! I am complete without any acknowledgment on how to proceed in=
 this.
> >>>>
> >>>>>> Or if it can't work for you, ask your distro people who can help.
> >>>> I have tried 3 different distros! I don't think this is some distro
> >>>> related problem.
> >>>
> >>> No, no, I meant you can ask distro people to build a test kernel, etc=
,
> >>> instead of you.  And, it'd better to ask distros whether you are the
> >>> only one in the world who hits the problem.  If it can be reproduced
> >>> by others, they can help debugging or bisection, too.  Pinging
> >>> repeatedly here on the list doesn't help much, as you can't build and
> >>> test a patch, unfortunately.
> >>>
> >>>
> >>> Takashi
> >
>

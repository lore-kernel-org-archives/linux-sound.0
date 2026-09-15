Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABDF318EC7
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435439; cv=pass; b=nJBM0/3Boxp6pLlvVXqlyJs+637Dr1h3zqnLvuOvhhmfmGahPT0o2fF0vrnXJAksawj/DLdPJ0t3Q2HH41/RyztvViY462JgMHV+mNJ38Q/VPBqQpfKt8ysKqhod9rSb4uWaUzBeHCxRDomtrueakCNvRXRr/FmaZiu7SQ6FXsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435439; c=relaxed/simple;
	bh=A5UoK2kb1xkEY0f9fIegjJq7KUgHwF4qoCSG3hEbKmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0hMVINXP+Wk7WNs2KL93nbG2CXFpNfAY+VFzXtsHU7QdU3NSREyEfYW4tBkr4borh0eV088+QHYWlfZw1pUHWuk9HtHkHOjwRenJY+24JEEZPPqPa26OArnRYgc7cxiuIjE1a4oTkI/nHOAnwkBpQZ7npGu9GjlAF6KuFvmY34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bmSPLuXJ; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bmSPLuXJ"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-861a2ae9c51so36454117b3.0
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 18:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789435437; cv=none;
        d=google.com; s=arc-20260327;
        b=I1b/JpJ+GRcZezIweWPjV3KnAnTb9ljOt3zatwQBAzI8LyyyINhZyav/EjJv3CgYJK
         oL96h2Zve2Y5xlSiNFNox+SfPtusJHcBYMIwJAGe5RkWgncBwPmHJ2J+e1Q2pGdbc13p
         UOV1Zef/lgfLazL9a3QiDDXilmz3g4fWwK1QqObSN+B9HlYEf9fZsDDI7zQvk3HTu5XB
         FlnTVtbMcmY6iQXtl0VUk9ONkbhDBNWEwFq+vCmopwaQO5xatsFi+wZMZuE5jzuNKNoJ
         QK4yC3bs9D8lhL30beDChnWpDK/J2E0Nf9MCtDkv0Slnvxaq1g88KZF1hzZj6w9x9xP2
         Pvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A5UoK2kb1xkEY0f9fIegjJq7KUgHwF4qoCSG3hEbKmA=;
        fh=m1ClVrZAzckcd8M98VgFHTVGONxKIHFrPdCSmZGQ1dA=;
        b=j+ws5pdeeNXdia0rUnH5akmkzXyI1kcWcHiC8TjEf05oRz2QJGV8XvxEd9Qr2+X5Ar
         SL7lDHLfdDB5mB7yOS+WP/0jXNcWT/2Z7g+AX89ZwRCOVCtPLs1tjS29/bdD42V8egWE
         ey041nIEFicQ4Cj1QlPbkZhXXV1hFd7vl3Yd5Ygw66sr8Fah8JT50+FzRIprqRWUmGFj
         bywrn/TVsk61Venbk8eW9I/J0pcskRfoeI1xSRLtcr8CpUh4a/Q9nG0lqJTK5td25RJR
         SgX16B4XhWkgxu41h9HAmoxCvEkjoCaJX/K83KgDIS7070lrvxOBspEAyTyjqmGp/L7Z
         X2fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789435437; x=1790040237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5UoK2kb1xkEY0f9fIegjJq7KUgHwF4qoCSG3hEbKmA=;
        b=bmSPLuXJTs8HlDvm8UF7bBl7DJgVVl3eX2shE01epwK3kx5dQ2B+fl5ZvpnaN+rEE4
         BfBSJ3lH6ktdyV3SG42DilwC0k2HaLdArZP3J5IyycpxKrrPA2siFA7MQGkjNhYNiXXT
         8jkLgFGqgMrwWEQZIpqO+ejohku+EqwE944W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435437; x=1790040237;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5UoK2kb1xkEY0f9fIegjJq7KUgHwF4qoCSG3hEbKmA=;
        b=akDUJkosuKnAng+Wmu88h6cnEZMTVogUqN7srzbLUh0d81FBsGvIXJbsECkC2FLkxd
         psrLE2TT8II4FMRFvULLu/RV4nf/kD7HzhgRhBS+yacUSVhl0hYkP0xU8VNq9kC80iNF
         2O7Kv/PnQIRScWRp/p5hiYH0ryTy0fGchJ4amzzlPKnIxGfaq6+zFc4rj9WiU6FbIkTg
         PiiVlAp2GLAKeG2gNmDJ844S2meUBiK3FKtFbikm2k9PxG3Ajpi9Y0Ws02/hbHUx1uQg
         /Um0rq7neuLva5TLwLvi+AaT7dE6ePzqGACPUBC+D2XRLDqbBvKdxSxnc7OfC/Ubo/8r
         LzxA==
X-Forwarded-Encrypted: i=1; AKwUvBy4QiYQU5qLhbYTKPQELVurL/PhXaYCmSsJIYDK/QsFiloEWdTa9makB41dhYmz/injPaHabCk00Mly2g==@vger.kernel.org
X-Gm-Message-State: AFuF++nPpn5Mjfz9T4fq6BemeIZ7JMVwCTxfQk0jSiqkqhczDoTNggNO
	SjsUmjRTkQQiPzG2VmLYvUhzt+CpAIomWIOWKJkLg25CXXNzLf1KFbh8jbkXtr7YxdAJkQlNQ4Y
	2b4z8dh9vi3KV1R1xU3PvF4OrqZCErI63GDN00V6o
X-Gm-Gg: AYBFou1sz2h8WK4wRltBiQ7oaMTIaAjN8ZXamgQ6Gc4tGqr6Hc6kq2LH8cyO2m5ksOd
	4sKjxRqx7/Dm+lSFUtxomeROcWS97CfTTazvvOgM46eCBxYSCWJmD2RdvJI3oAQkhYaanMx5IDV
	w35R+E4I/n7IO6jA4fk8q6AyCQ6uJcpFCNvGqjSwkikonjvB2LZvtDfzSOdFwTZiJeP1vtf7GZ4
	AyRSDxnlFMYO+dlf04kw1fHb1Pk7weGjVNZXOUZ1c1ycxtVRyAmlRfQjlQnhc5U8s/etCONDvHO
	XmPbVvzl9VPHoZmkuIiE+bEWUYj/3IOBAiMkOms4S39hWKNUHvjEnnV2
X-Received: by 2002:a05:690c:31a:b0:862:2e2b:8639 with SMTP id
 00721157ae682-88d22ed03f0mr20767597b3.33.1789435437168; Mon, 14 Sep 2026
 18:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org>
 <6cebda31-08b6-41e5-9335-a40ce2744d29@opensource.cirrus.com>
 <CAB1bpFAXpjRYgc1aeCZo3vhbRq3zsCL9HjohbPk-ESx_8ia5JA@mail.gmail.com>
 <0921e5a2-f8f9-4802-b40b-ec332b1aa4b4@opensource.cirrus.com> <001a01dd299f$5aff42c0$10fdc840$@opensource.cirrus.com>
In-Reply-To: <001a01dd299f$5aff42c0$10fdc840$@opensource.cirrus.com>
From: Steven Kendall <skend@chromium.org>
Date: Mon, 14 Sep 2026 21:23:45 -0400
X-Gm-Features: AcwNN1UVshfbK9Z0ZQB7xd7ceNwFMzndUKjY-_AUYjnG6aBh1KikGWunGMZWEFQ
Message-ID: <CAB1bpFD1S_u6qfa1sGPbYz39DCzSqQjw_dM1erzMdf=_1M66Eg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
To: "Stefan Binding (Opensource)" <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> We have retested the hardware using Ubuntu 26.04, and everything works as=
 expected.
> The behaviour you describe where ALSA doesn=E2=80=99t detect plug/unplug =
until playback is
> expected on this hardware, due to the way the CS8409 works.
>
> As for ChromeOS Flex, do you have any instructions for us to try and inst=
all this to be able
> for us to test this? Is there a particular image or version we should use=
?
>

Apologies for the delay getting back to you on this; I got pulled away
to some other work. To test Chrome OS Flex on the device I recommend
using https://dl.google.com/chromeos-flex/images/latest.bin.zip (which
can also be reached from the Flex main site, albeit with one or two
more clicks than would be ideal). I've reproduced the issue on that
build: audio at first only works through speakers and headphone
plug/unplug is not detected. However, by closing the lid and opening
it again (once already logged in or as guest) it fixes the issue and
plug/unplug works as expected and audio can be heard over headphones.

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793195336;
	b=SNIORLbM3Z3w5BnYTlLMCOJNXdeDPszLy2n4woJENAys0niulgmYEr7hITZChQtfZcuN
	 oVipzHiYlkitYlbC4I+5da805YMzA2g3OdIkFtvs9DcXsWbg9MvoCuroGz+wXInX4S/Y5
	 R4ZONPyS53BHhhhxWogi3eqvLUi8RKGNTFvIPVlIWZr3gPxZ6Ue0c9SgCw4M/CvVOnSTR
	 Exkutt/Vs08ehAJf6bn4W+NwLnJamcayXjqRxiz4aq0lhRRWWA+q7oDOinbmypu3ebdYX
	 jQHeaLf07vIu0OylCX2NRmSPapcwGe+LH24A3oVqLFHjEh5Hv+PXYwITYd65SG3R4Nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=H2ElNqX5XTUjjb8trwJBpunSbb5A2QKbsK5rk+KfOBw=;
	b=JLGaTYg1Dih9Ratq4/7T6uySt2Wu14B7iH0OkTUCRDnpsG7NHt8REkdaRv7IXJiVOqHu
	 /PCCiZIRn4mBJWSZ6foR2gxd4dI/V8F3Qx45tXyknf50VrsirlGi4dtNuAmkntJqt/MdP
	 rTH8ehUk/ROGppAst0ACQkMMJ7/K2Npi3Rnry2lA7/YhPf3wuEeNQfRdSKVDPdtqPbco7
	 CDnEblQGtYUPoIVP/UFUnas5wEx9uPFjhPt6FN4ByrUfsRQcJwgVwiWofANC0RG8rvayj
	 FEgB7Q9iHFnb/bT47RZjYGTOWJIBfGU2jYvsf5Qbx0cK9qzVO1GgItY+yTH0+IQtKrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yS7dk85O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC43C606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 13:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC43C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yS7dk85O
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e63ee7b4cso114522085a.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 06:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793195334; cv=none;
        d=google.com; s=arc-20260327;
        b=RzJRWwVxC9RJ+idr0LTVBhzZNhLdpGU1WfFOv6O5UXB/uPf7JOBKlnT6CIgjyzhx7V
         VUUC59WM7RZ8Yj6jt4WXsbB3rdtHmhdykjzodtyU3ZqzFtsToGDZDHK15/1oO+u7HKwl
         xtTqXVs2aqwg/eaKDiQXG+nxcPUjYC+jWhkx4gyyhYjNFQqkNvd/JtdD4hGGZ2MmkolN
         wh91sI+/I7HPFf9N8caesWwwQivnJ96oYPLcWycUkw5oprWabzqgY5gXqwqVi+53vpCH
         PpY1fnyflJWvX5koC+8xVehcW7T/Nxs7fG6hQMN3QrYqFHj2tamj/Y5tvufAq0rGJ5rU
         FCNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=H2ElNqX5XTUjjb8trwJBpunSbb5A2QKbsK5rk+KfOBw=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=pygQgPa8srCXEjyC9B9XKQxG+Gl711guY71EkAaC+4JdlOufJF47HENBhou0aRqgQu
         JjX8c9BOhQwKi8TvpkZ4HxAzACn1QYIHyIDuy6ZyjxWwg0OexRZGrcg8uJXDfVOm4/yI
         g7A6hc2BxmLabLnW+13Oasj1A6CsL91s7dU6f7zpRPg89o/RmcloVj+wz84qGU4NsJq+
         o8eDXStq6TB/etwzVOpc1auFHm+RZdhYpYRWzkLrg82eo+4xYnT7iXqUM79Nd3LwacYo
         rO1T2sYCwrs+FaktMkFIv+kukzSqh5GFJjXjbefuYhCTNzDsOxvdUygUyvmvldMUOEkD
         URCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793195334; x=1793800134; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2ElNqX5XTUjjb8trwJBpunSbb5A2QKbsK5rk+KfOBw=;
        b=yS7dk85Oo8CZOkPnVbz42RT5ZeXkqeHk1ZhRP50JzOgz5Rs/MSbE+484g4aS6neRaM
         z6M1WyalrstL59XxuvGKNBiABHfYdp+NkFqidjuHExpNzea6yzFBZKnKD9D4HnKr81vx
         1e81Yi3I5PYh8Rk1/CFaNsPqXEBfC/9mHJOg3HcrPL5YNzLz9SgEpNmIIzGA9yYZsKOg
         mvCLR3sccbwq1AeyNMnsEHII1DTGPFyLAGG09MrSmAzqWAPmxoskLgwFxr5GLAg09Dc9
         itYYvLBYEazL8+asEpWrffprFP9VgjYzkeA0eHeTF9ydjKDjFt1RTCA72+3czlPTk9Hw
         8eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195334; x=1793800134;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H2ElNqX5XTUjjb8trwJBpunSbb5A2QKbsK5rk+KfOBw=;
        b=0wnZWNaIeEWXi6cZh9PyQVDvDzg5tikfCjpf6FEMIu635JLfar9ftSxplwVmGddl17
         AjLZWnR2acTdqMZjKUFD7U/U0eOHOSDxd9LBArkMVJgkGRoJxhHysRomUR2BtT8c5q+2
         uWHXPyXCdncsFLPLMReGS7NDujLn2t8UqNPsgmK9lTrG0jdSC+oCgtV56CbLPhMrcL5a
         nPgv+2/X0kOsSYGegGWWyCuKKzWNKYZBPaZBNf8+Qtbxs+fAQThHKey7MQ9F/CF/1Zqn
         pivz+dNsjDmtvFGWq5pFjqO5QS9MxjEzQByI8EC5XshK0jgLMFGUE/w7o1zfI1aDbMK6
         EbAw==
X-Gm-Message-State: AFq9FYIhfydeJuosNqI6WHnrv0+mhlRoYxBkZbH2nob8YDHqKPKlQ28M
	7Tb8jZ8rYjTMrjkfiu4yurjig+Wvj6mk4Rr9nkzYk+lBKpXxs0fjBe7cQkbU2Oza+cvWR4XxbNR
	Ypxr0LAol52YzVeySTIK2RonWkYORsDI=
X-Gm-Gg: AYBFou0Wrxdq5Q1SFg6Eqe5WkGcReT9+OqHEAWWUat/Vr254RepzmfOf5s8Ci4K2EBq
	jTraznYAW7NR3ao32kGTzkFTbJs5CAolfIAfg/OO5sMOV90DPcoOV2gob4vLCLFMFwZbo8AgFZe
	BThmLJHGvTgGlYI6nSk3E3KtaNRKUw0CY2W2KRNIOzWpm2WE8hbski2rwEJUfYzMWj21wQvrWLm
	vJDOXO0pAHcjNi5lNqHI8ZFVcJcLe2pkkHDad8h6lSAD0Y2qmg40vRYQXl5ZJrtD09BZE9TEMd5
	rg9Y1bHlbPkmmsDpLdxfYf8M6mF9mhMZ373oqlK1lAJtO/ObpHTyJ49zOa4Y77VD8rBKzbJnVLO
	Ufz+ot+RsYoS1iYuZTDEOG4RreBGowHsGHbKMxB8OHjAkDdMRjXtyoHjBHTbfvh9x4KPDpb5OBn
	IKQvNx0N6g9mbY2wg=
X-Received: by 2002:a05:620a:2556:b0:93f:568d:ebbf with SMTP id
 af79cd13be357-94408de7920mr322434185a.75.1793195334520; Wed, 28 Oct 2026
 06:48:54 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?6rmA7IS47ZiE?= <shsehyun@gmail.com>
Date: Wed, 28 Oct 2026 22:48:42 +0900
X-Gm-Features: AclHuK-i24qIjSvagYDECyYSX8U8mBwtr29Y0YuufAyT0sbUcuoqJedP584OELk
Message-ID: <CACH5Ta1O7g5DHXztxg+XUOYadpUxkUbFoNcs=-E1uS7L+KByDg@mail.gmail.com>
Subject: [BUG] ALSA: hda/realtek: LG Gram Style 16 (SSID 1854:0492) needs ALC298_FIXUP_LG_GRAM_STYLE_14
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

The internal speakers on my LG Gram Style 16 (16Z90RS) are silent on
Linux. Routing and volume controls look normal and headphones work,
but no sound comes out of the speakers.

Hardware:
- Model: LG Gram Style 16Z90RS
- Codec: Realtek ALC298
- Codec/PCI SSID: 1854:0492
- Controller: Intel Raptor Lake-P/U/H cAVS (SOF, sof-audio-pci-intel-tgl)
- Kernel: 7.2.11 (Debian 7.2.11+deb13-amd64)

Forcing the existing LG Gram Style 14 fixup (SSID 1854:0490) with

  options snd_sof_intel_hda_generic hda_model=1854:0490

makes the speakers work. Both channels play correctly, and audio keeps
working after suspend/resume.

So this model seems to need only a quirk entry:

  SND_PCI_QUIRK(0x1854, 0x0492, "LG Gram Style 16 (16Z90RS)",
ALC298_FIXUP_LG_GRAM_STYLE_14),

alsa-info output:
https://alsa-project.org/db/?f=dd24308a19252d37bda7b5553e72de074a2ff86d

I'm happy to test a patch.

Thanks,
Sehyun Kim

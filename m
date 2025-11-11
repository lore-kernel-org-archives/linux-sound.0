Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9462130649C
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 02:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762826413; cv=none; b=BiaQXeUXEMM2M727ryvrpzcLyUgRD/ko8wFEE16f8KHa9WwMVbnltdTfaQwcTLxwOgyn1SCW68mJ2c/cA1mMvzjBiUpQfCFOXzQTFNlcU6Kqc1QymcGsl0rrqUB4ri/0Fc4OF8YoKGzcD2U7S7yPjETb1CADZ24G30X47IkMC5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762826413; c=relaxed/simple;
	bh=1JGfOj2u5jUcqRu2eyzSWFIfgFG0OpFssDocNLWH0ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMXLU/SdZ0FNZ/Uvc3SuQS9VMLXa8mlX0bQ97P6xLUUA0EFjBpsyS/u9d1EaF8m+H49pqwQviE/y5keQggaEZomZb6KEZn9x8aNsZE6jEucRkPRpCcB9ICt8ep2A4GGYSdGIwX/X2MDZVdfjYXIq9UvrwpD33go+3t7UMEpM53Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcLXkrN9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcLXkrN9"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b427cda88so350429f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 10 Nov 2025 18:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762826410; x=1763431210; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1JGfOj2u5jUcqRu2eyzSWFIfgFG0OpFssDocNLWH0ns=;
        b=lcLXkrN9XAhA0FcMneCG/VerjdhmK6GmOxJIOiM74om3unhsGaJUS3Dl9RwzePUPaE
         ev994qA3BS/0djCoYSv1RfmFq2P8muiHQkXlbVChY/MnWKWGgpyBxbnyE4yQVrEuFyS2
         GTGHGxdjIP7zLYj8nPRp6Wofc4AMXF7uz0bkAnVAymUZnMjeheOrNwp9H8EPqXztdF9z
         g/vQi47tcQR2RzXOxMqr5Huxr60OfbQr0bXtepIx5RdzPNaBPFzTiJJD187iGjLB372U
         xg6Lh7u+XtsAHkQ3hwue9JDlL5VfzKL1MaR82yE8ryILRwamln/7G/576xNxX44sAhbj
         gKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762826410; x=1763431210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JGfOj2u5jUcqRu2eyzSWFIfgFG0OpFssDocNLWH0ns=;
        b=RKaxSQ6OtZNEWAdABBC6hkU6BXSF8Yc7NJPhCc4Dc0WjJNiyXu4JxMpJRFv8Mc7Y4k
         mgCI4sUZ6vwF5bRLMWXAzaZoMFD+fd3jKtMxZy+bPhDvdgpAEQL4e2gHzShglt1SHzWk
         ZDi6NXm+vWHII/5WFRHgp/SY8ZiZqjWA/eTKnXFw6fpsJ369ddvQK6PggSctc67CNytv
         0wrASfG/Ap4a6So1GkK/3AALw2qyVmHfATapy03+ayB16kiHCBrVz9jUTARrNfZQ9e5v
         57e8M7StHc1xka+UXPLOoK9G2+S7yx98/WIa4eMq8SrEIswz5BUx2UZkPXjuDKdUziT5
         Xb5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeV6YIIBdGuT47tNzyzKhsSR2M0T2Mn/stw6XcOAP0feSO55TFjh/bDEJWAMmjdOjkx3alieXdLQCimw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzay23Dm2U/4zIbg4ymYLzQLTpasYsGRlZYXutYfamphwDiK83s
	UzcP1Bkt8NzdPw2s4Ipno7ExFDbfcwUxfsEF2Q3Ogc4GcBTPnXUIrGrNAOIk+KFnt1Mz1EUuUcB
	5/JDVenGlSawhjAleuVHMRfpA7CJ+cIw=
X-Gm-Gg: ASbGnctu4e3yQVAAcQyKIUuOlERY0iWfi+A1wxoKjDC40gw3lurP5I93bnNPchHollv
	Z22Sl0H2Dc5aBDko3JdY5DFjjYyZC47Dio7sxosjhkAaPu3H55fbXGeexEIQJz0dqB7FjHxvWXn
	F/x4XtS80rRapmTGM/v55zgi9HauT/C1hlW7z9oeFVgMQY6V/5ABwH1R5QpdbeyEVOoKWGg2cTQ
	vTtCkEqFCzbYNmVhnuQMpqAsBkga5RRJ6SNiNfZYmEaYb4r6iyYEabmL0ZfyTet2wy2DgTn4U/N
	i1YoFwEfXEr6dLx7OhnthxPChxZc10IfRSRKFemAMWCX/bLnCofUU0SuUwWwzjiMMn9C2FI7l7k
	=
X-Google-Smtp-Source: AGHT+IHdzeUCRfRm2M3JLVLCfmUpbNDJkdXF6cBlJJVtOjdev9N9wpa7IojmZlK6ySR3xDYbcIQXtAMXqpgvL0kJ748=
X-Received: by 2002:a05:6000:310c:b0:427:8c85:a4ac with SMTP id
 ffacd0b85a97d-42b2dc39158mr8864208f8f.47.1762826409780; Mon, 10 Nov 2025
 18:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
 <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu> <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
In-Reply-To: <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
From: The-Luga <lugathe2@gmail.com>
Date: Mon, 10 Nov 2025 22:59:57 -0300
X-Gm-Features: AWmQ_bmkQVFF_-Ouaj7ZbqnDQSjb9J11j_X9uoX0YCihiAVIePZwZDN4iEmTHEc
Message-ID: <CALvgqECiTae_zUmrJ8-i9Gd-XENBYFpkpxCo_6DxL+Ct7GUEvw@mail.gmail.com>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Terry Junge <linuxsound@cosmicgizmosystems.com>, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> If, I mean it's a very big IF. I wanted to have this device with
> hardware volume control working with alsa/pipewire/wireplumber/etc.
> What would be needed?

I realized that I also needed a way to query the volume whenever was
needed to implement it in a sane way.

And I found it: 2eaaec66 0000fc00 00000000 00000000 00000000 00000000
00000000 00000000

Query volume:
`echo \
 "2eaaec660000fc00000000000000000000000000000000000000000000000000" \
| xxd -r -p | dd bs=64 count=1 conv=sync | sudo tee /dev/hidraw1`


And the it works perfectly:

Quering with full volume:
ffff8d49fef1ccc0 1029983421 S Io:3:005:4 -115:1 64 = 2eaaec66 0000fc00
00000000 00000000 00000000 00000000 00000000 00000000
ffff8d49fef1ccc0 1029984020 C Io:3:005:4 0:1 64 >
ffff8d49512cb680 1029985012 C Ii:3:005:4 0:1 64 = 2fbbec66 00021010
2f000000 00000000 00000000 00000000 00000000 00000000
ffff8d49512cb680 1029985015 S Ii:3:005:4 -115:1 64 <

Quering with a volume 2:
ffff8d4af3d70780 1130255084 S Io:3:005:4 -115:1 64 = 2eaaec66 0000fc00
00000000 00000000 00000000 00000000 00000000 00000000
ffff8d4af3d70780 1130255438 C Io:3:005:4 0:1 64 >
ffff8d49512cb680 1130256427 C Ii:3:005:4 0:1 64 = 2fbbec66 00021003
22000000 00000000 00000000 00000000 00000000 00000000
ffff8d49512cb680 1130256429 S Ii:3:005:4 -115:1 64 <

Now I have sufficient data for: query volume, set mute, set volume 0-15.

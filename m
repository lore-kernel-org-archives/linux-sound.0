Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ECE280A5A
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 14:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776437066; cv=pass; b=CCK5OhIDplbEADs5IKanBM9ODfT/hQ/jTjF9IBuUKLna+MYaqH+1ltTVSHDaKIvwdYj4hnuBgpnZUoqJYfwUgMAW3BTLvCCV4llc3EJdt8XoplV7HrpblJJwu+tidwrvTugfqoOCxUIfJlOc52eBTrTmxAeZ0umqP0OZ7z4TDfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776437066; c=relaxed/simple;
	bh=RvZjgleGuZmwgvhgJ8Vxd86Xkc62XC508140/KU6t+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8NxnrG5pz/CrHsQgNGHDY0+ZikBspArooKl6gjn0SvWSCe4OZyeevty+iHdocOK7wLxW9HVVTGSBY6BR9fIepIeqNugcWl6Wv+r3pWZ6RU8w5pThff3qQnP81ezF5tNB+Vi+YyRqPUn9jm0jouxjDjkZMtgWBaFpMUfeYZ1X5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyiof/KM; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyiof/KM"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c795a47186bso353206a12.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 07:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776437064; cv=none;
        d=google.com; s=arc-20240605;
        b=kHuFhQ1VN6YKY7/iMfgm/abwJHpWuBaseeTD5n9MW5ReK2RjaTztvE+dgZUzQ0bpnB
         OMBgqgc8GaPGTjswdjzUhnn/p+YvazK4tv5lkqLlkKGP+TX9d01xHy544r7Hb3zdbO1F
         5/2Dr5fmr3+2iAmMA+EgF34ciaa5htPB+Eu7qJEVWj6ZB5yTulmjujYY9DKv2kr5I8FZ
         c22blUu9MmwMdnPoVj/BASbPxAsS1w4p6DawowFWcBSI2WgqrNK6f4qeQ/uJlskgjMqd
         s2UUqdMNpywmWE1Tuz7pVEtHRxyQdWlVfrSLmp/Z0HPifuthO2FLyO0BYo6ATbzkSaWW
         ANTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RvZjgleGuZmwgvhgJ8Vxd86Xkc62XC508140/KU6t+c=;
        fh=MI5gN6p133D19LW4ftTWaQ5T6Yhz0tELiBNUIMAmgFM=;
        b=Hw4efENUPkjtSX4EdOAPjfN+yaBEriOz+vO6rrowbwRdTONiAFB1MFzo0Peeq7CjoK
         UDMK6dqcOb8oDguMs/VDoMNQr/tfpLa6OLCeXh5b1Sz1c7ek5rKGOZvE/9p+IEj8qy0+
         D41Qy3OjIOAnwof54dbrZGfiWZVRmgEGdrrQFmsZEJ9Mdyh8rrx2whBHUC2jZ4QsjitJ
         9ZYtjqFj7oZEX+Xjo8eK0xEdvWr6UqG4cYrPqiLFBWH14eQrJlCjh7zY/qq5x80onMkP
         SRXfLgIi4H25dqgn5u8esfgLVQFJ+G4zqR3lNux4Bb2zaIXw+1JjRBS+rclZc8fofnIi
         6j3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776437064; x=1777041864; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RvZjgleGuZmwgvhgJ8Vxd86Xkc62XC508140/KU6t+c=;
        b=gyiof/KMfniQ+vBTz4M+I+0symhU8LwM3NyiRxFYpTOz3jWQjiibj8RNFT/fIjVJRO
         dxLERqkg0xfqe06ESeiA16riFfZhoD553zUfNTdhsR7S51NE8FyDMlstdMLZQSsWo2kY
         XVfDRkCFLKfPLHiqUQiYFS6vDmnujQky8/vKBp0Ht49KAfediXRWRDHcdcYPfPh932xo
         2knFi3L2jWxPpK2N2V4V3UOxejzlcC3J0y+zmFtxCaKYQGtibndllI0MzT58Scs3dDEr
         Mzr/do4PGuSLZj7G4CrCnBc9xmR3iHQA3JL/QKikp5DOBobQTpbF1KAVbeTkt+7ad1oO
         yHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776437064; x=1777041864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvZjgleGuZmwgvhgJ8Vxd86Xkc62XC508140/KU6t+c=;
        b=gRJ7a5ylb7SpTO7G7NW+TnC2mtjKRLua0l4tp98xOI17Pg++hOlueHoOuP2CAA4h8U
         vF/bXfbxUqL+sxvDkqKE7ppzRb3irP+GiVDV+3i5u1Ahk7uj/9zZImuzFMmMqZulQh4f
         HdstG44PyN6zGAEC82FPvRCIPyhRZRWD0wgvbZnifB1t3roE57GW9yO7X7BGQPoftYA/
         Q4bqoULjhhqEm8MFjEce2gWYJFDrYU0YRUMDMj4lc/g4rhHIchJizU8O+oAqGIDhnbFk
         0XIE3sqyW0pQcFNbBVFBVEhe8WjLr50dLol98C3QsFzjc7AEDWZk3zmJG9rTQNlHMBQn
         sdfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Ce6ZfayuK+S5n7Awpk239BiY0zzpSqpl5288chq2iXFKrx2CL1mEuPdAieofK5I9TXTnm4Zei+zSqDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+eSKWhJ8UgfpOpnV7z6QJdY3qO7ylN8jTAI5a5l4OR6sIMym2
	VswVYJXATeIZc6pzP/XYjcOwoq7dOjdzxE5hh5rDk7qx6gzQyUcrU6UBOxteIwDP7wDOu783C6d
	3CdQ2lCNL0IxAmEyV/lHJYckSGlz4vNQ=
X-Gm-Gg: AeBDievWm89B4M9eu6p/lAXrQ5J89UHYZJc7+wWlF/RUldfWy/jrlKmFQTNoyWJNuo+
	oB9tMLVSLqukiK3ZLF8fcOg+6cpFPEItx+a/I5Nfrd2sMC/F9rXZAXEATGGUgLrCPJSDCnqCUmN
	gHExWId3hSb6sggsZeqR9W7nGgHrC6ql2dfnuM6Hr3ltIsrnopVTED8gaTZIVLJNmvIqtn2fcI3
	LU9er1wqywNZn6+lYvtxW7BM/zFs+p9YsB7c00vp5HDDJ3tptqlLdMrCQdeVMozo+osv8XbWihy
	keKGA1aofNAcYhgH3bbvi9EpDiEiq7t7fx+bpctstn73F7LcrxemwJnmiS1J4+3rhO4koH0bgM5
	++20SpB/qROo0fZrdzg==
X-Received: by 2002:a05:6a21:3285:b0:398:7796:7823 with SMTP id
 adf61e73a8af0-3a08c85a42fmr2848043637.6.1776437064234; Fri, 17 Apr 2026
 07:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
 <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
 <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com> <CAMuHMdXie1HR6XzkHXAtonh2oemNxH2UZE3uSUjW3xoOmhRjYQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXie1HR6XzkHXAtonh2oemNxH2UZE3uSUjW3xoOmhRjYQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Apr 2026 21:44:11 +0700
X-Gm-Features: AQROBzAQoWeu6BUfwIVhLLCWyt7hmvErfzqvAfs0Xeg-5QUpm0Ag_AdFXLu6Y0g
Message-ID: <CAABR9nE73CcehRNpoZgT4mEL3SAzpK7s+syoBxcCMgdToEWXoQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

> It is the main clock that needs to be enabled to make the device
> function. This is independent from the notion of it being a
> "Module Stop Clock" or not, and became sort of a convention.

> Correct. On most (all?) Renesas SoCs, devices are part of a clock
> domain, and their functional clocks are managed by Runtime PM.

> It is not strictly needed to be the first clock, and mostly a relic of the past,
> when clocks weren't accessed by name, but by index.
> Also, many devices have only a single clock, so don't need a name.

Thank you for the clarification. It was very helpful and cleared up my
confusion about the clock naming and ordering.
I really appreciate your support.

Best regards,
Phuc

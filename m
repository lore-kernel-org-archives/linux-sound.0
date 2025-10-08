Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFEC251795
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759931181; cv=none; b=JIJqCe2QlqTQl7OBByAzwAOUsfD8R+1iZ4MhppWY5AlAXQPL+KiBafeh5ZS3IIQkp/9l43qNjBM95VicsF1nMmU9xkSIf5MCL5tBeqQpwWBUh1oSwqv0BtjzFYMXihmDCiPF0PGMtXXtyXN5QiInlS8qRaQmRvRKv+4exqn++Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759931181; c=relaxed/simple;
	bh=poKv+El8BG8/UMjQs2D9OZaAQnBxbGVnPy1big55qfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFtX8vE9xt3N11h1RorQwynZMbbn6QB6K53GfUqaeq0ohTs1YXv59KxUg3eJ7b5TXTSZ1+28hTQ8FYGGn/0InasTsevdH36o9xyl47BTA+BU78ZZ5O4JRy+8+RVXQF0T+8H8d2nfoyLCiBE3gkOjchVftT06zEWDbAsAa9yvZ4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HU2mQtX8; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU2mQtX8"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7a7d79839b2so5884013a34.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 06:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759931178; x=1760535978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poKv+El8BG8/UMjQs2D9OZaAQnBxbGVnPy1big55qfk=;
        b=HU2mQtX8P1KLkbdeSKI7LJ17YuAtyWgb4gjw4NlYi1zgAtWblKuRMdnl8zPRqdhK52
         e2dWqRVe9cr4xle6tc9Xsz3qgRSjf0Oo3antNNHnBZRpMHyf3yCwjvbK3oz+F21gFwds
         vmjwPhsdjARkAShqtyr68pIarikoh/EY5et/DROk/C/E3i+yGebrP9EVMKWHBUqarg8B
         fnlsp4eAZTmnS1tJHrAS1cAYEiTMPCfwGXUDKYgobtjtDIcskfFbZhgaBCHz7bBJxNPi
         WlMtw4j6KGSmcwQkBngnkUY1LgQ1Y5uqXC8guq9MS9NtK654znLtYmULP2vGvwfR0gnh
         8uKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759931178; x=1760535978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poKv+El8BG8/UMjQs2D9OZaAQnBxbGVnPy1big55qfk=;
        b=FwibUXDkB3rPNj+TQhXB2iyo7RRCx9ay77v2Di4kpmo1JJ+YykbmdsqALzB5Oc0GxJ
         YzQpD4HKB+Q5XRoye+0+dmL+E1Vn7v8WpCCTQgOFyn9JwAPcRl8Ct2tAMbGs/RnYUbyD
         vh++a3sD7hcDtFY0xjM8VApOl/82tN85tS9zzahMU0DIE0+GxpvL0sDOn7wPLNIoplqN
         xxEJ64mATRdTwFqsCtiV9Qyd6ijcJTusQDtHm6FgfnWX/m81Kpeu9Mwvhtu4FkvcQzlU
         iEXJs3CnSzawxlL7334pCmJHmBBeztRq4WC9jyc1Rx+Q0Aal8GM3gUSHt/Nc1WvJ54kC
         CToQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd1B/4llfE6XuV34vAhyGKq/PTtogx8d4Jdp6Akv9tE6azDvLyMb9pDfMh7xKeAZtL1wutJ+8uj5LnBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIrnCLLwoQ2HBwCv8I9/xzlDaURRYLccFv/4NVz/u6UGhIVkoQ
	ZFL2AO3WL+HMxYBm9odwsV+eXWzhEovBp3ayTI/PE3UbMdoJux4TTDFz1k/YRos9MjamwQufd4C
	uozAmZAqoruCPnzvgA4iuLOhHwP8HjY4=
X-Gm-Gg: ASbGncsy3Q7fX3D7sIVd22z24G6P7dIwQEKKdpIakRorj9DoHblhN45hgiArUiwHQ+L
	aMUp+nUYo1owy4+EUTHZF+dtWayZb2DLvCDFiFVF/81y4t5T+ZMFVfAd4m3bo6RWvNc/g9wq9uj
	27IOC1Nb9dMbcyNEr++zOAGoi9WVb3TW/07iKfPrOwx47MY/YfNnHkouU9RqtI1sCWdqpHX7HaI
	S9BRFecRvyj3eBfQ3OTScm2P8Vxcsk=
X-Google-Smtp-Source: AGHT+IGs2Oe6LXjYsx6ntjtHgrPiHn8AfOkKNvKB686IELrwhJDW+6bgzbT0XoCi4qIJ9Yn13pmmAnxaNgqtVWHPS+U=
X-Received: by 2002:a05:6830:83ac:b0:745:9769:ea43 with SMTP id
 46e09a7af769-7c0df784ba3mr2595142a34.11.1759931178367; Wed, 08 Oct 2025
 06:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007145028.1845-1-briansune@gmail.com> <aOUv69rMkyYFiHae@opensource.cirrus.com>
 <CAN7C2SDUiuMfPs_X5r0RDC56313aJsfhfx0-juhZRKGTb1OKuA@mail.gmail.com>
 <e78c9cc0-4a1f-4a22-9cba-a8213a7b9301@sirena.org.uk> <CAN7C2SDMB8_b-m0ZMzuSmhHxWpA10mcxxxDMKWuNe6wfiEXo-g@mail.gmail.com>
 <58756837-9be7-4027-b951-401ceeb69e4c@sirena.org.uk>
In-Reply-To: <58756837-9be7-4027-b951-401ceeb69e4c@sirena.org.uk>
From: Sune Brian <briansune@gmail.com>
Date: Wed, 8 Oct 2025 21:46:07 +0800
X-Gm-Features: AS18NWBa5ANTHrUAqNvkDfkjRFyAvcKCEAi2XdlduwOIaXw3SPikZaTxQGwIoic
Message-ID: <CAN7C2SBG2EZ4CJKR_vWKBGsKpZTF_9VJXj7ysLx38nJW3dFxeQ@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: wm8978: add missing BCLK divider setup
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=888=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:40=E5=AF=AB=E9=81=93=EF=BC=9A

> This is not OK, BCLK is 99 which is less than 100 so there are not
> enough BCLK cycles to clock the samples.

With all do respect.
This is not how IIS, left/right-just works my friend.
LRCLK and BCLK must follows.
This is no pure sample rate concept.
I hate to explain my self.
If this patch is not good I just give up.

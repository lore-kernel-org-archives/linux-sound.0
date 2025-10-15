Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F62E32F777
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 15:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760543177; cv=none; b=qejp6RYhGGxrHonY99AN6PKuTENeyky/fNMMo7ZgOz6/3zA+8bhnYC0iZ0nnnM5HncRcfqN1uHHrlR3bwXbAdxbLj8mhRjU0xo1FpqzybG85WWXcfAhb53hfMxpTf+33SYgwkSt3fKn6NRP6hAZDSoP4POqQSVdMdSivsVbSfeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760543177; c=relaxed/simple;
	bh=Nd5hXUmEuB5qRp8pWl35xSOUTluz6/AfHU93GdFCKoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3b66KQEqrGWrVd8G7Al5gMu7PwMYLO7h27eKarmeWrTYSIwDQjiRoB51LnzjGsAMAed5nZ0rS3JDvLNF1n4jaW4QaCfQS+HuE/YhdoLg4uuR9/NujcQajIVgdqrco78v4xKJW5EVLx8TQEQj8EROXK4CKPjiG3hg38q2lFgXtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM1bg5XE; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM1bg5XE"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-633b87e7b9fso6391613d50.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 08:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760543174; x=1761147974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkmO8kwNPXSyL42vtuMXueXt3VwnQ3PwUmTN5CpC5Ug=;
        b=EM1bg5XERDbFprlgvil21DnNKHXjq3NKV6o4BEIER5wdDJPTtSLKC5IRG/kPuvZjT1
         q+F4c0LV+1ePg22H1yKnXVRARAJlyNIwAfPGjhOc1EX4VveVF/PXi30fBd1HCSCMydvH
         REjql+QIe9w63XKwplq7sD5A+T8eFAJ01dpXFdy5GArnYEHNzja46B3Wijqk9B/1SZC9
         5wi9C77o35bnu7FXrAbhAF7udIszBnzGjoF/y4wLgpIiW/sGgjVm4RT7p1DGGqaoFyg3
         L3PQt8S0hmaHTgEw891dwFeDMXmfptEmDC+LOi6htUGorKnA0rwCzEuVKV3qCNnvstET
         fNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760543174; x=1761147974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkmO8kwNPXSyL42vtuMXueXt3VwnQ3PwUmTN5CpC5Ug=;
        b=n21KTrjQPaNLVfyLpvVq8yuk6c9yhdPcdX9vjCp852AX9Bbv4lH+BxytweHNfWrfNE
         bOSa6no7Yjd8sqysERnpJ5S6vsENdYylBuiwK9eOFLEGFpq2GadSbs8iW+Wqzu6HLS6Z
         kZ3REHVbKi4PD7XK5TJBVAN1yKxRXn3PLxtIBi5XZOp/Swgl5Lg+2fFH6vMQ0Nq23cQw
         +LX40GoXub/H1pPjWuIc2ZTXwzFhNzgq15z9Mpp/UekfYz9tVQ2Dn/NijiJObTK+OSQP
         CzAhY/pobrMZWnImesgUIc9vaXslP5HN/Gh91TVKCbwe/mXajVx4xmAN6h5NTTgkjDaG
         WyLw==
X-Forwarded-Encrypted: i=1; AJvYcCWwl4om4Au9YAxmxLbuH+6nvQRzSyHWgX92OmHkC5UAFv0vx2JCs+xIteq0T+uhCLIxVRYr/KUTsTCMvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzObqhWSF5n8Gc8jizsZl8V2t09/M+KiRdu4Dq5U6LnLDqYG/dD
	Js3UZ+/I5nSn8dzxWuZhDGmoFDbuGeiFg+xBW623+UyuikTj7eN/nGwbcGhCNqXH/s9yk06nUmY
	/DwxVEtRBHcEBJr4tS2PyxmZBD22Sc98=
X-Gm-Gg: ASbGnctLRfL0OJgahAtBQMZdES0HJOBWuHScTaRHdut1PS6nG4xTIP32omcYQ0ze1kM
	FNvEytfwYbs2Iu1LT1nuZEe8EYy7OoXbndHAnur+QCbtTDcTPMXNTGEW/LlCKymvKEDcLO0FLlz
	j7kBVTBqNWk1focesEjrabxsT2oTgNqGQYoNSHq3msWKd2vatOmGQ4IFVSH6zatkxWGPtw1ksCi
	9JIsooGFQfouHW5wwCb4n3tAQPis1qljQUC2kNQf1LX64Dq8TQ=
X-Google-Smtp-Source: AGHT+IFgFgiCn2MXat9mzlismka2yMZKZPJMj5/8ogylK7npyFOu2pzbbuaB1mNpotL/j1a2GlPY5/iLw60S1YQr77E=
X-Received: by 2002:a05:690e:4291:20b0:63c:f5a6:f30d with SMTP id
 956f58d0204a3-63cf5a70755mr10874437d50.55.1760543173814; Wed, 15 Oct 2025
 08:46:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6q8l68r.wl-tiwai@suse.de> <20251015145749.2572-1-safinaskar@gmail.com>
 <878qhckxc5.wl-tiwai@suse.de>
In-Reply-To: <878qhckxc5.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 15 Oct 2025 18:45:37 +0300
X-Gm-Features: AS18NWAiuA0FoKwp8uia1YrxNnyhxfuszDQDYT8g_Hy9a2KLASwscAn4IzjGr_Q
Message-ID: <CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>
Cc: Dell.Client.Kernel@dell.com, amadeuszx.slawinski@linux.intel.com, 
	baojun.xu@ti.com, bo.liu@senarytech.com, cezary.rojewski@intel.com, 
	kai.vehmanen@linux.intel.com, kailang@realtek.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	regressions@lists.linux.dev, rf@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 6:18=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> Good to hear.  So a part of the problem was the incomplete kconfig

Another data point: Debian's experimental kernel (6.17.2-1~exp1) does conta=
in
culprit (2d9223d2d64c), yet it works.
So, it seems that Debian's people somehow cope with this bug.

Also, when I take vanilla stable kernel 6.17.2 and apply to it Debian patch=
es,
listed in this file:
https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.17.2-1_exp1/debi=
an/patches/series?ref_type=3Dtags
and build with Debian's config (with "localmodconfig"), then... the bug hap=
pens.

I. e. Debian's kernel has some unknown magic, and I cannot reproduce it by
taking vanilla kernel, applying Debian's patches and Debian's config.


--=20
Askar Safin

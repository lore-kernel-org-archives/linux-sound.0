Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918CA39FCCA
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175994; cv=none; b=A5M03hssBRojwEvotBLGfxLizmHSyHibWZJiAcHBB4WSpLNHN5A972a89tgk73cVDrA8iEVK7Yyt0ibyuKWf+5dQ0yOirymhL4FcK3TNBhNrFIFzgM8MXDElSsrOSfbz4Q/oICj+/D8EHHBuPzYq6JTh1PMdEBEaWK4ef3y0v7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175994; c=relaxed/simple;
	bh=JA8jrHKuhk0CJFLWQ126/WU45hXRi8573vPGNkgvooI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PxQHEiNUfmWXai9GkFkWvR0DZU0MVaIXqLW6BVivBLyYcfi624SWUFGKStL1Luja/dsJxKBUgEkxd4iqQxK4KWPtASajF/ax9yr2zQKO444C1rizCfjhyjUrf6jsSLYKIJT+QWHE/r0S8HbJenxYJlTWETPxghBv8OkI1Y8vSfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSg8yqJx; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSg8yqJx"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1852650a12.0
        for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 04:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788175993; x=1788780793; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YwoI9pJbspw0thPYgo5uRAdd6p/MMBJUTUU3yjoPKkw=;
        b=NSg8yqJxJ4EAbff8QwbkWOeABB/hKCm7iWHNpSI0oRFMRQvCbTkBX4A8DCHhkdSJI9
         f0h8bydV/1RqVaLqo2Mz/O/jcXAt8smYDAS5m/bljT9JVmoDYBhzIwLy0CxsZoD7bHKf
         7WFwZ3kkjZFcs5A/YiyyOChMxpkrGQIflXp5m/2ua4cxY45tdUbujQ/FP30mSqp8IB/V
         PXm4DS1+nnZfK88de5AXIq4+DZAQYMBA8vu//5IOBAqBn9qBXTGVKwDjBMduA3OH4KYb
         lOPGDUPuuk+74izWhy6CjsaICtUySBfBdA1D0nn/WMYuSKtEKJowIHyFOP24MLe6Fzn8
         1byQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788175993; x=1788780793;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YwoI9pJbspw0thPYgo5uRAdd6p/MMBJUTUU3yjoPKkw=;
        b=A2ch+Fj/dh0+tpLJU1B5gqGk44yyW4NegZ+k6kXHaHMqN9ItuIeJFABdgw5SRQqreS
         3my5AOjtnMaFogvpheCwKEodx91mCO90ppc7lM9JOGzm6oTbgBqXzrQ+7JNjiveG+R+L
         facta2lnXqVCEfmkLfbQOTxFihn4bKI3XOkvYp3W1OJwaA4fcYF2n0tHBQNEUq9MvlVT
         RsQrid7a5o0DHK7TRmTov7sWFMF0xARWI1ORBBRBAOzP6Bs0Zh/x8M9aEqQOiVtpzooX
         LqHFanqh4/WNz8s4A1Ac65eG+2/EuStt81blxGG/4Kr272ql8mkAQK5ihQtu+Hy1OMgb
         Niow==
X-Forwarded-Encrypted: i=1; AKwUvBwYpiWZG5uxEdI/xSCd3iPzE25OcS6OK+5C+ChK7Cogyxk0xsOYbpEfGadJYmrwYWCW9sGQPg7UyJ8wOQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m14A2AaYkh7UvieCsZI3vMcPiAvTGpWVWnv9RbphVSJ+b94q+g
	Hwpet+W5htd8c59xo/K+IUP8BHLcoUdcxGAVkOKUXhJbp0pf/zLbf2xl
X-Gm-Gg: AYBFou2/s+9PGWYXwz6NhaFRfIkCTvTE3gnIIQiUngTvpwqTnekHSNgB2mqZ5uWhKom
	Ln+j7v4kjiSluJ/UC1PMNmvz2HB2xdvyPffVUni1I1js55rmbchZhbCPJDy2tzFr7pcer9oWpzC
	jNVvkvMSYjkWwCTXrxNVGrI2CTbSMuXEbNBbxxsQxh0/3/t8i8btgvVe+xedawOkxIQ5UMLz/W0
	Zy7ddvcfGcE9+nowcT3zAdXGp2usorpIJi6aZMikz7++QlCbq4X52rsDnwisYu7BCzUcQVZc9El
	DhAvVSt0jx6fOpq3CZHFtDRee/SdboFA8K6Vis+dQYFpNDjAR9OZqggzxUwSl6VtlgJ8JG0T8AZ
	hE5275cd8yuHGYoEfGQ9BW9YG8NHlF+lvKOqeBPZA9B1amOokoYSvwvQ4tVJG7dN2+jdumM3u5g
	C4GbB7wQn1XRr7CnyakQYn7cQvHMQAyuVlOLjjFth0k8IkHsB9yN+xJZA3eCS6tB1ZZPKRMBhVN
	sVeqFGGZWCEuSq1OQfk15ZJ9/+LJRNn6WpkItBI4Zr8ds1QZpgA99VmCUZUe8gW2hbxy4piviC7
	n7RvFqvXmXZ3KkVxsd8XxpRL+RWhWol+2b6zuztXHZtQg5M=
X-Received: by 2002:a17:90b:2f0f:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-396d0d92d15mr41287848a91.3.1788175992822;
        Mon, 31 Aug 2026 04:33:12 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:12 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/3] Enable shared GPIO for Apple Silicon audio support
Date: Mon, 31 Aug 2026 21:32:38 +1000
Message-Id: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTNJqVKBqxAXFX5gCIGmo8aEc
 HcrLr/FezspokCpyXaKeIvKtiYUeUbd5NcRLH0yWWOdqWzNPoQFrJOP6HkMsrEzQ+Vwu+JSekp
 diBjkcz7b+9/6eszonr8RHccXNvdv2HUAAAA=
X-Change-ID: 20260829-apple-shared-gpio-60f86e74e35a
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=JA8jrHKuhk0CJFLWQ126/WU45hXRi8573vPGNkgvooI=;
 b=kA0DAAoW1DYy0VH3eWAByyZiAGqVZm6gk8hq/DZpJ7Sxzc6aABaz6Amen7+KLPp8mgNqyZt2h
 IiRBAAWCgA5FiEEsIISSJsyBtmPFHm91DYy0VH3eWAFAmqVZm4bFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJENQ2MtFR93lgVXIA/jxuSb36HlgsJsBZYezGXmJU5VV9xJiVbYBpEWb7i9w
 ZAP94S1jJis0hOEMTV0nlB7uKc1AoDcePfnSn7FH6oi7sBw==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

On Apple Silicon Macs, every speaker codec's software shutdown pin
is connected to the same GPIO line. This line must be pulled high
whenever any codec asserts it so.

This makes power management impossible. When we goe through the list of
codecs and call each suspend/resume, the GPIO line is asserted low or high
by the first suspended/resumed codec. This causes issues for the subsequent
codecs; they are already shut off by the time we try to cache the register
state on suspend.

In the downstream Asahi Linux kernel[1], we were previously (ab)using the
regulator API to work around this safely. We replaced the shutdown-gpios
property in the codec Devicetree nodes with a virtual regulator which acts
as a proxy for the GPIO line. The regulator will not deassert the pin until
every consumer wants it off, and it will assert it as soon as any one
codec requires it.

Now that the kernel has shared GPIO support, this has become unnecessary.
The first commit in this series enables shared GPIO for ARCH_APPLE so
that we can take advantage of this new(ish) infrastructure.

The shared GPIO infrastructure considers the first state change of a
line to be the "default" state, which is the state that it will allow
to be asserted without all consumers agreeing. Currently the TAS2764 and
TAS2770 drivers initialise the shutdown GPIO high, which means the first
change is to low. This does not help us, as the line will not be reasserted
on resume until all codecs have tried to assert it. Since both drivers
explicitly pull the line high on codec probe, we can initialise it low,
causing the first state change to be from low to high. This makes the
shared GPIO proxy behave as we intend. The second and third commits in this
series implement this.

This has been enabled in the Asahi Linux kernel since 7.1.9, and addresses
the last obstacle to attempting to upstream the machine driver for this
platform.

We intend to take the Kconfig patch via our soc tree. The two codec driver
changes should be taken via asoc.

Regards,
James

[1] https://github.com/AsahiLinux/linux

---
James Calligeros (3):
      arm64: Kconfig: Select HAVE_SHARED_GPIOS for Apple Silicon
      ASoC: tas2764: Initialise SDZ GPIO low
      ASoC: tas2770: Initialise SDZ GPIO low

 arch/arm64/Kconfig.platforms | 1 +
 sound/soc/codecs/tas2764.c   | 2 +-
 sound/soc/codecs/tas2770.c   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
change-id: 20260829-apple-shared-gpio-60f86e74e35a

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>


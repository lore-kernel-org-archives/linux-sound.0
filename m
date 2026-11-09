Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243818;
	b=YiiMQsaKVfNHy1+SJtQ3AQut9l1XsIXjEdHSSdHNa658+SH3Cb6EluY+5LEAjq+ulozj
	 TndVn+GMM9GpnuX08y9Ap41F3oW/UrAHLRFj043O4dhO5ILDGEnnBOtK3v3OKsqswACUJ
	 6AyzAAMNfxrT1QHKTDSgwUpB/5SIijzsikwRxrC7WPGBlO4DQpzHOJsphPCvWYpgPumGr
	 T63022nWiuc8/pdRa6tb6JEgO+rjO2QFWa4f0NXpzVJhJWhbHrD4ALRr8TZciuJZ0GXqC
	 htuEgVH/XlctUFjrxFuJnpTc7QUBOa1dn2707ZbLXNxZI0QiRR56i1xZTTVRsYsvw6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1u4GSn6kCeZQ0uH15hwW5FEpWU/gT2GfohX8l9UfGRA=;
	b=lz6w60z34sHub/N1pep3/5V0DwHN6Yq361MNigtUjSZI3rVjYQoi8oHIq/yvCresPUVq
	 7tALm9Wf/ottkEMjh7uoUu1ZNVlUXA0XFwoPC6ZHA5kNWBqxYv9nHa+a32l/Cp9d6iGCP
	 PQMUbF2X/tKD0HA03VDlL7Y3PXoEJ/+tjUrHhrydDW/+90A2r+1bxv5XxTnan7phwksIY
	 cXIvHN6a3E6pCf1AeH0aIK+gmalDEfLPWPafxw9iJi4gnvcRaOsaJBEnG8ROoFiNI9ukg
	 bXPVodUfHQFhnKiKfR6vFQsATbo1kAjIdWbWXM/8In+3sOb/Yu0+BU76aPCGPzAbtOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItRM038+;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE07F606A321
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 17:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE07F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItRM038+
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48fd2e38825so748998f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 09:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243816; x=1794848616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1u4GSn6kCeZQ0uH15hwW5FEpWU/gT2GfohX8l9UfGRA=;
        b=ItRM038+a5QCmmgfTJq+3RFzQWHulaDbJvLqq2scj8kThKYVCLtbqXd/MArcPGfW6K
         y5SQEpbaIwpMXh82aivv8RUPqTgXlL3Q5mxR9ZbKqwbSJ7dnvYF72uzhToh0suO/1eED
         QZFIw2Es/B47XrZDuWyGOWKuchcb224en80JK/ofb8EXiPAdy6MP+PqCDBqeal94Kqfm
         iL6iQkYEUr/o+IEGdVG6oC3yuI7Kg6L2Du/bM3RPuZnXWzKcmI2lL8r3TvJiW0/OeBom
         KzHsQFEKNcJdg+njs75uDg7xxrEYlQ2WqLmVm2RIhIn4MyhRvZoFv2WTnum9xv4Oz3Up
         IbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243816; x=1794848616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1u4GSn6kCeZQ0uH15hwW5FEpWU/gT2GfohX8l9UfGRA=;
        b=iC2HDhy/9OkS4raWnQJL3v1tcO/nYK4Km37SSUZMauR0427n2y/a5FmWmYDoMLeVSx
         HXTjnvM4KP1PG2GHpvA4wNRjJGhucPAWa5WQ0KOaooOaDFZ//i3k1ocluKaZ21anC20i
         GFQuGxthkT4ylEL1CfYkmMT0e6Qb67n7wUbbO7KRyLxp1+dNf/ewOHjm3rv22gZXQZNQ
         pt8YJktCX4JYKzSy0G73yM8gX69lUJSseVVfSWHveewR5X4Ia6Q/zyH8EUjSr2TkxZPS
         EOAxr4NgvA4Ph6m8AZR3YVW3+ORjU8H0f5JVJTfEu0Mjm1xwWxS1lJcE2lIxfDDk1oeZ
         kNFg==
X-Forwarded-Encrypted: i=1; AL+hErG6Swp3fwCuGemZw+FLZVZPbzpZsnGs1sxqFGDJa1NQVwpx3x6VtmRyFzksjPvVM6189NSv5vELrWZu5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/eLRteutiVWLuiwxlCyYlzQslDemTJEvMZk8Y4q53fanIslWpD
	1vGJsWyS2qFZd6w1QR+oDCa/gdluBvbuhbaZW/ddMWYPzDhWpZ9cuyuG
X-Gm-Gg: AYBFou2i66QwcyXUyi98kQ4Zown4Ey1PRYZEsw1VKKrERFLmW9TwmUPwREJKFo9LXZx
	hZV/8arPUfL6j9eGOA6TnfO5bfEG8FQFrqEhfMWWvU19MoUd3nd6MpfGITyS9gj11353dQK3vbh
	8k/6jxI2BzMTocjYgAD4vTh2DVRK7NYGF+X3uSHgTjjecvnuZhM3R0rOVR24I6n5W1iXY4/BuBt
	cQDrVVRXUgZ3ALA2BbIOlgTogYO7pW56b//O3JEudbZrDPB53YkJMP9P1E3eRQfbbjsYq0csZZj
	nsrgKNm81Afz4dNXDnAc0P8qqbvJ/kfakv0l4YYjBY4/J6C6wJHzCNfmgUbOPf1MSiqeRL1IF6m
	S2shbQif0SperubjTVkUKeRSEgr+j7lJwfZOZlB5LoEuUGzLUGR6ThGcktupyoYplsE2fBW98mF
	bQbrbOXenwtDZPVePrKyJe0NuyLiWU1+WYaTrYoNNssoxkjmN/NpZ0aeEAvLpTvYyLGyWgMdFnN
	l+94kto9d2YDmwh3lO7qkIiil4wZI4LDkN70VdBd3MUJsPd56uPjiEr2Z3DTzoSOvFpADyU19ul
	SbgBQh+TtWoXhkflxEsaLqFwzxS6u595kj0yDC1DS4ck1hNO0ZBEuFpzVGpqiwalKkBX6jcyiOb
	W0gOU36kHqN2ihZZJ/xxtSZy0Sb91XsFUpOYnzbFE6PKU+/O5QhjaZQvNvradzkVat/gc7Rnw+M
	KY7JxaujulX0RTbCGKtDkOezVClIx/kFTuRA3bKONAGCfImcdz9QYT1tlKzEJlX4cSUV4UUE7FF
	YC+T0YuPNauCeDbztOfiofyd13+OrJ/Wf6oEess
X-Received: by 2002:a05:600c:1d1b:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4b94d7631c1mr90723705e9.1.1794243816128;
        Mon, 09 Nov 2026 09:03:36 -0800 (PST)
Received: from px13.tail3a7e86.ts.net (91-201-161-73.ip4.as24916.net. [91.201.161.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d8c3b9sm1952725e9.4.2026.11.09.09.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:03:35 -0800 (PST)
From: Lee Mann <leepaulmann@gmail.com>
To: baojun.xu@ti.com,
	broonie@kernel.org
Cc: shenghao-ding@ti.com,
	niranjan.hy@ti.com,
	antoine@montane.tech,
	andrey.golovko@gmail.com,
	pierre-louis.bossart@linux.dev,
	matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v7] ASoC: tas2783-sdw: add firmware download status check
Date: Mon,  9 Nov 2026 17:03:25 +0000
Message-ID: <20261109170325.10953-1-leepaulmann@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107212552.10990-1-leepaulmann@gmail.com>
References: <20261107212552.10990-1-leepaulmann@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow-up with one more data point, which supports the approach in
this patch.

Same PX13, kernel 7.3.3, with two modules swapped:

  - snd-soc-tas2783-sdw: unmodified v7.4-rc1 tas2783-sdw.c/tas2783.h
  - snd-soc-sdca: v7.3.3 plus only the sdca_functions.c fallback from
    SOF PR #5904 (function type for mfg 0x0102 / part 0x0000)

Kernel log:

  acpi device:26: function type not a DisCo constant, using fallback for known peripheral
  acpi device:26: SDCA function SmartAmp (type 1) at 0x1
  acpi device:28: function type not a DisCo constant, using fallback for known peripheral
  acpi device:28: SDCA function SmartAmp (type 1) at 0x1
  slave-tas2783 sdw:0:1:0102:0000:01:8: Found Smart Amp function at index 0
  slave-tas2783 sdw:0:1:0102:0000:01:b: Found Smart Amp function at index 0

speaker-test -c2 -t wav: Front Left from the left speaker, Front Right
from the right speaker. No "Defer on undeferrable control" warnings
(with the same fallback on the v7.3-rc6 driver I saw ~1600 of them
during playback).

So on the PX13 the v7.4 driver works as intended once the ASUS SDCA
function is parsed. The regression is only that the parse fails on
this firmware. Getting the PR #5904 fallback (or an equivalent) into
v7.4 would fix it without bringing back the split. I can test a
posted version.

https://github.com/thesofproject/linux/pull/5904

Thanks,
Lee Mann

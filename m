Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772513;
	b=aXPLxYwIxiCH57cb2YHOZ60GzlhGGGeHkzUdIK7XUAWFgf2bansopLv4HVn/iOG4vM6I
	 +9+4BjC4OOImB0p1l2fDvGssPhE5szg3NeTTw9omPWvgaDlYuOgW6mvgPVgjuEVGaYr/+
	 rrSxKiuB4t48+KIYUrBrW5gguD1yFBZYGqVnsM8/Bnflqdprle2O8SFN8+MF/9FpFYAPY
	 Lvq+GQvDHpShPHy2+hyOaYKNbZmL0Jl5rlv23RLEkcahInorU7ZBdQy7PeHwcPhvQi/BU
	 OKppSsqW3Wg/iMhkMNSMf+2OXKAgew18CwQPXR1m4XFI9Sc902J+TyBeiX0Dlg5GQYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=NVj64znoMnEV0DTb7YzEgwh9pLwFWMenMAghgpiawWk=;
	b=ua8RjleIhhyDhdfru/50m0aFui/xGP0qss14oVdmwsyv8ch/D7n/c0WaZSTxHBdEzkCY
	 GNQTxWKoIbRksOqShWzUe0mayO7QzdCXNdyws+V2DGfG2KVj0Xw64KPnKQWZqoDdQMsNA
	 yDdGvUXpA0SLLutzNj1V0HSVZuTn5c6cQpEiNnbIdG+Yj9J/gEkaHZaPc3qD4ddG0sVWt
	 SUNo/kox7rsbUU17uhsURsiYLqcrKGAZGPUxZLHmtIkWUFb4rkDmUj1SmP+53sILgXwRW
	 zemMzgTLamFJ2swXd1REmRC9ezDdziYNbgqHOoSMJfUdNJUS8XbSXEXz83mv5m9AAUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mi9ejCnh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2535C606A321
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2535C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mi9ejCnh
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f05bc71e01so33179095ad.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 01:41:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772512; cv=none;
        d=google.com; s=arc-20260327;
        b=FFy+ztOARtieIuLb16jDhq9jTyBOQozV1FIG0gVRxD7W7i3n6/JK8XlMKHSU/0ZCTd
         3uTXth1a7Ff0ptCKGI/xc8owxx9mX5YHO3uSVWjw7+BqdGvxvca2yF8fuXrKVasWp3N2
         NXHq+zpYOYmHxgv4yvRjCfXZNooX1r0tBorv7Nc+1MnlZLCJ6rfHMt5nRxxfy3Mk7YRC
         +xiOHqYNPOrF5eoNKkyGqAE9iX9Sl7adRbQNibofYTmMQBsc+1wC0aKGUkcgn4HcLAqJ
         baM2Zamd9Mkg0qT5UCutl2VpEMdjISExu22mLURoNP28QIzs+wQ5v68rYh+CW240u0lF
         wW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NVj64znoMnEV0DTb7YzEgwh9pLwFWMenMAghgpiawWk=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=PHXTSRcN7II//Ro0lf9UwdmBnkoJFZaIx4oVHyNeIgt4GEkBZlJGRqO5B/OsY7DsjO
         Ah/vqP51GSAOj0mqbtJj4ugd90Gg1KK+FXhQQVpiUQdGTLSY79N3gTJbRwNaHMxtdgS+
         0FyyZovnwyuX6mlnCywpWSDDiGqqmGskw5qOK846xWLscZhQ2cUJQ8qpr1ALAVamFClI
         5SiPxgqD6yad86YI3Ymuut/HNF7nIwjE1283KPUrHEC6ABuWuNgt/M+QDkA4M3N6Opdv
         vHOtJpMUKWAbbXmyYAE6HKh78V/4VEcp/y5aFmOGQY4mnuDWTcA9aJO6MbUyFHTn1uPG
         fYxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795772512; x=1796377312; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVj64znoMnEV0DTb7YzEgwh9pLwFWMenMAghgpiawWk=;
        b=mi9ejCnhaJI80xhkTEI1RF1rmpesB9PiivW2cn/tuwvT+Uegmkl62yQ80Qu442lQap
         kT8zbmfb+RPmWC7HEYl+dEwt5dkPRhNUlJej9v2A/9qNXLydpoZXn2j8a+u7g9UosXAI
         M/mNsbAMBRbxGC2PwoZTknlLsLIzO8IFy2l7svsvhuKbi5OUxaQO0ijxRU0jDRQbFrr4
         g/Yx9khanO57WRYJX1mY+c0olvIACqHoNaI1bm3h0k7vPoPmi2HxD1OoTRkHKSCFinER
         e/+xC5aRJ9Qm3xGDN7hDdKSwJdg9JGQEf4jop8DvqI70IAOImnsoUN9kKS+LK0JBWWrE
         6baQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772512; x=1796377312;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NVj64znoMnEV0DTb7YzEgwh9pLwFWMenMAghgpiawWk=;
        b=p4FgQV0RZZT6iyGDouJb1DHoJwRv0SaqkVDVgOF7+tQy5NnkKudUw+zexdY8vC0/AA
         ZScMYC+POtzhGII8qbcIs4bGFQOP4ZztqaHtVeFiKag+MhdrF9fwIUeY1NgOoZV2wAFk
         w6s3ukRtCpYA4CwK/9h4Qp0SJbf4+IHq+i3nXOG7vB1yHI2zUdg+UM398xzZQwT3lFZQ
         GX/UqWwasIs5LZR4titB7camHj15CCQhnjO6diu0FyHGFFw8cQVE6IPmvlC1HruRFaAD
         abZ5Z+PSLPdgC98uLNVy9QV2z1Re2Rx4tEPhqHSZm+fE022FJlb1EkE7VnFGTG4tEdhy
         37AQ==
X-Gm-Message-State: APuU4Z9Qk1qLlTxHhIJfnNcQeFL11dF9o+utT6jUoEv3zFzOzvJgAh02
	f8RlUzegZ06FwaHFJtbBJ+yGVrz9MSQT2sVErtSPhMQ5smrr3xf0GcR3AExKRtvT8g4LTRPbXn7
	Src/+7cMUfW1lYTBLh8/MmA+0HfhfwmY=
X-Gm-Gg: AZFdTZeEX+4lXW4UzajIWE3ymWjlBYkK28l9Y4ZQ5LlLxAw4oDGvAhEfLmOJtMj1aWW
	C9as0w51hVBia+mItPWbpdOM7dSAKsAxii8xmOu9J7GyEpBnvlkA9LA55fAtZj4hAnwBAYBAPod
	b6/AwDKJT8NZ3+ySgPqsYJJHVnG8Q091Dk2RA/FcFDryXG+Vb4qkNXvCPgv/+wBkTEFKAYrH/DO
	C6xxAqF8SQABrmV7kKIXD9vzUDEsBP7tGfGbZHCaVIiMGUU/WyANfbZgv5CcxUmaCgIECrHkDVC
	fIe/337DX7Nb54LNTta+/opi+QzUvmrqfLIrXO9feu/+EC3hTmm7S7xECMoXc/gjPjv/LbB0kXg
	o56l5OtmXLJBy2R/gC7EzAb9mdEMC94WVzxUMj2e6xnsTR0+YLLPa7yTmRIaWoWXVz6gpukV60E
	62EHIZW7bT9muRR7qRla3hLTv5zNTlzbJLG9+Y95QBRydznlTXVUDty3ucYHcYLmiq07KmVw==
X-Received: by 2002:a17:902:d2cf:b0:2ef:d79b:680f with SMTP id
 d9443c01a7336-2f03f1767e8mr264809025ad.15.1795772512312; Fri, 27 Nov 2026
 01:41:52 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127092345.12383-1-phucduc.bui@gmail.com> <20261127092345.12383-4-phucduc.bui@gmail.com>
 <sashiko-outbox-236980@kernel.org>
In-Reply-To: <sashiko-outbox-236980@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 27 Nov 2026 16:41:40 +0700
X-Gm-Features: Aa3M54pbdy8oealmu543fJS7IeojBrLmhZhw4cmj21G5RRhvG8LHoPEKXBQyGz8
Message-ID: <CAABR9nGuLNyE_y_9zM2HT+FYsexoUzJWgtDybE3tvgu-NZT9-A@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: stm32: spdifrx: Enable clock before setting substream
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: Low]
> This fixes a bug introduced when the driver was added. Should the commit
> message include a Fixes tag?
>
>   Fixes: 03e4d5d56fa5 ("ASoC: stm32: Add SPDIFRX support")
>


I don't think it's particularly important for this low-severity issue,
but I'm happy to add the Fixes tag if the maintainer thinks it's necessary.

I've been getting quite a lot of stable backport notifications for my
previous patches,
so I'm trying to be a bit more selective with Fixes tags now. :)

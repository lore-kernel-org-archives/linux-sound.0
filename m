Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329036;
	b=fLlsNGa8V2Bx2+9o7nePxus1svpd8kJVMWigJJ7+spji3/0Drk/uhxbiZWmZoZ1qUIXz
	 nHONaEw10k3Y7zxr6L2g1B8qW1LejkD6uUudTcpDlENBgNJtNMMuSMSEytDVlv9dd2YN6
	 6hQOyO37pEe0jbuftWhT5KtQ8D64Z5VLK9aULzPBVZ9fsr24yW4+eGK3f7N3+xlMB261G
	 wfuqPk06cPhZAirl+XuidrFfOPYdJyVZmFhJjNLtUu+3/LEv/gtfhaf4YVS0GikMKjm1z
	 Z/gcAbp0LOFJ5drvB6zY6fZZlKNRGYX2tjEB2xfKxYn32Np4CUra2yT8JgMNp/1aqiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329036;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/gkwXSR/PmMCr+Ttgczy3yVAKPFV5AqCIjX5wI1Ofzw=;
	b=Wl7q9Pe6P2Ot25PxXj7B0eKYHUvnGqo93EEe8iR7A2xD17iccDFIrV2L8CYzSqpzkK6J
	 Sb8Ilu/Zt+nntmjsCKdT5gp8J7Zj9XsPibKBD8jP2+VjPqmgqmRZfuvsABk+8tIRUZe7r
	 bEOe3jYRw02mtpxfeZyOusKSfeBUuCMp/1U6kS4cUszsEMAFOSXHDsnXJ+PMOqdB+4GJZ
	 IZKNtPO8fC9hAzUbPqaYdLBG+B0tNIUtYdp1SXKbdWNucLoilghxvwfLi2RAbaXTekiGh
	 +YQOqYTSSiW1xlCy+3raTMwB9aBWrtJSviDrsmnx2A26cjYGJE4jKLnJdpWHnz7wFZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=japfLR0a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E67C606A331
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 06:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=japfLR0a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1982D1F000C0;
	Sun, 22 Nov 2026 06:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795329036;
	bh=/gkwXSR/PmMCr+Ttgczy3yVAKPFV5AqCIjX5wI1Ofzw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=japfLR0abR5HVyLl17dcLj8LrAlfNErZkME22Az+e4CMQBmubM4p+hzjqopTZKW5t
	 7UkhBKLV/wlugWXu+uvTqy4JK9Fyc/Bl/Iu+tS2gk0RWYi8KtEz9fWuhXNPZSr/e9J
	 vy0F3S25fkfkFqDlqV0AAOg+QqBKPRNvGoZi/BHIJwPQk5QR+rBCBVs1x4JjzKtT9H
	 6hCOjY0u1WK7hM5X1n4zMSi+epSv+JyUX9lnfH41e9z4CKiZrTt00LknodXAq1mvto
	 nktBnzx0dKODU4t4O8UmrdYukPdUkRDJQhSWOf0KSZbTHoRbmaOT9hh7mQGCRM3T3Z
	 Ki+kgPozu53aQ==
Message-ID: <sashiko-outbox-227766@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: codecs: wcd-common: bound interrupt status
 retries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jizhou Tong" <fqwqf@fqwqf.xyz>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <010601a201ee018c-30715d0f-712e-4181-9dea-d1b82b234831-000000@ap-northeast-1.amazonses.com>
References: <010601a201ee018c-30715d0f-712e-4181-9dea-d1b82b234831-000000@ap-northeast-1.amazonses.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 06:30:35 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ASoC: wcd-common: missing Fixes: trailer for
  wcd_interrupt_callback() fix
--

commit 138bed245490e607222eb10428e4dada43820030
Author: Jizhou Tong <fqwqf@fqwqf.xyz>

> ASoC: codecs: wcd-common: bound interrupt status retries
>
> wcd_interrupt_callback() reads three status registers after dispatching
> the codec interrupt. It ignores read errors, so the loop condition can
> use an uninitialized value or a value from the previous pass. A status
> bit that stays set can also keep the callback looping while SoundWire
> holds sdw_dev_lock.
>
> Return on the first failed read. Allow up to ten dispatches for status
> to clear, matching the SoundWire alert handler's retry budget. If a bit
> remains set, log a rate-limited error and return -ETIMEDOUT.
>
> Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>

[Severity: Low]
This fixes the unchecked regmap_read() calls and unbounded retry loop in
wcd_interrupt_callback().  Should it include:

  Fixes: 59aebbbb0b47 ("ASoC: codecs: wcd-common: move status_update callba=
ck to common")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/010601a201ee018c-30=
715d0f-712e-4181-9dea-d1b82b234831-000000@ap-northeast-1.amazonses.com?part=
=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215278;
	b=qP3VsluTIEhPpAjRRISsMPXRRIB9iWi1ZRJhFdxjzoSVrklJRJ0QUMAXSc234DVpqtxY
	 PKhJUuT8Qf8z1j2XartUyz1RMC4ohii6J6ytQo2bdqmvpE3+t6q0FW5YOc/Iu2HLX0WoO
	 B2Vh30IG78DDxVPyqzQRfPBw2p8NnSzF/79UcMKsm/RIVg6Y5ixNYZwvk8pTomd/JXthL
	 gbzPj3Cal4xAjfB2GLJu5336ptESrxmKMNaUicIzyIBhbNAe8VQqooosduVcq857vce/j
	 0IAviB4mSpejUNdOg8c1Oo4N/0Ix0dEVIqSDG6286TbcTJq4yb7YAE8fc0UdzrQItlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215278;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JmlXNk6aAyQasILqVJ5E57nc+oKKF4ty+DAxdSwqeO0=;
	b=2NUaXLbi4hRSoYL16rSmGdnJBuEEP801lT55UYxdJqxjUIFkuIhuMVeX3bxiIiMkujsz
	 ARObUuuOO8Dn9C8FPwj0bWkvqdZVhnIgyZdKkqyk54mSCcqY8wMvSt9SQ3XNWOSMaQ0HA
	 lSTzVb8SkQORPZ40WG494iaTIW8Z7j/NhfYdbt2HYf3GcQl/c3hOgwPqNjcbsYMVoo+iU
	 QRcYx/5fyxAoBDOC6+bq4J71DBPoyG5IlLkEqpNyb9sSTvqMVpPInQCN7q5CJ2TmpfGwi
	 Sgqup17UTlOb6PxUQSRvqRr5XO2bPqbgQHVXqmRvAPHln+OlApgVlQNKHhysU/mDQDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="d2TRTNK/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BBA606A31C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2TRTNK/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCD81F0089F;
	Mon,  9 Nov 2026 09:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794215278;
	bh=JmlXNk6aAyQasILqVJ5E57nc+oKKF4ty+DAxdSwqeO0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d2TRTNK/HUehXqcktulRFrB7CxX7RHrH2OXINCBwtSogsOWdHDtTPkHZtYraGciQ2
	 9Wx84pEK+fQn8fSCDO6/olFTC1W6b8Ju4vF2t0w630Ay1xQ6FCb0XJEjPcsvltiAyI
	 X1ElLPlyy17UqwyCD6vL2vLKAZ92ujJ3g7q+9SjzlyYAoMu+RGIJ+vPW1NkjjEL+bO
	 nRyAZb1JKsK1JghUIRe4xM9s7oso3xdk/ZDReb6ZXIqmIiiJv+IKZLxGtUNpMBjjhG
	 x531FxPKFor7wh7U9U+N2eW0rBu16FKqMnXyITwEnzWewy7ZBeg4sCu4pfgnfiUGN6
	 XbmmxChshGqaw==
Message-ID: <sashiko-outbox-204670@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ALSA: core: Fix info read handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261109085922.3104-1-sreekuttan2156239@gmail.com>
References: <20261109080850.2726-1-sreekuttan2156239@gmail.com>
 <20261109085922.3104-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 09:07:57 +0000
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
- [Low] ALSA: core: missing Fixes trailer for commit d97e1b78239c
--

commit a395693d2a5039fea3a9bd10c727bfff30a92e11
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> ALSA: core: Fix info read handling
>
> snd_info_entry_read() may invoke driver read callbacks with a
> zero-length read when the requested count is zero.
>
> Some callbacks perform zero-sized allocations, such as
> vmalloc(0), which can trigger warnings and cause the read to
> fail with -ENOMEM.
>
> Return immediately when count is zero to avoid invoking driver
> callbacks unnecessarily.
>
> Also, store the callback result in a separate ssize_t variable
> instead of reusing the size_t variable. This makes the signedness
> explicit and avoids the unnecessary cast when checking whether
> to update the file position.
>
> Update the file position only when the callback returns a
> positive number of bytes.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
Driver read callbacks previously checked size > 0 themselves until those
checks were centralized in snd_info_entry_read() and snd_info_entry_write(),
where only snd_info_entry_write() guarded against count =3D=3D 0.  Should t=
his
include:

  Fixes: d97e1b78239c ("ALSA: info - Check file position validity in common=
 layer")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109085922.3104=
-1-sreekuttan2156239@gmail.com?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737927;
	b=dADGXHFoWzaCGtSbrBzcfBLwbKXIjJC+UPVwZBC1OGVEsXOAIJddaortKRaJ3hVasAvE
	 pAny6xRBPC0d+xPCAcaOId1MyDiKrJN+78Ew/izRMIY+wpdQHfli1Upf5DZom7AoMrLxp
	 ttdf3DZjizHgInKN7yXWTPZse6fs5xz/fhq6l/QN9Uqpr/5QHpnSxLGVxnTsK7MI9tAJE
	 I33C3oS74oKGEKF9JYUFBBAm0T6IE/K5/74GObWfpQ1RVZRvUJsCCWJQM35xQ2pOmSLoz
	 v+DiRsRNQn7GrWn7BTUrRaDUBTb/76rqYY8P77Iw9LI8NzWiDz0ki+datlCPYtKCmww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737927;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LJi/gVs3qYhPRWd4oDO1/xtMVkUCr8dBwVNMkqr05Hs=;
	b=TR4EU/hRKr7IKS10Rv87IpC9cwSoj6ieAzkmeblHDRcArytdFhWbMBvSiEI1U9ahGwYV
	 J/ESnI7mPx1mq9jkJbx1v0wS7flLKT/GwVM2Z6dWTvPFuP611IxhvIOiIwejgkGrbGpvQ
	 K5+/COJVnIP6h3iwN52mUu6YalGKqmEr0W4MU9EglyZUhw1ssdSGSG39mb7M9+GXFytXr
	 +Lrpgndskf6JZs+YKQpmcLfFMJGLPKhgQGUJ6l9mOMI/mKZLa6cFiiZxx7W7KEMnYyyAu
	 dZ0/MjhSh70W1Z+kZIG6H2zhhzbtc0YUXT3wgNIeoHm42h3WLVA/wWwfywM1tBilVcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HjwNAqav;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949B9606A31C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 00:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HjwNAqav
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCE51F00893;
	Fri, 27 Nov 2026 00:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795737926;
	bh=LJi/gVs3qYhPRWd4oDO1/xtMVkUCr8dBwVNMkqr05Hs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HjwNAqav8dLtLjY2jM4dqzM2cjyWS9qyf8lE3p1qwzX9rjlTR1QIru8FHybG6nLPY
	 lgLKFSnv8P+8QuoYXkoVr7sjfxgtO/Pb1EqRUkhNmuKan1oNMKNnYMq+b9LS1xmPKP
	 zThGvw8FnTR0m5XerUZv+0OcnZVN1toy7Rd2To0um2uNzk90s8GtlrwvLs7xg63CrY
	 hSXMDpEhWHzFDWTaAmpXkShZjOXFhc9nMtDo8OaPFmI+QG22pPUytlAczKuRUGtAxa
	 RFS/qDSxrj+DIbS7RK4w/vMJ24ulA0HMFbLOM4/9tQbF6zOtPcv/bR9CtNcxmzg05H
	 a80dqK5zid8RA==
Message-ID: <sashiko-outbox-236361@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/11] ASoC: soc-dapm: rename darty to dapm_darty_list
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87fqwnqh51.wl-kuninori.morimoto.gx@renesas.com>
References: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
 <87fqwnqh51.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 00:05:26 +0000
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
- [Low] ASoC: soc-dapm: commit title and message misstate renamed dirty
  list fields
--

commit 853b08aef84d7c42b39243cd553801ada341f30d
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> ASoC: soc-dapm: rename darty to dapm_darty_list
>
> Current DAPM widget is using "dapm" to connecting to "dapm_darty".
>
> It is unclear and confusable naming. Let's rename it as
> "dapm_darty_list" and "dapm_darty_list_head".
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[Severity: Low]
The commit subject and message misspell "dirty" as "darty" throughout and
refer to the old widget field as "dapm" instead of "dirty".  The patch
actually renames struct snd_soc_dapm_widget.dirty to dapm_dirty_list and
struct snd_soc_card.dapm_dirty to dapm_dirty_list_head.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/87v75jqh7j.wl-kunin=
ori.morimoto.gx@renesas.com?part=3D11

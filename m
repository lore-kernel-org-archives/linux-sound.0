Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980456;
	b=HR+HE9SJSJL0LePmxrgCMzukEFWmL8/v9CRyfU/R6Afa74duQ83bmtZSNihY6GUzy70H
	 H51+AnPn6a/K2SNS1q5WUFTjBU4FDHu7rt2Y+x/mR99eZjnyFMCf5QZYcuIeL0JZMbGlg
	 UNQ77il4uYgyCpyaMm2XD6AVYybQ7FZ6nHEH3RUTMxHoIMPNBoW5jLpIL8B8UgANYbV7L
	 /URYb5ujzA02uMHVKXnfcovNE+9uXmqh8C7tM5vsXqGD1QdT3nWCO+C2MEKMr14S4rWj/
	 U9e8vnCiS8nxsGVe2LvMaZ1zt6xU65aU+iotQxtbqfNPgNGGKJ9BPxaTNV1ktX6IPmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980456;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=I8rzm9bWs1s9Rq7fY2phlOH5ZLJJZ3/b97s2LrPmY3I=;
	b=N3gVp7kiDBh/nJBNLSUp8iweKkdxxaXgPbbOhnOskWbuzwFo9+U255j+Ojl6xzvXxULf
	 We2DIJDscFo/FnsDPx89QmSJV5QYXmRbGN3tmNZReKZnjdyX5RfvKEkTHI3k4MLHkLrBF
	 b6iyNPlOyQyPoCMLmPt/FZLOz5tSS7zkTYmIIptMWqjQfkx9Gg6pBnxQyTad1ZILLBznH
	 bp5oIjb3VQc9ojCwRiggHkXkuSdlIbb0bbOVlCOg8snZaciS0g9AFvr4CbepGWnVtXFXX
	 FbhylMXP6lHN2rWNTKd1EAaXpFF0I1HYglkDwolpD0hyEL813MEMoCvfv//GcA9DWsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Z/T3EbHt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E9B606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 15:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z/T3EbHt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8E01F008A1;
	Fri,  6 Nov 2026 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793980456;
	bh=I8rzm9bWs1s9Rq7fY2phlOH5ZLJJZ3/b97s2LrPmY3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z/T3EbHt+QkVjmLw22yPLrBktlP+oTj5WUNzv7j006QWJk8CJy2ZKEPqOCtgfaGv1
	 Z24UA30+Xf1sBpKXA7vE/NNMzjHdbW5LJr/3dRo5HOg2AwbiIPKVbO+uyD6Bl55/9+
	 cxG5UUbn/IUtEbG4Mrpn0pdsvixcfGlsVVrxvRkU9i+8gZ3YwhTb7CfAlQfCfoGQdG
	 ppQqbGe2VjyRsTjfG/Ho9uC+mTzjjNWywzN2JTPRcfYSHLeJ3YlAqmhRwV/+XFUiB9
	 7Nrw7Aq8mFpBWuETX6FVcHUDma3juYCBxMQ3jjCoISF32FIYco9VQKXIr/lK1abP/z
	 TyHz7je12KXag==
Message-ID: <sashiko-outbox-201744@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: control: Fix parsing of numeric fields
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261106154545.2973-1-sreekuttan2156239@gmail.com>
References: <20261106154545.2973-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 15:54:13 +0000
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
- [Low] ALSA: control: missing Fixes trailer for parse_uint() bug fix
--

commit 1bd2d3e81b83fc5553191929745f26253824ba8d
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> ALSA: control: Fix parsing of numeric fields
>
> parse_uint() passes the remaining input string to kstrtoull().
>
> When the input contains comma-separated fields, the string
> contains both the numeric value and the following fields.
>
> For example, with:
>
> device=3D1,subdevice=3D0,name=3DMaster
>
> kstrtoull() receives "1,subdevice=3D0,name=3DMaster" and fails
> to parse the numeric value.
>
> Stop parsing at the next comma and pass only the numeric
> field to kstrtouint().
>
> This allows numeric fields to be parsed correctly in
> comma-separated input.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
This fixes a bug in the sysfs kcontrol LED parser.  Should it include:

  Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking =
layer")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106154545.2973=
-1-sreekuttan2156239@gmail.com?part=3D1

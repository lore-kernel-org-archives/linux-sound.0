Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794068528;
	b=ZuI9iDy2qUg4Ewgh+bgo+zml3Qu1d0d69JurcgRMF8HlcPqQZ8xbPuJmWdMnGTU/XnVU
	 /rX8S5id/eJQ8YVcwW6c3pT/CuIfhUJCrtraXm/6T1/A4ULqeK7Vghkz6NQqHGQxXDkSr
	 y0CCEXizQvCw35/rFvVQ/YYk0XWNo7Dh/BMuWLcN7YLfTw6A4rF39SeCJXlS+LYhWHHG7
	 tQix4PQfJHHSBca5DpymBswZE9gyLfLRNO5swcjuzCSOCXxXaBRB7lQCFYDEOq7RhrCQF
	 l4rY6JaS9UZKx4seM4Eb/l3nIL1Hieg+2PZ67Hct7FEl5vy1YAoZ1dIb49OCXVHjmGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068528;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=jWgT26UZBL+gtlIP1+X46M6oKeSV3qWwiFZh09VW8lY=;
	b=a4ABhQFyNV+4F0Vfb79dm7hDgkbBiRmLvfgaH904kQN0i+fHCyQabJe9I3AFPSJz1uZn
	 3xCguvEVtZEKxTtGFUliH8k7BSJlAFMsDsq3X4tMIIBxLeSl7AxlAk6FOMv7naSC2qF+n
	 45KV4XgAuTZk1P8zMhvbh+qPJc3Cinp537iIWwjlXmPLoBpy2WCHPT6US08m+Va06VYzb
	 zrwgb0CFOSL3HcXi4kbX8RpEbxezbD4/gQnokrYWOp6jOhzYRcBD1YH2tdjDiYDLmAQf+
	 +kcsCqE7f8/Cce4AOd7etBbPgzIkQtM6VbUBnlMB7iPq2ZRnrHt5icdN+igPVNABE4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZHgJIGHo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3F6606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZHgJIGHo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417CF1F0089F;
	Sat,  7 Nov 2026 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794068527;
	bh=jWgT26UZBL+gtlIP1+X46M6oKeSV3qWwiFZh09VW8lY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ZHgJIGHoXVWWDTNsPikT3POeSOaFXWR+P374bAOkNwUqnEd0Fmfn6fj5WVZePAOhi
	 N80yRaz5BteKleG+ablXDg6rjm9QZUwWQjwahaLfPnfThkOe6wQ3ApxC57HpYrkvoC
	 WDCW2n7RTK8snalrtBR0u39yItVuRS8BllC9FRG153gJYoaybFbXJh8V8w28UAjoqe
	 3GzUzV4+5VaKZ96p/xWEorIcppOncKIk1m2BkQLUqrObfWxM/6dMkcHGtO3rKbDHGj
	 h2ty0r4CwnVL5L9HOPXzt92jEQKrurV51VTVgWoxewuKsCyCz7k2r3nAgrn2i/Z4Wp
	 m+JxH9MDuyFCg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id DF2182BAAFE0;
	Sat, 07 Nov 2026 16:22:04 +0000 (GMT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: samsung: i2s: release the runtime PM reference
 if config_setup fails
From: Mark Brown <broonie@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20261104024050.1508669-1-vulab@iscas.ac.cn>
References: <20261104024050.1508669-1-vulab@iscas.ac.cn>
Date: Sat, 07 Nov 2026 16:22:03 +0000
Message-Id: <179406852376.3424803.2088630329399773181.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ipjS2QE2nUa1XfOodsYoblbmPudhyv04XT0hF6oBSdw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeB+gY7M17krR8zuWzElVzpv5ZzC0iset8jeR79XVqc
 +J/8N540lHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJXM1mZHhlsei604//7y/V
 7DW7/a6J+ZbyqiBdxwsv3aQdMjzzihwZ/rtfdIr77dYzwyCJec+PkC/ixadig34WnjWzXvUyQ9D
 Gkx8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> i2s_trigger() takes a runtime PM reference before calling config_setup().
> config_setup() can fail with -EINVAL or -EAGAIN, and the error path
> currently returns with that reference still held. A failed START does not
> guarantee a matching STOP, so the runtime PM usage count stays elevated.
> 
> Drop the reference before returning the error.

>  		scoped_guard(spinlock_irqsave, &priv->lock) {
> -			if (config_setup(i2s))
> -				return -EINVAL;
> +			if (config_setup(i2s)) {
> +				failed = true;
> +				break;
> +			}

The break; here will actually break out of the scoped guard (which is a
for loop under the hood) which is probably surprising.

> +		if (failed) {
> +			pm_runtime_put(dai->dev);
> +			return -EINVAL;
> +		}

For an unlinked stream the core will actually do the rollback for you so
we'd end up with a double release.

-- 
Mark Brown <broonie@kernel.org>

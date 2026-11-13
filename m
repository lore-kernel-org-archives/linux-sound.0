Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567304;
	b=h+rA0GeFYTnNShBY1ZchQ0cnh7jjxmMoa0hsc7e3F+ntHNXbaabW9MQ/zjvzrqwBhtvn
	 erQn8x2i1QfF4Vk9JOGtv0PwqFZUyiUGea5v5iXfkqzCnlFy65Rk96hV10iVzdij8bluI
	 hLze/6hSNnD62HYoYK1n4f48l1OTcS95bIoEgneTXMFu6gLahHvsiIATx5zoZJLnDB85X
	 ozIvFBC6bzrqW+LELmzMvg9sDmRkGKlRDZX1qin1rnFEI6ZkxsYJzF33I3wk7sixNmRq2
	 gPur4/HNLJXkLpNVAJ/lb8ycow5rmkWtRKpPJfwEyT6x+U3c85UQUnUkYxrIv7N2QVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567304;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3xNrJdkr3iDZvecT3eEx0jiPfVYSM/mLkJCW7Cbo6FQ=;
	b=VrtsXKkj2rd85Nvj1oXNqjOqGKrUXNwvczjOFAaf9QZtKmYB3RUIZHnkQGN62HdWvjTR
	 Kv8GIgXpN9/bVjqISJQ1dqj3IIFWaiXXVRboYiEH7eTlL/pk2HW5HmnJ2YffLgOdhJeNX
	 YM0UBegMoW3NCgaziiZO+wjWrMhJ/F4B0xiAa4ZjkGo6hHp6akZFD4WmMkh0g4mWDPJHY
	 cavza9OY4kBFB0vD5w6E2Je82NmPeMQGqy+r436EBYsPsqzR1PoE4KZH0IdKTXySdmHE7
	 g8QP+1MRpyq2GhJWmEfNPDyaOxyK4/hPaNjowqYy4wW1OsbxxsTlZrPwM6O1griDw8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iV+rs2mL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C279606B276
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iV+rs2mL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D201F000C6;
	Fri, 13 Nov 2026 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794567303;
	bh=3xNrJdkr3iDZvecT3eEx0jiPfVYSM/mLkJCW7Cbo6FQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iV+rs2mLhooAZcogsI7Z5TxdCtOd/EaleL3ECQtuD5i9ZC+rPOyD9Wwge1wuJlm9u
	 VuhKqjC39vY2OcHCJCksCyN967h1m6XjiEquDkm1rWZLP1ncoZJI9JY/nfa7s5D9UD
	 5w09Y/QnYDGCdl3octbOJb3Ybz639xAICRhBWkKSKn+xd/ZarTBuDd3KGDqbWeh7CB
	 EOxk/PdBJD3IyIR36mM3oYdL0jzH+HqOfpa2L0JEp83sDwAjk+JDxUmDWLcmRJNDYY
	 2/xejeCF91GPYbEB+jXn1daDPxjt1H+SQqk6YtZQA7YINNM/9YFioo3qoRgsW+eI8e
	 f8LmUVYJs3RcQ==
Message-ID: <sashiko-outbox-212644@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: compress: Fix task resource leak on
 copy_to_user() failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261113104518.3951-1-sreekuttan2156239@gmail.com>
References: <20261113104518.3951-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 10:55:03 +0000
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
- [Low] ALSA: compress: missing Fixes trailer for task resource leak fix
--

commit f84b819c6c323f37e0be05907b075a949d352ae1
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> ALSA: compress: Fix task resource leak on copy_to_user() failure
>
> The task creation path allocates resources and installs file descriptors
> before copying the task information back to userspace.
>
> If copy_to_user() fails, the function returns -EFAULT without releasing
> the allocated task, DMA-BUF references, or file descriptors. This
> leaves the task registered and leaks resources.
>
> Delay fd_install() until copy_to_user() succeeds. If the copy fails,
> release the reserved file descriptors and their DMA-BUF references,
> then free the task using snd_compr_task_free_one().
>
> This ensures that task resources are properly released when copying
> task information to userspace fails.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
This fixes a resource leak in the task creation path introduced by commit
04177158cf98 ("ALSA: compress_offload: introduce accel operation mode").
Should this include:

  Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation m=
ode")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113104518.3951=
-1-sreekuttan2156239@gmail.com?part=3D1

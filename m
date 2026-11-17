Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900650;
	b=oc2fjm6F5NM2E9BMvMiVVZjc7dq0dcXtbOV2EHpqdKUe364jZyrCZSa0oChPxSreHRdT
	 WCk8Q2I9rDeUjlE/ODXFOEvaU0xOvE/7wjEQ2jlLGBSMEdA+iDASiaJq5TDcAls8lKZVk
	 Tie2lxI5IimwPb1kIv7Y6ES0iYVeVvhKXmvtRIV1+tvZ0I545rbQvlaou3wZgrUDbTHwp
	 GcmcgunG9fGJiww+ucUzhYgrS3420LNSWcEgsLzJ9E44nCsUrsHtyg8h/uudU43QI9PDQ
	 JTY/N5fePbNafQjgq2Zs15AXue3OVVi1U/I1U87H61nWbqD3TfT6BgUtGBuJfpzAGtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900650;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qE5oFdWjs65CHlu8ZdewCoRzzBDW8fKR/5HPtNHktd4=;
	b=yBssRmoBxPzXziKh5ZdRsNczDBe1t/y+/a7D3TxQTu1CbcNBZ9QMNkbDKBWQ/CHhJaUd
	 QyWKeHFm2wKKA7B/AvQnfN8kKivIhaGArKrHOcXMhDxbSD72e8wY1Mugt5jzGrkRqV/Rz
	 rWr5NDys9MOG9JEZ0kqd0mm6yqBI8ZNeEZvntm9ljRMrdsP1j3GvVQxIh9VvRw54/mOCL
	 aPZEd1/OoafWBcjZrVzp4ejB36Alug+4j0b7w/IL6ilkU5uah8YPckuN00uVAKpaFbB/Z
	 ZO0f67zuRWNqlwyn6mTi4srGz6CRA36X2NLkNhPzpIauXcrncCUjsUaq1HkSjhdIh+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b0d5Gfkw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93BC606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 07:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b0d5Gfkw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4925E1F000C4;
	Tue, 17 Nov 2026 07:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794900650;
	bh=qE5oFdWjs65CHlu8ZdewCoRzzBDW8fKR/5HPtNHktd4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b0d5GfkwMUd+jjAq3Qu4wkKWEOyJlKacEl3qG/4SZEj+/TluAXUyACjttAPFd+LMP
	 UfHPoNIQ0YIKO69RCTcaPg9kzc6QvpTjbRu+F2xeiI2BAcjLDe3poLqAT44q6tAZPy
	 mULFbn0MMv7ILiBpwaxrOEOnT/7Nc3aJ66LiGBT8HznL+Me/Gq1acQLl7r4X+C4ePW
	 ZhbgeMRSdoYwFmbr/Nl1MWKDohBHxEy60/ziU99199Ebli2bjpMtDqpDfCy+/1p6N+
	 1xWNOgUG13Jzns6UDmIuO0tRgirG7sVXHm+Ut3eA8lr7c4s5OJkGWlhE+072uc4vzC
	 tjefnAodaiRBg==
Message-ID: <sashiko-outbox-218352@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: wm8962: Fix broken headset button caused by wrong
 guard constant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen Yuxi" <chenyuxi19@huawei.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117070516.3861828-1-chenyuxi19@huawei.com>
References: <20261117070516.3861828-1-chenyuxi19@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:30:49 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] ASoC: wm8962: use-after-free in wm8962_mic_work() [1]
--

commit 8a0c59cf23261f48f72e00d3d31993d38fafcde5
Author: Chen Yuxi <chenyuxi19@huawei.com>

ASoC: wm8962: Fix broken headset button caused by wrong guard constant

This commit updates wm8962_mic_work() to test wm8962->mic_status against
SND_JACK_MICROPHONE instead of WM8962_MICDET_STS so that headset button
presses are reported when a microphone is already present.

> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index 148480e4124fc..a4868685218b4 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -3127,7 +3127,7 @@ static void wm8962_mic_work(struct work_struct *wor=
k)
>  		/* Don't report a microphone if it's shorted right after
>  		 * plugging in, as this may be a TRS plug in a TRRS socket.
>  		 */
> -		if (!(wm8962->mic_status & WM8962_MICDET_STS))
> +		if (!(wm8962->mic_status & SND_JACK_MICROPHONE))
>  			status =3D 0;
>  	}
> =20

[Severity: Critical]
This problem wasn't introduced by this patch, but can wm8962_irq()
re-queue wm8962->mic_work [1] after wm8962_remove() cancels it?

The interrupt is requested during I2C probe and remains active across
ASoC component unbind, while wm8962_remove() cancels wm8962->mic_work
without masking the mic detection interrupts first:

CPU0                                  CPU1
wm8962_remove()
  cancel_delayed_work_sync(&wm8962->mic_work)
                                      wm8962_irq()
                                        queue_delayed_work(...,
                                          &wm8962->mic_work, ...)
  ... component freed ...
                                      wm8962_mic_work()
                                        snd_soc_component_read(component, .=
..)
                                          <-- use-after-free

[1] https://sashiko.dev/#/bug/linux-315f7aab-37ed-4fee-a0af-5ebeb7b5ed74

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117070516.3861=
828-1-chenyuxi19@huawei.com?part=3D1

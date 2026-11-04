Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776392;
	b=be4nLRwbyrK3fPVSMXQgucqyS6AGfiy6JT5vyOgCnH4IUxLubgMfzO0ySSq6O1cSFcDl
	 HHuEHtVvA0fWvaifYwwcmwPguvH1t0wxd8rjMHnMdxdqlq5omBH0ZCKWp65u0wh3ZMhyR
	 2XHSLVwcHIqXU/8H4kvewyA7PIwrQeS92LM5nGSbrknm2GEb3ZSchTp8T4jW750tU/+MQ
	 OhqrykTp+624puXcyOnO/ZLxhqhf1Z3Rh0DglHKm/Zftv/v6boIOxq4lyR1AkdtqgTp/N
	 qasXjy/GLWIKUDBBWijqVN+t82ikV9JejAKspM9Ax40l0tjT10TJjdEI/3nKyPMsYIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776392;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=f1uaqf2M8sftodrGajSgen+ddvOQUQkC0+DZBHM7qSs=;
	b=bvLxcOcXtvnaqTe5r4nd12mZMY+OccFfsy7JFmcYwRog+XboLI0gSRwb/P+T3tU7r3wu
	 x5jNOujpnx/lbhVOVwHOnaQu4pbkpV45LJ356ojSiANqpa+Jpy+DW77ncldKl/6Toy1H/
	 RZpq3oYXLDaTLF3kjRZl59Yx9fChmFG9SVIfv86U7jMJjejNa18drmaRDC3ARzaczDAKP
	 E4P2yQeay+YirmojVfIzEJtusif9cbzOIFM7LIhEz6rFNqiOXqUcVAwF33vr/lodn+BC/
	 YsheBe3+j4DUR3lv5oRQN1/L09VvifIT3ItxqOUVcSDHcWN198byKg27AoYF8Cmo7/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V36Sa4nl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DFB606A31B;
	Wed,  4 Nov 2026 07:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V36Sa4nl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099801F00919;
	Wed,  4 Nov 2026 07:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776391;
	bh=f1uaqf2M8sftodrGajSgen+ddvOQUQkC0+DZBHM7qSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V36Sa4nlYGFjEE0II3UXzjdGg4NE0As2amhqkjspi2wl1JRbRGpPX5Ip3is+jH4fH
	 AHfBALH7BFEFTeGJKz22Vej6E6XpIuRUTb+nWKR2H9X7zFWJy97A+uk3bE/y9RAoWt
	 dh7qCvGOvH/yxCDBE4h0tders2uoCXecyTyohMHErcDXuolwX9JzBMeQ/s2AcVTb3I
	 3SSk8nti2oMpAO0JTtlpg1iI8uC6ogZAWIA7DRPprHRHw6f4jYn3lttR+P9RNcSvwL
	 kIA4bjc1+jHQfe3H8BmydrpLZolaUQOKZbD/ia3J5/MAgQv7LA+GLEDSpRkD0YkI4U
	 3nOwiZPxAVRdQ==
Date: Wed, 4 Nov 2026 08:13:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: put the child platform device on
 unregister
Message-ID: <20261104-augmented-unselfish-turkey-3c96b4@quoll>
References: <20261104021427.1468218-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104021427.1468218-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:14:27 +0000, Wentao Liang wrote:
> qcom_slim_ngd_unregister() only takes the child device out of the device
> hierarchy with platform_device_del().  That leaves the reference taken
> by platform_device_alloc() in of_qcom_slim_ngd_register() behind, so the
> child platform device, the resources attached to it and the reference it
> holds on its parent leak on every controller removal and on the probe
> error path.
> 
> Use platform_device_unregister(), which also puts the reference.
> 
> Fixes: 8663e8334d7b ("slimbus: qcom-ngd-ctrl: Fix up platform_driver registration")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof





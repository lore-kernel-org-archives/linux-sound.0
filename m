Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776230;
	b=2N19AWjSKNpFeWpRTXtrqIEq9RDxUR9K3reCINfRAU0vQtyKYmNQp5QBCnJ6gK9F350c
	 16aTLuH95PsmqtdqIP6jcx/8N9huWg3GpBzU8xlNJku1Dlv0cXQM6e2whNQigqnPknV32
	 1Ik4EEj2nBc3+e4Pvmh9+ljhyA7y0C5XnToqerZeK10Y5pl1PyWy6/CJ+zhplgNkTN50/
	 U8LPDsBjNZ/cBoMk9+a+Mync6eZgDrdQ10UzJ1sG/3yTDVAoYq5Etf4iXHVx0wf/vm/C7
	 hUV1xNTsbN3xv7g9UbjKUuBtg54/Vgj+5uGc9vI3zsSlHratWZXrlQgMN8LtX0RNTig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776230;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nnN6He0RXvY2VkT+nSbM7VBuAeMa+p41/pVo1bpAvuE=;
	b=LE8aMLHvK0QDBZkUMW3WPhsMXj4SCVp6VmrgaBbjQgXScPPI/XciDgmEH7hC+nZrIPNB
	 QSSDT1HU6HUBX5+niR1jm/v2cNORHrFf4+cs+gmY3JtLat+RiH1fZOHB8zWUIn7hTXIQv
	 0AWTZ+7KE51seONBP1kR/Ap49MNFmFwsCDp16CFwR70r/1tu0SVdRlF8Sj+PtV31PTPu4
	 ijcphT1jC5mENvcRq0gxiURFwzc7Tpe2A+Hc/0opwYZhjsMjd9NG6mXxcyqcstKuEPyxZ
	 EsWi5muZnzyGCzFoDSvkd55zVT4dH+aj5mjSS0czaibwflNNSKXE602ChuqJiks2Oaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eV6crkqO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1904606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 07:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eV6crkqO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF4D1F0093A;
	Wed,  4 Nov 2026 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776229;
	bh=nnN6He0RXvY2VkT+nSbM7VBuAeMa+p41/pVo1bpAvuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eV6crkqOrsNEjwERotti4SiBRUN7m41yC0T7yLqinIA0/A0YWNKTR77vfE5jUPzr/
	 8MKUyRdJxjjtFHMlWZavdS5IlcIYxih1ftKq1XcbkEMvPt8atwq6WDWLuxxcadHPSm
	 94G2dP9vf+W+zkaVhS5Zh4BI4qmdeTdYFyREoPJaattNm/6ATLKWSGs6X8O9uo+7cW
	 AuO1WrHJvYfVl/TNKac5lG2wkUD1xCRkkNw8A77rJs3F3WpeVeb6tZW/4Faa950q8q
	 HbgjvERMZo7qJVERnrQiuPLvfp0vV2gkQ6PcEzX0iX2YhJyvq5t6kVbaHBkmpabiSM
	 5s1bLQyB+zVvg==
Date: Wed, 4 Nov 2026 08:10:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: i2s: release the runtime PM reference if
 config_setup fails
Message-ID: <20261104-diamond-woodlouse-of-temperance-d8938c@quoll>
References: <20261104024050.1508669-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20261104024050.1508669-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:40:50 +0000, Wentao Liang wrote:
> i2s_trigger() takes a runtime PM reference before calling config_setup().
> config_setup() can fail with -EINVAL or -EAGAIN, and the error path
> currently returns with that reference still held. A failed START does not
> guarantee a matching STOP, so the runtime PM usage count stays elevated.
> 
> Drop the reference before returning the error.
> 
> Fixes: dc938ddb5628 ("ASoC: samsung: i2s: Ensure proper runtime PM state of I2S device")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  sound/soc/samsung/i2s.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
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





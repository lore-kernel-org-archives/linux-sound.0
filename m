Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778113;
	b=lV++VHVWP+gQ2fPHmXljnmkLafzZIARoOb/zSuP0Iccc8NGI9u67pFmpDG1/YCFi09CN
	 4PixIdhnSBwRMhiE3dZ8VYmI/aaqfKQevhs+VzquiWXGETd6hBDXZlzqMv/wUvEKzOxvK
	 bDdwLddH9pU8b3BO2PoitMCAx7gTYNgYZbfBOQbQPXWt0QMKrVZFKJ2yNSQ9XR0+X+Gfj
	 imnvu0jeKr67STtksruJmUWffjtBhwl7TC1QoTy0+ldwMzL70EObYpm6988tZQxQvZZsp
	 u7kDhAruXJ79p8NhvSvcHUalQbmO80ZFr/XUMbwyxmWDsj5Egd1dOVIcQJIJ/GtLt7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778113;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pXiQdoWv0KwPIzgtUdWpww3Qg5HvKLBIIS7lNOsz+Gg=;
	b=lkAH5z2EKD1+Mb5ITl8dBfFmcd+Arr7LJIp0+9lpUSlsWpYQgPb5kEBf0NAyiBWyyoMM
	 n+K6Cny9KXt0Er+0IYdjqp6saL0OGeHtjwyvE4BLK4OErJhJpmrQoCAQrunCnbR+qNK0a
	 EwX9dQkQOLPGDACd1eYJW4hhpOmZ4Bxed+YnHZOU7zgbZDLN/f68GCbWZb6X/d3V9sA+D
	 XptjOZvk7+oXZc+9qgM+a8fGLbzZu+iXK22j4MJhicME55vmdGXY8gy6BlUlLDWyF50q3
	 eEGVobVsg2DpTOWt1TKn3KgXquFGMvvSMH3RCQS6V66Fu2suxnikMFKm9GFQP1oPYQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SdUrEupW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29055606A326;
	Wed,  4 Nov 2026 07:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SdUrEupW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73971F000C1;
	Wed,  4 Nov 2026 07:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793778112;
	bh=pXiQdoWv0KwPIzgtUdWpww3Qg5HvKLBIIS7lNOsz+Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SdUrEupWdcHWSEAxHy2bduJSuavOlyrkyKImVgYF1E3nqy5IR+SRdOJeA9xtITz0E
	 /1XyZZkqQElJfLLSLoQqkVrX8zlVZjsbZ4b82ZBxsYXTAhoKm+yDw+JH30a7PAegK9
	 8ttTsZheyIdFXVIsaOhMN+Pb7kleFlEmmcoi7vV2fdTkvjC8lcWR5Mg+A0nQp/mOQz
	 j+cyAQbhLzoYBhGodqk1M34bAR3tRXmREuKwj4uGS2RtOhyQhUZcwT4Gro8Fc2AuP7
	 3LARsfLzv8TIjygH+eWdcD8ciu1U00AIGhq6YvwsTkCj6oK3tgXM7FyR23lDwfR13U
	 vhL1uhCYrQswQ==
Date: Wed, 4 Nov 2026 08:41:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: drop the PM runtime reference
 after a sync transfer
Message-ID: <20261104-gifted-easygoing-earthworm-818d8d@quoll>
References: <20261104021424.1468172-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20261104021424.1468172-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:14:24 +0000, Wentao Liang wrote:
> qcom_slim_ngd_xfer_msg_sync() takes a runtime PM reference with
> pm_runtime_get_sync() and only releases it on the error paths.  On a
> successful transfer the function returns 0 with the usage counter still
> elevated, so the controller can never runtime-suspend again.
> 
> Drop the reference on the success path as well.
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)
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





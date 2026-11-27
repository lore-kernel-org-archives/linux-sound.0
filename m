Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772487;
	b=wn+pUK2GrsNVl5805Hj1ckWG24iFHK/X9Nf4qziY6R3yXVrUcxmtoNIgndw8q+d+wN+4
	 3hXfGPGQN92s4hT14m8mp5vB6q/SIdXcZl6VbDB2Yyp0F+ULToGx4y3QS25jIxA+uW6Wi
	 UY5BnxrlXq5WQVr5cipyn6WaZ/ZPif03W8JoQZPl4O+FjiQLBm7hIe1BuLpENlQ92b6E9
	 3tBVfw5uqyeHLlT4tI+4v+krK8TrjWdsKiSEsUF9sCDBH9l00bcorp9m14sE7m+Hd2u7E
	 YvzDOyNHG36min2ubnLM0Kd7Mwwunn0TbwTwIOEjR8xsrNNcNgR0qsw618UVBiLVR/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=KlAawoXCn4rT9AMA2lK2Vv2/LjbQvX3VkwkKXul9jPw=;
	b=2+T6sk3xK2X+qm9tsr0CTFPWU8Ja0jFx79v3GT3VCYWXET4nrabiwTvnwOa/Lbjsztwf
	 flgtfHusxuo+Hr/jfHuC/RA8lRiTvqoRXabbpzFLE37WM9HPie2wIu77lHBKogEh9L48s
	 bYBdGqpnT1OkNHU48nURPyNhDz8xlNs7cPP94J05JP+IuvqsNaQ0Xr8NO5oB5dMB9R5pX
	 xvmy47Gi0x+8hgtpQjQD5XmqwUa8mOUnQk7C9iEk+p3C9IAs+ko2OfuROU4Hcg2FjXQCZ
	 o+BOX0XcM71ViL6c+etNubL2wFO6EmMk/CdErXTRzkb7QIZMT/kUIgNvesqj3sWc0oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G5iniqDX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C2E606A32C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C2E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G5iniqDX
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b532e633e1so285037a91.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 01:41:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772486; cv=none;
        d=google.com; s=arc-20260327;
        b=gO3jpgxM2OVj7JcvwMxIcY3f184QNyXc715lO01PtDkeH3sVqAsxa0fq5WDr0YJsIb
         l5NupKiYm6kRNglQLbFs1T4LM/thGgF+tDaVpq/uisBVLTugASZ9FjJsQc7cqdcN/D0z
         qyBurIHIiFyHKA6/VUcqg8yTs00vKcGoqRONEX90wKObx6jYiJ4CUsWSAcqonEGZIx+O
         /NS3D4Fj5+j+olMnftwQi6+JIJI6CbvIyHYSpQ57CE6xLt35nlHT73hSlQ29st+DTxkc
         Bb1byJOiqb8VfTF9pzpL0g+wZ30Q3DlacsSoT8ABqJY7K2UY+lsulpP4dbiK9dIJ46KE
         uJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KlAawoXCn4rT9AMA2lK2Vv2/LjbQvX3VkwkKXul9jPw=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=fqRFYnQykHSlkv30Y++ilgvEtXoInqhMA1rqLudoYBL4KV7V4wzT8OM7bMuYR5CSwt
         0JlPDqa1+8giQq+8FAN3/WF5ySN6P9Ft/YX30Jp05iHt/g+koZ4G/9ibmQP4nS8Wp9bv
         y8OiW2o8PRzJxwJ92dz/mFxWvYx0GESC1T978CAjwQ8pDvRR71EhJGScg16Xh3BPskRB
         Xk5ZUti/etSzcJCGLs+sCoecdfjEcGphSZ+u5BZaylGZVUgOiFUGDlIUsVK2SsQ2c30g
         iB0mdt7CB1Am2aaXopLRYsWkz6oXKGtHkSEfaw/OCZ65tI3zwWatZ+7W5Su89UXQiCrA
         n9cA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795772486; x=1796377286; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlAawoXCn4rT9AMA2lK2Vv2/LjbQvX3VkwkKXul9jPw=;
        b=G5iniqDXM8E442QuZhEoYJ5QMj3ralYvKA2KDswvNkHNl3TidQMhKvl6ezH43eH2y1
         oQZCRuR7S0yzhYDcRshKWDmaDY6SSZuh9cEhFIkipg0lMppdB/HII2z2jwBZe4Ogciqy
         iRQqm8mWhOpFMHvdYUOQmCixNmWU9h6RoBXcV/kVxRaHIcQC7TO8ADFGN7++YS14yNct
         l4UB8R+5jkUn4dTG6U5kZbAANmVFL7NsiuObmixWIV6B2A1g2+FrcA1zocDVCGHCBAIw
         UsVZKx1QxhviFSlPw1RISYbUa7zS69V838xr/Yh3K6uI3DUWKbnops9AfclVDkEh75cn
         Q5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772486; x=1796377286;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KlAawoXCn4rT9AMA2lK2Vv2/LjbQvX3VkwkKXul9jPw=;
        b=f26oK2EgYf27Dke0jCEPzX6bAf1iiBuEkHyewUuKUkizuaY+H/mNtYNZlVB3c7Qw26
         fIMTBQHbczrLZCFhdFb5fpxy+0yzWqkjkAhrYxSnkKGeCREObund7xMieoHuHtY+uP40
         oBXlHoeJcSFGCMo/Q/BJzO6y2YSCmzgfphzOGSqk2MpDkseiW8aCWHsFcSd3wcg3W49j
         rAB6LMA05XtPYWG68o4N9eLDZIW5a1CkaAusrBudiE2MtvMmBmGR1CUsnW3BDeHlk0QY
         6+9uDlOmypfUi4NJegUJs0FD4BfhMIcnl6l8kPqAuCno20vc7+WNlrsN4WhtiWDrdMyE
         NCtg==
X-Gm-Message-State: APuU4Z9pPwa30Jy+G/+rI0WXAEbGSxABR2fKJpceeXQIl38T674wI5Px
	vnEk3FCrVSF3ugI8msa3ZUOaGCo9Y2De0LS+1ZfrlQn8mh5Jz8M1Rzy6kCvPvtlLFiyppV9O6bG
	fVXB+KLEHNMcf2/tfqbA7dThdrS7ENus7KM4X
X-Gm-Gg: AZFdTZfRP4at8JOSV412d+L4Y1wgK8da9RbtvF9Knay+jos08NTQdIh+7HcVXveuiJO
	+abxzTnxkwMeieDJwCunaVRmieBo8kV9SrRTNKcCkeNhIwAbqFHlvxXq6XNEoU/812s+MKW0b0L
	cdjE+AGzr8f+luSsSkg0UqXcMVlVvspnZg7yzc0dZ4q9WKzI0V+o470rW2b87lG39uKWjev7KpQ
	wh1kV1blSZIZQpBul9jZ/bcz7UNbXFnh0P5zj9Nzf9t5/ZUx+SOoybSnyccX33TGo/bNuYqq5vE
	R94GtJ+Y9me6xTYACevfalloJObHpdwdJwxnLezwxbFBzJmdQS0ulk1RZMIrAwyIXr7Khf1CD8+
	AAjqB1wvMgdkS3350YO+caZeyAaEW3Wt9lBlwU2PIMpUgXedPuZ8ASS5tWQSfKsTaG9jI0s1W0/
	/eaukBE7urbO1oMavKposTxSmJbuWNQWfAxsCkCLgExKv2Pj7V
X-Received: by 2002:a17:90b:2701:b0:3b0:dbc5:c56b with SMTP id
 98e67ed59e1d1-3b41c7d5cbbmr19171403a91.6.1795772486477; Fri, 27 Nov 2026
 01:41:26 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127092345.12383-1-phucduc.bui@gmail.com> <20261127092345.12383-3-phucduc.bui@gmail.com>
 <sashiko-outbox-236987@kernel.org>
In-Reply-To: <sashiko-outbox-236987@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 27 Nov 2026 16:41:15 +0700
X-Gm-Features: Aa3M54qrREKeThvp52eX2yKw7ElARWYDZQ9GS04ouorjeA01SIwEAb1yW8CpNrc
Message-ID: <CAABR9nFAQsj0EOJtcf6NrkhCZkTa9oAnu+0zdOyfQTxyMux+gg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: stm32: spdifrx: Fix refcount on sync failure
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Low]
> This fixes the refcount and interrupt mask leak in
> stm32_spdifrx_start_sync() introduced by commit 03e4d5d56fa5 ("ASoC:
> stm32: Add SPDIFRX support").  Should this include:
>
>   Fixes: 03e4d5d56fa5 ("ASoC: stm32: Add SPDIFRX support")
>

I don't think it's particularly important for this low-severity issue,
but I'm happy to add the Fixes tag if the maintainer thinks it's necessary.

I've been getting quite a lot of stable backport notifications for my
previous patches,
so I'm trying to be a bit more selective with Fixes tags now. :)

Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2948028640B
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 01:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782439185; cv=pass; b=YeY/lErGODvlwh/rp+b5fIF55mD4NtMEm06o3NAamiIEAQwU1UOpW9Q+2mDcL2J84o5zv/c/NY2E+euYXpFuGW0ZrZ9ccDNWiY80tcMg1qSBJfQzdY6ZgGdonA0eAALFuIgBB2wyXOeNuVndFOndKAY+qUUY71wY5+Yluws8MlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782439185; c=relaxed/simple;
	bh=HCbDJQz4gth93IXWHwSGzV/oEOV4eExUY5vmaWc7/3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JnLHPM6t+9Wj6Cn6SEr15y8/vmgA13ZM95NvgMKz+9uKWhICDSEZ0wLYzELOTUiBQJuwnHbO3RHngs4gnRKEHIoUyJG1LffLiqCEGtCC5kPCuVmC0mXwRB/6xwnK2OFiJ/78sW9ItviGEd8bcjMI4879DjTN0Rybn1U0dz4i2zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oK6cNoAO; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oK6cNoAO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c7ee0d7f1fso3369435ad.2
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 18:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782439183; cv=none;
        d=google.com; s=arc-20260327;
        b=n9g0gXiU/0X1iybUmL+569LIeT1XVPUrgiRWlcawf4eNdKBeNHpQE6QkMvuEiJLBvw
         JMb6eRrpWP2V7yWwmOR8shg/AkemFFxop+gYu9wxq8OKnNGybe8rwVy6vODVl1zjOTCP
         W8WyIq38NY30P1twqFHp2SvEieeiSINBvCAt4rB3cSSCbyqn3Q7+eQErmDmJ3VpAeonk
         xWzK39g7SBEKVcX6461jWBXzx71gM3HWDz1gynAfn7gKj00wsJS3rrAY0UJZWZf40Go1
         oyXe65zypWX7QnCGppgWv1AtKUi+61hDX9Cj+p8uVSmhETxSS4jxFqwhoQHGya27jRDT
         yoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OPBTjJpE1U2eSt3lAidjTgLsqQGyArQt2QVWSy0xOrM=;
        fh=w/pTAJ9qwiXI7uOj2WKvxXsUXfq1NJXYmfHujirrIBU=;
        b=oOnQ8etFDNtim/MJdfOCKpzMNEOYiYFnW3cA/8CYhhZfTCDnrAtrNMlE47BOoN35tg
         ihviHPDmTH9KGTrSKNm2FqYI5Ug5ZkeFJfxCgxwxwN3KENTP/e+cA24w6OKOVPdtCUsN
         2SI+rE2Vy7osPkU1G4APEz860/eUsZwcpHTGmOqn2vFEEf2+WzN7NNWHhizpATbtbDYH
         mX9I5VQVj/CuXmnh6Z0MlU/fGeVbUrSlkzGdnAyu91f2qkcnkWTbyZhWyAqxS7E0GiKR
         njWJRgCbOgL7vJdzaAvHExmENu+yt+kiUOUhlmvfUoPTX8PQs+F0mI2/BrFu1/hGssa1
         a63A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782439183; x=1783043983; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OPBTjJpE1U2eSt3lAidjTgLsqQGyArQt2QVWSy0xOrM=;
        b=oK6cNoAOXFlSZbrPQm+DN7dIp//itocS6zqKUxsTdhH+0/eDqJO4mXOojIxwmQKvoP
         LFny9yHNE9TGbZ0auu1ZI2RVv42FVECr+gnMnaA/RGnBZQ+MyGDgr1REbx7FLCCtOaiK
         lC6yEjxobTalGXOBvc83lIEofN/P1u+ejPkc/PGqVi6OWWVKRVa1QEIYKZ/Ei/Wk4/lH
         brPhMDtsVr5OE8/A/+MYdJsJmXrBQ1bAXhQrS5lk75lQ2Ph/8WcnZT4zlUCaA6jl97sg
         hPahWhJRbac6+fAd9oC3iNWi1UTcoQq+40+C/0o9FGIqHihv+s1f37wL2+VFkEqv26bF
         AKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782439183; x=1783043983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPBTjJpE1U2eSt3lAidjTgLsqQGyArQt2QVWSy0xOrM=;
        b=HD6uPdZNDBm6+J8lFrUsLbhE+VSHw4Vk5yuKYeYXIW/g01fdasETJVckcOEV4e+RhH
         WBTaA6yMEsClCUdTruBWG1FbvOZJzFa1DGpw90e5TzqdhXjnoz/9Zyvl+Tfm3Ke0OFJS
         NKpRf7JOzqQskmzhHGR5n4TeqIZ6SstD9No/9kAmN2keO/b5IGjCuXCBca4tSYteByrP
         zN1ISMlQNdSjvUgcKUSzpvqtqScWeaEeA2f8PBm1H4acK1O3q/gyReNTDyJgIMqvTyEG
         BXUYs1eSd3CFAaGZmouPJAPxk4ZALvei/kVur7N4k1vrX5AKdR3CkQ+OJYgt5rKhM4j0
         8mUw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2l+PS47igMlVSEtX90DgVGfeappY9BDMt6yN/eyFtPwsPbZecnoKr/8NwXQzdSDixXO86/vpw0PSjAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyJLX+rFCdfWJCNmBUpWqi3PPu2ZWk3OQ66hl5HxX7au2dUm5Q
	8JtOeVDxUIaAohviQS+Z2S37AkoxRkFZ64Kl6Tqx8PUHOofUJ+T9L0ZRAKDOmmmkuqU5qjAxJ2n
	w3eX9sdgfdFyMCAj7vEwui9HEx5/ch3o=
X-Gm-Gg: AfdE7cll0iSshJbp0Or8jluAwIwUT6Vw7nWl9riGxJX5MlYzk9l65MACEGedGCe3D6q
	VWdZMiQaVInW3rePc52qaDOB1rRLcNz77QP0i2xqtDHrpSxln+O5FvfIHESepwL1CK93LQC9SNN
	rqccFtu+5rYBFRn6bl1+QOOIWx9CYWFdheutfxKPBdEQGy7V5zuPKJJA3brb0LzXj5aUFsiQtD3
	5NJA48e/wBojqdemqIjnGUrYD57TAxiavjmvFI+lxayybtcr3RDi6OFc3ZdkfTWUCQpnuSt5Iu4
	98FevhVnLzYKWw9VE+MQJTiLgZo=
X-Received: by 2002:a17:902:e741:b0:2c6:a9c8:7e03 with SMTP id
 d9443c01a7336-2c7fc8a2cc0mr45389135ad.33.1782439183322; Thu, 25 Jun 2026
 18:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623105721.25865-1-phucduc.bui@gmail.com> <20260623105721.25865-2-phucduc.bui@gmail.com>
 <fffe4925-c5aa-42a5-ab8a-d8da4989b9b9@intel.com> <CAABR9nGh3nHnRx8yROqUuHLVZ1nWsDWKxJqAJaX3q+fiOBL+Kg@mail.gmail.com>
 <CAABR9nGZjz+VZJOJBB_BF72iYQtCs3Fvc_zskaHF8DPFodzX8w@mail.gmail.com> <b5692a55-40be-48a7-ba51-9c2ebe40a846@intel.com>
In-Reply-To: <b5692a55-40be-48a7-ba51-9c2ebe40a846@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 26 Jun 2026 08:59:31 +0700
X-Gm-Features: AVVi8CeC9LabI0te6xDH1BET4_5-Q2T9HKrz_iL6iYPdDIrmr7oIrNWfJ7OMxGI
Message-ID: <CAABR9nGjLPh3u=0E6a1QDpYuknhHkx43FsegWODtHWfRwA67Kw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: intel: sst-mfld-platform-pcm: Use
 __free(kfree) for stream pointer
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

> Thank you for revisiting your take.  In regard to your question, I'd
> prefer separating __free() from locking.
>
> As a sidenote: even if that my take from technical perspective would be
> a complete miss, the commit message should plainly state: a preparation
> step for upcoming locking changes.  With such statement, a maintainer is
> aware that there is more to the change than just pointers cleanup and
> placing it at the front is intentional.

Hi Crazek,

Thank you for the explanation and the suggestion.
I'll update the commit message to make it clear that this is a preparation step
for the upcoming locking changes.

Best regards,
Phuc

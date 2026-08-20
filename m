Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50B93BE156
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224929; cv=pass; b=kC9Ujp0hJSp/3eWV0SXRSY/GTFWYUU2zZlif3mMikK9nj7/wZCJ+UXb1ruzej7Iw/eSkJKEASF05otA5rIMZmCGlmSfnIpOH1zzyUdX7QabYdTINAqd50rzBrql373wL/8RySAN154VHHpZ6/Cy9nChye0raD+z/poRxvln542s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224929; c=relaxed/simple;
	bh=DplQ14TFElXbQ39WaDvUzcCzX+hFbqRbBlASoiLjzDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eN6Pi5m9JOUnewL/fEPg00sP+HyyZMC8H7wM09J+aclkuwTydIc2FNzBomrTl4XvE+qdcA2b/YAGvrrdgOqLODNdAWpTLI2rgEZDVwd6kZ+ZuLYkqcY7XaqhVFx5xc2fhz9zuEuXpxVXx8pYR5ab2OwZk/+dA8SsO+eD3SuzbiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4TDa2uE; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4TDa2uE"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84847482584so445112b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 04:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787224927; cv=none;
        d=google.com; s=arc-20260327;
        b=Hl8s8kYVxmCX7wx1zGw1xLRiWYRS+NX2+eAAPL87chE7oRrkQd/E7VLFjD5oO29OjX
         COYkYRFGdLroOLL2i2ZdN4IfXq/25h6z+Au0ISvUIJK0gssbirhLatwuDczNzwqjbzWJ
         F58H6kJjY/sDawbcN0ogexCFrFPl74XLgWdrc5JxWwZ+O03lqYJ2lUKZRl1Yi3o4DrRE
         ZmGrVCu46qYt2Kx7uKdyrbY5fgb4om3SrinDvk757e6OTlYYr/zP4vPBpIZVDPoRHc+P
         5ulV4i6BvvPs6brEt8xaTE092Nk3lFa0s855EPc+OFVduOpxUdbdo9gB4ZOjoS7R3TRK
         7+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DplQ14TFElXbQ39WaDvUzcCzX+hFbqRbBlASoiLjzDc=;
        fh=vnuTn1eWqxlvcJF4REqi3PwQ2L5lQIKmfj1+rsJWFe0=;
        b=PjEUtyUogWv69wfmox82/w6CKF2U7hQ/aOp6+JJdxoipBeRR5+HOD/vtsEzTaoCK+4
         zTkwzZznlLO8c+nf8++hnJfJcGHz8jgVph/zdko7GAhPUeCCia4WQeP66rru40Mw9WSm
         7TlAJex3mPQalNqoUiPyPikjqFOVAdksr77BUCD8s8Jaov6GJNRh08vhmwUAWPtlX9kE
         of/uSVAzKHz/jfuQBTQ/Ko/YVPCC4fzUBfYKuuNfA+EVWk8q0b3s6XioLscZnP8yVF8Y
         2HfM+Gh/U0znGJTwoyN+x9w4Xn/MITbu5jOFbs7vVnaHr6RIXFiUCnNO6LxBL8rVsUeA
         70OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224927; x=1787829727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DplQ14TFElXbQ39WaDvUzcCzX+hFbqRbBlASoiLjzDc=;
        b=T4TDa2uE3wQnDLCgOe2SKw7Jkk184t+YJb2RcJxMaNSHT5vYtJIiR//km4Yb6xtYtT
         ll1kY+cXi/Rvsxi4ua95QKuBrnWxiZ56Ydw4cvL0R43FUY+uRSK5v+Cb6C2FSrPBuMhR
         C8DQlcIBuCBh00D+VpM3EmHoPipxTTj9Db7lOWpZSzayFQZAoX4jyyHUuuKfgFtIoT1Q
         PJ9s0bJOh05ZI79pRZO8cynKgRZf51FTsxuSW8h3u+zBmPOImDrltk3lZZfz15RzW7iC
         MEcVQkEu5QFfK2q96/wrFg5JmPo/buOeuIikJqgEZsuhBf/BOJha0GjiqhhHZEiOXvd3
         kIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224927; x=1787829727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DplQ14TFElXbQ39WaDvUzcCzX+hFbqRbBlASoiLjzDc=;
        b=GeHbUxU9VcMnJ1uIBcA0GIdJ2Z4jW89eGZx+M06fEOSzuD39/GXTTbEJ3Ly2EzlmOL
         rQfHQOYgL+FTFXArrBb6L2GTDxi9yPKLdbo+hrdpCb0YYwo6pPxtS0kLhSKKcRDLwk7I
         z/8mPo3k58b5k1I1oc7PTef56PxcXjtn8TLY7gvveghoqp2RD7VgTU7HhA0xOeovR2Pn
         bEhfV2RmEISFxvaJladhFuL8LFRAKxe7MPdXUbt0iLUl/c+Z0355d+M6zbLz9O+6IO5u
         W9m+R37KYMp9Xj4gCnXBHFsE++vTHbvAfj/nNaCg3LJqMPTpmXjRY/zKvMs6xWHelqtw
         lZuA==
X-Forwarded-Encrypted: i=1; AHgh+RpgvSidHW1csWAn5O3VBvuGnVAM8q5xa7r9YdDCyoLpQ5HGqMo0LUJJrmQ72HfcGiy/v2Oezr3E3EJoew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz5XFxN58Xf3ysGk3DGWqPJQ1dQI41Nsgjv1BBXX41jdBDIGmX
	UOZC1CiZYzN5Z6xmnM7Ic/+74BbIL/SXcMR5k28WIPrpnwCp54pO9t0lribjt0ZUqfb0xsItdBu
	2EHBu4GfVqLJLLqcNT/OKfBEKrjaE90g=
X-Gm-Gg: AR+sD11ONPjEe9QeuXIHW0G4LdqEhy2l17zE4CWjovbgCE8nud/drJwxo2cc/wT79Kg
	6ZWNFzrDKuYdk98XJRFvnGFT6MAdPQSDS3hYAyZc57ZgCtxIzGGXv6hwVkMi3PiBjIxivOnamx7
	Rdji0SjieJEh4kq9q68XCeDZwyRiWBh36lMXIZGVZ0DqbKLwTpfE57OBnm1ePfkybcZp5IvQ2sn
	CbCqEzkPcUU4w+D0ojW/Vrj/uM7+oW6gT6OM2mrKx6BZCdaUEBO2Cy1gVFT+dXlYdHHuWbvD/60
	LEjEgqJNrBxQ+xbKxSVHGMomkPmlfJtipHqsZBG4y1mZa6ghZsCAvHMsiqNtXNT35ZLCVGU92NU
	Yn5k6T4/XehJLSE3oDtnuaPbNFSNu3J7zXkAk51PcMFCqA1HSes/EQNciFJoWmgEDNrI=
X-Received: by 2002:a05:6a00:7603:b0:842:446a:4cb5 with SMTP id
 d2e1a72fcca58-851df6bca8fmr5910456b3a.0.1787224927100; Thu, 20 Aug 2026
 04:22:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819101736.67632-1-phucduc.bui@gmail.com> <b85a7eff-10bc-44fa-96c7-601e80eefc3b@intel.com>
In-Reply-To: <b85a7eff-10bc-44fa-96c7-601e80eefc3b@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 20 Aug 2026 18:21:55 +0700
X-Gm-Features: AcwNN1Xqmf4X13xrwyEUJ2fuZQQM6YMt4gy6bjJzPbQcjJLgXb_ufsHBtAfIWEQ
Message-ID: <CAABR9nFcw+hZhUKCMkgs+L0JHJqFSKw9OQRFUm9e3pmNqmAg0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ASoC: mediatek: mt6797: fix wrong unwind order and
 error code in enable_clock
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cezary,

Thank you for your review.

>
> There is no changelog in this series so reviewers have harder job
> analyzing the v2 patches. If there is no cover-letter, you can always
> paste the update here, after '---'.
>

> In regard to the patch, the fix looks good - given the number of errors
> in the existing code with invalid return code on top, perhaps someone
> wanted the function to be permissive.
>
> Otherwise it's just bunch of untested stuff and your change should be
> tagged with: Fixes: and propagated downstream.
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

I=E2=80=99ll add the Fixes: tag and include a changelog
for the changes in the next revision.

Best regards,
Phuc

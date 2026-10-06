Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AC138F935
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 11:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285521; cv=pass; b=sQ5536WJHNiLKm6OuUOeSbR1HozcL3XTsxjytwHsKOjWf+d/v4viraYj7nKXkuA9HQ3sd6IHRlnzv/hqNLhw+i3TTCYqYi3NIXvbodFBTaSODt/huxPcgmmH1fYgDz+sbpO1jD2OrDrmVhxBzlnENqXXIHJeSCaMN8Qu6GmdzxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285521; c=relaxed/simple;
	bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enOphT1Umo2ZlUSXrfxOvC96WPBFvKOCTcPEKkigYYjjToY8Wp9C0BWdkBwHyykyp2EYXo1v9ZeivepWw1QKWjuKBVxWRj/+UnqIn5jg3q6xwOVNZR/qc472N0XBg0h//NiByJexyShLvlhf5qG+0f2ZJOalpGeqEsCz1ejFLp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsSn5THz; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsSn5THz"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccce967aa8dso974927a12.1
        for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 04:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285519; cv=none;
        d=google.com; s=arc-20260327;
        b=lBeEbXj0Qm9lpyqOKCtOU2U8dcvXpiTRkmRbAfFSRF/Tzh5nxJGHXzAvB3lmfJ6dOH
         Son58NS4it6cZl8xmx6Ay3RLNNBVXk6ghKa6CWTQdfcnW92rm47SfiQDB/972Vny/t+n
         ixdcmeRwJgXqQXM8FlNIyMXS9jX/p7LEGBiCeTgRTOjKfaa0LO8WiJg3mh0v7C88pSO4
         rkWnAJk781XQiUAPZ61e/ncccoTmwWmv3R18SaT963qZRfXL8H8KQ2NisUrZ2gWd1gCU
         A2xsFmd49ItHP9k1C6f9Q0f5P/y8MXg52VIc77b3no4kBQdDE8vgEGbsSboYo1iIFWfG
         Z3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
        fh=i+nQGRC5cUalw9OFx4L2PL4hNLyTA+QNouiFM3xaR7w=;
        b=W0ejFTfR8U75fEdMj0YrCnv36AnGjeMBUyF0RhLUFou67rKsSZxeMcVc5IXskNtkku
         tugVJirVnLAMQrV4T5ixUyobly328HLNa9d9jpFbaDplS8ud2vKqBJAOW0x2luLt7VWG
         9ePYGDOD6JV4B0YcQx1XwW57oW+C9/x1Fkp0pBCCrntIzpY55mgjhqETa2b5uV3K62L/
         kFkAX45U4rVTxywq/4tnk5oiuU2i7PARY4foPK2JH6A3FpJp8JyoWPxaCdHC/LDSnbhl
         4Hp4AuTRj/jPeV0l+ohYAbO5b+0DAoKoii8+u6xa/+vwFnxWeQ55XdZS6C4X0NA+yyW5
         kS7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285519; x=1791890319; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
        b=BsSn5THzP5ZLvVKnQkDrqGmTBeh9icY8yeWOz6b/qjBApXEsNP0q0OJnhPMDgOtVI/
         zIrvEqFz85AIeCbUWgUrQkJwXYI+lPZ34X8VRDmD2Sh4Wn72+EobfHkSZRkvQipLCAmB
         h/Pwk8GHSLK/nJS9mkho1Vuu73tipIqRm9oZE4JjiE4MjFPElPAcxOoxAKGajwQVZa24
         HxfK91pi1wNXnlbvahayz7SHgG/9wwVohZBcPI4t9ZtZCY3DOMw3Rp0ZgusACwZD62Sj
         9fhu0N2jFGJBlsXJscx++yFpKTpEYogaF1rRQt8PzwKNVKMHliurh/AMrBMMriElG5+C
         GOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285519; x=1791890319;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
        b=j+odnTxN3se4XtdWiYZfo6tCuWbMc1Zfk8e0bOKLwF8THV/l+4DU61fnfR8gqAOSFM
         GXGx4SHzipdamlfaBzkKb2wIYLYTrmhCNeUXHCMyxKqQqsNn3wDPtgjxdEBbh4AsKDmg
         OQs7UhdMXA5cA5MkH8eUjc0XUj3cm6kdx3Oqs2iZZ9OKnuSxkHdXZYlrLuP6333ndmys
         HRHC9kLNuO6YsRHs1Nt3Usj+ZdZBbKDkUu9OczYvWYEBFxJWdNgOUeQ8EDeTUu3bP1L6
         tEkNrcl9wvkBRaZVBVqJJPjKb90/cTR4lK6NBG1jPKLfVGOAc735xql7BrrG6a6SDkIy
         zg6Q==
X-Forwarded-Encrypted: i=1; AKwUvBziGsmisOIKxtr7I6CQ7hk2svWCVEy7beVIM7cl4Emlsu5dBpdKoARYWpt/RbiNuNNIuYYQXkxy4xLmIg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLQucIPTLNmoOo5hNR2VoJ5P+0e1oP9uL5vd2JQR6YQtinMrFxa
	LkuBKKtfbGe14lSKvqMzIo54dThAwlHXWl5iM+DOkBLPYOewc2/Jc5tOhlQHa0mQDDHo8s8KDit
	ihkmcIeDeFDGTtNgXPX8gsUN5HhjZIto=
X-Gm-Gg: AYBFou339HoRNFm1Usej872ZomAmxI+j9tNlT+5uu5VL3svrLSq6qtVYSAj/xivEKtN
	rx1iatz/80EDScabIrWiYJ6H2YOOmL0vQUY0jdDDU0sUmw3CLdVj0OGLexaebaoef1duw/5RXZo
	deRS8bB4aBt773wRUx/czgV+2nA7MBj0EeLjUkXAlS4sDHD60jeV86rFA1ILTTD4QJzqYfAGdfL
	jNGwWmYsRlcORCvAlTPBaRWmBwISi0EmUpAp2SBASX/z0iIK7LsGPiibvylvHHZ/3nCNE/IieND
	+EUVBIANpDpUJoMt2nWZLGTdhh9WIiGmTifOC5QJvmWkIBWUeXcv+JQqttJB4jyO6OJomOhLzOr
	56pxxNTMk2p6HVhINLUnqGaR8XK5Sd95h9nx0BgWYf0bsyA1/kAD7PysvuJFTufGK7jg=
X-Received: by 2002:a17:90b:2f05:b0:3a0:b312:1fbe with SMTP id
 98e67ed59e1d1-3a873517948mr721042a91.23.1791285519572; Tue, 06 Oct 2026
 04:18:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006101606.54079-1-phucduc.bui@gmail.com> <20261006101606.54079-4-phucduc.bui@gmail.com>
 <fa9642c4-7117-4d34-928b-f0937becc593@intel.com>
In-Reply-To: <fa9642c4-7117-4d34-928b-f0937becc593@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 6 Oct 2026 18:18:27 +0700
X-Gm-Features: AclHuK8llUKr61cpB9foKw2h-ehaYs9R91uCOJ-HEm_z8nUdGQwIllDsJU3R1JY
Message-ID: <CAABR9nGYB6vyR4AraotegkQzt3Xd1s+uFMF12GQdjY69nJiZEg@mail.gmail.com>
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8189:return 0 from
 mt8189_fe_startup() on success
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
	Rosen Penev <rosenp@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

> Nothing major here, just the missing space between 'mt8189:return' in
> the title.
>
> IMHO the title could be made more explicit as you're in fact fixing how
> the snd_pcm_hw_constraint_xxx() is handled by the driver. "Return 0 from
> (...)" misses the point.

Thanks. I'll fix the missing space and update the title to:

ASoC: mediatek: mt8189: Handle constraint return value in FE startup

in v2.

Best regards,
Phuc

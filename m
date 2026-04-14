Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAE61EB5E3
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 16:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776185281; cv=none; b=BxkSe0kTE2lEaxpar7tNpokg4VfLxW+EGextOBt0CdvFx1eejtjYXTT9engZyoQnvpk6VP1pC3iNu7+LOzQ6Od3UIq5UDMqxDP2RbkxTZUAlym3v0vLqWTJYBs0kl0MeqtEU86ArQ7KBNWfNpJ/w4bHOhfWzlPSNJ8Fatm45mmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776185281; c=relaxed/simple;
	bh=yOoDEbtTLqc7Oor4eMr4vSvXJ3X2yX2tzT47DPCL+Ao=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GkbboJBkbmIkzRlRG5o/GwmsZNTePzy2H5a1fqvIwU3n/nesS5mAyJQGj5xO7WawniJgh4QlSruysSBvrF2849tGfD+lDh4R5r4445JdSW2wCFspM/XNgWVgiHRNHtiBVzyC2+MkPVEDwMDVoGvEW5MdUZQ7pQAb7JWlDsatjn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKV1ADda; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKV1ADda"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c555f886dso1221882c88.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776185279; x=1776790079; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3o0z/2FvjtBJZUxAvdr+rXxSitojqawkrmvLdj0xJw=;
        b=IKV1ADdail8bncKbQuZrtS7xyxIDhYTa21ppYIKJ8cs/NCftqI5LYQdTtUUWSsFaIe
         JS5bVrmH0bP9Nnrh487Fz/zDFxxXMadTHgqPsl1gHPB/Mmv7zcsLev6HwSktlVm5gxK0
         vzgzQFNA8j5eVwkpkxV6Q2zI43pfqLXn4/9n4V56egRjauG5OoGDInO8QVKvhe+fbtHs
         kZ3IS0VUYId48bNLOkbUyGeIa6s1OZUCw7Ps30U9KwtcetJM9PXWR8+BNtuzHiAX48n7
         ShKIVrWSHZgQ1U/qgY/i4Dj9lDb2lDE/fn187E/+KmVcGXtXQWXDVtbZ+faidI+mfzAG
         2IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776185279; x=1776790079;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3o0z/2FvjtBJZUxAvdr+rXxSitojqawkrmvLdj0xJw=;
        b=f4Am06Q0Lz+Ylo2EV0o9a6WJNFELgBpJSRCy8Mc+d3b5oOs/1iz6Bqf2BDfAkBCLvK
         6ir+OhUxm3X8RJhZ6ndqzazWLJTys5Oyg8elsX2QcgjNYP6wxCrXggTkguuScrCdM949
         bp1VJIt40mtLz2G1mJXYMVYkUChzBQs03w/TxOtDLYNlvGMLjxCkmSPZwGf1+bvpXJgG
         odXbMdPcNZB/Z3+cu52UV96s0yqEpRh7OBXohYKOEsc1M3sXm/zdxt0eh3VHQnk1uIwd
         gu8w54EoC/sW1YXwTCIwcPOlJk/zbP4kZHyeu34WmVjoO7kzeQfpGejcAlDZVtCkCLzu
         xPKw==
X-Gm-Message-State: AOJu0Yzj/x/wOGf3bTvMfjCTuxoUwgQ/xRZZG02JNAAEg60z50WngBNF
	kxOJ73rW29oXNDcsD/WyQj5XBTXPQqd9roRJXkqrUl4ELDGfklVUTd9QhlaJKnaeCKU=
X-Gm-Gg: AeBDiesIud8pL0Rsj5IKsJnI+kyte/MYb4TayRDWvxvk2lN3dxFLF22D7AiFREhL1wA
	s0WItd3zfqJtHLwf9dAY/WHegJRUVIGpXt2Amt5rvsSfGrvbVgrM4meL3BFyKbddmHzs7mot1Ki
	d7mIlxGyo7S+Ar8M+JZepTQ1b9Wi8Nqe5jZRHPW/tyviS76mnZapw573yNbfGDisUseQsOixmy/
	e6XASfGNYOKgNePC3dtzCZ/a2SgTtUklSnOVTEvkCremIVPyORcdTMzfg/aZnL70OCMH3kD6JE4
	tdOrInsE32kenQXdP2SgUZAYiCkRX2oOnydK+SFf1KeMU3Gc180I/XShs5Gag3sScV1nAY8SPbW
	tWBgAv+nWy+Bj33ZN/JYYUP2tMhazVclLZNv8SoY5G7Br+pc4h/kOokCSQV99kb18ndqJ94daqs
	yy5+Iz1mYC2JgEgynUMuMHd9EfdLe2BqIX+t3zJV7LwRIzd+UjU4zZzrFSxDup77ZxMRPMDbIjs
	UEn
X-Received: by 2002:a05:7300:cb0e:b0:2ce:f3d7:221 with SMTP id 5a478bee46e88-2d589463e5cmr10725702eec.17.1776185279064;
        Tue, 14 Apr 2026 09:47:59 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de130e056dsm558584eec.30.2026.04.14.09.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:47:58 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ALSA: compress: clean up pointer errno handling and
 fix avail errors
Date: Tue, 14 Apr 2026 13:47:52 -0300
Message-Id: <20260414-alsa-compress-pointer-avail-errors-v1-0-f5a1a8b1dfba@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN0QrCMAyF4VcZuTbQlinoq4gXaZvNyGxHMocw9
 u5Wvfzg8J8NjFXY4NJtoLyKSS0N/tBBulMZGSU3Q3Dh5HrfI01GmOpzVjbDuUpZWJFWkglZtap
 hdtGfjylSChlaqE0Hef9Orre/7RUfnJZvGfb9A6mOWk6GAAAA
X-Change-ID: 20260414-alsa-compress-pointer-avail-errors-d0b195cbac2d
To: Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=yOoDEbtTLqc7Oor4eMr4vSvXJ3X2yX2tzT47DPCL+Ao=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJn38ndvfD7x/nqxlr9MWXKr/s4WejjXir3s7H6hnzXLq
 /lDpmxh7ChlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJSKczMjwzd7+eyJ/rOXfy
 73fBB5b9viPSW8H4K/OTMqP8wnki+zgYGW6b8NRGxdkcMzLRDq9g9Q90+/dhS/PsGewyC8/xvI+
 7zgYA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

This series tightens compressed-offload pointer error handling in two
small steps.

Patch 1 switches the internal "pointer callback not implemented" case
from ENOTSUPP to EOPNOTSUPP so the code uses the standard unsupported
operation errno.

Patch 2 then propagates real pointer-refresh failures through the avail
paths while keeping the unsupported-pointer fallback non-fatal. This
prevents SNDRV_COMPRESS_AVAIL, read(), write(), and poll() from
continuing with stale availability data after real pointer errors.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ALSA: compress: Use EOPNOTSUPP for missing pointer callbacks
      ALSA: compress: Propagate real pointer errors in avail paths

 sound/core/compress_offload.c | 55 ++++++++++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 17 deletions(-)
---
base-commit: 05b02f0ccc12a85c6b65cf9cc543151b160c7f49
change-id: 20260414-alsa-compress-pointer-avail-errors-d0b195cbac2d

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


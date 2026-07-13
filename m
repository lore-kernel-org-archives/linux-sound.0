Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A3E2EB5B8
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 02:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783909588; cv=pass; b=rvKNSs+CJZXu84AxWa1RottEr2+MH9VvxnM16YJdptqEH5BlRJl+GlJUSv6xw27Sq0s8b6hvR/g58C328ljBteHlx/SaJ40K/9BL3S1VaJoyjdfhGoFoEs5CFoR8WxaxQWhpAFJcm1ak7S9kGG8EXly6154c/d4svhQQq+0FqaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783909588; c=relaxed/simple;
	bh=2vB+uhwFIY8gMPcGZcmqL/ngXLkazwzz1dcL9UAOl3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NS3mEXoZoN+NL+ZVqrvU8q1dq1G/qrzDzKTXkPFlY59g2Cij0/ZcoCwzV9U7w09tnEm9o3TOt0VhioRay7MIBG3yiAdj/8jQZH7ozwWVe1MBHC5hF9lILiZkHubzmzd11Rzg5O74d2K8MIp4Kh/9T/rtZdS0K240gFfmNQBbodw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEJWx1BY; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEJWx1BY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c7cfa17fedso37378105ad.3
        for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 19:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783909586; cv=none;
        d=google.com; s=arc-20260327;
        b=LmTMsZIe37zGySwmay2EZTHYinaNLbbGzErWKMJMNkWTXg8YfvN84V4kNxlTxKZskV
         +aK0uGOgiAK2Qq0HMalf0Zhks/F8ROAcD7zjCwkvVKoXIKfi3qmcWsTxR+dCQACrXhtJ
         z1V3yi78tpH8Hno43S9aAurXpn/FjDhJ/G4Vx0q20//YP7GewfQP2ORzpK/wGOLzI8PX
         A9ISmphUsMYt0Fi9+GZyZ9P1xjgSVoZoabywYwN3Xc8x+cwYclPO16SQ3AI+P3lmLWAi
         Rq2dcZtgcj6dzBuPhIUxV+yH/9JKVvANM+SeUQ1bBvN5nc+10PFkRMfe5vr1OY9YWePl
         vWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=;
        fh=105oUpXhFMgz4geLse5Ll3z4bJ630iwIauePmftAxEo=;
        b=iUHWmTQusvoy11iNvc5/Mufj5Py8mXW3rsLKU9UJteicYcUyE/gyZFN2nQYbGMRpNz
         1cPd8Wo0QLMPg03muN6XMJEcSu/K/47XnNEXpT1REUlDUtoWSJk2rTwGt93+v+XlDk9W
         F/YdsH7eBrhfI1Kj390+OFpWs08oLtdCM/sKes+a89wTyilPSw9urcIkVHW+ZBr2xuB5
         agh6U7NmGRJE7jWYX80HaCWDqVAW87l50ngtEvFu1Agj/WK36ca/UasXFBT94RDrQvrt
         OEbjl6v3EA+SKqI9+67Sa27l7oxvwp54ptePoNi+I5Bf0YeCIyCnG/mpAYGp0uvkrGuK
         nO6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783909586; x=1784514386; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=;
        b=MEJWx1BYAAU6IPK72aJg9fQ+Vu0P9xWBzhLndGfqra3sgzedHSVHhkLuib8Ohfr8IY
         WE8oi0OvcLAr1VG77cgaF8rXcziXB2lhv09JiMV0bnhXNdbuDb6KLxexQzlvX2XN5qRC
         nBnpbHM5gN5wGRLtApHX9L/FB50ix9rnS3b0h7AnWj2K/JAFDtOUvioqaaas0g+HMRQw
         kxrVt1eUWLM36E1QutLQ37PU5SRJib3us5wzSk+yi8mM3xlQsdfvfQC/mdmKBmG/v6mD
         2mAibClTDMSEURw3kF4v8aKRS0HXzdQwz3E/EdKQPrMu7UbCKGyZriSJDcAhy9xtOJuF
         Hxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783909586; x=1784514386;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=;
        b=HXbSdYzhxvhRKIZxgfCxu+uBRPhOBc24wlsbUh/QqEioQvZvD8dzWnknxdOyKTPu7M
         IoJc77AGhLaCyz5x/jed5bhw0hPfVLHz6bGXh8jrxsuEkjIdp5KFWbstCevCMf2/Cbwk
         BCvzsdgUHh9SX7iIub8VZ+u6SW+bUgoZD4LP2OGwUPcX886+BQcH6W/5QlxZuWzGVCMO
         OSvm06AX9Vrtt8vLBXLscK+qeWiRa6K9cgiXVJwOTxdkVAQ7C+V8NCERVklM8kxrGPHb
         X2r6cE1y19QR263W6JzNdo87A+oettswI47dsqM7upBLfPObOTharXKc6swVHP9cXY1z
         QSzQ==
X-Forwarded-Encrypted: i=1; AHgh+Romnh0auDtmE9BNJuG8WXIo/MDlBFkxOMbNbMB+G0GYKccR6XMAzUNxmNmFTRpGn4Sr1l/wBzEdAvrHJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze2G710nB380GbakRTfHWGEmmehKHNAlBB9JjewMTkUE4q+PvP
	wQZPWCTTKDlSuumUUDbQbsIlBHP1Q+d588PtQOKO8GoJnME4DaZ58RdzQVaYRo//ByGPHhFjZaL
	6HGECdQe8dAiCTZ5mf9c3G2alRrEIA3M=
X-Gm-Gg: AfdE7ckUSvvjuQoXXNit5e23h0BDzd9hOoDvqOif9rl7SADejpG/r0DF8qBQ1eUaLwb
	TKNX2mqVsR2wfTi1NvlGBNWJJl7pgJuNRxNRWTNgX/v2VOZMTvPdX2zGGAG0NEgVclGCA4kId9A
	hXgoZqwnQO88hW5ncgg6FpNI3pSx5xwPzomgzi++7XTmxkt0XlFKInMKdLaZbWO8X18p5n3uPO/
	avVwr16lWgU4K/HQfLrJ8+1UIi7sqJeUn14ylYYYXw8NlqhTBg+D8qZJ21SUfmNVAOhG6EMujXJ
	VlSnPCJnweJ2N46ga2QcLhpFmHMN5/jRx9bH2w==
X-Received: by 2002:a17:902:fc8f:b0:2c9:97a8:afe5 with SMTP id
 d9443c01a7336-2ce9f27e6dbmr67887935ad.40.1783909586414; Sun, 12 Jul 2026
 19:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
 <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com> <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com>
In-Reply-To: <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 13 Jul 2026 09:26:14 +0700
X-Gm-Features: AVVi8CcDb4bcqHg1Mp91TuPyHToFqGPv1UxLDhLLf3L4cwg_2AzYrLa7QzDha2M
Message-ID: <CAABR9nFwGjed9SOUZwuPNu58KPQD-aWnCKj7YTTM8LdF9dig-Q@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Another point is: when should regcache_sync() be considered to have failed?

From my understanding, if patch application or cache synchronization fails
before reaching the out: label, then regcache_sync() has already failed and
should return that error.
However, the function currently uses a single ret variable throughout
the entire flow.
To make the failure semantics clearer, I'm planning to submit the
following follow-up patch.
I'd appreciate any feedback.

------------------
int paging_ret = 0;
 /* ... */
  out:
/* ... */

paging_ret = _regmap_write(map, this->selector_reg, i);
if (paging_ret) {
        dev_err(...);
        map->cache_dirty = true;
        break;
}
/* ... */
return ret ? ret : paging_ret;
-------------------

This preserves any error that occurred before out: while also
reporting errors that occur after out:.

Best regards.
Phuc

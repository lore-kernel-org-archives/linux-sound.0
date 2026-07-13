Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94804383338
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 06:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783925063; cv=pass; b=YEWy6V63167vY2oA3s8ZSmd1+jNxpXEoS2ntCcsRh7Mpx1zTZ0FEa5Dxeow4ku5jV+BL9QXuYermAQZYdM4PIvHI55Q9VBdgNLgnbpzLRd40JLj5QgYr6qnqHcrifMwmIS5RSDJMQDfKFQCgHzhGk/ycmWtKDv2nYe/J6jphNl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783925063; c=relaxed/simple;
	bh=tCZX3NCic6BVe2JnxKdTxhPYBW5qoICqYwNfWeZ3J/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K//WCtns4H/Q+fMVYUmkfCBTbmV2IPWQLzH0G1Ftv1F1bJT1xlFmPYmFu48pZV+/SuurAyMKla25jQnipxEdXiCf+eRP7ZBe7WkINavN6u7S23zDa87RGBfXJExljLo80DDlwjqmf9jJzwvdcRBuoJfzU7qcyzuNpHXRobGpxIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RETpMi5e; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RETpMi5e"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso27679705ad.1
        for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 23:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783925062; cv=none;
        d=google.com; s=arc-20260327;
        b=g+QPwj7Lt28FsF2NWuuhbS+8J6T8fvSIC4hI+ssfuww8aTcgdIPy3LInW9mBJXxYIo
         8IZw731IDTH6PF0MpIEa7tY9VoWGAbeTI8k7IAl412ou69IFUEZWAsMqujASiN+4TK7Z
         I9pcEH4qW+gzQFDaUR6MDP+sBpgKenZ7shJVSEbtQtLjbqo316jSuXdtFjfsqEiIwBEQ
         rKh4v2n/LOssUe10GuUmSkQYB4rfPCSqflUccBaoDA0XlDkawg+7BQmGmgo+xUNCQZQO
         /kL4NwS6KkSA254cnGS9FutpBB3BC+MDQxjYRnmG0NeyUww9+Ux7cJqk+XDAB7gwF+jG
         44cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=;
        fh=hoxHtcXmAa9LUN84Q8UaqZ4QgSXeKiyXFa/kqzPUufI=;
        b=e/phOXTTs9bDWt2KkL72CYDEYmj5flDtF1ysEQoCjDIs2JW3e3SpzV1LvQVF6ZXr/W
         tvr7O5W6le1TtJBNKY1+SqRPf6W9ivc7J3gMIjPahbY2Crbs1MDbPqr0lolA9CSa5BUt
         AZ3hjnHGNrJeSh8Uiz7PFRlN86A5NPM4Eb1O/+Ce9decOZ7vOHnzGlLufNKHy9CspSU8
         SYi+4t6n3rQFOwX9tvzz9QF+lfvvWgqMxFvSJMhNZDF49Cyqf3OqpvYoek4yE8L6+PMn
         ZZXNqzedXVs0z0bE0MPyO6HP8+QnxVKRSBuRaJvAJ7dOCW6x6pXH9cn0l2WS+Vzw9k3G
         iXDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783925062; x=1784529862; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=;
        b=RETpMi5e6FxiNi0K52vnUTjg17nG0WTZCfOipCRNhjhDDff1iBL/pk7MNJ6Cjz2bwC
         qPlOkfgzNxlQBQg4NThdOlnfQaKGbKF1Uy32C0R5xQFxFmoj6XIFE+XZ0h4TI7jr1tqs
         h9HhtJqzAig33xBkb3RdGCqr1Uk2d1N5LHqP71e7yQZj3lkt4ohFMFTqGmVDAvKx0H6r
         CPdUw0cbPO4gLDiBSEUZSzOeM+tN4M8hnLfGzTtHibyaClMziCj7pqzX2sua1d1NZjxX
         tXMaKzJ8+8wUN/YU0ZHn046UFXTrrMPRtAGPxKKZbZks1CSibmb6Xm/h+FZpUyWSQkPe
         l1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783925062; x=1784529862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=;
        b=gOycsQH0LWHglfIR1WLejY4epI0+9O53Ac02gU11WOhuyX2aralewQ9BRZzh8YEb7l
         LfgncfFIlqK+G2JltjmX4wsZRqT1KW/dhM3AtYmHHee4p3Psn3pT42iK4tVK061RbNi5
         zLie8W9RgDuF9s3mDrRONBumszGV4sp1SMY5peFHxB22tqo6fC2AE/atjIcaYzapb1XO
         3soxOh556HKhdE3ryHL7xbsJGv02eWibIF61r3UKUUyTGnlDw+nWN7Al+KSfsUNWepgU
         0TS9zqdg9UJZO9I14tosS8bSOVoxB5FmtTqnHIV2apmoShMRbFXU8YwavdQWms+Cpx2B
         285w==
X-Forwarded-Encrypted: i=1; AHgh+RqpxywQCZwoPHRVOWqiXQwjjM7jXqv6+iZk1fD/HBi3mX/hOKt2dti1qGKON/IjOSQT4w/CbF1KX9YauA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb0wimLyQ8r35Z0at9XqLVTzVw3XrowQMaDbm59SvFrBhZX9DD
	5e7qwh8kAnpX5JXI5EmTC9P15smo0V/eiiK0sM5Ar/ydrc1g2SYxU8PqJod13p8n5ac9zErRf1v
	MZbDuxr6PdloWuXFaDOT0Xamg6oyfLWA=
X-Gm-Gg: AfdE7cksV57BrXsesxNwoB0dye/+zWwKWIFwDDIBrlNnahBZZSPneJMTu4NqNWS+cGv
	6lecdOekT9vrwNF+ME4YQWVsTSfc+3Le+lUxXo7rcjEyVU9lK6/lY4QrgFNdiNPkT3o2fRAoLIC
	+WhFnn0Gp/jn4ZcgVxdlPz+AGCM5wXAA0NJMtj13Yj85Yyhay8Zpegza4OCt8NQz7dLs7bDywwo
	oK2WVLg7D71w0z+r/Rv/dP/RTHI/J25GTKRWgyScLx4OnMBaRmobdKHYLfGmGVqRcZXfzWe9SYJ
	1nqU2J+OdkHo3NQVucrQjchCSRY=
X-Received: by 2002:a17:903:2983:b0:2ca:d666:df72 with SMTP id
 d9443c01a7336-2ce9ead1556mr77128045ad.21.1783925061877; Sun, 12 Jul 2026
 23:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
 <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
 <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com> <CAABR9nFwGjed9SOUZwuPNu58KPQD-aWnCKj7YTTM8LdF9dig-Q@mail.gmail.com>
In-Reply-To: <CAABR9nFwGjed9SOUZwuPNu58KPQD-aWnCKj7YTTM8LdF9dig-Q@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 13 Jul 2026 13:44:09 +0700
X-Gm-Features: AVVi8CeGlggaa6vmgFhAFOdY55QEWtxhqiyXAaixKicXSNM4i0jdxY8z3i5uafQ
Message-ID: <CAABR9nHvhufH-+2qg9DDa+2PsU5T_qn9EV25pNwirKdPeSdX0A@mail.gmail.com>
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

I'd like to confirm one more point.

As I understand it, cache_only must be disabled before
re-writing the paging selector registers. Otherwise, _regmap_write()
would update only the cache and return without calling
map->reg_write(), so the hardware state would not actually
be restored.
If my understanding is correct, I'm planning to submit a follow-up
patch like the one below.

---------------------------------

bool cache_only ;
cache_only = map->cache_only;

map->cache_only = false;

for_each_selector_register() {
        if (regcache_read(map, selector_reg, &selector_val))
                continue;
        paging_ret = _regmap_write(map, selector_reg, selector_val);
}


map->cache_only = cache_only;
-----------------------------------

I'd appreciate any feedback.

Best regards,
Phuc

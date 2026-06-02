Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EA73D9022
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 11:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400698; cv=none; b=om5bXdJqOWz700cmd8v37meQUpvPJS71hEQmWqlGLSq6qwLsaXM1bCAVq0/ue7rZUgQgEzqIH6hxVOtRDYqq16lSN23TcbwSc81YXQp/xFd2AS8d5gwUXB6A+tKpQfbHTn1x9k1EMtQ6URKw29BxOZz8KCngDH22PFjjj2WsuH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400698; c=relaxed/simple;
	bh=D+0XMPW39FnLt0Zm7R232hYbFcRPALekEAH2h8LzSUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJdatUdjNlf5DXjVn4Q8u3ZX1DLzasxdZhYMMZHJ2fq7a0fdr3plQbp+dR3oxEWbcY/tG4qFxhxV952fMuPLWy9WfkHF/WjbOKIm+htU1FFzYm8RCIWxKU8xTrJ5fmTMcHrz1lGqYqRCP/I7Lv/WipZSddD9yShGdKXHLB+KNYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTLFBg2g; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTLFBg2g"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8421f0e9c5bso1360863b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 04:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400695; x=1781005495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yMMmEmjYZwsBNnBuWQ83+blc3WIchW2nd/w7lmU2Wns=;
        b=oTLFBg2gg+gcERys2WIWSM84xtW5T23guYo5gf5GscJANqDKC6wEQ492P28WnxzCkf
         EOV6FC66UsSPZT7NfF34X49hDoqz72PYEll/OqLpkZbg1M3h9MTseoGGOg/csGY6hRjA
         8uD+eIX72dENu4ZDppP9KsGPXzLbTaWPly7i3VmdnAPLLsXUlwiKAX3zlfn5tSwSg+bf
         zMwlwXe52ij2XxkJLhAS6If9YZYEczG+e0skkl3PYB6A2WoQIt6LswvD9vFeRuWf72qK
         O29OQAR8Xsg42QHnzrpkTfAIDzFwUpr1RxIv8OBvLC6FP249J9x/X48dOZyz+hn+g9jM
         vyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400695; x=1781005495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMMmEmjYZwsBNnBuWQ83+blc3WIchW2nd/w7lmU2Wns=;
        b=l4Rhqi6TrZp10ZUx17rRVkWI3L+V83RG8Xi4owIMeOv2XGa1VtmFA57DlXvbbJBqI0
         7x8BkB0WmcOT5hTbp2qoOzPDVXMEL3Y4hmDUpC22lVBtBj+ZqLBITGyK+89jkSjtGPUF
         URmuODdDmP3Uw/MhmnAGgm3argwSDSZ1Uo8b7xqUe49zp1DL1Lt4iuhiXClU5U7Sqmt2
         GTUyVUt0ljRjMWO+WZVZeiVUo2h9BVdn6ais3v1PSyiobxXoJq89jUa9Ulqlnt874998
         hImWBnD9T7jVkV4iKlVeDFh49cM143lKi7+W+mag8Cuv1h1aVAUQLJ3lESekltzIW4Tw
         MXOg==
X-Forwarded-Encrypted: i=1; AFNElJ/mB4XzeXIh6uV/jbGRm3Dm4vi7ar05Jgm5i2mRwySY7Ikp3Bgpmwyxz9kYZiRMXFmzbg9IKo2ldHqSJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGK6XPRIdLwmHVn5zwTdyHZ996QAkgnjPJTpDf8YtY7DOe/5uZ
	Vz3NVH5Mnv3oZLC11+EsSxPW/1jiJ/Iozzs29PiODB5h4tSmfJ/hxzjH
X-Gm-Gg: Acq92OHitA5ROYjtu5h+f3cotnezS+C8Mv5VrZcklIp9fskvvPZ+9XZyba7muDIl8ng
	pE3WKLYAaucmeNag5hUOLq9v9fQJuMALp85SLHW2yRsB756X+N3kAHdzvg0UjwQjoVyeW1s7amo
	o6Ix72Xrk20xs1UQZmtifVr2g7m7mxdocsbwSeAx8Sk7MTcmWjVoBXf+pHpxK7o5m/HKhKGYvQb
	ugr82MCcZTjucFn3Oiq9GA93RhUJebkJla3dubNOl1RQAO2dVcVjXOuQZY6Yak659KiXoZLi/VJ
	AcxdHZBzD0rAkMoKbpIN8kYdTnDvIl2zciMs1iaL1+OePeNDY7xCrM9eUk2JPtHasc43zRjvmpR
	WEK0pLaGttQA1k6tzI2nyQrILY2foXpi1yoRnUpmUsPl8973LsdhXYKI2Jr4WKu+A/OFRxe0Vkh
	0Mg4XZv9AS4phvquJI4LAnSUg8/T2RI6VBf+SUIKXmrnW7OpRIIKuSZ+iIjgPJy3NVtoaG
X-Received: by 2002:a05:6a00:3762:b0:842:2f3d:dff2 with SMTP id d2e1a72fcca58-8422f3de52amr9540311b3a.34.1780400694676;
        Tue, 02 Jun 2026 04:44:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842263539a3sm12025224b3a.44.2026.06.02.04.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:44:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 0/3] ASoC: sunxi: sun4i-spdif: Cleanup and runtime PM improvements
Date: Tue,  2 Jun 2026 18:44:34 +0700
Message-ID: <20260602114437.50324-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi,

This series contains a few improvements for the sun4i-spdif driver,
including guard() conversions and ensuring the device is resumed
via runtime PM before kcontrol register accesses.


Link v1:
https://lore.kernel.org/all/20260513105003.81880-1-phucduc.bui@gmail.com/

Link v2:
https://lore.kernel.org/all/20260522095401.72915-1-phucduc.bui@gmail.com/

Change in v2:
 - Switched from using guard() to scoped_guard()
 - Added runtime PM handling for kcontrol register accesses.
Change in v3:
 - Clarify in the commit message that the resume sequence becomes the
   reverse of the suspend sequence.
 - Add Reported-by tag from Sashiko AI review.


Best Regards,
Phuc


bui duc phuc (3):
  ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
  ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register
    access
  ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence

 sound/soc/sunxi/sun4i-spdif.c | 76 +++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 34 deletions(-)

-- 
2.43.0


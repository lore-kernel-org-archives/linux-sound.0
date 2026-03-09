Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C8A36B06D
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 21:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092956; cv=none; b=PaPBDpZYVZC3kr4F/3f2pMWUgU2x2C+TwEP0OddFbnW10SP+c2IZIm4S4Wb5kP+JDyfoZNoIesxrXG1lDvPypxEi/IpEm++CnlA2gsWCP0qRu4S/sJhYDYX7JWRhjFBdn/+sGxmj8rt8P/g29S1RP4oJ77DHzIZDhw9ufmkKN2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092956; c=relaxed/simple;
	bh=6ZepANxP71vzTeeFkk+myydgIBPE2f4n8g/mTa8Namw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EaIPB8dXaExiV5myRKdnOVD4pj2AIRGOgwQk+3Xaz7Z0Jzv5qUaenyCpx4u70zZ0ndqsysBa+Un/pV5sGkF2JM0P5ErmRRUJspX8yEZmWkQUEdVkue1A3pARr6I96EvQVaqVh7Edcmy6RZA2HNINP6LOW+Y9MnSvzbHrva7J7TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCT3QN4R; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCT3QN4R"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso98548285e9.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 14:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773092954; x=1773697754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCOiS+RSyl4rQ1CP4ex+7wZZ9gyZAKKhYX8v9rsTRMo=;
        b=CCT3QN4RX9Iejr0WM2iO/GPLs/unHLfd2ulBIPwvzRTvGg/nbewywn+s+1q1aT4HhX
         O2U9m44wWvSwAXcJEgmQkHCy/ak+p/thJOx3no++mn4FISmP9IcaxH5RwL9NONS8YHe6
         WcWhbhIA9yB3N36K3GDMuTFBk9887bCbWbh5t43PtJjnzc2crXF/fDRIf8DIAEdSQ4fd
         VZR/cxeR+B1yxMW5p3cGkRqJT0bHxJhZeLc+muIuMtdRAw27kvdTpah4yaS3aRM8cx63
         oR+BFjVZmzC/e2GzfRQQ07VOHsOuw9QlQ+Iy+acVqsmKecX/zyv5I8kDJPT4aM8dy7Q8
         80GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773092954; x=1773697754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UCOiS+RSyl4rQ1CP4ex+7wZZ9gyZAKKhYX8v9rsTRMo=;
        b=fpd5vzwbrNyDFX5yZhzg2SVhewkd30C28uhiBHxgsln2Mkj24RMfgQYwfYBQ0LbPac
         xdeXD+vJkO8aJRtMyMFwdk9+jIMgCyxv/cED67uPH7XPjFusYLVmzxX+RQuVZmfwkPrK
         veUf6yuB3KuKTT7keyEm+qch0u7yOQlxpibn0L/AUB2rS2K3jl+ZQYHHmCBbqkwPqyXJ
         G8tWYZsncQBpQzOqYtEjwEkoD1A0jmmw7EdFcfo1n0a4OMV7+flKuaVlBrM8D3xeZJa/
         gX+EBmb6KL9BsJ6Iniic/b+zWDzMk8Q6APV1YZUNdoA6jEdx1+wiG8NZSsaiPHxITzjr
         rjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg+T8noc0xQDw9yQzvmaoUtu8slTE2DTMb6Pvx7Jsne9D5OiDqkj+yLjGu6y2IWK4l9Z4gr9P7Q68kKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj4SHcgHyjY+amUYoJEut/6kWjWJ70nX8Qk5hAaWz8cQJJzdoI
	KOPMQ6FHg5R9SZZ/kZPY1/HN8CF7fwvy25i13JBR2iemmVbMM/QD8j4=
X-Gm-Gg: ATEYQzzc59ba8zgMd/lFjBeQj2iPBqBTEZSTGvR/ZjikoNrJFdrz5JSr4ZyQJLFR244
	Sk1l0pTWnhjkuk8alrtwCwbPqtrbnBbNN7BmHJB+LodunyDT6nl3udv0/E/H0kfnipBYREdacIK
	9YzerfRISaITgsbMGaTVvfS37U+p+Qjucfoqf2A8Ghscz8Lmo7HqDT6h5yn1qVRI2bRB573t4r8
	2JKQqD3jcjCOHkWhkIQnOxnVi8Ye/3SfayQXLn03tgSn0bl9VSExVo5rc3IONzbZg1UsCE1VJfg
	yJathjSh4JhGrRhb5riq0gepytmuGT4LC6ilwI4NoYQkG1SN0K2/m/gglNDeQ49Y0XB1eWEOQzU
	9AXBGosBdcuGvLbajGEfa2TMpJvhg38Z8eK6c6130fClb8yn9y3D6r60pGjWx3RWvV+nPGOijmX
	D9cIZhmARb34J4E6mayoiQdxTX2Nntu/ggf1pNxqEFeDKcKu80q0PdqA==
X-Received: by 2002:a05:600c:3b92:b0:485:3b00:f939 with SMTP id 5b1f17b1804b1-4853b00fa43mr93367735e9.8.1773092953435;
        Mon, 09 Mar 2026 14:49:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e11:2401:e440:4d43:1ae9:c232:cc4d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485246fd127sm149015395e9.6.2026.03.09.14.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:49:12 -0700 (PDT)
From: "matteo.cotifava" <cotifavamatteo@gmail.com>
To: broonie@kernel.org
Cc: cotifavamatteo@gmail.com,
	cujomalainey@chromium.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	srini@kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH] ASoC: soc-core: fix use-after-free in snd_soc_unbind_card()
Date: Mon,  9 Mar 2026 22:49:06 +0100
Message-Id: <20260309214906.543639-1-cotifavamatteo@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <17591222-b9f7-4056-9c13-4a2ccd0788df@sirena.org.uk>
References: <17591222-b9f7-4056-9c13-4a2ccd0788df@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Mar 09, 2026 at 03:01:40PM +0000, Mark Brown wrote:
> That's exactly what flush_delayed_work() is supposed to do?  Are you
> sure whatever you're seeing isn't that something is managing to schedule
> new work after the cancellations?

You're right, I was wrong about flush_delayed_work() in v1.

Looking at it more carefully, I believe the issue is exactly what you
suggested: new work gets scheduled after the flush. Specifically,
snd_card_disconnect_sync() inside soc_cleanup_card_resources() can
trigger PCM closes which call snd_soc_dapm_stream_stop(), scheduling
new delayed work after the flush in snd_soc_unbind_card() has already
completed.

> These are two separate changes which should be in two separate commits.

Agreed, split in v2.

> This now guarantees that we don't execute any queued work, presumably
> something was expecting it to do something...

Dropped the cancel approach entirely. v2 keeps flush and adds a second
one in soc_cleanup_card_resources() after snd_card_disconnect_sync()
(so no new work can be scheduled) and before DAIs/widgets are freed.

v2 incoming.

Thanks,
Matteo

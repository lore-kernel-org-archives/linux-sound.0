Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1999222D4F9
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 08:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569558; cv=none; b=i/gIW9ianA5vyHHqw5KXKHe8ph00mcfE6onkpHql1swD+/7cgilyrw6nPnMcTr4PTLKm704BN0wswfLrMemXkvod/QYTIq3rpJ9AhlCv4ZT9IMw41HN+/qWQG08gBB04KH8pHlKu6Ctuv36FzWOkV+nDTDeoAVc74JemR0cHjYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569558; c=relaxed/simple;
	bh=/dIw5PCvbjXSX8tu/5SdpFQVt6TqWWXNHc5eW4qJF/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AEIVBBKvD68Ruxuq5Pw1x1qejgNQEU1LfThLgZKprLYyX3fObZdb0weiFG6QD7Ljs1o4QVH1RT7Iyq4sfZql9GUGUSDk2tINK1yu9Irno4rns5ZBoUy7Hz7KFvvju+/RKW+AMMtWAp6LAf0pTpfdn8XOX4UzS2LL0FphKA49luI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Oa+0sqLr; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Oa+0sqLr"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af589091049so1392270a12.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 01:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745569556; x=1746174356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jcz9EqU6ZQpMl1zFWZpq4KGu3DkXTYoxIWYCwpKvcbg=;
        b=Oa+0sqLrVqGPPpaZ+H32VwMoNRlOcxq3ssRporMwtNEwbjIRWsFG9gsXxXeFPa386m
         sWL0HmHxZjGu7Zrjq6+eWSGjmlICho/kiSSt4el1Kvg3ZBMMMgTFL5rJi47f4Dli84p9
         mJTFnY+WMSeWmPrF2D++NQcyYBprak1YqXUXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569556; x=1746174356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcz9EqU6ZQpMl1zFWZpq4KGu3DkXTYoxIWYCwpKvcbg=;
        b=J6hm6o5HeD/IsCgVqUBnL/eDJ6bs+AcYVXPPV+kpqhslKDA1gOXnGT8EqEz7ZZahXW
         6GZouDxDXk/h1KxvrwGQUPv9q318yX81gc+e3r2dpdCx7Q3GEnCf6RhqpdvpH0UMQH9g
         qVx452DanFCru4vyigUJhkiv7WXq1CPG1DI2xmsjItgywpau2IuxWWXrE5FQO1lhW3Gp
         dpTKj9YBnCfrEPl0y/IpyMVRx/cZ3XIbkG4fVwpJlfYbhNSEFEs1yAvJRK/UDnZao0pM
         OD+y4xeeEb2kzbUd2jFs/nnnHYdwFxyNWct7DDhSGjFc2OG0Ud/jeEYuN5oxgBMb5vnm
         w6Yg==
X-Forwarded-Encrypted: i=1; AJvYcCX3QKmsIRfPpfKKBxnr3xNkc/rm8ogViYkEFvReTcaJupJRfFu0uqiJR/TnNHNN95EpcH0vhvQRvfJDmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9WaR8EVSKAO6HzIKjeWJZYAI8UXRK3x8JZTNlCxqKeNCawYSz
	cuo6Lmk9fel/kFVFV6bqqpOgwKsobt7ZRgL3vPTVDkOucy926vYDoeRT3iFR0g==
X-Gm-Gg: ASbGncv7SUPVE+6VXjK2lU+uaIZON9DtAPXTf6nBQhmalP5TWVx5DoL49/Qs3XL/kTW
	DC91HLlW9EIBiEAgcW6mei4kIm83Y+xBH9BjyBS7v2LmOwSGCCubhwotY6j03KpXj1QbEVXNaMd
	N8M9n2OqK4h0Iq5JwArEKluri1fesYFrM0kp7S+9fljdCiZS2mrfaksae+8cQXWkE2Q1v0Jm/nr
	61/wI8SuzCcZIMQC4vg1W4PzeKs4UWtEIB9DBIs+e3CWAAvKxig5jZreVFnkZJmzVRn90xn21/m
	iMjjJd1MNRvc2dsc2kS+R1Du9n4TDLpITb+dVGZyUc1O/9uPe8ei3t7e1mcf6T2nPgTioA==
X-Google-Smtp-Source: AGHT+IG5Uyfo+8KyJi5NoU797oZIX2TlpTNv7KKnWh9nNRiitklDfGL+r4wwSDuwBFRSrPVBj5U9Gw==
X-Received: by 2002:a17:90b:5448:b0:2fa:157e:c78e with SMTP id 98e67ed59e1d1-309f8d8cdb1mr2089363a91.7.1745569556308;
        Fri, 25 Apr 2025 01:25:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4b10:d9aa:98d0:5bb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77417d6sm1019179a91.4.2025.04.25.01.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:25:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: [PATCH 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
Date: Fri, 25 Apr 2025 16:25:47 +0800
Message-ID: <20250425082551.1467042-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series is meant as an example on how to use macros and range cases
to shorten the MediaTek audio frontend drivers. The drivers have large
tables describing the registers and register fields for every supported
audio DMA interface. (Some are actually skipped!) There's a lot of
duplication which can be eliminated using macros. This should serve as
a reference for the MT8196 AFE driver that I had commented on.

The three patches tackle separate tables in the driver. The remaining
one that could be tackled is the list of DAIs; but that one has more
differences between each entry, so I haven't done it yet.

Please take a look.


Thanks
ChenYu


Chen-Yu Tsai (3):
  ASoC: mediatek: mt8183-afe-pcm: Shorten memif_data table using macros
  ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
  ASoC: mediatek: mt8183-afe-pcm: shorten mt8183_is_volatile_reg()

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 616 +++++----------------
 1 file changed, 136 insertions(+), 480 deletions(-)

-- 
2.49.0.850.g28803427d3-goog


Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B59B33F38A
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 16:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975008; cv=none; b=H371+Yo8tblX8vDH6MCH3QxJLpW1T2E5ndAyzwdzAkbDAXk5IBvwuFcZYvUx50o8NNRakVwgx+PCs8B2LXj4kNgydIyzWVIvAJRSpPQEhNdnjtlwoU+DK/sP83rFSH05naycWDmU+VRGjq99Py30kTd8iuoJ06ArMYMLbqAKVqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975008; c=relaxed/simple;
	bh=Cy+bFMOlaYT0eFq7TDqo1CcKCQ5pEIetrq5Cfd905I4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KOcB8YJ5cBxuYbOidN/HI16ci4Md0JsZRv3EOIhSoWDtcM7bKhLoLp+sh7yO8fmAlLe12EWi0L5PNhgvc0OXhgluYhACFtcxqMIGY9jNfMbMfs+khvfgTJHfCFMqvY6g3xYNdlvsE2JxTI+tOgbw3CpVjngPyvP8M5f+GJqfiO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sztU7+Ad; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sztU7+Ad"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35d9c7bf9a1so2584234a91.3
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774975007; x=1775579807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuzL2Lrwp2r7VWvr0BPaABDya/7iSBi+QV2E3saLI8A=;
        b=sztU7+AdpD5QHj85PowcVHMY/AjFQh7ZUQMcOjF1CNxMJdF2bwhZjVQUmFCUoVb41c
         kRKBirT65n82aK47tWheLTsIfHJ/zsdhbYxRcGzaNgWejwmXYGVllRUdQQDVcb0PGD/j
         00mP/H1uXDjZBOUkL79S1Y6rx4CiZyjpQwMVLrZR7/sacurGXR+xg1xxtteFTI24l023
         VeA/yLDQiJHObYHcEXjAeld84SyTyaVLk/Mo4p0BOJjY7X81/V3TFSavtyumzrvB28yo
         UO0mgWdRg5LeKCtEYXOmSy5igaW9SUp5InazueCx60nRJ+M3zfzGqsbfsXCboKf0UHf8
         vNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774975007; x=1775579807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuzL2Lrwp2r7VWvr0BPaABDya/7iSBi+QV2E3saLI8A=;
        b=M0QYYISRcaNP/m04nEYm0ODO3KT3h/5zHDYBXIQnuTr9+56rMTn4FirpTxkAy3V2GF
         ntuAIYl6Bw5PTq6qATeFfPs2Hh9NzjMDKNzTUlLPo+QUzpZrHUyvVb7HVfDZ/MSa2hWd
         r3Tty9APn4sSm+E06lqoxpf/xqBJo+fIovR1NoAJEQx1FTiy/8HsyMVWXqcOH6KgG5xV
         hleumIHh3X5dSUOlCZfm4Fr0WrlRHs7hHnIVLkWyeN/meB7VEPmrklYEkG7c6Hc0MPpU
         /2UrtoPopXGbZVbYIqedKI1V8vlS750BnZlFDWFGiH9V6M0LbZcybLb885tHe7gQ/ChW
         SQcg==
X-Forwarded-Encrypted: i=1; AJvYcCWiaUCSpO8YUpu2YciTelCNOMubwo6IwcYuG69i718oSNB+rImn1XKhWrNY+BcirkHLHmWUe3MgBAeZ3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwc5PE3f7c/+1keoFlAEY+hu8ochZZ5+hKuAHbCdy+kXDeRLQv
	miUeT5qjiOfFtQ+wg1BqLa7juiRXDdmkS1Z2V5CWBtK97k5SU1cUQa9m
X-Gm-Gg: ATEYQzzbSHkpY1SzoMQyIEXI5t9EoTspqTETCE6etzQk6ixeN+cQePjlVG0F4Hnal6R
	Kd7T7Hptx9JwpPp5IpjJiZ200v8qa8O7nuQIoBeam3re729YeWhs0fRuLcVx64t1KHhZn/GFq/r
	kFU026Il3e48cRw0cRotMvV5BiRbJb5t4MN4qOp5enb2K+IVBcR1bn/A9DuVpKtPCIW2ZFbE89y
	r/tkCzBjhJtuX0GQcpwuIftqxbbTgdE+/jk/eKDIEtKNcg1/Fk1QQw5gIOVWc8QIrOyvYJZWsQ3
	On6ngdBK5dKCkP4Q0yNvo/AMQXOV1RuvNbFNR4FJhRtxlLz9N1ft7T4ynHTXUySK3owCisyxNQb
	F8nHwBmA9fY589yq8q0jmolEh1Ug5mMPMitDL/PeUEHqbvp9CIwW8s9QVuib1amRPrJEbhK7nau
	2U8h5S3Wb6UPXm50o6IS9WcrsQ1mavE8PozBZ+/aJx9F6QdIIs
X-Received: by 2002:a17:902:fc85:b0:2b0:5923:5194 with SMTP id d9443c01a7336-2b0cdcbb4e2mr167811255ad.27.1774975006699;
        Tue, 31 Mar 2026 09:36:46 -0700 (PDT)
Received: from debian.killsync.com ([152.59.222.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24b02a11esm116069255ad.65.2026.03.31.09.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 09:36:46 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: broonie@kernel.org
Cc: cezary.rojewski@intel.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v5 0/4] ASoC: Intel: Fix MCLK leaks and improve error
Date: Tue, 31 Mar 2026 12:36:31 -0400
Message-ID: <20260331163636.15238-1-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

This series fixes MCLK reference leaks in the platform_clock_control()
paths of bytcr_rt5640, bytcr_rt5651, and cht_bsw_rt5672.

It also improves error reporting by including return codes in dev_err()
messages.

Changes in v5:
Split functional fixes from logging changes as requested by Cezary
Rojewski.
Include return codes and newlines in error messages as suggested by Mark
Brown.
Move clk_disable_unprepare() into the relevant error paths.

Changes in v4:
Add missing clk_disable_unprepare() in error paths for cht_bsw_rt5672.
Align error message formatting across drivers.

Aravind Anilraj (4):
  ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control
    error
  ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control
    error
  ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in platform_clock_control
  ASoC: Intel: boards: Log error code in MCLK configuration failure

 sound/soc/intel/boards/bytcr_rt5640.c   | 6 ++++--
 sound/soc/intel/boards/bytcr_rt5651.c   | 5 ++++-
 sound/soc/intel/boards/cht_bsw_rt5672.c | 4 +++-
 3 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.47.3


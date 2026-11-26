Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665336;
	b=jFR7h9hyySDgdHr6M6Y6QlcGnNTZRcGZxL0tOkagiK2g68LYmHNJPlf1FCTz0k0Zr6Y+
	 146MUeyWmBCHnlDc/eUGc+y4L70E7yz37anNy+8lHjzOSBxFOJGV34Og7VtingLCvnvjY
	 YEBwwtqSzWJ3eIWKYMTyqvrSkyzryxFwm58TP5l3/8UWOIgZbgGeZa4s5DzpWmYh2P140
	 k3Ihf2p1+HNNghM+lrNlTTI4RZ/hfrAFPBi1zqdgjmuktwLUICBzi7iETzo1W75QFtvDw
	 7sCXs4b36OsKGEzpxD4E8R0XWFcZQBimOThnhre4u+aoPFJq7VwmUl+EmNIuTNTo2FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wufck9mMxhIwVpcO+iDjKyRgZZw2XaM/SGzNzGqVqrg=;
	b=d41U+G7/L34ZHke2CTHq3rRTpAvDfGNoebadD1jENYmpzyn366mKT2m/LDsqDrLLsGKK
	 gJQWTnkT34Zrv89oBXwkIwDxW0/lNxomQcr3ic0lK8eMtDQX+ZkKepulF3FXD1ibEqTda
	 kQoYWMISmh0jc8AetFy13jbRjMO7/GgWxSzn8bRrR6kuYSmV/3vnyvh0pV2MCHcOOW2Ru
	 xZJ2Rf5ZfaLTRq06Kd4+HE5Rh9lMSRjXsh79J6EglsnMltPXn5seJNCJqCP+nd5GN/cWm
	 He0oocJd1DzEuFUyMOHcIffd/XQ3k+Na5zO5sv1haXdslveCcrF0IfW+GZdagHvC0Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yi97+Y5X;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C566A606A321
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 03:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C566A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yi97+Y5X
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b51a9606e8so92115a91.3
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 19:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795665335; x=1796270135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wufck9mMxhIwVpcO+iDjKyRgZZw2XaM/SGzNzGqVqrg=;
        b=Yi97+Y5XxVeLxoZ0GcRiPTJnArsCMa6UtJZnLgRDB8kwD+g6+rvGeTyifi/3EXA9tE
         gp1R4DPBr1NFm5nxhzzjOj2ogUCxxGJ50U4jgGA32mmEv1msP6P2Pak6NIPl1tJN7E9C
         P2MDO1tMS+B+hxM/8EH2H9fxx5gp6EX9/RfT2p28tb2EHNfck5uvRHOUzUKhKeB22WrL
         2zlq4lXLk3z/QryViswDP395WEItttcjwUhPRqaYJAF6Eyswd0eehfkos6hoTjJom4F1
         mBzlzopGNu7G0d64OrTmAaB8tt45cMQGjxAtsm0vOtCqonc/y4fhpfV1CUZjBbYcSo0A
         WxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795665335; x=1796270135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wufck9mMxhIwVpcO+iDjKyRgZZw2XaM/SGzNzGqVqrg=;
        b=qXNTYW3NKdAHnPbnuE0wA8DTABhAK2/0g1aselNszJTdypXNtfAzuocgXi5eY5DdcE
         dE8nDavlLf5/+GxhI2LWoe/4hrUaPyGxEvTksnpcLIVmIRXXPk23fTVClkBqzYBpeSYb
         hxWyKtWhg5DVc5cDKVt+jmq4HodEFCi/BLsOfJSwH9lbw+HNqlAmW2ZOwZO5EVzA1zZL
         SoILezReQwZK25OEFYd7R3oCOKKa3ts/xTj/CLWpmVCBug0x1Me/QK9Hxmdr1dkUNOPG
         CMzh4HKjeVi/FVY7/cQA8ppsPNw4nC2LB66NoG6JJGnqTUgNgQhFyEveLRbFHnSFf+I8
         cSwg==
X-Forwarded-Encrypted: i=1; AL+hErFgCykSdxUuL+CAI7oZCpXtpDkdikU43vyviwEp+71NAw6aRM43HjJvh67mJCI2zfIHHHXM7bF942Z+xg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8x/2c7DogWjA0DZVE2w/fDpBQWivRLI895L8uHk4T0tYb/V4I3
	+pnrjA7DDoshBJViFAW84QqGLtgjrBquFEMCpw4hALg25WiRDRGy2V9Zu8pEigRKwWg=
X-Gm-Gg: AZFdTZfW0k1v6MntRTNgzS46F2Cm128QKxauE926TYkM0r+qOi+Krq9u5on2OMOXukF
	7Yn9syb9R4fJJByE9vGEC1IsxJ8Q41yjBfmny8KEzQLpi8bk0qRYHGxKn7auFgnUwiv9on6AJHs
	0T4mRfiT/bEFxKEHBKtxcBLy4K+03EGDFPfOaqPLcTEOjvlxmLr60nUhqxWQ6L8mXBoXJ2TPmhC
	XCgcaGR1OzMesaRbhhnq/j4KvkUhb7YBKnVXMxnoTvknmyjLT1n0/t1U5geqsn6VnYi/65ROqiN
	jBYm0zGi2B55YE1kubmNCyGFzQo84596lmJTmP1JYKDkcp7Un4boLphJS1JKOt89av/Wz37n2KW
	i/NRvmGu3nlr7yidx7BJjVXWTzDFt5s0FiKkN+AOkGQ1Y01DgE90PDlm9Zgq/QvGTCSGcn+eFQ9
	RJCwaE1pAiBuoFFV+1V78KrBTy/7YSpN/PoZSFRztC4To0N7JJQLnW5u1PTRd9hNgTgH40ivfQq
	j6eEd6EGGGpM952GikYEttwL9rja3oKIphOCDBwidfjqTQ62UM/OUTsH90jmI+23vRELWDcSX9e
	WxE6j4atC9KpNes44ivVJYyZdjHKMv8YU+8g7CstHkaq9KFFSJJUMEbM0WYiLc5dXudO7XkgrBd
	FUCw/yteNZ2YDzgxfLwwd+pR6dn5kLZk7YX5EOt5G
X-Received: by 2002:a17:90b:560f:b0:3b4:60aa:9b74 with SMTP id 98e67ed59e1d1-3b460aaa7efmr13255990a91.65.1795665335073;
        Wed, 25 Nov 2026 19:55:35 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm30295729a91.15.2026.11.25.19.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:55:34 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Ben Copeland <ben.copeland@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/2] selftests/alsa: Let the pcmtest test run on kselftest kernels
Date: Thu, 26 Nov 2026 12:55:23 +0900
Message-ID: <20261126035526.1779288-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the kernels that CI labs such as KernelCI build for kselftest, every
test-pcmtest-driver case skips. The KernelCI arm64 kselftest kernel has
CONFIG_SND_PCMTEST, CONFIG_SND_SEQ_UMP and CONFIG_SND_UTIMER off, and
nothing would load the pcmtest module even if it were built.

Patch 1 adds a config file for make kselftest-merge with only the
options the tests themselves need. When Ben sent a config file in March
[1], Mark pointed out that mixer-test and pcm-test check whatever
drivers a system has, while test-pcmtest-driver does need a config
option for its module. So no drivers are listed here. Patch 2 lets
test-pcmtest-driver load the module itself.

Tested in QEMU (x86_64) on sound/for-next 0dfd513a1557, with a kernel
from defconfig and make kselftest-merge and no sound modules loaded at
boot. All four options are on with patch 1 and off without it. On the
kernel with patch 1, test-pcmtest-driver goes from 10 skipped to 10
passed with patch 2, and seq-ump-test, which skips without
CONFIG_SND_SEQ_UMP, passes.

[1] https://lore.kernel.org/all/20260319084347.134744-1-ben.copeland@linaro.org/

Prepared with Claude Code (Claude Opus 5.5).

HyeongJun An (2):
  selftests/alsa: Add a config file for the test-only options
  selftests: ALSA: pcmtest: Load the module when it is missing

 tools/testing/selftests/alsa/config                | 6 ++++++
 tools/testing/selftests/alsa/test-pcmtest-driver.c | 4 ++++
 2 files changed, 10 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/config

-- 
2.43.0


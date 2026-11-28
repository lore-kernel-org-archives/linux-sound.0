Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848756;
	b=T0o2HCrWT1z21Qt5t00XfjxJhk8lmIOlUtwctLgO3n2/jZ/p+3BzuKsEdnNPlY+Ee3nf
	 NIvnc/oeQhEvO7fZvmz9GSRd9pPO3Wm09VHGFzW3VPm0iqVUBDJT360wTnt2Cce9YvwwI
	 FWVjH/2hDoxh90+3lWJrgX+LQx7j+XydSBSOTf4W1k9qyiTXjPJ2NA8tGufvi5Fl37R8e
	 BAxzM00pfwxTUl6fqS8iWXsX4RXa316CAbwcz6MBsaq4/gvYN29roRwf7QYtgxXq6RnVq
	 7wPwU3+zl0EMpDWVG61XveXAxnyVu26JNTjPyN4fusgccfjTC4IgGqGfQFE4JxMzQEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lPgoK6f/peOX7Xfa1riXw4UN8djQFdFslFnwrQD5OhY=;
	b=q55EhRYt1Jq/WQu+ZLObdOZ/G73z9v8pTAtglwKLeTaDOPgW1jjoxjqsLg7M4EeUzLug
	 ZsfQvQgOAlamJ6GzFekiHruERs5doUjKD0Bkl+m/NwBH4ZzJRJLUBbPr5oolr8NLRcQ38
	 0EwDspf+g3j5WRtn3t3LkxBsk3jqA/SiJr+AhWbt6l3O26JJosjhm21KNQw/v1iNXYqL1
	 LRf+MELiLuiXuuE4q3w7Yu5Opq16WisGhaL/1IExiPNzJZSBYL/u+gHyVrj0rKRFgy8P3
	 M+3S7KtxyARLMBODzP67M1Z4J0aujlWYVI5RO152A6EEfVHrhu8RIf4f03H4JqwnlSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozrzSuj+;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649EF606A32C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 06:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649EF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozrzSuj+
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so4561440a12.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 22:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848755; x=1796453555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPgoK6f/peOX7Xfa1riXw4UN8djQFdFslFnwrQD5OhY=;
        b=ozrzSuj+tBVwucEUNw6rNl3r0Dl44+0eZyMmIj86t/YsGlH4ry14kwAIdUVsGkGzur
         Z3/zDMKQx7HCbpoKnQltGelr0o9ZvEcTG13i3rjzgfnAz6FvtoAc5mGFQFbFptg7wIWn
         6sfXlao+lCegr9lfIOXWKQ8+stqw0U4kIewGOBkSIWVo699lcYBNtssLoXOU0AHM9Tyc
         dsAbv/NX49N0zY/0ehTJGILTZKOtithPRIRj6LcFkdqc4lHqa3fXKzryxpyRXZL1JzrL
         cJCs7lLl9Uu90qMMz0wPd1xwd7QencG7w2MG5cFH0Mw9lBJMzX22HaO8MUJlHxhQ5iAQ
         4mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848755; x=1796453555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPgoK6f/peOX7Xfa1riXw4UN8djQFdFslFnwrQD5OhY=;
        b=LTL6JTXZDpuyo915f7at4Qq9nauorChho9jkag8rn9o+AzXPTRPSR6hX9wZoqvbnAM
         FVz234EvUOY3pR9R4pTZTWW7/Z6A3pz9fhdAHzejcNapndm6AP5Yj8WYr7T416/qwplX
         9AZ/gOUySUzjn7taWQRoynHaq8wUUhmbvgcuJKRrvV6PDfAi8ZKBM18aq6SbQFp1Btvg
         bLWpYSD13pES71jD/rCDQ1CM6wPVgD7IU8Cp51iRqj3xs87AwzhRcU1isVpUTjE2rADG
         TUtwbIvI8s52tLtf0Uf/jm8dPA7fT0M1CA9+bqKhbVQO/NToRie7+Z1IgXphcTRIBHCY
         rW1A==
X-Forwarded-Encrypted: i=1; AL+hErF5s2eIYE+OopSrLn9dR+2aZClddFm8la9P93AbdP1meuUBkrEFGg5YE9U5kZqpF+SEJb9gVzVTAnRePQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZXjRRTRpna8EfMqakiSYrp8K/n9Z454VA7HIdObXC9TBCtub1
	tlAxjtx82fGRjiTsLR4FyC7gBKzclwrxXVoGllmOZNOBhNLkH6dHOimG
X-Gm-Gg: AZFdTZe+wqh4t1O2d8y/kK1DYyA9mye008akeu/9MXEzSlTM03g/htVKawYgqJwmguP
	KEcVZLDcS11+g3RyM63k8JZIn+kym7kGYMJoPx3i+ugnCQcxYKnJpFtbPkTqjOgVwY5qQMDYhp/
	IrOIeA4GdtaoMqvIS9hL8swpkjCUAdj5gKXQ3XMQvOUHuUczkwcpRk+IwV+bDnQgOcZMsH1sgWz
	dBif9sULiEveS0v1Wu9pDmDHH1SCvJVceoy47LcYbvbj4cd3YEyKRylyulBbK5tRmJEu775kaSq
	eGZAMzEAnaqwsIhchlvx7jpMKzYKobVddZWDJ2L7UYyfi/aNO8NXSUPfwZedsdVdpurB9Sp92UJ
	CtJSbC/p3Ddxke2WhBaJBjIXUSmQt0N8NYE9Lhm1wO3sj8tHbtjDasJS/qjH4ASV6ETs+yub47b
	gbAD++8eU1jdyepsCnEKejMpKERZH5JkoykRGJhTH5OsV7vX+sU/O7Eo4abZ/9f2FmCmk0+/AdF
	+3DCl1dWsrFO7vf9e5MxqlNmkxH3QMwqt81cERA+HIqEFGp5sgyja1CuWXD1W3ZICX8VBVkNlsF
	JY9A38/BrG3ZD1AvhIidfU223enkd+gC71nTOk2V3fB1HNFuJOJ5kr30kxJnkncmXiC94Q30j/D
	lppwe7JBb+uiC+gSbGqNZU4BPz27GmB5c6eFutK00
X-Received: by 2002:a17:90b:48d0:b0:3b3:b5b8:1f43 with SMTP id 98e67ed59e1d1-3b41c97115amr29820014a91.62.1795848754776;
        Fri, 27 Nov 2026 22:52:34 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm44372965a91.11.2026.11.27.22.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:52:34 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: perex@perex.cz,
	shuah@kernel.org,
	ivan.orlov0322@gmail.com,
	ben.copeland@linaro.org,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 0/2] selftests/alsa: Let the pcmtest test run on kselftest kernels
Date: Sat, 28 Nov 2026 15:52:25 +0900
Message-ID: <20261128065228.3628550-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126035526.1779288-1-sammiee5311@gmail.com>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
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
options the tests themselves need. Patch 2 lets test-pcmtest-driver load
the module itself and unload it again at exit.

Tested in QEMU on sound/for-next 486060b97284, on x86_64 from
x86_64_defconfig and on arm64 from defconfig, each followed by make
kselftest-merge. On both, test-pcmtest-driver passes all 10 cases. The
module is gone after the run when it was not loaded before, and stays
loaded when it was. With a base config that turns off CONFIG_SND_DRIVERS,
the v1 config file lost CONFIG_SND_PCMTEST and CONFIG_SND_ALOOP in the
merge, and this one keeps them.

Changes in v2:
- Patch 1: Enable CONFIG_SND_DRIVERS, which pcmtest and aloop are under
  (Mark). Name the options that are off on KernelCI. snd-aloop is on
  there, so v1 was wrong to say all four were off.
- Patch 2: Unload the module at exit if the test loaded it (Mark).

v1: https://lore.kernel.org/all/20261126035526.1779288-1-sammiee5311@gmail.com/

Prepared with Claude Code (Claude Opus 5.5).

HyeongJun An (2):
  selftests/alsa: Add a config file for the test-only options
  selftests: ALSA: pcmtest: Load the module when it is missing

 tools/testing/selftests/alsa/config           |  7 +++++++
 .../selftests/alsa/test-pcmtest-driver.c      | 20 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/config

-- 
2.43.0


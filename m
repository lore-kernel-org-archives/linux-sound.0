Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238901;
	b=0nkHiahu+2jTJ1DJY2+4nX3DRTVbojNajKjNQMerQeSMt8OWeewzr4EWX6dibHU6kuFR
	 HyYMwVY6HfLg294N5iQLsXiZelVA1NGQ2pt89/itvyN0zl5uXSsRD7iItjCpnut0V+Lw2
	 XwjosUkWawnum6mK0KS8dq/DNHmfdk8YmpkFWosBzDbjbTWaNZjLXS8KPHFAcd5UW67cz
	 zqrbw7eS+ltUXB64PuVCBGuiMhjAzxjBJhkZRAek5CNWDyaitkkZkWbDSbbMmG/IJ7Mlx
	 wAqviby332aew6cHn2FfJgZnC3ZIOixr8pTJcxCNxKzTqz3XdpovWCPkt8Wk8u1AdAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rwRazV2LN1Vepx1ZuVqp56gfdlRWSnLSTloj3LBbshI=;
	b=eZ/PeRRSY3jRNSTTf43vLeB8bITsWMFW7/KroWJmJQo6Ss4OH0N8lHAiN/0BH0HXknUx
	 qeap4u2i6Lxa31wW9EUCJDvlssXUQYgyR1+sjLVakkhEj5vbFxMudKNlAMCkcbgRt/CAQ
	 jPja8t6b7jUYbBtl4czvqWusj4LiFo8XTSuIrQqUPx/QnFP1VIX/aywqjUB8KUWb2xyOl
	 TBgCW3LY+SUbgQ7UKFSLsgO9eg6rf2x8X85E8AH43YHXMovhlVrFbGWMc+IGbKkPAphLD
	 83JW7SCt7XKiTo3c0mBlhO8Qjom6rKfVH5zzuwflGatD3JdxcYywbUIfV5pPan1Fcww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfkyAw8g;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7800606A325
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 15:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7800606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfkyAw8g
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so11294615e9.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 07:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238899; x=1794843699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwRazV2LN1Vepx1ZuVqp56gfdlRWSnLSTloj3LBbshI=;
        b=UfkyAw8gCaV6pX/Omm1V3onq2iAhGBagklfX0QrO9DZBv6uO7O5o/q+5NLkP8UEw8C
         lYtxaRz+38kvyoCiP1dn12g+8PFMWA/r4SVUdunsETPpW/EzblQAmCCMuq5lxvAZFrlD
         PbDjlQWMbjW3m8xi6A6niqQ+B7avO39mU2u5V4bFMc5CRk+ai4XtZs2SJHQBgJKb3iaF
         qz5qCyAtXIK8kLc9SharT1jwmcF+W9banpzxuXcqJq23bgAWAMUzXSPJVHQxsfmhUpws
         TWSMWY3DC1z7kRMWGzVifxgZiVcHyfnklgzsnoCn+Lx15AgBmSeNVIX1qV6BoJJLSQGZ
         OfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238899; x=1794843699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwRazV2LN1Vepx1ZuVqp56gfdlRWSnLSTloj3LBbshI=;
        b=nAKbXs4dRUB2nOoXT5jCPxJ2SFRpPNUUd94NK7Gf8o6x81xRzwab8eKPsOyx7wxmlO
         WMKvWE9t5iqvp6P+xKWNDMEQNPUUNTE0zFvhsBeTf92W5hyG+FPfNcD/GHhsi86cOuZ2
         tbWxOFyveT2KwVWBLTW6Vn+uAaJU5PSIu3YzW2y/fHgqIonMTl9rVQFUr4GdPy5N8phU
         TtRaeHexmPUHMiFfqBijUAk3qxyqpMGs3V4UUSe3uCvPbLe6Z6ICnBR1QoJCTWrEcQJf
         aqPjJALoiwYXq4nC1uUJ/bXYMOeOPe7bZNdAhUzsDTf8bbfXaxeRTLw/6x4rD7AW5r+L
         JOHg==
X-Forwarded-Encrypted: i=1; AL+hErF/2q1K/IvNt5dWy85YyhkfCMEoAG+YkSXsRqOsivlGDkezdmtW9JBVxutOjkT0LP+JQhp3ypoJUPywjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ybHT8DptI5Xazg/p9dt52SAggZ8UjSUJiPkIQzCeelYe+ytPy
	2sMBLn+BwsFeCySg+VjIw8rDk07sNWBVOXZJmpkETTFeLGf44iKnuK/9
X-Gm-Gg: AYBFou22WCjVlZovnphUBgn9rD0IZi8mzXIGSKJLtRkjzFs8yE3ZnwXIjwS0zH8KRNs
	zSVXKKpVmvtZTfvsOuv8AhYeUb72SSa/17Z3LpFEG8Pl1tdnyKI9FryduA4wYF6WKcv5ClSuSRO
	b4GV/tP3Gr+5keaqIwt5mrv4ht6iLoOBL81Ymwcp3UepTDe/rWaSWoGuDj8hpGA68ZUGmDPbg1w
	8Ih9YumbVZuT/Wtl2I3kKDPMBvBLr+ljOcZGePc05CWQ+iGosrI26orsIHmtenr3egYTzFbNEQ3
	dDSLptlmjuLU/HONR0qD4oo87CBFKa+Xf65w2SFSLj9E6kyk8SNCVTqbpfDjTqTCw+oEtbrHatB
	swCdO13LaXqJENatTeJeZiD28dt/GBbz1Jvy2dERHAU62tdOjsBENTh/E2WHeh74HOvA8vjB/oT
	FWoDSWdu2IU0aEKHIhqx0DpeTDOqoNCWGbdVppDMkqZ5rHhTTFwTaZFR0dQvJcpTHnfrAAQFwXU
	AsPAfHyfhpQ1rOB0PVI4+W+KU/Gmp9wfnvv8iSecsaAZA0+T7J7yf3/m9rRM0lbJwXPD3g8dOX3
	UGfAiBgYJ9QitQ7bpLyS3Hvpg0+Sj2OhKo6y5ytJzwanyHRQLSTrDC4B6+lglKFGN+4i2Iqbgto
	mjw==
X-Received: by 2002:a05:600d:19:b0:4ba:a5:b920 with SMTP id 5b1f17b1804b1-4ba00a5b92fmr12877165e9.16.1794238899088;
        Mon, 09 Nov 2026 07:41:39 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:38 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH v2 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
Date: Mon,  9 Nov 2026 16:41:16 +0100
Message-ID: <20261109154120.592392-1-jude.gyimah87@gmail.com>
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

Each of these drivers can be built into vmlinux while the code
providing a symbol it calls is a module, which fails to link.  The
same shape in 4 drivers, so they are here as one series.

Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.

The fix is a select rather than a depends on: the providers have no
prompt of their own and are only ever enabled by a select, so a
depends on would leave these drivers unselectable.

Each was reproduced on v7.3, arm64 by a vmlinux link that failed on the
named symbol, and each links once the select is added.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

v2: Patch 2/4 opened with "These three do not" without saying 
    which three it meant. That sentence predated the aiu patch, 
    and the context was only in the cover letter, which git am 
    leaves out. As a result, the commit message didn't make 
    sense on its own. Reported by sashiko-bot. No functional 
    change: all four Kconfig diffs are byte-for-byte identical 
    to v1.

Jude Gyimah (4):
  ASoC: meson: aiu: select REGMAP_MMIO
  ASoC: meson: axg-pdm: select REGMAP_MMIO
  ASoC: meson: axg-spdifin: select REGMAP_MMIO
  ASoC: meson: axg-spdifout: select REGMAP_MMIO

 sound/soc/meson/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0


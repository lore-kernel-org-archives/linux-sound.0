Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7FA32470E
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770741920; cv=none; b=r2ysdqLnIU9cQeszMiB2IZvpliTcyHHpL24KZV3uaRbTSQBIHPJi5HAdUi6w6XyG4nh9stUYvpL0kU9DfHukJvFrbBmVDLg/OnMkBbCVzGOIPJlxA2jgnlJMK7e2/xv0SenDn2bgRARVOVZQaIp72851uYg/JRnEq23advrtjzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770741920; c=relaxed/simple;
	bh=UUm+bLcdKYE5IIE7+KdxvFAqIYTHre9xCj1Dl4dX36o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UvCRHPajeeOSXXCbKUMeQUAKFYaJDDryI3PHPwaiRbH0dwlM3iclYOy4WQX6+UNddmyoSmq1mj5acd40JwyF1+tPYvLLnNmG/pyO+wHjXSxgnL6ypQIDbc/fReKlK0KO77eppDWLNlwWNNKQr+kthr1yTissfoqQjRjE6RjbCxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+kGIAb8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+kGIAb8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so55432145e9.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 08:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770741917; x=1771346717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=digqO1ViR8cAak2LyXhldm+fhpXvMIKFaNvFw1RmKa8=;
        b=L+kGIAb8JGcgZo6R7kOAxyx50J8CzobE5GGiRHqVpuI2m4oh2lm+42G5243LucaiXw
         C4a9x8KYc94uHlny1iDr9CfMsykAoCLpiIsf5oMJj2FGirRePvNCuCKjqH6y3CCQtAl1
         nwsc9Eccnyi3mZ0QavDzvvTQbirlw05rM/fg0JogXXBuoYrcrGGRfCmK3Lqee9hnFtVm
         cnddcIHQq5wRz/DN2KI7sTeLHeBkz9zmzdKJU8K1+2qxutli3qY3W9hE7zIzbRa0p0XN
         keQpIU16dQklZNiJkWqs6X2Sxfy2egwz454JTIJH1O1NMhdSmL9RRDF2kQYLw4S9kVfP
         CUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770741917; x=1771346717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=digqO1ViR8cAak2LyXhldm+fhpXvMIKFaNvFw1RmKa8=;
        b=gdMIF/XLksh/s4T4Tgs4KAuz3BfpCS/b91H3HpLntY0hHV8RDOCK1h6qYIwD+I8Mqd
         cFS4lsLf8lO7Hnz16qNpWvA46qsrY1AVr6sXJ5Ki7DImXrgzNQTOLGgs71Q/yXVLKmSj
         hfrhHQEv3TvIcn0F9fpat7v/dpJj35S4huVcOkPJmZBu+B7Lacw2EGrAFUQGQSMWvyru
         sLyULv0BrWcW8aHELBt0DMOP8TMaUBzm7QIJG8qthdnJ9JeUYCayJeM/G/x2rvm9qpkt
         U62L+0Ml32sGJzi4g2w8gb+J7Y+jv1E2w4T9r06aoA6EpSB3Z9KUnwqD/cxA9G0QXdWU
         470g==
X-Forwarded-Encrypted: i=1; AJvYcCUmsA6UA8fo3VOQgrRoTkB8D1n4BCebKB4ORtR1Wk9cPnOVjnkDnn6hSO8hjaLr+UsyKz4IpwVLlg7HZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdUF+lKJwv0kOUNDnG7Dh8ZQxberhRqUXYIZ8M8FE+3givM0vI
	6HOKI+WuCCDEERcc2DvxMtlSGu6tqqFKYmLo5WKAbt7XtAparzvp7hhv
X-Gm-Gg: AZuq6aLkEzzkcfF1PAQYGByooEvHeMfuy5dWUZgrgMskVgYrMDI0iJO8qxy+AEhdkxx
	I4SN+uFqNZ9KihSYtZZglIKU+MIy9cgKSLGj+pa9W3R3cPv0Z6wPnoO9BJsC/q+YzkCqVl6nmkN
	nMH3oyNNDfJTph/pIojmAKpZLpHyaGTEoCBZr7ozrezuAPTulOOB6Yt3t/YWTRAm8MUGy0Cd7ka
	opAVjQ0O1BtrIYrdpZhlnvbT0T+wlH5EdT+znLEiTMcpb3BEzPkMvuplpS3mktV0iKDEpbl084I
	Pjz+n59zEIpQcDDU8ezs1rhN3XKtZhH0N/4N/V1gasDKFkEJsyuQv60tQjUe+lf5WEJE9vLSXqj
	l10m3Ai3OWOmfypDwsy3rpz7Y2DNgQ+HDXAn1ud5EBTlST2xNNHX+zZhAKk/XaKY39y2j6pWa3W
	0hQVPY91ceKS8FqDgKj08qbhyvW6x4roAfIJrf2MOgUFR2s4wvxsU96IBC5xiY+Ub7bVS29WCIj
	7Lsg3Id9o+Z72Ldo4ScdYfvr+Z5rqWknyEfCpPa
X-Received: by 2002:a05:600c:8b62:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-483507cffddmr40958635e9.7.1770741916822;
        Tue, 10 Feb 2026 08:45:16 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm96294245e9.1.2026.02.10.08.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 08:45:16 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alexander.h@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: [PATCH v2 0/2] ASoC: simple-card: make sysclk ordering configurable
Date: Tue, 10 Feb 2026 17:45:04 +0100
Message-ID: <20260210164506.161810-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses an issue in simple-audio-card where the
ordering of sysclk configuration between CPU and codec DAIs can affect
the initial playback behaviour on some platforms.

Some CPU DAIs finalize the MCLK rate as part of their set_sysclk()
callback. If the codec sysclk is configured before the CPU DAI applies
the final MCLK rate, the codec may base its internal clocking on a
non-final MCLK value, resulting in incorrect clocking on the first
playback after boot.

This was observed on i.MX95 systems using fsl_sai, but the issue is
generic and can affect any setup where the CPU DAI adjusts the MCLK rate
in set_sysclk().

Instead of changing the ordering unconditionally, this series keeps the
existing default behaviour (codec-first) and introduces a DT flag that
allows selecting CPU-first sysclk ordering where required. This makes
the behaviour configurable on a per-card or per-link basis while
avoiding regressions on existing systems.

Patch 1 documents the new DT binding.
Patch 2 implements the selectable sysclk ordering in simple-audio-card.

v2:
- Do not change the default sysclk ordering
- Make the ordering selectable via DT flag
- Add DT binding documentation

v1:
Link: https://patchwork.kernel.org/project/alsa-devel/patch/20260206134014.143057-1-stefano.r@variscite.com/

Stefano Radaelli (2):
  dt-bindings: sound: simple-card: add sysclk-cpu-first flag
  ASoC: simple-card-utils: add selectable sysclk ordering

 .../bindings/sound/simple-card.yaml           | 11 ++++++
 include/sound/simple_card_utils.h             |  1 +
 sound/soc/generic/simple-card-utils.c         | 39 +++++++++++++------
 sound/soc/generic/simple-card.c               |  7 ++++
 4 files changed, 47 insertions(+), 11 deletions(-)


base-commit: b7ff7151e653aa296ab6c5495b2c1ab7c21eb250
-- 
2.47.3


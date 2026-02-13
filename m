Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF85525BEF8
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 05:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770962367; cv=none; b=jrblh+xQkPIjpmlr0QCwK2KgTfS8JNj71g97icAogYyqVKVNmL8A/avyd6Ku5bzcfYAkbRAZKzKTzlze0F5ULc/MUrug0vuS7QrwArGaTXPYnzeLt1HbtxtKxSJqwXd5LUiL0ADx9abq8/chGBpXQk5pSHLT8cKG5rRHNK3XJpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770962367; c=relaxed/simple;
	bh=EKSCVd9iI/wA/c1MJ94i8OqZA4lkEgo8DQu2hwlDx4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gbyOJYAiRWn96jn86N2cpUqlBQ4sKsrGnCpZDwWt9VHR5z+SCgCD+l5PMQr53wkI81hFySiQYnJq2tHP6rA5+Iz7m/Gd3Q1Pan2Sfu9M+B7Env+HMTJfFaRCdbsiZY5D1icgXC1DcoRxVwMLZr/NE8GRbs9iuukSaCpcdFQhKRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jj+v+XeB; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jj+v+XeB"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-824c9da9928so111583b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 21:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770962365; x=1771567165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cIoUCpmeGq/vH7TKu0bDoTjrZcpRvynJjfDu/bhbdFI=;
        b=Jj+v+XeBS5HnrJlVaC8BP9N4E07SxrWrIiBIO1OJqUdChPTgaBHsHeebBnniPw5kuH
         T5GzD8dAqYUR4hsVGoGCQlZjJjJ8BYVcEt6NDmcdBFV9MLDwR14SwHCYQhSpogNtuwPg
         H1qV8jGiLfmx4lrxue6hWn9byQ5+TuiRm7kZLmfCXtC804EQM5Rou1t2l9Z4nKQbjiLF
         FdXubhaqgtHX8GslFIYZSCJ6X615NUYBD5tEoizRYp5B1ZegRT3+4kRiI3TPJBPdrpDI
         4V9VUAh7xvi9cwcc2ZZMgSskvEE0bk8vm6FJYl3EvT9/P53vB9X9fHvR5l2JawGjOz1B
         MfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770962365; x=1771567165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIoUCpmeGq/vH7TKu0bDoTjrZcpRvynJjfDu/bhbdFI=;
        b=ZXyQSoMzQBs2JxK+aBY1RFsjQE1XaqQXFmJdJA/ExWQcewRQkCi3mVG9vwcuvSDHTW
         ks1GNsvrB45RFzKTlZuywzrc9USE0MRq8E7FF5Ky0Z912TnehQeHFQYiaAc4AZUAz3oF
         qhl8tSOq7nd8Ona3wBdwucyxOIpBy9/uh4l8+C/DFU5rgnJ5sKRFJUm+I0ghgX7l9hiR
         bx7vJ1SlIZUyYZHeVdt0SgePU5NT5uJdv6N2jkgaRgJDnOscVMwmNmn2Vc/hfK546lde
         8pEwv7nALyPP3U+6NV8/NDBAg6hz9EVXHj1/E/K/bXtDoEHJS+q7GnEVe3qDciLmtcPL
         CDbA==
X-Forwarded-Encrypted: i=1; AJvYcCXTWoCz3JbAjLRNvqSukyUy/eGGIcNop3USqVWicrlQON6bdxR4iHhG46SPFkbNrW6bhL3GRGJa8y2fRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyArwvUlgsBVenyBXUy+TlabH60gNxtFFbKc21gbwuf51ElyhGl
	aTgsJUaRvpmbZr5hxTtiUAv/QgkKbRjzrV988zQjvLr9VWixc1WG6eNo
X-Gm-Gg: AZuq6aIDFNpxcahEqfmwybT0zgWz62y2syr7WzVJ9ZsFVdigA04d6PtELZRdwa5ZQ4D
	9TH+ILZQ5wDt4kH0sAD5gzKjiKf15lorXGtlexLdugpRoEE0IWEZjKnrSC7HQit/7GtmG+fQHwj
	QlyjacRftbzfoAfTmHytdDysNBihktzTFDE4vNAk/SwtAXsq7ufrmev95/gPRd5CaOO23MFt0nH
	QFVx0N9LH9gmz6xgeratXMBn4KCCl6kTL4Ai1wgTgByQ2ERPdvBT5DR47RxVnNPkxLnnhWArqkW
	0VYRQeq6JWUTRkBoS4ILF4wt4caf20JzeGLiuLAKJEaXCga2bozp+deObzvQN7K2NgkCVCQgG2G
	5VZxXcfKpozO5Qnb1P38UqctTCI1Ahe4zr2h8z8j2ProSdEFylom+WBTyS/1CWRKkoacbp4Twug
	==
X-Received: by 2002:a05:6a20:43a5:b0:38b:eeb9:cbb5 with SMTP id adf61e73a8af0-3946c8bf476mr806152637.39.1770962365215;
        Thu, 12 Feb 2026 21:59:25 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e1ac0e004sm6274588a12.6.2026.02.12.21.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 21:59:24 -0800 (PST)
From: Mingyou Chen <qby140326@gmail.com>
To: vijendar.mukunda@amd.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mario.limonciello@amd.com,
	venkataprasad.potturu@amd.com,
	Sunil-kumar.Dommati@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v6 0/3] ASoC: Add DMIC support for the AMD RPL platform
Date: Fri, 13 Feb 2026 13:59:01 +0800
Message-ID: <20260213055904.110256-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
  - Reverse ACP CONFIG PIN from 10 to 14 for rpl
  - Remove the rpl folder
v3:
  - Remove rpl configuration from Kconfig and Makefile
v4:
  - Handle separate switch case for RPL platform (ACP Pin config)
v5:
  - Remove clangd generated compiler_attributes.h include statement
v6:
  - Fix typo issue ("reverse" -> "reserve")

Mingyou Chen (3):
  ASoC: Add DMIC support for the AMD RPL platform
  ASoC: Drop RPL driver
  ASoC: Add quirk for Lecoo Bellator N176

 sound/soc/amd/Kconfig                         |  10 -
 sound/soc/amd/Makefile                        |   1 -
 sound/soc/amd/rpl/Makefile                    |   5 -
 sound/soc/amd/rpl/rpl-pci-acp6x.c             | 227 ------------------
 sound/soc/amd/rpl/rpl_acp6x.h                 |  36 ---
 .../soc/amd/rpl/rpl_acp6x_chip_offset_byte.h  |  30 ---
 sound/soc/amd/yc/acp6x-mach.c                 |   7 +
 sound/soc/amd/yc/pci-acp6x.c                  |  12 +
 8 files changed, 19 insertions(+), 309 deletions(-)
 delete mode 100644 sound/soc/amd/rpl/Makefile
 delete mode 100644 sound/soc/amd/rpl/rpl-pci-acp6x.c
 delete mode 100644 sound/soc/amd/rpl/rpl_acp6x.h
 delete mode 100644 sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h

-- 
2.51.2


Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3789A3B6BE3
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 11:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215650; cv=none; b=KXMLgsEzBohJOdI0S55FiHmmshn5adH+w1SOAYQ9IkQIGdOsX01dFGx75KPxXFHyOJo1v7srwpo3n6kBZ+O2RSOU4Pmkh3fO7zLBNngHfp4vhZe9dEZlAnVs9Bgp7sRlTz0IcZUkrsfBU6cBCb1TzBv/bzqiZbfdT15NWOEyJRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215650; c=relaxed/simple;
	bh=aO1j+V45gKVspVh+STk4Nhcf53cEsgoJkFmIjjpcfHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=StDYESTQMLc3fTFaZYOlttKrYN8iwtdLp/46rRhI831JnHfLTg5p+pvqLoaYau6hPcT+djVh8eifEs9ppWboOn9HXP9N3oSSr4AL135jmCsNNQ5hakhAsLwGpqrqMEOSGmcoE4GrGJHnuA/i/xlmkMBiSmYlqJd0SCrhXhmvGF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTqx9WJ8; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTqx9WJ8"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82cd6614a90so799935b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 03 Apr 2026 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775215642; x=1775820442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NHifJZgQHQqWkUaJjmrpZ1+zeEyrq0oDIlsASkhbXs=;
        b=NTqx9WJ85Ju1zwhHb0HDfYYccjBZFaphv2/UeMJNyKp/g1Yu4udwbdIz5His/9OTcq
         O1EwcQMRTJPQx0ZjYXykr+ksG+ZBS3WqqLaBH+PKEBq6sIJRIX/zv5iw1a/TCrjD6IfJ
         ob4qsKmVnKKzl3viloDqi3foSi62yGzx3l09Ey6Dj+VPkhsTSXwPUzbbnro+qbpW7fg2
         q5D7gjC3jp+vvX/o3yAx9aGNbgaxowKbcfYcv7fH3Tu4uRAqV/YY+uqVxTPhF26c3Qry
         JnjNe4TUbjv0KEsWJ8LkKDF20P1yozVWz0EaHnTYJWGXXNIc1zdqAmxv0md8R9ogRYqG
         Zrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775215642; x=1775820442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NHifJZgQHQqWkUaJjmrpZ1+zeEyrq0oDIlsASkhbXs=;
        b=HVvrF3UepGw6EKaZHwP+ERFQQSUXd4GhfPJA9XLhnCVMAZQOYtANZMrhp2fBqh+oln
         7AsFRgDybmV7jkrkMUyJRYP8jmWFZPTJw1lsSgMVXICZCSTTry+r/Ze0IQFTxum25DhD
         0Fw1RzYf4OynDapxMC8jnvbDKrbVaIueUKvpkvSj24zWsHPxikkgC0FSGxD4R4reQm3l
         JtNuuRxkTJzpJMEXtTEdENynJBwPb7EIiCy38wxfIphud7cIaYSXrLMSCLZNl0ZKgbvP
         3VHlGIaK0X61nw3rIHwYBdaUZ/0qZbUJPcEIJ2+xrGIJa+SRlK+LxJ3RCXBoLtSVcVJJ
         kULA==
X-Forwarded-Encrypted: i=1; AJvYcCXaArjTIrdhtBSXrA6afahD66VwNRB2CI7+kDUGrTHW64/vkvgPY0Zg2thJWLMs//N/0WdoajZHj5+Ayg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDcGdz/F7l5yvfaXtyjlv2/WH7XtG8dXX3XTmTLirq0lstafqn
	o6cqZfI9nBIpOq+8Kw/CbtlO01RIkPootOZGyRgCUFZyN7SERGMPsCt+
X-Gm-Gg: AeBDievy/lDKI5rWD5/+3cB2HseEAhYhgGEK1V/Untr8hCb+uLniTZx9psMeapqfXSu
	F3mqs8lRiHgIDJ/nw6gMsEM/7YL3WsclwBYTfMf3AbdPVvZROtFqQtZvFhPVfUjmBSniYUfnsB1
	sKBf0quF+NRt7d1WFMymbg4CoktPyPg71hH7mUJO1GD73ldithekv+rI0/jjMYGaRY9wFqiC9U2
	rhpPKPA808ULYYSNyZiIbQUH8sPwl85d1iYbMegOsjcGAf6L951xah6P2RT3ZXy9diLrpVuxeaC
	uyzf0nzE9AftEBDGww6FnyLKV5hJUSeTCRTaRDnnVJnxez/F83JVAhuIPWzIssFH3gdMt8bnY43
	r+6vx1w0nez1nJEuL5ZNHNz7pgBm6FqsGCjlaV2cfd3tH5N3Gza0NDeU2mxaixXi88o7pKycg0/
	Qgplo9nesccM2N1OloVqPF/X+DBi5ZD7Hsixwvw4x6m+bSSNfKDYwSfTo9HA==
X-Received: by 2002:a05:6a00:1745:b0:82c:21df:807a with SMTP id d2e1a72fcca58-82d0db6ac7bmr2642877b3a.26.1775215641956;
        Fri, 03 Apr 2026 04:27:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5202251b3a.23.2026.04.03.04.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:27:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Fri,  3 Apr 2026 18:26:52 +0700
Message-ID: <20260403112655.167593-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

The FSI on r8a7740 requires the SPU clock to be enabled
before accessing its internal registers. Without this clock,
register access may lead to a system hang, even when the FSI
functional clock itself is properly enabled.

This series adds support for the SPU clock and updates the
bindings to allow multiple clocks. The driver retrieves the
SPU clock and enables it during DAI startup, then disables
it on shutdown to match the audio stream lifecycle.

The binding is also extended to support additional clocks,
as FSIB may require more clock inputs, while FSIA typically
uses fewer.

This has been tested on r8a7740 (Armadillo800eva) and fixes
system hangs observed during audio playback.

Patch overview:
 [1/3] dt-bindings: sound: renesas,fsi: Add support for multiple clocks
 [2/3] arm: dts: renesas: r8a7740-armadillo800eva: Add spu clock to FSI
 [3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock

Thanks,
Phuc

bui duc phuc (3):
  dt-bindings: sound: renesas,fsi: Add support for multiple clocks
  arm: dts: renesas: r8a7740-armadillo800eva: Add spu clock to FSI
  ASoC: renesas: fsi: Fix hang by enabling SPU clock

 .../devicetree/bindings/sound/renesas,fsi.yaml     | 12 ++++++++++--
 arch/arm/boot/dts/renesas/r8a7740.dtsi             |  3 ++-
 sound/soc/renesas/fsi.c                            | 14 ++++++++++++++
 3 files changed, 26 insertions(+), 3 deletions(-)

-- 
2.43.0


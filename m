Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF4C531AF6
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 18:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914592; cv=none; b=ARQIM0PYwYpezRlEclKMqas3OvlhZpp+Mf+GeW5urQJd94LjWLgGx6m4pZZPIXdcbaPuERBoektKqNcG7tfVyjmRgCh6FLn62NWsBNrwzMKMf9bDbEt6tZrGPSMzIxy6vp3v6PrmIZVEVP1ImPLbbN1bnaNVquUl8E5KRRU4SnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914592; c=relaxed/simple;
	bh=1EKTNsYObddSzMfazdsEfTP4VW5E+sXjf9Ax6jA38oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1gqRSh5wXLSGfkG3lxVLGRljOf1YfFQtZiJuPj6oqVDXzBwcD1kwoPqE6pft0Kd7N2drEGGBI/zIAjbjzAiSBjKVmtDZ+BBwOluLlpvSIRWqUbBEfGFQZophId90tTGjUhS5YNpQmG3oJw4PBGYl2Vd7qwF7yf7N9GEi8C1fJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwcSSTzU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwcSSTzU"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3217963f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 11:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914588; x=1792519388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUyh+j71lLXWUxyOREj0fzVr8qwfQy1ksYC2qzHO33g=;
        b=dwcSSTzUAMNKy9h6TFsrYRPSd2vkKDmrqjWlGt5NuZJEjfi3cOwnq8DTgcBQM8GV5J
         OqvnbqFN7rNmAguF5DoA/PLy4rBxBaDT/NRMLjvaRLEjnvFJ1hshoAoq5dKjasvGngwM
         crFt5KrC4LigS3/N1YE3PmPP8Epx5weHQbV880Ir0kghvJvpjn8Mvr57WwLQ9u0g24Sk
         s01YDaD/Lj223x1/73SjKJikJQirbAdhWdZJZ0yTSK0qzMXwAV8T+6JzTg2YmS2F3tk2
         XDzQ2pNM5JXQNpneCBOrEaK5DpwIXujqjnYuFy2iuZ0TL3oKEFehnO/MfUdGno9qrBBX
         sDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914588; x=1792519388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUyh+j71lLXWUxyOREj0fzVr8qwfQy1ksYC2qzHO33g=;
        b=ADIyOBG+1TYvKG+5W+qrCofoHBuu0S0IksmA1/hwYmf7EPuf/5PlbgmtIOiw4MG58V
         nA5FWE5I+K277Kqj8O4eR2DG0ObiVsH5mJglKcQhftOXgGH6jwUoO+BGD3fIlIee2GwH
         KnKvmtHzJCdyc7aom4+My+jKwCEk1uypQFp7eluIurKyBuN6SB4bBnjIG6XZuBvzinP+
         9h/q7BZEipkdWkBuQsu8V97oG5xZ5U4KIZ0IuvNSQ8gCk/f5iutitvHGo2RdVDvsM3yV
         TmP097GlqUbAnl1btCkAGXMII8/eeG+CMBHCmgkNpel5J6XnG+/EJbSg9wRKmALRR2gU
         udyQ==
X-Gm-Message-State: AFq9FYLZujNDn7n4zBEKQ0Bo85BQEq55CX2MAWokUPFtPEKrIIlc23l4
	+G2u9KUYveQQ/68MTqzFIzLfu69Hk6vCcxZR/FHkOzJR6oKIDXUp4cfF
X-Gm-Gg: AYBFou0586FxuFQ7IbkrZ+XgIanIJTXGluO+XcOJntzXo4fGMqjdOeK9YGilfHwrsiO
	SbMu3E9kbhuvj6Jh8mIkz232VUzVjsqDj5MrSnJnDbcrFvaA47jn5ph8UiUSFVnuxje7pYScXvw
	ySnNFOEaBvMvxnD4b1DWmTLd/Lq7LrKIn5BGknlgR6snQTZBZwPcjrKWPs587c50PZe3h0+HBQT
	A7gnBSjzQDqi4yaxA+Zr+TgAvsaplfVJEk8p60S1tUr/7RFz6UOIoTkajspeDlnfaxNTLhlbYD3
	50f8PCTg9qDktKxtfIh9878m0RqCLM0lgqvKVBJFDgZPhbK9MNdVWsnsXxEBzBalY3zyEV7F0DN
	bx88cSzQgMuVZuhfIxgKrHUinPLnlM749VSr8E1QvMpiiUvFr4FBsisaxEOp01KUG7ObL0zErFl
	Ia/G9ELjo+lvwIsNiTctlP+yqnHDnmiyQMUGLLaq1ZtL21POPVA9Rp1oXofFqtZU23bJYjxgu9D
	n5A2xBmbuHtL3FVU8hOrqJTYhmS2A==
X-Received: by 2002:adf:e007:0:20b0:48c:656a:f36c with SMTP id ffacd0b85a97d-48dba77cefbmr20450562f8f.3.1791914588364;
        Tue, 13 Oct 2026 11:03:08 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm6381987f8f.48.2026.10.13.11.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:03:07 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sheetal <sheetal@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ASoC: tegra: Support auxiliary devices
Date: Tue, 13 Oct 2026 21:02:53 +0300
Message-ID: <20261013180253.477605-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180253.477605-1-clamor95@gmail.com>
References: <20261013180253.477605-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for auxiliary devices, such as amplifiers, sound-muxes or dsp,
to be added to the sound card.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 50b23bbb637bd..e4af049fd7e89 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -550,6 +550,10 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 	if (asoc->add_common_snd_ops)
 		card->dai_link->ops = &tegra_machine_snd_ops;
 
+	err = snd_soc_of_parse_aux_devs(card, "nvidia,aux-devs");
+	if (err)
+		return err;
+
 	if (!card->owner)
 		card->owner = THIS_MODULE;
 	if (!card->driver_name)
-- 
2.53.0


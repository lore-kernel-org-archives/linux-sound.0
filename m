Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5C247D923
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844316; cv=none; b=ULWrd8FTQBA1vTVAjh7KG7U+GMonHsYE8IlMXrP3gkFF+N7ZT9OMPi/HdlHkEcQTXW45fw1QHfZWBG/Nvi9U8mQui15H13LzJ/uvCdWE2+YSqwvhvHYBSdfHUzJgUZ8eFIyKamPmN0jm93eNFyALEsU8zLBKx71za6SjTXKEifA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844316; c=relaxed/simple;
	bh=4akXvWtE2W6Dd8JciZInbA5iL1aKf99uGU/DUGxBQ6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hCKrv4N5ORHzuqNBIztDbh78y6BGgQEGI+jSnj+2bu7G1io9EPasHN9cI1WIGSSi8DWVc6AChB7TtBNuXJa5B27gK7tSUd5kanq9GNRNpW4jSy1U4Fo7vUUmi+KPbAZIW8hOEf6msusrFA7nKBeGlsGwApI6rCF7bAkiN0r2NoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g84VCZZN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g84VCZZN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2baef9f5ecdso59886955ad.1
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 04:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778844314; x=1779449114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2cckrbFDzDclaD9xEuvQg7f44hhTEfkSqsz3bGxhFSs=;
        b=g84VCZZN/Xn9q95cvsInGSmkA/yEwRi49gUvM+/Rka4SiAmfoCYhvTiJj87Y/V2Wws
         J+SkLMpM4nx8AQNj674VTKLnJauHAXHYAdoHHGM5eggc0x/zf/QA6Rq4Z9+1LVp76Q+q
         c0hsq5jD4OyB28cDs979aqvp98AKgnKoqdBRpZW4S44OQWVlmuOrcG7nKiAdGgM/0YIi
         vyxCjvuWUMJBG2bhLkU7+0weYwGfLL6putLvw6vLqAL/EkSxQCSrDFH4FoQn4DmGxy+/
         atDo+nQs1jp7Tmb7HrOMsvVGFnsgYVOWBB7MaPUnstM5Ea/u7McgOAKvXyXm14Pz5iKj
         UrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844314; x=1779449114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cckrbFDzDclaD9xEuvQg7f44hhTEfkSqsz3bGxhFSs=;
        b=C3UDDSIu0fJZ2n7IVwIlNICPKHKp0WYNDSPOfZUCB9GL2Z+dcvMIfaxA3K8p+Kqfjt
         cywE906aYG2iYO+osB2s/OM66290MQVQAICIhli4COWjXeIg9m9cQXCL13AxbAI1/KUe
         Rb6uulot5WbHxqMhEwMeYv4sONHFb4gRZKO391hHU9ZwFSMYm8S/rF9s/dDAn3NEOXVS
         osg0LEWpkhMP9ORoewtJEe4JpqojIg/peU+J2LyFiDD3NKulqHwJ91EsXWqBoR5BVFZc
         sOigAYuwkePK0kOfHTO5pgFqHQoGoRAETaBEkd4VhE0Jt8UEiB3jxu4e5KiY909TPijx
         wUIg==
X-Forwarded-Encrypted: i=1; AFNElJ/gsSRkovF60xufF5fxqcg8CBNJnODGIYv5Vt2h4Ng0tkaymLEqrBhdRxwsFHNgWzNemE1XaThdmcHOVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2wvuGvUVDpP8az5gERO6Pa4BIYGDAkDLp/XJ9dyH/QaKBo0HU
	j23dsN23PWSdOa8wsBJEFkdpNcxXuVsEDhqfgBDnPVvyrhwSi4QA/x6A
X-Gm-Gg: Acq92OH3eZtSrwJX36Ey7EWfEhiIuSwOKw5MfOkjj9LLqdmPxy3++liOx7vmGHjeFc2
	jQdV6f1e5nGBbMe6xZH8+sltMjofi138M3w3kZA7cdBFMUQQLVMIwI2oU+htOPD3ER/B6aq/mmy
	6vFz5TKYkLj0GVea/6sTIUg3EUYZoOJU/z/e7W5TVCG/PXOWorlDKOx4nx7hVQ3No2jNsQMqR1r
	e0zVV1Y4jcI66VxpSqDG1BGPDDdCurEuk52lY6TcFo0JHEwjUzRnvY80Ym9RkBbWo7AG1wd8OR2
	SBTu46G3PUuHwmDkJXv0qpP7njOJ3MXj1JljlSOVNvW8mllFQQb2GRHmvMC4snjlTvb7wYmtfiw
	OrSM1bDnVum5qlsQ7RQ6GMnR5HsAIQhkq+cFjT/jccn2z4vEdoGgIMnjfAF3e2lc2cgXyS4Xg+v
	g4U6kQBT3war/B7epUzYG006C7ddF69iLDhAwj4KrHKY595sn4E6CTyu1xNMS8hPUNOSHuBoEzf
	X3/va4=
X-Received: by 2002:a17:902:f08d:b0:2bd:2051:13ed with SMTP id d9443c01a7336-2bd7e87ef1amr28948915ad.23.1778844314099;
        Fri, 15 May 2026 04:25:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm54530385ad.66.2026.05.15.04.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:25:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/4] ASoC: stm: Use guard() for mutex & spin locks
Date: Fri, 15 May 2026 18:24:54 +0700
Message-ID: <20260515112458.34378-1-phucduc.bui@gmail.com>
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

This series converts mutex and spinlock handling in the STM drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

Best regards,
Phuc

Changes in v2:

 Replace break statements inside scoped_guard() blocks with return 0
 in stm32_i2s trigger handling, since break only exits the implicit
 scoped_guard loop rather than the function switch block.

bui duc phuc (4):
  ASoC: stm: stm32_adfsdm: Use guard() for mutex locks
  ASoC: stm: stm32_i2s: Use guard() for spin locks
  ASoC: stm: stm32_sai_sub: Use guard() for mutex & spin locks
  ASoC: stm: stm32_spdifrx: Use guard() for spin locks

 sound/soc/stm/stm32_adfsdm.c  | 10 ++----
 sound/soc/stm/stm32_i2s.c     | 67 ++++++++++++++++-------------------
 sound/soc/stm/stm32_sai_sub.c | 29 ++++++---------
 sound/soc/stm/stm32_spdifrx.c | 44 +++++++++--------------
 4 files changed, 60 insertions(+), 90 deletions(-)

-- 
2.43.0


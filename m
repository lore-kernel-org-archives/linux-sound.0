Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B04283C82
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 05:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770962375; cv=none; b=Bup3PhcTQbyxgZOqRV64ePdNZGoYQTvIDzyo4nR5prypX+aSKNPFwxJ1xvTLO13wo8AE+t9Iv8MhMxkyYfoRBg2OFOIwsWzc+bZAk4/tzLmm0aZAHP7/qbhwK8rWTMvo2UG1Izg4qCha4bip+Wo2VNPIllNjDwTkZ/v9iJkXrrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770962375; c=relaxed/simple;
	bh=M7KZCK98ow0KPWs+XO9UwmlYlB1lKcgTJc20cOATSL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3xFujHSYfF7XAw7825yzLCQOaSr3yT6GooGiqQZoQJ1SlBYiHF8aFhdNKjkY5bXiCtW8EZh+pxIE/pXyvzxOUQx31l2+jPdUjD/CDT/OpIh3JYwtdWDWcpmSAm0pRYwhsbvQ/loMHToBytsOWsGMqm8RhYNQHysMn8CwoJqMDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKK+jF3n; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKK+jF3n"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a7d98c1879so3310235ad.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 21:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770962373; x=1771567173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AN0mP+ZmQTR3ELzZZTOreC2XTtK2a0bz6wEq+iw7zE=;
        b=GKK+jF3nfmLPftOHkgCcH6MFo87yN9JvuyWNFB39bPlBIXurWno/WjXwH1p88SxdXd
         xbzDChL+wsBVNTldNpu4tPEMVEpRLL5d7PSAb2peqH70B8OsV+3RWPxP8xFK1HWZnp4j
         fanrzcQALzGqaeiwHvOQtw/bk/BcJ3iX9IuYFWapdhbnHF6HoFtrUZ96trr0OPXqzQvI
         0pIC9CUu6ly5niOR+BpFWQutTn24uTD4bo/fAkFEdjduHZQEO5WibBABCDM3NQe9pX9e
         foHAh8hkhp5Sb8ykg+fEyyuLNyaBS4rG6Zd7Ol9y1O7xPGloiSuYG6IBR1GSNTQvxdAP
         IbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770962373; x=1771567173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0AN0mP+ZmQTR3ELzZZTOreC2XTtK2a0bz6wEq+iw7zE=;
        b=tvoEgug3TJGBsFdCKz2V+3Y0AoBK0wMnQs2gJx7g4qhTxIfxncPdVm3onu+lpE4kgh
         wFL4igAy0zcrNWwV3TWguuugk7kdKJ6P7OGNsU0gUOUXCBgU5tXdGZs+S4LyKqt4kg9x
         eOhHMEN+N6jHg998M3RGeGokG/+c41b80qANy5/MdadxI5ut017wAw0Cn1XwmEeSxMjp
         1TosNP6Sxsp8qgZvQzQS+E1r0tSmwa1y968K9QvwB3X6q6d53yNE4dk4o/pYl9N5yDQb
         naqpN6MR6Zgrp0FqMAT/VDF88FWwWBiR/tkJ+ip7GINA1J+vCvsByoOMJwa9HpEpwQpc
         Qf1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUty7/5eQnOhxlJuXuIg5LvtoC06htnhYSC77ab78m3GKvUdg8lUkFGpHdX0RMRTGAUYDvtfUk1VyZBGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/VWZD7LNh0LK3JD80bpX9xI/YETmK7R7yIZU/lmabaCCgJKAy
	qsYzH4lUpTIA+NDpUuh56O9qzsweaa1jrOKeIIA57u5O8fR2UlqHlpO8
X-Gm-Gg: AZuq6aJz3jLUbYfujJlqwTadm9VEHExEOlZwc/QDVXpoxCYV1TBgUWeRDaAgZvB/2Oq
	fdmaYuGaRUc9LgGQnB4hh1jFFFma49C4wGbidtaQLff+Ox9BOdRxZqw4hBFc+AmLTAy1ZXOtqei
	R04rn1wZ5CF/u0TjYMWhUbshLYV+2HrbmwQ9yWncZO5DtwQMITZVMaVumfA+sSMjBO2mF21ZBrW
	7H/zjPh/MeX5WYsZTJ6xJ4zYYLANaIX9Leyv8HClAULs0DHV2Nei4bvCA19TLwtOK1yj2F9RDhH
	L/kKSsv39r1Hm/B91nNLv2r93qruq0DlmkqnKuhP8wQ3dyIjLbZ76EHdwQOEvfQdz7rjTUrb+Bd
	x4hdDKpKR3sRkdaZMr1ehz0MvXWRXaoICtIJsIC1Qz3fMwD8cm/j8muhHYTagfhQQL4tZ/7+Aqg
	==
X-Received: by 2002:a17:902:f609:b0:2ab:230d:2d96 with SMTP id d9443c01a7336-2ab50521f49mr9038285ad.11.1770962373513;
        Thu, 12 Feb 2026 21:59:33 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e1ac0e004sm6274588a12.6.2026.02.12.21.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 21:59:33 -0800 (PST)
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
Subject: [PATCH v6 3/3] ASoC: Add quirk for Lecoo Bellator N176
Date: Fri, 13 Feb 2026 13:59:04 +0800
Message-ID: <20260213055904.110256-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260213055904.110256-1-qby140326@gmail.com>
References: <20260213055904.110256-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lecoo Bellator N176 requires a specific quirk to enable the DMIC
support.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 0294177acc66..de49c812124a 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card = {
 };
 
 static const struct dmi_system_id yc_acp_quirk_table[] = {
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Lecoo"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Bellator N176"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.51.2


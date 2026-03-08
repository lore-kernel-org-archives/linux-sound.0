Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660DD26056C
	for <linux-sound@vger.kernel.org>; Sun,  8 Mar 2026 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772983145; cv=none; b=KEkmmpwvrZvkHWTlE0OAmFEoKlHy+bc2f/m1F3EgR+qnVQgPnfttEdlG9muYEr1kWaQWbkbOytACbaGOnFLXN8AHPSZc5wwy7UqFUoKZPJx+xrGpiMrWNnXnIiq5apCB8nhd7XOUZ2i/k4u9dYKbX3XBQQznDJpH7LSM30Zoyu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772983145; c=relaxed/simple;
	bh=WzSycVV3n3m1nlglOCULinG6UucZXYoN/FwdD1o12u4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iKvqE7lx6cshEzAVPjj9FRwENYTV+zvNL+QDEUQqdvAxc7w37P5mz1rfPfUNchv/turA4Uacwee2emtw21Fay0gSVnApALXik1IO8WAOtHewRvxsYmMb7GgykAnlBrt9Yx/HbyftubqYtg7rvjZwxl1bUl9H0IoCICl9L115wvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5FSupfV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5FSupfV"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82990763921so3170913b3a.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772983143; x=1773587943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrKwaPVIBucEK5MNDDk9LSQiLNqrs4JUIOgNjp4SUmE=;
        b=B5FSupfV142iyxPFinD5Bj/cE4uLTyoimq9tn4pNkD2pHvP8nDU8s6aLgt4eudEoHm
         fIX+XTLLPLI9NNN5eJ+2w06aTJN6vkmSqCtqNwnbZg/b7UwZ9Uq8L29qjk7lGjJlRKh3
         KfoP2W1qxH4d3tvRoJ9cwZCpE/Is8RjGlo5kDhm4+z361dogSHO/jUpnEGunyH6+m7Ua
         NZGcbCpHlYrtN6cAnFbFZHL5OtF6mzkgrqAr71j5AY+rghHWqeBk6Ax0kJkNAKyqbBtI
         nfpe91j9u9GWHMhpi6neuhup5CUyCkEftGANFoDE/93CCz7F/8v6VatZ1tZeVscW+Kub
         agdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772983143; x=1773587943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lrKwaPVIBucEK5MNDDk9LSQiLNqrs4JUIOgNjp4SUmE=;
        b=pGShGA4LizPsPhaB4RSMmopGtZS89eJmzXth+MF7DbqR/6TmGyKJ+bdXSNerry0LGl
         lhh5RPfiOi6KhWsx+rgocFiXlmQsbKkivLp2wamsyrj4QHVlU+qknbKi+s58qrkHYEZC
         oF8oQ1yKbHlblaYdOhUGTZoCstS2Ap6fygfXZrrxmrnTFd/OK9bR54lh+2ijYwOiazun
         5chKdlMHR2zJvb7UNSYvW+wAAd1rM34//lvmqbimjJSDeX9F23rfqPiYHYHwruYMI1SN
         X079B8KNPcHCFziD2aEpHcWhlmn5QMkXJn82R3bf0ktyr7VuCA9NAtoihkg0pcqg0SSu
         QoIA==
X-Gm-Message-State: AOJu0YwVoXqbAEmk4oGSH7U3+botF7UPsxgj7gZTYnLiu+gdM7AY1/cn
	FewEhDGBhVdmMW0bUyRDofrVqcOSyCX0VYUvrtUyyu8D2IdeUcHeQiqZWF2W7fj2N+o=
X-Gm-Gg: ATEYQzyN1Jp2qus/7VZfv/QedL3tHqEoJ3bKT/A3oIhjbsv18UAaYlpEGk0R1pUadxF
	8eZNtGt78/gRBfOJCXzqoldNZslhbIAt+U1+mp8dHyK+UDJRZsI/FnwE1rYNqboiQNtRntUMmhn
	wTBhiViQu2rrUrZOYruf1+RHhyxtsqszd6VKKoYM/R/7/Vaps6Vs0VmCuTZVdNbZ7astsRHZp1r
	J8lEgSPcAZMIxhsCBrzNp8T38IzcQfbkL5LSZ0e9G19KWd36thpc4qTVEBvPDGQu9F29WFpyyUN
	kXuevBrF5mpvncsyGGUT75G8FrnJTE2gldT1OfRTNN+DCvBZNHj7D1vhRZH8l2GVw08RbHo6RhL
	gALBX681ngCEY59pMSxYRArKlf9QHZiSj2aq0svAbZoO/pGTeCOfdznioZ2gsjpwUKLo8XgFJvF
	9khQEwh5fTRoy4zEgQLex13HR0
X-Received: by 2002:a05:6a00:2ea6:b0:827:39de:ecf2 with SMTP id d2e1a72fcca58-829a2e6847dmr7595189b3a.25.1772983143480;
        Sun, 08 Mar 2026 08:19:03 -0700 (PDT)
Received: from px13 ([218.155.71.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48ddd18sm7432513b3a.56.2026.03.08.08.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 08:19:03 -0700 (PDT)
From: hasunpark@gmail.com
To: linux-sound@vger.kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Hasun Park <hasunpark@gmail.com>
Subject: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy SDW machine
Date: Mon,  9 Mar 2026 00:16:54 +0900
Message-ID: <20260308151654.29059-4-hasunpark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308151654.29059-1-hasunpark@gmail.com>
References: <20260308151654.29059-1-hasunpark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hasun Park <hasunpark@gmail.com>

Add a DMI quirk entry for ASUS HN7306EA in the ACP SoundWire legacy
machine driver.

Set driver_data to RT711_JD1 | ASOC_SDW_ACP_DMIC for this board so the
platform-specific jack/DMIC quirk path is selected.

Signed-off-by: Hasun Park <hasunpark@gmail.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index c30ccf23005a..d22b71e3fd2d 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -111,6 +111,14 @@ static const struct dmi_system_id soc_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
 	},
+	{
+		.callback = soc_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HN7306EA"),
+		},
+		.driver_data = (void *)(RT711_JD1 | ASOC_SDW_ACP_DMIC),
+	},
 	{}
 };
 
-- 
2.53.0


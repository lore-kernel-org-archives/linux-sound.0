Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443C56136
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 05:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747371958; cv=none; b=KQ1rDWjMxKpkXZzp+Y57mpUK9xyikl/CfLyfBbC2052cgx9TCYH1Hy+SONBLdUhk50M/uRAnOye5gqH2h0RrYaXjddkNiGJ3XVLFp8vMtdncvqTHfJrUKvpaoIoOfHtEnFK3ZzYfqVobEKGhgaXGgC1FwVgDDg0q60/K/EdyT4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747371958; c=relaxed/simple;
	bh=pNM4L2X+L/0C3QZ8j2kxPo6S+C9SsxrBucubd4sDLhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T9R4eUvuYkX+T5AoyPX3y0fX/Zep9Vn2MpoQJjZiKw58u4zgtCbWPKui65AtKzQeidCRnDUv5vJ0fAuZKeWWNfm35wvKKys8SkZ0njGhz4hM8egoYUQ6kUs1E8fDUzjboAIVHvWwn8p2pQfgMzbpcu6+3v25FO6SNV6crmP+vBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AesWd0/X; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AesWd0/X"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22fbbf9c01bso14364535ad.3
        for <linux-sound@vger.kernel.org>; Thu, 15 May 2025 22:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747371955; x=1747976755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FZYfWobUsai4Anc24HWgooUiX7BPMHJRwh278DHkFhg=;
        b=AesWd0/XCkddMsN0RPgeMbP0qqoZVe4N1wgXPHlUyA2XF35rqxp1LOOSFpgl+SCQAv
         ID5XeK3ZO8I5W28EYRBOXc9Udl3Q3GZvzO9Xa+76bfEEkK1q+ZuWfNNZtzm+vtLO+aoQ
         yDvjjq9tK+zRajZuJb/lYyQ7aq8YioMEG58+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747371955; x=1747976755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZYfWobUsai4Anc24HWgooUiX7BPMHJRwh278DHkFhg=;
        b=FGJj8GblCKLvLqpwUthWWML1ujl/Gd58QEKQwMW5fSWNLHGPp2WZM3mBoh6gLuMjO8
         kBJ1rpuF6+8tadmfzpRMJHPKVYuEmd4VuZh6yHGMuA/ECyb6d+mSjR8gbJxfRrHAJF+3
         ldLPntLg9Y11OKkaiHSKhF2ZEita+IWXXq67yxTXjzNsMhsdGdMpQSTDQTg1qhm3bH2f
         qM5NB4wNy4fTJ/FhoRyyrH3kHfxmVHFCnn/8FOE2daiW0Kxn3s1rOllhE1XAB56H01tS
         tyAVg2/Dq1bWDkx04oY1ZzpHpA/68DyFQlrB327qX7fHd0xamLsVTg+8MRWqpkqgs7tR
         51uQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2wlWk5FqCbMdn97VEuQ2jmTn8c18Ejv5gDQnefK8tr1+OLK8EAcv6SUfRBVA5RJrWQ7bfTbjtfoloeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqDrGaT4BCjsM57JTdd+N9xqndb9PnCUOb+6xpkpET3BwZaCWs
	tBeKQ+rVx2q6mXDwInS8ykiTm2U8g6X6ywedlEjIvOZilnCBztn2doY+uUpICiNrgg==
X-Gm-Gg: ASbGncuriQtv8nHFx8jY97K5RZxOPlAWf0tBOrcBdghSVmQBMZ/irLXrSXjMZ8rwdQ/
	+yFItFoGGsvI7rM8kLzTuLklunvLPIsTOJRWlpckYA5UaRz6yFsJHWxYxG/3QIzYvMmgs27zM6w
	hCi6sZIjy4T7SDkzbP9nHTgGvXD3sLVnzXXQUxcAzWK55ZnUeGJBU4c9YTLxedFOeiqf89PNu9T
	gk7Sm2krr+e9YT4wwV9TC6jLqtXqNe0YBNDule6i+zow8hjpUYGLPzbbT7bKUKWsyKohuKzfXqo
	9lY4LitBwYj/+hyWr+vhZxt8UQ6nN+fNrerEZ3mF7bOCIijxSxGUrLptRMPpFgY19HDKMg==
X-Google-Smtp-Source: AGHT+IH0/GDb4r+wiufJP7iwzsEy+MWQRcekYSbQLeI/kLmTr/rbqnbWo/loA5DWMHtf5lSSzKhPKA==
X-Received: by 2002:a17:903:22ce:b0:231:b456:b97 with SMTP id d9443c01a7336-231d459a539mr26785735ad.36.1747371955405;
        Thu, 15 May 2025 22:05:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c43a:aaea:5f52:5763])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97de4sm6312355ad.144.2025.05.15.22.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 22:05:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-utils: Check string pointer validity in snd_soc_dlc_is_dummy()
Date: Fri, 16 May 2025 13:05:48 +0800
Message-ID: <20250516050549.407133-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the recently added snd_soc_dlc_is_dummy(), the helper uses the .name
and .dai_name fields without checking their validity.

For .name, this field is NULL if the component is matched by .of_node
instead. In fact, only one of these fields may be set. This caused a
NULL pointer dereference on MediaTek MT8195 and MT8188 platforms with
the subsequent conversion to snd_soc_dlc_is_dummy() in their machine
drivers. The codecs are all matches through the device tree, so their
.name fields are empty.

For .dai_name, there are cases where this field is empty, such as for
the following component definitions:

	#define COMP_EMPTY()                    { }
	#define COMP_PLATFORM(_name)            { .name = _name }
	#define COMP_AUX(_name)                 { .name = _name }
	#define COMP_CODEC_CONF(_name)          { .name = _name }

Or the single link CPU DAI case in the simple audio card family, as
covered by simple_util_canonicalize_cpu(), in which the .dai_name
field is explicitly cleared.

To fix this, check the validity of the fields before using them in
string comparison.

Fixes: 3e021f3b8115 ("ASoC: soc-utils: add snd_soc_dlc_is_dummy()")
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/soc-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index a1bcc852a6de..c8adfff826bd 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -267,8 +267,8 @@ int snd_soc_dlc_is_dummy(struct snd_soc_dai_link_component *dlc)
 	if (dlc == &snd_soc_dummy_dlc)
 		return true;
 
-	if (strcmp(dlc->name,	  snd_soc_dummy_dlc.name)	== 0 ||
-	    strcmp(dlc->dai_name, snd_soc_dummy_dlc.dai_name)	== 0)
+	if ((dlc->name     && strcmp(dlc->name,     snd_soc_dummy_dlc.name)     == 0) ||
+	    (dlc->dai_name && strcmp(dlc->dai_name, snd_soc_dummy_dlc.dai_name) == 0))
 		return true;
 
 	return false;
-- 
2.49.0.1101.gccaa498523-goog


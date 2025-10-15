Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8094230D35
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535764; cv=none; b=NvYTJAYXkMgZPl9YrYQp59flOWXdoQ+KrxsZrXRCXGRILoFvKT7bXsjRk3Oaft6zxNon0wNdp8JyWmKEVCiPcF56IA43ZoYjKG7a40QmgdZwKGVyc9hQjTk5tnjBZ+VjeEbxe8CQMl3Cvrk/HtU8Xxcli4ToLtNNtkFiSGjQsZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535764; c=relaxed/simple;
	bh=Fdjnv0MFhMdkH0HHYLytBDMtR3HU5RgIlS9DC8QO9vc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fg5vD+EEXst8RmKy8zsbriF1AYgYZhxGGJuTqePxkWjya5BRgDKW0McVdR7Q1gSwEWwEN+Jhv/qPuhYoE8MSfDxXDBzr5T9aHmbX6izQFp6T1u0K7OMzfD25vtFJNBM009pb9Gd9qjRsuAn9AnSVaVOzClqvymsBnUHFYQKjrvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTmk5GLA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTmk5GLA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so53227275e9.2
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 06:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760535761; x=1761140561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tGMJYIk/kJ5NM7KARvJJiGscSvnVAEOGo7VwpNRVXA=;
        b=CTmk5GLA9PkVEOsFd6FZll0d0iM2rYB6+sjfMJ8uIqlWjN3vt0Vwzza/y43UXjKuJd
         38TUEbKlUH5AwyjI4nx+n3g50oVEvKVDCsmvMYQsX5ehiYUYtUzbtE/MgA7V2yylD+dm
         liMbchjRDT7AKWDTTUbc6INkVBROMgUJ8Rl0lvLT4rWCiqTPsYVu33vcL/jXyZYj5C+4
         LVyNElXjp40a2rjrRUaZvjOJkNxNkI6Ls0ru1i7ncXnQVnLRxKwd9Wow6Wd09G0alnOW
         msiz1S/Q00CCb6m04BOW4FuNj+wFTCendm1uFR9GtHWusSwSWlHf4GzndPNOrDCa3aub
         817A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760535761; x=1761140561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tGMJYIk/kJ5NM7KARvJJiGscSvnVAEOGo7VwpNRVXA=;
        b=fg8IFsIXBTWAlnG/4AQ6EjI+VlKc+YHHQeAThXkDWQHfNpnF/sqbnc02sWknhtPyp6
         3tTizgkzOA2d7PBngTIRg5rwBSj8fBd6/dnUz9Dx5zMTgTRxQgHXPgRDz/nR/5kxqXxq
         ID6/XvxFnbPc7AwSyndyms6v9TrUnTbPkmhFcy1oPj14D/9GQAMnyVUFg/Cp5Czc/bAX
         49tuMAHmyVIT0KJGBykSWwzpO/gfIGC5XrcV7lwKK73c4ex2w99AOU7cMmtnlTXPUa4f
         LGAdYTYnvM4VMtLwBz/3pSjFS0o5aJ8NX6WmXCnnflfZWuMoPebTgeNWEqV3sPrrOWcj
         iOgw==
X-Gm-Message-State: AOJu0YzjqUQ5ImdqZJKz8HqAXLvmVVfQAJwkoXzskcJYQWSRzvFt6Hpw
	y9B4LwwKnMjt/uvZcrTVCkSX5bNocKhXtPmLz4LrIaTnIF6O76MF739JE0VWYKDd
X-Gm-Gg: ASbGncs+bZ0F9ifX4FBS5U18t/fwpAkOIVMkTIWxmvGr5R8lZ3xaRb69seAPwFG+yXO
	Lv5oxqGGzmUK56dAC/FnYKg72OewaGtMMqBndA5wUauc1rKn3GNulJo5uoFYB3KeApweHCUf8Li
	FfjohZJVWjNOvzD1L2Q7iI1roVBOakE8MCnpuBGum3602YIJBVWuMJHusR0tkiXNJ4DThVr+MRj
	nard1RqMGcZN2QQcl/Z8TFbY0gTotFl+CHGC5dg6JdEh6dEiT3Yws4eodgRHwzzCuxZxL0UYmEK
	6clVgGJWQY1hKC4Uixc5EX0Flf2svi9Cmog70GTAjtpBhxVYVrRDjDgku75FcDL+tqEoGIwkW4x
	jAMnzQ8mPyege3Zw0Lxt01I5AvyImzDpQg1rtcMB3yh37wk2/51mbspL/QWwVyusH0Vw5F/jMZ1
	TQ8eL3i9wJ
X-Google-Smtp-Source: AGHT+IGnFEL19OgbSXTUJTtDSCAU9YWhBlG3irLLXu6ozcc7Dtu+JOC9WZwJxFV3GxOWbz8NXvjVYw==
X-Received: by 2002:a05:600c:19cf:b0:450:cabd:b4a9 with SMTP id 5b1f17b1804b1-46fa9b08f21mr209618965e9.29.1760535760461;
        Wed, 15 Oct 2025 06:42:40 -0700 (PDT)
Received: from sharique-Precision-3640-Tower.hw.mobotix.net ([213.183.84.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab4e22d8sm174656315e9.5.2025.10.15.06.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:42:40 -0700 (PDT)
From: Sharique Mohammad <sharq0406@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	Sharique Mohammad <sharq0406@gmail.com>
Subject: [PATCH] ASoC: max98090/91: fixed max98091 ALSA widget powering up/down
Date: Wed, 15 Oct 2025 15:42:15 +0200
Message-Id: <20251015134215.750001-1-sharq0406@gmail.com>
X-Mailer: git-send-email 2.30.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The widgets DMIC3_ENA and DMIC4_ENA must be defined in the DAPM
suppy widget, just like DMICL_ENA and DMICR_ENA. Whenever they
are turned on or off, the required startup or shutdown sequences
must be taken care by the max98090_shdn_event.

Signed-off-by: Sharique Mohammad <sharq0406@gmail.com>
---
 sound/soc/codecs/max98090.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 22177c1ce160..cb1508fc99f8 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1234,9 +1234,11 @@ static const struct snd_soc_dapm_widget max98091_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("DMIC4"),
 
 	SND_SOC_DAPM_SUPPLY("DMIC3_ENA", M98090_REG_DIGITAL_MIC_ENABLE,
-		 M98090_DIGMIC3_SHIFT, 0, NULL, 0),
+		 M98090_DIGMIC3_SHIFT, 0, max98090_shdn_event,
+			SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_SUPPLY("DMIC4_ENA", M98090_REG_DIGITAL_MIC_ENABLE,
-		 M98090_DIGMIC4_SHIFT, 0, NULL, 0),
+		 M98090_DIGMIC4_SHIFT, 0, max98090_shdn_event,
+			 SND_SOC_DAPM_POST_PMU),
 };
 
 static const struct snd_soc_dapm_route max98090_dapm_routes[] = {
-- 
2.30.5


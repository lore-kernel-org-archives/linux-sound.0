Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD8C1E1DE5
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 08:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956524; cv=none; b=XOWZZ/d7PBbM0elV2dVzXZdjNqy4CUjbYmtYB3/65kU7mmlWJ2XIA7E6CICbjnKSvKVDHwtfyEwun0e/VgH+nyDt/0OmSJb7hCW/R1GcVVi2IIYoy432ACKv5RbW7AVNdziGKxzbYLqWSKxTR3yk7HrN5HU9A/Ea3tsatkzA9fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956524; c=relaxed/simple;
	bh=fvj9ewGZjm9n7aBmJJ762YtuEVTNsjnkrzhk+PiVYzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FUV8CBR8JPGSO1SLqxQjPEqloLOBE/UeN6vVWxkAjwUAm/ZAUusogQyj143N43DInzm3PuSByFvUioHhCtEPTpThAafIoqyjFpY2ULnpCRYToTXXw2rfUu6Ay+3woRBy4WbbJbcUNwDpnuV97VheU0SP0bU41Zq6RU+krMA+ekA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=DAtFUYTu; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="DAtFUYTu"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B4FF93F9B5
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 08:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1779956520;
	bh=YjssOyZAjkfDJZNpMAdpNGPZCAwIg5gZnjT4sc3lUEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=DAtFUYTusMqzIXkCUHbuK04f2in8qieGKO8v9LwzqotjuwMGPytNtq1AR1nQEVK0A
	 X6Dgf6+o/Bscs5W31PbRKSajVIEBxbuxn2+fHk547Lu7HrOZB/iV3XZ9j6woX/TcOP
	 zKASqn5uGmxxL40R4cZHmrodmWArqDwIKACXEYhaRBRXk6B/SI0LZK03nCF9F3a2PI
	 y/Nw9BJhtO9C5be9URu02slHm2f0zSDoQCP3ylFnDgqHW953eIlTjr11OlWFKgZQuW
	 EIF3g4PfxldAFSQ0mATGZA0G6Eug7a7bKggfPnUOw+INHrjQ+b9qkry41cKfYv6Yq3
	 VNw3DMgWPzaTCEHivGOOIf6dwa1jw/ZX1a+q15qbkmU6dTPbuCgG4T9/+3N2auD0Zf
	 A0/DU475+eElbH0Ib+vhKEgYi63+HfxO3tcR8GRrxrzXo9TsGKMSZpfIY7ZHtj2VmF
	 WWmHmOa/iXUeb+ShlXbwEQD6pzH3lgQbPQoTLByI8Bg8ZeBppm7xsjfctAaso4lyDx
	 vVSDkClTbt1Gkt1Bq3Ha+4xj/6STk15cnss/oX04/Ed+AUxaA9nobIHBUHYLZOETqv
	 OcrB+NsGjl1HLOfo+qn0DUSWoGNRCeGoZ/wHdGrkuaeAVZxV0OvjUdHY/0EYDvJILX
	 5cuiGFwRgx93m6+vr4Av/9+Y=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49058295985so31915815e9.2
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 01:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779956520; x=1780561320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YjssOyZAjkfDJZNpMAdpNGPZCAwIg5gZnjT4sc3lUEU=;
        b=FR55lkW9r4/pikidp62sccKzs+C+Ls3HEBcuMmxWcsoZdZQMRerN5sR0zErYYyLNTF
         XP92y78yKYqfvikXmYLyxiula7IWSFbG//zfYjnB6v5ONjlQQI+VelwyhgbdCZFxwIv7
         uOrDQPpngguzvBt7EPgJ8EwG18Dx9d6BHCavxM17PUA0547oH6aJBkOhA85fKi0uEI9Q
         2Shp8Hs2idvOS1R5VnXeGBBLHzbuMbe4n7gPY1lWnhm8YwxVuoDacVnbwTB+FyVUJNhY
         tmxfLAihcTJMk5csZ6S+ANTemqbbQKLs6J1WheVraAVNCl2lUz9gTXAlAKzcv0C7ZnUe
         snBg==
X-Forwarded-Encrypted: i=1; AFNElJ+mwClRv0MEUjBQn1j7NQtfybh4W03/shuKxnOq/GqNO/bKsmFTbIqbg4J/ag/yAqpQ+KUSu7GrYFg4Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXnDaLZWh8XjQydBWbzMvJenqNRWkL18/2YvyWzudX3yO78AYV
	oEchEVGhvrfq6ACTS2MYuL+F+ToxpxYPAJ5/wtA0Pox0UAzdQ4FnV3UK3BVK4VwamuEIaApg6qr
	ydbG1pGgh/pLEwQXUgaBbxjhHDIHNsvJP7uymB8wKtx6J4mJVbTroD/XZZNs1aC4NH1EqSTwwbT
	rk1XR9
X-Gm-Gg: Acq92OHvKHqeecb9DAx1ssGzgDNMJlhwcMtRK1CwztlZ6U1IzlwIrEd6mOHAmaOv6TY
	TdBD/1TIVw/iCaLOkP1TO/DXYgy/0xltGlPYA8n1NNmsTW8vUkbYo1I9ZM+/8sEP2hR3DD2D5jw
	BkNFSUOohfIGE7WU5XBkRB8YwYNAJQr1D3sAzTEpoI1Az7pwaWAhHQa6gMXrEc6wajstACUJLNK
	taJ58ubDuaFxpwkJReRIB5S0J0WjNVYaa8xkNQVwo7TYnsbD2jVMY0hAOqFNqqiLpbFUjLChp8f
	rObq73ejBIbkw2YFZLlAC0gkfPENvvEm4e9G7VCwY12H2Ahv6cqKps5cK9299DiKg5HDyuYnJ9D
	Jl/OCiedbdlROknYGplFf4tDmGhwQv2pEt+Fr3qZv8L6bbctq2wFzKIB1Eopg/hW5Lr+IBHZOD2
	LA67LkYzcVWQnC2muJAkBoriSX/hgYYQ==
X-Received: by 2002:a05:600d:644d:20b0:490:3cb4:f1b3 with SMTP id 5b1f17b1804b1-490426c5a3dmr314932855e9.16.1779956520289;
        Thu, 28 May 2026 01:22:00 -0700 (PDT)
X-Received: by 2002:a05:600d:644d:20b0:490:3cb4:f1b3 with SMTP id 5b1f17b1804b1-490426c5a3dmr314932565e9.16.1779956519966;
        Thu, 28 May 2026 01:21:59 -0700 (PDT)
Received: from localhost.localdomain ([103.155.100.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a902bfsm42284605e9.12.2026.05.28.01.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 01:21:59 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hasun Park <hasunpark@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Li Qiang <liqiang01@kylinos.cn>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 2/2] ASoC: amd: acp-sdw-sof: Bound DAI link iteration
Date: Thu, 28 May 2026 16:21:10 +0800
Message-ID: <20260528082110.915549-2-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528082110.915549-1-aaron.ma@canonical.com>
References: <20260528082110.915549-1-aaron.ma@canonical.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

create_sdw_dailinks() walks sof_dais until it finds an entry with
initialised cleared, but sof_dais is allocated with exactly num_ends
entries. If all entries are initialised, the loop reads past the end of
the array.

Pass the allocated entry count to create_sdw_dailinks() and stop before
reading past the array.

Fixes: 6d8348ddc56e ("ASoC: amd: acp: refactor SoundWire machine driver code")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index a0fd8a6f99708..a423853f3a97d 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -220,13 +220,14 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 static int create_sdw_dailinks(struct snd_soc_card *card,
 			       struct snd_soc_dai_link **dai_links, int *be_id,
-			       struct asoc_sdw_dailink *sof_dais,
+			       struct asoc_sdw_dailink *sof_dais, int num_dais,
 			       struct snd_soc_codec_conf **codec_conf)
 {
+	int i;
 	int ret;
 
 	/* generate DAI links by each sdw link */
-	while (sof_dais->initialised) {
+	for (i = 0; i < num_dais && sof_dais->initialised; i++) {
 		int current_be_id = 0;
 
 		ret = create_sdw_dailink(card, sof_dais, dai_links,
@@ -334,7 +335,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	/* SDW */
 	if (sdw_be_num) {
 		ret = create_sdw_dailinks(card, &dai_links, &be_id,
-					  sof_dais, &codec_conf);
+					  sof_dais, num_ends, &codec_conf);
 		if (ret)
 			return ret;
 	}
-- 
2.43.0


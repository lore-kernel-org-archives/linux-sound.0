Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E069B48A2B1
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045126; cv=none; b=LJ3nIFvGjyuNSt0jbd3Y4otcMirVrVtovsbz1McmN+78WjOACzPRBh2j5odnXixh7DEItJUMaUSdI7aw+VDQg1KCTFr3eheJvCsOKOw5wBP/KD5gKpIaUalLyPXmhC8p0QIVBUhoBRyNT18u7gajpjeELwzjXizs1K5F2zYdu40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045126; c=relaxed/simple;
	bh=Wfj7ayzlWfEu+I8dT6gg9Qx37En8fvuHsBJbQGPJEIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KIeeXlquoL6fKWpUHtrFIGqTp/MWU9qMgOhChcSLxkmwNmtnn86SgPOYbWwFRZxxW65sgGX4HNTdjB9w/T3YVpTL0bbsHnhE3YrEZ4RZCyhrT6vlpkrjgZU5M7+QHIjqsIhx0bhJktNtiMjoas+XizJP8f7JjhoaM/SV3fxXSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ct57quuM; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ct57quuM"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso6639516a91.1
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045122; x=1789649922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=Ct57quuMxyD2hHz3lF4kxqr7Gj+MBJ3uJIZGzCkp5B4WESkKv93MK+UoB2j8xWb1sa
         uXyu48K85yY61cO6T6pJVm8UVKXhdCF6IDiTq1aECDVm/ATJHOy/qLUWlB0lEGP7uK2k
         8BD3QeVvaUt5e32t5ylR7P8V2AYGNS3HMjPTcjb8HV8k5qJwGIZ+eL8cJ4nHBQvKpGUE
         UoZzVD1S1HlFHDEJkPdENIMqYubElaD+RUjGe0A7K8vaLhkYMNRpglUDEVmduY9qQX+G
         JJBhXCFE4kq2nV+m8LWChMF8nD8ImhUOCPoWxO6/oNMg+8Ojts8pZ4dXpaNAlbbw3msg
         mfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045122; x=1789649922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=sINyEtORJb6eeAzC3HinuSVKJop1e+vP/NbhDq1cknuftT7zsajAC/JnzntH6b5+F6
         M7cpV8qQMA9VqDknYZkTpMAwd3YU5lVe9a4sGHvK1Dr6GTWp/xLplfEi6fIp5UQYIs4v
         uJ0YF6T365/dSjrB7sIp3Ur19MEiANF74PiTVbyRyQzv1xmkKmd9ptCCmMbxrB5nBhku
         6XusJAVS0HAVs08ckrzMgu+sp45PSnjnS0hdPFVHWEPSgFY/awgTKMWkqqTCB1UhqBV/
         jg2fP00RB5mOBWNMCb9dApDtUgT5JXIFiL9qJ44SQW4/0d3ltz/LR8HymvD/pbWOQ2GY
         VDbA==
X-Forwarded-Encrypted: i=1; AKwUvByf7RC8i22ZPVL2S8A5sl7BrcCRMuqY+xflG3VXUAGQ/hNbn2byKKpLe9sEZuwUAou+y1uZHksmuBVdjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lA/lz5yRjoX5YLH80DCZkM40sK31cxbCsBCOTcoQ8BMYy+56GE
	uBR/sM8yyhQaybAMaW9tZ9fSMo+1HySxlgMsMwOC16R12uT8qAzpNvy8
X-Gm-Gg: AYBFou0wgsN+fE7aK7CUUGAgrTQiWOPUgsduRq21reP0O3Njy0OJUlA1IZsr8GdEMhA
	OK3tzszefBvgKGB4HMpoKCrh+1nUxQf8AT7WL59r4qO+KIBtrDZO/auXBlYUFF7da/CVtnuMnTG
	/q8rxPuIhKDPQES+WOSQDDLJ5vP5EEie3M3m7AD/q1MIgvpTJT7HNsFKPpBbzB3Lv8cShkcxYO6
	f7UeVuHaK8cxIjehrA5kmtnxgJxnbq+4GBCIpVZcjiagCaPMKrCXmd2/1KeByncbRUkUhFAZo2W
	OIb/vo9fNI/rGvkdGRYZsTHA6VZ7aLA8DktH1oMUyzEmNRuVbdPKA936YNZE4cbcyPc1meh2Pri
	eQ8UFw0jVeaUB9yZF6gVwfNA0lLn1OF5/P5Z+My6SMobHX4lP1MeC4n8aSsJbTXuvMHdHMoQzHK
	PchkWOHjIdeUjKS8/yAP81hoSgwga33rMj/zFEfhpiYtVaKk+faL4DNuBf8Lptt21rlMEToJEqK
	8ja0tzObQbewkK+/SJqvYN2bSbTDhCSMTLP+i7riRTOd5E3CUWOpZQMv7xAaE4BDq/M42TO+NCB
	ceCJs6srMYGinhVa9WpsGWbXVw==
X-Received: by 2002:a17:90b:3b52:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39b26101d25mr61915384a91.8.1789045121712;
        Thu, 10 Sep 2026 05:58:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/13] ASoC: mediatek: mt8189: Propagate APLL errors
Date: Thu, 10 Sep 2026 19:57:38 +0700
Message-ID: <20260910125742.150902-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_apll_event() currently ignores errors returned by the APLL
enable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 94c49a662e2d..4826ee250d70 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -485,6 +485,7 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -492,9 +493,11 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-			mt8189_apll1_enable(afe);
+			ret = mt8189_apll1_enable(afe);
 		else
-			mt8189_apll2_enable(afe);
+			ret = mt8189_apll2_enable(afe);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-- 
2.43.0


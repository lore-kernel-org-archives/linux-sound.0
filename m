Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EB940EB80
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 06:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662342; cv=none; b=mX3t62BsSDGHy2ikTHr+ienfEhq1ela9M2YMIuT9GUPlCRw6dzQWi1b31Zo0EvEjXFG+wrJky53IUKso030dNxTPP5GurPccFhhASJ8T2jkw32tjjjW1fx9ObIFEklWhBzfwiOlUhPIqDcpwGC4WaQhxvLkGE5eWQpcTvgJdkZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662342; c=relaxed/simple;
	bh=v+NrIf/aEhKFnF2XgIKpuXsPvWyrB+Vk/TkbdhhH2YI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=om+225VkDI/7H2Jxvke12f1HslAJOYUq53Z2oKsMTRI1ywDVDsYxhBKQqbh1MMuy51jKEJfm/UPkGwuObJwyHaKxOG4YnoM7viPKPrvorzodTg1G17hjkaLw2Y8W2smPfGexm47s7RCicrsgQi+2o4J2Hr+pjfW7kkBTqbRSW/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0MeQ0sf; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0MeQ0sf"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a48e359e0fso620078a91.3
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 23:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662340; x=1791267140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiOQQUNxogiUQyW9juq/yIUpauLJuI5yeb0AGzYfhSw=;
        b=P0MeQ0sfJUI60oa8snfXYekjRHA5i7H59hcCB4770e7Eoo/p/b1ZOqEhr73pn0zYsV
         jKCwWbzhocALBolPajt9suRC38VDbpZlZ+Qd3hgBereP9xIBeWqTweB4oyXsZaRZ8oZW
         kDCXbsCGfyHemk7k8mXipPOQ5qxQyNmiXn0w46nOf/RIWIdLW3Ddcjh0qUwUiIJlTp5R
         UEkJYSLbsJQqgXDqjpsI38arBbt28I5anh23E2/Wfz+s3WT7sJ3rwkdIBIfNylq3TFXP
         AlU2sE8UhIg7bbiVA1LHntVzZG7KToYIw0jD0CDM8Fa/nagQDYOrBh0pbmp83bUzB7oG
         ob/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662340; x=1791267140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiOQQUNxogiUQyW9juq/yIUpauLJuI5yeb0AGzYfhSw=;
        b=ZOy/76LqmqSLTOf0nya0juCZNO55TDwG0b0kK3OsitirwFYQjAH/ZUhcCkfa50J60D
         bbynN8p//n8qmIlL36bdiJCIWpeXbjLZuRNdvhT/VaCvQTaPj2r+XVbXZG+mj2HDL0pM
         EvFoG4uzppXaQE3O0f/lAo8sFRF0XRSf2KFKFbI08Ar6y8j6oXBLnD5dU2jLZ7SERUha
         9HQTm/F9/3XmEjCSqmjrRnqr8DmwBGVTFyUm2A/rXr6Ksbou0+7ZUt2P5nqkEbREteq5
         KP6DroqGgKQSL5S3+/0DMhj3w/0+ZZqK9xIR0sxU8YzeldCZtWouy8PIiL387GFv92OI
         VChQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEv1rKHp/cSKj0Ek+XsdHTZDhIKlLv/UMfH7LSlJF7B7NhYavJ2xII9EgD23wWjp5K3fKrAhC6dNve0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUf+rQT5p9b8UTGG0UGMA/19PhgAv07GTr/oNPQzo7QzZm5uC0
	egXgaJnfG8pMiactK9ncz1OTRPSVWTBBPypv43dD5oAe/8xD1wxym4ZV
X-Gm-Gg: AYBFou2JA+nOFCyvYrC+ZZeMlZFGeY0LrGYeiC8o+gMAdpHx1UA1KkZHKsH2UaA65eN
	dQq5MEm5RhUcag0IFhnQxsB/EgyadVAoUaj8x2GQbRxFlPcKK4S3kTxvVSs2jrx0ka/XDUfOzDm
	Del75hwcYLyqx4n/irb2aQqdgKVaHeZYalsWxxYKypE4nEi40eHlqiWE28dh4x6MWX4urVGU1C0
	o2PfkURHmsFcgdaZrMNMCxyq44IVrjXS5XKbH0puEd7YLECBRYBeGfQvWvuuifkpfjjenMpeYkc
	pI9bKFlP4HhqFb7KMnlXh/vUfeaHsRQbCi0phzKuC4MOBeQZabzKdjPhuV+6B6eJDKOKpxdltUs
	rYz3zQMw37yhx0Rbkz8g/KqPutR/smpakLJJHmgBnWtNosbE+aw8wJZEsysOxPtDP/NjaIl+ePO
	YpTovc7Xi9kXTE5AMlk0ZB2mn2TBDqEbxughqorOFwkyRgAEznPokSnEXtn87QFFpdfa6pWMThd
	KlNYDUfz9eXeCLF6ytNPgkKclBaVnV2JX31QBiZe/1hII+0bonrRyW+7mkGp4dIIijbXX1yynWS
	D7T0Y3vG03fjSg==
X-Received: by 2002:a17:90b:4a82:b0:3a0:cb48:df6b with SMTP id 98e67ed59e1d1-3a0cb48e2fcmr9490197a91.34.1790662340222;
        Mon, 28 Sep 2026 23:12:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/10] ASoC: mediatek: mt8196: propagate main clock errors
Date: Tue, 29 Sep 2026 13:11:16 +0700
Message-ID: <20260929061121.124001-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from the main clock enable and disable operations
instead of always returning success.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 6198711e01b5..dbfd02d20338 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -598,14 +598,12 @@ int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
 
 int mt8196_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
-	return 0;
+	return mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
 }
 
 int mt8196_afe_disable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
-	return 0;
+	return mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
 }
 
 int mt8196_init_clock(struct mtk_base_afe *afe)
-- 
2.43.0


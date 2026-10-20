Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474083;
	b=KGNIwUqiE0UBKiMtsuS8atgA4Iey0uAzYuWOZn1amO+8dC+56F6+Jzlmewy02zcPWuZ2
	 NdVksJMjIM0oSoEpsIXTve7cUIiY+6N40sViON/vtu1aKTU7ruJ/3cvaf5W7jhyWnbbMA
	 zd3K0wxtYKNeZ3NG3hDApn/YB6ZIJSOps+ap2Lawf/nvwuxUcWuXq/4wXt65NeZDcp/nc
	 9QfTDyTWdPLI0KXnmNUinmYlZCetN/oJhDGazQAmbQwIAoul67U3svg6HqqAXK+H8y5yT
	 Mz/EXtfhlbN6fPNDpeRLb6Kbt3HGWUh6cc08aTvVD5297jemE43r8X15IymoGL3mn4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5l6pqreEYh+0Dsa58mvKfgN8V+MvlUn6xbXr6Z0vjIA=;
	b=LXAfkBpk/8ThOdaKetmhAcu7cIXJypNMj0QTXAS9+oiql+uSSwuHGARQFwIQPUpBs+Kd
	 oU34F164F/l6V8GzUpXp5RhGOyoVWu2jlu7Q3QTk1timD7LV7aCSnjCGid1eNp8MOxJEJ
	 30sqqbl6Ieh7uNSGnLtIcO6goA/G1IQ8jo7PBn2QJZI0KnU9lqcFK8MSOb/GBl97eav+1
	 ihtIuwcnAmNbPenRXVV/B6V2/65W6DMR/I+2cqzTYHNYv76QK2EBeEl2bjePWsMZoFBwp
	 JkBhBZGiARIhMBDQx3yo/AlOWMeP+eIoa2nVmxMNTcsvmAZBrCWsJWvRgssNTO6r5cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JHwqfbax;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E1D606A319
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 05:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E1D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JHwqfbax
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e946155442so22922135ad.3
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 22:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474082; x=1793078882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5l6pqreEYh+0Dsa58mvKfgN8V+MvlUn6xbXr6Z0vjIA=;
        b=JHwqfbaxu2ccEqPpT+7EvX9ZfM9XYPHx/j3hT+0CsFN9SLD30ImeTVGAwOMdeSysP0
         16CI2twIxghmDqjFQgOIV1tK7BY4LnqfS56/jADr8IOredmKG88y/+BbJvBZQt816DLY
         Rxx7MA/LQeFYK5zUheARkwiayA8YmOadXS3BgVl+MnDuNur8FNbABWCD9uABpVnwSyIx
         8Leyb9sCIsY6FNZ380HzvhZ5xRY8z65ETCG1rRdZyZhKUspGxWMYsQjh5aFPmi4I1SFJ
         b4tbNp2wGJZIpYpACPejUI70bvJux8hGFW9+HQWqUyyBCMs67c6PEL9QQyflTqWmuMA0
         w00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474082; x=1793078882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5l6pqreEYh+0Dsa58mvKfgN8V+MvlUn6xbXr6Z0vjIA=;
        b=SQOQZqsu8+KUWDWwYTkl8g0sRzdrQY4xKE5CRJ5OKRwlvnYZatK8d/dOmdfF8ljx0t
         sUZDpbpHj04fX94udU9g0il/LFpIZhsLThRurRIjUUNdk+BcpuvxCHnoFe80uSZ402gL
         PPqsTnzg2YV1hKGSu8b45oVd5Ixttbo+eEFkWCMqlQQgjUpW/L9dKdjd4KEHHwiRloz0
         KBur5ZpRyRndYt8PocrGjq3SetngBpPwl7CApY8DtFiJmERjgHkmNc05GjwWPk6kDKEf
         FbiS+9NLHrRq6byhmLsahFUSa8j7NJwwSJUp2UT9Zw5rOV/c3olwSzbvtg6Gfn+qWSSI
         Rkgw==
X-Forwarded-Encrypted: i=1; AKwUvBxjD5jMT60RKLx2sN6NbfIgkosWsyp2iXGnaH0zjSesLQPfrl51FsgJk1mXv6/KoOxzIZro6BVFN8M3hA==@vger.kernel.org
X-Gm-Message-State: AFq9FYITf5qdK3S5aIpUX/feqUSujQ1wqoJ9O4LqAF7eVxtQeqZLOASM
	OuCCzXx0UNJZWXvttTtQuXewxonzWXLE+v4ZLWR2a5ZZt1GmKNtX60Ko
X-Gm-Gg: AYBFou2d3Ai0uXx3ezC/E9TkReRhlBSOI15E4g0VhTjGeqGeJ8r6EiRpoPalOB44eK3
	rjqJWrW+wkDXooogoH6l40xuWAkCHPRy8GLadDzbezYgXBkTqYeZ4KAZede0lIGY1jiT4LD8EjQ
	RnhO65U8T5nMYtUCfRpycdiK1l38FaajAvnht+/pmnY7ZGaIFfCb4FJjF3e1V1i7mYZIA5wDgF9
	mzOZ0LFU4wR3eS96H4QmhIzr3KgWPpNugOSHGxEG1rwTX9KIvPDpPJ/CXDCYa63BAMapN34tCLd
	JZqj0opSTzcPW1Luu2rNsnf6XjdVACUMysITCjAWLE87ENE2TvEgOp1jlHsnMSu4epLb2fMT9FL
	DmitBsF6tX8BlYKG8B7tb9pRKVtxF5F1blS6oaWbyvHtBan3gypx4ZVQ5v8BbbvHu2URqpRRCo/
	gW1ecJj+BI8YnkhUHRwunewso+jpkxnds23gLl0CF4h6FFealu7Xh72gxn8wxFQL1/JBlIM6ywb
	tBGMv2I+9WgRV4EvhsGh+xUbAEyA0WAUCXCVJBDuEBIGSA0IOUhR34HbdAhR6NKGLRIhgCNLiWT
	CrbWmSP8UlBsHg==
X-Received: by 2002:a17:903:fab:b0:2e9:5507:b532 with SMTP id d9443c01a7336-2e9a6f587c4mr80082375ad.43.1792474082176;
        Mon, 19 Oct 2026 22:28:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1fd8a55asm3333995ad.29.2026.10.19.22.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:28:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8196: Ensure the DAI is marked as started on success
Date: Tue, 20 Oct 2026 12:27:47 +0700
Message-ID: <20261020052747.568770-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8196_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Propagate constraint errors and return 0 explicitly on success.

Fixes: 57513aabfe5b ("ASoC: mediatek: mt8196: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index fbeba01b086c..f69ea22cfabb 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -161,8 +161,10 @@ static int mt8196_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
-		dev_warn(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+	if (ret < 0) {
+		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -173,10 +175,16 @@ static int mt8196_fe_startup(struct snd_pcm_substream *substream,
 			memif->irq_usage = irq_id;
 		} else {
 			dev_err(afe->dev, "no more asys irq\n");
-			ret = -EBUSY;
+			return -EBUSY;
 		}
 	}
-	return ret;
+
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .shutdown() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static void mt8196_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


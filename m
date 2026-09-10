Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61732492E43
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045135; cv=none; b=TtSJc+dYlbbxvuAZiIw73x1fB8/83ZmfX9q2vhSjiFOh7xA18v2EHvdKao4IZFmgcrmlYkHcw7dM0n9fAderCZz+C90WNvLxYltttPF/8qxkC3tzNNBaw8Lb7ETjZpdEbJkGo7kRa1+3Q7oie4vIKyl8JF9K+Qj2OJbQzmg8UkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045135; c=relaxed/simple;
	bh=1dO6s+nzXLmizG7uTVM++KB2+NBkZYoja2P36FVZ+3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ReMa9IsyfTBMsakaAT8gORsLoa2+sbeBTS3Qe6xbzGNzOkcro0byaE4DHaFrUNCX00z+o5S1sfSvuFtF8SbSo5e5LB4aks38SQ2jbPE+qf9MhKiHIgf+vFZmZN/wUxa1c5zA9j2gM/Qlq0Sj0QHApRCCf0ZHvhFPBNvRZNHXfSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmTQlJl7; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmTQlJl7"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398e9698a70so6554934a91.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 05:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045131; x=1789649931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Iq4XFZgztZ/SSg/JPxbN63E3iQJmYKZr/24Kl0mWDQ=;
        b=OmTQlJl71DndygFybkTVyLn72bpPxKFhrocG7ObEYqCG+6OSiBYAqgZnRyYLCULVdC
         tKbkp1TPz2oEVZV/RguuLSOcbeY/4sqE8k3NkP9aAE8256P6Pidyq8f63v8Hl2EqP2in
         u3ea4YJFSlvsa5QwzPtt4yU284iBcnrLoNQtWqkc51U8ar2GIHsV3mCvqJnP+e8Dv1Mg
         8Tsm5TNsbp8BdlITCBOmw6vvDQ0Wijc7L3HhN704vVvMeNVxCYZxLjuWSGA0yNuPmHzS
         Ca29JScanFjqmHuYv6Ck2MXp58sPv+LcKk86td5Lhi/W/11Weh3psMrbjSEek6uTfeH4
         LtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045131; x=1789649931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Iq4XFZgztZ/SSg/JPxbN63E3iQJmYKZr/24Kl0mWDQ=;
        b=YJiKDJCM6ycz5Y6VbzIK3i1NjvjzuBeBZYcspfk/kr+1rvDpiWdxrfBOfRdQgaI1no
         7qBbbHFv/2a4zseqMwsfnzZts1BUL5s17paVUuobgNtH9AMFJY1FgNdHdU6SGFD530Q/
         S5L4k555cHtkYknvbz5jj3WQfgjY7DVVL56o3Q46DYGEVs32xaDKsK6pPActl4LhWJxd
         O30tZiB/cWpy7tv5oa67xHczp9PJhltktLAI98JjrhLjkiXu+7iMKC5DkvESeD/t1oCj
         q0CE/b7WgXH6a5ftVVa+URhBCFcRbw5WpWu3xwo/S8h2+TwIebibrsKpLCxTm2VmZfPS
         PRTg==
X-Forwarded-Encrypted: i=1; AKwUvByFVUBrBbckEC1YG//VjmOtihWHm+E9xSmj+sWYJZXgrL2D38sI6fW9ojbOwLUZNxlyeFd4mK6hnC02RA==@vger.kernel.org
X-Gm-Message-State: AFuF++n2qwMPBIkJ/CR/0N2POljb76aerIcGpVNavzOutRH/Qhs4ovmj
	GRCnGz+AXaaB6pVDwufK4MSIDDcJf2XfhRKgRIqVF0ckTaQrLO+fqtHL
X-Gm-Gg: AYBFou2/0MSE+icQ+Lo8y+ByAa2tExbnzsmHV4TDCyL/4MMiPuJWauy1R+oMfX9KA7k
	fELtPljm0bPwWLSJG6YfMrTRQPyd4qvWqr8YmZuyC0NfDBRJ6RQQMheZ3hg4Cnfxyf5bfsFmCiH
	yJAa+WlskeOnKNbEEDOxsCORos2g4vyEOUFpJP+xnwPjSt/nlDwAVPzNj4Rsj8gyEw0U1t71cLJ
	VF/Lflxfs0Ufisp9+Y3T85CLnrBlkp/iKtUun0cUaERrkRtqVjrAKk4rPhk0dANtmCIWwrOs1Kk
	URjVCl2aTkem7X7hEw1Sal8c2BjIhImwnkkdjOE6EYnqtq8CsdHW1TVgfxxQRabXB6aaRGd6i+r
	2+4DglOKDaSyg+ZKYsqjiL3ocsPCTV/vLEWXm40ONuqPLN3Hmsrr8uDYgumEMjqiYS19SJp1mgE
	GSXCRGrMci9+Jn66PMt3ynobf12DttB4LMjWzN496IDJ8xIWs0/27vVpVT4oewzkePenWNeBOIP
	z5ej0lIr5AqCFE+f6TgQbxAv9wqtp6RiMoDJ/SHccO2Jboo2jY71IpvrSHg6zWR83Y9hw1zzYSP
	23snMPiDHV1Yn1E=
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr60419743a91.25.1789045130914;
        Thu, 10 Sep 2026 05:58:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:50 -0700 (PDT)
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
Subject: [PATCH 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
Date: Thu, 10 Sep 2026 19:57:40 +0700
Message-ID: <20260910125742.150902-12-phucduc.bui@gmail.com>
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

mtk_dai_i2s_set_sysclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the I2S clock.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index f20dbb410223..ca7d786cdeff 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -1286,6 +1286,9 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
 	    dir != SND_SOC_CLOCK_OUT)
 		return -EINVAL;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	i2s_priv = afe_priv->dai_priv[dai->id];
 	if (!i2s_priv)
 		return -EINVAL;
-- 
2.43.0


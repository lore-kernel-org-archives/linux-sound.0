Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866E139ACC
	for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 16:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731344138; cv=none; b=cfP7MCT89sXj35m0ACNRv8Ad0AVje8567oHvHXhmHb2ZOGOf8V7hgF11QcwLypIUm8yyht49HjCU8cO4TRU+0EDr/aZIYAuKP6lTrUDwK+5kPi9lTqo3adncaggyyMCQN035tkpovBVU/2VAbYIbGWVDTFhp2Ap+jyofwQH2l6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731344138; c=relaxed/simple;
	bh=IRtf7TM9cM2mQDYKQVCzR80Zby1UaFRBMUT9VaINGhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s8txtdnUliLBlNG1DYQk6kBROeuJ8dh98pN4TtqERhefCQ4YF81JICuL8qzqKc1geF06yL+KmjSQXt4KoRy+Rn/L8vvlT0eXawgk8XSxd/5te2sqJQzQ1RZH2Wmq/H1FW5va8Enknc3BCeuJl/6/u0t5tE8iK3EES8/PH43ekhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=G/qEc3Oo; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="G/qEc3Oo"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A0E378918D;
	Mon, 11 Nov 2024 17:55:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731344134;
	bh=Z56BKkaBArWo0sNLvWX4qBf355563BZvN6A6HqoSkJ0=;
	h=From:To:Cc:Subject:Date:From;
	b=G/qEc3OohGKSrOtnz5NYOXF97W0aKAIk1Il71AesAipk4rG2bQJHl1/9FIbcQ6QSZ
	 +EhYP8vr2rJLUbwblxknvgnckx/m2MyOqN2zMAEhCPkkqUQ9ctiT7kM23SppeJLtX3
	 9AFwtzTXcNFXn6+/096UbIfx3sewIAtv19du3FD1uAKmJZav2tquBdJimo44hiVAa+
	 yAIIilqD4JkkeUpE3HMMLQIccOvUTKPdkh++l34p6RSBaqvWJUpftVS7zMIw9unjto
	 RQhmScZ4goZ2hPIAjzYhfzuCuv0OYEJUT2tzUnl68dD7kbVv8nKiOkA43159KXCGbO
	 671wxBbA5qkBg==
From: Marek Vasut <marex@denx.de>
To: linux-sound@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Chen Ni <nichen@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: max98088: Add headphone mixer switch
Date: Mon, 11 Nov 2024 17:55:04 +0100
Message-ID: <20241111165523.113142-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Add enable/disable headphone output mixers knob.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Chen Ni <nichen@iscas.ac.cn>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
---
 sound/soc/codecs/max98088.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index d679bd9175ebd..8915f52506953 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -489,6 +489,9 @@ static const struct snd_kcontrol_new max98088_snd_controls[] = {
        SOC_SINGLE("ADCL Boost Volume", M98088_REG_33_LVL_ADC_L, 4, 3, 0),
        SOC_SINGLE("ADCR Boost Volume", M98088_REG_34_LVL_ADC_R, 4, 3, 0),
 
+       SOC_SINGLE("Left HP Output Mixer Switch", M98088_REG_27_MIX_HP_CNTL, 4, 1, 0),
+       SOC_SINGLE("Right HP Output Mixer Switch", M98088_REG_27_MIX_HP_CNTL, 5, 1, 0),
+
        SOC_SINGLE("EQ1 Switch", M98088_REG_49_CFG_LEVEL, 0, 1, 0),
        SOC_SINGLE("EQ2 Switch", M98088_REG_49_CFG_LEVEL, 1, 1, 0),
 
-- 
2.45.2


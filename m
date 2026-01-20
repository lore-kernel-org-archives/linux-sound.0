Received: from mx4.sberdevices.ru (mx4.sberdevices.ru [152.89.196.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040843176EF;
	Tue, 20 Jan 2026 16:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.89.196.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925857; cv=none; b=Nf/fXIY25wDlQbLfxXVYzJdg4KRHWpPhdhUnIulcE0yLWtGv0hDxVvCdY/1TT8mpCekIZlRzCZMMejGqtmY3rMujIk5XRAFEUI3Xh1OJxT27GlEWNfltvV9hlFPhB/0eG+xwFGhXrXzUvbIhdu73fEbfEln0sd3zsZY07AtUH5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925857; c=relaxed/simple;
	bh=0Hv+/41GFrk04fqIG1hy3af0uWu4OS8aOdaMk1GqdRE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mbvEYdMiVoJTb+5p8acpt2mcwb8xKyJ2FC2iJh8KuHQVJwcc8DKWQIK/mga0WT4tEbZQpz9s+YicMFYyMwiT3Vq0Lth1GbCp6wLKePpw7ZXFgNKbQJoMpApud8kv3kZgTyvmpZLXsKYIKqQOzpPFfuurqQomc9xpdhlOF66KUFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=sberdevices.ru; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=bT/Z1k6F; arc=none smtp.client-ip=152.89.196.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sberdevices.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="bT/Z1k6F"
Received: from p-antispam-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx4.sberdevices.ru (Postfix) with ESMTP id A7C924001D;
	Tue, 20 Jan 2026 19:12:15 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx4.sberdevices.ru A7C924001D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1768925535;
	bh=r8v4fLs/YROYemKSLFoCB5HT4YYbm9ood32ahQJ47iU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=bT/Z1k6FAs+e0EqnDU3vkhbutMSpPzqcHCmdilEWw4fU4OrgjtJ9HI1aygFm2yh6r
	 wR+tGWwrtIMONrP7k/6ju7fB1l8TA8T2DXKmJ2BM1AIlMBx2nsD8zDsoX1ufb/Chpm
	 3czFt9NzRQEuQWnf4ECYByQD7iFQCP2nGMy7YhqG0UJlsCVTID3EmuHX7KNYZVF95f
	 t3wsWO4WODf5L4claL2Qa1m0Rbf3JoLtt+9tY3vm4F4fYR4TCUSkn38+uG1I0q0SBz
	 dLm4Biv2HTNboXY15CLrr2cT1HT93qNE4CCCoPNiUpVUXV4LZImF3q6UJ/MtIzAAHi
	 Z4nBQ+wFaThIA==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (verified OK))
	by mx4.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 20 Jan 2026 19:12:15 +0300 (MSK)
From: Ilias Izmaylov <ikizmaylov@salutedevices.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Igor Prusov
	<ivprusov@salutedevices.com>, Chen Ni <nichen@iscas.ac.cn>
CC: <kernel@salutedevices.com>, Ilias Izmaylov <ikizmaylov@salutedevices.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rulkc@linuxtesting.org>
Subject: [PATCH v1 2/2] ASoC: codecs: ntp8835: fix snd_soc_component_update_bits handling
Date: Tue, 20 Jan 2026 19:11:58 +0300
Message-ID: <20260120161200.3590305-3-ikizmaylov@salutedevices.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260120161200.3590305-1-ikizmaylov@salutedevices.com>
References: <20260120161200.3590305-1-ikizmaylov@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-exch-cas-a-m2.sberdevices.ru (172.24.201.210) To
 p-exch-cas-s-m1.sberdevices.ru (172.16.210.2)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: ikizmaylov@sberdevices.ru
X-KSMG-AntiSpam-Info: LuaCore: 86 0.3.86 47cb2a3d3f5c7e795bff2d0998e8c196722872ab, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, FromAlignment: n
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 199675 [Jan 20 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.20
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/01/20 15:01:00 #28134254
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5

Add less-than-0 snd_soc_component_update_bits checks to determine
whether it resulted in error or not, since if it returns a positive
number it doesn't mean that there was a failure - only a negative
result indicates an error

Fixes: dc9004ea273a9 ("ASoC: codecs: Add NeoFidelity NTP8835 codec")
Signed-off-by: Ilias Izmaylov <ikizmaylov@salutedevices.com>
---
 sound/soc/codecs/ntp8835.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/ntp8835.c b/sound/soc/codecs/ntp8835.c
index 45f99c9d20c77..75426262e9bae 100644
--- a/sound/soc/codecs/ntp8835.c
+++ b/sound/soc/codecs/ntp8835.c
@@ -274,7 +274,7 @@ static int ntp8835_hw_params(struct snd_pcm_substream *substream,
 
 	ret = snd_soc_component_update_bits(component, NTP8835_MCLK_FREQ_CTRL,
 					    NTP8835_MCLK_FREQ_MCF, mcf);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	switch (ntp8835->format) {
@@ -317,8 +317,10 @@ static int ntp8835_hw_params(struct snd_pcm_substream *substream,
 	gsa_fmt_mask = NTP8835_GSA_BS_MASK |
 		       NTP8835_GSA_RIGHT_J |
 		       NTP8835_GSA_LSB;
-	return snd_soc_component_update_bits(component, NTP8835_GSA_FMT,
-					     gsa_fmt_mask, gsa_fmt);
+	ret = snd_soc_component_update_bits(component, NTP8835_GSA_FMT,
+					    gsa_fmt_mask, gsa_fmt);
+
+	return ret < 0 ? ret : 0;
 }
 
 static int ntp8835_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
@@ -343,8 +345,13 @@ static int ntp8835_mute(struct snd_soc_dai *dai, int mute, int stream)
 	unsigned int mute_mask = NTP8835_SOFT_MUTE_SM1 |
 				 NTP8835_SOFT_MUTE_SM2 |
 				 NTP8835_SOFT_MUTE_SM3;
-	return snd_soc_component_update_bits(dai->component, NTP8835_SOFT_MUTE,
-					     mute_mask, mute ? mute_mask : 0);
+
+	int ret =  snd_soc_component_update_bits(dai->component,
+						 NTP8835_SOFT_MUTE,
+						 mute_mask,
+						 mute ? mute_mask : 0);
+
+	return ret < 0 ? ret : 0;
 }
 
 static const struct snd_soc_dai_ops ntp8835_dai_ops = {
-- 
2.47.3


Received: from mx4.sberdevices.ru (mx4.sberdevices.ru [152.89.196.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE03C395259;
	Tue, 20 Jan 2026 16:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.89.196.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926156; cv=none; b=CTR/kHwCImA9UvZBde++uxI6+fmRSoDcBZGhT4I5Y2gnFNTZPpY+nBPLNjwdN9kz+P/YVU85aOzoUL4QsyiKInfsV5iBGmfmKXmZpL4PaYECD1PQ/zzkDy5HaOdRuUDJ9eo+LlL/JXOO1uzkfVc7R3N12oA8hE2/ZSa7fS0u+nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926156; c=relaxed/simple;
	bh=N+W3R2m5FkPLOivX+D3hU0tBXvWzhzxYlWXsMlV5EuU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XY3tVm2PYVnJkArbi4QpNtBPqrfPjsb0MV7Hhx6wIcOwMKc8jSotIm50bnESMQePlh5yLfOBcOWkbOsPOvl/RNbyvNzFhj98nP1PbdplE9/QpRzVg2rWRM7qzGw34v5xHoNJe+LZddO4Mh/3VJkk/giwROP3XFm5cy9HyNiFABA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=sberdevices.ru; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=dWvuYZY2; arc=none smtp.client-ip=152.89.196.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sberdevices.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="dWvuYZY2"
Received: from p-antispam-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx4.sberdevices.ru (Postfix) with ESMTP id 5A5434001C;
	Tue, 20 Jan 2026 19:12:15 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx4.sberdevices.ru 5A5434001C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1768925535;
	bh=C02qOYz63JTTyUs8uEFEgrGyqoRyXvaW6QLveUscVM4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=dWvuYZY21Jj/W3+HoJ+5vmQEMt3RbcpUaOVK8LqbBUj3MwIFEXHBuOehyKADl2iug
	 B1Q3dndej/fUrYN11zQRVS3Z5YzsSyWPvzkUTVdBk4+Hi6ijWUoMniDhcqvUa2NzPR
	 N1n5nVYyqXv9gTfygcxAGZwAtEUiWCcxyEojGEckpTX7MIJOjCldgvLXK+uMrykr4z
	 jlljenUMFO5Xh6ozIABxsfuFSV3W4V1dQIIZ7Jb+JVUDA3uCGMzHmuGAfBRShC33Js
	 o6OVRZvGrfI1D2WaqwnBa9Bs6eM3Tk5AC92/1Tm88ug9+9Q0W1Xf0myw4oDRBVnIE0
	 FoeLC5UfjR7zw==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (verified OK))
	by mx4.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 20 Jan 2026 19:12:14 +0300 (MSK)
From: Ilias Izmaylov <ikizmaylov@salutedevices.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Igor Prusov
	<ivprusov@salutedevices.com>, Chen Ni <nichen@iscas.ac.cn>
CC: <kernel@salutedevices.com>, Ilias Izmaylov <ikizmaylov@salutedevices.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rulkc@linuxtesting.org>
Subject: [PATCH v1 1/2] ASoC: codecs: ntp8918: fix snd_soc_component_update_bits handling
Date: Tue, 20 Jan 2026 19:11:57 +0300
Message-ID: <20260120161200.3590305-2-ikizmaylov@salutedevices.com>
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

Fixes: 2bd61fff3e93b ("ASoC: codecs: Add NeoFidelity NTP8918 codec")
Signed-off-by: Ilias Izmaylov <ikizmaylov@salutedevices.com>
---
 sound/soc/codecs/ntp8918.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/ntp8918.c b/sound/soc/codecs/ntp8918.c
index 5593d48ef696f..cc672fd93def4 100644
--- a/sound/soc/codecs/ntp8918.c
+++ b/sound/soc/codecs/ntp8918.c
@@ -233,7 +233,7 @@ static int ntp8918_hw_params(struct snd_pcm_substream *substream,
 
 	ret = snd_soc_component_update_bits(component, NTP8918_MCLK_FREQ_CTRL,
 					     NTP8918_MCLK_FREQ_MCF, mcf);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	switch (ntp8918->format) {
@@ -276,8 +276,11 @@ static int ntp8918_hw_params(struct snd_pcm_substream *substream,
 	gsa_fmt_mask = NTP8918_GSA_BS_MASK |
 		       NTP8918_GSA_RIGHT_J |
 		       NTP8918_GSA_LSB;
-	return snd_soc_component_update_bits(component, NTP8918_GSA_FMT,
-					     gsa_fmt_mask, gsa_fmt);
+
+	ret = snd_soc_component_update_bits(component, NTP8918_GSA_FMT,
+					    gsa_fmt_mask, gsa_fmt);
+
+	return ret < 0 ? ret : 0;
 }
 
 static int ntp8918_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
@@ -302,8 +305,12 @@ static int ntp8918_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	unsigned int mute_mask = NTP8918_SOFT_MUTE_SM1 |
 				 NTP8918_SOFT_MUTE_SM2;
 
-	return snd_soc_component_update_bits(dai->component, NTP8918_SOFT_MUTE,
-					     mute_mask, mute ? mute_mask : 0);
+	int ret = snd_soc_component_update_bits(dai->component,
+						NTP8918_SOFT_MUTE,
+						mute_mask,
+						mute ? mute_mask : 0);
+
+	return ret < 0 ? ret : 0;
 }
 
 static const struct snd_soc_dai_ops ntp8918_dai_ops = {
-- 
2.47.3


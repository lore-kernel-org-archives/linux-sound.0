Received: from mx4.sberdevices.ru (mx4.sberdevices.ru [152.89.196.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EAB1BC2A;
	Wed, 18 Feb 2026 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.89.196.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771418767; cv=none; b=e+aa/7/+k0vxZJTw6LfYM1Io1/HcmQ7e9DbVaRIUbNvEQzDCBVey1ux5oavraImWoilgwKllWmAPRURxHJ88Andj6y5WUWa5BGxCoCrJtCfrLpeT9gk4YJZKVgLVBurBmmgYO0NcQzcDx6PBfCG42t3E1OnL6j1a5bTXejciS/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771418767; c=relaxed/simple;
	bh=suOZpDuKPCWlTUQ/Kgwt1ydbZDonJ04l8HXqcwbK7bY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r4LXQdmc/9sq3QKWttk/xhGORir9ejbksab3VCATsSdNlgg1u7v0UGFv6s8JYEz4ovR/EBB1cUZwxjtCMjG/7PiJo+jAn1EwF83EAV3xA3I6pzQmm7IfiM6NMRKLNG/CSsyNCb995IEi1LiIsz/JCQcnpEENYKsrKLQZ3A6Z7Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=sberdevices.ru; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=H1us6Ud4; arc=none smtp.client-ip=152.89.196.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sberdevices.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="H1us6Ud4"
Received: from p-antispam-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx4.sberdevices.ru (Postfix) with ESMTP id 245C740013;
	Wed, 18 Feb 2026 15:45:55 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx4.sberdevices.ru 245C740013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1771418755;
	bh=TGWPEvMDGECzAf3GhrrNrTRj9RtNlJ5GQdgZgkXNT40=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=H1us6Ud4S94ION5e5KG1mL/gII6I9+31yFB3UeK+w+l3mtZWr6ZFVSr+40YIdYQGO
	 y7sdernvD2Ph7rXwvwMoSlCZzBq0ij8YLylWeYhzvn/LUmf3XYosVmH7x1axJBvr0v
	 eyOtj292ZPzoMqYrDeim1CqWIk5OetVNTTlqSH+Xn30+wmH78UY1WUDgbYuKBX89dr
	 BPYwfQ7KvWvXovDNxRHPxiNimo2JJF6oYplIE3vq3I2s5o6U9tWiMeXa1LIErEw9Ou
	 r4xdSZgQNhwJZa00cZBzLD+6eebjmMHj29H5aeSe9WLW4s5YinS69/laqcknsUURuM
	 4avGVCJT/FMMg==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (verified OK))
	by mx4.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 18 Feb 2026 15:45:52 +0300 (MSK)
From: Ilias Izmaylov <ikizmaylov@salutedevices.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen Ni
	<nichen@iscas.ac.cn>
CC: <kernel@salutedevices.com>, Ilias Izmaylov <iliasizmaylov@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <rulkc@linuxtesting.org>, Ilias Izmaylov
	<ikizmaylov@salutedevices.com>
Subject: [PATCH v1] ASoC: codecs: ntp8918: calculate bclk using tdm params
Date: Wed, 18 Feb 2026 15:45:39 +0300
Message-ID: <20260218124541.2070245-1-ikizmaylov@salutedevices.com>
X-Mailer: git-send-email 2.48.1
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
X-KSMG-AntiSpam-Info: LuaCore: 87 0.3.87 7430d8ffafccd8879e1d8370e5b501352446c2ba, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, FromAlignment: n
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 200628 [Feb 18 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.20
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/02/18 10:23:00 #28200586
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5

Use a function snd_soc_tdm_params_to_bclk instead of snd_soc_params_to_bclk
to calculate bclk frequency correctly using frame size, channel period
and a number of channels

Since in NTP8918 the word clock and bit clock frequencies are both 64
bits per period and given that the device has only 2 channels it means
that the period per channel is equal to 32 bits. Thus to calculate bit
clock frequency the only other non-constant value that we need is frame
size (or sample rate)

Also implemented a set_tdm_slot dai ops callback for ntp8918 codec that will
ensure that tdm slot width and slot num are set to 32 and 2
respectively because ntp8918 can only operate in that configuration

Signed-off-by: Ilias Izmaylov <ikizmaylov@salutedevices.com>
---
 sound/soc/codecs/ntp8918.c | 43 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ntp8918.c b/sound/soc/codecs/ntp8918.c
index cc672fd93def4..c37bd5b53ed8a 100644
--- a/sound/soc/codecs/ntp8918.c
+++ b/sound/soc/codecs/ntp8918.c
@@ -32,6 +32,15 @@
 			     SNDRV_PCM_FMTBIT_S24_LE | \
 			     SNDRV_PCM_FMTBIT_S32_LE)
 
+/*
+ * The NTP8918 word clock (WCK) period is fixed at 64 bits,
+ * and the bit clock (BCK) period is equal to the word clock period.
+ * The interface has only 2 channels, meaning the number of ticks
+ * for both word and bit clocks per channel is 64 / 2 = 32.
+ */
+#define NTP8918_BCK_CHANNEL_PERIOD		32
+#define NTP8918_NR_CHANNELS			2
+
 #define NTP8918_INPUT_FMT			0x0
 #define  NTP8918_INPUT_FMT_MASTER_MODE		BIT(0)
 #define  NTP8918_INPUT_FMT_GSA_MODE		BIT(1)
@@ -215,7 +224,17 @@ static int ntp8918_hw_params(struct snd_pcm_substream *substream,
 	int bclk;
 	int ret;
 
-	bclk = snd_soc_params_to_bclk(params);
+	/*
+	 * When calculating bit clock frequency the only non-constant
+	 * input that's needed is sample rate which then needs to be
+	 * multiplied by constant values of BCK channel period and
+	 * number of channels.
+	 */
+	bclk = snd_soc_tdm_params_to_bclk(params,
+					  NTP8918_BCK_CHANNEL_PERIOD,
+					  NTP8918_NR_CHANNELS,
+					  0);
+
 	switch (bclk) {
 	case 3072000:
 	case 2822400:
@@ -313,10 +332,32 @@ static int ntp8918_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	return ret < 0 ? ret : 0;
 }
 
+static int ntp8918_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+				unsigned int rx_mask, int slots,
+				int slot_width)
+{
+	if (slots != NTP8918_NR_CHANNELS) {
+		dev_err(dai->component->dev,
+			"Unsupported number of TDM slots %d, should be %d\n",
+			slots, NTP8918_NR_CHANNELS);
+		return -EINVAL;
+	}
+
+	if (slot_width != NTP8918_BCK_CHANNEL_PERIOD) {
+		dev_err(dai->component->dev,
+			"Unsupported TDM slot width %d, should be %d\n",
+			slot_width, NTP8918_BCK_CHANNEL_PERIOD);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops ntp8918_dai_ops = {
 	.hw_params = ntp8918_hw_params,
 	.set_fmt = ntp8918_set_fmt,
 	.mute_stream = ntp8918_digital_mute,
+	.set_tdm_slot = ntp8918_set_tdm_slot,
 };
 
 static struct snd_soc_dai_driver ntp8918_dai = {
-- 
2.47.3


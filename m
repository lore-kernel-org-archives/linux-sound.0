Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760059;
	b=4g/W2G/F956GwzwiDJY+OpvQXs5fO9N8/kTjX3pRcnFUOZoPkryMxLhzrRbqsdPGYrwb
	 r29EhJqKceLq/RNDyx6BoqImBQRSBEqiY/C0UD/DubYctURwy6dsSmKkU+HIQNjONQKGO
	 WZ9hB108WajX9TrdhQ+hc1xKl2qU2m09Lnb/ozx2F6azleqft258PtdvMppcNmK5S+dyH
	 8hzKzkp4ctLs6BAx80ydihcrGhOrhX/H9O4/rJiaTiPbm/w7TNdKsv/Z4xIRKl4N85lwn
	 P6UZ7imtEIksxRm6K8ePU1arMzoC5JBainRtzTCoDTq0gh9TjolA2iNLtJDG7hlFV2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760059;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=FfLgWic/PTZ5YFFae+6QQhwMy+EW+5TDgbCnt4o7zfQ=;
	b=bmqA+8Ta/AHu1CNDzI7fuLTcWzL+vyCGdp/AuDXZ9uPgk20GPV6DQPX0d5hre5i9x6xa
	 JHZT7vqIdAKUyjlFn4XaV+XDmJ9LCHmhvQ5TLFMM5amrO/BW6qOdtQUqUjXlwMsWDM/Nu
	 GUFsWziG0rieURfINgGNDd9NSGUDbGO71mi9hUug3kemNLSDWBO/8mFc8X0iw+uaKenFr
	 Md5UgYx1wd9YtIsq+RxWI/ZZXn2ti+GhfhuznaUUWtvti05oPs3L2dFHwrA/2h6oLgUtm
	 0fKAdHPpH+WVSD2A/opka+oxnWpxnkiQTAjBVcA1sgP2wv17NCuJRBfKgUP/Zqu9iaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4E3606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A4E3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADnD_otm+pqu7k+AA--.29326S2;
	Wed, 04 Nov 2026 10:40:45 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: SOF: amd: fix leaks when SoundWire probe fails
Date: Wed,  4 Nov 2026 02:40:54 +0000
Message-Id: <20261104024054.1508754-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowADnD_otm+pqu7k+AA--.29326S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW5WrWDWw1UWrWUAF4fZrb_yoW8GrW7pa
	n5Crs0yr9xJr1xA34DWa10ga4FkrWIyrW5C39rKw12gw1rXryIg3W7Jr47WFW8CFW0ya17
	trWYvayrXF1vvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Eb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267
	AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7IU5ENtDUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRQBA2rqY-nVdgABsn

When amd_sof_sdw_probe() fails, amd_sof_acp_probe() only frees the IPC
IRQ and returns, leaving the "dmic-codec" platform device registered by
platform_device_register_data() behind.  The SoundWire context that
sdw_amd_probe() allocated before the startup step failed is leaked as
well.  The probe never succeeds for this device, so neither
amd_sof_acp_remove() nor the devres cleanup releases them.

Jump to the existing free_ipc_irq label instead, which also calls
amd_sof_sdw_exit() and unregisters the DMIC device, as the ACP7.x probe
path already does.

Fixes: d948218424bf ("ASoC: SOF: amd: add code for invoking soundwire manager helper functions")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/sof/amd/acp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 86e2402b8ffd..120dde4ab777 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -1278,8 +1278,7 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 	ret = amd_sof_sdw_probe(sdev);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: SoundWire probe error\n");
-		free_irq(sdev->ipc_irq, sdev);
-		return ret;
+		goto free_ipc_irq;
 	}
 
 skip_soundwire:
-- 
2.34.1


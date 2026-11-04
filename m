Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760049;
	b=WlB9QJ4Ktt0mU1ohlVvcavlo+Vu6MlMMNexyCYZEcSEFhyNqF39mnsqJoNoEIH6PVq6N
	 Uock9G+MOhc0b+WosKFAmgc18fCf2ksK87X2/HcZk9fiMDMab9wQpQyJsu31qhYZSE25O
	 PYbRLLhvc2k8UVNYBOhwdnoMK/bvaaOyhUbOwk2j5ENUpqzBcW3xv21KL/TYkVDPeLy2N
	 qUr73R8nMD3UvROJIHqgisbiiqPRbvzv2qCwGtTc5bwbYhUvZTaRN9tneSiyFqS5YE2FB
	 DxPnpAcLmIY2UUw9qqwiUPbBmV9XAXF0vy3XwG1NwzQfL7vGjFAFNPw7ySULiuWuG4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760049;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=Sa+D+dzprkVI3tIOAtO1m4XfnZeM3jvqoRm5YNJEvJQ=;
	b=x6eokKMTFHe4Sr9EV8tEH05dvhuOK3kjzVKXMJpFC+lCsMkYQDoyVUk03Whn5PG3RUDa
	 dYLAvHo7cNoIlt5hUMyQSuQ+7At2ezug1z2tApT84uEjyHHNSYdYOUbnX83JNJ0/Vqadh
	 OQiLnQ+dS1UORZDomng3JouGwrjMu4xhGSwF+7SOlaz1Rle9f4/6li2+o/sNAQOg3T/e8
	 l07K9DoJ7jnjba/PYRA2bG2LZ0bEhd2F0dRd66WzsPCfFdWHo3AM0bRbcsIp/W/Gvp4Wc
	 yskWjZct5CkSFcGgBKNGf++LWpMm/DYwI9hiQFlxxR1gGf2LDUOqhz7o/TM8jtPLWag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A814606A333
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A814606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABHcfskm+pqHrk+AA--.42584S2;
	Wed, 04 Nov 2026 10:40:36 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: Intel: sof_cirrus_common: release the physical device reference
Date: Wed,  4 Nov 2026 02:40:45 +0000
Message-Id: <20261104024045.1508525-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowABHcfskm+pqHrk+AA--.42584S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFW8tFWrXF45Ar1DAFW8JFb_yoW8urWrpF
	s3Wa98Wr98Xr1rua4UAr15uF17ury7CF4fGr1vka95Cr1fWry8ZF9Fqw10vF15GrWvqF1D
	AFW5Zr1rXwn0yrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBjb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267
	AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07befHbUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAABA2rqY+TXGwAAsF

cs35l41_compute_codec_conf() looks up the physical device of each ACPI
CS35L41 node with acpi_bus_get_primary_device(), which takes a reference
on the returned device, but the reference is never dropped because only
the device name is kept in the static codec configuration.

Copy the name into a per-amplifier buffer that lives as long as the
static configuration, and release the reference right after the lookup.
Card setup no longer leaks one device reference per amplifier.

Fixes: 1ca726424a12 ("ASoC: Intel: cirrus-common: Use UID to map correct amp to prefix")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/intel/boards/sof_cirrus_common.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
index c7e77e20a096..12124917b552 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.c
+++ b/sound/soc/intel/boards/sof_cirrus_common.c
@@ -45,6 +45,8 @@ static struct snd_soc_dai_link_component cs35l41_components[CS35L41_MAX_AMPS];
  */
 static struct snd_soc_codec_conf cs35l41_codec_conf[CS35L41_MAX_AMPS];
 
+static char cs35l41_physdev_names[CS35L41_MAX_AMPS][64];
+
 static int cs35l41_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -175,9 +177,11 @@ static int cs35l41_compute_codec_conf(void)
 					uid, cs35l41_name_prefixes[uid]);
 			return 0;
 		}
-		cs35l41_components[sz].name = dev_name(physdev);
+		strscpy(cs35l41_physdev_names[sz], dev_name(physdev));
+		put_device(physdev);
+		cs35l41_components[sz].name = cs35l41_physdev_names[sz];
 		cs35l41_components[sz].dai_name = CS35L41_CODEC_DAI;
-		cs35l41_codec_conf[sz].dlc.name = dev_name(physdev);
+		cs35l41_codec_conf[sz].dlc.name = cs35l41_physdev_names[sz];
 		cs35l41_codec_conf[sz].name_prefix = cs35l41_name_prefixes[uid];
 		sz++;
 	}
-- 
2.34.1


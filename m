Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD80CB640
	for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768641531; cv=none; b=JH5iw/vbwDYuBNk06iijtvhCDA/5nGijdVBhqgZsRJdG5bRxnyMguhjDmVw7gXvS7XzO7MImM09VTjG0hmk0gCMAo5s5/AiqmpsaG+qALjhBtIleLPS71IxqrTXFItQsakY2lKiD9KoB+F0EO5CwZm17nlOL04iv70Z8JlQN86M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768641531; c=relaxed/simple;
	bh=RLxe/Rh0EQbNEZIXH7nwlVKSwS1/GgTn6c5A7VITUH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B0RluYB66AV2fCvhfKi9nVbE58bUHrnVY9BCbMZAM27nudbspTIAnW8OxrgPgwxcAoFyAlbRonEzr7ykDLuQDnMwfuC48zPR/aoccQQiw6Z1bKEkOSGW+H6PZDYlLFo4Ckzso9bF18SNp6zfw9mdxLVZIM1yWE2Uqo0L3LSOMrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8CxqsL1U2tpStQJAA--.31683S3;
	Sat, 17 Jan 2026 17:18:45 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJAx28HzU2tpHh8hAA--.130S2;
	Sat, 17 Jan 2026 17:18:45 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/4] ASoC: codec: es8323: Enable DAPM for ADC and ChipPower
Date: Sat, 17 Jan 2026 17:18:33 +0800
Message-ID: <cover.1768641428.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx28HzU2tpHh8hAA--.130S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGlrJLcBwgAAsQ
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr1kZF1rJrykZw4rXF13Awc_yoW3Zrb_ua
	4jgFWDJr4q9FWfJayjkFn09rW3WF4fCFyYyF1vgasYyFy3trW8Jw17Aw4DZryxXFs7t3Wr
	tF1xAr18JF1xGosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jYSoJUUUUU=

Hi all:

This patchset replaces the original magic numbers with register bit
field macro definitions in an attempt to improve code readability.

In addition, DAPM for capture ADC and chip power has been enabled.

Thanks.
Binbin

Binbin Zhou (4):
  ASoC: codecs: es8323: Replace magic numbers with defined macros
  ASoC: codecs: es8323: remove DAC enablement write from
    es8323_set_bias_level
  ASoC: codecs: es8323: Enable proper DAPM widgets for capture ADC
  ASoC: codecs: es8323: Enable proper DAPM widgets for chip power

 sound/soc/codecs/es8323.c | 294 +++++++++++++++++++++-----------------
 sound/soc/codecs/es8323.h | 105 +++++++++++++-
 2 files changed, 261 insertions(+), 138 deletions(-)


base-commit: d743d62699af627b9de0f0b6853d8a3d53b6518f
-- 
2.47.3


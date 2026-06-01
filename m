Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC04390990
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 09:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306209; cv=none; b=PoiOMSHtExfGANc2IpBXTrEtyv0s/M0dY6L2qf3KKAU6gBcgYvWPh9zxaWisCphIW09Elwkd5WcC7jzyygj/l+KbcC5S+NPR4vmTVuDvL/k9b5NWbp8EV4PzOZkAwAvsNf1vFRn1NthHyFUMzGULuSDT0YcCF4ITZ5gcJUoFv0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306209; c=relaxed/simple;
	bh=F2qwso1fDR/7OMLA99rX+URI4V7lNYaa79S0jJD0Zlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GnfLx8MAGgWH3H+PObW7jIvbekWw98fxD4Zb5g5KBzwUhIgIEhojAd+IonhTuVvgVIQYAYhJyv3iSZYwfJK3r4kS+hI+DOWul5Qy/Cym5tg8caKhZdpseLG9URJq0bpRNG9SP8doEZw4piYGfa5Z0DMhgJzmT22se/Y171qmEkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8Axp3gSUR1qPksPAA--.18143S3;
	Mon, 01 Jun 2026 17:29:54 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJAxXcIJUR1qGOqXAA--.23311S2;
	Mon, 01 Jun 2026 17:29:46 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 0/4] ASoC: loongson: Refactor DMA and regmap handling
Date: Mon,  1 Jun 2026 17:29:35 +0800
Message-ID: <cover.1780304703.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxXcIJUR1qGOqXAA--.23311S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEFCGodH18GIwAAsf
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr4fWF4DCFWkGF43GryUJwc_yoW5JryDpa
	n3C393Wr15trW2yrs3Ja4rJFy5ZryrXr9rWF47J34kWr9xu3W2vw1ftF48ZFW7Cry8XryI
	vry8KFW8uF15uacCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8EoGPUUUUU==

Hi all:

This series refactors the Loongson I2S ASoC drivers, reducing code
duplication and improving DMA differentiation. It also adds an entry
in MAINTAINERS and applies a few fixes to the es8323 codec driver.

Patch 1 adds a MAINTAINERS entry to track the Loongson audio drivers.

Patch 2 consolidates duplicate regmap configurations from the PCI and
platform glue drivers into the shared loongson_i2s.c. It also fixes
volatile register marking and switches from REGCACHE_FLAT to
REGCACHE_MAPLE.

Patch 3 renames internal DMA structures and functions with an "idma"
prefix to clearly distinguish them from external DMA (eDMA) support.

Patch 4 extracts the external DMA logic from the platform driver into
loongson_dma.c, making it reusable and avoiding duplication with the
internal DMA implementation.

These changes have been tested on Loongson-2K0300 (platform, eDMA) and
Loongson-2K2000 (PCI, iDMA) boards.

Thanks.
Binbin

========
V3:
- Drop es8323 patch.
Patch (2/4):
 - Add I2S_CTRL as volatile register.

Link to V2:
https://lore.kernel.org/all/cover.1779796354.git.zhoubinbin@loongson.cn/

V2:
Patch (2/5):
  - Fix volatile register handling, and switch from REGCACHE_FLAT to
    REGCACHE_MAPLE;
Patch (5/5):
  - New patch for ES8323 coedc.

Link to V1:
https://lore.kernel.org/all/cover.1773821115.git.zhoubinbin@loongson.cn/

Change from [1]:
Patch (2/4):
  - Reordered the `write` function to follow the `read` function;
Patch (3/4)/(4/4):
  - Use `idma` (internal dma) and `edma` (external dma) for short.

[1]:
https://lore.kernel.org/all/cover.1773107475.git.zhoubinbin@loongson.cn/

Binbin Zhou (4):
  MAINTAINERS: Add entry for Loongson ASoC driver
  ASoC: loongson: Combined regmap definitions
  ASoC: loongson: Use the `idma` identifier for internal DMA variables
  ASoC: loongson: Separate external shared DMA from the platform
    interface

 MAINTAINERS                            |   9 ++
 sound/soc/loongson/Makefile            |   4 +-
 sound/soc/loongson/loongson_dma.c      | 148 +++++++++++++++++--------
 sound/soc/loongson/loongson_dma.h      |   6 +-
 sound/soc/loongson/loongson_i2s.c      |  56 +++++++++-
 sound/soc/loongson/loongson_i2s.h      |   7 +-
 sound/soc/loongson/loongson_i2s_pci.c  |  59 +---------
 sound/soc/loongson/loongson_i2s_plat.c |  67 +----------
 8 files changed, 182 insertions(+), 174 deletions(-)


base-commit: 9617ce6798f8eee61d8068f0ea03a08ce051932e
-- 
2.52.0


Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0893019DC;
	Wed, 11 Mar 2026 06:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211062; cv=none; b=EwZaqshwdh9DhfBDyqdKsULhLOhiR4fVJ9XOOoqln1EV+BVUQRYX/cDmb2r3AM6qMPIOO+j/rqAczib5JtF3pT7H/jzJ8WqP1otlhEvv+DvxpXpGLuBFUDfuy4KLbywv5+bLuVmIeSECRRG4wA3HzLcTkdE6uxpPHxQ/K0UfZy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211062; c=relaxed/simple;
	bh=4SNQOngjEtcFeQhjM4CmDgqJ5nWhxKl2AcnpSAK2Gx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G1p6PV0G6YhxfOP/o0h1ItVxQAbhToy9/FB+0kyRsZMHQmOVXVEZLayZFFhOk994knNPB68KAx9mRFNf8wa+2i/ai37PTKDqm+/deHzaaDbSbJdgTIE21r64bEOmJ4FI/Lv9WZMdd2AfdOv3P7Mdx7JTGpVZdL2CetQbEuA2I2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8DxPMOqDbFpntIZAA--.10073S3;
	Wed, 11 Mar 2026 14:37:30 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCx_8KoDbFpqclSAA--.26805S2;
	Wed, 11 Mar 2026 14:37:28 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/3] ASoC: Add Loongson-2k0300 I2S controller support
Date: Wed, 11 Mar 2026 14:37:15 +0800
Message-ID: <cover.1773107475.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx_8KoDbFpqclSAA--.26805S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEDCGmvssIbJAABsD
X-Coremail-Antispam: 1Uk129KBj93XoW7CF4xJrWrur1fAF15uw1ruFX_yoW8JFWDpw
	sxC393WrW5Jr4ayrnxJryrGr1rZryrZwsxXa17Jw1UCr9xA3WUuw1UKF4rAFW7Zry8Jryq
	vry8GFW8uasxCabCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jepB-UUUUU=

Hi all:

This patchset adds support for the Loongson-2K0300 I2S controller.
Similar to the Loongson-2K2000, it utilizes internal DMA for data
transfer but interfaces as a platform device.

Also, I cleaned up the redundant code from before.

Thanks.
Binbin

Binbin Zhou (6):
  MAINTAINERS: Add entry for Loongson ASoC driver
  ASoC: loongson: Combined regmap definitions
  ASoC: loongson: Add `internal` to the names of internal DMA variables
  ASoC: loongson: Separate external shared DMA from the platform
    interface
  ASoC: dt-bindings: loongson,ls2k1000-i2s: Document Loongson-2K0300
    compatible
  ASoC: loongson: Add Loongson-2k0300 I2S controller support

 .../bindings/sound/loongson,ls2k1000-i2s.yaml |  22 ++-
 MAINTAINERS                                   |   7 +
 sound/soc/loongson/Makefile                   |   4 +-
 sound/soc/loongson/loongson_card.c            |   2 +-
 sound/soc/loongson/loongson_dma.c             | 142 ++++++++++++------
 sound/soc/loongson/loongson_dma.h             |   6 +-
 sound/soc/loongson/loongson_i2s.c             |  61 +++++++-
 sound/soc/loongson/loongson_i2s.h             |   7 +-
 sound/soc/loongson/loongson_i2s_pci.c         |  59 +-------
 sound/soc/loongson/loongson_i2s_plat.c        |  98 ++++--------
 10 files changed, 229 insertions(+), 179 deletions(-)


base-commit: e69bc9b4c9827f4af5dfecba10df35dcc67d180a
-- 
2.52.0


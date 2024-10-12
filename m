Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150FE14D28C
	for <linux-sound@vger.kernel.org>; Sat, 12 Oct 2024 09:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728727137; cv=none; b=Bbhsk9wHnNpBfkaG5CLyR/FdQXcqZi3eoYWdim3tRS76Eh605sUVOIoWcZYU0qDZocqhh/v4r565190AgRNj56XT3Iu90huVvqGAvA+7iqL6pI8OTQjhm/DrLJJgg/L20LFii97Nt/+7mMo9EJfgzu3Hsgp5bgODxv49GysBgeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728727137; c=relaxed/simple;
	bh=f4BZ5LFNNHnAcB4dredSMs5xSDOhkYB50Wx+VajXCLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ug9p3S2qZme5dm0JQMU+aquloxxpbjZuyytJXNDFL1k2WYeqYPh9FDxvjbAjBsi9Bx3ijpr3QxWoac+WvmHHabZO1iBxJI2MU0RWJi4Yz8eKV6OcPADkKCegwSmrn7A84Dtj9GED88hfEYSgJvIvEKe5HHi5pzTjsE+VTI383uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.38])
	by gateway (Coremail) with SMTP id _____8BxnnNVSApnh_QUAA--.30973S3;
	Sat, 12 Oct 2024 17:58:45 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.38])
	by front1 (Coremail) with SMTP id qMiowMDx_9dSSApnzA4lAA--.53587S2;
	Sat, 12 Oct 2024 17:58:43 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: loongson: Fix build warning when !CONFIG_PCI
Date: Sat, 12 Oct 2024 17:58:40 +0800
Message-ID: <20241012095840.965087-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDx_9dSSApnzA4lAA--.53587S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AryrAryrGr4UWw43Gw43twc_yoW8Aw4fp3
	ZxA397WrW5tF4ayanxJry8CFyYy343C3W3uF47Jw1jgrZrAa4Uuw18tF15CF42krWUKF9F
	qFyrGay8G3WDW3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxU2MKZDUUUU

Fixes the below if kernel config disable PCI support:

sound/soc/loongson/loongson_i2s_pci.c:157:1: warning: data definition has no type or storage class
     157 | module_pci_driver(loongson_i2s_driver);
         | ^~~~~~~~~~~~~~~~~
sound/soc/loongson/loongson_i2s_pci.c:157:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
sound/soc/loongson/loongson_i2s_pci.c:157:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
sound/soc/loongson/loongson_i2s_pci.c:149:26: warning: 'loongson_i2s_driver' defined but not used [-Wunused-variable]
     149 | static struct pci_driver loongson_i2s_driver = {
         |                          ^~~~~~~~~~~~~~~~~~~

Add the appropriate Kconfig dependency.

Fixes: ba4c5fad598c ("ASoC: loongson: Add I2S controller driver as platform device")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410101647.o1lI37ou-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202410101439.Tfn5aT6i-lkp@intel.com/
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/loongson/Kconfig b/sound/soc/loongson/Kconfig
index e641ae4156d9..2d8291c1443c 100644
--- a/sound/soc/loongson/Kconfig
+++ b/sound/soc/loongson/Kconfig
@@ -16,6 +16,7 @@ config SND_SOC_LOONGSON_CARD
 config SND_SOC_LOONGSON_I2S_PCI
 	tristate "Loongson I2S-PCI Device Driver"
 	depends on LOONGARCH || COMPILE_TEST
+	depends on PCI
 	select REGMAP_MMIO
 	help
 	  Say Y or M if you want to add support for I2S driver for

base-commit: d5ca96a9c21a5bed12bb8d63f1376fdf77026d23
-- 
2.43.5


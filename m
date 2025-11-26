Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5C92D23B8
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 09:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764148718; cv=none; b=d2Th3I+9VGFc2acwIrRL8e9jpSrziDd/LNCdP034ZR/k1ICXJkOg1iKGVUUdNGBhiounc6ojrdAYuFvCh2svR45420QsvWG8uFIQBMQjH4YryaifakAw0/FT8jVg1vFwFHj3z2WAI1JH+HYzCeO7TwupNxZ5pyiso/wCfTy+gNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764148718; c=relaxed/simple;
	bh=CuXFda5axIky0aBNrCBRyBjv2PfOfP63pJET3Dr74jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ueYX0615WKeRxi2nNOoVIiTN49QUfu+YO1V4dLRCOdS/3nnLcwaBjOiW+8frpYVilYG0SpSMnVtniD4E0Y8UllSKY65d5PRHaslx/9aaF/paT7AVyyMtZWp8oVflDrA3Z/+eszTEsVwhuzi1GirKi/IaEpqNSTdp3iBMZrGQ+6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=B6+0wJyh; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="B6+0wJyh"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E830B3E137;
	Wed, 26 Nov 2025 10:18:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E830B3E137
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1764148709; bh=I3ERnbdNv7HsfpOs4x8zfC40KFt6OoPDizzV7mQMjS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B6+0wJyhGFqNZcnD23VT7WFaHo9HWXLOsTnAF+CEjTeda56VteHJTJima9AJi+oPH
	 bgUiInrL4u5rsKNByRPQICkJ114IiOOs8fvY4AHVBpf73isD39VlatxJDXYIfzp+Cl
	 WGF4xQZeRkIbK8qj80d1xQXtt+XMj89BumOPoOlU=
Received: from p1gen7.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 26 Nov 2025 10:18:25 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: Linux Sound ML <linux-sound@vger.kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Seven Lee <wtli@nuvoton.com>
Subject: [PATCH 2/2] ASoC: nau8325: add missing build config
Date: Wed, 26 Nov 2025 10:16:35 +0100
Message-ID: <20251126091759.2490019-3-perex@perex.cz>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126091759.2490019-1-perex@perex.cz>
References: <20251126091759.2490019-1-perex@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This configuration was missing from the initial commit.

Found by Jiri Benc <jbenc@redhat.com>

Fixes: c0a3873b9938 ("ASoC: nau8325: new driver")
Cc: Seven Lee <wtli@nuvoton.com>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/codecs/Kconfig  | 5 +++++
 sound/soc/codecs/Makefile | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 160c07699a8b..91ac99bc3edb 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -170,6 +170,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_MT6359
 	imply SND_SOC_MT6660
 	imply SND_SOC_NAU8315
+	imply SND_SOC_NAU8325
 	imply SND_SOC_NAU8540
 	imply SND_SOC_NAU8810
 	imply SND_SOC_NAU8821
@@ -2715,6 +2716,10 @@ config SND_SOC_MT6660
 config SND_SOC_NAU8315
 	tristate "Nuvoton Technology Corporation NAU8315 CODEC"
 
+config SND_SOC_NAU8325
+	tristate "Nuvoton Technology Corporation NAU8325 CODEC"
+	depends on I2C
+
 config SND_SOC_NAU8540
 	tristate "Nuvoton Technology Corporation NAU85L40 CODEC"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index bd95a7c911d5..da4077463278 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -192,6 +192,7 @@ snd-soc-mt6359-y := mt6359.o
 snd-soc-mt6359-accdet-y := mt6359-accdet.o
 snd-soc-mt6660-y := mt6660.o
 snd-soc-nau8315-y := nau8315.o
+snd-soc-nau8325-y := nau8325.o
 snd-soc-nau8540-y := nau8540.o
 snd-soc-nau8810-y := nau8810.o
 snd-soc-nau8821-y := nau8821.o
@@ -618,6 +619,7 @@ obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
 obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
 obj-$(CONFIG_SND_SOC_MT6660)	+= snd-soc-mt6660.o
 obj-$(CONFIG_SND_SOC_NAU8315)   += snd-soc-nau8315.o
+obj-$(CONFIG_SND_SOC_NAU8325)   += snd-soc-nau8325.o
 obj-$(CONFIG_SND_SOC_NAU8540)   += snd-soc-nau8540.o
 obj-$(CONFIG_SND_SOC_NAU8810)   += snd-soc-nau8810.o
 obj-$(CONFIG_SND_SOC_NAU8821)   += snd-soc-nau8821.o
-- 
2.51.1


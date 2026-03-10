Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA433BA238;
	Tue, 10 Mar 2026 02:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110838; cv=none; b=okklcC6tpVtVGgAtxMWuKRyJzpeooCJfR4HDnwePcx/e/vI9CZBdfkoD/qS7BICBeHPipKwQAbO4HblC+haS6yzKbDVuFUmFU0DSCZE9brIvm83ccG2V4m4Xv3bwSrrFvPsArlDQI00YQXjQtYO9GHUabVSYPUP26Tfm5jA/2To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110838; c=relaxed/simple;
	bh=VfQGfBtKtbAJk38Cges1m1pdw29syY8nJiJwA6BaYj8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V/pUL5OMM2bTHTZkpKOG3ob3EvJgUNq7dx3JH2lXBC0UaansYcmaLGPENOrbDGKu+CqVZ2ItwDhLkc4rkCQPJZf6354VARKbbZw2+me11FRD9Hn/FbjxuCMuulVILBwd45xm8LTjBiRM9gvylIU9TaBVxnrcow0Bdp1BggB2tNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAAXpgkohq9ptTYECg--.25800S2;
	Tue, 10 Mar 2026 10:47:04 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	akshu.agrawal@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: amd: acp3x-rt5682-max9836: Add missing error check for clock acquisition
Date: Tue, 10 Mar 2026 10:42:46 +0800
Message-Id: <20260310024246.2153827-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAXpgkohq9ptTYECg--.25800S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy3Gryxtw47tFWfurW7Arb_yoW8GFW8pF
	4kXrZ0qayUArZIkas8Za10vrn2yF48Aa1UAas8Wa4Fy3W3Ar4vgr47Kr1jqFWjvFy0g3Wx
	Gr9xG3Z5ZF4rWF7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIF
	xwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
	JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7V
	AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUosqWUUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

The acp3x_5682_init() function did not check the return value of
clk_get(), which could lead to dereferencing error pointers in
rt5682_clk_enable().

Fix this by:
1. Changing clk_get() to the device-managed devm_clk_get().
2. Adding proper IS_ERR() checks for both clock acquisitions.

Fixes: 6b8e4e7db3cd ("ASoC: amd: Add machine driver for Raven based platform")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 4ca1978020a9..d1eb6f12a183 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -94,8 +94,13 @@ static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	rt5682_dai_wclk = clk_get(component->dev, "rt5682-dai-wclk");
-	rt5682_dai_bclk = clk_get(component->dev, "rt5682-dai-bclk");
+	rt5682_dai_wclk = devm_clk_get(component->dev, "rt5682-dai-wclk");
+	if (IS_ERR(rt5682_dai_wclk))
+		return PTR_ERR(rt5682_dai_wclk);
+
+	rt5682_dai_bclk = devm_clk_get(component->dev, "rt5682-dai-bclk");
+	if (IS_ERR(rt5682_dai_bclk))
+		return PTR_ERR(rt5682_dai_bclk);
 
 	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
 					 SND_JACK_HEADSET |
-- 
2.25.1


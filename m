Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F6230ACE6
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044877; cv=none; b=kb/VCHeP+pRj3rJWr3ye9Z4AIg5/Df9E9oIgj+XZSijVoJTbFV4Z0pDuQUzDdOFi9C5jiV5ZJiKbqCVMK7HrXA0eWT3fs3GbhF2zH1wlz2QDrM3IE4MZ7KXR0U3FoX0L9QyFxFDXla0sykh0vaXhDCnJ2tFWMGERubgz033FcIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044877; c=relaxed/simple;
	bh=RtxCUm8c0ozpFW29aplPChL9sIgiPkw1EpCcuPRI0eg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PBh3zipjyfd/Rc0ejkj974fW95JxbGan0QnBfNKhw78ukgEw6nA1fU92/YWEqcPwwT/Wk/n1OGXOgiu6QXu+nJVibVqdReTr9o95sCxMc3jg9RKHcsICtZsECWs/+xFxAa0uqPNiILNZemW8ScaotWaMTVUvMbM41l3gX6pKQSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.87])
	by gateway (Coremail) with SMTP id _____8DxTNL+I4RqRTsCAA--.6526S3;
	Tue, 18 Aug 2026 17:21:02 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.87])
	by front1 (Coremail) with SMTP id qMiowJAxX8_7I4RqehYJAA--.57745S2;
	Tue, 18 Aug 2026 17:21:02 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Keguang Zhang <keguang.zhang@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH] ASoC: loongson: Fix naming of machine event and DAPM widgets
Date: Tue, 18 Aug 2026 17:20:52 +0800
Message-ID: <20260818092052.3596347-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxX8_7I4RqehYJAA--.57745S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEDCGqDzXQIVQAAsF
X-Coremail-Antispam: 1Uk129KBj93XoW7Aw4fuFWUuF4xGFWrXrWrZwc_yoW8Kr17pF
	nrZ390gF45XFy5Z3Z5J3y3J3W7A3yfWas3KF47t34vgan3Cw13WryDJF1jvFW7ArykJrn0
	qry8Cr4rGa43WrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

Rename `tegra_machine_event` to `loongson_asoc_machine_event` and
`loongson_aosc_dapm_widgets` to `loongson_asoc_dapm_widgets` to
accurately reflect the hardware platform. Update all references
accordingly.

No functional change is introduced.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 25cd12eab4b1..6422cc1703b6 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -55,8 +55,8 @@ static const struct loongson_card_config ls2k0300_dl2k0300b_card_config = {
 	.add_dapm_routes = true,
 };
 
-static int tegra_machine_event(struct snd_soc_dapm_widget *w,
-			       struct snd_kcontrol *k, int event)
+static int loongson_asoc_machine_event(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *k, int event)
 {
 	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct loongson_card_data *priv = snd_soc_card_get_drvdata(card);
@@ -72,9 +72,9 @@ static int tegra_machine_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static const struct snd_soc_dapm_widget loongson_aosc_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone", tegra_machine_event),
-	SND_SOC_DAPM_SPK("Speaker", tegra_machine_event),
+static const struct snd_soc_dapm_widget loongson_asoc_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", loongson_asoc_machine_event),
+	SND_SOC_DAPM_SPK("Speaker", loongson_asoc_machine_event),
 };
 
 /* Headphones Jack */
@@ -314,8 +314,8 @@ static int loongson_asoc_card_probe(struct platform_device *pdev)
 	card->num_links = ARRAY_SIZE(loongson_dai_links);
 
 	if (ls_priv->cfg->add_dapm_widgets) {
-		card->dapm_widgets = loongson_aosc_dapm_widgets;
-		card->num_dapm_widgets = ARRAY_SIZE(loongson_aosc_dapm_widgets);
+		card->dapm_widgets = loongson_asoc_dapm_widgets;
+		card->num_dapm_widgets = ARRAY_SIZE(loongson_asoc_dapm_widgets);
 	}
 
 	snd_soc_card_set_drvdata(card, ls_priv);

base-commit: 2792cc1b80b7674cc0751b34a964aad76630c1fa
-- 
2.52.0


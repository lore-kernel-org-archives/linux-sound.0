Received: from mail-m1973179.qiye.163.com (mail-m1973179.qiye.163.com [220.197.31.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6EA43B6D8;
	Wed, 15 Jul 2026 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128759; cv=none; b=EpvIF8L3sex4WHVeg/OWlXn0ehCdYu3kS2tNOTrwOZu7DrxpRUOfFd9k3wWanueY+nPmzKD73bMyr63piaRphrdwreu9Hl92ohSaKjYFVQ/5twniTYUY0i7r2pNKbBiKrRzjeuWG2lEUWKyOSzmwhazv9S6Nab3rc0RwI5zQf/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128759; c=relaxed/simple;
	bh=id7q/6siL0HW+2DiqBDKxbuVGwyOogsVIO1tAN/r3jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jFd9iPJC/225OwmLLhcofQnlbfbReFNeP+OtCcKyOkpaVYWu4K+lic4QpbD9JrQOxRh6Qb6Kuj/NnzZR52J8KQMIARsKBD+SPnZ3lYN28MWvJ/qVP8SxPPPEr2na4dlefoos7D3vQ/HD8QoH8yaCIyvagZXtaWaCNClMkFwOpjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=UncHRb1Q; arc=none smtp.client-ip=220.197.31.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="UncHRb1Q"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 464e8f2f0;
	Wed, 15 Jul 2026 22:03:25 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 15 Jul 2026 22:02:52 +0800
Subject: [PATCH v2 3/6] ASoC: qcom: common: Add generic headset jack
 helpers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-rubikpi-next-20260605-v2-3-67601d7a8581@thundersoft.com>
References: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
In-Reply-To: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124199; l=4189;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=id7q/6siL0HW+2DiqBDKxbuVGwyOogsVIO1tAN/r3jo=;
 b=J2zrDj9Lazll+x6uW8OhX/5UH7KwLJb5Pe7N88LDHlSK6iJDLBGa20pWDXgft0WmEVWim3LKr
 KOQwzlIpbraBfhLsgtMiSF7BPNWqjqlZSELj4j8W2W+zFEVylYChTDv
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9f6616ea5209d5kunm638899c2110c5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGkxJVk4fTENJH05OShpLGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=UncHRb1Q9/wlqdnY+9YS3/kK+CyRh9DlX9CLXzYQU/7t0cdVCzjl+yYfINHvzlyWgtVEogGJOZ4rkKDAJF1qOWNZ3kJRpO7U3+Lb7h2t5MPhcbSiBT8oK4zK0PeCbiGT+TC7MZjCKhVogrJqyrgJcw3+eJn1FpweA2W1IiwBdtg=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=RLuAC66DUpAVIdiO/b90btB9K++9bJ1owk3sFGrqr1U=;
	h=date:mime-version:subject:message-id:from;

qcom_snd_wcd_jack_setup() combines creation of the card-level headset
jack with the WCD-specific operation of attaching jack detection to
codecs on the TX codec DMA links. External codecs connected over MI2S
also provide component jack detection, but cannot use the WCD-specific
DAI filtering.

Factor the common jack allocation, DAPM pin registration and headset
button mappings into a private initializer. Reuse it from the existing
WCD path and add a generic setup helper which attaches the jack to every
codec component in a runtime.

Add a matching cleanup helper so machine drivers can detach component
jack detection when the DAI link exits. The WCD setup behavior remains
unchanged.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 sound/soc/qcom/common.c | 61 ++++++++++++++++++++++++++++++++++++++++++-------
 sound/soc/qcom/common.h |  3 +++
 2 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index edc4611691f7..c48819a0ed78 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -184,13 +184,11 @@ static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
 	},
 };
 
-int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
-			    struct snd_soc_jack *jack, bool *jack_setup)
+static int qcom_snd_headset_jack_init(struct snd_soc_card *card,
+				      struct snd_soc_jack *jack,
+				      bool *jack_setup)
 {
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_card *card = rtd->card;
-	int rval, i;
+	int rval;
 
 	if (!*jack_setup) {
 		rval = snd_soc_card_jack_new_pins(card, "Headset Jack",
@@ -214,6 +212,55 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 		*jack_setup = true;
 	}
 
+	return 0;
+}
+
+int qcom_snd_headset_jack_setup(struct snd_soc_pcm_runtime *rtd,
+				struct snd_soc_jack *jack, bool *jack_setup)
+{
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_card *card = rtd->card;
+	int rval, i;
+
+	rval = qcom_snd_headset_jack_init(card, jack, jack_setup);
+	if (rval)
+		return rval;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		rval = snd_soc_component_set_jack(codec_dai->component, jack, NULL);
+		if (rval != 0 && rval != -ENOTSUPP) {
+			dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+			qcom_snd_headset_jack_cleanup(rtd);
+			return rval;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_headset_jack_setup);
+
+void qcom_snd_headset_jack_cleanup(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *codec_dai;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai)
+		snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_snd_headset_jack_cleanup);
+
+int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	int rval, i;
+
+	rval = qcom_snd_headset_jack_init(card, jack, jack_setup);
+	if (rval)
+		return rval;
+
 	switch (cpu_dai->id) {
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
@@ -232,8 +279,6 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	default:
 		break;
 	}
-
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ee6662885593..0a255b08e873 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -10,6 +10,9 @@
 #define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
+int qcom_snd_headset_jack_setup(struct snd_soc_pcm_runtime *rtd,
+				struct snd_soc_jack *jack, bool *jack_setup);
+void qcom_snd_headset_jack_cleanup(struct snd_soc_pcm_runtime *rtd);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
 int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,

-- 
2.43.0


Received: from mail-m32124.qiye.163.com (mail-m32124.qiye.163.com [220.197.32.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52159396565;
	Tue, 17 Mar 2026 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736593; cv=none; b=fkIBVzQwkjxkUU/E3w3Do75wwvJhXFpGzmZSs0Liwhk/7TTm+iLrW4EJgKfZHyWVyQj/AW3Y6ouhN6RDcQA9Vy51OF6gI7ToGi/ZT0tgRxpS9b0JwdD97wTMYWQgjBVB/m7IYb5hS94xc8JToSLK7uR41D1Mmxos6jL+JVMB+4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736593; c=relaxed/simple;
	bh=4x8ZTwVz12Ky+tRkT1T5HIQ0yrrQKIADrgChMaCGw00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Babm3Qk9k7sd+hFLTA75RFkF6F44MoYoCvU9xdUVZ5gHencmPEKnG7KXtsK18DzGE7CweUF2P20SEZznSec5VDeFhvvyWTiAt006JZU6ze8ffFWsfauKATSSaRQhksErWXFCBL4f8fN3qKHyfeyErNpyRtbiNi4HfcbSNMtbjeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=Hhb6RwPy; arc=none smtp.client-ip=220.197.32.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="Hhb6RwPy"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 373e3b498;
	Tue, 17 Mar 2026 16:36:16 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Tue, 17 Mar 2026 16:35:42 +0800
Subject: [PATCH v2 3/6] ASoC: qcom: qdsp6: q6prm: add the missing MCLK
 clock IDs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rubikpi-next-20260304-v2-3-5634fabe0c43@thundersoft.com>
References: <20260317-rubikpi-next-20260304-v2-0-5634fabe0c43@thundersoft.com>
In-Reply-To: <20260317-rubikpi-next-20260304-v2-0-5634fabe0c43@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Roger Shimizu <rosh@debian.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773736570; l=1938;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=4x8ZTwVz12Ky+tRkT1T5HIQ0yrrQKIADrgChMaCGw00=;
 b=U7iLX8C3SK0reJhCVMmgVl/g9m+YAXhpFKdFQuo0opdiw9Tf2c25pGuZn7W44CuKY9RNTEA5o
 17DjDb7BGmvD5P4TgCghEQr+FxuE3lsj2QsI5xwuZBwqAslH8qBs3wt
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9cfaf0470e09d5kunm8391965e39c9b1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSk5KVh0YSR1JSxlDSE4aSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Hhb6RwPyboqcSrvj79m/LCV+e6UPo+rFUY1Qo/+A96A1l4FKIBIVpQjF1tKHVrVb1us575yTQMnz5YvJueBUW3NEvrLRFcTJoKrskw9rH3vowt/xv1e7nBsFIicsPlghDuHMhP15da/2KRkVSo8pAhIptYwcweXJVA5n30YGsIM=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=GdC5YQNGKdJMv418WALrveWB5hYD4dGAViPMRUB4GJU=;
	h=date:mime-version:subject:message-id:from;

Add the missing MCLK ids for the q6prm DSP interface.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 +++++
 sound/soc/qcom/qdsp6/q6prm.h        | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index 4c574b48ab00..51b131fa9531 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -42,6 +42,11 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 	Q6PRM_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
 	Q6PRM_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
 	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_1),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_2),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_3),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_4),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_5),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index a988a32086fe..7a3f2ad7bbd4 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -52,6 +52,17 @@
 /* Clock ID for QUINARY MI2S OSR CLK  */
 #define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
 
+/* Clock ID for MCLK1 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_1                                 0x300
+/* Clock ID for MCLK2 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_2                                 0x301
+/* Clock ID for MCLK3 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_3                                 0x302
+/* Clock ID for MCLK4 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_4                                 0x303
+/* Clock ID for MCLK5 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_5                                 0x305
+
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
 

-- 
2.43.0


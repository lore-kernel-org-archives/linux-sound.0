Received: from mail-m49195.qiye.163.com (mail-m49195.qiye.163.com [45.254.49.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E888730E0EC;
	Sat,  6 Jun 2026 21:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780780902; cv=none; b=BPlyX7t6znIqQyCDYvhFI2AYeibniSpZ9YcfZH7HaPEK3Qzpk0rVbjqt5tWbYSXwGpTuRL4eBnw+3CqRUPqINK+/aYJHfLr5u8pLoLBF2s+mZSgGnJg45xoSPjtwOCZixHV5SYO1JWPTjA7CBWvH/xl2Oirh1M7CbnmYZY+MyWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780780902; c=relaxed/simple;
	bh=7EG4MYgDN65VriGUaMdngMbhhxlSmg7pk8t2q5/VPVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SNGu0C/Bqb4z400Xneqf+kLQfvH3Bwsy4m8LOmLjE3PlbIb06/To3CdlKZDGf2x8ET45nqso+f4KwcnG9M0sN/RWeP+kN/qs+3dp8HJ+k6Azjxg3EP70yKXfFk2HMUac9uOyfC9/qxRDtURxirWGABOfPLTnE1O4o+ZLNNJkJS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=kGlvO1TT; arc=none smtp.client-ip=45.254.49.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="kGlvO1TT"
Received: from [127.0.1.1] (unknown [113.235.125.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 415a25042;
	Sun, 7 Jun 2026 02:58:46 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Sun, 07 Jun 2026 02:58:19 +0800
Subject: [PATCH 3/5] ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock
 IDs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-rubikpi-next-20260605-v1-3-7f334e16fea6@thundersoft.com>
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
In-Reply-To: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 mohammad.rafi.shaik@oss.qualcomm.com, rosh@debian.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780772320; l=2011;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=18JeWlh/iLVQ3WjYzzzqk8im+NKs9pPPa8nkOS33lBo=;
 b=T9LCr9wz2J7vcjSJTheM2EFdk1rv2Y74UXf1/D2RijnZFFwCoGm3Lzd1mBR+iav/4miJ//SNS
 CIYI/Vl2IJoDsB9/DCCO6YPuOqcarnTb+65bJtcWnnISPFULk6h80Uh
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9e9e4d4afd09d5kunm343af971138af5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTE5LVkhNThpLTUIeSRhLS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTlVPT1lXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=kGlvO1TTYTANWGOTdSfaZmNcqwO3QB5R0NKf2HYdIeV6bL4URxyyGa/mXs5RowJrt4HGrqkfxUxgKCtM9ur8dI+BUVT+exyHdSaksr4O0ww4wcaqqLwG/EIvn+f436Umx64/p+Wd0jxSbQA3jcXCVM/CcEFdvCM6m6JU+3139BU=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=O43pN37qUkYihSLgp1vhj4/ZPYt2n5s4WelMktsks3g=;
	h=date:mime-version:subject:message-id:from;

From: Neil Armstrong <neil.armstrong@linaro.org>

Add the missing MCLK ids for the q6prm DSP interface.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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
index a988a32086fe..6917e70bcb8a 100644
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
+#define Q6PRM_LPASS_CLK_ID_MCLK_5                                 0x304
+
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
 

-- 
2.43.0


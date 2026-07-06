Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D603B71C4;
	Mon,  6 Jul 2026 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349154; cv=none; b=DEXGsiEQ+K6/OKZIsjVjRH9YoMXq8OaV6rTiMGYRbfnTfWAN/vFnWjPl5P9e5ybz8BmwX3ZTm+bEVIMT+qL8hLjhwhPO3GJI/x196Q3brade1UwiERxI6CNBnQ5qjvJD8HRWR6sKuvbO3FB11A/6ToV8yU7svZ76DkJ2sd2KFnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349154; c=relaxed/simple;
	bh=RTZNJAmUv4BCvKQpOQtt1ZqWUQNadt489qZTzhtprjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SV2fyaf17a2YDx9ynJ3YLPBUc+ORt7y1e0dGsOR117uVYFZ50L9l18U0CKpWa+B94Fp8rWyhAIC1h2vyAU35STIJLREv+ati0h4bTPllHZDs8VCb7qBs43aQcXuJl96iyrBh2bPmRuiTUAu7D9Y6Z24gL1bjj5UNsPkpZno/Sjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAD3RMiav0tqo4A7Fw--.30751S2;
	Mon, 06 Jul 2026 22:45:46 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Sen Wang <sen@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: tas2781: bound firmware description string parsing
Date: Mon,  6 Jul 2026 22:45:39 +0800
Message-ID: <20260706144540.93929-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3RMiav0tqo4A7Fw--.30751S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr48ZFWrtFy3Jr17uFWkCrg_yoWrCry3pa
	1qqa45t39rtr13ZrsF9Fnrtr1fu3Z3GF15G3yxWr4rtryDtrykKaya9r1Yg3W8ArW0k3Z8
	ZrWaqrWxWr4UJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUyMKtUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The TAS2781 firmware parser reads several variable-length description
strings with strlen() before checking that the string terminator is
present inside the firmware blob. A malformed firmware image without a
NUL terminator can therefore make the parser walk past the end of the
firmware buffer before the later size checks run.

Add a small bounded string-length helper and use it for all description
fields that are parsed from the firmware buffer. Keep the existing size
checks for the fixed bytes that follow each string.

Fixes: 915f5eadebd2 ("ASoC: tas2781: firmware lib")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- keep the bounded string-length result in signed variables, including
  the calibration parser where Mark pointed out that `n` was unsigned
- add a Fixes tag

 sound/soc/codecs/tas2781-fmwlib.c | 63 ++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index bd16d5326a23..dcbeb9618195 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -12,6 +12,7 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
@@ -1100,13 +1101,42 @@ static int tasdevice_load_block_kernel(
 	return 0;
 }
 
+static int tasdevice_fw_strnlen(const struct firmware *fmw, int offset)
+{
+	const u8 *start;
+	const u8 *nul;
+	size_t remaining;
+	size_t len;
+
+	if (offset < 0 || offset >= fmw->size)
+		return -EINVAL;
+
+	start = fmw->data + offset;
+	remaining = fmw->size - offset;
+	nul = memchr(start, '\0', remaining);
+	if (!nul)
+		return -EINVAL;
+
+	len = nul - start;
+	if (len > INT_MAX)
+		return -EOVERFLOW;
+
+	return len;
+}
+
 static int fw_parse_variable_hdr(struct tasdevice_priv
 	*tas_priv, struct tasdevice_dspfw_hdr *fw_hdr,
 	const struct firmware *fmw, int offset)
 {
 	const unsigned char *buf = fmw->data;
-	int len = strlen((char *)&buf[offset]);
+	int len;
 
+	len = tasdevice_fw_strnlen(fmw, offset);
+	if (len < 0) {
+		dev_err(tas_priv->dev, "%s: Description error\n", __func__);
+		offset = len;
+		goto out;
+	}
 	len++;
 
 	if (offset + len + 8 > fmw->size) {
@@ -1238,7 +1268,12 @@ static int fw_parse_data(struct tasdevice_fw *tas_fmw,
 	memcpy(img_data->name, &data[offset], 64);
 	offset += 64;
 
-	n = strlen((char *)&data[offset]);
+	n = tasdevice_fw_strnlen(fmw, offset);
+	if (n < 0) {
+		dev_err(tas_fmw->dev, "%s: Description error\n", __func__);
+		offset = n;
+		goto out;
+	}
 	n++;
 	if (offset + n + 2 > fmw->size) {
 		dev_err(tas_fmw->dev, "%s: Description error\n", __func__);
@@ -1309,7 +1344,12 @@ static int fw_parse_program_data(struct tasdevice_priv *tas_priv,
 		}
 		offset += 64;
 
-		n = strlen((char *)&buf[offset]);
+		n = tasdevice_fw_strnlen(fmw, offset);
+		if (n < 0) {
+			dev_err(tas_priv->dev, "Description err\n");
+			offset = n;
+			goto out;
+		}
 		/* skip '\0' and 5 unused bytes */
 		n += 6;
 		if (offset + n > fmw->size) {
@@ -1372,7 +1412,12 @@ static int fw_parse_configuration_data(
 		memcpy(config->name, &data[offset], 64);
 		offset += 64;
 
-		n = strlen((char *)&data[offset]);
+		n = tasdevice_fw_strnlen(fmw, offset);
+		if (n < 0) {
+			dev_err(tas_priv->dev, "Description err\n");
+			offset = n;
+			goto out;
+		}
 		n += 15;
 		if (offset + n > fmw->size) {
 			dev_err(tas_priv->dev, "Description err\n");
@@ -2134,7 +2179,8 @@ static int fw_parse_calibration_data(struct tasdevice_priv *tas_priv,
 {
 	struct tasdevice_calibration *calibration;
 	unsigned char *data = (unsigned char *)fmw->data;
-	unsigned int i, n;
+	unsigned int i;
+	int n;
 
 	if (offset + 2 > fmw->size) {
 		dev_err(tas_priv->dev, "%s: Calibrations error\n", __func__);
@@ -2166,7 +2212,12 @@ static int fw_parse_calibration_data(struct tasdevice_priv *tas_priv,
 		calibration = &(tas_fmw->calibrations[i]);
 		offset += 64;
 
-		n = strlen((char *)&data[offset]);
+		n = tasdevice_fw_strnlen(fmw, offset);
+		if (n < 0) {
+			dev_err(tas_priv->dev, "Description err\n");
+			offset = n;
+			goto out;
+		}
 		/* skip '\0' and 2 unused bytes */
 		n += 3;
 		if (offset + n > fmw->size) {
-- 
2.43.0


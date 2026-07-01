Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8D0135A53;
	Wed,  1 Jul 2026 05:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782884008; cv=none; b=rK6o9FYMA5cfPMC+0J+dFl37+v13NUaIKp4G4gJLcEK5d69qxcw6PVCqmPlfeMX/mndcCM/uHNZoQA29on1orsbMBNCCBH9XdxHWc0DR5U1pZhVW56aWaH/50qD80TGwRhsv94CQVygLtiLTswnXm6opdp9hhRODINDhGschn4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782884008; c=relaxed/simple;
	bh=6sq0DIuBPs+KiSbVYrH7TgA0/shUpOXlwoauftpYZJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m+B5jitCoPWkYWkQuWwrvfhx/tb/KmfgqM3BXzHxI+rwfC2KYiWSlHk/7VGW0vuNj9J3kILWGhSMKtxj3A62djlj8knJbHNh/KQeqRZgdRQ/Pyfc5sjlrhWQhc0XKve8sYEsOc8dLtWcfi16gG0iIrwRIUDtKZsqT45M/bVcJD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowACnkKedpkRq37+HFg--.52082S2;
	Wed, 01 Jul 2026 13:33:17 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tas2781: bound firmware description string parsing
Date: Wed,  1 Jul 2026 13:32:55 +0800
Message-ID: <20260701053255.29087-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACnkKedpkRq37+HFg--.52082S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr48ZFW7XF4xCrykGrW3ZFb_yoWrJr15pa
	1qqa45t39rJr13Zrsa9FnFqw1fu3Z3GF15G3yxWa1rtry7trykKa9a9r1Yg3W8ArW0k3Z8
	ZrWaqrWxWr4UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The TAS2781 firmware parser reads several variable-length description
strings with strlen() before checking that the string terminator is
present inside the firmware blob. A malformed firmware image without a
NUL terminator can therefore make the parser walk past the end of the
firmware buffer before the later size checks run.

Add a small bounded string-length helper and use it for all description
fields that are parsed from the firmware buffer. Keep the existing size
checks for the fixed bytes that follow each string.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/tas2781-fmwlib.c |   55 ++++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 885e0b6f..4ef9ad86 100644
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
@@ -1099,13 +1100,37 @@ static int tasdevice_load_block_kernel(
 	return 0;
 }
 
+static int tasdevice_fw_strnlen(const struct firmware *fmw, int offset)
+{
+	size_t remaining;
+	size_t len;
+
+	if (offset < 0 || offset >= fmw->size)
+		return -EINVAL;
+
+	remaining = fmw->size - offset;
+	len = strnlen((const char *)fmw->data + offset, remaining);
+	if (len == remaining)
+		return -EINVAL;
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
@@ -1237,7 +1262,12 @@ static int fw_parse_data(struct tasdevice_fw *tas_fmw,
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
@@ -1308,7 +1338,12 @@ static int fw_parse_program_data(struct tasdevice_priv *tas_priv,
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
@@ -1371,7 +1406,12 @@ static int fw_parse_configuration_data(
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
@@ -2165,7 +2205,12 @@ static int fw_parse_calibration_data(struct tasdevice_priv *tas_priv,
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


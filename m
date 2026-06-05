Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1E73064B2;
	Fri,  5 Jun 2026 03:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780629417; cv=none; b=CcTjBlRU7dVYlMzK85Kc7pd/m+qvkk1D6+GFPaGNzaimetIuiSYserL2PYyrgbbX4g/KJ5Vua4hxBqkBRtPuoogyVGgIuZ07LfYTA2tz8+iNutkYi7hhpzAA/2lEETkacD0mn+DX0n2RaZnuXgz37QXVS8MsI8jPHEoxPWnvQvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780629417; c=relaxed/simple;
	bh=g5K82SiGfpxzeIVoQLtvWnFv38WMM9S7a8X8Uvsfnjk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Tb62K7c6Nil3lAaidfv+DmTXDishrJiEetyZKe1nfc2rLDZP5IP7CUR1LffM9oRs8zrfK/O4+uGD1NM+28rx7VYiBflniRlqc4b9Apofh1kHK0HEYRDJsV65W0kVJcVS63tqz1hIjCt7BNyoJexCXZSpL4Sq8RWgCWLBjXWxiwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ABXctjiy; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ABXctjiy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=N8
	23HeqTK6osUlrbh1/GRx3iV9ri8I8LOM2htoW35tA=; b=ABXctjiyhaa/MplL4Z
	YGtB/ak3G9TqAn3FyQLiU/ErSV/Nvhc7W1gIQKZSfLUFl+xgZgDzAaSbDf1nLNBR
	WkMQK91L2ROCxU8G/jZPx7duVcTVR7jcHkAgdyikEwEA4SxHVWEy67DoRyWViv2g
	1vljG9uPFOZLpcvzlWcuKUjm0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCns8eDPyJqeDlIBg--.20700S2;
	Fri, 05 Jun 2026 11:16:21 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	perex@perex.cz,
	wangdicheng@kylinos.cn,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] ALSA: usb-audio: qcom: Use PAGE_ALIGN macro for buffer size calculation
Date: Fri,  5 Jun 2026 11:16:11 +0800
Message-Id: <20260605031611.69550-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCns8eDPyJqeDlIBg--.20700S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw4xAw15Cr13Gr18trW3trb_yoW8XFy3pr
	s7GF4jkrW3G3W8J34DAw47X3WYywnrAFy3GFWSg3y3CrW3J34DWF1Ut34SqF1xKr4IkrW0
	vw4IyrWrZwsYgaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEcTm7UUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5wUUY2oiP4UAtAAA3T

From: wangdicheng <wangdicheng@kylinos.cn>

Use the kernel's PAGE_ALIGN() macro instead of open-coding the page
alignment calculation. This improves code readability and follows
kernel coding style.

The manual calculation:
  mult = len / PAGE_SIZE;
  remainder = len % PAGE_SIZE;
  len = mult * PAGE_SIZE;
  len += remainder ? PAGE_SIZE : 0;

is equivalent to:
  len = PAGE_ALIGN(len);

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
v1->v2:
Remove unused variables 'remainder' and 'mult' to fix W=1 build warnings
reported by kernel test robot.

 sound/usb/qcom/qc_audio_offload.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index fa7ee61d6934..b2b719238b0b 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1042,8 +1042,6 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
 	u32 len = xfer_buf_len;
 	bool dma_coherent;
 	dma_addr_t xfer_buf_dma_sysdev;
-	u32 remainder;
-	u32 mult;
 	int ret;
 
 	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
@@ -1052,10 +1050,7 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
 	if (!len)
 		len = PAGE_SIZE;
 
-	mult = len / PAGE_SIZE;
-	remainder = len % PAGE_SIZE;
-	len = mult * PAGE_SIZE;
-	len += remainder ? PAGE_SIZE : 0;
+	len = PAGE_ALIGN(len);
 
 	if (len > MAX_XFER_BUFF_LEN) {
 		dev_err(uaudio_qdev->data->dev,
-- 
2.25.1


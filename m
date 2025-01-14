Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F78F2309BD;
	Tue, 14 Jan 2025 08:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736842067; cv=none; b=lJxmp4VtbMIuSyTCF2B7uZPf5csfcjouCZCny7gdK4JUFEj1jpcXVhD+vhM28bV5LJ3gB3ZAf5ftv/sS7rQPrsklpjEJ7I09ZHBegzyDuSvsP1ORMaKcMMLqJhss04kY50glFKVVl53vFhyMd/2dEVAQA0frYw1pKgjU1xVpidY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736842067; c=relaxed/simple;
	bh=eEimvprOnBQDQhSdQkFVuHh+fCmn37LVyjQxOOx36qo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hY++bN2m/Xywi4acX1WjyVcexs0a6hQmkR1MNXNaQAe4vJIUl0FQvh2fxDswxqCgpq6zQ/6AFn9TgqUJ3LVYvP54KR4ZPIV4j5U6QjNQRTZBTPgdNa13BlOqEcJDI8J+Gb2qxXa7w6juoeGyjgfT39Ocy+d1DSaOEgIRx7m7u/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.90])
	by gateway (Coremail) with SMTP id _____8AxaeFMG4ZnORhjAA--.62508S3;
	Tue, 14 Jan 2025 16:07:40 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.90])
	by front1 (Coremail) with SMTP id qMiowMDxrcVLG4Znw74hAA--.4569S2;
	Tue, 14 Jan 2025 16:07:39 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [PATCH] ALSA: hda: Add AZX_DCAPS_NO_TCSEL flag for Loongson HDA devices
Date: Tue, 14 Jan 2025 16:07:00 +0800
Message-Id: <20250114080700.23029-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxrcVLG4Znw74hAA--.4569S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWruF1DJrWktr1rZF1fCr13KFX_yoWDZrc_Cr
	sxtrn7Wan5W3yUGr1YywnYgFW0v3W8tryfurn7tF43Za97Ja1Fqwn3Cry7CFykJF4jqFsx
	WwsrJFn3uw1UKosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUUU

Loongson's HDA devices do not support TCSEL functionality.

Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
---
 sound/pci/hda/hda_intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 4a62440adfaf..7d7f9aac50a9 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2738,9 +2738,9 @@ static const struct pci_device_id azx_ids[] = {
 	{ PCI_VDEVICE(ZHAOXIN, 0x3288), .driver_data = AZX_DRIVER_ZHAOXIN },
 	/* Loongson HDAudio*/
 	{ PCI_VDEVICE(LOONGSON, PCI_DEVICE_ID_LOONGSON_HDA),
-	  .driver_data = AZX_DRIVER_LOONGSON },
+	  .driver_data = AZX_DRIVER_LOONGSON | AZX_DCAPS_NO_TCSEL },
 	{ PCI_VDEVICE(LOONGSON, PCI_DEVICE_ID_LOONGSON_HDMI),
-	  .driver_data = AZX_DRIVER_LOONGSON },
+	  .driver_data = AZX_DRIVER_LOONGSON | AZX_DCAPS_NO_TCSEL },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, azx_ids);

base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
-- 
2.43.0


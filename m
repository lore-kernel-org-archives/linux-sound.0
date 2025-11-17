Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C261B0F23;
	Mon, 17 Nov 2025 03:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763350138; cv=none; b=PXRClIkXSxgnk67DLcx87DNt6n4MI3BhFuBRqoHhBSc6jab6tEeALDwMd08JoA0ZbT5VCX4D9Q4qb/i6UiVf0MQJ2KjK3KIPJhJv3ChOPHZawAZIpwn5TelNoD8EcavWZiymmdQ44pj7Yp75KMZzhkyYr4RENC8IBzLPNqWJeT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763350138; c=relaxed/simple;
	bh=6clw4LVmMs7Kgixus+6ZwFy88Y0oXckvXkDkNbGO8vI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PF3mbAAMgiACakpsvWQKMpbhHg6ObXnVGHdF2dOpxOBkr91345y0CO265d+TxlJlc1wvxLPBxx7K+znHu/jMBbt+Fk0lGICT5W0XQKD7np4dXMMsP5Q8+W6wgIw02a1j03zzP2QF40I4uhw6ekG7Zg3Jo2NZLLyFaaGaQjMvRx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hGibSVCN; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hGibSVCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=GO
	VMNZP75w86KogEWw/Vr4Wf+H+2e+YDtXaPOdssx6M=; b=hGibSVCN8ex8KBLjVn
	vwnfdHQSUBt5ZQ+rCNNAvfbdpK0zngwuwNwm+N+FmSUcG2E/TONaVOs97m3fVJaP
	Cbe5XRZYXn9iM/1I3xVyfL3WdadZouxJY5cTzPUYjRUPoeEuMlWSTrND+XAbLoFm
	bxk3wECZSSec+748VJtEGQy6U=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3f0lalhppIC4kAw--.2023S2;
	Mon, 17 Nov 2025 11:28:27 +0800 (CST)
From: "jempty.liang" <imntjempty@163.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"jempty.liang" <imntjempty@163.com>
Subject: [PATCH] ALSA: core: Fix style issues in sound/core/device.c
Date: Mon, 17 Nov 2025 03:28:16 +0000
Message-Id: <20251117032816.55442-1-imntjempty@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f0lalhppIC4kAw--.2023S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar1UKFy3Kw13Gw1ftrW5Wrg_yoW8Gw4kpr
	4kGa47KFW5Gr17u3WjvanFgr43Wr12yanYv3yfJw17Kr1rCryFyrW0yFy5Aw45G3y5CFWU
	ZrWayr40k3y3Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFXd8UUUUU=
X-CM-SenderInfo: hlpq3yxhps35i6rwjhhfrp/1tbiFAUJAWkakoxlZAAAs1

This patch fixes blank line and trailing whitespace issues in
sound/core/device.c as reported by checkpatch.pl.

Signed-off-by: jempty.liang <imntjempty@163.com>
---
 sound/core/device.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/core/device.c b/sound/core/device.c
index cdc5af526739..207dbc8c3242 100644
--- a/sound/core/device.c
+++ b/sound/core/device.c
@@ -47,6 +47,7 @@ int snd_device_new(struct snd_card *card, enum snd_device_type type,
 	/* insert the entry in an incrementally sorted list */
 	list_for_each_prev(p, &card->devices) {
 		struct snd_device *pdev = list_entry(p, struct snd_device, list);
+
 		if ((unsigned int)pdev->type <= (unsigned int)type)
 			break;
 	}
@@ -130,7 +131,7 @@ EXPORT_SYMBOL_GPL(snd_device_disconnect);
 void snd_device_free(struct snd_card *card, void *device_data)
 {
 	struct snd_device *dev;
-	
+
 	if (snd_BUG_ON(!card || !device_data))
 		return;
 	dev = look_for_dev(card, device_data);
@@ -147,6 +148,7 @@ static int __snd_device_register(struct snd_device *dev)
 	if (dev->state == SNDRV_DEV_BUILD) {
 		if (dev->ops->dev_register) {
 			int err = dev->ops->dev_register(dev);
+
 			if (err < 0)
 				return err;
 		}
@@ -190,7 +192,7 @@ int snd_device_register_all(struct snd_card *card)
 {
 	struct snd_device *dev;
 	int err;
-	
+
 	if (snd_BUG_ON(!card))
 		return -ENXIO;
 	list_for_each_entry(dev, &card->devices, list) {
-- 
2.25.1


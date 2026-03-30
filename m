Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA90034CFCF
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 04:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774843245; cv=none; b=DFUwYzG27GBx7FswkRVZ+oBItvHw6aC+ScwweaoxOaDMiSEKeF/rwV7Hq97jSK1Bsf2AkPLcvAyyTKxVkD0s06einVNMI2BXF1SYN036+5iWJl30eA/6E0xlh33N32F/9y6iKbNzn28itaw7gc8R49NLwFiYpC+DTiLCdEVAsYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774843245; c=relaxed/simple;
	bh=PlmjxGt4JGDRqDssZg/k5xlqGZcdiyv/+rwibqyvJPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hOVSJvFpe0Q5lSYQae3jC1qkiYTQHHZA+eBdzV/0o6I12rbDpqU49MsOHiNf1vzavTXoVwcESEpq1yGtDTeYchHD/b4vaBAfds7TLqCYs29WJU1hFTvfpYCCF3OazA8vcICg7mMjh7QJAq15ItE6UnSoIqt8kGd9Of2t2ri0aNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSA/cKKq; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSA/cKKq"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12732165d1eso5550989c88.1
        for <linux-sound@vger.kernel.org>; Sun, 29 Mar 2026 21:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774843243; x=1775448043; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2MiznXVnaOQN1Ty0L+R2YmSXm0gykn8v0J+C8W1yOKA=;
        b=nSA/cKKqEzUOun+9QiFOdpV+7B87zgxQ4lgdCDGuOzYw382Xv5jxMiQeyzob6QsMOW
         3fxUxAhrzXeHsqCCPbCx3m+vRpLLn+ZJWvKS46mK+/hZJVfHTlpi9JjU8k1dPptG5IIl
         1t/jTAF4OnpJxfI61CcycuL/DBDzBAUWXrUnjYiLiEXmNpbZD3i27k6k6+uk9TWNHuta
         zb4fNY8izJIb3574PoYey9D/JXKGlSksN2PkAUJI3VvrcyrBQqXebgg+8MVWpjeMaZ/F
         lkW3v/phqEQmARHsbTCmtOjtfK7Z6Iey1o+wgwEUyxR6EUUZhT7kQUblFTNE7ll45RYm
         2PDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774843243; x=1775448043;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MiznXVnaOQN1Ty0L+R2YmSXm0gykn8v0J+C8W1yOKA=;
        b=AojZ7CB8VqijBURABLvvCaF4Y2hEH+RnZqD6kNHoOlR/kJxtbmMkb9hgxmReF5fg3D
         CsWr6nhe9KWUAAEs2aWQZZeoBYr2jGo232yMf7uBRJ2LqO1A/vecnZx9Bmxv6XSMQxoM
         AAhXfZXTHHwEJaJuttACI/kez3mlIC5rQYanGeD0uVoO0elGX8mvGJYIYHTOd8lQSG1Y
         2pMuQYvPMQG6GaDZb0PkQ1J0EwHdR0D573n055QVYnwT6RL8YdeLg7eTDKQo80npR2VQ
         VFRZM6ae3DHDymhtM0O6MYPKi+LTsX0YVgNvpIjXB6AQD8wHv5CEA8GMgz0n8SVIHeL6
         m/qA==
X-Forwarded-Encrypted: i=1; AJvYcCXizfspQVo24x+eibF0eCiqk5Zt/S8BaC+SFj0O6iyb9POBPM9+GI294knrHVDEgTyuIQsdcn4BWwrKrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxvZYmRDkpKldvjxJ89bzCQ1+ILUfGzLm/wFFYS69fD434k7Jm
	O5UW7Xajc/yCmFLxts/xqZbmN1SY5+OxleTOEG1YLEuSV0DHx4sGTerV
X-Gm-Gg: ATEYQzwRHmxbLOcQjZ1hI2yA04O3Yo4S+/EVYotv4GI1o66lDdP9uVqVjuBajElny89
	AEv0hzxay+1tkbpb3ttzYYoLpu8hn35IF6qcwiBnc6TJJCh7kl7i5NnEtQIBiMvTdqb/Xo7i14F
	BhGZPghldSxkckD+CoGaZJDuPZWdNpNNNsgykbWZv3NK8RbM5ME7GI9XCqnVhFELxPbI/2f2d2H
	qqC4kHEJ9QrHX/VgoXYkbyZxSW3ao4n7Yke0bGeh+pXHB1DAI8zIAuJ8OT6bnbFKWwl55SmndCk
	sVYLQA3Q/IL7rk4xvMbgGkHL4PJvBLUqkYCdS+PS15xcgtxKRnSL1DpvpLxHHSZhMnqkm4ZTZAJ
	Wy4T59plmxSrsLRcGdFrwopbo5FP5h1L98WmU8IZX1sIa9DRJEeEHaEcqsc6g7MuzrcVAtO9hes
	pmvdL6e9cXW6N+rAu389W9v5d8C96GP25tGNelsHU+MXbqbh46Sfas/4stVXF22N4MZstxL5LW/
	WZkFf+jXDDT6oo=
X-Received: by 2002:a05:7022:6887:b0:12a:8ea4:24d with SMTP id a92af1059eb24-12ab28d13fcmr5818158c88.19.1774843242791;
        Sun, 29 Mar 2026 21:00:42 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-254.user3p.v-tal.net.br. [177.4.161.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab970da7fsm6715590c88.0.2026.03.29.21.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 21:00:42 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 30 Mar 2026 01:00:34 -0300
Subject: [PATCH] ALSA: aoa: i2sbus: fix OF node lifetime handling
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260330-aoa-i2sbus-ofnode-lifetime-v1-1-51c309f4ff06@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywrCMBBG4Vcps3agTr1QX0W6SJM/OqKJZFoRS
 t/dqHA23+YsZCgKo1OzUMFLTXOq2G4a8leXLmAN1SStHNpOenbZsYqNs3GOKQfwXSMmfYD3Rwm
 73qOrUR08C6K+f/Pz8LfN4w1++h5pXT/b61n9fgAAAA==
X-Change-ID: 20260329-aoa-i2sbus-ofnode-lifetime-572d49ce3ce3
To: Johannes Berg <johannes@sipsolutions.net>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3170;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=PlmjxGt4JGDRqDssZg/k5xlqGZcdiyv/+rwibqyvJPk=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJknv2aUvCrkz2m7q6S9zJlV0mjjbw39tPLC1LoTJw9F6
 7Lax3F3lLIwiHExyIopsqxOWmS5p+vB1fq4FR4wc1iZQIYwcHEKwERqjzAynF77b78RV7eAssbv
 3Xds3ddcPeUtXO93Nqqg4xfrq2WzyhkZLuyVq/7X+cN3hj5Tt3ixb1ioyod3Pg191cV6F04/2Gn
 GAwA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

i2sbus_add_dev() keeps the matched "sound" child pointer after
for_each_child_of_node() has dropped the iterator reference. Take an
extra reference before saving that node and drop it after the
layout-id/device-id lookup is complete.

The function also stores np in dev->sound.ofdev.dev.of_node without
taking a reference for the embedded soundbus device. Since i2sbus
overrides the embedded platform device release callback, balance that
reference explicitly in the local error path and in i2sbus_release_dev().

Fixes: f3d9478b2ce4 ("[ALSA] snd-aoa: add snd-aoa")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/aoa/soundbus/i2sbus/core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
index 22c956267f4e..833c44c0a950 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -84,6 +84,7 @@ static void i2sbus_release_dev(struct device *dev)
 	for (i = aoa_resource_i2smmio; i <= aoa_resource_rxdbdma; i++)
 		free_irq(i2sdev->interrupts[i], i2sdev);
 	i2sbus_control_remove_dev(i2sdev->control, i2sdev);
+	of_node_put(i2sdev->sound.ofdev.dev.of_node);
 	mutex_destroy(&i2sdev->lock);
 	kfree(i2sdev);
 }
@@ -147,7 +148,6 @@ static int i2sbus_get_and_fixup_rsrc(struct device_node *np, int index,
 }
 
 /* Returns 1 if added, 0 for otherwise; don't return a negative value! */
-/* FIXME: look at device node refcounting */
 static int i2sbus_add_dev(struct macio_dev *macio,
 			  struct i2sbus_control *control,
 			  struct device_node *np)
@@ -178,8 +178,9 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 	i = 0;
 	for_each_child_of_node(np, child) {
 		if (of_node_name_eq(child, "sound")) {
+			of_node_put(sound);
 			i++;
-			sound = child;
+			sound = of_node_get(child);
 		}
 	}
 	if (i == 1) {
@@ -205,6 +206,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 			}
 		}
 	}
+	of_node_put(sound);
 	/* for the time being, until we can handle non-layout-id
 	 * things in some fabric, refuse to attach if there is no
 	 * layout-id property or we haven't been forced to attach.
@@ -219,7 +221,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 	mutex_init(&dev->lock);
 	spin_lock_init(&dev->low_lock);
 	dev->sound.ofdev.archdata.dma_mask = macio->ofdev.archdata.dma_mask;
-	dev->sound.ofdev.dev.of_node = np;
+	dev->sound.ofdev.dev.of_node = of_node_get(np);
 	dev->sound.ofdev.dev.dma_mask = &dev->sound.ofdev.archdata.dma_mask;
 	dev->sound.ofdev.dev.parent = &macio->ofdev.dev;
 	dev->sound.ofdev.dev.release = i2sbus_release_dev;
@@ -327,6 +329,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 	for (i=0;i<3;i++)
 		release_and_free_resource(dev->allocated_resource[i]);
 	mutex_destroy(&dev->lock);
+	of_node_put(dev->sound.ofdev.dev.of_node);
 	kfree(dev);
 	return 0;
 }

---
base-commit: bea8d9e445caf009ccadc17c353cc82f07885dd6
change-id: 20260329-aoa-i2sbus-ofnode-lifetime-572d49ce3ce3

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


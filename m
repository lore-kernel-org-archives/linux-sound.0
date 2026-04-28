Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C3230BBB8
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 03:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777345642; cv=none; b=bOIV9kpaUFQ3ZeIJ8b7gNBepfPNAw1g5Z51kXoGbxKrXUSK+KadK7NyX7IVQs2CRKcZlMXpkaGyPV0e6uiuMbGe8ktmsRBxzqSvLyGLSO0E/MKWgpLc3xtAJ7VwEmdSRWigJeMqEri+PKLiyNzpXCttFSRc746LdOyix1utfADo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777345642; c=relaxed/simple;
	bh=M/DH4mZdkREffdwKLGoyCTZnaJGwxzLtvZ0z5kxN6cI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MAV5NUoaWD/AXHK8AJLPvPJgXHnlZmqiANX0Wb7UM9MWSorWFDCoMjpxW2DxLH/mQKi6qf9pyHK4h3L5gz9OzBNBk20ATH41uZ/IoyYkQmmVhfN17hbxBItIckuGAWrnAtZRh+RrICqMzYsD2CXyLPP4akl2AqjPo6Q4JFxgSG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6hyI5BG; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6hyI5BG"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79ab3e26cceso99959747b3.3
        for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 20:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777345640; x=1777950440; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xy+tm9bENqCqZp9SYs+pOo5djm/sVYYFvKa2wEp3fzY=;
        b=c6hyI5BGHFOfiXAaC4FRCtkagrNJ/qlzHqPi6t0dA9Bl77auQNHs+UaYLUWWsO9SpO
         Q1m1r1EXyxcEmkdK9Vppy1TjnTyn1nx/8vFsaICi9LH6Xw3nZi0Q30k976oFqe1kc5cX
         5MKk6CYwyGFAy6IYsWjJ8pVticHMvfEpbVYZ4/GeZrBUD5sCqRo9iYOsUW6RZFPBmNAa
         h4jvuywWqtMezD3bbiuyqjQcC3lL2W0P1KadU+HMjY8IC2Bc9UC6bye0hewpj6YyvLuA
         m9TKImNP/aMm7t6QlgqfkdWTexVGyWajTIOw/RFyV9YS2qR2Rar+jG5zrfEaJOcF1CdX
         IUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777345640; x=1777950440;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xy+tm9bENqCqZp9SYs+pOo5djm/sVYYFvKa2wEp3fzY=;
        b=fdQ3aswIqK7m81XUd+n0djAZmK3lRTP/mmVM4E/dcuHfqrGShb5rUvgnmhJuFibv2k
         6gitXKcG/D0jgC0Ov24614XKg/wpjanOlbYN8h/5K4WYmtsRAZeyV0t3CIBwelWoZeI+
         54v+w6jFSA2Di4/bTEw87fP89HTCWbR3ujOYAupPkYK/xKwOXQGdVE2nRnH6a0m1Kmjc
         VJWDLfAJz+rE/40umur56rGXbodjKJnf8rjcJVqJHxfUZrjFOQHtAK1M/Yh81u3ixJJT
         lrH/mnbYPP0IkjohxC/3QAkvJIXDks4SqH4/ZR7cRBNG707AqDjWfo5MMG9+sOZlrxEt
         PMAg==
X-Gm-Message-State: AOJu0Yy8248NqisZySy69pXoU0aQhEFjv5xOP7mWjvRzkR6RhZwhSYal
	/vJ1zY/J/3yn467AgW3bwYIGDNoGW7M+m7ObVPR7h1lYuifXTFH1GgC58A9jobMZ
X-Gm-Gg: AeBDiesjvQg9LvaPRxNg87P2yDzqKNUXtbq2q6mf4UzPbPIGIBh/AifwZX3mdQ4qm0Y
	sCtQ0UADNfhaTrSakaXCdy7KfuBrgU1ylyWDSLVTkWVxZUQV7T0QfqlTFgE+cVgFr3K5u7oXD8K
	h6JkC+ZHWxX6Kc9KKGMPGtZc/HVyNoIiXdSB6Jej0yAJCp6AswXWu68AIQlLZbBcsWNuom6HJl4
	M08kSxuXXIj/uRT5wD2bfvsfKoUksxcSLrMZDqEByEnwPhF62xN/5gjl/rL2bpDemNPbaZtvzS/
	N+SbMTRWErhS5vuzED3Kn6QGqH4ndjAiyAzR0Sg1YqC5vClKcx2KrDq7I0/G74+1Fn4x2TNof6F
	Zaq6TgkgVB5I7mA7nmaecJx4I6HY8Ag7//OjBqEvUbtwfLHTjHRKuInFRz4z5pgFPLHwpdzq7Xx
	HW1YdnmxgduUWZ41B4rbtm10T0FHU4ENiCO773XsnLPKlTByTSf5xN0PQY0xxfDwy6fBcOVL3kX
	idnroqUiIEQ
X-Received: by 2002:a05:690c:c24d:b0:7ba:eefe:9fa1 with SMTP id 00721157ae682-7bcf52207camr11515787b3.6.1777345639900;
        Mon, 27 Apr 2026 20:07:19 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e622esm8834257b3.17.2026.04.27.20.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:07:19 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 28 Apr 2026 00:07:08 -0300
Subject: [PATCH] ASoC: fsl_xcvr: Fix event generation for cached controls
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-asoc-fsl-xcvr-event-generation-v1-1-f21cf0812c4f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMBCE4Vcpe3ahRmvVVxEPcTupEUllN4ZC6
 bsb9fgd5p+FDBphdG4WUpRocUoV201DcvdpBMehmlzrDu3e9extEg725FmKMgpS5hEJ6nOdsgt
 dL93uNMAdqUZeihDn38Hl+re9bw9I/lZpXT8IVeqlggAAAA==
X-Change-ID: 20260427-asoc-fsl-xcvr-event-generation-2f57c539de28
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Viorel Suman <viorel.suman@nxp.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2246;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=M/DH4mZdkREffdwKLGoyCTZnaJGwxzLtvZ0z5kxN6cI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJkfVJKXHzPrqixb3+9XfsVgqkItf7+RfpXZtTP9Deq/S
 jZfifPrKGVhEONikBVTZFmdtMhyT9eDq/VxKzxg5rAygQxh4OIUgIm8tGdk2Lwz0nZ2ey1L96Iz
 u3XPnJoS4KWwbMpO/92bpKpvuPkHSjH8d2rKLBb46RjkuLldvGmG3OGflg65Mp08TbM53vQbC1c
 yAQA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

ALSA controls should return 1 from a put callback when the control
value changes. fsl_xcvr_capds_put() and fsl_xcvr_tx_cs_put() both
update cached control data but always return 0, so ALSA suppresses
change notifications for the Capabilities Data Structure and playback
IEC958 channel status controls.

Compare the old and new cached values before copying the new data,
and return whether the control value changed.

Fixes: 28564486866f ("ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/fsl/fsl_xcvr.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index ee16cf681488..6677d3bf36ec 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -228,10 +228,14 @@ static int fsl_xcvr_capds_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
 	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	int changed;
 
-	memcpy(xcvr->cap_ds, ucontrol->value.bytes.data, FSL_XCVR_CAPDS_SIZE);
+	changed = memcmp(xcvr->cap_ds, ucontrol->value.bytes.data,
+			 sizeof(xcvr->cap_ds)) != 0;
+	memcpy(xcvr->cap_ds, ucontrol->value.bytes.data,
+	       sizeof(xcvr->cap_ds));
 
-	return 0;
+	return changed;
 }
 
 static struct snd_kcontrol_new fsl_xcvr_earc_capds_kctl = {
@@ -1040,10 +1044,15 @@ static int fsl_xcvr_tx_cs_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
 	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	int changed;
 
-	memcpy(xcvr->tx_iec958.status, ucontrol->value.iec958.status, 24);
+	changed = memcmp(xcvr->tx_iec958.status,
+			 ucontrol->value.iec958.status,
+			 sizeof(xcvr->tx_iec958.status)) != 0;
+	memcpy(xcvr->tx_iec958.status, ucontrol->value.iec958.status,
+	       sizeof(xcvr->tx_iec958.status));
 
-	return 0;
+	return changed;
 }
 
 static struct snd_kcontrol_new fsl_xcvr_rx_ctls[] = {

---
base-commit: 98421d94a1a6dcc3e8582eb62bedeccecda93339
change-id: 20260427-asoc-fsl-xcvr-event-generation-2f57c539de28

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


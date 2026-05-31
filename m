Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B902A3806A6
	for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 23:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780270937; cv=none; b=mS5bgYiW/ZPJV6y55esGrqpRkL+hcesLZMVswIAPY1OMZMA1DtxqJo7owXiodxgRD9UbuigxlPxRrB4ttGErZkwvvXS2iF0JBFKWiYKdTlrNhAyxrrVMF7lJY9VEUdQdJBGedIEritJkdN2b3E92uInqCkYea7b2JnIuRAO0KZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780270937; c=relaxed/simple;
	bh=0ELhwdUVsobKhtLRouvBFWIF4j4psupIKOVxO8BCN8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HzhF2++I7tYQXa1q79hZ0/Iwr1bNofhLZkVFmULwe52OYC+MndgMud6oQhba1Z22ZJzq0ENggPx4zH5315dYMODFh2SaevRgNKfT5V0woLQtgW8JUYgS1iV5OBypww+qaL0yLfq0saXEDl4AACvLK2DBFoR/nxgVf4usA2W5vZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtfVoEao; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtfVoEao"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-132d1b2519eso13909594c88.0
        for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 16:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780270935; x=1780875735; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQEMX7KWl23YBEgF8/06My2SGYZpUwTggTcppY9uX98=;
        b=XtfVoEaoQZYKl9irJQd8JFhN8Gx8mGtFuQRCyWp8r3lbvnSnPsCJw+wgWYm7ejzoaB
         ndlXnwGHWn9pFEqgqzHhRf/g7mTJq/VyN9VlP6zaQRPu2xG9oznBIiZiO4LOzVkNjq3b
         7kAGM+EuauHXJDdZsMc+mJBtN0eXLyiEQ0DL88LuzV9uRKxQBpxfRqjVlAIqRM//PJRT
         hZeK0XbjbDdxizW32sURXBl1ES7+nY54ICcUy7JKS7oOpgJ3FB9MCnq7Jwp7l95sg1Zu
         PepEMVZRy24aRjaBzdtojwAhCQ05qV0whYUEEJPo/Gs+CaiMJG+I11JgXqQeuVLfz3u5
         lz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780270935; x=1780875735;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQEMX7KWl23YBEgF8/06My2SGYZpUwTggTcppY9uX98=;
        b=BIWNAgg6M8EExlPUZjL156jgN4BxD4j9Gu/i8xE5/YoAMCiWIX/EcNFRqQIF8gA1RS
         NVpYUvOVKJ71RzJBcq4vLMFs5ZwPzX8MsJZ4grV08YzbCaelOj5PClrRcysIE4CmZ0nb
         lQsWBAameAbTvG/3FKlB8nuSLcVlcV4v7ogbNonkwdJY/nYur7XFuGJVbFjSWrO4xQCE
         lg+vb/XTDczk4hqLMJqVsG5n8LWTEihlLOblSyYKkF2DenTOM96skwBTXLQzEHf1oW7c
         j5SRU0sWAcfq+KZdKa7xJea1bteWqXb3VbezeAbZwiLC5XiXC+8GTqfNZ539JV1Rd6yk
         V1MQ==
X-Gm-Message-State: AOJu0Yx7Ldi2xC+T5QqvPN1PA+xj4pP7psn4Y89w1Lu076WKm1MHG8ZD
	Jc8o3eG+pBirKPe8TJAcXA68w6/p/8B4hzDDE331D8AtuRHVUKqSk0pG
X-Gm-Gg: Acq92OEdCLUPtN7GzLkUlRXhuWaa4+6w1TU+mp8gsLD/uj7e6N79Z0Yx1dBHaOPYDG8
	hxDLWERabKRpHmNLVq94r8WWe6qo+v68rdKGKGZ/iAttru/eac/nUDrsARRFCMDpXtSGN7OtH7G
	q9zP2BOjth8n3TS+ybYUXiMM1A5l2KYNtjwAtI/52Nb/T/Z0PYjyPdm7gSIe3vkzCBG6f3IhuMB
	QOtOrKPuIl5lyNsZAWAYGJGt/1Cv2Z6cdbfendklfp6o0Ep3p1NM9lprObs6n/lYJWKc//L+y+8
	V2YQIS+ZbGQZp2i+UWktMp0ZCSJCsEZ0c+pI/JyYAsvR40NHo7EUOthCQPu6N4pkzC1PaTxWJRc
	TzN+MiyQJHNkoCQotF1T37H+oWu03njjIn48YynvNiAoGIUbo4FFbFEv+HEJ+GhhcBdrjjBtc27
	922vvJdCO2cecdJnU7wEOr8l9W7ng+4gJSQVLPbaNJCNVIfhD5jL05a7lgk9ijOJJzqFw/AZQNp
	fFNJMRTwEpv
X-Received: by 2002:a05:7022:671e:b0:134:cbed:2b35 with SMTP id a92af1059eb24-137d3f1515emr4203230c88.18.1780270934712;
        Sun, 31 May 2026 16:42:14 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b2d04287sm7390147c88.0.2026.05.31.16.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:42:14 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sun, 31 May 2026 20:41:41 -0300
Subject: [PATCH v2] ALSA: seq: Use flexible array for device arguments
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260531-alsa-seq-flex-args-v2-1-6e068d4ed9b0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Myw6CMBCF4Vchs3YMlEvAle9hXLRlBmqAYgcJC
 eHdBd24cPkn53wrCAVHApdohUCzE+eHPdQpAtvqoSF09d6gYlXEeZqg7kSj0BO5owV1aARzk1o
 uM+LSxrAfx0Dslg96u39bXuZBdjqkY8HB9zi1gfQPrqp/+JxggsakzLktVJ1V16bXrjtb38O2v
 QE+nSXtwAAAAA==
X-Change-ID: 20260531-alsa-seq-flex-args-5b3cf84ef8c0
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2468;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=0ELhwdUVsobKhtLRouvBFWIF4j4psupIKOVxO8BCN8Y=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFkyx0PY1VpmTpFQYH4UmfPyaFHbM/uX1d1b3m1i1W+sN
 xDzeXCmo5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACby2ZThf24GS0DO12VvQ3Ue
 TX9z06E19A63or2b4xchXe2CnFj2y4wM69pOyCS3aqnfPtZhu6007m2HseJp8XPlTy3LMjr5tR5
 yAgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_seq_device_new() allocates struct snd_seq_device together with a
caller-specific argument area. SNDRV_SEQ_DEVICE_ARGPTR() reaches that
area by adding sizeof(struct snd_seq_device) to the object pointer.

Make the trailing storage explicit with a flexible array and allocate it
with kzalloc_flex(). This makes the object layout self-describing and
avoids open-coded size arithmetic in the allocation and accessor.

Reject negative argsize values before calculating the allocation size.
Current in-tree callers pass either zero or sizeof() values, but the
function takes an int size argument and should not let a negative value
flow into unsigned allocation arithmetic.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 include/sound/seq_device.h | 3 ++-
 sound/core/seq_device.c    | 5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/sound/seq_device.h b/include/sound/seq_device.h
index a72380c202e9..3137d4c5f5a8 100644
--- a/include/sound/seq_device.h
+++ b/include/sound/seq_device.h
@@ -22,6 +22,7 @@ struct snd_seq_device {
 	void *private_data;	/* private data for the caller */
 	void (*private_free)(struct snd_seq_device *device);
 	struct device dev;
+	unsigned char args[];	/* driver-specific argument */
 };
 
 #define to_seq_dev(_dev) \
@@ -64,7 +65,7 @@ void snd_seq_device_load_drivers(void);
 int snd_seq_device_new(struct snd_card *card, int device, const char *id,
 		       int argsize, struct snd_seq_device **result);
 
-#define SNDRV_SEQ_DEVICE_ARGPTR(dev) (void *)((char *)(dev) + sizeof(struct snd_seq_device))
+#define SNDRV_SEQ_DEVICE_ARGPTR(dev) ((void *)(dev)->args)
 
 int __must_check __snd_seq_driver_register(struct snd_seq_driver *drv,
 					   struct module *mod);
diff --git a/sound/core/seq_device.c b/sound/core/seq_device.c
index 1b062d6b17ea..8be1f3ab5b63 100644
--- a/sound/core/seq_device.c
+++ b/sound/core/seq_device.c
@@ -234,7 +234,10 @@ int snd_seq_device_new(struct snd_card *card, int device, const char *id,
 	if (snd_BUG_ON(!id))
 		return -EINVAL;
 
-	dev = kzalloc(sizeof(*dev) + argsize, GFP_KERNEL);
+	if (argsize < 0)
+		return -EINVAL;
+
+	dev = kzalloc_flex(*dev, args, argsize);
 	if (!dev)
 		return -ENOMEM;
 

---
base-commit: 5fa82dd6492e9ac3ab27d2c15d73b601b4e6a87d
change-id: 20260531-alsa-seq-flex-args-5b3cf84ef8c0

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


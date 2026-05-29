Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777221A6801
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060369; cv=none; b=M5Tsdo7ahJABXkurjuUqCZuE+rkrO5qYoYGRbXz8zAeukF01gUz8y+7kt90t2jk17JhTf6dqLisJcKiGzu8+CNBK+wl43NBLsStJuLY6a1mFsyLWvERdBzdXnYMI+N7CoQ7D7r3riEbocaRjXuOH1hBLqYCjv2zPeaGLpCiZFRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060369; c=relaxed/simple;
	bh=ou2QGsSQmw8iWrsFpYfa0TERZ2fHNFeLR8NsR1l532Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eVH7HTArgpQMTxK3IDs/uA1rdbnKy9tSExYykRAaEVGuDfKOdVRchXWYdQUhfOZk/EDoeETHVcMpcdQug/AGkduGPotrn16mUYt14DPM7VUJB9deTpzt8AKB0j1Ylu35FONuEy4VzV4YBAZg3rPd9TAbqChTy1dZ9DBBuSWmLFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAeenBHS; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAeenBHS"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304b8ced372so4492819eec.0
        for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780060368; x=1780665168; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jq4/9wTNUEbdtC/nlWbxLHnYx9TMtmlwe9oZzZSkiK4=;
        b=FAeenBHSovJf472LnXE5eKIVW3nbDP+W0vRfw3xO5yVhdpgNLKEhJ1/uD9ghZhBUTm
         DXHpbJImgVut90UsEDnQrGdpi/eXnUCGfbp76KoyEQpDR5wZSgXuNSa45qpTwrrUp0Np
         Go5hfvhXq24tdIJkilJV315vPoMSsJAtXMU8rTMxHLFfZzYh/kInsm2JIuMvT92Xbzvm
         sJZhyU/w0jkZcHNnjX1ZjZduJzUYCzf6NfDLLck+gOoqeUbEfvxdIexn1qL2xq5uLXTq
         jmcLP5X5WbQiWH+jdXIuMIylhFULDRL6W6r4BRUCPmDLPmPLjUthPCFI/1fUsJaSN+qg
         iQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780060368; x=1780665168;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq4/9wTNUEbdtC/nlWbxLHnYx9TMtmlwe9oZzZSkiK4=;
        b=NnQ3jpaNicaaWlt+ha7ENV20hlUeP6VqAwE5ToL6wxfJW/zNfMp1igUBWGBgYtu5cB
         X69GXmmqnVYW7W0hYAC4rrXlQuRrUuOfqq/mPMBOnZ1dJmMcldgNY57KPpxskgjqv4a+
         ikRCEryGdvQfVXDzLAuaMYySNntEfv5lTxL04TFb9JNOofoeHksPh+mIISOVQHAna/Ef
         /4ZZqyGN/fR+tg0vwgmGzHwGL7ksLuukLv5PYy2bDfJ7h6PHtkfxgthAu37WtlO/AdhB
         Nay2U7xRjRws340ZgtawVERAZI0ESPlHtRksui5WM5BzBuaRDX2Bz49EoQQrhh2wvA6X
         kdKw==
X-Gm-Message-State: AOJu0Yxcs0dXIKuRFeFgPrra5Eb1OnAo1Dnq1sxgZ0zw2s43RY37rWja
	+tbO/jhAIGEdfPlIl1Sg8Zv9EGfKu3RGAnYejL9bY/D7GyNv+DtJ2J45
X-Gm-Gg: Acq92OH81hhnT3KMli0VJSoFAqKUQnw3mmTJPd4AS52aZkm1dwBbptrNyoBcC2BlTTq
	itHKHfHDiI9KGGfShrt2Qkmb/1SNRuy0NBXOi3C91sZUW1Fm9iX3kESC7rDgxoYQiZb57GVpaYO
	NIRMySLfpPuXearvDJ3yD+ArEKnErGEVKMeFmuTsM9/Knai2aquQJuGS61Xe9LQ04b0KWgBjZEk
	pIrIvgqH3qZcSorL39RpSS+aPqaI2ukmMC849Kf2rhQIiSompJFu+0ecM0K/5a8i897Y4cmRryk
	pqqUQUlUQyZjK8+G/Cj3wu9wTgrAn+FCOreR3XgtEHzxoJbbufD8M2GFSnvz76Q4iMHcuwCTTm6
	mMmbkKXdak6HIdMH0xgQNb+W7gFcuk+UfZfSTeo20L3W2Kuj28d2hY+/yr3pIMYI7mcLgCWb2PF
	Q+s6hsbdV626axRdu4UmHR2S8kbvX/D8uottZy5yL0sHBO3rWadidF9V150OBnFd7UheV/HlVz/
	mnTYc7/FuLp
X-Received: by 2002:a05:7300:f10c:b0:304:de26:3cb6 with SMTP id 5a478bee46e88-304eb1cfbbdmr1326606eec.23.1780060367455;
        Fri, 29 May 2026 06:12:47 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ee0dd6fdsm1134768eec.23.2026.05.29.06.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:12:47 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 29 May 2026 10:12:39 -0300
Subject: [PATCH] ALSA: seq: Use flexible array for device arguments
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-alsa-seq-flex-args-v1-1-bb3ff5c62d49@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqEMAxA4atI1hOohfp3lWEWqUaNiM40KoJ4d
 +u4/BbvHaAchBWq5IDAm6jMU0T6SqDuaeoYpYkGa2xmnM2QRiVU/mE78o4UOkXnfFkYT56aHGL
 4DdzK/p++P4919QPXy32C87wA6gGd4XYAAAA=
X-Change-ID: 20260526-alsa-seq-flex-args-55b980babad7
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2486;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=ou2QGsSQmw8iWrsFpYfa0TERZ2fHNFeLR8NsR1l532Q=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmSE87WqkkftWWMvt2fWvO8R8bGINBYV0DZiDlGJEzNd
 1rJ/qyOUhYGMS4GWTFFltVJiyz3dD24Wh+3wgNmDisTyBAGLk4BmAi/EiPDiz9qW8sm5n8ysBDX
 7xJbKitQu986xmNN5pSILIP2zX/OMTKs5KxlSlhUFBzY6KTPs5cli+3r30mXRL+YdEx63iMtups
 PAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_seq_device_new() allocates struct snd_seq_device together with a
caller-specific argument area. SNDRV_SEQ_DEVICE_ARGPTR() reaches that
area by adding sizeof(struct snd_seq_device) to the object pointer.

Make the trailing storage explicit with a flexible array and allocate it
with struct_size(). This makes the object layout self-describing and
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
index 1b062d6b17ea..a7b69ff07261 100644
--- a/sound/core/seq_device.c
+++ b/sound/core/seq_device.c
@@ -234,7 +234,10 @@ int snd_seq_device_new(struct snd_card *card, int device, const char *id,
 	if (snd_BUG_ON(!id))
 		return -EINVAL;
 
-	dev = kzalloc(sizeof(*dev) + argsize, GFP_KERNEL);
+	if (argsize < 0)
+		return -EINVAL;
+
+	dev = kzalloc(struct_size(dev, args, argsize), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
 

---
base-commit: c784d0e6a62abbd2af58bbbe2d20f88dd550e3eb
change-id: 20260526-alsa-seq-flex-args-55b980babad7

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


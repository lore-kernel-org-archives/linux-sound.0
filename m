Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982756;
	b=TYyH8hlP5SZZTE8F24ARpRtQ7lCdPzd1s8e9UmumWBUyZMdXs+9m6NcNADdDMyXUnym5
	 +J1s3I/JIWpqJw+roZVKYTz52OdyySUm3m4lT12UTp2crAKoOOKfzjsUtoMDBnXEbId7M
	 CjuJGKIvF7ESt8n4bzUzuRhviEuRVvbb0Ydy/2L0K5bVl1iS5U4KQUxKII6m7geAjfvtf
	 Brkrvunr6aZ0lDQO6WNDWx46tyj1bsTMQTTQvtt3okGgvpSSMqwkkQQX2rdXumrPzQrIL
	 zlk7o5FqauEHJ50ekE4V0gfnaSGCESjTYH1OZJnfVrLFv7T/VfHukkO6cBTUJq4jPUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iVze4EoEznv1pSQRdfnYpgAcgtm3yIuH2j+tghUB2a8=;
	b=SWQ6DIKa4CxC5RsSaTfCF0yIxERh10SaI2dPUu3jMBsjwfBP18B91CTVfwWEGIKChieq
	 /uiItZJakGtFLEDZRkQoRjpa1fy6vApJBwlQ/GxWT3zYqRpg1YLTqCkFVz8pSRFLExF7x
	 JFv+Xado+rik10rE9pxp6AzPnNU9jmqhcaiDkb4zIgYX7BcxaH9FDNQuNdbqprcJF2hBz
	 tyvULmga66NHq0Rz+RRHyiGfMTy7xgvJTSeGnjMNRvpyxfQXQ6p0NMDq57RVBAplGV4ms
	 KZqlS2XOLFxpcWkgQYJbGQ1x5KxNRfMLWyNvGkp6KFaHS5XC/konWQkKBfDXROT9m3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMSJOiRW;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173AA606EE90
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 173AA606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMSJOiRW
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-82109f51565so353883a34.2
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982755; x=1794587555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVze4EoEznv1pSQRdfnYpgAcgtm3yIuH2j+tghUB2a8=;
        b=eMSJOiRW9TJ6ZNWttv7cuO89KizEVaQb3Lrp6t3QvqYGXZUzMUqU8yRUGjZbdTUA/a
         XlKyAKZLiFNVewmpqG0NTQELlotIuyjupMT0QLLMhoDTLJ3B4qSPpTI3orQhQiTkeLaO
         ssBOGDRhAb308hEo1gkdT0+GF8WqwAdW974YkcVUjsC2wR0eYYWICAGRedSjPHAo76gS
         5Ahx4c44V0vJRAkRLsoBbK1oPQ7J0L+Zc3vzZ1hUQtJRLMm/l2JMDFZtiUfQL0UUxe2x
         RL7S8TB/HyyrCFpyPlCm9Jhoow1XQQ+hLUiFFjV/3c1ZVsuBafY+I8HvzIgXpSSSu34O
         6gXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982755; x=1794587555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iVze4EoEznv1pSQRdfnYpgAcgtm3yIuH2j+tghUB2a8=;
        b=2AAm3agjAdPKKVQ4pAbsZzHLRmYm+NiLQB7tZGLZNnx5ihoXR02pgTfobJC+AScuJ6
         g6RTmxTDzJwXsXP3XUQz5tr276RMZeJsUAHS7OYbvcFYM521CEhzYQXxfHgjq6y8g5DV
         BytqH9sxHiDqERKjiCeFiLBX4mWmFZOS0J9AVkai88CocGMSZXIbRqnmsOGI1PhMbC2W
         D2InwQearGNQQZ3lmBOKpRzIMy4TWQWXJvK0xwlcUluCEm2EMIPbX8V5flk23s8kbbiI
         IOUVOZGl3eDs0eu7Vsd/8CkhB4g3ykMsP4N5ogOdA80SebPg0zkVH7l7K8SPrAoE5QM9
         FihA==
X-Forwarded-Encrypted: i=1; AKwUvBzAY2/9nRwfN+E5kH9b4AuXbzBgvRJtxCLdmaUMbJ8A6v0a+EPwaadrpl7Mt/sVrvNYB2i2KqlN1bKnmQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z95puqXnYRYx/lcP5mj+GLu6qrDg5Es2n9ysynTDtgLZxdBpRr+
	fgy6OuY/CIOMY1LQ5EftrGVd8ljrXLtxwu52CktigScZbYR5rlWMScMLv8ZMRQ==
X-Gm-Gg: AYBFou1gCbo9izwWl5lsl3sxmBbPuQge2a/mcLe8DuqM8itkH0NHRb6Okr7kGpSYhTH
	lm5AYr9Ir+z996+MqKo9LsyIaW9e42vZg0kEGWzonVIozYox5wRZQIth67m7hfWxharnmSsZyv7
	9vp2xhqGl0Wkb7eNMhu9a6z/lheIduKVlKl2tQoai6bEMsrKZhifPcAxqHSnYxJLjlokBsqXD9d
	fO73OfbnOEx7VBlCF4KMYY8B43UTjcvSRmFNOkiMQs85xHkXGDAmV4p7Z0IaHSU6WqhnGBpMfV9
	7SKHcMeHt/VbS0rYmLWtPvKlUpjVGoS9nAgBdnL4cW6TvEPTIan4czmCmHwLhgi/WKcEt84/cZw
	wiElw7pZZ8I7kKzJ/Rs8EGCZXt/bL3vhwlyxNL6ScFvcOjLnrQPng9t27o4pjlZqpFKSasqMSUd
	lLmk5B9m+8LJGJLkKZZABbbmhBL9qoKROX+Lgmmua+3txqbL9jgzLaMq+AudI/7LVR6C7MCfdXw
	f0JRILbtcSfEKC96Lk5FTxlSd0lmLRsMebDRpPqRqko2vDpeJtnDns8AAtcnR/6YNzQC2sU7PPe
	qcWnsMv33bgxx5P61AVBJQ2uNd+wSE/lGTVRiQZmJF1Evw==
X-Received: by 2002:a05:6830:270a:b0:846:5d82:8b69 with SMTP id 46e09a7af769-85f1cf96eeemr2950818a34.20.1793982755020;
        Fri, 06 Nov 2026 08:32:35 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:34 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 11/16] ALSA: mixer_audient: Create matrix programmatically
Date: Fri,  6 Nov 2026 10:31:24 -0600
Message-ID: <20261106163129.1006907-12-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christian Ruppert <arc@gmx.li>

Most Audient devices seem to have a similar mixer matrix with many
identical channels. The only difference between devices seems to be
the matrix' dimension. Create it programmatically in a loop rather
than from the controls table.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Co-developed-by: Will Porter <mrwillporter@gmail.com>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 sound/usb/mixer_audient.c | 77 +++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index f7a422392ed1..f15f96a8b7d2 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -105,7 +105,7 @@ static const struct snd_audient_ctrl_type {
 
 
 struct snd_audient_ctrl {
-	char *name;
+	const char *const name;
 	enum snd_audient_type type;
 	unsigned int channels;
 	unsigned int hwchannels;
@@ -134,48 +134,6 @@ static const struct snd_audient_ctrl snd_audient_evo4_controls[] = {
 		.hwchannels = 1,
 		.val_offs = 0,
 	},
-	{
-		.name = "Mic 1 Capture Volume",
-		.type = SND_AUDIENT_TYPE_MIXER,
-		.channels = 2,
-		.hwchannels = 2,
-		.val_offs = 0,
-	},
-	{
-		.name = "Mic 2 Capture Volume",
-		.type = SND_AUDIENT_TYPE_MIXER,
-		.channels = 2,
-		.hwchannels = 2,
-		.val_offs = 2,
-	},
-	{
-		.name = "Master Left Capture Volume",
-		.type = SND_AUDIENT_TYPE_MIXER,
-		.channels = 2,
-		.hwchannels = 2,
-		.val_offs = 4,
-	},
-	{
-		.name = "Master Right Capture Volume",
-		.type = SND_AUDIENT_TYPE_MIXER,
-		.channels = 2,
-		.hwchannels = 2,
-		.val_offs = 6,
-	},
-	{
-		.name = "Loopback Left Capture Volume",
-		.type = SND_AUDIENT_TYPE_MIXER,
-		.channels = 2,
-		.hwchannels = 2,
-		.val_offs = 8,
-	},
-	{
-		.name = "Loopback Right Capture Volume",
-		.type = SND_AUDIENT_TYPE_MIXER,
-		.channels = 2,
-		.hwchannels = 2,
-		.val_offs = 10,
-	},
 	{
 		.name = "Mic 1 Phantom Capture Switch",
 		.type = SND_AUDIENT_TYPE_PHANTOM,
@@ -193,13 +151,27 @@ static const struct snd_audient_ctrl snd_audient_evo4_controls[] = {
 	{ 0 }, /* sentinel */
 };
 
+static const char *const snd_audient_evo4_matrix[] = {
+	"Mic 1 Capture Volume",
+	"Mic 2 Capture Volume",
+	"Master Left Capture Volume",
+	"Master Right Capture Volume",
+	"Loopback Left Capture Volume",
+	"Loopback Right Capture Volume",
+	NULL
+};
+
 static const struct audient_devinfo {
 	u32 usb_id;
 	const struct snd_audient_ctrl *controls;
+	const char *const *const matrix_names;
+	const unsigned int matrix_channels;
 } audient_devinfo[] = {
 	{
 		.usb_id = USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
 		.controls = snd_audient_evo4_controls,
+		.matrix_names = snd_audient_evo4_matrix,
+		.matrix_channels = 2,
 	},
 	{ 0 } /* sentinel */
 };
@@ -692,6 +664,8 @@ int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 	const struct audient_devinfo *info;
 	const struct snd_audient_ctrl *ctrl;
 
+	int i;
+
 	for (info = audient_devinfo; info->controls; info++)
 		if (info->usb_id == mixer->chip->usb_id)
 			break;
@@ -706,5 +680,22 @@ int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 			return ret;
 	}
 
+	if (info->matrix_names) {
+		for (i = 0; info->matrix_names[i]; i++) {
+			const struct snd_audient_ctrl c = {
+				.name = info->matrix_names[i],
+				.type = SND_AUDIENT_TYPE_MIXER,
+				.channels = info->matrix_channels,
+				.hwchannels = info->matrix_channels,
+				.val_offs = i * info->matrix_channels,
+			};
+
+			const int ret = snd_audient_add_ctrl(mixer, &c);
+
+			if (ret < 0)
+				return ret;
+		}
+	}
+
 	return 0;
 }
-- 
2.47.3


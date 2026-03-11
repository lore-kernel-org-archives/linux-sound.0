Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ABA3A3E8E
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 23:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773271689; cv=none; b=FsfUlRSclELKJlODb50tX3irbkwno5MTn6wLEYP+ZpMMP8nwT4tShxyuZuOesKDedcBEncopi9t3mwEGyzvXXoe00vDtawAuEZg3efKQVfEzXNvDXC9j/Jz3JtY3BfeEJYjxD/PwPWK6MjDe2hHlefGisysgbD7n4J7BzLAgGok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773271689; c=relaxed/simple;
	bh=HcXPROi2lYohHg/i7gouZwm9pZRkIM+0VpiH8CT13TA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gG7aS7/XyXb/eFcbp23E2IpfW9Llde6U1/YmuT8VWHeMWNQc00kZeyMALdrMFeVqV21FGfrqmBVC5kKe8eII9JXMziQ86rfpj3HUONOfYJcYV9MtQST4ylYgvkXIP0PVCkRL9ZSJw6vn2OS4HdEwHRFUqrv1wV4jfZ7NelOZvpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVB1ouDQ; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVB1ouDQ"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso567611d50.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 16:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773271687; x=1773876487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6umOY7Bo85W9cfI2XbKfknuvsPGqv1vFRKnZ6BmR33I=;
        b=YVB1ouDQHJuPq4XCTubnee0/P0BxX1j7JuVaXhs5goEqcPcLNPL971mHMjqzHr15vt
         h9crfzm1fqWr+33+mLZarkN+o52RsLnBgdvXDm7F5S9Uz+S/zRpedFQWAJeu+sNTxl/2
         l/qd+q24Jgx7WE0VhwDDYatbuLkkiDgDOS1NRhoHRaP5veJbqenTuuVxYNDYPesMp54Q
         Nh2Fv5fQ6jnSrBn3pioI5sp8ucLNpij23w3VYeGAkku7Wby7IViuxF7SbbUPx11m7diM
         AwLt4OLJewpe/jBfEK6hH+cxuChX6EH7hCi5/Nvl7ZTnjjdFFi8wUa1jxdq+0jPUlo98
         7tlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773271687; x=1773876487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6umOY7Bo85W9cfI2XbKfknuvsPGqv1vFRKnZ6BmR33I=;
        b=VkcAcjfSXT8e67cOf7DKyUHk2AZDIRbHe+cCulGqQjaIz7ziWf9YNQSjb77uVN4BA4
         V4e+gsjPZfKoYsAY6jMZR3fxDXf46NgitaohJqTNQbtPNUJXjsIgex+pUIHkJIbdgepl
         EOZLQb3hWtQ4n0JLWKy4rykBzE4R6qmJauxlgAdaNUKjDOxUR9gT2H/syKQU/86nosxc
         +ZK+kx/q3JvjGYk87DpNiq59gU3LmlRB+8EW7SBSx0GETPt7qAhVwLf7W0E4k4JWQdQ1
         bPuwYDgq53KtrrtvZzkGiS2KQJS7hRPJRp2rsGznKvvA5O+og1jZidZ8armK81FEFlvV
         bHug==
X-Gm-Message-State: AOJu0YzpbX40Rg8LS5pRp31pEkRHZJ5/gyujqNkrE7poF/Ie/fdMP31g
	SexcrnlCKmFjjx7Dbw2jaHnmCNnHva8Ns8RkTO9HuFt4y9ECCbZLogTkd8yR2gHq
X-Gm-Gg: ATEYQzzePw99aD5uW3YDCZr6ux8whFzN20LtdRJoW54LSw/iDH4iuzZVSF25b73g0dr
	nDo7gcad0IEt8qTg5ENURUUkNoM0MV4mq9hYuUDi0Zr2nUC2+3082EKrzswdq2ugIC99VApyXMZ
	qLoV8zB/AvPyQFpHxmegKxt0ovePv1bO7cncwqDj0Wt4O10yrIHMj50PU5zZ2Jc4av+U6PrmPKJ
	a1iEYsETu+tJY/FNrSKcl3cXs8iQO2J5+QT9qOy5Vxjpmu1fqCaMobo+bAWmfuwPmLkHwDnRE3+
	lQ45OnGSnpy5Fm4n5/DEvj5lL3AG0Bv54IBIM3UbugFYXhzSoKxXjLec4OQx3upX5FxgkdTN5f1
	bUv6etz7q+Bzstm7JWJ8HGIZeg67Mi4eGkZTgcXARrDBpPVHf4oAFRWSMs7G4U3nzOVqn6Jx3cd
	I7qklhjmsPHyhcLFuPo9uX8dEGV8sdshZDT7raYOkMfvMpofxIg40NGQ==
X-Received: by 2002:a53:e203:0:b0:64a:eca0:35b7 with SMTP id 956f58d0204a3-64d6583127amr3097911d50.77.1773271687433;
        Wed, 11 Mar 2026 16:28:07 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d6504b0f3sm2221061d50.2.2026.03.11.16.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:28:07 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ALSA: usb-audio: use kzalloc_flex
Date: Wed, 11 Mar 2026 16:27:48 -0700
Message-ID: <20260311232748.18697-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Saves one allocation by using a flexible array member.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/usb/mixer.c | 22 +++++++---------------
 sound/usb/mixer.h |  5 +++--
 2 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 7007e0c9489b..337815b9e72c 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1393,7 +1393,7 @@ static int mixer_ctl_feature_info(struct snd_kcontrol *kcontrol,
 		if (!cval->initialized) {
 			get_min_max_with_quirks(cval, 0, kcontrol);
 			if (cval->initialized && cval->dBmin >= cval->dBmax) {
-				kcontrol->vd[0].access &= 
+				kcontrol->vd[0].access &=
 					~(SNDRV_CTL_ELEM_ACCESS_TLV_READ |
 					  SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK);
 				snd_ctl_notify(cval->head.mixer->chip->card,
@@ -3006,15 +3006,12 @@ static void snd_usb_mixer_free(struct usb_mixer_interface *mixer)
 	snd_usb_mixer_disconnect(mixer);
 
 	/* Unregister controls first, snd_ctl_remove() frees the element */
-	if (mixer->id_elems) {
-		for (id = 0; id < MAX_ID_ELEMS; id++) {
-			for (list = mixer->id_elems[id]; list; list = next) {
-				next = list->next_id_elem;
-				if (list->kctl)
-					snd_ctl_remove(mixer->chip->card, list->kctl);
-			}
+	for (id = 0; id < MAX_ID_ELEMS; id++) {
+		for (list = mixer->id_elems[id]; list; list = next) {
+			next = list->next_id_elem;
+			if (list->kctl)
+				snd_ctl_remove(mixer->chip->card, list->kctl);
 		}
-		kfree(mixer->id_elems);
 	}
 	if (mixer->urb) {
 		kfree(mixer->urb->transfer_buffer);
@@ -3652,16 +3649,11 @@ int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif)
 
 	strscpy(chip->card->mixername, "USB Mixer");
 
-	mixer = kzalloc_obj(*mixer);
+	mixer = kzalloc_flex(*mixer, id_elems, MAX_ID_ELEMS);
 	if (!mixer)
 		return -ENOMEM;
 	mixer->chip = chip;
 	mixer->ignore_ctl_error = !!(chip->quirk_flags & QUIRK_FLAG_IGNORE_CTL_ERROR);
-	mixer->id_elems = kzalloc_objs(*mixer->id_elems, MAX_ID_ELEMS);
-	if (!mixer->id_elems) {
-		kfree(mixer);
-		return -ENOMEM;
-	}
 
 	mixer->hostif = &usb_ifnum_to_if(chip->dev, ctrlif)->altsetting[0];
 	switch (get_iface_desc(mixer->hostif)->bInterfaceProtocol) {
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index 167fbfcf01ac..30dd30b925fc 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -19,8 +19,6 @@ struct usb_mixer_interface {
 	struct list_head list;
 	unsigned int ignore_ctl_error;
 	struct urb *urb;
-	/* array[MAX_ID_ELEMS], indexed by unit id */
-	struct usb_mixer_elem_list **id_elems;
 
 	/* the usb audio specification version this interface complies to */
 	int protocol;
@@ -42,6 +40,9 @@ struct usb_mixer_interface {
 	void *private_data;
 	void (*private_free)(struct usb_mixer_interface *mixer);
 	void (*private_suspend)(struct usb_mixer_interface *mixer);
+
+	/* array[MAX_ID_ELEMS], indexed by unit id */
+	struct usb_mixer_elem_list *id_elems[];
 };
 
 #define MAX_CHANNELS	16	/* max logical channels */
-- 
2.53.0


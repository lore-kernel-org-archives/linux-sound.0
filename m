Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743031;
	b=1Y42CS3+WcxsG7MG/XN+3rio/rIA4ssakobJ8hcKlQ2xolJuyP63P6kbTUk+3AItjasX
	 pVypvY8FYEuSVRbQhTo5j5MuzVnLWTqcuHrpsCUcd+tDTPfkyVo5npHNnQx4sjZkxg2s1
	 6dij5i+D2i12MoTWsno1dL2AydhyZIZao3FzwerBwrf/rQGtTYkj1gtkbm/5GGk7YYmXd
	 vGxP4SeOKElCgpmWSfQAYebL1Oa5QDRm08Rq2PNs+iBtj6OaQa/qS8aAFq6X0Ytv22IY+
	 0+bgyI3BsyyQyd9C6bljKbBrSNFqHgsgUuvVfFRb8mXlS3fSohA1ZMi2KvgxF2NCYFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lqTFv9E4nyWFkXQYUk6tdfKXwnxXWSjIz1gt7qDbw3I=;
	b=MipmzjcaMdFE/oEnLOD7yze08PK8xbMBqehFnwrOFvhVTTjQiupnV4KHZFhTTVnfrkFW
	 a+6NecpezlpVYEWEpXqXUfNRHhKptuRsfg1CH0ggeyCO3Ro61/GlRXpk4Un1JL8JaWt6A
	 ruo+Fun7vSKO1ICKxGcn/VAUHtzoT2FtLGkSx0vH3cpDVvq5CJ1x2q7bteH6LTdcoF+Yt
	 yRG1QFl3NpZ3G1uK1/XyVOXTfsoOqo9kix4hExdoKIQOfZUmmx5QX2J8DaP/uWqWt9Lzn
	 PurwE/WY/G/sqAj/7RyCcJTzNfFBsvA7tqkklm5CdLVjlb9mtVXxgGC34K7hAnBHFeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xN570IeF;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45BD606A31E
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 11:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45BD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xN570IeF
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3304176eec.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 03:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743030; x=1795347830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqTFv9E4nyWFkXQYUk6tdfKXwnxXWSjIz1gt7qDbw3I=;
        b=xN570IeFdWn17Jz1ucA2i/9F+gQiXj7aaQUpaqDnL9XQIsspqpYcM/RplzDeh3Yjat
         fo8Z6vJPuYY41XePwu22ZRxRWDOyPOh7tdXSv64yd07M3L+vShJaiTIWa5XhPPKq+rEu
         2T/VYl0fZO3Cfhi5YOvdkE/WzzRY3DRD48gsEC+ZiruDpiBKwHdq+xe1Qq/9sc1sziva
         H0HH5xu8TpeRKXNwIKywb5muv1IekvrX8Alh49G/FHWeDJSv7UZltMCtZdu66oRnMQkh
         d6ZJcrHyMJUD7ja4h/GP2eLF8h/BonpP8w/DdQfXT8ndEDbYkiLENtKusVaz99GNhUQC
         JjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743030; x=1795347830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqTFv9E4nyWFkXQYUk6tdfKXwnxXWSjIz1gt7qDbw3I=;
        b=mtjFAB63xg+qyNs/QFNfaX2MMPsHBmFK2lnGjaa97P7pw78YB9Dn9DrdQxkwcq9KkZ
         64YblCiBC+Dfmu1W8xqJHFRhSUX0NjgYkzVB1Ites5pKLZQw8t0CncPE4wvvdBMKvHYl
         ozPWDajZmayARWzPSRCX+zEu273H4tGeu1MlDKclXxL7ZkV5eKYcAVAA7YYDZ6++BXyY
         A6ZsZGGJ/fOFAIvc7Z152k+ntzix9UCMv4PgkKD2Du2jN8wrwihgH8QxyOPBITZkcB6l
         dcRkMiYABku8E5r1ipjTHHz6hgQwWjXuXBQ3/jHUgiSfrVnYl+1/ZtR+cHBbxYVEpAO5
         IPLQ==
X-Forwarded-Encrypted: i=1; AL+hErF9jsZ0/yOSwL4OE3hmt58h4aCREPpPloxLluOYKpOxHqWA2fXwEHAveRU2Uy8sTfmO5aKl8DS5rj0j1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+S0W/BWB+z0sOlNh9dJT0qsfvSwEXyZst3Mw3Tvg+nInj5ZM3A
	3+5D5mmjAXdT84gQjqiEajEXTJyZevOwXFo9IoMgqoc1eiGyFXiUgy8n
X-Gm-Gg: AYBFou2961nfC5+5LQEMI0eg7cL7DxP7ifb4ItFBzfN3ixBPebtAsCxEymMYQrY50IB
	8UNd+Qa7WQ9hUMjsRCffDS8EAF/sWJTX6APKpF0/IsCzlzQdhq+88UcAkh2H9OpGtksVDrtqiMv
	GRwOR+nGpm9K+7Eh4L+zNcjNSgQyx3KhkFdFEi/AqMg0KqwwvpFub5xusVoxUze9I8I0bW6kPFg
	p1fFu5Ffj4EoHotc3xp8CDiKP212AXO0TPMTY/uV1kXOqSXZoDhLA7pK1Jfmy7BrpsqWTYjlLpI
	1SrIIoKkxM3NZfKQS3LbLQultYnCPuqaFxE4eT6B0WS0v2QFglJR09l5n4PmksrlKqktGC1hCk5
	4I1xttjcsurnkaJrKk+4U4CsN3j6F8mV09mqYAo+tlJ/eKbo4P9q6zxEOw0kqCD9VqQ018WB5VU
	5rqUDPfZWjb9z9/JF9PX69Dno69ZHrSIgocaSlK6igL+X6Xx5kwEUdDkWXHX/yJuD5NKgUuYh+V
	Au4x0AZJPdgoj1YWwRiyV+kQ7OwzYQGLSa4b1URk3071eSK6Zt9TQzGOsYW3+C5uLT2A1m+D6C6
	KhzjqypUmdxka7xwJhXjxCpbcpgMwVM6cgBlW10MQp7RpWUA/MUn
X-Received: by 2002:a05:7301:da09:b0:36a:1434:c691 with SMTP id 5a478bee46e88-37967506836mr7857848eec.14.1794743029961;
        Sun, 15 Nov 2026 03:43:49 -0800 (PST)
Received: from localhost.localdomain ([103.178.204.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm35852392eec.18.2026.11.15.03.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:43:49 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: jack: Fix jack control cleanup on error paths
Date: Sun, 15 Nov 2026 11:43:15 +0000
Message-ID: <20261115114315.3679-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115101949.2483-1-sreekuttan2156239@gmail.com>
References: <20261115101949.2483-1-sreekuttan2156239@gmail.com>
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

snd_jack_new() creates an ALSA jack control before allocating
the jack structure.

If a later allocation or device registration fails, the
function returns without removing the previously created
control. This leaves the control attached to the sound card
and can cause invalid list operations during card teardown.

Initialize the control list in snd_jack_kctl_new() so that
the private_free callback can safely remove the list entry.

Route all failure paths in snd_jack_new() through common
cleanup labels to remove the control and free allocated
resources.

Fixes: 4e3f0dc65883 ("ALSA: jack: extend snd_jack_new to support phantom jack")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Initialize the jack control list to prevent invalid list operations during cleanup.
 - Handle cleanup of the jack control on all error paths in "snd_jack_new()".

 sound/core/jack.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/core/jack.c b/sound/core/jack.c
index af2dc2cfbe19..c35a92390527 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -487,6 +487,7 @@ static struct snd_jack_kctl * snd_jack_kctl_new(struct snd_card *card, const cha
 
 	jack_kctl->kctl = kctl;
 	jack_kctl->mask_bits = mask;
+	INIT_LIST_HEAD(&jack_kctl->list);
 
 	kctl->private_data = jack_kctl;
 	kctl->private_free = snd_jack_kctl_private_free;
@@ -555,13 +556,15 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 	}
 
 	jack = kzalloc_obj(struct snd_jack);
-	if (jack == NULL)
-		return -ENOMEM;
+	if (!jack) {
+		err = -ENOMEM;
+		goto fail_kctl;
+	}
 
 	jack->id = kstrdup(id, GFP_KERNEL);
 	if (jack->id == NULL) {
-		kfree(jack);
-		return -ENOMEM;
+		err = -ENOMEM;
+		goto fail_jack;
 	}
 
 #ifdef CONFIG_SND_JACK_INPUT_DEV
@@ -607,8 +610,13 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 #ifdef CONFIG_SND_JACK_INPUT_DEV
 	input_free_device(jack->input_dev);
 #endif
+fail_jack:
 	kfree(jack->id);
 	kfree(jack);
+fail_kctl:
+	if (jack_kctl)
+		snd_ctl_remove(card, jack_kctl->kctl);
+
 	return err;
 }
 EXPORT_SYMBOL(snd_jack_new);
-- 
2.55.0


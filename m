Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C06A49E5CF
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400783; cv=none; b=VFgWwfOHNl5GoY+yTCE3zhX+S1RQCRb2pJft8a1NGkvAapFcITC3KmQsUO0uUNZ4cSyJXJCtIYBWBXFavKXB0qpdBYMLHB3d71urrIQ7TBTgYTXAZq3xtZUkQKPuik8+t+wStH2DqSnJsVhs9Z2FGqkztLsOK5X0xpvNbrvCKDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400783; c=relaxed/simple;
	bh=+U4teF8i6Fb0geqZH054kb1FyRUedOBn7YjhBWvOJy0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pStAe3K5B/H/wbZKl+c4R0WDQdSs86GyNJyK6Co5m+XJDRkN211Y04rEbZzF4KCjOHq6j2aKLoze65kxCcgXltFlby3CHokNxBhPi+pTSOoQ/nP7r7sx61cVH7uFXJzcD+mkJVG4EiumgOhBMfyLDF9lenKXXlNnnujGmt6WyLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ba2DlKii; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ba2DlKii"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so417173b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 02:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792400780; x=1793005580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASZDQ6ya5uuN/oTp7B0NgsyhAiw0FV3QWvD7LJrp4wQ=;
        b=ba2DlKiiF18qrRrme1DwA2YXTK5eDRBBLfu0EB37HxFRJKeNMl5zfpV5vwLmcjodtz
         xfTmh2nPF6rdRtcbjsX9+WGgL8V1o0GvUD5cValFbmxxYtOOu2NaOj2bTKMnNdNzWGUB
         HqlaAHl8tNs/DSLZ1rkWEybOFfCsT1fVs2ZLkURWC4PKiI40w7cixjra3td6KlMRUUwG
         x0Aksd9tJ/ATYGsdDCh99oIh4vnZtmE6f9VlKMDUqgXH6Jfkfw4CCLEcPEf05yeuHqVI
         /4kBQXkHgldC1YZuNYddBmkWoFij+z0+FIuPPyr8Ck02WzuNvO0fEKwh10l7Ig5fLpPo
         HPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400780; x=1793005580;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASZDQ6ya5uuN/oTp7B0NgsyhAiw0FV3QWvD7LJrp4wQ=;
        b=dq/2cuzIquoMx0yQGUN8byXPmCI8+PkujWlTYG+WZDkXuOU5wQGVj8Er3K3YfQSqin
         aIK+ekzUrBxiHwNclIQ7P1SDurrBZrG1JUq89VLpF3kVSzeAa0Jb6VMSjVX3Rbb1a4CO
         A3p8aA7J5IoEaGC9jdxqiPBdkIFe/BQ0vheFNgtjLOrvi9EHdUPekPezaXW/ArWOcNY2
         7cSfltM+8pC1rXIcJxw+RX/7hT64YTLNMpu5dl5jWt05QCSmADp9xQlRARi3S1zppose
         65nVdHc2AAnEn/oz2rqzGVSChu150rbUZu9G3Kp3wNT4lGDBDKD90hY2rUIaeJ0qi6b5
         VEkg==
X-Gm-Message-State: AFq9FYIDsjGKCCFOrsRZ5pHhUf+rOeTxC+jXddMVVJuNQ6cCkuWpHNPd
	TSbQgOiWeBUVHM1Ib+JyH2jp6R9I2hriri46h8NKF5+5ehyqbUwzDoa7
X-Gm-Gg: AYBFou2ZZrW9rPuK7my6jRL5OXLwxyVjhlNyOfr9WJPqEdcnPvnAuG8tssgWzqu+ojq
	wdaWUbQ3dsR7sndpp+RN7FNJ2uQ1ZuYnVKMfewu9XlHBLPHIjcsy1U2+asD8I6fKog75H8VXyFw
	qeuZRLA3CmPmerweWoSlm/hDedlcSaNJELUfTR6qd/HyZvlPx7QdwL2AvXabxjG7QT9CwRHOiEK
	LCr7danOF1Bv6oXG0/AjfKVpkeSrEwkeMSN5sPpLGRg36r2JoHQHoczyT5dStMLD+lsimRJORaB
	UvvGM7Jt8zl0iX88UoOYSS2wtiuUCANHIO6l6lS3RPD5RMSMTYb9b5OgGX7F20Cql9mFA2IjsgP
	h7dGc2GC+QhGYTlDBEQhgS6WePOkBotrlxFQA/nCZam0OIcoSO80Pg3+FOSVCj6wC6acHipx0Iq
	xAHqyBb/YcsR1pW3ERIKLkciuPzPHf+u66EnPmp+zrf23MobJFXw0WCWJggpiRKnE6G6g=
X-Received: by 2002:a05:6a00:1492:b0:873:e3b4:5d4 with SMTP id d2e1a72fcca58-8a04a44baa4mr5431635b3a.2.1792400779717;
        Mon, 19 Oct 2026 02:06:19 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a056f3f2absm1797581b3a.25.2026.10.19.02.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:06:19 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: aloop: Keep the timer source alive until card release
Date: Mon, 19 Oct 2026 17:06:13 +0800
Message-Id: <pm-pmb-71a33a26d68356e3ade7-v1-108d86919c5c92fe1ea8@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The timer_source string must remain valid while PCM opens can select
and parse it. loopback_set_timer_source() allocates the string with
parent-device devres, which can release it while the card is still
registered.

A successful nonempty proc replacement after snd_card_register() adds
the string allocation after trigger_card_free. Unbinding the platform
device while snd_aloop remains loaded releases devres in reverse order.
An open for an unused cable can run after the string is freed and before
the card-free action disconnects the card:

  Device unbind                      PCM open
  devres_release_all()
    free replacement string
                                     snd_pcm_open()
                                       snd_card_file_add()
                                       loopback_open()
                                         loopback_snd_timer_open()
                                           loopback_parse_timer_id()
    trigger_card_free()
      snd_card_free()
        snd_card_disconnect()

The parser can then read freed memory. KASAN has reported a one-byte
use-after-free read in strchr() from loopback_snd_timer_open(). The
cable_lock mutex serializes explicit replacements with opens, but
implicit devres release does not take it. The card and module references
held by PCM open do not retain this separate devres allocation.

Use kstrdup() and release the current string from card->private_free.
PCM admission already retains the card until each file is removed, and
card disconnect drains proc callbacks before final card release. This
keeps the string alive across admitted PCM opens and preserves the
cable_lock serialization of replacements. Install the callback before
the initial allocation so probe failures also release the string.

Fixes: b072e65aadd6 ("ALSA: aloop: Allocate resources with device-managed APIs")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 0aaa64b189daef377f080a63665a9be9036e9d9c..aeb8a57684bd2176449bbfa2abe3383a3420ea0b 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1897,13 +1897,10 @@ static int loopback_cable_proc_new(struct loopback *loopback, int cidx)
 static void loopback_set_timer_source(struct loopback *loopback,
 				      const char *value)
 {
-	if (loopback->timer_source) {
-		devm_kfree(loopback->card->dev, loopback->timer_source);
-		loopback->timer_source = NULL;
-	}
+	kfree(loopback->timer_source);
+	loopback->timer_source = NULL;
 	if (value && *value)
-		loopback->timer_source = devm_kstrdup(loopback->card->dev,
-						      value, GFP_KERNEL);
+		loopback->timer_source = kstrdup(value, GFP_KERNEL);
 }
 
 static void print_timer_source_info(struct snd_info_entry *entry,
@@ -1934,6 +1931,13 @@ static int loopback_timer_source_proc_new(struct loopback *loopback)
 				    change_timer_source_info);
 }
 
+static void loopback_private_free(struct snd_card *card)
+{
+	struct loopback *loopback = card->private_data;
+
+	kfree(loopback->timer_source);
+}
+
 static int loopback_probe(struct platform_device *devptr)
 {
 	struct snd_card *card;
@@ -1959,6 +1963,7 @@ static int loopback_probe(struct platform_device *devptr)
 		pcm_substreams[dev] = MAX_PCM_SUBSTREAMS;
 	
 	loopback->card = card;
+	card->private_free = loopback_private_free;
 	loopback_set_timer_source(loopback, timer_source[dev]);
 
 	mutex_init(&loopback->cable_lock);

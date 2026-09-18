Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC464B404B
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731621; cv=none; b=iNZ7sCuHi6HbFqTdBsOmLm4tNx0R82jGNv01dHhn7N4+SHazmEHm/34afu9C8MtqYBhX3DZQlz/vWPg4b9r+cLRFGpA3f88vw+dx4gTY9obUBtohDKxV+wv4FBwrZBdqleZxpMRimdZDRNbmqyNhCmm9OpcLYL8oQVyCg5RtROc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731621; c=relaxed/simple;
	bh=VLOgYBB284e6UvetsR2kb8uGxt30t++4NGeUIM3BLp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+HFH7VfV9cJW8f/+F7eA6A5vV79LQAMsSgFvAeuf71o/j3sXbzLRayCw3tHdY1sRRyKXCa92uokOdMDiFLlZh4ikZ5c9qWuzE/NHMnZ42ZN8yq59I1Vc+p2egRcwxfBTCma5MPhbYX7DkjmddykrXLc/62BHyHhHsYYHmgQFac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oL9OR3op; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oL9OR3op"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ece3so474127f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731615; x=1790336415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qsOk67V7rRXI6BMJYe6ZaVYzC3vxvy2AFyjxpdxDJNc=;
        b=oL9OR3opRltkdNEaiQgKlwLG84MyajATZZ0WJE8TW0M5AeWKrDatabbzveClZIzRw1
         gGknTcWTw7xfeNfYc59SWKIUF3VnSlFKosVM+uzjcGDuQOkBvTpiLRLHkEPEz67aB9Wm
         aZRr5cYLV8kl/RIm4sfMHOuwH5rlnqHFnDScerPLdHQCJHfdmLFWIMf51M/TzSMM9IJK
         7CIBJQajUiO11xe2cauIStjgnj/HfLTaOXaB1LTceonGJ4fPdIIen6xjE2HVzmvPF6P2
         fjYtjHRgZN58qFucWA5UmskufYFPq3mLVV1GcKhTcosTrrQbyKfNF77d43XQAwH7mnw3
         ONnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731615; x=1790336415;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsOk67V7rRXI6BMJYe6ZaVYzC3vxvy2AFyjxpdxDJNc=;
        b=i0r6DLi+FGud3HCf24QaaL00Kex97GeH7HhUdEcBgsESZChy/D6logOVLX1Eoaonjg
         xoM4/LRi4F0gr1Q3EzObtypFBVIT8t3duNv8cMXOqG/Fu1lFbjMAnXWIgwyxm0SwhaJ4
         4wdxZM7UIqBHen1r2zeBJfyhVjNZOLbaDjuflyzxpARLvCLAu6o9s/NAMt/zpUNWl4/e
         AMaw3pN0x+/iWARTzFBvk1fO0cB9trRE/HV4Oj3/yL6ijoCnDXodANvgtfOG4Jjx2PHg
         8F5s2wtRTu+iwE8gQFZywjD6AL5a7NzmjUUInBPiHru4rAzklYxgHlkJvTwq0CzW7y3O
         yreQ==
X-Gm-Message-State: AFuF++nVEoTSVTQmo+EG4iGOsbNeLg3ohaoRmwEIk2DuMap2cUb0cXvx
	Jf5aOgWm+pdiky2jR7kfUSzDMiHp7IcgzsLIX5lQmW3Xyae4AO9eXWmZlbuJ4Mkz
X-Gm-Gg: AYBFou2KT3HYFtQd1733mRxyLga6gMO2cFSzCconJ3s9IvU/sUbyZPEEB6rJVZWZod3
	1oINBxmw86ir8k1oiAwPOKSUHPj9BoPXIu05GC+rLC9V1rd+lOCXo+3ikm5tQQFqxvmcGqAFmVq
	YLFW9mPzAPSCoBRtSwqsqBfvkO2lpRjcl/qd78P2OnESvIvC2/fRIAmW4X1FWcotNsCn28IdnSf
	xCnsXTgvv2vXvhuQFZSFq7LNH0a38rzR99FwCn9/emwdPHXeaVOG32cuT/WX+k9FIBvd/A6nP/L
	ZXXa81mk+ZKo2Pl6Xo+FP6qDR6mPjK0OYOFFt+nPzR5Ie8UD5tRBFGEcA/GV89lYi7YPv86CnB2
	Us8qYK8Q4+j87vHr2sJxVQVYN9i3nWmP/cWhCSMQ497eFnFPRZTaI2FtJOY9xTTfj1dZlTB2kLS
	LgaYL2kdxNV1/ckGz0Emwjedop58166QTUgJYq1t3YXSHN+G8VjJE5U9UYuPrC0CbR07WL8E4jw
	9+cEvVweQkepqNUkNrNQVXc6vU=
X-Received: by 2002:a05:6000:4904:b0:486:fed8:8710 with SMTP id ffacd0b85a97d-4871e367d9amr3116450f8f.38.1789731614971;
        Fri, 18 Sep 2026 04:40:14 -0700 (PDT)
Received: from cachyos ([41.143.99.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5636sm3734893f8f.5.2026.09.18.04.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:40:14 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
Subject: [RFC PATCH v5 5/8] ALSA: usb: babyfacepro: add S3 suspend/resume
Date: Fri, 18 Sep 2026 12:39:41 +0100
Message-ID: <20260918113944.76871-6-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918113944.76871-1-i.bahloul01@gmail.com>
References: <20260918113944.76871-1-i.bahloul01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Kills the stream and lets the PCM core suspend substreams (apps get
-ESTRPIPE and restart) on suspend; resume re-runs the cold init and
replays the cached mixer state.  Front-panel poll start/stop around
suspend is added by the front-panel patch, once that poll exists.

USB autosuspend itself is out of scope (already disabled at probe in
the first patch of this series) - this is S3 system sleep only.

Signed-off-by: Ismaïl Bahloul <i.bahloul01@gmail.com>
---
 sound/usb/babyfacepro/babyfacepro.c | 48 +++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/babyfacepro.c
index c15fca214..ccf3dbf36 100644
--- a/sound/usb/babyfacepro/babyfacepro.c
+++ b/sound/usb/babyfacepro/babyfacepro.c
@@ -1592,6 +1592,52 @@ static void babyface_disconnect(struct usb_interface *intf)
 	snd_card_free_when_closed(chip->card);
 }
 
+static int babyface_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct snd_usb_babyface *chip = usb_get_intfdata(intf);
+
+	struct snd_device *sdev;
+
+	if (!chip)
+		return 0;
+	list_for_each_entry(sdev, &chip->card->devices, list) {
+		if (sdev->type == SNDRV_DEV_PCM)
+			snd_pcm_suspend_all(sdev->device_data);
+	}
+	cancel_work_sync(&chip->stream_work);
+	mutex_lock(&chip->mutex);
+	if (chip->streaming)
+		babyface_stream_kill(chip);
+	mutex_unlock(&chip->mutex);
+	return 0;
+}
+
+static int babyface_resume(struct usb_interface *intf)
+{
+	struct snd_usb_babyface *chip = usb_get_intfdata(intf);
+	int err;
+
+	if (!chip)
+		return 0;
+
+	/* The device lost its state across the suspend; re-run the cold
+	 * init and re-apply the cached mixer state.  Suspended PCM
+	 * substreams are woken by the core - apps get -ESTRPIPE and
+	 * restart (the trigger re-arms the stream).
+	 */
+	mutex_lock(&chip->mutex);
+	err = usb_set_interface(chip->dev, BF_IFACE, chip->alt);
+	if (err < 0)
+		goto out;
+	err = bf_cold_init(chip);
+	if (err < 0)
+		goto out;
+	err = babyface_restore_state(chip);
+out:
+	mutex_unlock(&chip->mutex);
+	return err;
+}
+
 static const struct usb_device_id babyface_ids[] = {
 	{ USB_DEVICE(USB_VENDOR_RME, USB_PRODUCT_BABYFACE_PRO_FS) },
 	{ }
@@ -1602,6 +1648,8 @@ static struct usb_driver babyface_driver = {
 	.name = "snd-usb-babyface-pro",
 	.probe = babyface_probe,
 	.disconnect = babyface_disconnect,
+	.suspend = babyface_suspend,
+	.resume = babyface_resume,
 	.id_table = babyface_ids,
 };
 
-- 
2.55.0


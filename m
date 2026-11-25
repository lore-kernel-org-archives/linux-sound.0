Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599370;
	b=xfSvlbR+hCPNxZ3LoMfoshZz4Dsu2KLN86Dy5tQEX9hLVlACAEqWZqmyhCU0ABnJENPq
	 /fZ2bCJHRw7XSSC5kQ5MTJ5PcM6Ih6T8wD+M7t7mIx5Vop3JSwU2SH/ZG6WI7cL5n+60u
	 yu9ROJm+SYXtU2vbd9WtquzlIMXVw6/v/eVLzWtgJGzLyuvsPmJ/ZuuKmaXZfr73C5iQG
	 xVPZ7pHBG6b4cA3M+hzXxlLNnbDiATpbljHn0ZkfOSD5HWghmCx7fsBnRl2EIVJ0mmpbr
	 PBJHbYFnHlnSItJgToVeMwQz58h0BAXedmC0fd1KzR/nwKjsNw2xft41kd3z44pvhnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ugfNGSkMkksGb7kfTV5SRjEmNCXpWyRWq3uVRTCGG4Y=;
	b=DpS0WhPquoDFtxKyH4kx2LPDnYnIR25HlNxYO9KvuuR7sUq3UQYF8e0Jlxr/WZAhiRfL
	 dYFApVP6+LsVoaXBFgynxr7gncLoeG2xP2ADRc6RHIPNDaFNKH3WfUf3SxwD0PIgo9Kvy
	 7KD5/OYygQ0zRBs5Igq5hCb3Wbz1EeUWOSmpzquI67SxqoEK2GR80oik2m5hxVkrQdV37
	 xGHbuWXaRQ51rCqyUEJ4Bc9IqDvh1KoufGKGHbbCdtosDA7ASptw79LBRL3YM/UCrLb5E
	 8YU1vc6WKZzcGXFDZQZzcNJik3/cSSA+ipBMIGXB70TZ8LgzpWeswxsu+UPbwUX44Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dN78wiyu;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78578606A6A5
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 09:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78578606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dN78wiyu
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-385c497bf94so2272030eec.1
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599367; x=1796204167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugfNGSkMkksGb7kfTV5SRjEmNCXpWyRWq3uVRTCGG4Y=;
        b=dN78wiyu+GfnnmV4zHwY2zAFAdQNBBnfk6rp9gQGp4oZJ4rYJl4Xi1+x41zZ170Eyf
         io5b09LPIWtzueJ7I25PM7hEaxGpZWloTtrES40qUhuPFUWwctlasy/P+12z0Euxhf8V
         /c7fDdwoaLqO8knt6mJqX3LZf+NRXULhe6PcDhvdleYrH2lZPMevrBawyYk/umQ3BxgG
         IiqQXNb+Xl8l/fXFfqWAsfz1EiOzyxsQgQOmIuAMc2oHSkECyTX5xQaaEuhxT6NKFHFH
         INWh/O3l77zsq3DOd8O/BBH3EtuNQTfVb+jkoIGWVvjsSRmxObATj7H4uCg7w47r7JIO
         Uspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599367; x=1796204167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugfNGSkMkksGb7kfTV5SRjEmNCXpWyRWq3uVRTCGG4Y=;
        b=BRFZ6VzvJ8rxjpDrq7F1HjpMBgk9zA4223wUhd3IhA/Q+1fOVWZE6BlpofEeT0rbJS
         aH3uLpEnp6Ns35X903pRVhks+KZirwsySyei+TLwiplbf9srS5ndhI5JKv+cy80sNx8S
         P6zCRajApaXLvnDYGPw2OGvTA1ATcQZ7GTVzITITPCpTTue+wxcN7y0AmUa+tx9yGYJ1
         IJwz+iRwOXpORR8uMSvYtjgMAuhM5OfXzPd5lsdaug3L6ZXkYRb/b3xj48Wo8s3ganBJ
         F+IdIlG5+ZfRU7QHyxvDvInzaaYcPBRGrSpNWxRtcvdnoiOyLicf4cf+88Hf1ODtJY4s
         3Oqg==
X-Forwarded-Encrypted: i=1; AL+hErEwHh7ihaWvDt79L92yJ6VXiIjWjwOlI5LPnmIl/AsVlxnHGZ2Hp0yGlvlLGlSQzSoA7llK5BfQ+DKMfA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8wMABq6dbAKwfa1worDcnEVwq3nwAgtTS7GOBuk0B/Opcs/80N
	1jl3XC9o4eMPGRWv2VPipkvuV84N5otk4h0+H5aa8Eh4ySPYxCXipqDZ
X-Gm-Gg: AZFdTZcaCiNXllIcShOFHesDFL/OONoqOIf6qpjZzl3aCECxBmiwQDA5gHRiVp8a3aW
	7WKVUoEqKMCqfQHOm8ee+sJ5IoIfshRjCU+DmOgvtb4cdj0MlUyBYlZrQWhcgouOz4xQcnOO6db
	THNR6SveGxnXDPdnWxsIvTkjtnx0WxQf7FgUYPgUD/p9bN5kSnUCbgdxFXa0yOMR+1u9sGu1jT2
	CpSilgZdElPQWdV8UrE0NzVki2rE+XvqvZP6G29aOncZrNsHdqZxQG6WILYGqFtuC+gtfFv+prM
	b1Sq4VK4jdmkSS67L7wrCOd/WvpF9sAt4XD+dmlpQlaX2TUqDz7il4zsl820kIxmguB4Ph+XdaR
	IhqmxZMUb7nkDdMtH5LTsjMPDRHm/ovoWK5tqJ6ylH6ujS/TUc3wyeSdclDGtjs1R5K98m4HNg3
	QkB38zt0vPeRgJSA1IzalyvHWQXjflyO2/xxeHUjENVJRvGKKZrRZzXK/Obtds972ANrGkpgZE2
	odGeCjM5SLNBvlCIqfuIKnCjgdTvi/g9IKuLUrf62RZkE1NTeOzCdFrNfO18jXbzJBH9vFMLKmp
	R3X7ttcw7AmkmS1vJbS61EH2wWNTa2UC/5VNBWXtBzBPBIvDSu4=
X-Received: by 2002:a05:7300:108:b0:375:50d9:474e with SMTP id 5a478bee46e88-3856c0d0bb4mr22872675eec.4.1795599367493;
        Wed, 25 Nov 2026 01:36:07 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm51659458eec.23.2026.11.25.01.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:36:07 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: [PATCH v4] ALSA: core: Reject zero major number
Date: Wed, 25 Nov 2026 09:35:37 +0000
Message-ID: <20261125093538.4974-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87o6bd8ijb.wl-tiwai@suse.de>
References: <87o6bd8ijb.wl-tiwai@suse.de>
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

Reject a zero major number before calling register_chrdev(),
as ALSA expects a fixed major number.

Remove the redundant major variable and use snd_major
directly with module_param_named().

Keep a separate configured card limit for automatic
module loading, as snd_ecards_limit may increase at
runtime when cards are registered at higher indices.

Update device number creation and character device
registration and unregistration to use snd_major.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v4:
 - Keep the configured cards_limit separate from
   snd_ecards_limit to preserve the existing autoload behavior.
 - Update the comments describing the card limits.
v3:
 - Update the unregister_chrdev() call in alsa_sound_exit() to use snd_major.
v2:
 - Reject major=0 before calling register_chrdev().
 - Remove redundant major and cards_limit variables.
 - Use snd_major and snd_ecards_limit directly with module_param_named().
 - Update device number creation, registration and unregistration to use snd_major.

 sound/core/sound.c | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index 24f40763a20c..35b7f1683532 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -18,28 +18,28 @@
 #include <linux/kmod.h>
 #include <linux/mutex.h>
 
-static int major = CONFIG_SND_MAJOR;
-int snd_major;
+int snd_major = CONFIG_SND_MAJOR;
 EXPORT_SYMBOL(snd_major);
 
-static int cards_limit = 1;
+/* maximum number of cards allowed for automatic module loading */
+static int snd_cards_limit = 1;
+
+/* this holds the actual maximum card number currently available.
+ * it is initialized from snd_cards_limit and increases when
+ * cards are registered manually at higher indices.
+ */
+int snd_ecards_limit = 1;
+EXPORT_SYMBOL(snd_ecards_limit);
 
 MODULE_AUTHOR("Jaroslav Kysela <perex@perex.cz>");
 MODULE_DESCRIPTION("Advanced Linux Sound Architecture driver for soundcards.");
 MODULE_LICENSE("GPL");
-module_param(major, int, 0444);
+module_param_named(major, snd_major, int, 0444);
 MODULE_PARM_DESC(major, "Major # for sound driver.");
-module_param(cards_limit, int, 0444);
+module_param_named(cards_limit, snd_cards_limit, int, 0444);
 MODULE_PARM_DESC(cards_limit, "Count of auto-loadable soundcards.");
 MODULE_ALIAS_CHARDEV_MAJOR(CONFIG_SND_MAJOR);
 
-/* this one holds the actual max. card number currently available.
- * as default, it's identical with cards_limit option.  when more
- * modules are loaded manually, this limit number increases, too.
- */
-int snd_ecards_limit;
-EXPORT_SYMBOL(snd_ecards_limit);
-
 #ifdef CONFIG_SND_DEBUG
 struct dentry *sound_debugfs_root;
 EXPORT_SYMBOL_GPL(sound_debugfs_root);
@@ -61,7 +61,7 @@ void snd_request_card(int card)
 {
 	if (snd_card_locked(card))
 		return;
-	if (card < 0 || card >= cards_limit)
+	if (card < 0 || card >= snd_cards_limit)
 		return;
 	request_module("snd-card-%i", card);
 }
@@ -280,7 +280,7 @@ int snd_register_device(int type, struct snd_card *card, int dev,
 	}
 
 	preg->dev = device;
-	device->devt = MKDEV(major, minor);
+	device->devt = MKDEV(snd_major, minor);
 	err = device_add(device);
 	if (err < 0)
 		goto error;
@@ -396,18 +396,21 @@ static int __init alsa_sound_init(void)
 {
 	int err;
 
-	snd_major = major;
-	snd_ecards_limit = cards_limit;
+	if (!snd_major)
+		return -EINVAL;
+
+	snd_ecards_limit = snd_cards_limit;
 
-	err = register_chrdev(major, "alsa", &snd_fops);
+	err = register_chrdev(snd_major, "alsa", &snd_fops);
 	if (err < 0) {
-		pr_err("ALSA core: unable to register native major device number %d\n", major);
+		pr_err("ALSA core: unable to register native major device number %d\n",
+		       snd_major);
 		return err;
 	}
 
 	err = snd_info_init();
 	if (err < 0) {
-		unregister_chrdev(major, "alsa");
+		unregister_chrdev(snd_major, "alsa");
 		return err;
 	}
 
@@ -426,7 +429,7 @@ static void __exit alsa_sound_exit(void)
 	debugfs_remove(sound_debugfs_root);
 #endif
 	snd_info_done();
-	unregister_chrdev(major, "alsa");
+	unregister_chrdev(snd_major, "alsa");
 }
 
 subsys_initcall(alsa_sound_init);
-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595482;
	b=cY5E/McRCpkh/sxkzKA3fK9Kty+E+TpSC155byzkafKCsAX6tKVfBXgtzhWjghr4pldc
	 wdSNJbkfomrPlojj9cm+vZYduDEJd1B10fwwQ7547zzLVjOCwvrUuvq4FjVFb/mnlnh/U
	 jQi6PhdP8vGDsoQbADa65SOzGpc3gKyLsJEo1RO3Oh4kGCiOVMJ0s7gtq0sYdNOz0jHyE
	 5LkJIzVkkFicRr1lMjWNwK6ahPPRwbaOEZXR/cLAougWpK6P60JRWQ4IEquVLQP2hPvfy
	 9Wg5qN0jYSRv2hU66zvuRYA9PLfWiY29ZhIGhgkbDd7xmy3+07jAfpzWhVRi4YDQnCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E+BGXrVqMMcOjoija3bnHKJo8eMQcws0efPUmCBxKAA=;
	b=mtz5a79nJSvRX5IzUGqSe3vQrmcnwK0Hys7Pf3dRrG4XMWHhMIAtHY4RhfdqrjUNghH0
	 VJqeeOp7rtSaa6ZvE4VOfJNF2ubQdJ0WKnAZhsIk0Jg1C+KkMRGk/t/ZoDFWJlL6KKjW0
	 0lpZcXf9reKTY3/V0UdMAllJy+Bebym9a71u2POYThWduW21SKFDEPKundbNIsVQnznRJ
	 7bqPXPCL2e0h3isAciTDBT11u2IKGmN3F307wlblI7vI/bH0688IVJeYJjpSZfJl73kSv
	 lLfS76GRGk+CpKTXFUOOs0r6mqn0oXyxHZy6pA7JkxN9HYmclvGIOCdpOU9Rs+1LWTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QnQ8szL6;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD45606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 08:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD45606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QnQ8szL6
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so9182508c88.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 00:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595481; x=1796200281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+BGXrVqMMcOjoija3bnHKJo8eMQcws0efPUmCBxKAA=;
        b=QnQ8szL6ohbVVpqxtT5eIhcVWtsHmMcOKM685nYGz98zYQquP1LF5UPe7tdRkv08v/
         RFv1WkkZsuctp9qIldIKbQ64gdsTD7XGdRc2FRLm+pDbpUevLfEQrOwjEIFXpOGnM0SY
         U073pb38KE8xeE10fA4FghIHBizOb6STs4fG4YsK3kow5h21EZ2ooCRKxTN8C9Zvk/9H
         IwkBxsjstzEBSK+sggQBsDQBizXDeBiaEm46orKn99VROXc5ZlswG8rKbuY8pKlcsx/k
         O/BFSQRb8cibj8gVy7Qz7k9dEwsnhj8zqXIfHTSg8tzU/dKbU072Df0V92jBStmgIPT1
         Iuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595481; x=1796200281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+BGXrVqMMcOjoija3bnHKJo8eMQcws0efPUmCBxKAA=;
        b=fzfo9BR6/J9kMAxY+gdoXgxerTIruyqCovbmxa6k6a9faO68qx1hE9lRvs4q19nd5Q
         2Ku2OLoO+ePJ49qB4qjggmXNqvpbGdCWZ6MY0z9k12hJdnXTfShrY6AzYv/y9SV0jFv7
         NLgTMdHDMVujc4byKq7uueD5e7KDkya8bWqTzm0GQIt311e77PoMclb//ziIdrACcMpx
         iQbv8qYcYtDK+bblpGm1V3y4EydFuhXy8GpxLeQ+uw/oWwL2Z9h1fXHBeMLc3xzNY2m6
         NDVPRTghjgT1uoO+NI8KYu+Xye0tqWVulxuGPMHP+PiDDr5AWY/1FSUkMRrm01nbnpmH
         k0vQ==
X-Forwarded-Encrypted: i=1; AL+hErEZdfqOjsY0+ioX7uWn9i5xeuLeHsC0j+K2qGktdrbNBx2262aGHex5KDViJZaUS+fBI8qjdgx7Re5XWg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9p/l64UQtGwRed4QqYqzi2ulxVnYytt096Iqfs2k1QwN3napjN
	9riumUJTktRnwB8Zrte5t8APqJEV27WeLNj6f6sdZ+aVfbJW8s4D+6qSKxJgDJxt
X-Gm-Gg: AZFdTZdQrjy5sXHHa4/c3DqgfO407Bbk/2tCLvOBplmKJ4rbPYYAI66PHuM8CYBINUI
	uUcIO29rdkDpqd2QZIGK5jHXYnn1cOhoHklDS2u3zz7e6q7V/7al0odoRCnpQHeKzo03mooH5P8
	GecuQH4prGdxke0UAgrM8HxkC2Cdp0RKTqWCBb38EG8CJ7RzWwzY02g/xwmZP29sRSXVxxgBO6t
	K3mqclDOnrRq1K48d6cRV/BcuM1lS597aZRoFifpkma+McyUEfXNXn7p8vAWI8Qa3dTAIh+/cdz
	/0paOZtVTsG//N25ZSxRXMkDm3nU2ynqZx9dT6+a0xwXO9Bdfwra9N1psSXSzjbUBRUAk34aFYU
	4FWcZu5KIPhnqQz3irFy6dil6IX5O6zYOcI+3Wql/wS35T9rmeG78nWyA1M7pMbTum5lKbDZXhp
	eAT+vwjWc/SnPSqRLjyn38RY+XPRvfVhPcDXOYa+4hVLvQKG9cH4Z15no4u/emjeUIFL42OX0yQ
	KacPJphgdm7XyOqwM6hCon8OSlu7Ga7LGWcSUNrMXYfqYEZYWXEANoCfIlCNLAYvecfWz2VwRu4
	WJ5IvAxHoZlqZ9ooic+/r+WO0+HQlvKk48+6uPTzM2lwJh73t6g=
X-Received: by 2002:a05:7022:f907:b0:1b2:558a:d781 with SMTP id a92af1059eb24-1b5567b5788mr15355163c88.5.1795595481380;
        Wed, 25 Nov 2026 00:31:21 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm45162585c88.6.2026.11.25.00.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:31:20 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: [PATCH v2] ALSA: core: Reject zero major number
Date: Wed, 25 Nov 2026 08:30:53 +0000
Message-ID: <20261125083053.3917-1-sreekuttan2156239@gmail.com>
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

Remove the redundant major and cards_limit variables and
use snd_major and snd_ecards_limit directly with
module_param_named().

Update device number creation and character device
registration and unregistration to use snd_major.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Reject major=0 before calling register_chrdev().
 - Remove redundant major and cards_limit variables.
 - Use snd_major and snd_ecards_limit directly with module_param_named().
 - Update device number creation, registration and unregistration to use snd_major.

 sound/core/sound.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index 24f40763a20c..8ac3cee19e66 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -18,28 +18,25 @@
 #include <linux/kmod.h>
 #include <linux/mutex.h>
 
-static int major = CONFIG_SND_MAJOR;
-int snd_major;
+int snd_major = CONFIG_SND_MAJOR;
 EXPORT_SYMBOL(snd_major);
 
-static int cards_limit = 1;
+/* this one holds the actual max. card number currently available.
+ * as default, it's identical with cards_limit option.  when more
+ * modules are loaded manually, this limit number increases, too.
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
+module_param_named(cards_limit, snd_ecards_limit, int, 0444);
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
@@ -61,7 +58,7 @@ void snd_request_card(int card)
 {
 	if (snd_card_locked(card))
 		return;
-	if (card < 0 || card >= cards_limit)
+	if (card < 0 || card >= snd_ecards_limit)
 		return;
 	request_module("snd-card-%i", card);
 }
@@ -280,7 +277,7 @@ int snd_register_device(int type, struct snd_card *card, int dev,
 	}
 
 	preg->dev = device;
-	device->devt = MKDEV(major, minor);
+	device->devt = MKDEV(snd_major, minor);
 	err = device_add(device);
 	if (err < 0)
 		goto error;
@@ -396,18 +393,19 @@ static int __init alsa_sound_init(void)
 {
 	int err;
 
-	snd_major = major;
-	snd_ecards_limit = cards_limit;
+	if (!snd_major)
+		return -EINVAL;
 
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
 
-- 
2.55.0


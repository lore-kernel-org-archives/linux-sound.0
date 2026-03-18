Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862A03DA5D5
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842948; cv=none; b=Tj41zD0UkSt8mgzJBSdB0UFwjU9P0pT7Zl3j0uLTJZnf6CLRJP0bYI60TADS2S8bwBS6mktPENm94PGI6bNremUB7LenvslkOZ3/+iYWjdCGitOLfDsHDw49l533FColvQZ6ZPYG2Iqy2ZOvVYCy/btgoYrd9FRIIL9w7FVNCx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842948; c=relaxed/simple;
	bh=wr7LrT6fALB4lVXF73Hai9QLyEetrJK3WCbgjM24ot8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ETCHh8e6kK5G1YqsP87sSpyXdy2YCHHxNOjeAEircfLWZ6D9zfT5euD+ESUh10j4kxDeowj6qEbNRDvFHVS/NzlpuagqxzEWHVOkbjEn+kwUddqRkby1DIC1usRqg3r5JGDiCt2yvJ1GbSlJ0GZ8O4JlCdZxwzEeSuVMm0ZxYP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyCaYtSs; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyCaYtSs"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b4520f6b32so9916748eec.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773842945; x=1774447745; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HiGU7ACiFofzigZYkO+A1ibMgdUGeFsuYvqwX0/Mjy0=;
        b=AyCaYtSs2ciNpP8k8K1eFH2RfnNMmKFHYh/eor1VoVamg5N1vazD4v+lelFrSQD9+C
         n2i4ohEusTg9Aa2AytM5soGzVULAjo90+oFcyronKKoAaf0oXaqpID9RAvBBv/Q5AJtT
         P3yrBHCNuzJmrkqG8rUMRX3h7e890Sy1+lm1j3UhLC2gxlkhhjfIghfrLCGPHjv29OmV
         3cQwKXAVLQEWZSwiELEoMQ8Q+VcaH4x/Z9UQXzxVGiPX0R1Sq9VQ18THsUr0AkCekeCX
         OyZForEtF32zesLRaBzRyI/yiNpLo69I/BgAOWEz8yzUMVIJjYSo94cVeWkS1noM4Ahe
         O0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773842945; x=1774447745;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiGU7ACiFofzigZYkO+A1ibMgdUGeFsuYvqwX0/Mjy0=;
        b=bJ2jVTMNmFkaG6xQE2mYh+nJxE0xeItSL48yg73Pdm/17mjIr4/jUQ+eAs6N365NmR
         Wm164m7yE/oXKZc3v0al42w263iVaNvpSXohefirnQqgxje9FVSCqakb9XQRO24vLrAF
         OGPuIcEi6zMWoJcZ0T4scPuYSmpN+tEA83TheRwKrPAQJ/r0Ry22hOCx3j9NcMTXWvh+
         f4Ki6S/Hh0EgwnWzaBOhN/PCFFt1UYZEbtf0s1MKaWjhs2gbzv2U/CNKYl4WWp2QkMI0
         r/Doa9OyOjxt+RJzsZTO7NISCOAMo2ez/9UTbvwtQpUyUGamIMRGS/GOABMSS7BKQrtq
         J+eg==
X-Forwarded-Encrypted: i=1; AJvYcCXU1uHbK5roRyz251w5LrKw3r3098wIYb5mBweygAUzzAKmVoyDuJSecq59iDw0GeXqFGEGU0gTqGMzaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEnAD+5iqt+YARrV6zZW0nE+rNy0M/1rwFKr/djd2fBDjwdOkj
	Sr0RHvG2XQzaC+9rHG9bg5DICBD84cS0fqsiQljipclL+/kv6rUBQDhD+gvn4s85
X-Gm-Gg: ATEYQzwtSVfElMYjQtQYSGy8i3SRBHkSdc7FJTFdLn8s3eep0s8I38DkEqH+aJgi04N
	kYVaOIcJIXr76yiMJHXcYA/t5ztQ3vOWhkYLqS88CJKoegcY8B9VDaYk7ogYdyoZHGA/1PqwnLl
	Xr3Iilob+dvX1jwXoahpYY9/kUmWpGhfij/AocWkjtSwefXo0GM5WcgcQc3XxdAorxoR5CmQWRa
	EbZz4/4lNso+q5igoJ5/Du8zX+iZ3VtRYhMTHk75r9k+YZ5gPjIhSLc/JMoul0yVeVu8s+vpdJo
	hhTXMmxpVo1SEg1sc5ILA9mfazHDw1DbXCPIDXNBXtntzLNC9dZXdxUQbpSaWqz9Jt3kvcjDp6r
	1hc0+uBE/EnzTj8d1gd9gEt+/Cd7BYuh/LmI9GK4WoIKoH6YQ52FT9ITjdVwnHLNVuITL7R51k8
	solj0hHVLf0oef2Nv1+ZXorEwdIv7lpsGnahYOA2I6qDX3xlGGq7FmAUjpVzbBAN6DEfUwiwvsc
	1Q=
X-Received: by 2002:a05:7300:dc91:b0:2b7:fdb6:ccf6 with SMTP id 5a478bee46e88-2c0e4fb8e1dmr1782178eec.14.1773842945067;
        Wed, 18 Mar 2026 07:09:05 -0700 (PDT)
Received: from [192.168.1.8] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55cd9cfsm3822404eec.26.2026.03.18.07.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:09:04 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 18 Mar 2026 11:08:46 -0300
Subject: [PATCH v3] ALSA: usb-audio: validate full match when resolving
 quirk aliases
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-alsa-usb-fix-quirk-alias-v3-1-bd3b17a32939@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33Nyw6CMBAF0F8hXTumDy2tK//DuCilwEQe2kqjI
 fy7hcSEjS7vzdwzEwnOowvklE3Eu4gBhz4FscuIbUxfO8AyZcIpl1QwAaYNBsZQQIUveIzob6l
 CE8BpqwSlhVFCkjS/e5dOVvpyTbnB8Bz8e/0U2dJ+0cNvNDJgILjUWqsqN6U5153Bdm+Hjixo5
 Fso/wPxBEl3FMzKvKJWbaF5nj95kxoNCQEAAA==
X-Change-ID: 20260313-alsa-usb-fix-quirk-alias-e9c8300ba836
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3378;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=wr7LrT6fALB4lVXF73Hai9QLyEetrJK3WCbgjM24ot8=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJm7Nv51Xfvxi97dNVFyq33f2T0IVzkrvtTN3eHPUnEtV
 scrDxwbOkpZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAiPl2MDAvk30zKEVlafnKr
 P1+3MZPzm07zg8vCl+0SL7mWKtf3/DTD/wJJHQNLKbuvzKce8KzwPpg+2XJ1oHJCSstv+cWcQYU
 MPAA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
usb_audio_ids[], but it currently checks only the vendor/product pair.

This is weak for quirk table entries that also depend on additional
USB_DEVICE_ID match fields, such as device or interface class,
subclass, protocol, interface number, or bcdDevice range.

Keep the aliased vid:pid as the lookup key, then validate only the
remaining match criteria of each candidate entry against the real
device/interface descriptors by clearing USB_DEVICE_ID_MATCH_DEVICE
from a temporary copy and passing it to usb_match_one_id().

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v3:
- rework alias quirk matching as suggested by Takashi Iwai
- drop the explicit per-field helper
- keep the aliased vid:pid check first
- clear USB_DEVICE_ID_MATCH_DEVICE from a temporary id copy
- Link to v2: https://lore.kernel.org/r/20260317-alsa-usb-fix-quirk-alias-v2-1-6e531c67f0c8@gmail.com

Changes in v2:
- drop the temporary usb_device_id reconstruction approach
- validate only the remaining match_flags explicitly
- pass struct usb_interface * to get_alias_quirk()
- Link to v1: https://lore.kernel.org/r/20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com
---
 sound/usb/card.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index fd81f32a66fb..f42d72cd0378 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -866,19 +866,25 @@ static void find_last_interface(struct snd_usb_audio *chip)
 
 /* look for the corresponding quirk */
 static const struct snd_usb_audio_quirk *
-get_alias_quirk(struct usb_device *dev, unsigned int id)
+get_alias_quirk(struct usb_interface *intf, unsigned int id)
 {
 	const struct usb_device_id *p;
+	struct usb_device_id match_id;
 
 	for (p = usb_audio_ids; p->match_flags; p++) {
-		/* FIXME: this checks only vendor:product pair in the list */
-		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) ==
-		    USB_DEVICE_ID_MATCH_DEVICE &&
-		    p->idVendor == USB_ID_VENDOR(id) &&
-		    p->idProduct == USB_ID_PRODUCT(id))
-			return (const struct snd_usb_audio_quirk *)p->driver_info;
-	}
+		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) !=
+		     USB_DEVICE_ID_MATCH_DEVICE)
+			continue;
+		if (p->idVendor != USB_ID_VENDOR(id) ||
+		    p->idProduct != USB_ID_PRODUCT(id))
+			continue;
 
+		match_id = *p;
+		match_id.match_flags &= ~USB_DEVICE_ID_MATCH_DEVICE;
+		if (!match_id.match_flags || usb_match_one_id(intf, &match_id))
+			return (const struct snd_usb_audio_quirk *)
+				p->driver_info;
+	}
 	return NULL;
 }
 
@@ -927,7 +933,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 	id = USB_ID(le16_to_cpu(dev->descriptor.idVendor),
 		    le16_to_cpu(dev->descriptor.idProduct));
 	if (get_alias_id(dev, &id))
-		quirk = get_alias_quirk(dev, id);
+		quirk = get_alias_quirk(intf, id);
 	if (quirk && quirk->ifnum >= 0 && ifnum != quirk->ifnum)
 		return -ENXIO;
 	if (quirk && quirk->ifnum == QUIRK_NODEV_INTERFACE)

---
base-commit: f803b7bb17dd19fbd84fe783683321f38834a1df
change-id: 20260313-alsa-usb-fix-quirk-alias-e9c8300ba836

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>


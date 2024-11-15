Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882F0190056
	for <linux-sound@vger.kernel.org>; Fri, 15 Nov 2024 13:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731676124; cv=none; b=MPCR3Z2LKL9pgDOmtp2PKwVBb6wfBKm9nKlnwUSXJ5h6LcUkA+K/JhHJKtmf/JqoD/0R1mBh9ikDVGyIuHcHJ33MKXAKD3/cxE1QB38Tfg4EXWPyZTyHIp7gB+gZIxRe9ZKZpvbcUtJ+IEf4jhaTn2YHc3kMskR8p6c7ZKHuMpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731676124; c=relaxed/simple;
	bh=vKXTlXk5EdhE9ocWza8ZBBl5KCXWXlXlJCOYdappd/0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fPy3IABKQ9wpls0USd7TbB9uoNQ4dC2GcmV22jv70+8a4kSg6ZZQMS9XfDEbz+PkCskTXI1b7JVz5Zpeab4IvZ568k5wl8P3Nol7dVglIFZl7C+rQ8lAXDBsY1/B7GXZj1z6PO9yVBOqKrVXudmS8je/CJFqwY5Q1gJNjJW0ZhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nex7+aUT; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nex7+aUT"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e384d715e96so521622276.2
        for <linux-sound@vger.kernel.org>; Fri, 15 Nov 2024 05:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731676121; x=1732280921; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a6vl797uG55ZBhU/GE8En5eQRqUo0AHaNmsJiyzRWqs=;
        b=Nex7+aUT2e91FrMiLQWaYkv53LEaryTMEAwJ0k+7UoUijttvGqlq0hnIYnBMh6/SUy
         sCinsbVEHf31SKRLLp/ccL0906vYj5HEKfYobW2FRYpgDhsZrp5J7MnL2yCDbnBV3Sl8
         bS0SuMOPbTk9hf+e4caBw1LMIPxemoHSeuEnycDsTeDhQfmn4rbgzXk4ELsZcN0sHG+J
         QwTZS15e10n4uPzd7ptl3lF95LZZAEsF8DQgfAuZRcAJa0JepsnTwPO1mosN9KyTkach
         z1jSuZBAE87dFZUrNAKIcdEpassupV7YuqTOIWrAZlHSVj2d/WhmvflPm9cuXceznnFB
         KxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731676121; x=1732280921;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6vl797uG55ZBhU/GE8En5eQRqUo0AHaNmsJiyzRWqs=;
        b=FaPuw157b0y/dhNa+QY0IRRVeUzbTqrjsC9JL7PmX8y+/Jt4JNZyphVhiimm+fQsma
         ke7pHWiRRxAd2gDlMOZ4xQ+Dihflg+LbvS5rYPY2cESNgoj/RzbLKk9ZM2H6WiufiOqp
         GAkiWiHvY10VHMmSKp5eS/kDYtFgu0ime/+3eN252iluAdBek4JBudA+I/+Jd81n72lh
         eQfaLlQR3PLFS5cXSB13zNr85YGGz+0y2BjX1Ffxa7PlkqR8+I5DpRc0gj8ksx14TbYL
         cBVzD3HLByO9SFncXjKppzvHSpOlOg+bsKW0R0/H6JXAg3Tw0P2VK0rkkp9hOFGPXLt5
         svrw==
X-Gm-Message-State: AOJu0YzN9ZejIUqYOs2TRxhmXOdQm/FRA2JP9Z1yaYz36mdQ5oOicg8B
	BJnlJ/Ln1JJS86Xnj7Avmddqyw5RXORNn0NJtJaIeaNyymhXAmL9Uzob9UZKOfb8Wmnaa/1lcsg
	4Nu+zcg==
X-Google-Smtp-Source: AGHT+IHR8Fd/xL3xiCHbQp6aZXB6w5mTFY75n0oUfkXYgpaMfqSuNlK6eBLJQv9r5I1Ro+dg9QsaIALCUk0B
X-Received: from bsevens.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:22a4])
 (user=bsevens job=sendgmr) by 2002:a25:2684:0:b0:e25:d46a:a6b6 with SMTP id
 3f1490d57ef6-e38265fcc4dmr124031276.8.1731676121460; Fri, 15 Nov 2024
 05:08:41 -0800 (PST)
Date: Fri, 15 Nov 2024 13:08:33 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241115130833.1077260-1-bsevens@google.com>
Subject: [PATCH] ALSA: usb-audio: Fix potential out-of-bound accesses for
 Extigy devices
From: Benoit Sevens <bsevens@google.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lianqin Hu <hulianqin@vivo.com>, 
	Manuel Barrio Linares <mbarriolinares@gmail.com>, wangdicheng <wangdicheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, Benoit Sevens <bsevens@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

A bogus devices can provide a bNumConfigurations value that exceeds the
initial value used in usb_get_configuration for allocating dev->config.

This can lead to out-of-bounds accesses later, e.g. in
usb_destroy_configuration.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@kernel.org
Signed-off-by: Benoit Sevens <bsevens@google.com>
---
 sound/usb/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c5fd180357d1..970d36d13ad8 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -555,6 +555,7 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
 static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interface *intf)
 {
 	struct usb_host_config *config = dev->actconfig;
+	int num_configs;
 	int err;
 
 	if (le16_to_cpu(get_cfg_desc(config)->wTotalLength) == EXTIGY_FIRMWARE_SIZE_OLD ||
@@ -565,8 +566,11 @@ static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interfac
 				      0x10, 0x43, 0x0001, 0x000a, NULL, 0);
 		if (err < 0)
 			dev_dbg(&dev->dev, "error sending boot message: %d\n", err);
+		num_configs = dev->descriptor.bNumConfigurations;
 		err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
 				&dev->descriptor, sizeof(dev->descriptor));
+		if (dev->descriptor.bNumConfigurations > num_configs)
+			dev->descriptor.bNumConfigurations = num_configs;
 		config = dev->actconfig;
 		if (err < 0)
 			dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
-- 
2.47.0.338.g60cca15819-goog


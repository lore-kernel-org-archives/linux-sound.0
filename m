Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AD1E57D
	for <linux-sound@vger.kernel.org>; Tue, 19 Nov 2024 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732026501; cv=none; b=JMDKMPzNkguFbXjo2uN4A6iUwQCLnoc7MLYkP1Vnmd+svTVZ7ntIOvbSNtj0+sXfufXVqyUrSw1RHfNbs2cOchd/jkmPOZFoheMYFJaCTW9i8sw6ftbNJzGwV+nPBxQTxlT9o8Tyu7k0u58Dtjt0v+uiQUoJLlWI6R1Ln7yG5HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732026501; c=relaxed/simple;
	bh=odT8+IjIPFh0x4hnZmqQNYF1oFVJELMUmZL8DgNd1eM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Zn/LZtc5L6MYsNz9q0USVrdBP9BRISby0sJBKJdYo4nmywtw9Vla4z0I5vwWFZC13C3b9+zNuAipIyEteo+wd33Dr6UKQouRldzJyaezIVEVOHx+x9OoOr4cweTAbvj/ZsO6kabg+jThVs1jYmIi55jQBu9pmUUc/ciiZTLJ7iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UoqLh7yb; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UoqLh7yb"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e3891b4a68bso3021214276.2
        for <linux-sound@vger.kernel.org>; Tue, 19 Nov 2024 06:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732026497; x=1732631297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DmhDd6u9SBFw5CBCJmkMyru8t9HpTzWZ9wkRyzti1Hs=;
        b=UoqLh7yb82dQYNSmhYA4MbRFv3fdoc2T5UYJevmWHWOVycVkMo/xcq7KphIeniGJ5B
         2M5I3iCRivynEbXrgqw4aMi+9BuTRlFp9tOBcJSAeEkAd0gbpNsmQvy6D19f0Spu5wXE
         Ar4svv7ExO3h3y6beByBXsp3GzHtzrEdHku6kIbg9DZhm/AQDrUqFLxz9cWTrjmGRh6O
         BfmERb9pp+OPX2JxvbDRNjqozbN+kGbF1dPM8YDrxL/fzMW3TkAGT/R0GIWsklp7hMOo
         KkM23JZ4hgS2YdKeVK81AXUfjM4YeaN1hOPhYjaLp962iJl5qidlGSqcJbF6Vqt8ZOc7
         NSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732026497; x=1732631297;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmhDd6u9SBFw5CBCJmkMyru8t9HpTzWZ9wkRyzti1Hs=;
        b=H9cEB5W2O5gf2zPyXXLXaDWpJFzdGNgzbgB+XroDMBwGyvUsOuAGO73JcljDXHvFbV
         37qxmrOzMMPm87wfFa7cbfu4UF54FTLXYiiIH376PvgXJMQvc5Imf+vlpf+oH+fNEzdh
         PYIeLMPyuENFgRHPJ5IyaVk28TDB229BleeFNHZ1NUvwQ/0eAQa4myP2VAucCbZv2lct
         2R5gDskpZIEKginGXc9yY0ts7RKveKk9NNMoq6r+c4iSF2/KnEJAX56lQ1I+YwnNfEkR
         rVDewH7RArBGkpq5o1L8okmbvBVwzZmot9+4gDIgfj9zPe0h1PnYnzfmqPYgbrJ3y8uC
         pOQw==
X-Gm-Message-State: AOJu0YxgdqzdoTU7t0mqoTcyjU6VtLcEmJ26Ws9QJEWupRDFHQuiq093
	/NpARO/U50bOfVRvgBDXugrcwnZ/t95j4w+FNuRby2CVqVCEg2aBc//Q/jEiOrHNdcL3obZN7Om
	DkB/3kQ==
X-Google-Smtp-Source: AGHT+IG8oLDHV3yyMmsKL/ZcThAj6z3h3yCW+txGSD2kOkUIV8oAOy6GtYJu6OzFH7vrKr9zfavjTnCmkWyo
X-Received: from bsevens2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:332])
 (user=bsevens job=sendgmr) by 2002:a05:6902:8b:b0:e30:be64:f7e6 with SMTP id
 3f1490d57ef6-e3825d44aa4mr11492276.3.1732026497664; Tue, 19 Nov 2024 06:28:17
 -0800 (PST)
Date: Tue, 19 Nov 2024 14:28:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241119142813.3528722-1-bsevens@google.com>
Subject: [PATCH v2] ALSA: usb-audio: Fix potential out-of-bound accesses for
 Extigy devices
From: "=?UTF-8?q?Beno=C3=AEt=20Sevens?=" <bsevens@google.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, 
	"=?UTF-8?q?Beno=C3=AEt=20Sevens?=" <bsevens@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A bogus devices can provide a bNumConfigurations value that exceeds the
initial value used in usb_get_configuration for allocating dev->config.

This can lead to out-of-bounds accesses later, e.g. in
usb_destroy_configuration.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@kernel.org
Signed-off-by: Beno=C3=AEt Sevens <bsevens@google.com>
---
v2:
 - Also add sanity checks to snd_usb_mbox2_boot_quirk and=20
   snd_usb_mbox3_boot_quirk
---
 sound/usb/quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c5fd180357d1..919091c1f17a 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -555,6 +555,7 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
 static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_in=
terface *intf)
 {
 	struct usb_host_config *config =3D dev->actconfig;
+	int num_configs;
 	int err;
=20
 	if (le16_to_cpu(get_cfg_desc(config)->wTotalLength) =3D=3D EXTIGY_FIRMWAR=
E_SIZE_OLD ||
@@ -565,8 +566,11 @@ static int snd_usb_extigy_boot_quirk(struct usb_device=
 *dev, struct usb_interfac
 				      0x10, 0x43, 0x0001, 0x000a, NULL, 0);
 		if (err < 0)
 			dev_dbg(&dev->dev, "error sending boot message: %d\n", err);
+		num_configs =3D dev->descriptor.bNumConfigurations;
 		err =3D usb_get_descriptor(dev, USB_DT_DEVICE, 0,
 				&dev->descriptor, sizeof(dev->descriptor));
+		if (dev->descriptor.bNumConfigurations > num_configs)
+			dev->descriptor.bNumConfigurations =3D num_configs;
 		config =3D dev->actconfig;
 		if (err < 0)
 			dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
@@ -901,6 +905,7 @@ static void mbox2_setup_48_24_magic(struct usb_device *=
dev)
 static int snd_usb_mbox2_boot_quirk(struct usb_device *dev)
 {
 	struct usb_host_config *config =3D dev->actconfig;
+	int num_configs;
 	int err;
 	u8 bootresponse[0x12];
 	int fwsize;
@@ -935,8 +940,11 @@ static int snd_usb_mbox2_boot_quirk(struct usb_device =
*dev)
=20
 	dev_dbg(&dev->dev, "device initialised!\n");
=20
+	num_configs =3D dev->descriptor.bNumConfigurations;
 	err =3D usb_get_descriptor(dev, USB_DT_DEVICE, 0,
 		&dev->descriptor, sizeof(dev->descriptor));
+	if (dev->descriptor.bNumConfigurations > num_configs)
+		dev->descriptor.bNumConfigurations =3D num_configs;
 	config =3D dev->actconfig;
 	if (err < 0)
 		dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
@@ -1249,6 +1257,7 @@ static void mbox3_setup_defaults(struct usb_device *d=
ev)
 static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
 {
 	struct usb_host_config *config =3D dev->actconfig;
+	int num_configs;
 	int err;
 	int descriptor_size;
=20
@@ -1261,8 +1270,11 @@ static int snd_usb_mbox3_boot_quirk(struct usb_devic=
e *dev)
=20
 	dev_dbg(&dev->dev, "MBOX3: device initialised!\n");
=20
+	num_configs =3D dev->descriptor.bNumConfigurations;
 	err =3D usb_get_descriptor(dev, USB_DT_DEVICE, 0,
 		&dev->descriptor, sizeof(dev->descriptor));
+	if (dev->descriptor.bNumConfigurations > num_configs)
+		dev->descriptor.bNumConfigurations =3D num_configs;
 	config =3D dev->actconfig;
 	if (err < 0)
 		dev_dbg(&dev->dev, "MBOX3: error usb_get_descriptor: %d\n", err);
--=20
2.47.0.338.g60cca15819-goog


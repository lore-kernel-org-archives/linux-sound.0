Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D761A0BEC
	for <linux-sound@vger.kernel.org>; Wed, 20 Nov 2024 12:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732106515; cv=none; b=YKy5DedHfPdwJTN32YpIdptC7MUldNUkqp+SVDuFEQEXcxbNX0MWBNu2f5o5LfcdZTmqBfkG84wPiH9uyYoQmwQlIaeQNuoln+Sy6yxAcMNwZaedY2ktnAHQUKNQfR3I8bZyJ9gQBWOX+Gnca4q2G6ywiVkvKLiLxBegC8tJdhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732106515; c=relaxed/simple;
	bh=EJCr4AJWtjnwB9a4EvcSX7fpXvN5i2MlTBZszp3LM+4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IFZmHMED6lYuZ2R2Dy523kqiOQhi2KG4kX0aGngAIZ9sAuJ1FTpZTaEv7hah0N5HrYKWn7Ft7PvN3qEyfMQX84shvSjDeJjTxYyddsdiST23rqpKL6R14txpqubFsM73kIkwuuvruX3zJIlXZ+4geDuJCIPeZHQK9i6ORss7vJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZXiNGrMg; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZXiNGrMg"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e30cf48435fso9077505276.0
        for <linux-sound@vger.kernel.org>; Wed, 20 Nov 2024 04:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732106512; x=1732711312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0XpCFu3SB97afWIV3jxP5FYTgDsihZEcj1AwVVHRW2M=;
        b=ZXiNGrMgijnddsm43Yy232kq/OPlBKC5rkeo9IU9xtZw/B+qVCuoTNl8hdrrNHhvwt
         5GmhIlGekqbabuU3JeReHNgXtXOIXH4H1N7gyEG4hDGc+gcr/M+GGBSGid9Dnc5HikWA
         vVx9pbPWoTvJRtZXursBvRh+SVADB/IP/Q5MFX+p0F+weIrMOwUGeQdf4ATEKSwU8r54
         oiN8RAQteyB82JXKTd07Tta7s1Ue+MWvapJWyRa5WZm8MeE5XmLI3EkdgeHgYVzc6MZl
         BImGvpZBoS9GXdI9NpNQFKxEXrvcwq6hUABXNwpuyoBhPnIwMF1Cxt5UV0RSZsPJK0lP
         w2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732106512; x=1732711312;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XpCFu3SB97afWIV3jxP5FYTgDsihZEcj1AwVVHRW2M=;
        b=M6HcKZkoLufKlLh7tOoOzIuBMsKNsn9zkX5yb36kNyvcIUEPhGM6Aah3j4FP9Dsaij
         RIXJBt783IhSnTK9qFFral05mJ0OdE0bmE35dV+eAvILAWUhLk0JjsHO3XkGqZvriNG/
         o47onsqqOBEe+jxfQDQm0qqQP2FnYbavYwdHCs+CVUZH8twgm1YmpL5bNvPBsSzKBMZc
         h2TZCr2hWiTx9U1lE0hgw5DRvnwnhTGjDmyoNQP+tlLMj2T9nghJ0NggG7uIWCTZ0v+N
         zt/UgqJngpSH8hmM4/rw6qUG1VJ5SlndQ1iVxDGrsua60WVBg36l1T6vQgWue1IRjDXs
         hL9A==
X-Gm-Message-State: AOJu0YySw/xWHIQYiT1ReeJqsKdZcTL0Ngu6oJ8Nt+zD56lAuZXvCivy
	/eOzl8uKvZ67MtBxf6BBou45F65c6ChnEyAFSGYvEl8wXPd6pEftSx4pDt3fiURhn3bCt2hkxWu
	wH5XGvA==
X-Google-Smtp-Source: AGHT+IFX2c8SjUSZL8xVTgBUGo9trDEkIaq0GG1f5bVl4uJApTvulNZbfEzjK+kE/O9+NCJQg4McoogIN0px
X-Received: from bsevens2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:332])
 (user=bsevens job=sendgmr) by 2002:a05:6902:1cc:b0:e38:1c94:1a24 with SMTP id
 3f1490d57ef6-e38cb5f9fe9mr1059276.7.1732106512252; Wed, 20 Nov 2024 04:41:52
 -0800 (PST)
Date: Wed, 20 Nov 2024 12:41:44 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120124144.3814457-1-bsevens@google.com>
Subject: [PATCH v3] ALSA: usb-audio: Fix potential out-of-bound accesses for
 Extigy and Mbox devices
From: "=?UTF-8?q?Beno=C3=AEt=20Sevens?=" <bsevens@google.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, 
	"=?UTF-8?q?Beno=C3=AEt=20Sevens?=" <bsevens@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A bogus device can provide a bNumConfigurations value that exceeds the
initial value used in usb_get_configuration for allocating dev->config.

This can lead to out-of-bounds accesses later, e.g. in
usb_destroy_configuration.

Signed-off-by: Beno=C3=AEt Sevens <bsevens@google.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@kernel.org
---
v3:
 - First get the descriptor locally and only overwrite it if the check pass=
es
 - Remove redundant dev->actconfig fetches
v2:
 - Also add sanity checks to snd_usb_mbox2_boot_quirk and
   snd_usb_mbox3_boot_quirk
---
 sound/usb/quirks.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c5fd180357d1..8538fdfce353 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -555,6 +555,7 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
 static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_in=
terface *intf)
 {
 	struct usb_host_config *config =3D dev->actconfig;
+	struct usb_device_descriptor new_device_descriptor;
 	int err;
=20
 	if (le16_to_cpu(get_cfg_desc(config)->wTotalLength) =3D=3D EXTIGY_FIRMWAR=
E_SIZE_OLD ||
@@ -566,10 +567,14 @@ static int snd_usb_extigy_boot_quirk(struct usb_devic=
e *dev, struct usb_interfac
 		if (err < 0)
 			dev_dbg(&dev->dev, "error sending boot message: %d\n", err);
 		err =3D usb_get_descriptor(dev, USB_DT_DEVICE, 0,
-				&dev->descriptor, sizeof(dev->descriptor));
-		config =3D dev->actconfig;
+				&new_device_descriptor, sizeof(new_device_descriptor));
 		if (err < 0)
 			dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
+		if (new_device_descriptor.bNumConfigurations > dev->descriptor.bNumConfi=
gurations)
+			dev_dbg(&dev->dev, "error too large bNumConfigurations: %d\n",
+				new_device_descriptor.bNumConfigurations);
+		else
+			memcpy(&dev->descriptor, &new_device_descriptor, sizeof(dev->descriptor=
));
 		err =3D usb_reset_configuration(dev);
 		if (err < 0)
 			dev_dbg(&dev->dev, "error usb_reset_configuration: %d\n", err);
@@ -901,6 +906,7 @@ static void mbox2_setup_48_24_magic(struct usb_device *=
dev)
 static int snd_usb_mbox2_boot_quirk(struct usb_device *dev)
 {
 	struct usb_host_config *config =3D dev->actconfig;
+	struct usb_device_descriptor new_device_descriptor;
 	int err;
 	u8 bootresponse[0x12];
 	int fwsize;
@@ -936,10 +942,14 @@ static int snd_usb_mbox2_boot_quirk(struct usb_device=
 *dev)
 	dev_dbg(&dev->dev, "device initialised!\n");
=20
 	err =3D usb_get_descriptor(dev, USB_DT_DEVICE, 0,
-		&dev->descriptor, sizeof(dev->descriptor));
-	config =3D dev->actconfig;
+		&new_device_descriptor, sizeof(new_device_descriptor));
 	if (err < 0)
 		dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
+	if (new_device_descriptor.bNumConfigurations > dev->descriptor.bNumConfig=
urations)
+		dev_dbg(&dev->dev, "error too large bNumConfigurations: %d\n",
+			new_device_descriptor.bNumConfigurations);
+	else
+		memcpy(&dev->descriptor, &new_device_descriptor, sizeof(dev->descriptor)=
);
=20
 	err =3D usb_reset_configuration(dev);
 	if (err < 0)
@@ -1249,6 +1259,7 @@ static void mbox3_setup_defaults(struct usb_device *d=
ev)
 static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
 {
 	struct usb_host_config *config =3D dev->actconfig;
+	struct usb_device_descriptor new_device_descriptor;
 	int err;
 	int descriptor_size;
=20
@@ -1262,10 +1273,14 @@ static int snd_usb_mbox3_boot_quirk(struct usb_devi=
ce *dev)
 	dev_dbg(&dev->dev, "MBOX3: device initialised!\n");
=20
 	err =3D usb_get_descriptor(dev, USB_DT_DEVICE, 0,
-		&dev->descriptor, sizeof(dev->descriptor));
-	config =3D dev->actconfig;
+		&new_device_descriptor, sizeof(new_device_descriptor));
 	if (err < 0)
 		dev_dbg(&dev->dev, "MBOX3: error usb_get_descriptor: %d\n", err);
+	if (new_device_descriptor.bNumConfigurations > dev->descriptor.bNumConfig=
urations)
+		dev_dbg(&dev->dev, "MBOX3: error too large bNumConfigurations: %d\n",
+			new_device_descriptor.bNumConfigurations);
+	else
+		memcpy(&dev->descriptor, &new_device_descriptor, sizeof(dev->descriptor)=
);
=20
 	err =3D usb_reset_configuration(dev);
 	if (err < 0)
--=20
2.47.0.338.g60cca15819-goog


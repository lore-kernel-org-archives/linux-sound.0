Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F1F278161;
	Thu,  9 Apr 2026 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743320; cv=none; b=uA+x5kBhT6VJfMKXJxGIzVBw9wjHm8OzN5yJMdlHSrN9Nf38qHtZxFN31Kp8FaJbLn0A+hNz60zPIe8hkz+9vj8i8lXqlrJqmnhVsfRCIH+ZrTD2WU6VJSgmTHyqGr8UEReCc1I3HJttcEASlrT/d2c/zcIDpvbIYQTNAgtE3ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743320; c=relaxed/simple;
	bh=tQHGLbsDbltrkuAA7VKjYabhk2shiu4X+YLTKXnUPXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qf7SM+kiwk+xbWSaZtuA8+FvwsW57Ki8tzQFO/OHoDQsS6/y/wRIXpPEmiGpVWqyDCzbHs1cmn+UYLpMPAQvdmIt9XN/rfaj15f4iaLZ1ud2f+kb9xs1+OJJfeFiVszuu+gO/XmwgIxOdxM016Xp/2VFqNsiNDtO9uyLFH7XnAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Zr8zodOi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zr8zodOi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1220CC4CEF7;
	Thu,  9 Apr 2026 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775743319;
	bh=tQHGLbsDbltrkuAA7VKjYabhk2shiu4X+YLTKXnUPXM=;
	h=From:To:Cc:Subject:Date:From;
	b=Zr8zodOiLFD2okAHFqTs/6K9CXdkPVN8j3Dzkq11opPObVJSy4vHu/QAano1IsAO1
	 EJoBqW69jxaz1rLDANENbT+U7KQLDSy7qhIqa7pZmyz5CAHHzQqGSgEmoQ5vrELZ7g
	 c/TSwbqIxB9aORmBANefEYR0TWp0Lc8V/Ki4W2yU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	stable <stable@kernel.org>
Subject: [PATCH] ALSA: usx2y: us144mkii: fix NULL deref on missing interface 0
Date: Thu,  9 Apr 2026 16:01:56 +0200
Message-ID: <2026040955-fall-gaining-e338@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1450; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=tQHGLbsDbltrkuAA7VKjYabhk2shiu4X+YLTKXnUPXM=; b=owGbwMvMwCRo6H6F97bub03G02pJDJnXN4YoK7DJ/RZQ2vruSaa7yGVZz2mXNmz/I1J066TrV r3QHUuudcSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEQjYwLGh6w3yhZ+2umWqq eYFZMx6yra/ensUwV0ozUvXqt8XB29KfcZ8N720IW1aoDwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

A malicious USB device with the TASCAM US-144MKII device id can have a
configuration containing bInterfaceNumber=1 but no interface 0.  USB
configuration descriptors are not required to assign interface numbers
sequentially, so usb_ifnum_to_if(dev, 0) returns will NULL, which will
then be dereferenced directly.

Fix this up by checking the return value properly.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Fixes: dee1bcf28a3d ("ALSA: usx2y: Add native ALSA driver for TASCAM US-144MKII")
Cc: stable <stable@kernel.org>
Assisted-by: gregkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/usb/usx2y/us144mkii.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/usb/usx2y/us144mkii.c b/sound/usb/usx2y/us144mkii.c
index 0cf4fa74e210..94553b61013c 100644
--- a/sound/usb/usx2y/us144mkii.c
+++ b/sound/usb/usx2y/us144mkii.c
@@ -420,7 +420,11 @@ static int tascam_probe(struct usb_interface *intf,
 
 	/* The device has two interfaces; we drive both from this driver. */
 	if (intf->cur_altsetting->desc.bInterfaceNumber == 1) {
-		tascam = usb_get_intfdata(usb_ifnum_to_if(dev, 0));
+		struct usb_interface *intf_zero = usb_ifnum_to_if(dev, 0);
+
+		if (!intf_zero)
+			return -ENODEV;
+		tascam = usb_get_intfdata(intf_zero);
 		if (tascam) {
 			usb_set_intfdata(intf, tascam);
 			tascam->iface1 = intf;
-- 
2.53.0


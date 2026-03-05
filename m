Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66D13845AD;
	Thu,  5 Mar 2026 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709504; cv=none; b=dDSYFIOTBNGC9g3UokQ/NO3cVEdo4Zo3W+J6OWTI7ji08QPdUWqDQExD+gNxglXs5VLLDPUIecU+ylw9cfNKe7K5XyiLt8QPa/43cFaoI7I84DBlVXjkO6rBC3b7R1C2Kgwngg3SIgzrHsMAUR8Dz+33gTt3PqAkCRpsYTeeLsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709504; c=relaxed/simple;
	bh=rcRHMjJ8sVRmrMIJYuF8wqW63BEDFzVNb3ol3zTZr24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DShjR5785kHw8mo7T8P0wHAFjRj0VK+aKZXUu2zHE8hhYGTiDUc/mjZPfTHr7iYo5W2g28bTpzmWCSUmrCZcP5YcGWXyjGn0Sz9NevQbugShr0tYpFRh3D41grkpQUbG80/6tvZyC5DPRS4m591dSjx3qxKBp+G0NZxNW1WHGcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5NCLOab; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5NCLOab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AFDC116C6;
	Thu,  5 Mar 2026 11:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772709504;
	bh=rcRHMjJ8sVRmrMIJYuF8wqW63BEDFzVNb3ol3zTZr24=;
	h=From:To:Cc:Subject:Date:From;
	b=b5NCLOabZI4Jlf7hzSz88qYsZpNDGqgRqgStqdev3AntTRBz03cKLmkD05bG+puU/
	 /gvS16353D38Gmmt8Rb3/P9I8WYULZRRJm+MUnMbEKayJ98GEa8N0wv9HQqIBuFH+x
	 jrCzSqppiE7jekCOzgbBvQzZuW3P6MY5BAxKyLbSrgLBN2uYE6HSguZ5wUAmmBfAT5
	 6z1bwqz0faeNzw2LwDK2X91NnJI9H3ovCLM4W05uhjuo8LQR1lIEd7R0Rp3pOj6ss7
	 T0F2x8EJfjIVCIhcThpJ8cC2ORaS/bYhuk7zzyctwLAuhd5TcEGkV4d5OzOqA5u4iW
	 RkPQysbvQUqFQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy6ij-000000004rk-3j6s;
	Thu, 05 Mar 2026 12:18:21 +0100
From: Johan Hovold <johan@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] ALSA: us122l: drop redundant interface references
Date: Thu,  5 Mar 2026 12:18:10 +0100
Message-ID: <20260305111810.18688-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Similarly, USB core holds a reference to all interfaces in the active
configuration so there is no need for a driver to take a reference to a
sibling interface only to release it at disconnect either.

Drop the redundant references to reduce cargo culting, make it easier to
spot drivers where extra references are needed, and reduce the risk of
memory leaks when drivers fail to release them.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/usb/usx2y/us122l.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index 011ea96e9779..f00b53346abd 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -520,8 +520,6 @@ static int us122l_usb_probe(struct usb_interface *intf,
 		return err;
 	}
 
-	usb_get_intf(usb_ifnum_to_if(device, 0));
-	usb_get_dev(device);
 	*cardp = card;
 	return 0;
 }
@@ -542,11 +540,9 @@ static int snd_us122l_probe(struct usb_interface *intf,
 	if (intf->cur_altsetting->desc.bInterfaceNumber != 1)
 		return 0;
 
-	err = us122l_usb_probe(usb_get_intf(intf), id, &card);
-	if (err < 0) {
-		usb_put_intf(intf);
+	err = us122l_usb_probe(intf, id, &card);
+	if (err < 0)
 		return err;
-	}
 
 	usb_set_intfdata(intf, card);
 	return 0;
@@ -574,10 +570,6 @@ static void snd_us122l_disconnect(struct usb_interface *intf)
 		snd_usbmidi_disconnect(p);
 	}
 
-	usb_put_intf(usb_ifnum_to_if(us122l->dev, 0));
-	usb_put_intf(usb_ifnum_to_if(us122l->dev, 1));
-	usb_put_dev(us122l->dev);
-
 	snd_card_free_when_closed(card);
 }
 
-- 
2.52.0


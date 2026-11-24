Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510874;
	b=FbppV49TG59J4OfFNF0VCNE854mStzbj79nvQJiapiVuC3bFpzY8iebd4mdD0x142EOJ
	 X9Tt3C3zKHPyqwvm3AxfVKQ2scY6f+kZqKSbWl5P7SIftUbnp1OKjR6d58HyES/1SX5PQ
	 s2xlGdipwf657laV4pm5ojqo8Ae56ouQoyN0eS4s8ezXqRoNNarXSOdSFDBBrJhY2cK11
	 lyitcCy136b+Z0Wd7I4LxmHdpvcdKAQPJqpahRRpEK4odaIM20JAXOWZuD7EFjF8QKWdw
	 /QCxzPsfxKbEGx/YwmHeDtJ/XTUEDpEFFIhtHNLL6J9INN/DC6L5sJqbrZzUvrCTJ+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510874;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-ZohoMailClient;
	bh=zMVxwEjKcwx0mwrBToKXrqt1zvVrJphj50TpbJderG8=;
	b=fnhg0PQ8NkfG6Shm3QWgH4IScBSl+tuJ3LunpXD6BPuBdn/bCyYe59TVsnGhnQL3a7O3
	 fDM11D/wAit2TEyqlbqyJEEytih2Zow6FOCm9LnbJKiCHDAsDI1NYSHMqq0JCmpoeflKP
	 q08klVZfWNCxPV+rF8Cw/LgnXl8Veme+9SOGVof4WV4qpz8wxoHX1ELQS1DMRNrnu8o1S
	 yEMBxU0nnVFXTu63sxE7GoPmm2knIj6gVtL/HrcxVNu7aKfPXLZF7VlqF4JYMUCHbuCqI
	 sdilNSQc7clbdvaE4zZriWp+y63Zk9ZJWfM+KanwfDzJfPjhpFGfwnIjtqzRuLpN2Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zzy040330.moe;
	spf=pass smtp.mailfrom=zzy040330.moe;
	dkim=pass header.d=zzy040330.moe header.i=@zzy040330.moe header.a=rsa-sha256 header.s=zmail header.b=RSyRRVdI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04591606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04591606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zzy040330.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zzy040330.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zzy040330.moe header.i=@zzy040330.moe header.a=rsa-sha256 header.s=zmail header.b=RSyRRVdI
ARC-Seal: i=1; a=rsa-sha256; t=1795510870; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GLlXxCcYOhe5ZgHDO2hwVdbxRpka0p33k59AO8kMm75ulbiX5LTf8MFH2unIYh42feGSycfWQFxfbHNM9zAbL4p0YKHd8ltlo/EumODwFMsnGIKkSXoy6wqrqvBgyIonOY7ZHpB3Mari1kkuR54MniD5lVhFMicwIulcvhz59sU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795510870; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zMVxwEjKcwx0mwrBToKXrqt1zvVrJphj50TpbJderG8=; 
	b=HQx/PJ+E7Y2tgi8AOYN4XGtVkXwFxEHbv+1aRD/bZtD80x7VMHSxiQHA8ISa2AzXbN2vDoJZ5FbjdaVKiv/xfcsiHvPO6E7jd+bO0dtnru25LMrXhbL8oLr/IrFNoffOhsoYZajx5Occj8JpAwv5938G6KmOiQ/KB3s3t9WG1/E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zzy040330.moe;
	spf=pass  smtp.mailfrom=sophiel@zzy040330.moe;
	dmarc=pass header.from=<sophiel@zzy040330.moe>
DKIM-Signature: a=rsa-sha256; b=RSyRRVdIxcaTN/4+HOQLXTgSWzzKuwgZRtm4E0ijZ7L2hcEFM9VM1PQYeD4GWJ5JslI7lEB5wHHoAEif3HBUw7YDii139/xLGRdKYPha/jhsiDEb878c8QVXVguadKO4GO5vveSuxen5IJZuhmB+4Wm+MbFKGmxc7ue4e5Yx9sE=; c=relaxed/relaxed; s=zmail; d=zzy040330.moe; v=1; bh=zMVxwEjKcwx0mwrBToKXrqt1zvVrJphj50TpbJderG8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795510868366356.293636797782;
	Tue, 24 Nov 2026 01:01:08 -0800 (PST)
From: Sophiel Zhou <sophiel@zzy040330.moe>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sophiel Zhou <sophiel@zzy040330.moe>
Subject: [PATCH] ALSA: usb-audio: Enable native DSD for iBasso Macaron
Date: Tue, 24 Nov 2026 17:00:51 +0800
Message-ID: <20261124090051.37375-1-sophiel@zzy040330.moe>
X-Mailer: git-send-email 2.56.0
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
X-ZohoMailClient: External

The iBasso Macaron (USB ID 262a:1a0b) exposes a UAC2 RAW_DATA
playback altsetting (altset 4, bmFormats 0x80000000, 32-bit
subslot), but ALSA reports it as SPECIAL without the DSD_RAW
quirk, preventing native DSD playback.

Add the device to the quirk flags table with QUIRK_FLAG_DSD_RAW.
This makes the altsetting available as DSD_U32_BE.

Tested with quirk_flags=262a:1a0b:dsd_raw and with the quirk
enabled through the device table entry. DSD256 playback works.

Signed-off-by: Sophiel Zhou <sophiel@zzy040330.moe>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a4eb0d0cd..36d5ed028 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2803,6 +2803,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x262a, 0x9302, /* ddHiFi TC44C */
 		   QUIRK_FLAG_DSD_RAW),
+	DEVICE_FLG(0x262a, 0x1a0b, /* iBasso Macaron */
+		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x2772, 0x0502, /* Musical Fidelity M6s DAC */
 		   0), /* for avoiding QUIRK_FLAG_DSD_RAW with vendor match */
 	DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
-- 
2.56.0


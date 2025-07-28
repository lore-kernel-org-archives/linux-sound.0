Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9969024C676
	for <linux-sound@vger.kernel.org>; Mon, 28 Jul 2025 09:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695502; cv=none; b=AN178UcHGPws54VphWI5I1YXwQjREDBmM1JO89cs6qPOhoRu0E2AkYi0zmgy0CfHaRp6R6tVLMpyG+Pu/Ehj713SzbRiXK2UEGRP6dQv8XkRaMlCqAsIrksIQTcIqxKZQcjkdGxxF8KIcsDfMKdGdB2Sm/ibVktRZFB3g4Ky8tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695502; c=relaxed/simple;
	bh=YTc7JJc9X8/4RMmqFllfr8BURm+WrUgrqSi/9wOFTeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ElqJ3qDXjCXcODWrGbxig3aPyA6hcOlVAcSyzUaQS7h44FDAcd2CrOPd5q0SoVI674GMH4iYTRNO57XFI/T47T0eGXsob65y7LPHnCDMBBq16TIGrVbAtP6liZm+tPENnHz/sal1b00BTeYJsGx5lkRDDvw2hxr+6mdzF+kvb88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=RvKqwG7A; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="RvKqwG7A"
Received: by m.b4.vu (Postfix, from userid 1000)
	id F0FE166CBE3C; Mon, 28 Jul 2025 19:00:35 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu F0FE166CBE3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1753695036; bh=QziuudDlj0ERxV4+7gVK8sC1SUCjCPuAVwNL13+dx5Q=;
	h=Date:From:To:Cc:Subject:From;
	b=RvKqwG7AUMnBebktjlAK/Xfy+Xn7vpnjRw1cD79QqZPG86Lkq54rsGGzMVTCLxgON
	 ReRRqGaP0qEaJ0dMaeQYqtZsT6qCDSASGriMZiwO6XMASYzBdNJdlGrBlL9EfLk9xM
	 JRHJ7K3RBBjjADNVuRx1Er2vJBACqmNQYV9r98St0CWWFoKv3cckSkEzIq/WpLQuJ3
	 3XYIws4xZ+w1YxyLI6QDSNm8atIi0DTeGba6rMVTEDDswlcF7xfrssI4UsIz0AvA1+
	 4zJ8lW7jXCwkfJ7/NrgGQAbK5StIWTBkqNSytX4irYz6fwj0J8CjW+d5RRuWr1vAoj
	 80jkaBkAd3Giw==
Date: Mon, 28 Jul 2025 19:00:35 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: scarlett2: Add retry on -EPROTO from scarlett2_usb_tx()
Message-ID: <aIdDO6ld50WQwNim@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

During communication with Focusrite Scarlett Gen 2/3/4 USB audio
interfaces, -EPROTO is sometimes returned from scarlett2_usb_tx(),
snd_usb_ctl_msg() which can cause initialisation and control
operations to fail intermittently.

This patch adds up to 5 retries in scarlett2_usb(), with a delay
starting at 5ms and doubling each time. This follows the same approach
as the fix for usb_set_interface() in endpoint.c (commit f406005e162b
("ALSA: usb-audio: Add retry on -EPROTO from usb_set_interface()")),
which resolved similar -EPROTO issues during device initialisation,
and is the same approach as in fcp.c:fcp_usb().

Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
Closes: https://github.com/geoffreybennett/linux-fcp/issues/41
Cc: stable@vger.kernel.org
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 93589e86828a..c6dbfbbe24d0 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2351,6 +2351,8 @@ static int scarlett2_usb(
 	struct scarlett2_usb_packet *req, *resp = NULL;
 	size_t req_buf_size = struct_size(req, data, req_size);
 	size_t resp_buf_size = struct_size(resp, data, resp_size);
+	int retries = 0;
+	const int max_retries = 5;
 	int err;
 
 	req = kmalloc(req_buf_size, GFP_KERNEL);
@@ -2374,10 +2376,15 @@ static int scarlett2_usb(
 	if (req_size)
 		memcpy(req->data, req_data, req_size);
 
+retry:
 	err = scarlett2_usb_tx(dev, private->bInterfaceNumber,
 			       req, req_buf_size);
 
 	if (err != req_buf_size) {
+		if (err == -EPROTO && ++retries <= max_retries) {
+			msleep(5 * (1 << (retries - 1)));
+			goto retry;
+		}
 		usb_audio_err(
 			mixer->chip,
 			"%s USB request result cmd %x was %d\n",
-- 
2.45.0


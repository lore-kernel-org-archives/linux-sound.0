Received: from serval.cherry.relay.mailchannels.net (serval.cherry.relay.mailchannels.net [23.83.223.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DADC21ABD7;
	Sun, 23 Aug 2026 13:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.223.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787493363; cv=none; b=m6BLTqqAJUy15znJhySQyinz/hPTBI2OfHwjo5Eb9+CA/lscJcWd0VKm8w7xc5G97xqWGF5SHp14z8TFNOBeZyCdQ+HlnXKz2PiEpXDep7tfJAjNq+qbJ57Q09TJrsdjws3bB6MYgwkj3F3H93r25sc0bIiCIE+g10mE6a+NdcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787493363; c=relaxed/simple;
	bh=rykQdJm1HzTbIj69rF1lbUqHttDWId2vdq38k1Q7XUs=;
	h=From:Subject:Content-Type:MIME-Version:To:Cc:Message-ID:Date; b=K072rgZKJgOMZYXuowubvLNu2un8CGW6b7vDkh5wqGwP9XcmhWxLzCr7b04UEAPZjkZXTAfHjXJvpd34IG9uc3FPWJpcRuVxTcIgRJ6FrlXI/mk8VrOGPfe3EwtMc7PQWF9Lxfn4Q6FOPP1BO3Djiw46deWPk7pnt2Z1QRca9kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=espilon.net; spf=pass smtp.mailfrom=espilon.net; dkim=pass (2048-bit key) header.d=espilon.net header.i=@espilon.net header.b=YQryEiTx; arc=none smtp.client-ip=23.83.223.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=espilon.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=espilon.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=espilon.net header.i=@espilon.net header.b="YQryEiTx"
X-Sender-Id: hostingeremail|x-authuser|eun0us@espilon.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6FE4B4C09F0;
	Sun, 23 Aug 2026 13:55:54 +0000 (UTC)
Received: from fr-int-smtpout28.hostinger.io (100-96-10-64.trex-nlb.outbound.svc.cluster.local [100.96.10.64])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 250A74C094C;
	Sun, 23 Aug 2026 13:55:52 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authuser|eun0us@espilon.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|eun0us@espilon.net
X-MailChannels-Auth-Id: hostingeremail
X-Abiding-Abaft: 482a522843e79ead_1787493354360_1572249432
X-MC-Loop-Signature: 1787493354360:252027823
X-MC-Ingress-Time: 1787493354359
Received: from fr-int-smtpout28.hostinger.io (fr-int-smtpout28.hostinger.io
 [148.222.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.10.64 (trex/8.0.2);
	Sun, 23 Aug 2026 13:55:54 +0000
Received: from [127.0.1.1] (2a01cb0005479a00b6daaa56fe1feac0.ipv6.abo.wanadoo.fr [IPv6:2a01:cb00:547:9a00:b6da:aa56:fe1f:eac0])
	(Authenticated sender: eun0us@espilon.net)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4hSbD4489Yz36Tt;
	Sun, 23 Aug 2026 13:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=espilon.net;
	s=hostingermail-a; t=1787493349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2bEi7OfWXJzPIJYSDS4MyeNSKvevrNJc9z4PNenzXvk=;
	b=YQryEiTxB4gpH/HCO2r+DLN/E9GatAo/6o6o7UeLhoiESiBrhxImUDLJM46IkT5p/K02qN
	y166eqHAJqz3fjx5sIVcTHZrySDhhQXVeoHVmOneZK2YSWFFTR2DT8SGr1z073axDA2K/Z
	ZG2XPazFqtxixtRACGvaH/8t5xSXdDNNlM43+IOrw2ukp2mn25PyrrzHbugqnFuXG93eaQ
	SNhbADhNf+/UAWjAo2ZuWiC0cWHmJBTtQZ3hBYMaq12JgUuD+teV/g29Aakz6yP9q5YfgG
	QeFm9dftNkc6200+GwW5ICUWx50gx8vywFYGnOCFpx9Wske7+B0qngWHhap9TQ==
From: Marouane El Moufid <eun0us@espilon.net>
Subject:
 [PATCH] ALSA: usb-audio: fix OOB write in snd_usbmidi_novation_output()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: tiwai@suse.com, clemens@ladisch.de, perex@perex.cz
Cc:
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, eun0us@proton.me
Message-ID: <178749334830.543645.13722252148340572274@espilon.net>
Date: Sun, 23 Aug 2026 13:55:48 +0000 (UTC)
X-CM-Envelope: MS4xfPAafyuA4JTegKkMnw3X4RaBwqd64a67kuvpUWuVb5rz2yjsRxm8mlqHlYUFb/NYlR7PAjBAdnOKWCg6Vb/WknD80nYkuDTeR5NPWrR/ZtjJ+aGlE/p3 05Y5St8f24KJ1KTwinpj6l/8kOBXGp5cqDaf1C6XdMF6sS+INh7c9ydiqHLhdTC/wuRp568xO5xkZOaRQusgeWD5aqTvSv3nFTyze/MfzkvA9aMSGOKaSrfS 4xKUG7K2NWcDi6k3OyGIwwRRUV15LoWnYh53lCqy4CT0dWvqIFEsMz1OmIQz7HRTsevtT8BSjedXwokxjR+RJEgl9nVFhRIub7D9PeLzRMWTrPuKwn65i0d/ nK9SY/O4C67/Q/x6qtKUXad6OqdaHaMUJB/FcRVf8ekdOPS0tqk=
X-CM-Analysis: v=2.4 cv=Gq4Q+V1C c=1 sm=1 tr=0 ts=6a8afbe4 a=mfZ/zFgjsVuE+hhpM0+GIA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=ICNSGLm3AAAA:8 a=sWOkVuoLtyRNebbM8ScA:9 a=QEXdDO2ut3YA:10 a=-W5iAdWQbIJCsXvgvhpT:22
X-AuthUser: eun0us@espilon.net

snd_usbmidi_novation_output() lays out a two-byte header at
transfer_buffer[0..1] and passes &transfer_buffer[2] together with a
length of ep->max_transfer - 2 to snd_rawmidi_transmit():

	count = snd_rawmidi_transmit(ep->ports[0].substream,
				     &transfer_buffer[2],
				     ep->max_transfer - 2);

ep->max_transfer comes from the output endpoint's wMaxPacketSize via
usb_maxpacket(). A malformed or malicious device can advertise a bulk
OUT endpoint with a wMaxPacketSize of 1 - the USB core only clamps this
value downwards - so ep->max_transfer becomes 1 and the count argument
becomes -1.

snd_rawmidi_transmit() passes the negative count on to
__snd_rawmidi_transmit_peek(), where "if (count1 > count) count1 = count"
leaves count1 negative; get_aligned_size() keeps it negative for a
byte-stream substream, so the following memcpy(buffer, ..., count1) runs
with a (size_t)-1 length and writes far past the transfer buffer, which
was allocated with usb_alloc_coherent(ep->max_transfer).

This is the same class of bug that was fixed for snd_usbmidi_akai_output()
in commit 0970274613fb ("ALSA: usb-audio: fix OOB write in
snd_usbmidi_akai_output()"); the novation output routine was left
unguarded. Bail out when the endpoint cannot hold the two-byte header
plus at least one payload byte.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Marouane El Moufid <eun0us@espilon.net>
---
 sound/usb/midi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index f8996416c3be..8a9bc37f0b6e 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -875,6 +875,8 @@ static void snd_usbmidi_novation_output(struct snd_usb_midi_out_endpoint *ep,
 
 	if (!ep->ports[0].active)
 		return;
+	if (ep->max_transfer < 3)
+		return;
 	transfer_buffer = urb->transfer_buffer;
 	count = snd_rawmidi_transmit(ep->ports[0].substream,
 				     &transfer_buffer[2],
 				     ep->max_transfer - 2);
-- 
2.47.3


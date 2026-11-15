Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.16.231.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794754849;
	b=ePYkEhBw7zx+368+SiqEQYBL/JcAB7TACpururMavihDXSXDwgXu38vZmq3ism+WoGpX
	 fqlpKr69fzMpqB4bt66wtW6MaqbxWyC/puQwqtgiForvgaolTxxq0/RP63kvbMyxI//+0
	 KP42vfNnC8F9Ilprd0KlYHokF3f5dtK76RMuQGiHlppGsDN3I8VOKC/w3DJlBFcWtVTJA
	 MdOApn4jzEVSHmxFjCk50nunumlJdE0RxQvZVG751KA1IJqHqHgWl0wzDBGSwKAQyCbnL
	 bwgUTItfh0eR/HS7gYSzD4eLQUvBGbEpBJ2fGN3McjHJvmCcME8cLSrFqqhHSgE67uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754849;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=yU7+ittQO5WshCc3ZoXf1PEBZb/1wkgkrgkefV/+ITc=;
	b=eyh5UmfLgd0a4degH3Td9LsNGpYT0vedsWRvO9oXc7oLwxDwSjw44BmxsTS9cVueT4G1
	 0Rhg68dcyHbLbASeXh9vm0nivpuKASFAwOTD11oGLf1gCIHrqYaEo8ME544U4nydMY8EY
	 3LaJ0Jd/t8GvLY+zrP2aoOoEifSMJlOx7dUAXyRUM3iDBjnI1vgw/s718f9Xj7rgjaHSD
	 SYjfmAlxUV3C97zrYhnZpkNwWNEWUof0Mk4TnDxbLFpgF8o07PncijiK1on4tSijjXPw4
	 quGsLe8JMWsdYwdcpoGUOvTpmGgsCWl1sckDMOCt5H9zRv5fbRXZOGxw0rMnZJpGsjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=b4.vu;
	spf=pass smtp.mailfrom=b4.vu;
	dkim=pass header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1 header.b=c4tMMP80;
	arc=none smtp.remote-ip=203.16.231.148
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ED4606A31D
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 15:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5ED4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1 header.b=c4tMMP80
Received: by m.b4.vu (Postfix, from userid 1000)
	id 25CB060378B2; Mon, 16 Nov 2026 01:30:40 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 25CB060378B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1794754840; bh=yU7+ittQO5WshCc3ZoXf1PEBZb/1wkgkrgkefV/+ITc=;
	h=Date:From:To:Cc:Subject:From;
	b=c4tMMP80bJ3lUp4rF3aY29V9Ep6mdhv2PqkOL2/DUDjsGt5+u1wZ9+ZNBou5FyAKc
	 m80skMUEaZ8ER0zAn5nxRIM9FSDx0FraB14b1McdBxMQZ9E8Wt8gIxGnfQG5jCDPLa
	 iDNpoGAD45Da1xfYOuzAdqmqopgTowGgW3FveL5jm+xH3Sk2zyEpwHXQt2fBdZQeRc
	 kvuhJdmhEaEjncy5kGIZlEh0CBFXxJ30rh/Hl9cXFLDBAy/LNEwTzXuLsNFxJGj5v1
	 0jg/RGinXxbXi3u0gi9c787uufPyRjjO8qCy7ZDmSDTc+ucUy0+nV5jiqrxenwztLE
	 FOzOvbinweiNQ==
Date: Mon, 16 Nov 2026 01:30:40 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
	Frank Slotta <frank.slotta@posteo.de>
Subject: [PATCH] ALSA: usb-audio: Add always_set_rate quirk for Yamaha MODX M
Message-ID: <avnJGI3L/sf7KQCi@m.b4.vu>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The Yamaha MODX M uses a different USB ID for each combination of its
audio mode and MIDI version settings:

  0499:1772  2 stereo, 44.1-96 kHz, MIDI 1.0
  0499:1763  2 stereo, 44.1-96 kHz, MIDI 2.0
  0499:1773  5 stereo, 44.1 kHz, MIDI 1.0
  0499:1764  5 stereo, 44.1 kHz, MIDI 2.0

With 0499:1773 and 0499:1764 playback is silent. With the
always_set_rate quirk flag set for them it plays. 0499:1772 and
0499:1763 play without it.

Tested on a MODX M6 with the quirk_flags module parameter set to
0499:1773:always_set_rate and to 0499:1764:always_set_rate.

Reported-by: Frank Slotta <frank.slotta@posteo.de>
Closes: https://linuxmusicians.com/viewtopic.php?p=186121
Cc: <stable@vger.kernel.org> # 7.3.x
Tested-by: Frank Slotta <frank.slotta@posteo.de>
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 7c581e283903..0a91a67d824f 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2558,6 +2558,10 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0499, 0x1516, /* Yamaha ZG02 */
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x0499, 0x1764, /* Yamaha MODX M, 5 stereo, MIDI 2.0 */
+		   QUIRK_FLAG_ALWAYS_SET_RATE),
+	DEVICE_FLG(0x0499, 0x1773, /* Yamaha MODX M, 5 stereo, MIDI 1.0 */
+		   QUIRK_FLAG_ALWAYS_SET_RATE),
 	DEVICE_FLG(0x0499, 0x3108, /* Yamaha YIT-W12TX */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x04d8, 0xfeea, /* Benchmark DAC1 Pre */
-- 
2.56.0


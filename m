Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=87.98.181.248
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620195;
	b=4CfLDKLukUUcZNsGHmT/mjntjkkVQnEDH1vxHpe5voZ6BTOPzjk6BtE9nE7kQOwAyyb1
	 udGhl+ll04W3Vu/H30NqYZ/oExuFh+wHSBPvp1dv3lAB5o2oTEqHPuyFXZsorqv712Nr1
	 HOOEB+aMg/U2eCx/2KLfvzS5BCF2XYOaaQpqSKIQFGGBa4y8ozgB8/pWiAFYzrpmIj+Lp
	 VepjsSY30EwBTV/9b68LufgO2PZUgxQtXr+m/Ym+K9tkCGvViGcOTIPAS9z4zTN8kIPBl
	 qc6mazqWknRQOV+U4BigTKi6wfulyBBEtVNi4xarI8nPjE6fqcq1AzQ3lMTvOQ5s1sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620195;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=pBDC2BgbnIqEvLnUWulTMsTHrM2uTwD94vFd7QfQ5MQ=;
	b=yj7JE76gfD4kR8sVUqKq/B09udAwDVl+ApQEuXEww2hI3T6Wg+PicTpeE0G0xkusz6+D
	 lCr/n8hdG0t6JiJs3Dc/J5gC1omWNDe/wl3ME7jrLqwxZ63duCPkOGEASWyYTLrrecGPZ
	 aIEV0nFGqlVk1dDbm7git1wrpg9gs1HBEi7C1JIh6nwwKDUM73DudEIUfzZklnrj6XzsO
	 9ZNSIkSUYDpR4XTIoYxwX14+SQCATMdTL5P+xXlxG49bzhJ0po78qs+dphcU6EswVjyhG
	 Gdr77E6hiXrsb7IJ6GlWwBrl4P6l5e91xJ6WdgxIfwyBR5jVAJ+nWLEFLtlkMhxmvkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=PNS2tLbs;
	arc=none smtp.remote-ip=87.98.181.248
Received: from 5.mo560.mail-out.ovh.net (5.mo560.mail-out.ovh.net [87.98.181.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F200606A326
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 11:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F200606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=PNS2tLbs
Received: from director2.ghost.mail-out.ovh.net (unknown [10.110.43.183])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4jJ93t2f0NzBKF1
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 11:49:46 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-lk7gq (unknown [10.110.54.206])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C358CC156D;
	Mon,  2 Nov 2026 11:49:45 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
	by ghost-submission-7ccd8bbbb6-lk7gq with ESMTPSA
	id KZIQJ9l46GpCoiIAhuyspg
	(envelope-from <michal.kopec@3mdeb.com>); Mon, 02 Nov 2026 11:49:45 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-98R0029bbe1376-0339-44af-b212-b97335df3e99,
                    1A0BC365A2A0EE6FE4E0299828BF967916D351CA) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	Michal Kopec <michal.kopec@3mdeb.com>
Subject: [PATCH] ALSA: hda/core: Stop capability walk on empty capability header
Date: Mon,  2 Nov 2026 12:49:39 +0100
Message-ID: <20261102114939.2182131-1-michal.kopec@3mdeb.com>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 8708272832907353758
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGTW4kcrLOE8RjhUI22VIDhDR0h5MgeIgYU9kMbfQ/GFkRgwpuA75AcafHgHEOeoq1x3o8CetBKv1bzhIkHWBt609Gq0K1jyHwYooKet4WdQ9sq+f7clj7nMRzIvaHeFOPUnc5/cjwJBloDTsogQlnz5XtWvH8P82+UEp2BUCBUfxyCIMF3zt48kvUTtVWy55jLr87otUl7wlJ0YnOSop/Wff3bUwp3JcEpyEqMBVCrOAnnyTpTAmcxkEdE9/FFTDTqbRrB0MV5eL3EApjvanaqcavm0v54FrOZZvhJN+ZVuP//Gu+qIsbr7GGqfSS+VeXlEeG3lG4C0A8WtuC2QPVxXH0MuBqIIX8TP6XvluoMAnepqgbyy5tv9zSSl+axef+BIhEqoROFvY2JJhNUOx0vKkBd6k73xwPQ8Z78wDQXmow9OinSRXBoyrr7OlAMn+ZTwkYBYEbrtOSzIj+Vk/yeZSho285wWWbdWmkhxmACrTEQKmQYIo9wVdyx3gAYCU8EzgWSraSP0ar8v8KcFHRuMReN6TYmmdbj0jztRPlrmIkPqu3g+JAHHonvdojwSexD9MdrhKI+mKesxdrsCzLBhz6FM4vJx8eMpJwbrloYPnUNJp9HeCmvUO5lbzZanDkHeEscYid9foMzygxoZBPPvGXDzIw8hDNlMB0V0xfVeA
DKIM-Signature: a=rsa-sha256; bh=pBDC2BgbnIqEvLnUWulTMsTHrM2uTwD94vFd7QfQ5MQ=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1793620186; v=1;
 b=PNS2tLbsWpE0uxFQOiKv5deabQakw1XfTEAXrIuuqtceJvXnXAicxLxDk960XrtBpXe/GTY1
 GjdOADQcfMRpa+Nb++8OIeS+qjzEU0IkqGw/8UJBlSGl3sd+ky/3vOgrLYv0d4DrSQJkER9gWyy
 poLF67C++ISjh6GUqngK40Pf1FtBu8F02d4xDapM6HC6h05WFzo8P0YxtiTeztvseTNRoZQHW2S
 74bgpVlyUjT5OCvWsB3C9NUL9c9PtLHHL/Vgc+QcFcDx98OlIIEQ9R8lDrklGkOniYyZO25qdR9
 84NzFsephTl8F1PRKqT/Hfvpdjsmn5x4Ht3PNd58bwgeA==

From: Michal Kopec <michal.kopec@3mdeb.com>

snd_hdac_bus_parse_capabilities() walks the controller's linked
capability list starting at LLCH. On some platforms one of the entries
reads back as all zeros. Such a header does not describe a capability,
but the walk still treats it as one: it falls into the default case and
reports an error, printing the raw register value instead of the
capability ID:

  snd_hda_intel 0000:00:1f.3: Unknown capability 0

The walk then stops anyway, because the next pointer of a zero header
is 0, so the message is only noise.

Treat an all-zero header as the end of the list, the same way a failed
read (-1) is already handled, and log it at debug level only. Also
print the capability ID in hex for a genuinely unknown capability,
instead of the full header value.

Fixes: 0b00a5615dc4 ("ALSA: hdac_ext: add hdac extended controller")
Signed-off-by: Michał Kopeć <michal.kopec@3mdeb.com>
---
 sound/hda/core/controller.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index a7acd3418ae8..52deaa9f1a91 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -445,6 +445,13 @@ int snd_hdac_bus_parse_capabilities(struct hdac_bus *bus)
 			break;
 		}
 
+		/* An all-zero header means no capability is present here */
+		if (!cur_cap) {
+			dev_dbg(bus->dev, "Empty capability header at offset 0x%x\n",
+				offset);
+			break;
+		}
+
 		switch ((cur_cap & AZX_CAP_HDR_ID_MASK) >> AZX_CAP_HDR_ID_OFF) {
 		case AZX_ML_CAP_ID:
 			dev_dbg(bus->dev, "Found ML capability\n");
@@ -475,7 +482,8 @@ int snd_hdac_bus_parse_capabilities(struct hdac_bus *bus)
 			break;
 
 		default:
-			dev_err(bus->dev, "Unknown capability %d\n", cur_cap);
+			dev_err(bus->dev, "Unknown capability ID 0x%x\n",
+				(cur_cap & AZX_CAP_HDR_ID_MASK) >> AZX_CAP_HDR_ID_OFF);
 			cur_cap = 0;
 			break;
 		}
-- 
2.56.0


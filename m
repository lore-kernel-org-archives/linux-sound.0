Received: from 4.mo561.mail-out.ovh.net (4.mo561.mail-out.ovh.net [178.33.46.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA87B31E844
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.46.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339266; cv=none; b=r+m1nxCHrDjpTwSaxpHmpMQJga7kBoTpXfVl6U/dT6nlZhQ//HmiyMts3cAGE5FARhdsxsF2O3O4TG1dpt+mMPghVdcLwECefxu3vur9NyNT+JEM6aXBWciRW16qEPA9YWUQYqxYsfo0htnTs9jweMRloDUsEoXqztjkw1sUQ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339266; c=relaxed/simple;
	bh=HoHaPtjHoYfkbv9dtFclewtiTpwiXcz72MUS8v1F7Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ogYQ/Dzjh8ZcGnk9TsJHrJeyIxfWQ507xgAVL3x/n9KDU0W5cYupP2iiwaNR56yOL60ZieoyeFxaDYUfPH4kj3u2X5Rc02Lr7IVdfW65Nw5lKrbK108iXO87UN03cpfM3L2/H8kR+AnvewuNTYszPnw7L0q60DNDzV0p12JU3pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fortytwo.fr; spf=pass smtp.mailfrom=fortytwo.fr; dkim=pass (2048-bit key) header.d=fortytwo.fr header.i=@fortytwo.fr header.b=BglLw0HX; arc=none smtp.client-ip=178.33.46.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fortytwo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fortytwo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fortytwo.fr header.i=@fortytwo.fr header.b="BglLw0HX"
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.231.178])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4j6x184Dhzz5y6T
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 11:15:24 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-g6jb4 (unknown [10.111.174.188])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0068FC010E;
	Sun, 18 Oct 2026 11:15:23 +0000 (UTC)
Received: from fortytwo.fr ([37.59.142.97])
	by ghost-submission-7ccd8bbbb6-g6jb4 with ESMTPSA
	id SwRZKUuq1GqLkAUAZOlizA
	(envelope-from <thomas.nemer@fortytwo.fr>); Sun, 18 Oct 2026 11:15:23 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-97G002cba71a3c-52dd-4ff1-974c-945b586c1852,
                    B56F0971D6B095CE003BCFC685B2F3186F5EFD30) smtp.auth=thomas.nemer@fortytwo.fr
X-OVh-ClientIp:95.173.222.53
From: Thomas Nemer <thomas.nemer@fortytwo.fr>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhinav Mahadevan <abhi220204@gmail.com>,
	Thomas Nemer <thomas.nemer@fortytwo.fr>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Fix missing sample-rate control for PreSonus AudioBox USB
Date: Sun, 18 Oct 2026 13:15:19 +0200
Message-ID: <20261018111519.191844-1-thomas.nemer@fortytwo.fr>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 12271183087021757979
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTECwDY6ynUbKWqkMeXQFbYg9bRd6yio3w7rsWEWqT1noq+4OFe/QChhGPGl0UFM6yq80jVtF+TPk0xM8/YNV/pHp9YEmPHjMjp3Wd+O18ZidHvCkWh5G+1sVl6Xx6zPIE32rrNLilFpC+fKE1UP2yL0xUYRa3C65tBve2mLCrQiqmizofo0mKnenTb6RzzXd4vS8h51a0KVT8ffzzb7hY1sPFc8VYPr0ivEYHcmWO0R/JbifqMnZE0+nRMQkYXbZqwW4Ul+0Op8Gi+emSzP2ciws2AfMs18GesHadyksTgx1y3l+HwiGhfOwJvp/8zN9HgXznruMmeVII2VjoIgKqoIcUVCM+7x3g9U4Q4ikj8NYOr6wfZkq8i9OONSfgs85CTuciOtYCC55w0E4o8Y2CoKG1jHO5CSdX4KewEs7USCF8JP99XyODQSQgE7unkJr4RpAVoFlPTQ74cKSwKepG2blFSO0gHhaYeSiZdTQuLqMufkSKYKK6ktJXEuEej5F0DLrihVhxsuWGxVyn28msZ0JprIb8lGDxSn/95MWXCmQrxLVoqK5PEJwa/jw9qSmltfs4QOGWQjNDchjXY3peJdqA/eZ4MpVIBTnaTXEX7KTegizoUoTZH1LrOCMGQ6zOTydDbDTaliIJQUBxzrfx1wtXgJiQgk9FH6qfEI0ZfGXQ
DKIM-Signature: a=rsa-sha256; bh=GvC2EkNZpLSK0S+Zb8J1W73t6EIxhICjDJ3m4zRPN/g=;
 c=relaxed/relaxed; d=fortytwo.fr; h=From; s=ovhmo5104297-selector1;
 t=1792322124; v=1;
 b=BglLw0HXajdquoFMYaeMJzWjqA67/eZjgtvG8knpnWwk602L42Jlni0UY60DsR6fMOZUSc0A
 EanytxtO+4w3sYond7siJNTxCxY8mKhcsKluQ8gYE0EgjVDTzb/Zy+/5cz2uGlJ45OWiZvRfInT
 p7wY3IJ3gCm/ZU+kFQc5JsfgmlBAgoguHNeUYjMNHRZXWu6VAwBMiuONuskoIU+Mk5DJhtDOvSo
 pjcAsBvNex3u8Yp2T2CEt0ESaAS3u+V+SOWkExUuaHckq4XgBBKhNI0nm1W4RwWqdWmxmEgv0v9
 uy0kiUhIr59sgd9pCw3GIadR1A2Y3gpCdPk5WHPnjwTGQ==

The fixed audio formats for the PreSonus AudioBox USB declare
.attributes = 0, dropping UAC_EP_CS_ATTR_SAMPLE_RATE that the device
advertises in its class-specific endpoint descriptors (EP_GENERAL
bmAttributes 0x01 on both EP 0x01 and EP 0x82).

As a result set_sample_rate_v1() bails out and the kernel never sends
the UAC1 SET_CUR SAMPLING_FREQ request, leaving the device on its
power-on default clock. Playback and capture then run distorted
whenever the stream rate differs from that default. The device keeps
the last rate set by a host as long as it stays powered, which made the
regression look intermittent (e.g. it disappears after the device was
initialized by a host running a kernel without this quirk entry).

Restore the sample-rate attribute on both streams.

Fixes: 34fe4a9df247 ("ALSA: usb-audio: Add quirk for PreSonus AudioBox USB")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Nemer <thomas.nemer@fortytwo.fr>
---
 sound/usb/quirks-table.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 2da8cbe3e6..6343a50fb2 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2911,7 +2911,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 					.iface = 2,
 					.altsetting = 1,
 					.altset_idx = 1,
-					.attributes = 0,
+					.attributes = UAC_EP_CS_ATTR_SAMPLE_RATE,
 					.endpoint = 0x01,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC,
 					.rates = SNDRV_PCM_RATE_44100 |
@@ -2932,7 +2932,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 					.iface = 3,
 					.altsetting = 1,
 					.altset_idx = 1,
-					.attributes = 0,
+					.attributes = UAC_EP_CS_ATTR_SAMPLE_RATE,
 					.endpoint = 0x82,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC,
 					.rates = SNDRV_PCM_RATE_44100 |
-- 
2.56.0


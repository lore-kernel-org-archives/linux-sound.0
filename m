Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2798929A5
	for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 18:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829819; cv=none; b=JR6gGUoaIRH4BVJiqB/kVTJbIYQ4XbckW1KcPE1/AVj0+9iW439aL119gY7wmWRTMoWIrbz0DbWvcKQpdeDNAmwpprjIMluJbH7PMqTaSFu4npUAxvvJYt4tLhm7OOnAi9C2eIYRFg3Ms4Gx0uQ6RTdAq5q+z6kTsROf60Nqmh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829819; c=relaxed/simple;
	bh=1GJ7VPzWWC5OoIpci5SsClRYGUtMhZBL/m6AZChq8AA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bq1WUAJz0SwZ6VWmmDMRoCUFjoAqbYvwlDEdEgMbVS7pjm/xG9C/kGxY3wzvHLUA6mjBWb2RnPZFLnskUKolbIDoX95bqh6Vaf7XX8nllqYGgEAahkyJ+Gez+OTZoZN5VzPpQuIE8odecQ+rvNc1KMsNdVENLmpUnj4Kiw2VCBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=Nc1CGLm8; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="Nc1CGLm8"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 2BD1A66877CF; Thu, 17 Apr 2025 04:19:23 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 2BD1A66877CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1744829363; bh=404IXrDYGxF02cZNldV+uv1lix5VJ/4UU7o7eWyL5z8=;
	h=Date:From:To:Cc:Subject:From;
	b=Nc1CGLm8GakdjCwJdEA1sRsn7lIfJN4qwUOBQb/WJohwwn/wIWMWVZnGqHIW8kQOW
	 T/wPVHq43wNIKwrgLZ9zDV9+5ESCRlTsJXfysTuHsAhDn9Ta6mG4mDsnsC7pvlS75j
	 16KiNfVapw/loM9TuuL1LsJqEGoMOJzOpIedwKbuwexejCJM5ZALq1EQMTdWIKsRvF
	 Eizzc2CNX84yXH5XO7ecepTYQfbr9pWLD+6IRY34j0nSvJUntZzjG+RWihpdeGrFj5
	 2KywIMYGULeUCLOBZaUOLeSq8L/N2MfrHuK5+JnNkzpbQp2oY4x67TGxaFHn3+O5Tk
	 j2LGHL1a8iRGA==
Date: Thu, 17 Apr 2025 04:19:23 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add retry on -EPROTO from
 usb_set_interface()
Message-ID: <Z//7s9dKsmVxHzY2@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

During initialisation of Focusrite USB audio interfaces, -EPROTO is
sometimes returned from usb_set_interface(), which sometimes prevents
the device from working: subsequent usb_set_interface() and
uac_clock_source_is_valid() calls fail.

This patch adds up to 5 retries in endpoint_set_interface(), with a
delay starting at 5ms and doubling each time. 5 retries was chosen to
allow for longer than expected waits for the interface to start
responding correctly; in testing, a single 5ms delay was sufficient to
fix the issue.

Closes: https://github.com/geoffreybennett/fcp-support/issues/2
Cc: stable@vger.kernel.org
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/endpoint.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index a29f28eb7d0c..f36ec98da460 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -926,6 +926,8 @@ static int endpoint_set_interface(struct snd_usb_audio *chip,
 {
 	int altset = set ? ep->altsetting : 0;
 	int err;
+	int retries = 0;
+	const int max_retries = 5;
 
 	if (ep->iface_ref->altset == altset)
 		return 0;
@@ -935,8 +937,13 @@ static int endpoint_set_interface(struct snd_usb_audio *chip,
 
 	usb_audio_dbg(chip, "Setting usb interface %d:%d for EP 0x%x\n",
 		      ep->iface, altset, ep->ep_num);
+retry:
 	err = usb_set_interface(chip->dev, ep->iface, altset);
 	if (err < 0) {
+		if (err == -EPROTO && ++retries <= max_retries) {
+			msleep(5 * (1 << (retries - 1)));
+			goto retry;
+		}
 		usb_audio_err_ratelimited(
 			chip, "%d:%d: usb_set_interface failed (%d)\n",
 			ep->iface, altset, err);
-- 
2.45.0


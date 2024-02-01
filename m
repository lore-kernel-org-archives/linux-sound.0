Received: from puleglot.ru (puleglot.ru [195.201.32.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1451A4D9FF
	for <linux-sound@vger.kernel.org>; Thu,  1 Feb 2024 11:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.32.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706788406; cv=none; b=NJ4c3FLElyj9jbNQC2JuZn3Go5wS0cUqJgB2urr6l9Jy4CTXQvXxZhu+7sGfZr2AY4sJ7JqkBn1sOjgH2bvIg4JOo9yZDCPuKs/iqkvpv5Ph5XOn7vVxS7PxlDIMxZnnh9/z0FECL9P83cLpDV219cYo5xr9IHC3TvS+X8i9FrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706788406; c=relaxed/simple;
	bh=5oOP4bht1T8GSC5S5pLB/bIDrJgVU/QccsXrdiC1fh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PAfczF0WU3TYWPEISvKrlL5oyNsE4N1NJxutyP/Q6YmLiVz2EZIfcCiSDkcVrZGrFKbKSur0SV9lHUmL2ns6jmW7Nw/yb2jqaP5jDTZq1V8unK9MB1WU0D06ze5h0AuX0AscdYUyCHkEowH7HgdSMbDCQgWPGgrOFEe1M9NFl1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me; spf=pass smtp.mailfrom=puleglot.ru; dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b=p1s4HjkT; arc=none smtp.client-ip=195.201.32.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puleglot.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b="p1s4HjkT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HfyPbCpGNXGGHMMxOtkxYsa+qUDoLnWX4zlJhqQCbsE=; b=p1s4HjkTw9CV8ewj8cDFnyQEnS
	oOThLLWh5iStoLMXz1ZLRB9e3A87c9EfP35cnozsHTQ8EjgM/FjWvthTeY7FVLb5y8yPzM+VoLjHA
	sZn06q8V/wZsuHPKP6CMo4mOfZFej51WDTPWluEnd+pfujoHGOVHuIgUeBCNmIa9npNk=;
Received: from [2a00:1370:819a:ceb:89dc:eced:962a:5b2f] (helo=home..)
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rVVd9-00000000yzA-3Twx;
	Thu, 01 Feb 2024 14:53:19 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: usb-audio: Ignore clock selector errors for single connection
Date: Thu,  1 Feb 2024 14:53:08 +0300
Message-ID: <20240201115308.17838-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: puleglot@puleglot.ru

For devices with multiple clock sources connected to a selector, we need
to check what a clock selector control request has returned. This is
needed to ensure that a requested clock source is indeed selected and for
autoclock feature to work.

For devices with single clock source connected, if we get an error there
is nothing else we can do about it. We can't skip clock selector setup as
it is required by some devices. So lets just ignore error in this case.

This should fix various buggy Mackie devices:

[  649.109785] usb 1-1.3: parse_audio_format_rates_v2v3(): unable to find clock source (clock -32)
[  649.111946] usb 1-1.3: parse_audio_format_rates_v2v3(): unable to find clock source (clock -32)
[  649.113822] usb 1-1.3: parse_audio_format_rates_v2v3(): unable to find clock source (clock -32)

There is also interesting info from the Windows documentation [1] (this
is probably why manufacturers dont't even test this feature):

"The USB Audio 2.0 driver doesn't support clock selection. The driver
uses the Clock Source Entity, which is selected by default and never
issues a Clock Selector Control SET CUR request."

Link: https://learn.microsoft.com/en-us/windows-hardware/drivers/audio/usb-2-0-audio-drivers [1]
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217314
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218175
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218342
Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/clock.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index a8204c6d6fac..60fcb872a80b 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -347,8 +347,16 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 			    !writeable)
 				return ret;
 			err = uac_clock_selector_set_val(chip, entity_id, cur);
-			if (err < 0)
+			if (err < 0) {
+				if (pins == 1) {
+					usb_audio_dbg(chip,
+						      "%s(): selector returned an error, "
+						      "assuming a firmware bug, id %d, ret %d\n",
+						      __func__, clock_id, err);
+					return ret;
+				}
 				return err;
+			}
 		}
 
 		if (!validate || ret > 0 || !chip->autoclock)
-- 
2.43.0


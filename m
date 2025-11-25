Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D7232572E
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764081706; cv=none; b=eIoou3cC6po3ReF+0rHeSnhkWi1r9I3MK2iVMvojNkCVdDhOsVmrOOjK4jfQgFN6UwAP9HECF2OTdBDTKnjeesh8uvSN+CBrUtjzPXSKBDe8cUQB2w8wIkhTalUoZpIKJolBNMRloPpQGOXHYhBNJMDxHGCxxmuet3APUCJ6Npk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764081706; c=relaxed/simple;
	bh=bJIiHMOszMPg4DATqWEXjj+3LYweY34XpOpbY2v2P6Q=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=XUkbJfO24YnY2SAVFB6AEFW/JnRL3zRAsb1r75yXa6fh27k7X4D/0AoZcNGgCSxMDicSLKZ7pbt//ZLdqjgtTc/Hx9HhHpNcmkXt8PlX1wzDmX6HTY1R/yR5foQTzhxcM1XZW92GU4fypZRwIBb+dU+NMj+nTjZz0aTJ2B12tfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=FahlVrZO; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="FahlVrZO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=X4pNy/eKDYj8kP00Qj95XTfZfbtOiTMAT/XG/4PRq6s=; b=F
	ahlVrZOKW1XPdTw4gs58GySdqT7Oknc/Pho1FHLZKgic5YMOpwtQD4pKQe82SLe+EIrFlznrDAdGh
	yiwJnx0uelhCJhgcXEUHYziiazopf6Y4SlVOIG7XZHJBsf21URqrBVqmQd5dyWXr3QcF/39VLD/W+
	/PoQykZwh0CPiA5XPGNXBbBfxIGVuSOVMRZLTioBzbwlPQFH2FtBgW6KLLp1eAAkbdwF5oaNoseYc
	QowaAlXBcxeoTz258A+6d5BTEYmy5PlajYTqIeJRRdupH+XTBfONAXKE+jSAE5ysReB0SVnsjulX5
	Bkg93yUzkEdPhllyyo8fR2ygVfsSUDhxg==;
Date: Tue, 25 Nov 2025 15:41:49 +0100 (CET)
Message-Id: <20251125.154149.1121389544970412061.rene@exactco.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: usb-audio fix uac2 clock source
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Since 8b3a087f7f65 ("ALSA: usb-audio: Unify virtual type units type to
UAC3 values") usb-audio is using UAC3_CLOCK_SOURCE instead of
bDescriptorSubtype, later refactored with e0ccdef9265 ("ALSA: usb-audio:
Clean up check_input_term()") into parse_term_uac2_clock_source().

This breaks the clock source selection for at least my
1397:0003 BEHRINGER International GmbH FCA610 Pro.

Fix by using UAC2_CLOCK_SOURCE in parse_term_uac2_clock_source().

Fixes: 8b3a087f7f65 ("ALSA: usb-audio: Unify virtual type units type to UAC3 values")
Signed-off-by: René Rebe <rene@exactco.de>
---
Tested and shipped since 2022-07-24 in T2/Linux.
---
 sound/usb/mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 72b900505d2c..3af71d42b9b9 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -921,7 +921,7 @@ static int parse_term_uac2_clock_source(struct mixer_build *state,
 {
 	struct uac_clock_source_descriptor *d = p1;
 
-	term->type = UAC3_CLOCK_SOURCE << 16; /* virtual type */
+	term->type = UAC2_CLOCK_SOURCE << 16; /* virtual type */
 	term->id = id;
 	term->name = d->iClockSource;
 	return 0;
-- 
2.46.0

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

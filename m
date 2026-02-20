Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607D2DC350
	for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603619; cv=none; b=Cg39vi7ME/Kqhq1gsb8N5FzgufbURD0XZQsYab6OMUx4sB+0Gp6D9giYd3oysohZYE5RFwXrRzhT2hTr5FDLueyK+OWvTwN6RaFHgz7esxqSwk78J8Vu9UTvJZZYN8UyD0nplTq2lySGujv6J+aqEqu3NbZ1JruS9esrqUIxQzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603619; c=relaxed/simple;
	bh=mUKxEjqNRS+tMr/vVGZ7I9ruEULS7CXyob49YpgHwVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6/zCe1QDhm0JE+Rbr8n1IIQM02Ijj6+fVgkmD76xVKVSSO4TKwUlLldTr9dWvn/d8Y4KBx5FkE272Q0UhX84kBMyRYY+OL5SJzJ718khKpG33/9rdf0dfDd8/iGDBdZT++JTuKUGMdOan3vtt2qpZ/QpZ2JBWAYi/xsbPT4a4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=QI6r4Dd1; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="QI6r4Dd1"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 8895B6756E24; Sat, 21 Feb 2026 02:36:56 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 8895B6756E24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1771603616; bh=oJNtwCqvYhRPsB/oSaGCCXQIYhVB1x+lkyUNzhwTxbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QI6r4Dd1QlMJqanl89BvedIFbrUZ4xdLk3o5b7793p5N/8LN5x01Qg32ES7DQyVjr
	 uM9nb/LEmVsiV0gO31Wiqy/buNr0gELWMryIVbCF2lOCNakWgTL+mVm/Ils1RJy2WS
	 NrkFup24Oto5smvQHFXBKHzHzE5a8Uz4n+qeEZsEtVJwO8kkPUoXySsHTm+pqpohLi
	 OYtlIi+fSXWcnuv24F9BDn9p/Nind9sosrxi22mFpZsGSLkRtcjM0qh6k4/n/E18UL
	 12F7OYFxB3qNmn4+R5uCVJYEN85+ZLKf5OWH1E8E/ECI8TJtWfM4ibWCwkxLsHg+fO
	 YMREVgA7KRtIg==
Date: Sat, 21 Feb 2026 02:36:56 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	Alexander Tsoy <alexander@tsoy.me>, Tina Wuest <tina@wuest.me>
Subject: [PATCH 4/4] ALSA: usb-audio: Skip clock selector for Focusrite
 devices
Message-ID: <00e53ae0a508b41516b41833daa17823381a649c.1771594828.git.g@b4.vu>
References: <cover.1771594828.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1771594828.git.g@b4.vu>

Add QUIRK_FLAG_SKIP_CLOCK_SELECTOR for Focusrite devices.

During interface parsing, snd_usb_clock_find_source() reads the clock
selector value then writes it back unchanged. On Focusrite devices
this redundant write results in a ~300ms delay per altsetting, adding
~1.8s to probe time on a typical device with 6 altsettings.

Enabling SKIP_CLOCK_SELECTOR skips the redundant write-back.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 5c977ba3c944..ffc08ee869ae 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2424,6 +2424,7 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	VENDOR_FLG(0x07fd, /* MOTU */
 		   QUIRK_FLAG_VALIDATE_RATES),
 	VENDOR_FLG(0x1235, /* Focusrite Novation */
+		   QUIRK_FLAG_SKIP_CLOCK_SELECTOR |
 		   QUIRK_FLAG_SKIP_IFACE_SETUP),
 	VENDOR_FLG(0x1511, /* AURALiC */
 		   QUIRK_FLAG_DSD_RAW),
-- 
2.53.0


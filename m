Received: from puleglot.ru (puleglot.ru [195.201.32.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C7A2F1FE2
	for <linux-sound@vger.kernel.org>; Mon, 30 Jun 2025 01:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.32.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751248663; cv=none; b=Sr3qJZqR/FQAMc2YFhqzBEto+qu/m4JnHV0FAaXAzoyyGFn9hLeRoRQFu9hQFq4V6Ji9NgbhLjVrOm+Ac2l1dSDOo2+CacS7LZ+UOujKeY1GT0PXIe4e9c4XXMLQDtDJXvUKKW6AW+5Aupk7sApWfNhLqVm+cOTtBHVD+ILTpkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751248663; c=relaxed/simple;
	bh=LLNm6cw7VUiETBLLF4Ro2GLEQyuUXCi65kgSVY04IrM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=VuBF2EsCwEvGPZTlMItD8wTRGlVtTmIpzg+eNl4GJCov/fy4G5bTbAX6f2JOgVJywthi2Ug4NrC05CgaLMyFk/K+UhHXdH4VuojVHRGBBSHEaa5uRjX96hdx+X6vSuQre+CGr495WuHKfRdAi1hHyZK1hLgb2Cs0mtPxSCij7II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me; spf=pass smtp.mailfrom=puleglot.ru; dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b=Np1XlP6x; arc=none smtp.client-ip=195.201.32.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puleglot.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b="Np1XlP6x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=t5+/rI9Qn/uKsHyHVbu9UYvPCwXKLt7/dS98Aip4I1o=; b=Np1XlP6xbJzdAOtnAJxPVQe/bC
	mLWaULRkNYhP/Ainbg9mGHDDsr+L/taZj4CtAnUMAUguhYlv1By0m7tG8d6EoEqSr4S9q12vdOCtA
	5opw4mL5E5v6+zTd3Ryo1Fk1X7VjhuGHpJQs9sHnBijGE5NRzYJONOHaXHqahUVmRoUQ=;
Received: from [62.217.191.191] (helo=home.puleglot.ru)
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1uW3PJ-00000000QI3-4AIt;
	Mon, 30 Jun 2025 04:34:06 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Improve filtering of sample rates on Focusrite devices
Date: Mon, 30 Jun 2025 04:33:57 +0300
Message-ID: <20250630013357.1327420-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: puleglot@puleglot.ru

Previously we were filtering out only upper unsupported sampling rates.
This patch adds filtering of the lower unsupported sampling rates. As a
result there is 1:1 mapping between altsetting and supported rates.

The issue was found on a Scarlett 3rd Gen card (see linked bug), but the
same filtering is likely needed for the Scarlett 1st and 2nd Gen as well
as the older Clarett cards which lacks Valid Alternate Setting Control.

Patch was not tested on a real hardware.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=214493
Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/format.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 8cd54f7bf33a..0ee532acbb60 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -310,16 +310,14 @@ static bool focusrite_valid_sample_rate(struct snd_usb_audio *chip,
 					struct audioformat *fp,
 					unsigned int rate)
 {
-	struct usb_interface *iface;
 	struct usb_host_interface *alts;
 	unsigned char *fmt;
 	unsigned int max_rate;
 
-	iface = usb_ifnum_to_if(chip->dev, fp->iface);
-	if (!iface)
+	alts = snd_usb_get_host_interface(chip, fp->iface, fp->altsetting);
+	if (!alts)
 		return true;
 
-	alts = &iface->altsetting[fp->altset_idx];
 	fmt = snd_usb_find_csint_desc(alts->extra, alts->extralen,
 				      NULL, UAC_FORMAT_TYPE);
 	if (!fmt)
@@ -328,20 +326,20 @@ static bool focusrite_valid_sample_rate(struct snd_usb_audio *chip,
 	if (fmt[0] == 10) { /* bLength */
 		max_rate = combine_quad(&fmt[6]);
 
-		/* Validate max rate */
-		if (max_rate != 48000 &&
-		    max_rate != 96000 &&
-		    max_rate != 192000 &&
-		    max_rate != 384000) {
-
+		switch (max_rate) {
+		case 48000:
+			return (rate == 44100 || rate == 48000);
+		case 96000:
+			return (rate == 88200 || rate == 96000);
+		case 192000:
+			return (rate == 176400 || rate == 192000);
+		default:
 			usb_audio_info(chip,
 				"%u:%d : unexpected max rate: %u\n",
 				fp->iface, fp->altsetting, max_rate);
 
 			return true;
 		}
-
-		return rate <= max_rate;
 	}
 
 	return true;
-- 
2.49.0


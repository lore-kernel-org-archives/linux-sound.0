Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268EA2D97A4
	for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 16:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603430; cv=none; b=o6hs4M0+9Fm8DNW3S5P2VjdVJlM7neV8325PXV/TiYEuazjYY6vUKhh1bbfOXT3hqWsYD8VnOFrLzTZe9CFx4Ezhr4wvrMWTZIkSptk1dGAcNa3fneEp8SqIg4A6OqKTVLhPETW2tIdkzuXZotpl3ryQmAB1a6cT65OHzBKpx9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603430; c=relaxed/simple;
	bh=b88zze8k5NROh+MTrdZnOXfAzgSBPaitOk41RGlPE7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6KynrHgv8YY1M0RKycowcDde4UiD4llpjK1XLSwipSWPRC/2Wg0omr5LTBq1kvZ/j/zNRtyx5dUtBq/2cAE6CpozNt9y2ESs4urex0kv97j/NvgTmtNORC6udf/yN+l2et9p9XD3TcZS7Si/kVfS+3wtzggdL8CPyPgU1brFPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=m/FCSqpA; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="m/FCSqpA"
Received: by m.b4.vu (Postfix, from userid 1000)
	id E36D06756E04; Sat, 21 Feb 2026 02:33:45 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu E36D06756E04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1771603425; bh=/oCC+oyQpeM/yppRde/tz2PC5G/0JNwi3DbhGct3obk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/FCSqpAP2gGgguwo86p8CfeK4F9XvTzVtXuO51qzo7QwBoE8rurkAy+res6fK3JD
	 k2hy40uJ0jnUBWIsiHoXs1cLZniSTUgY9DVjguQoiLgZYTFsiK3hH7GNEbcLxVVp0v
	 /qvaMrrg0H0z8VeLS+LL8nz3N5NKm88AxuDJGZXFOiLhsgbAX9KWeH2l9K4ozmr9RB
	 PBOa8sRTU7ncgbIbblM71NQAUlGouNFugV8jzkx3dwu2dNI1a1IFU8Q4fwTq4pCh8C
	 sGQYgIdaLZtJqykiaIPbhpUiEeXKG1uZKcjh6P/aMjod1azCGxBCsWWN3wceGKCiLj
	 XBK4G9LFqIzKg==
Date: Sat, 21 Feb 2026 02:33:45 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	Alexander Tsoy <alexander@tsoy.me>, Tina Wuest <tina@wuest.me>
Subject: [PATCH 1/4] ALSA: usb-audio: Improve Focusrite sample rate filtering
Message-ID: <7e18c1f393a6ecb6fc75dd867a2c4dbe135e3e22.1771594828.git.g@b4.vu>
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

Replace the bLength == 10 max_rate check in
focusrite_valid_sample_rate() with filtering that also examines the
bmControls VAL_ALT_SETTINGS bit.

When VAL_ALT_SETTINGS is readable, the device uses strict
per-altsetting rate filtering (only the highest rate pair for that
altsetting is valid). When it is not readable, all rates up to
max_rate are valid.

For devices without the bLength == 10 Format Type descriptor extension
but with VAL_ALT_SETTINGS readable and multiple altsettings (only seen
in Scarlett 18i8 3rd Gen playback), fall back to the Focusrite
convention: alt 1 = 48kHz, alt 2 = 96kHz, alt 3 = 192kHz.

This produces correct rate tables for all tested Focusrite devices
(all Scarlett 2nd, 3rd, and 4th Gen, Clarett+, and Vocaster) using
only USB descriptors, allowing QUIRK_FLAG_VALIDATE_RATES to be removed
for Focusrite in the next commit.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/format.c | 70 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 65 insertions(+), 5 deletions(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 64cfe4a9d8cd..1207c507882a 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -305,17 +305,48 @@ static bool s1810c_valid_sample_rate(struct audioformat *fp,
 }
 
 /*
- * Many Focusrite devices supports a limited set of sampling rates per
- * altsetting. Maximum rate is exposed in the last 4 bytes of Format Type
- * descriptor which has a non-standard bLength = 10.
+ * Focusrite devices use rate pairs: 44100/48000, 88200/96000, and
+ * 176400/192000. Return true if rate is in the pair for max_rate.
+ */
+static bool focusrite_rate_pair(unsigned int rate,
+				unsigned int max_rate)
+{
+	switch (max_rate) {
+	case 48000:  return rate == 44100 || rate == 48000;
+	case 96000:  return rate == 88200 || rate == 96000;
+	case 192000: return rate == 176400 || rate == 192000;
+	default:     return true;
+	}
+}
+
+/*
+ * Focusrite devices report all supported rates in a single clock
+ * source but only a subset is valid per altsetting.
+ *
+ * Detection uses two descriptor features:
+ *
+ * 1. Format Type descriptor bLength == 10: non-standard extension
+ *    with max sample rate in bytes 6..9.
+ *
+ * 2. bmControls VAL_ALT_SETTINGS readable bit: when set, the device
+ *    only supports the highest rate pair for that altsetting, and when
+ *    clear, all rates up to max_rate are valid.
+ *
+ * For devices without the bLength == 10 extension but with
+ * VAL_ALT_SETTINGS readable and multiple altsettings (only seen in
+ * Scarlett 18i8 3rd Gen playback), fall back to the Focusrite
+ * convention: alt 1 = 48kHz, alt 2 = 96kHz, alt 3 = 192kHz.
  */
 static bool focusrite_valid_sample_rate(struct snd_usb_audio *chip,
 					struct audioformat *fp,
 					unsigned int rate)
 {
+	struct usb_interface *iface;
 	struct usb_host_interface *alts;
+	struct uac2_as_header_descriptor *as;
 	unsigned char *fmt;
 	unsigned int max_rate;
+	bool val_alt;
 
 	alts = snd_usb_get_host_interface(chip, fp->iface, fp->altsetting);
 	if (!alts)
@@ -326,9 +357,21 @@ static bool focusrite_valid_sample_rate(struct snd_usb_audio *chip,
 	if (!fmt)
 		return true;
 
+	as = snd_usb_find_csint_desc(alts->extra, alts->extralen,
+				     NULL, UAC_AS_GENERAL);
+	if (!as)
+		return true;
+
+	val_alt = uac_v2v3_control_is_readable(as->bmControls,
+					       UAC2_AS_VAL_ALT_SETTINGS);
+
 	if (fmt[0] == 10) { /* bLength */
 		max_rate = combine_quad(&fmt[6]);
 
+		if (val_alt)
+			return focusrite_rate_pair(rate, max_rate);
+
+		/* No val_alt: rates fall through from higher */
 		switch (max_rate) {
 		case 192000:
 			if (rate == 176400 || rate == 192000)
@@ -344,12 +387,29 @@ static bool focusrite_valid_sample_rate(struct snd_usb_audio *chip,
 			usb_audio_info(chip,
 				"%u:%d : unexpected max rate: %u\n",
 				fp->iface, fp->altsetting, max_rate);
-
 			return true;
 		}
 	}
 
-	return true;
+	if (!val_alt)
+		return true;
+
+	/* Multi-altsetting device with val_alt but no max_rate
+	 * in the format descriptor. Use Focusrite convention:
+	 * alt 1 = 48kHz, alt 2 = 96kHz, alt 3 = 192kHz.
+	 */
+	iface = usb_ifnum_to_if(chip->dev, fp->iface);
+	if (!iface || iface->num_altsetting <= 2)
+		return true;
+
+	switch (fp->altsetting) {
+	case 1:		max_rate = 48000; break;
+	case 2:		max_rate = 96000; break;
+	case 3:		max_rate = 192000; break;
+	default:	return true;
+	}
+
+	return focusrite_rate_pair(rate, max_rate);
 }
 
 /*
-- 
2.53.0


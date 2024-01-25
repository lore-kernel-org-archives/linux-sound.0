Received: from puleglot.ru (puleglot.ru [195.201.32.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF5F1386B9
	for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 20:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.32.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706216113; cv=none; b=gF2PcCkiBRFhL+Y6WCvwUndFGOsR5ILaQh0qKMw/BvhiPuM0kfMUvTzXU3bcrT2zGXyIN8OMPYe41vsxtm4Zlnxu6uJYiMY6YdZdnslFvvuhQtldYKBsLjbDdDcyBpKrvpNRx5Ao6iq0iesDmhfK0ErwGPm8+dQxfpNavQpYMO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706216113; c=relaxed/simple;
	bh=xYJVIJL2ocLD3M3GJdlapKVvrCU/7qNN3oE7Yr2gQS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=npj7ztKVenkdmarmIzDf9rhNw8pmCHlxPeKE45T+aAoVsXn0X5DUdv8PmnLfHlMdVM7tEjhU43kwMgr9qmz4IVOXE2iPKtbXOSphqZ0M7yOXSf2i8FCvIEaEMnyw45NLtKTgsA86EPC3s4jh89x6LZ3lB+TjiKusgmHfZBDRIsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me; spf=pass smtp.mailfrom=puleglot.ru; dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b=qXVCG/AR; arc=none smtp.client-ip=195.201.32.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puleglot.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b="qXVCG/AR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IiSfffQQUFr9J5T+WnBjM0E4k0dpvmpjFIYfPhZ/few=; b=qXVCG/ARQgXh3t7se7BAQrWyC1
	9JCwAh1UBWhrB+U2plM5p2MeWCyxKGif7nvmQ3Sk7eeFjsmtgEulQckpIJGd8yyi1HfA2t13Ddlfe
	UgqOkasobRRKorBBStGW9WwfMSC+lK8iVCDPX6iiCI9om2JfRSFyHvqtGqU+RC2kDwP0=;
Received: from [2a00:1370:819a:c53:3baa:da0a:1172:ed3d] (helo=home..)
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rT6ke-00000002ELf-08WP;
	Thu, 25 Jan 2024 23:55:08 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Support read-only clock selector control
Date: Thu, 25 Jan 2024 23:54:57 +0300
Message-ID: <20240125205457.28258-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: puleglot@puleglot.ru

Clock selector control might be read-only. Add corresponding checks
to prevent sending control requests that would fail.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/clock.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 94e4aaeafe58..7b259641adb5 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -261,6 +261,8 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 	int ret, i, cur, err, pins, clock_id;
 	const u8 *sources;
 	int proto = fmt->protocol;
+	bool readable, writeable;
+	u32 bmControls;
 
 	entity_id &= 0xff;
 
@@ -292,11 +294,27 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 		sources = GET_VAL(selector, proto, baCSourceID);
 		cur = 0;
 
+		if (proto == UAC_VERSION_3)
+			bmControls = le32_to_cpu(*(__le32 *)(&selector->v3.baCSourceID[0] + pins));
+		else
+			bmControls = *(__u8 *)(&selector->v2.baCSourceID[0] + pins);
+
+		readable = uac_v2v3_control_is_readable(bmControls,
+							UAC2_CX_CLOCK_SELECTOR);
+		writeable = uac_v2v3_control_is_writeable(bmControls,
+							  UAC2_CX_CLOCK_SELECTOR);
+
 		if (pins == 1) {
 			ret = 1;
 			goto find_source;
 		}
 
+		/* for now just warn about buggy device */
+		if (!readable)
+			usb_audio_warn(chip,
+				"%s(): clock selector control is not readable, id %d\n",
+				__func__, clock_id);
+
 		/* the entity ID we are looking at is a selector.
 		 * find out what it currently selects */
 		ret = uac_clock_selector_get_val(chip, clock_id);
@@ -326,7 +344,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 		if (ret > 0) {
 			/* Skip setting clock selector again for some devices */
 			if (chip->quirk_flags & QUIRK_FLAG_SKIP_CLOCK_SELECTOR ||
-			    pins == 1)
+			    pins == 1 || !writeable)
 				return ret;
 			err = uac_clock_selector_set_val(chip, entity_id, cur);
 			if (err < 0)
@@ -337,6 +355,9 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 			return ret;
 
 	find_others:
+		if (!writeable)
+			return -ENXIO;
+
 		/* The current clock source is invalid, try others. */
 		for (i = 1; i <= pins; i++) {
 			if (i == cur)
-- 
2.43.0


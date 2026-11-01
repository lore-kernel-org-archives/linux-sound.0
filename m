Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530863;
	b=iNFkQVWDMlAG1J7tbOmAShRAZnqOJggqtbO6u4ccsm+vzCPvFMujZnfdZ3aS3dCfunu5
	 5qZNDI6PCuuOcek2gwDNpEUV6Vd0tjqc143SxjQRxuXjZsvAe2f/9BhEXAe4oWJBPX0ay
	 8HVXs/yx9Lp/mU8gNYV1pa352Xm9eg4+VZyB221Rn+93txMP2Fned9fWwOMbn9VhfTD9x
	 jrPQNxzcv1KYCCkVvwLhEKqk6DOht1mY93NJ13qiOdNRMDNJtFDgw+TDaXdNNPBpLT33N
	 Ictfw+0TD5UcPc98u+RIU1jBwWBO2wBcdvSWOkOgiDxC5lU0PDG4urOq/RhIcOs6OfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DR8EHEB/wE8IxToZEnTGR4gkIB/0d5usSwQCXW/bLZI=;
	b=vrK4Kkajk0icjmGgKMXNrAJUivjt0Qj2TqdOsRF18GzV0PZhrY9IWiHrVGTDtAOiuXb2
	 vI+YJnxJVvrhgenp0RrWm4mB5t/YVcfvEd78iJTG88HMxVxBeLfWglzpQNmVPMQeEpTNl
	 MxydBKjhdtiA4FgykU1oGn6irIBIf713ZGCwgJcuOP9Ik+Rdi+fPFRdxo0f3FK29L1ePL
	 BGHuzXAtAqRRVqOWOKM4InWbz706vJvNmqlBoedyZdRob8QJExq7GaBkZLVU/1h0Crycy
	 +mpLoEdDXoG6+jdAeLFc8apdgIzCs+gi96sZIumqmZCvB586EzZRQo3dnlDr1LiPMCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UBdr58AR;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E05606A324
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 11:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18E05606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UBdr58AR
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so15847675e9.3
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 03:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530861; x=1794135661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DR8EHEB/wE8IxToZEnTGR4gkIB/0d5usSwQCXW/bLZI=;
        b=UBdr58ARVBwpOc+oOsqWf7CKDj7aEvQaBzIlsXLtvsE6BHar7mAGb45UB77fjkH0Eo
         TSfY881vf5cKYWf8FH17tIKMqFD25wY3CVOe5Qw4LeCufgTTJjqH5lIAu2C47eyUsnQU
         15Fed87scs1qa1wD7MeW8nwoe0yyThc+dS94WD6QDiK/wEHDKufPiSWNrkufVFy8yEEU
         Wru/hzwn12rg0SeO3wHLk6oSmSnLxUBve8uoB4ibyT9VCYHcJKMGYrWe+uFs9zCGWFXA
         O36wUOdHUPeYCawRdSXiC5BDsIYVioBV7gJzdaiJ4hVs5UdqeQKbGUMCVjrQy23XfLhc
         tAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530861; x=1794135661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DR8EHEB/wE8IxToZEnTGR4gkIB/0d5usSwQCXW/bLZI=;
        b=Hjt0JvJK+LaJ7kheePDhseOe2pXqNwtAxgpxXqRrc2oOGmqWdlWeC1SxQv4BIDWc0F
         vT/ui5k+XVuvV4laUGCZsD5hBgnV1tgJbaxzfXRaFqPESJ6A5MTbRms+wDpSM4CX4Hlb
         9EonpjD26ER8GGRrhqbCPcJIXdv0ieB9/LEI2ikSqn+su3zjQVIi1BsYpD1e3lt4oFyW
         WdEdI4SYJAFljs/OgWvR/swiahNpJLPFG5Kp8mryK5jpkdG3dnlICh8Rgvvjv4woOTqg
         7m4hwm/cAGZIZngrBHKotTxyJGE6WUo4z1iLEH0m/yDpCDhFuxZnvgPJbU3a67vEkzAX
         WNww==
X-Forwarded-Encrypted: i=1; AKwUvBx9Urp/lRMsV9mE5KRlH7PDiY8BzyMfbhuDTleUij7a7lxwOb/9MJUMk55DDmBY7ebwaOmRPzZvGiGB+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKyoTcwrBbgDn/zcQ0DRGh502emgcrYNuXOPQR1Vo+G1cJE9QTp
	dyN9kdHnDBtS18oucolVeg+yv9XvNugdi4ZsN01BsUIUmmyZSe8VUgC5
X-Gm-Gg: AYBFou0YOrLtzHBr2nKSOwD0C0Ir4c4CRz1yA6wnlQTYv3d13eArMFWzvYhcqaUANry
	VjoPfq5u5yQe3CNPv297BSnaP75HqOXNoSVlCCE8xu7FaE88cyXu2CIM112lN4Ad93EqKut38vj
	iyhvisD3C5WjXR9TCjEU/2DNpt1Ww4yiBU5kwn37TCSJi5eDSwWymog/lxwj33uGUQTf/yQsOyp
	RX4tbTqDY2t714zz6brfStFKRFgT8gHvGKhr0CPpf0fOqfse9MKDRuCIeNhAK6zSmyEoCcsCxAx
	G0Hnj7xzTWu7ds0Ml0HDshqarZIdXsiplSaFfNgBBGOiOVVFwrb5WaWgPRsuGQTA4S6Zudx+Qm/
	JyGyblqEPDhYUHE3NJXTgGc9gkagqVCIAx071Ic0D7rMz/pL4YYpBRIRuJde9wOMgFW7Bwf8TpY
	T3USRNXaAnu92fp2+IMRao1N65DHtqOx9HiqDv2zExpU4otF1NvKU9CESbX7/vqtdAB61kbibGd
	25hPfuz1/gstWKAm51wZ22zxbWFCL6ZzvL/JC+7hx3Ghzl20Wq0TwB2Yh4VZj2olztdFfkNdUPB
	iQM9eat4sTeDoksF0U+YrZ2NWGFrGWPl65k35ZLnoYVg6us=
X-Received: by 2002:a05:600c:8483:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4ac1889d4b5mr158122415e9.27.1793530861299;
        Sun, 01 Nov 2026 03:01:01 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:1f0e:d397:58dc:8e89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm12388432f8f.28.2026.11.01.03.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 03:01:00 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 1/4] ASoC: rt721-sdca: handle HID button read errors
Date: Sun,  1 Nov 2026 13:00:57 +0200
Message-ID: <20261101110056.423353-5-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rt_sdca_button_detect() returns zero when a regmap read fails,
so RT721 treats the error as a valid no-button result.

Return the original error and skip button reporting when a read
fails. Still report jack changes, and clear button state if the
headset is removed.

Fixes: bbca8e7050e0 ("ASoC: rt-sdw-common: Common functions for Realtek soundwire driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Changes in v2:
- report jack state on button read failures even when SDCA_0 is clear, fixing the missed unplug identified during review of v1
- document negative error returns from rt_sdca_button_detect()

 sound/soc/codecs/rt-sdw-common.c |  6 +++++-
 sound/soc/codecs/rt721-sdca.c    | 11 +++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt-sdw-common.c b/sound/soc/codecs/rt-sdw-common.c
index ad61943ce75ff..2b24d6ac8f143 100644
--- a/sound/soc/codecs/rt-sdw-common.c
+++ b/sound/soc/codecs/rt-sdw-common.c
@@ -187,6 +187,7 @@ EXPORT_SYMBOL_GPL(rt_sdca_headset_detect);
  *
  * A button type will be returned regarding to buffer,
  * it returns zero if buffer cannot be recognized.
+ * A negative errno is returned if a register read fails.
  */
 int rt_sdca_button_detect(struct regmap *map, unsigned int entity_id,
 	unsigned int hid_buf_addr, unsigned int hid_id)
@@ -199,7 +200,7 @@ int rt_sdca_button_detect(struct regmap *map, unsigned int entity_id,
 	ret = regmap_read(map, SDW_SDCA_CTL(SDCA_NUM_HID, entity_id,
 			RT_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
 	if (ret < 0)
-		return 0;
+		return ret;
 
 	/* if owner is device then there is no button event from device */
 	if (owner == 1)
@@ -229,6 +230,9 @@ int rt_sdca_button_detect(struct regmap *map, unsigned int entity_id,
 			SDW_SDCA_CTL(SDCA_NUM_HID, entity_id,
 				RT_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
 
+	if (ret < 0)
+		return ret;
+
 	return btn_type;
 }
 EXPORT_SYMBOL_GPL(rt_sdca_button_detect);
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 9f567caecb70a..82ef8245474cb 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -248,6 +248,17 @@ static void rt721_sdca_jack_detect_handler(struct work_struct *work)
 					RT721_SDCA_ENT_HID01, RT721_BUF_ADDR_HID1,
 					RT721_SDCA_HID_ID);
 
+	if (btn_type < 0) {
+		unsigned int mask = SND_JACK_HEADSET;
+
+		if (rt721->jack_type != SND_JACK_HEADSET)
+			mask |= SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+				SND_JACK_BTN_2 | SND_JACK_BTN_3;
+
+		snd_soc_jack_report(rt721->hs_jack, rt721->jack_type, mask);
+		return;
+	}
+
 	if (rt721->jack_type == 0)
 		btn_type = 0;
 

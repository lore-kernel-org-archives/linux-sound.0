Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB23D9DD7
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496330; cv=none; b=la0R3wxqPvOqSKwNU7x1WRsMveD23ZMPRtH+mcVVvzXyGWLn2HvLnkuYGzVNFpZrpCGWKBfzMUHOeqxBGicSdhGMFM90zO4UoG4sMqAAlJlih45FQDJSaTGd8T58AWboxCUT9xSBIrpgl4ISu/g1fA8Yi/TQzEvUYTfjd8vMJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496330; c=relaxed/simple;
	bh=Z5kABJ9vxVnrMbOE6G6iiRZ9WfAugWJNN8vd9PIEqQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YmoMkQP+Vw1gauUh+5fKCJKdezM4suqWchWYmFlrRIiF4z3C01TdpvjDPnsn2lW1W02GQZ06BOYKxHhRWOX7w4npkosjmlCVOoz0U3xLt9wEfG6hui7SUF4A5aB32YUdPbI3tA2C5G1JgIeFphcxR++OZ5aeWMnN4YyhBp4dYuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=rABWw7X4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="rABWw7X4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so3786151f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 03:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778496327; x=1779101127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRUDbFQ8UUGeQxVTB+IPdu0McsH7m9PzJSt8sg0Mkuc=;
        b=rABWw7X4yGdPPrlfFilZk4IbnIv1CQj8BlUOnsU4rknxjMlvX5U4qG1CCt8EaFpcVC
         xSwWIIDXHwGuXS/p3O2AT1mKAVvOCzGBJAygsqKUZqtseqU3u6hXSzKF9N/T+/gUcovt
         /dkpdmsFPt06cBxl1ywkO3y7vmlygGAN0ccOT3GeXmnS4TAoraV4ugj2pL48UvV1795h
         Yhv58PZLTPjqoSpLTIWMhHuBICrZC4hgFrPIcb5AIlh14lC48ZBc+0BAYKtLZdt7Th8c
         0ir8IF3E75CdRSH7WkwOQa0S0eND7UO4bnm7ongwO7YU1WeDU+1SpREqlnClFxQYFrH0
         Bc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496327; x=1779101127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pRUDbFQ8UUGeQxVTB+IPdu0McsH7m9PzJSt8sg0Mkuc=;
        b=PmkMnS9VBQXPgZJTH6m580JQPX7+PL+/vuvKk2vZCrPuKoa/j1/tsVs/tyk5DJ7k0N
         6u5Fz2M/LaTBTio6uT+zEOBW3UFgTEvHg2GQpJxP3XoGHg4pESxLCKiKHBL3dw99Yh0P
         zoPIgaIv3YHaJWG4U2ltwTuwHmophB7yvfUdIPv/QOLrC5C4m0goTMpqSR6mUbNdzXGA
         Tf9qtlxqilqIxB7CnHl89G+I/E06Xm/YfWWQ2si0e0T1YHg/rN/WskQtYzNSO/yBV3wI
         cq5uR95NX9b19cdiQGfG/rjdDKw/GhxSxXk9oVOgNte6CglJoL3E4Bckygy3Hvs3SBvV
         AGkA==
X-Forwarded-Encrypted: i=1; AFNElJ+Petpzu94rOrTBvBZAmqxQl5/cGCW6wf28T2+006XCxWOrD1O2IZMQQZPrSIleXX6PFRmh5pVVLy8hXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIiJ5KoK7967b80uJ7boLtvbFFeaN3ejZ5Spi3nwO93LCGgH+7
	s++YhMsa7VXEXZAP4veS5U0quJL2YQaiWsL0J7bbLHRANGrAajOHewB0W6kKV5WAr98kms0rXsG
	htRGb
X-Gm-Gg: Acq92OEJdo0putKyTx33i5NWK935rSVl7vEb0BJ/TjNttlvmzwRoaFYhuhFdF0Q3loE
	IAjbqEJWRHX1i8I5xg9aKZIyr+v5oHmdasnsyZISiQPe8OoBjMrWp+JM87atPLl7M0MpHh0ra0V
	KqmWNdrB3JXMwDlLb6Jhcl3B05pSZBiMNm8cBA3ZpZEUVvIykRETCINjL2cKrufPMm/Tkitwr9f
	j5OAvAAqFN3gYbGZjebvNTNsoGzWY4ar2q+qa2+OdM8Hr6dwDKIVS2SugX9wST4uk6dhfnHO9ZK
	yo3gNM68GyVIisNKtHQoAw+ociHfd8qTyZ3SwN6mOVoEZkcTJ+mya/OUtnbNfGtwDKj//3PCkBi
	wppmvpONEcWrpHZpU794m8UDQki4+Tvjhd05SaCTB0r66chiP+ZbqUufEh28kHzq50zN1sOmtE+
	z3zeUXHNIoddCJIh1ZazPyZy5RwC27QkHq/jJfUJtoCyPXhjzbGPKuasLy1FdDRaY7koxuVJ565
	nC1j/QUeNwQM0k=
X-Received: by 2002:a5d:6e4e:0:b0:456:d5bf:e24d with SMTP id ffacd0b85a97d-456d5bfe26dmr8855741f8f.2.1778496326852;
        Mon, 11 May 2026 03:45:26 -0700 (PDT)
Received: from localhost (p200300f65f114e0841c796eda31a14b3.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:41c7:96ed:a31a:14b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4549217b782sm21984354f8f.35.2026.05.11.03.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:45:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	linux1394-devel@lists.sourceforge.net,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: [PATCH v2 2/2] ALSA: firewire: Make use of ieee1394's .driver_data_ptr
Date: Mon, 11 May 2026 12:45:03 +0200
Message-ID:  <6b7b7b3b8b54465ad5e7463412a202350fccbb62.1778494204.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778494203.git.u.kleine-koenig@baylibre.com>
References: <cover.1778494203.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10559; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Z5kABJ9vxVnrMbOE6G6iiRZ9WfAugWJNN8vd9PIEqQw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqAbMyyXXFt+JfXydF8xlB6ON9w1+Vfec8fWdQ1 JGBp/BdINyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagGzMgAKCRCPgPtYfRL+ TgrEB/9l1FX/eiH06j+BfnHeWANb3EvB5/PihaPb+wZ/Mn2JqqUDdO/bM1ojptSxi3VGTNmN8xE AmEs3QOp25t0NZn0NkgrIpnnfBDcGdpKRFenGvGe7EotZLoQIzpsgzrbGjX5y9zcvxkF+LK22lM N3gmGNMxbMZdIqFm80gNNhDF82qSCbJ/BUcjt8NNEi8DHH50bbjQH9CvOJpAQZqL1k1s4hDqCY+ 8cxy6Ztk4IT8C6iz8UdV+se14b2yuV4Dvermz4f3FZES28kw/4OPsPhtsnzcxHQ6c96JS7g+G6S rB2jaE5RPW1jjl6OC78IR5OjPuqoKYDEstNFz+Cj+ElJoajJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Recently struct ieee1394_device_id gained a new member to store a pointer
to driver data. Make use of that to get rid of a bunch of casts.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/firewire/dice/dice.c   | 34 +++++++++++++++++-----------------
 sound/firewire/fireface/ff.c | 12 ++++++------
 sound/firewire/motu/motu.c   |  6 +++---
 sound/firewire/oxfw/oxfw.c   |  4 ++--
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
index f7a50bae4b55..58f14aadc73d 100644
--- a/sound/firewire/dice/dice.c
+++ b/sound/firewire/dice/dice.c
@@ -148,7 +148,7 @@ static int dice_probe(struct fw_unit *unit, const struct ieee1394_device_id *ent
 	snd_dice_detect_formats_t detect_formats;
 	int err;
 
-	if (!entry->driver_data && entry->vendor_id != OUI_SSL) {
+	if (!entry->driver_data_ptr && entry->vendor_id != OUI_SSL) {
 		err = check_dice_category(unit);
 		if (err < 0)
 			return -ENODEV;
@@ -164,10 +164,10 @@ static int dice_probe(struct fw_unit *unit, const struct ieee1394_device_id *ent
 	dev_set_drvdata(&unit->device, dice);
 	dice->card = card;
 
-	if (!entry->driver_data)
+	if (!entry->driver_data_ptr)
 		detect_formats = snd_dice_stream_detect_current_formats;
 	else
-		detect_formats = (snd_dice_detect_formats_t)entry->driver_data;
+		detect_formats = entry->driver_data_ptr;
 
 	// Below models are compliant to IEC 61883-1/6 and have no quirk at high sampling transfer
 	// frequency.
@@ -255,7 +255,7 @@ static void dice_bus_reset(struct fw_unit *unit)
 		.model_id	= (model), \
 		.specifier_id	= (vendor), \
 		.version	= DICE_INTERFACE, \
-		.driver_data = (kernel_ulong_t)(data), \
+		.driver_data_ptr = (data), \
 	}
 
 static const struct ieee1394_device_id dice_id_table[] = {
@@ -267,7 +267,7 @@ static const struct ieee1394_device_id dice_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_MAUDIO,
 		.model_id	= 0x000010,
-		.driver_data = (kernel_ulong_t)snd_dice_detect_extension_formats,
+		.driver_data_ptr = snd_dice_detect_extension_formats,
 	},
 	/* M-Audio Profire 610 has a different value in version field. */
 	{
@@ -275,7 +275,7 @@ static const struct ieee1394_device_id dice_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_MAUDIO,
 		.model_id	= 0x000011,
-		.driver_data = (kernel_ulong_t)snd_dice_detect_extension_formats,
+		.driver_data_ptr = snd_dice_detect_extension_formats,
 	},
 	/* TC Electronic Konnekt 24D. */
 	{
@@ -283,7 +283,7 @@ static const struct ieee1394_device_id dice_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_TCELECTRONIC,
 		.model_id	= 0x000020,
-		.driver_data = (kernel_ulong_t)snd_dice_detect_tcelectronic_formats,
+		.driver_data_ptr = snd_dice_detect_tcelectronic_formats,
 	},
 	/* TC Electronic Konnekt 8. */
 	{
@@ -291,7 +291,7 @@ static const struct ieee1394_device_id dice_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_TCELECTRONIC,
 		.model_id	= 0x000021,
-		.driver_data = (kernel_ulong_t)snd_dice_detect_tcelectronic_formats,
+		.driver_data_ptr = snd_dice_detect_tcelectronic_formats,
 	},
 	/* TC Electronic Studio Konnekt 48. */
 	{
@@ -299,7 +299,7 @@ static const struct ieee1394_device_id dice_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_TCELECTRONIC,
 		.model_id	= 0x000022,
-		.driver_data = (kernel_ulong_t)snd_dice_detect_tcelectronic_formats,
+		.driver_data_ptr = snd_dice_detect_tcelectronic_formats,
 	},
 	/* TC Electronic Konnekt Live. */
 	{
@@ -307,7 +307,7 @@ static const struct ieee1394_device_id dice_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_TCELECTRONIC,
 		.model_id	= 0x000023,
-		.driver_data = (kernel_ulong_t)snd_dice_detect_tcelectronic_formats,
+		.driver_data_ptr = snd_dice_detect_tcelectronic_formats,
 	},
 	/* TC Electronic Desktop Konnekt 6. */
 	{
@@ -315,7 +315,7 @@ static const struct ieee1394_device_id dice_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_TCELECTRONIC,
 		.model_id	= 0x000024,
-		.driver_data = (kernel_ulong_t)snd_dice_detect_tcelectronic_formats,
+		.driver_data_ptr = snd_dice_detect_tcelectronic_formats,
 	},
 	/* TC Electronic Impact Twin. */
 	{
@@ -323,7 +323,7 @@ static const struct ieee1394_device_id dice_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_TCELECTRONIC,
 		.model_id	= 0x000027,
-		.driver_data = (kernel_ulong_t)snd_dice_detect_tcelectronic_formats,
+		.driver_data_ptr = snd_dice_detect_tcelectronic_formats,
 	},
 	/* TC Electronic Digital Konnekt x32. */
 	{
@@ -331,7 +331,7 @@ static const struct ieee1394_device_id dice_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_TCELECTRONIC,
 		.model_id	= 0x000030,
-		.driver_data = (kernel_ulong_t)snd_dice_detect_tcelectronic_formats,
+		.driver_data_ptr = snd_dice_detect_tcelectronic_formats,
 	},
 	/* Alesis iO14/iO26. */
 	{
@@ -339,7 +339,7 @@ static const struct ieee1394_device_id dice_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_ALESIS,
 		.model_id	= MODEL_ALESIS_IO_BOTH,
-		.driver_data = (kernel_ulong_t)snd_dice_detect_alesis_formats,
+		.driver_data_ptr = snd_dice_detect_alesis_formats,
 	},
 	// Alesis MasterControl.
 	{
@@ -347,7 +347,7 @@ static const struct ieee1394_device_id dice_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_ALESIS,
 		.model_id	= 0x000002,
-		.driver_data = (kernel_ulong_t)snd_dice_detect_alesis_mastercontrol_formats,
+		.driver_data_ptr = snd_dice_detect_alesis_mastercontrol_formats,
 	},
 	/* Mytek Stereo 192 DSD-DAC. */
 	{
@@ -355,7 +355,7 @@ static const struct ieee1394_device_id dice_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_MYTEK,
 		.model_id	= 0x000002,
-		.driver_data = (kernel_ulong_t)snd_dice_detect_mytek_formats,
+		.driver_data_ptr = snd_dice_detect_mytek_formats,
 	},
 	// Solid State Logic, Duende Classic and Mini.
 	// NOTE: each field of GUID in config ROM is not compliant to standard
@@ -469,7 +469,7 @@ static const struct ieee1394_device_id dice_id_table[] = {
 		.model_id	= OUI_TEAC,
 		.specifier_id	= OUI_TEAC,
 		.version	= 0x800006,
-		.driver_data = (kernel_ulong_t)snd_dice_detect_teac_formats,
+		.driver_data_ptr = snd_dice_detect_teac_formats,
 	},
 	{ }
 };
diff --git a/sound/firewire/fireface/ff.c b/sound/firewire/fireface/ff.c
index 5d2c4fbf4434..13472822d2be 100644
--- a/sound/firewire/fireface/ff.c
+++ b/sound/firewire/fireface/ff.c
@@ -70,7 +70,7 @@ static int snd_ff_probe(struct fw_unit *unit, const struct ieee1394_device_id *e
 	init_waitqueue_head(&ff->hwdep_wait);
 
 	ff->unit_version = entry->version;
-	ff->spec = (const struct snd_ff_spec *)entry->driver_data;
+	ff->spec = entry->driver_data_ptr;
 
 	err = snd_ff_transaction_register(ff);
 	if (err < 0)
@@ -186,7 +186,7 @@ static const struct ieee1394_device_id snd_ff_id_table[] = {
 		.specifier_id	= OUI_RME,
 		.version	= SND_FF_UNIT_VERSION_FF800,
 		.model_id	= 0x101800,
-		.driver_data	= (kernel_ulong_t)&spec_ff800,
+		.driver_data_ptr = &spec_ff800,
 	},
 	/* Fireface 400 */
 	{
@@ -198,7 +198,7 @@ static const struct ieee1394_device_id snd_ff_id_table[] = {
 		.specifier_id	= OUI_RME,
 		.version	= SND_FF_UNIT_VERSION_FF400,
 		.model_id	= 0x101800,
-		.driver_data	= (kernel_ulong_t)&spec_ff400,
+		.driver_data_ptr = &spec_ff400,
 	},
 	// Fireface UFX.
 	{
@@ -210,7 +210,7 @@ static const struct ieee1394_device_id snd_ff_id_table[] = {
 		.specifier_id	= OUI_RME,
 		.version	= SND_FF_UNIT_VERSION_UFX,
 		.model_id	= 0x101800,
-		.driver_data	= (kernel_ulong_t)&spec_ufx_802,
+		.driver_data_ptr = &spec_ufx_802,
 	},
 	// Fireface UCX.
 	{
@@ -222,7 +222,7 @@ static const struct ieee1394_device_id snd_ff_id_table[] = {
 		.specifier_id	= OUI_RME,
 		.version	= SND_FF_UNIT_VERSION_UCX,
 		.model_id	= 0x101800,
-		.driver_data	= (kernel_ulong_t)&spec_ucx,
+		.driver_data_ptr = &spec_ucx,
 	},
 	// Fireface 802.
 	{
@@ -234,7 +234,7 @@ static const struct ieee1394_device_id snd_ff_id_table[] = {
 		.specifier_id	= OUI_RME,
 		.version	= SND_FF_UNIT_VERSION_802,
 		.model_id	= 0x101800,
-		.driver_data	= (kernel_ulong_t)&spec_ufx_802,
+		.driver_data_ptr = &spec_ufx_802,
 	},
 	{}
 };
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index fd2a9dddbfa6..1fec6c8cdf6c 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -78,7 +78,7 @@ static int motu_probe(struct fw_unit *unit, const struct ieee1394_device_id *ent
 	dev_set_drvdata(&unit->device, motu);
 	motu->card = card;
 
-	motu->spec = (const struct snd_motu_spec *)entry->driver_data;
+	motu->spec = entry->driver_data_ptr;
 	mutex_init(&motu->mutex);
 	spin_lock_init(&motu->lock);
 	init_waitqueue_head(&motu->hwdep_wait);
@@ -148,7 +148,7 @@ static void motu_bus_update(struct fw_unit *unit)
 	snd_motu_transaction_reregister(motu);
 }
 
-#define SND_MOTU_DEV_ENTRY(model, data)			\
+#define SND_MOTU_DEV_ENTRY(model, data_ptr)		\
 {							\
 	.match_flags	= IEEE1394_MATCH_VENDOR_ID |	\
 			  IEEE1394_MATCH_SPECIFIER_ID |	\
@@ -156,7 +156,7 @@ static void motu_bus_update(struct fw_unit *unit)
 	.vendor_id	= OUI_MOTU,			\
 	.specifier_id	= OUI_MOTU,			\
 	.version	= model,			\
-	.driver_data	= (kernel_ulong_t)data,		\
+	.driver_data_ptr = data_ptr,			\
 }
 
 static const struct ieee1394_device_id motu_id_table[] = {
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 5039bd79b18e..38a3c3b150df 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -95,7 +95,7 @@ static int name_card(struct snd_oxfw *oxfw, const struct ieee1394_device_id *ent
 
 	/* to apply card definitions */
 	if (entry->vendor_id == VENDOR_GRIFFIN || entry->vendor_id == VENDOR_LACIE) {
-		info = (const struct compat_info *)entry->driver_data;
+		info = entry->driver_data_ptr;
 		d = info->driver_name;
 		v = info->vendor_name;
 		m = info->model_name;
@@ -321,7 +321,7 @@ static const struct compat_info lacie_speakers = {
 	.model_id     = model, \
 	.specifier_id = SPECIFIER_1394TA, \
 	.version      = VERSION_AVC, \
-	.driver_data  = (kernel_ulong_t)data, \
+	.driver_data_ptr = data, \
 }
 
 static const struct ieee1394_device_id oxfw_id_table[] = {
-- 
2.47.3


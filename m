Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D001B85F8
	for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776580967; cv=none; b=FiQZLcTX1ILk+zlJmq6wudw5PFeTItdNX8G1bE5kG+btxF1fQdVyg++2fsp8Igz+nAKB549fzN9KxoElyF/0XIJjXUKIapFp2z+qLTbWyTF/LnWbJl4pl8oz3yMJ6KP9PPOfOn5J0T8d4w8571Vm5jdKN1WBFB3p8vtnkeUjqNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776580967; c=relaxed/simple;
	bh=Z5kABJ9vxVnrMbOE6G6iiRZ9WfAugWJNN8vd9PIEqQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H4MAm4BR+osamQr83UR3eCY5EWHVfAHYdbmNJZeFw77uuipGVMlw8koeDzHzGNdXItvDbfAXQZ3Sv7FuD/vpOuckBJUHUXbicTlP5kNs46lTsko6PIu21E7aH0Lvwjb91UkUSiu4hfB+oX+COaAQ9IG5ZDcq2UePCEDW7A8RjX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=kR8DB27Z; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="kR8DB27Z"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so25967585e9.0
        for <linux-sound@vger.kernel.org>; Sat, 18 Apr 2026 23:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776580963; x=1777185763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRUDbFQ8UUGeQxVTB+IPdu0McsH7m9PzJSt8sg0Mkuc=;
        b=kR8DB27ZhhOQ1MG5L9aDue/EStve3gV5+GmNn2T5Z1wKDdWsmv83GkPEHViY84aXjn
         3yr14bvoeui8C7P25OO7/SMVlb+i0xenBt7Ws1yLmgfOO/ph0Qu1ZiUSkfs/QLpTMPBf
         6qynY1UU1Ho5+V19m0bhz5igDGfU7pgSMTL4/2tHKo4uv6w5QBuQL481NDEdiDM9tScq
         WEE/bzba3BJpAE69svNvdPusjgPKSMHdhLkz1SkTALIukhZQYZs4oAH1SbPhCwj24xQ0
         fxpeZBskknjQ7RgoWHIKb0d2F3h/JOqd0d83+sQYpUuKxj83OLQuUqtqgoV2kX7JnLcK
         7v7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776580963; x=1777185763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pRUDbFQ8UUGeQxVTB+IPdu0McsH7m9PzJSt8sg0Mkuc=;
        b=Q6voKa64eufrM7d21MvcqpLrokQjkAtJ84LPPLn+w0DBY+7GdkHUNTTzU0f27nuUAP
         98CLc+qTSAwDP1lakV2eiowy2wHuKZ3qp7S/xBjHyiFUgJdAO7q/MJct06gbVehUDa7W
         FUg1/nkWkdnCpOFY6WU1f/aGC7dlzny0Jct5UQ12+PBQa7PMiGYEQrl3yk2LroJOeX8T
         dNswKaD4noSzQ/+bIIcAX4YTgPtpUNG8cKCNbKbvqDtpH2hXEABgiMDDPwRqMJbF+NMN
         EMXL2zniAyo5ZckZM8RO2MPZNVmN5lMdpyuGo1hSBimZ9oUhZv9LizS/MzL3lAebajLe
         Rmkg==
X-Forwarded-Encrypted: i=1; AFNElJ/2rRiQ8ri8f11xLtkf0VZwHMazFiahS0NX9tTyDFCszpOQdzL1i3bOvLnD5TytY1HBXeUWflBpaLLxdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTeKGaUs2FHfZoqr3dAT4pGMGWJOamCbix1BvN/U/4uvevYhWu
	xANF/2hUfCCKL63y5EFDDWPqyeR/f4RsLuje4Z7ID+8lQGd3wgTynI3d8HzCG8P/hkY=
X-Gm-Gg: AeBDieti0nPdCJh0b/43uiDiZxkIRCQ2T1ILP2y0aKAEfrV9Dp4G9T4NwYhLts9yMc1
	PsFdrAiML0SaS6E0pZEbIRBeNtaaqHN0OEpfsI4GCr3evbD+Bi8KUzD94ffPLCsIbtZuUN9qLCA
	Ws9AYnV/HmDB3XyNKnaSPO0iih+amz8LADyetYw/b2o8H8WOEVYz19mR0jaopv8t1aosV4nO40i
	Aq6hzCZqlkMt2APSi/RHpPLqW+7C5CFWnaQLQm9nD4dM7tF4J6SxVo9Y2k+q6w8ZnNbCN/zKUz8
	s7etBwHPnVcjY/74h3Rxp7K5J9le/E0jBjX8+zUcKCeUBTMTXBajdAU+2OaUYl0l02H9mfxzYe3
	1vOBoejxVTfvt7oo1aBerAvY9uVr4keGX2EJ0pX77iegr1PM2nHimotPMbHg9AJZCgKcj5e0OvV
	RIT+QyObAYzFzM9oVnJLfRtTF36PKu9vDAy8DWf91WAMUSYnHLiQ==
X-Received: by 2002:a05:600c:6297:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-488fb77155dmr123327685e9.17.1776580963573;
        Sat, 18 Apr 2026 23:42:43 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43fe4cc2cacsm18585524f8f.13.2026.04.18.23.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 23:42:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux1394-devel@lists.sourceforge.net,
	linux-sound@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] ALSA: firewire: Make use of ieee1394's .driver_data_ptr
Date: Sun, 19 Apr 2026 08:42:14 +0200
Message-ID:  <7b7040a9c1f3152f9ef7994613ddfb201ca9b94d.1776579304.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10559; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Z5kABJ9vxVnrMbOE6G6iiRZ9WfAugWJNN8vd9PIEqQw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp5HlOdNvLBZOoNZr9q+6VbiInKBgFw1IvrNIab ntOSbp6TfaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaeR5TgAKCRCPgPtYfRL+ TiXnB/9x7MG0X7wHe43zxgj8Ra8zyN4jdZCjbhdgx1j4qfeEgGJHzfLI2BS4rdASG+C5malvwcg js3CTg/2EeLzEC9RpP781B+Rg6Jlx3cJMOIylMUS90n74YxeYjA3ndZddRRjyBG6NLB3dJRvhPr Ux4mwIzkxNDWeCXzNTMuvQlf7oIvHd5i2WYll9rl/kJ/dXNwRlo7LI40dihZfYeYTDeZAlIxnlS 5pWYbJBz80VWEWqY3RN4RPg6/OhAmlbSoDH4MRrLgmy0rIfRC6K4fdrJNHSbfI7NSIfnhISNfHF XuxfqCI7DYJf/ubr9ktRKOOE7N1B+jj0jSGS1ANZb0VzlEG2
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


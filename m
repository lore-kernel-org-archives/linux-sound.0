Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2294A0C
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 21:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777151795; cv=none; b=lIEfuG4JVQAdQ5Z1OO0b+b42UacpfA1vpYuyOL0+A3MurYEwgFSy5s84VyVgbq0OI5d+BYenbJAJKRPt/a1RphDxTksHfarRBDmBggi6j5ZIM/e05qR6M8QyiumPlI1TL7zoEdBM5FBDvGje/G8rXuyB3k1E5OEzcHZls0NszFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777151795; c=relaxed/simple;
	bh=LRg8LrEdA37LqEWqTMw8zs9BrboDioUZTRrvYU+V+ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZDk6NnESNRT9W/mWetRWIuWbSdsa8yG46Tgxjwa+PPVJFFGLqgJ6++YOMwDEl3pNWQUTqAwizWcyrYedFL0TTZNuqK19AdEd/xEssgPV2Nd7he0YWaSeD3i+t1wklrKg38rLk/DYapbmoboBsfksBespMYAurIe3Y0CEaImkd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=rMNC8WJ2; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="rMNC8WJ2"
Received: by m.b4.vu (Postfix, from userid 1000)
	id C591967BB596; Sun, 26 Apr 2026 06:46:30 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu C591967BB596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1777151790; bh=DqbDBGX6QzwQYU9ki/PsoxW+NC1CI/XW2yTK83dczvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rMNC8WJ2/N9AVL5dO0bBxp+OKoj4xD0izVNLoRn8OFN7/Si/RvZ7iOptiMdibX4wg
	 ySO45sIjAyLc4119G815TTv0Znv5XOOJV0/S1I/zzxKaFXCEy9LoJaSebfS3EFcWHy
	 y88FSA5epAraeB7vlrjSWtNSEOytH7ahY4zur5NT7ilpFXh0EcwBt1DVUmul7Fhilm
	 xZTzWLRGQsQUh9l/TIpLnrN5IqMicJQFJvXeiGEIx35RnuaKQEfIB3+w8agbaezd9R
	 ZG5GHQum4qZHUxs5aDa5VEhUIzcjy2f4wFWgYBHimOOxv4MNYvTnxFAtI90sRK4tHa
	 gbrpW+voAHxiA==
Date: Sun, 26 Apr 2026 06:46:30 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 1/3] ALSA: scarlett2: Allow selecting config_set by firmware
 version
Message-ID: <ae1695b4c4825f365b4c86b22174035f742807e3.1777151532.git.g@b4.vu>
References: <ae0tEsi8dKm1akJd@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae0tEsi8dKm1akJd@m.b4.vu>

The Scarlett 2i2 Gen 4 firmware 2417 moved the direct monitor gain
parameters, so we now need to allow each device to list multiple
scarlett2_config_set entries, one per applicable firmware version
range, and pick the matching one at probe time.

No functional change yet: each device gets a single config_sets
entry whose from_firmware_version matches the existing
min_firmware_version (0 where none was set). This both prepares for
selection and lets a follow-up commit remove the now-redundant
min_firmware_version field.

scarlett2_count_io() depends on the resolved config_set so it moves
out of scarlett2_init_private() into snd_scarlett2_controls_create()
after the firmware version has been read.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 143 ++++++++++++++++++++++++++++++------
 1 file changed, 121 insertions(+), 22 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 7b31504c5f24..15abca6d34ef 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -612,6 +612,20 @@ struct scarlett2_config_set {
 	const struct scarlett2_config items[SCARLETT2_CONFIG_COUNT];
 };
 
+/* Map firmware versions to config sets per-device.
+ *
+ * Each device lists one or more entries, sorted in ascending order of
+ * from_firmware_version. At probe time the running firmware version
+ * is looked up against this list and the last entry whose
+ * from_firmware_version is <= the running version is selected.
+ *
+ * The list is terminated by a sentinel entry with config_set == NULL.
+ */
+struct scarlett2_config_set_entry {
+	u16 from_firmware_version;
+	const struct scarlett2_config_set *config_set;
+};
+
 /* Input gain TLV dB ranges */
 
 static const DECLARE_TLV_DB_MINMAX(
@@ -1100,8 +1114,8 @@ struct scarlett2_meter_entry {
 };
 
 struct scarlett2_device_info {
-	/* which set of configuration parameters the device uses */
-	const struct scarlett2_config_set *config_set;
+	/* which sets of configuration parameters the device uses */
+	const struct scarlett2_config_set_entry *config_sets;
 
 	/* minimum firmware version required */
 	u16 min_firmware_version;
@@ -1343,7 +1357,10 @@ struct scarlett2_data {
 /*** Model-specific data ***/
 
 static const struct scarlett2_device_info s6i6_gen2_info = {
-	.config_set = &scarlett2_config_set_gen2a,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 0, &scarlett2_config_set_gen2a },
+		{ }
+	},
 	.level_input_count = 2,
 	.pad_input_count = 2,
 
@@ -1393,7 +1410,10 @@ static const struct scarlett2_device_info s6i6_gen2_info = {
 };
 
 static const struct scarlett2_device_info s18i8_gen2_info = {
-	.config_set = &scarlett2_config_set_gen2a,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 0, &scarlett2_config_set_gen2a },
+		{ }
+	},
 	.level_input_count = 2,
 	.pad_input_count = 4,
 
@@ -1446,7 +1466,10 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 };
 
 static const struct scarlett2_device_info s18i20_gen2_info = {
-	.config_set = &scarlett2_config_set_gen2b,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 0, &scarlett2_config_set_gen2b },
+		{ }
+	},
 
 	.line_out_descrs = {
 		"Monitor L",
@@ -1503,7 +1526,10 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 };
 
 static const struct scarlett2_device_info solo_gen3_info = {
-	.config_set = &scarlett2_config_set_gen3a,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 0, &scarlett2_config_set_gen3a },
+		{ }
+	},
 	.level_input_count = 1,
 	.level_input_first = 1,
 	.air_input_count = 1,
@@ -1513,7 +1539,10 @@ static const struct scarlett2_device_info solo_gen3_info = {
 };
 
 static const struct scarlett2_device_info s2i2_gen3_info = {
-	.config_set = &scarlett2_config_set_gen3a,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 0, &scarlett2_config_set_gen3a },
+		{ }
+	},
 	.level_input_count = 2,
 	.air_input_count = 2,
 	.phantom_count = 1,
@@ -1522,7 +1551,10 @@ static const struct scarlett2_device_info s2i2_gen3_info = {
 };
 
 static const struct scarlett2_device_info s4i4_gen3_info = {
-	.config_set = &scarlett2_config_set_gen3b,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 0, &scarlett2_config_set_gen3b },
+		{ }
+	},
 	.level_input_count = 2,
 	.pad_input_count = 2,
 	.air_input_count = 2,
@@ -1571,7 +1603,10 @@ static const struct scarlett2_device_info s4i4_gen3_info = {
 };
 
 static const struct scarlett2_device_info s8i6_gen3_info = {
-	.config_set = &scarlett2_config_set_gen3b,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 0, &scarlett2_config_set_gen3b },
+		{ }
+	},
 	.level_input_count = 2,
 	.pad_input_count = 2,
 	.air_input_count = 2,
@@ -1637,7 +1672,10 @@ static const char * const scarlett2_spdif_s18i8_gen3_texts[] = {
 };
 
 static const struct scarlett2_device_info s18i8_gen3_info = {
-	.config_set = &scarlett2_config_set_gen3c,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 0, &scarlett2_config_set_gen3c },
+		{ }
+	},
 	.has_speaker_switching = 1,
 	.level_input_count = 2,
 	.pad_input_count = 4,
@@ -1729,7 +1767,10 @@ static const char * const scarlett2_spdif_s18i20_gen3_texts[] = {
 };
 
 static const struct scarlett2_device_info s18i20_gen3_info = {
-	.config_set = &scarlett2_config_set_gen3c,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 0, &scarlett2_config_set_gen3c },
+		{ }
+	},
 	.has_speaker_switching = 1,
 	.has_talkback = 1,
 	.level_input_count = 2,
@@ -1803,7 +1844,10 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 };
 
 static const struct scarlett2_device_info vocaster_one_info = {
-	.config_set = &scarlett2_config_set_vocaster,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 1769, &scarlett2_config_set_vocaster },
+		{ }
+	},
 	.min_firmware_version = 1769,
 	.has_devmap = 1,
 
@@ -1847,7 +1891,10 @@ static const struct scarlett2_device_info vocaster_one_info = {
 };
 
 static const struct scarlett2_device_info vocaster_two_info = {
-	.config_set = &scarlett2_config_set_vocaster,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 1769, &scarlett2_config_set_vocaster },
+		{ }
+	},
 	.min_firmware_version = 1769,
 	.has_devmap = 1,
 
@@ -1892,7 +1939,10 @@ static const struct scarlett2_device_info vocaster_two_info = {
 };
 
 static const struct scarlett2_device_info solo_gen4_info = {
-	.config_set = &scarlett2_config_set_gen4_solo,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 2115, &scarlett2_config_set_gen4_solo },
+		{ }
+	},
 	.min_firmware_version = 2115,
 	.has_devmap = 1,
 
@@ -1947,7 +1997,10 @@ static const struct scarlett2_device_info solo_gen4_info = {
 };
 
 static const struct scarlett2_device_info s2i2_gen4_info = {
-	.config_set = &scarlett2_config_set_gen4_2i2,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 2115, &scarlett2_config_set_gen4_2i2 },
+		{ }
+	},
 	.min_firmware_version = 2115,
 	.has_devmap = 1,
 
@@ -2002,7 +2055,10 @@ static const struct scarlett2_device_info s2i2_gen4_info = {
 };
 
 static const struct scarlett2_device_info s4i4_gen4_info = {
-	.config_set = &scarlett2_config_set_gen4_4i4,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 2089, &scarlett2_config_set_gen4_4i4 },
+		{ }
+	},
 	.min_firmware_version = 2089,
 	.has_devmap = 1,
 
@@ -2051,7 +2107,10 @@ static const struct scarlett2_device_info s4i4_gen4_info = {
 };
 
 static const struct scarlett2_device_info clarett_2pre_info = {
-	.config_set = &scarlett2_config_set_clarett,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 0, &scarlett2_config_set_clarett },
+		{ }
+	},
 	.level_input_count = 2,
 	.air_input_count = 2,
 
@@ -2107,7 +2166,10 @@ static const char * const scarlett2_spdif_clarett_texts[] = {
 };
 
 static const struct scarlett2_device_info clarett_4pre_info = {
-	.config_set = &scarlett2_config_set_clarett,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 0, &scarlett2_config_set_clarett },
+		{ }
+	},
 	.level_input_count = 2,
 	.air_input_count = 4,
 
@@ -2163,7 +2225,10 @@ static const struct scarlett2_device_info clarett_4pre_info = {
 };
 
 static const struct scarlett2_device_info clarett_8pre_info = {
-	.config_set = &scarlett2_config_set_clarett,
+	.config_sets = (const struct scarlett2_config_set_entry[]) {
+		{ 0, &scarlett2_config_set_clarett },
+		{ }
+	},
 	.level_input_count = 2,
 	.air_input_count = 8,
 
@@ -8184,10 +8249,32 @@ static void scarlett2_private_suspend(struct usb_mixer_interface *mixer)
 
 /*** Initialisation ***/
 
+/* Select the config_set matching the running firmware version.
+ *
+ * The device info's config_sets array is ordered by ascending
+ * from_firmware_version; pick the last entry whose version is <= the
+ * running firmware version. If the running firmware is older than the
+ * first entry's from_firmware_version (i.e. older than the driver's
+ * minimum supported version for this device), the first entry's
+ * config_set is selected anyway so firmware updates can still be done
+ * (requires only the ACK handler), but the usual mixer controls
+ * aren't created.
+ */
+static void scarlett2_resolve_config_set(struct scarlett2_data *private)
+{
+	const struct scarlett2_config_set_entry *entry =
+		private->info->config_sets;
+
+	private->config_set = entry->config_set;
+	for (entry++; entry->config_set; entry++)
+		if (entry->from_firmware_version <= private->firmware_version)
+			private->config_set = entry->config_set;
+}
+
 static void scarlett2_count_io(struct scarlett2_data *private)
 {
 	const struct scarlett2_device_info *info = private->info;
-	const struct scarlett2_config_set *config_set = info->config_set;
+	const struct scarlett2_config_set *config_set = private->config_set;
 	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int port_type, srcs = 0, dsts = 0, i;
 
@@ -8282,9 +8369,14 @@ static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 	mixer->private_suspend = scarlett2_private_suspend;
 
 	private->info = entry->info;
-	private->config_set = entry->info->config_set;
+
+	/* Set config_set to the first entry's config_set so the
+	 * notify handler has a valid pointer while USB init runs; it
+	 * is re-resolved once the firmware version has been read.
+	 */
+	private->config_set = entry->info->config_sets[0].config_set;
+
 	private->series_name = entry->series_name;
-	scarlett2_count_io(private);
 	private->scarlett2_seq = 0;
 	private->mixer = mixer;
 
@@ -8688,6 +8780,13 @@ static int snd_scarlett2_controls_create(
 	if (err < 0)
 		return err;
 
+	/* Now that the firmware version is known, pick the matching
+	 * config_set
+	 */
+	scarlett2_resolve_config_set(private);
+
+	scarlett2_count_io(private);
+
 	/* Get the upgrade & settings flash segment numbers */
 	err = scarlett2_get_flash_segment_nums(mixer);
 	if (err < 0)
-- 
2.53.0


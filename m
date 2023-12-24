Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050AFD2FA
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="jnJIkbdQ"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 04438604B9CB; Mon, 25 Dec 2023 05:57:53 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 04438604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446073; bh=Ws/feJ3gr1b687HwKIWHvel3DvhnN9aMuEC4acX6rVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jnJIkbdQsAhbpO5jGnkURHsnxJXPYRcq4vtBeIzspTQp9ktOP1deuS25AbYhUPEqz
	 B5WyClk3GhWuadX3v9IZPysZhGIKoc5b1PF0qtkJ19Jp4kOrzV5ZSLDYbRO5I7P5KJ
	 2X9NRPkJ2mygjP44JMgIZ37YG1DN4dBBI4aspMZBuDSDI4R9HWRhaokIbUOSGyMP03
	 lGUimIhRRjNBreOVMAujxFCyCApytbLXJjEYRRJUotzdxmFEEsrot7czMhjsL+1u8b
	 H5KKIdkyd6RvKGwTVl5ayv4XeQgWsxAXVGtlbDuI5hTiN2KQc1OSB2W4fgOXLjburV
	 UshY8YBV9pS3g==
Date: Mon, 25 Dec 2023 05:57:52 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 12/23] ALSA: scarlett2: Parameterise notifications
Message-ID: <0ee2a3786f9d30c89eeae59d7e933424e8f39162.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>

The notification values were previously #define'd, and checked with a
series of if() statements calling functions. Replace with an array of
masks/callback function pointers, and a pointer to that array in the
scarlett2_config_set definitions.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 62 +++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 0fd919490cc6..64476922eee8 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -263,6 +263,29 @@ static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
 	"Mute Playback Switch", "Dim Playback Switch"
 };
 
+/* Notification callback functions */
+struct scarlett2_notification {
+	u32 mask;
+	void (*func)(struct usb_mixer_interface *mixer);
+};
+
+static void scarlett2_notify_sync(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_dim_mute(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_monitor(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_input_other(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_monitor_other(struct usb_mixer_interface *mixer);
+
+/* Array of notification callback functions */
+static const struct scarlett2_notification scarlett2_notifications[] = {
+	{ 0x00000001, NULL }, /* ack, gets ignored */
+	{ 0x00000008, scarlett2_notify_sync },
+	{ 0x00200000, scarlett2_notify_dim_mute },
+	{ 0x00400000, scarlett2_notify_monitor },
+	{ 0x00800000, scarlett2_notify_input_other },
+	{ 0x01000000, scarlett2_notify_monitor_other },
+	{ 0, NULL }
+};
+
 /* Configuration parameters that can be read and written */
 enum {
 	SCARLETT2_CONFIG_DIM_MUTE,
@@ -293,11 +316,13 @@ struct scarlett2_config {
 };
 
 struct scarlett2_config_set {
+	const struct scarlett2_notification *notifications;
 	const struct scarlett2_config items[SCARLETT2_CONFIG_COUNT];
 };
 
 /* Gen 2 devices: 6i6, 18i8, 18i20 */
 static const struct scarlett2_config_set scarlett2_config_set_gen2 = {
+	.notifications = scarlett2_notifications,
 	.items = {
 		[SCARLETT2_CONFIG_DIM_MUTE] = {
 			.offset = 0x31, .size = 8, .activate = 2 },
@@ -324,6 +349,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen2 = {
 
 /* Gen 3 devices without a mixer (Solo and 2i2) */
 static const struct scarlett2_config_set scarlett2_config_set_gen3a = {
+	.notifications = scarlett2_notifications,
 	.items = {
 		[SCARLETT2_CONFIG_MSD_SWITCH] = {
 			.offset = 0x04, .size = 8, .activate = 6 },
@@ -347,6 +373,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen3a = {
 
 /* Gen 3 devices: 4i4, 8i6, 18i8, 18i20 */
 static const struct scarlett2_config_set scarlett2_config_set_gen3b = {
+	.notifications = scarlett2_notifications,
 	.items = {
 		[SCARLETT2_CONFIG_DIM_MUTE] = {
 			.offset = 0x31, .size = 8, .activate = 2 },
@@ -394,6 +421,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen3b = {
 
 /* Clarett USB and Clarett+ devices: 2Pre, 4Pre, 8Pre */
 static const struct scarlett2_config_set scarlett2_config_set_clarett = {
+	.notifications = scarlett2_notifications,
 	.items = {
 		[SCARLETT2_CONFIG_DIM_MUTE] = {
 			.offset = 0x31, .size = 8, .activate = 2 },
@@ -1274,13 +1302,6 @@ static int scarlett2_get_port_start_num(
 
 /*** USB Interactions ***/
 
-/* Notifications from the interface */
-#define SCARLETT2_USB_NOTIFY_SYNC          0x00000008
-#define SCARLETT2_USB_NOTIFY_DIM_MUTE      0x00200000
-#define SCARLETT2_USB_NOTIFY_MONITOR       0x00400000
-#define SCARLETT2_USB_NOTIFY_INPUT_OTHER   0x00800000
-#define SCARLETT2_USB_NOTIFY_MONITOR_OTHER 0x01000000
-
 /* Commands for sending/receiving requests/responses */
 #define SCARLETT2_USB_CMD_INIT 0
 #define SCARLETT2_USB_CMD_REQ  2
@@ -4745,21 +4766,28 @@ static void scarlett2_notify(struct urb *urb)
 	int len = urb->actual_length;
 	int ustatus = urb->status;
 	u32 data;
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_notification *notifications =
+		private->config_set->notifications;
 
 	if (ustatus != 0 || len != 8)
 		goto requeue;
 
 	data = le32_to_cpu(*(__le32 *)urb->transfer_buffer);
-	if (data & SCARLETT2_USB_NOTIFY_SYNC)
-		scarlett2_notify_sync(mixer);
-	if (data & SCARLETT2_USB_NOTIFY_MONITOR)
-		scarlett2_notify_monitor(mixer);
-	if (data & SCARLETT2_USB_NOTIFY_DIM_MUTE)
-		scarlett2_notify_dim_mute(mixer);
-	if (data & SCARLETT2_USB_NOTIFY_INPUT_OTHER)
-		scarlett2_notify_input_other(mixer);
-	if (data & SCARLETT2_USB_NOTIFY_MONITOR_OTHER)
-		scarlett2_notify_monitor_other(mixer);
+
+	while (data && notifications->mask) {
+		if (data & notifications->mask) {
+			data &= ~notifications->mask;
+			if (notifications->func)
+				notifications->func(mixer);
+		}
+		notifications++;
+	}
+
+	if (data)
+		usb_audio_warn(mixer->chip,
+			       "%s: Unhandled notification: 0x%08x\n",
+			       __func__, data);
 
 requeue:
 	if (ustatus != -ENOENT &&
-- 
2.43.0


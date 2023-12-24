Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E12FD2FA
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="FgZZPDcM"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 91D4E604B9CB; Mon, 25 Dec 2023 05:57:16 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 91D4E604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446036; bh=tqdoNC8FmJJqw+TaWGKncCIEZx4K22FShl6pqV3L1pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgZZPDcMUcBD/rXEriwiRm+cVUztZkhOffHtrds4O9x5VvDJAuUr6MgWPWf4y+a96
	 5i9xm5UW8JDuNjOxVVlzqQ/m6UP6BUV30PjlyttbUKRQ8g/ZnCPqG1zeZJBNVWVEEP
	 WBX/cNO5n0YLHvBZ7u1XHwxfL+g9srKhnqXdSS525UyFBw0SIWHgjfxtgjdC1MiN8D
	 cdKUZQSH3nekZLLN35POBQy+4qr+x8+XohoHwgXu/b+rT5ItUR4cd3SvNa9iq30Z78
	 YgCRuk0SS1lMQJ0FZXohgD1WO/LTzziR3o3tNdjXeM3jqJKHT4GgGywpiztOVXZcou
	 nL76MZtCaEKwg==
Date: Mon, 25 Dec 2023 05:57:16 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 10/23] ALSA: scarlett2: Refactor scarlett2_config_save()
Message-ID: <bbc733dc081f311fb3167e81b15cd76324aa6307.1703444932.git.g@b4.vu>
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

Use the new scarlett2_usb_activate_config() helper function rather
than preparing the request manually and calling scarlett2_usb().

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 40 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index bbc60b94b7bc..f15ee9e6c2eb 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1562,27 +1562,6 @@ static int scarlett2_usb_get_config(
 	return 0;
 }
 
-/* Send SCARLETT2_USB_DATA_CMD SCARLETT2_USB_CONFIG_SAVE */
-static void scarlett2_config_save(struct usb_mixer_interface *mixer)
-{
-	__le32 req = cpu_to_le32(SCARLETT2_USB_CONFIG_SAVE);
-
-	int err = scarlett2_usb(mixer, SCARLETT2_USB_DATA_CMD,
-				&req, sizeof(u32),
-				NULL, 0);
-	if (err < 0)
-		usb_audio_err(mixer->chip, "config save failed: %d\n", err);
-}
-
-/* Delayed work to save config */
-static void scarlett2_config_save_work(struct work_struct *work)
-{
-	struct scarlett2_data *private =
-		container_of(work, struct scarlett2_data, work.work);
-
-	scarlett2_config_save(private->mixer);
-}
-
 /* Send a SCARLETT2_USB_SET_DATA command.
  * offset: location in the device's data space
  * size: size in bytes of the value (1, 2, 4)
@@ -1686,6 +1665,25 @@ static int scarlett2_usb_set_config(
 	return 0;
 }
 
+/* Send SCARLETT2_USB_DATA_CMD SCARLETT2_USB_CONFIG_SAVE */
+static void scarlett2_config_save(struct usb_mixer_interface *mixer)
+{
+	int err;
+
+	err = scarlett2_usb_activate_config(mixer, SCARLETT2_USB_CONFIG_SAVE);
+	if (err < 0)
+		usb_audio_err(mixer->chip, "config save failed: %d\n", err);
+}
+
+/* Delayed work to save config */
+static void scarlett2_config_save_work(struct work_struct *work)
+{
+	struct scarlett2_data *private =
+		container_of(work, struct scarlett2_data, work.work);
+
+	scarlett2_config_save(private->mixer);
+}
+
 /* Send a USB message to get sync status; result placed in *sync */
 static int scarlett2_usb_get_sync_status(
 	struct usb_mixer_interface *mixer,
-- 
2.43.0


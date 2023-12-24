Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89378D2F0
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="QGuYcBak"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 9C6CA604B9CB; Mon, 25 Dec 2023 05:56:43 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 9C6CA604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446003; bh=6FOJ6A/6ciN/FIS2rCUkPKt6Pf1DgEf/C3ElQgZaInw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QGuYcBakB0x9RmAenovr6UYEM5f+96MDFbZQ09zmRdpXvq602rG3W65PMf6EebtjX
	 alkinMviWLlcWQYtKM5SEf3te/Uefnjfoqbp3//EUvyiunj5rKVQOlUoRpAdG7XSaB
	 ImG2s1XReZYLSjNntwyU7piPNKZQy1Wz0G8Gw0QB5ppOdA5DYkJzVozROYsEHPX9z/
	 an0gHfcT0UVuINjmU6vZh/AWWCOaVzLflADtU+s8hxb/ZdsHQSkDjMxgVJKGcIf6Ej
	 Q07EFLjWzmeOzp1FgtgLaI1YUodw5W59uss3rbDI8sIU9JroqSo12Xv0/AImOxwvOW
	 NBu61zyVXf/ZQ==
Date: Mon, 25 Dec 2023 05:56:43 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 09/23] ALSA: scarlett2: Refactor scarlett2_usb_set_config()
Message-ID: <257eca0b07708339133f916930e388057d116eb8.1703444932.git.g@b4.vu>
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

Pull out common code from scarlett2_usb_set_config() and create
scarlett2_usb_set_data() and scarlett2_usb_activate_config().

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 57 ++++++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 16 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 4849dfeea429..bbc60b94b7bc 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1583,20 +1583,52 @@ static void scarlett2_config_save_work(struct work_struct *work)
 	scarlett2_config_save(private->mixer);
 }
 
-/* Send a USB message to set a SCARLETT2_CONFIG_* parameter */
-static int scarlett2_usb_set_config(
+/* Send a SCARLETT2_USB_SET_DATA command.
+ * offset: location in the device's data space
+ * size: size in bytes of the value (1, 2, 4)
+ */
+static int scarlett2_usb_set_data(
 	struct usb_mixer_interface *mixer,
-	int config_item_num, int index, int value)
+	int offset, int size, int value)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_config *config_item =
-		&private->config_set->items[config_item_num];
 	struct {
 		__le32 offset;
-		__le32 bytes;
+		__le32 size;
 		__le32 value;
 	} __packed req;
-	__le32 req2;
+
+	req.offset = cpu_to_le32(offset);
+	req.size = cpu_to_le32(size);
+	req.value = cpu_to_le32(value);
+	return scarlett2_usb(private->mixer, SCARLETT2_USB_SET_DATA,
+			     &req, sizeof(u32) * 2 + size, NULL, 0);
+}
+
+/* Send a SCARLETT2_USB_DATA_CMD command.
+ * Configuration changes require activation with this after they have
+ * been uploaded by a previous SCARLETT2_USB_SET_DATA.
+ * The value for activate needed is determined by the configuration
+ * item.
+ */
+static int scarlett2_usb_activate_config(
+	struct usb_mixer_interface *mixer, int activate)
+{
+	__le32 req;
+
+	req = cpu_to_le32(activate);
+	return scarlett2_usb(mixer, SCARLETT2_USB_DATA_CMD,
+			     &req, sizeof(req), NULL, 0);
+}
+
+/* Send USB messages to set a SCARLETT2_CONFIG_* parameter */
+static int scarlett2_usb_set_config(
+	struct usb_mixer_interface *mixer,
+	int config_item_num, int index, int value)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_config *config_item =
+		&private->config_set->items[config_item_num];
 	int offset, size;
 	int err;
 
@@ -1638,19 +1670,12 @@ static int scarlett2_usb_set_config(
 	}
 
 	/* Send the configuration parameter data */
-	req.offset = cpu_to_le32(offset);
-	req.bytes = cpu_to_le32(size);
-	req.value = cpu_to_le32(value);
-	err = scarlett2_usb(mixer, SCARLETT2_USB_SET_DATA,
-			    &req, sizeof(u32) * 2 + size,
-			    NULL, 0);
+	err = scarlett2_usb_set_data(mixer, offset, size, value);
 	if (err < 0)
 		return err;
 
 	/* Activate the change */
-	req2 = cpu_to_le32(config_item->activate);
-	err = scarlett2_usb(mixer, SCARLETT2_USB_DATA_CMD,
-			    &req2, sizeof(req2), NULL, 0);
+	err = scarlett2_usb_activate_config(mixer, config_item->activate);
 	if (err < 0)
 		return err;
 
-- 
2.43.0


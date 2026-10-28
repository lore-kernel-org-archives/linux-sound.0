Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.16.231.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210074;
	b=gL3F18Bi1RXJC/6RLc280H8dQgHSRZo7kk/cj5KKhqk8QUqQe4dXDYBNj0HS17T5v6GJ
	 ZJzFFo01rdgktZx61le7ivmbS2ifvdk5feAMY/9cJZPy+QTD+qcBncsReWKuzHWQmBSaE
	 RFAC5QQtGEhqDmzf6pkZMPc5tj0vwHckZyTGMyObWhlBG0vAEi9yKPh/1lkkeFxrWfCXW
	 RTAA0GqoSd/SWI4k6zaDd41TWFlyqktZPU+2qFSN+HTwe4wW5J4zy2atJR76S50WMKdg3
	 WZFUrQwujTMAzDQOzY66+Cf9Z3NOwlDFJrD8/I4b565AX3d/Q3Ifg7gHNBiO8+o059g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210074;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=X+J1oeQRdjFtNMGyY9Qk7fhltcuX9skF1xBmQBTVYFo=;
	b=U9BoDHcD2n9GJVjhf9Y79pcgZAwFNQZpbdVB4CttRZ8x/wIJOE4bV+rSqkjtppNEOJBy
	 fnrzz3xI6MjtoRxhGSiT+GSatvOQk/T3pd5yXAF/yK6WGoYfbx8dkOMUeGYljFckuugId
	 tZBf8FO+ImsooPldIh38eW+OyUo2360CUnpMpl4K2KsisPKcDv6FnOirw5PgCpFO4vUA9
	 HFTYl6fS939ntKmenh6EPGSsJi6tte9PRFnGXKlgAc/3c1+izRqo2JmnNPdK0puM+XpKn
	 OOfErL7Ka3IRNKjuauQWqefufb+PY/NMoe7VLidDBkw9cWKrnxmUXpZnIC1JORU87lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=b4.vu;
	spf=pass smtp.mailfrom=b4.vu;
	dkim=pass header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1 header.b="r7Q8u/0u";
	arc=none smtp.remote-ip=203.16.231.148
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383AB606A321
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 17:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 383AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1 header.b=r7Q8u/0u
Received: by m.b4.vu (Postfix, from userid 1000)
	id A012C604B6CF; Thu, 29 Oct 2026 04:24:32 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu A012C604B6CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1793210072; bh=X+J1oeQRdjFtNMGyY9Qk7fhltcuX9skF1xBmQBTVYFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r7Q8u/0ubOPArWEPthY4drwYK7NjsL2c1zp37UfIps6V5qWmvRT8Ulm5rdnfrBNZv
	 TVGAMfHvkro10cLd66r5kyddgMIi4WD8koksJjVTE3WkLQcOBwF9tidTO/m4tXMKhy
	 60mVMGwtWl/IqYPKerFRyQB4Pr+Tymx84ZbEmI/jwILqeWvdhTRQj86WzZmeBq9Zzp
	 wcpgDxT6XwOLGjuz7TpBGyNfZfkzCSnkf28keOblGw2nrWrLjGoipZRIaL50VBcRbH
	 psQwS6PyXQKuU91Ax5uZvnJSWZYkz+xY1jGP0cr5dBWFZx1Az8qu8BcLRN8oGEdKAM
	 EE+P7UgYNUctA==
Date: Thu, 29 Oct 2026 04:24:32 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: scarlett2: Allow config sets to override port
 counts
Message-ID: <da781a3cc3ffe2f9684586e874e118ec9ad01c20.1793207190.git.g@b4.vu>
References: <cover.1793207190.git.g@b4.vu>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793207190.git.g@b4.vu>

Firmware updates can change the number of mux ports. Let a config set
override the device port counts.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index ed5fe746d438..2b4876abcecd 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -616,6 +616,7 @@ struct scarlett2_config_set {
 	const unsigned int *input_gain_tlv;
 	const char *const *autogain_status_texts;
 	const struct scarlett2_config items[SCARLETT2_CONFIG_COUNT];
+	const int (*port_count)[SCARLETT2_PORT_DIRNS];
 };
 
 /* Map firmware versions to config sets per-device.
@@ -1412,6 +1413,7 @@ struct scarlett2_data {
 	struct delayed_work work;
 	const struct scarlett2_device_info *info;
 	const struct scarlett2_config_set *config_set;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS];
 	const char *series_name;
 	__u8 bInterfaceNumber;
 	__u8 bEndpointAddress;
@@ -3158,7 +3160,7 @@ static int scarlett2_usb_set_mix(struct usb_mixer_interface *mixer,
 			     NULL, 0);
 }
 
-/* Convert a port number index (per info->port_count) to a hardware ID */
+/* Convert a port number index (per private->port_count) to a hardware ID */
 static u32 scarlett2_mux_src_num_to_id(
 	const int port_count[][SCARLETT2_PORT_DIRNS], int num)
 {
@@ -3202,8 +3204,7 @@ static u32 scarlett2_mux_id_to_num(
 static void scarlett2_usb_populate_mux(struct scarlett2_data *private,
 				       u32 mux_entry)
 {
-	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = private->port_count;
 
 	int dst_idx, src_idx;
 
@@ -3342,7 +3343,7 @@ static int scarlett2_usb_set_mux(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = private->port_count;
 	int table;
 
 	struct {
@@ -7365,8 +7366,7 @@ static int scarlett2_mux_src_enum_ctl_info(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct scarlett2_data *private = elem->head.mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = private->port_count;
 	unsigned int item = uinfo->value.enumerated.item;
 	int items = private->num_mux_srcs;
 	int port_type;
@@ -7466,8 +7466,7 @@ static const struct snd_kcontrol_new scarlett2_mux_src_enum_ctl = {
 static int scarlett2_add_mux_enums(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = private->port_count;
 	int port_type, channel, i;
 
 	for (i = 0, port_type = 0;
@@ -8696,9 +8695,12 @@ static void scarlett2_count_io(struct scarlett2_data *private)
 {
 	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_config_set *config_set = private->config_set;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS];
 	int port_type, srcs = 0, dsts = 0, i;
 
+	port_count = config_set->port_count ?: info->port_count;
+	private->port_count = port_count;
+
 	/* Count the number of mux sources and destinations */
 	for (port_type = 0;
 	     port_type < SCARLETT2_PORT_TYPE_COUNT;
-- 
2.56.0


Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBE41C6AD
	for <linux-sound@vger.kernel.org>; Sun, 10 Mar 2024 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710066874; cv=none; b=IsWJUZlGDK1D0/huA6x59sgAX61VHXwOgOTeFLvsLIJjVn7CC2wgENCV1GPzCa4T4xC9tL4fGJiO2L1oFAyHgB1QSTiwVusqY+vqX7tewjxIPFQLJonmODwiU0sAMB1aNuBqXflHEBpEcDbyqCjpIhOxon+DIqtWuCUSc242Hm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710066874; c=relaxed/simple;
	bh=oIdGc5ImnhfPaViLEZJj7z0WGuChdCpuiV5eOBsCcs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Om0LKlPbTxihLUMqv31cETjPlkN2+tmAXOEmHYFlBqjU5+gMVRowO1OangY2putz838u7giCoWp15vvIGGytJVV0ggMuX+whJSnC/6TKIRUDZjxcbtEQDR7aRZ08EB5QSlgSOFfsm76ZZk1T1UuPhVx6h9Ft8BFS8K/zQyFtA4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=KmaZQ2gP; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="KmaZQ2gP"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 6680C6007738; Sun, 10 Mar 2024 21:04:27 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 6680C6007738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710066867; bh=alKXXMz8W4c1SZQiDHs47UyXMb/OcD3ZnuxsxJWMXHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmaZQ2gPHe2Rw3shZG96Lh/4jpFQSJT8VK+91kyL7+Hn5mmFhVZXLMr6+53bsrItI
	 pwjMMRX3htmwXlZUXXaDV+zHY95mhxLd6KCwkWC7xiynMTg9FcsWexc8UVdyTiWrRk
	 mabz5pCcULi3tA1bMApDSK31Q+gVh7rjDFp6LHl94+xjuN4+WOUu+oHtMypwy1Wp+y
	 VnEEdOdCMFcxyP+jcv/IU41f0DNiwek8xuI7RQwVeii+OzkfjgxRU68s9ZtId6pzJE
	 H7hoG9/9DGdri4iXARR0H0Ov24070+IGZEFgQhidPa5sm/J30OUbrCgsFsvydpPkFW
	 vWloeUOoauQhA==
Date: Sun, 10 Mar 2024 21:04:27 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 1/3] ALSA: scarlett2: Fix Scarlett 4th Gen 4i4 low-voltage
 detection
Message-ID: <d97b7d87f43b0e54f37e1552394be2f3ae182704.1710047969.git.g@b4.vu>
References: <cover.1710047969.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1710047969.git.g@b4.vu>

The value currently being read to determine the low-voltage state is
actually the front panel state. Fix the code to use the correct offset
for the low-voltage state.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Fixes: d7cfa2fdfc8a ("ALSA: scarlett2: Add power status control")
---
 sound/usb/mixer_scarlett2.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 6de605a601e5..bce69a78c505 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -415,7 +415,7 @@ enum {
 	SCARLETT2_CONFIG_INPUT_SELECT_SWITCH,
 	SCARLETT2_CONFIG_INPUT_LINK_SWITCH,
 	SCARLETT2_CONFIG_POWER_EXT,
-	SCARLETT2_CONFIG_POWER_STATUS,
+	SCARLETT2_CONFIG_POWER_LOW,
 	SCARLETT2_CONFIG_PCM_INPUT_SWITCH,
 	SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN,
 	SCARLETT2_CONFIG_COUNT
@@ -723,8 +723,8 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_4i4 = {
 		[SCARLETT2_CONFIG_POWER_EXT] = {
 			.offset = 0x168 },
 
-		[SCARLETT2_CONFIG_POWER_STATUS] = {
-			.offset = 0x66 }
+		[SCARLETT2_CONFIG_POWER_LOW] = {
+			.offset = 0x16d }
 	}
 };
 
@@ -6294,8 +6294,7 @@ static int scarlett2_update_power_status(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	int err;
-	u8 power_ext;
-	u8 power_status;
+	u8 power_ext, power_low;
 
 	private->power_status_updated = 0;
 
@@ -6304,12 +6303,12 @@ static int scarlett2_update_power_status(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
-	err = scarlett2_usb_get_config(mixer, SCARLETT2_CONFIG_POWER_STATUS,
-				       1, &power_status);
+	err = scarlett2_usb_get_config(mixer, SCARLETT2_CONFIG_POWER_LOW,
+				       1, &power_low);
 	if (err < 0)
 		return err;
 
-	if (power_status > 1)
+	if (power_low)
 		private->power_status = SCARLETT2_POWER_STATUS_FAIL;
 	else if (power_ext)
 		private->power_status = SCARLETT2_POWER_STATUS_EXT;
-- 
2.43.0


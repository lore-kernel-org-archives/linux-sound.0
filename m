Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D398D287
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="DYaDltya"
Received: by m.b4.vu (Postfix, from userid 1000)
	id E88A7604B9CB; Mon, 25 Dec 2023 06:00:38 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu E88A7604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446238; bh=IM3v0Nv1z9Ik6nKAZ+Y0zaINdNmwxjzDUhSISUBT0o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYaDltya3y3+Qp63XpsUmHiT5jwjsWAw615Ufx3Fs5srYqbhk0rzwcni+tTqZhhwg
	 RtQ4Ok2vmtn2rfku3zjNLOAzRzG7/X4sJ8tVDMCyhUWa1GroEELkcTOVwjOrqnqqit
	 7M/yl0f2Zx2GfnxA5aZhjCkyWi0I4WCnc8czb32sMWXb+O6V7ekIFMeaY/YCWBpMZT
	 b19F/f36DcvGE/EfvDAEkayYmncbczTeSHBYIB4pnWaxD9Ok3jcTvFIozyMFexVnb+
	 +5GZVHbm8KFFzmMvpdroKlsl9YhEeYvgZW7ahenVk3bEz2Gqjfk5oaICC4sys/BE2r
	 7EkfHckYqwYfw==
Date: Mon, 25 Dec 2023 06:00:38 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 21/23] ALSA: scarlett2: Rename db_scale_scarlett2_gain to
 volume
Message-ID: <d544ec7cc5d5a849da104a5a78b17f61f50657c1.1703444932.git.g@b4.vu>
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

db_scale_scarlett2_gain is the TLV for the output volume controls.
Gen 4 has software-controllable input gain controls, so rename this to
db_scale_scarlett2_volume so we can use that name for the inputs.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 186d6d04381c..a9bbad29ad4f 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2417,7 +2417,7 @@ static int scarlett2_volume_ctl_put(struct snd_kcontrol *kctl,
 }
 
 static const DECLARE_TLV_DB_MINMAX(
-	db_scale_scarlett2_gain, -SCARLETT2_VOLUME_BIAS * 100, 0
+	db_scale_scarlett2_volume, -SCARLETT2_VOLUME_BIAS * 100, 0
 );
 
 static const struct snd_kcontrol_new scarlett2_master_volume_ctl = {
@@ -2428,7 +2428,7 @@ static const struct snd_kcontrol_new scarlett2_master_volume_ctl = {
 	.info = scarlett2_volume_ctl_info,
 	.get  = scarlett2_master_volume_ctl_get,
 	.private_value = 0, /* max value */
-	.tlv = { .p = db_scale_scarlett2_gain }
+	.tlv = { .p = db_scale_scarlett2_volume }
 };
 
 static const struct snd_kcontrol_new scarlett2_line_out_volume_ctl = {
@@ -2440,7 +2440,7 @@ static const struct snd_kcontrol_new scarlett2_line_out_volume_ctl = {
 	.get  = scarlett2_volume_ctl_get,
 	.put  = scarlett2_volume_ctl_put,
 	.private_value = 0, /* max value */
-	.tlv = { .p = db_scale_scarlett2_gain }
+	.tlv = { .p = db_scale_scarlett2_volume }
 };
 
 /*** Mute Switch Controls ***/
-- 
2.43.0


Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971518F7D;
	Wed, 22 Jan 2025 02:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737512464; cv=none; b=EmCRT3XVtbjb/CxJOHgfVhGhxyxpxk1CTsRxxy1UrMeWTzjLNM870r0mNFoU7ziz35B9WapsterfBJE+dzrKtyzg6i++Od6Ti83N5ddZvjhZRGKe/rzE1XChIB6LPDQjYpoap/Awbt5aEsPTH7bwYIEVamTEz63I/xZ1BFeZ3LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737512464; c=relaxed/simple;
	bh=DmZVXqhjt1ETodsqQOEKan3OR7TU5C+XI3caCJBbHVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kYq93yOIr+SxqWHqTTaNgzFgXVWtRLgPESGU4RxeLqeY8JizltOPR3Ournzml+OG3H5tbrQ4bURn8Mv+b2LOH8OpNRcEDzFOo/xDHy38VCDfR+aDdnWje3GYC5whoFyg5QVRJKv1ik4HreM6z3ZPhZTOskXzW205+xUVLl2r6EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Jr0YI6cI; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Jr0YI6cI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=ZnNKVIuyV2Ul1yn2Uq574Bqxxu5S7ZmJXPK51mtLmZM=; b=Jr0YI6cIDvGtb2Xy
	Vmmy8FkQDdj5p/DkOch4g+IPCYcisDHhjYObTCXAhoJ+oka3UR2AIVee34fXn4ton4zH7AKYK/j8D
	iff/1ou9vdrk7T7dvhoQc7tWXTEUzTzXMbaK+zP2FGkai5fCD2hP1+oL32kCCoCbPmI8+XlPXFsWm
	+rhswsOEuBzoiwZztW+0u300+Yn8J0sqmDfotSuH1JgQNAHGwzZ2PgTc/MqOIiYrgzEB5apam6gJ7
	kg4ChndfQe0cg9r89WrWQtiM7oGBqX9S1m6iztFh8NLIfknE49S9yxgMWS4Le0pNI8Nrl+Ngp/N1N
	rWgZmYx8sIo1memtAQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1taQMW-00BPN8-0L;
	Wed, 22 Jan 2025 02:21:00 +0000
From: linux@treblig.org
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2] ALSA: lola: Remove unused lola_(save|restore)_mixer
Date: Wed, 22 Jan 2025 02:20:59 +0000
Message-ID: <20250122022059.456068-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

lola_restore_mixer() and lola_save_mixer() were added in 2011 by
commit d43f3010b8fa ("ALSA: Add the driver for Digigram Lola
PCI-e boards")
but have remain unused.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/pci/lola/lola.h       |  2 --
 sound/pci/lola/lola_mixer.c | 43 -------------------------------------
 2 files changed, 45 deletions(-)

diff --git a/sound/pci/lola/lola.h b/sound/pci/lola/lola.h
index 0ff772cf66e6..25f72f9e3f9b 100644
--- a/sound/pci/lola/lola.h
+++ b/sound/pci/lola/lola.h
@@ -499,8 +499,6 @@ int lola_init_mixer_widget(struct lola *chip, int nid);
 void lola_free_mixer(struct lola *chip);
 int lola_create_mixer(struct lola *chip);
 int lola_setup_all_analog_gains(struct lola *chip, int dir, bool mute);
-void lola_save_mixer(struct lola *chip);
-void lola_restore_mixer(struct lola *chip);
 int lola_set_src_config(struct lola *chip, unsigned int src_mask, bool update);
 
 /* proc */
diff --git a/sound/pci/lola/lola_mixer.c b/sound/pci/lola/lola_mixer.c
index 6b162489cb5f..9cb26a8a4e1a 100644
--- a/sound/pci/lola/lola_mixer.c
+++ b/sound/pci/lola/lola_mixer.c
@@ -336,49 +336,6 @@ int lola_setup_all_analog_gains(struct lola *chip, int dir, bool mute)
 	return lola_codec_flush(chip);
 }
 
-void lola_save_mixer(struct lola *chip)
-{
-	/* mute analog output */
-	if (chip->mixer.array_saved) {
-		/* store contents of mixer array */
-		memcpy_fromio(chip->mixer.array_saved, chip->mixer.array,
-			      sizeof(*chip->mixer.array));
-	}
-	lola_setup_all_analog_gains(chip, PLAY, true); /* output mute */
-}
-
-void lola_restore_mixer(struct lola *chip)
-{
-	int i;
-
-	/*lola_reset_setups(chip);*/
-	if (chip->mixer.array_saved) {
-		/* restore contents of mixer array */
-		memcpy_toio(chip->mixer.array, chip->mixer.array_saved,
-			    sizeof(*chip->mixer.array));
-		/* inform micro-controller about all restored values
-		 * and ignore return values
-		 */
-		for (i = 0; i < chip->mixer.src_phys_ins; i++)
-			lola_codec_write(chip, chip->mixer.nid,
-					 LOLA_VERB_SET_SOURCE_GAIN,
-					 i, 0);
-		for (i = 0; i < chip->mixer.src_stream_outs; i++)
-			lola_codec_write(chip, chip->mixer.nid,
-					 LOLA_VERB_SET_SOURCE_GAIN,
-					 chip->mixer.src_stream_out_ofs + i, 0);
-		for (i = 0; i < chip->mixer.dest_stream_ins; i++)
-			lola_codec_write(chip, chip->mixer.nid,
-					 LOLA_VERB_SET_DESTINATION_GAIN,
-					 i, 0);
-		for (i = 0; i < chip->mixer.dest_phys_outs; i++)
-			lola_codec_write(chip, chip->mixer.nid,
-					 LOLA_VERB_SET_DESTINATION_GAIN,
-					 chip->mixer.dest_phys_out_ofs + i, 0);
-		lola_codec_flush(chip);
-	}
-}
-
 /*
  */
 
-- 
2.48.1


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF0C256C84
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047774; cv=none; b=niXEWIv3rxTT7VEENbnb6jgb5+qWM14ZfjZyKz9a0rj/uCQ3afjz8FW390if+TNXSYqsePEqEZlJZjlXdxTLPvMahGc6AKNZN6Wtyv5m19Odr/ge9JJntj2q5+ONPSE2CPwDywkBKnLiVTYGvwJpMRgOti1qgbxWF7E+/Uv5wow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047774; c=relaxed/simple;
	bh=LGu9q+oY+aZKXdF8ysJiCZGdr7yRFFmb51eIL3vmflA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LZJGljzbKn9r8G14r++MYH36CqBPT05i1y5/91U+t4VlLO/H86ar3aWTMarR9P0b8YXGz/OB6VkSx9cJqYmoBYHv4Q2go25iuhSwbp/QI48/0FOQr2LDGzvjsUbdkzyvYy26MCdgEYewv6P/wKnloFy5DRt8opUTxkAtlhsc1Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8N4jbVA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8N4jbVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773047772; x=1804583772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LGu9q+oY+aZKXdF8ysJiCZGdr7yRFFmb51eIL3vmflA=;
  b=W8N4jbVA7O/3w4J51BxXczJSngCIOES2d6fKxeGAl4AvpOU5hLj9YIrP
   tq168Khb4yV/kxtQXfy8WY3BTScSxJnmnV17EQTIEm2KZ27Srzy9mlZoK
   Y4OflIeZiVvtPGaZWPW1NRmVUsDe3UF9DmXvPoAJhoHnfLo/sRdiEaB6C
   YukbmV16WCykqifUXNF8J3TcWW148vGmWyWIvykwKJBlDljXpa9UdHmRr
   b1VN2+HO5zlQsDR6w2cMJvYx7dW3QUq/3qOnVryaMjVXoFjy2Uz0mVXyI
   dpzHsGQ5jijwgdsdtn6u6Ri/wkMaMXPvQbLaOlXDifNwnAzFEBSEFuObI
   A==;
X-CSE-ConnectionGUID: gl3Ym2pTSAqR1w0yV4ENLw==
X-CSE-MsgGUID: VYTLcOMVRSayOEldNpe4aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84776991"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84776991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 02:16:11 -0700
X-CSE-ConnectionGUID: 73GCfis5RqS9JjFFsHc4nw==
X-CSE-MsgGUID: 9LFN9+K6SNeIjmC5Zl2DJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="245688625"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 09 Mar 2026 02:16:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/5] ASoC: Intel: catpt: Simplify procedure of applying user settings
Date: Mon,  9 Mar 2026 10:16:03 +0100
Message-Id: <20260309091605.896307-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309091605.896307-1-cezary.rojewski@intel.com>
References: <20260309091605.896307-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing catpt_dai_apply_usettings() applies all the individual control
settings but why-what is covered behind if-statements. Refactor the
operation into:

catpt_apply_controls()
|__ catpt_apply_volume()
|__ catpt_apply_mute()

to make it easy to understand why and what is going on. The update also
enlists snd_ctl_find_id_mixer() for the query purpose, removing code
duplication.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 64 +++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 08f1e36a136f..3074b6c958fa 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -359,46 +359,48 @@ struct catpt_control_data {
 	long volumes[CATPT_CHANNELS_MAX];
 };
 
-static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
-				     struct catpt_stream_runtime *stream)
+static int catpt_apply_volume(struct catpt_dev *cdev, struct snd_soc_card *card, const char *name)
 {
-	struct snd_soc_component *component = dai->component;
-	struct snd_kcontrol *pos;
-	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
-	const char *name;
+	struct snd_kcontrol *kctl = snd_ctl_find_id_mixer(card->snd_card, name);
+	struct catpt_control_data *data;
+
+	if (!kctl)
+		return -ENOENT;
+	data = (struct catpt_control_data *)kctl->private_value;
+
+	return catpt_set_dspvol(cdev, data->pin_id, data->volumes);
+}
+
+static int catpt_apply_mute(struct catpt_dev *cdev, struct snd_soc_card *card)
+{
+	struct snd_kcontrol *kctl = snd_ctl_find_id_mixer(card->snd_card, "Loopback Mute");
+	bool mute;
 	int ret;
-	u32 id = stream->info.stream_hw_id;
 
-	/* only selected streams have individual controls */
-	switch (id) {
+	if (!kctl)
+		return -ENOENT;
+	mute = *(bool *)kctl->private_value;
+
+	ret = catpt_ipc_mute_loopback(cdev, CATPT_PIN_ID_REFERENCE, mute);
+	return CATPT_IPC_RET(ret);
+}
+
+static int catpt_apply_controls(struct catpt_dev *cdev, struct snd_soc_card *card,
+				struct catpt_stream_runtime *stream)
+{
+	/* Only selected streams have individual controls. */
+	switch (stream->info.stream_hw_id) {
 	case CATPT_PIN_ID_OFFLOAD1:
-		name = "Media0 Playback Volume";
-		break;
+		return catpt_apply_volume(cdev, card, "Media0 Playback Volume");
 	case CATPT_PIN_ID_OFFLOAD2:
-		name = "Media1 Playback Volume";
-		break;
+		return catpt_apply_volume(cdev, card, "Media1 Playback Volume");
 	case CATPT_PIN_ID_CAPTURE1:
-		name = "Mic Capture Volume";
-		break;
+		return catpt_apply_volume(cdev, card, "Mic Capture Volume");
 	case CATPT_PIN_ID_REFERENCE:
-		name = "Loopback Mute";
-		break;
+		return catpt_apply_mute(cdev, card);
 	default:
 		return 0;
 	}
-
-	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
-		if (pos->private_data == component &&
-		    !strncmp(name, pos->id.name, sizeof(pos->id.name)))
-			break;
-	}
-	if (list_entry_is_head(pos, &component->card->snd_card->controls, list))
-		return -ENOENT;
-
-	if (stream->template->type != CATPT_STRM_TYPE_LOOPBACK)
-		return catpt_set_dspvol(cdev, id, (long *)pos->private_value);
-	ret = catpt_ipc_mute_loopback(cdev, id, *(bool *)pos->private_value);
-	return CATPT_IPC_RET(ret);
 }
 
 static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
@@ -449,7 +451,7 @@ static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
 
 	guard(mutex)(&cdev->stream_mutex);
 
-	ret = catpt_dai_apply_usettings(dai, stream);
+	ret = catpt_apply_controls(cdev, dai->component->card, stream);
 	if (ret) {
 		catpt_ipc_free_stream(cdev, stream->info.stream_hw_id);
 		return ret;
-- 
2.34.1


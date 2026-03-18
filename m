Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395B52701CF;
	Wed, 18 Mar 2026 16:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773852501; cv=none; b=iL3HzUDdhz0WvFLeBxJ7Xp4boYOsbr9yQQu9IIPNWiSQRZlSw1xrtLX+Hued7PeQ38cfzL5jDddeALJidArv6ios8gTKh/5mWwQYfU11H1kyQGtsyFgEYz6c52rFd4nS7/D3SzFS6XNUDlMTzu4Ivdby8eHvE3/TQFsn670+GEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773852501; c=relaxed/simple;
	bh=gqKg1TqY0t/5bw8+uyhyFiPwhOgXMAj7MoK3sfU67pQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P4pLUgNPb1hSKcQjJBSeDHegS0G2rf80Nr9VCRzY4yn2Apqd9hSSJuvY6h+jJb1K8Ul6cTZelj4J4qmgMEQkMOm5acas0fSFnG0QpMb6xaDyf5/beyBbmZIDOn2wGAP4FQbYU6jjanxysJHGTWZmVrzB2NZ7Syv22JXmaV8HjXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=FLZ/Fbr2; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="FLZ/Fbr2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=pOKqgyHabOa6CwHeK5qlDoUyrXbH7kziKPjb/X6B+dM=; b=FLZ/Fbr2D5bk/Q
	37BWOZKBSs8kx1NukGOcmlq5Kb2y7DP9ezlFcIvpRz/5G7KtRziE5NSd7JdHV3GXi9zIvEPNmAemI
	FPYL0t6pgWl0tVgEy+T63P8A3lkJfcyoXymSChe1pJqHXkYMaC4ywmbuAmn67n6cyj9f3qLbGkRio
	m27eVSZIihpQSiB03AQoTmLfJBnolzlETnElG+R+OdhiI1iUFJIJwywsYS//pK7bGiC633doc/PCm
	oqU9KFnPUWfnMu/klDjNxCXFkVHyiXYpTwfWqJ0m8LmT0eIrsF2EYbPek6js18QCg7rTeehdWri05
	+laWzbIMorNxJzesQYQQ==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1w2u3x-00CoP9-CK; Wed, 18 Mar 2026 16:48:05 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1w2u3w-00000004YfU-3xdg;
	Wed, 18 Mar 2026 16:48:04 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v4] ASoC: SOF: sof-audio: pcm_id is __le32
Date: Wed, 18 Mar 2026 16:48:00 +0000
Message-Id: <20260318164800.1086567-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

The pcm_id value is __le32 so convert it before passing to the dev_dbg
function to be printed. Also fixup some other uses of __le32 data and
a couple of places where %u should have been used instead of %d

Picked up by sparse prototype for variadic and printf
function checking. Fixes a large number of sparse warnings, such as:

sound/soc/sof/pcm.c:84:25: warning: incorrect type in argument 4 (different base types)
sound/soc/sof/pcm.c:84:25:    expected unsigned int
sound/soc/sof/pcm.c:84:25:    got restricted __le32 [usertype] pcm_id

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

---
v2: fix missing __le32 conversions
v3: further __le32 fixes for other header values
v4: fix signed-ness of printf formatting
---
 sound/soc/sof/compress.c      |  4 ++--
 sound/soc/sof/ipc4-topology.c | 13 +++++++------
 sound/soc/sof/pcm.c           |  6 +++---
 sound/soc/sof/sof-audio.h     | 11 +++++++----
 sound/soc/sof/topology.c      | 22 ++++++++++++----------
 5 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 96570121aae0..3dbc05bf3b79 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -247,8 +247,8 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 	ret = snd_sof_set_stream_data_offset(sdev, &spcm->stream[cstream->direction],
 					     ipc_params_reply.posn_offset);
 	if (ret < 0) {
-		dev_err(component->dev, "Invalid stream data offset for Compr %d\n",
-			spcm->pcm.pcm_id);
+		dev_err(component->dev, "Invalid stream data offset for Compr %u\n",
+			le32_to_cpu(spcm->pcm.pcm_id));
 		goto out;
 	}
 
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index db077e9d5644..82f1e44a145e 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -581,6 +581,7 @@ sof_ipc4_update_card_components_string(struct snd_sof_widget *swidget,
 	struct snd_soc_component *scomp = spcm->scomp;
 	struct snd_soc_card *card = scomp->card;
 	const char *pt_marker = "iec61937-pcm";
+	unsigned pcm_id = le32_to_cpu(spcm->pcm.pcm_id);
 
 	/*
 	 * Update the card's components list with iec61937-pcm and a list of PCM
@@ -595,21 +596,21 @@ sof_ipc4_update_card_components_string(struct snd_sof_widget *swidget,
 
 		if (strstr(card->components, pt_marker))
 			card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-							  "%s,%d",
+							  "%s,%u",
 							  card->components,
-							  spcm->pcm.pcm_id);
+							  pcm_id);
 		else
 			card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-							  "%s %s:%d",
+							  "%s %s:%u",
 							  card->components,
 							  pt_marker,
-							  spcm->pcm.pcm_id);
+							  pcm_id);
 
 		devm_kfree(card->dev, tmp);
 	} else {
 		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-						  "%s:%d", pt_marker,
-						  spcm->pcm.pcm_id);
+						  "%s:%u", pt_marker,
+						  pcm_id);
 	}
 
 	if (!card->components)
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 5b598d0940eb..fcb002b3e611 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -360,8 +360,8 @@ static int sof_pcm_prepare(struct snd_soc_component *component,
 	platform_params = &spcm->platform_params[substream->stream];
 	ret = sof_widget_list_setup(sdev, spcm, params, platform_params, dir);
 	if (ret < 0) {
-		dev_err(sdev->dev, "failed widget list set up for pcm %d dir %d\n",
-			spcm->pcm.pcm_id, dir);
+		dev_err(sdev->dev, "failed widget list set up for pcm %u dir %d\n",
+			le32_to_cpu(spcm->pcm.pcm_id), dir);
 		spcm->stream[dir].list = NULL;
 		snd_soc_dapm_dai_free_widgets(&list);
 		return ret;
@@ -652,7 +652,7 @@ static int sof_pcm_new(struct snd_soc_component *component,
 	}
 
 	dev_dbg(spcm->scomp->dev, "pcm%u (%s): Entry: pcm_construct\n",
-		spcm->pcm.pcm_id, spcm->pcm.pcm_name);
+		le32_to_cpu(spcm->pcm.pcm_id), spcm->pcm.pcm_name);
 
 	/* do we need to pre-allocate playback audio buffer pages */
 	if (!spcm->pcm.playback)
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 36082e764bf9..80b11625915d 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -641,17 +641,20 @@ void snd_sof_pcm_init_elapsed_work(struct work_struct *work);
  */
 #define spcm_dbg(__spcm, __dir, __fmt, ...)					\
 	dev_dbg((__spcm)->scomp->dev, "pcm%u (%s), dir %d: " __fmt,		\
-		(__spcm)->pcm.pcm_id, (__spcm)->pcm.pcm_name, __dir,		\
+		le32_to_cpu((__spcm)->pcm.pcm_id),				\
+		(__spcm)->pcm.pcm_name, __dir,					\
 		##__VA_ARGS__)
 
 #define spcm_dbg_ratelimited(__spcm, __dir, __fmt, ...)				\
 	dev_dbg_ratelimited((__spcm)->scomp->dev, "pcm%u (%s), dir %d: " __fmt,	\
-		(__spcm)->pcm.pcm_id, (__spcm)->pcm.pcm_name, __dir,		\
-		##__VA_ARGS__)
+			    le32_to_cpu((__spcm)->pcm.pcm_id),			\
+			    (__spcm)->pcm.pcm_name, __dir,			\
+			    ##__VA_ARGS__)
 
 #define spcm_err(__spcm, __dir, __fmt, ...)					\
 	dev_err((__spcm)->scomp->dev, "%s: pcm%u (%s), dir %d: " __fmt,		\
-		__func__, (__spcm)->pcm.pcm_id, (__spcm)->pcm.pcm_name, __dir,	\
+		__func__, le32_to_cpu((__spcm)->pcm.pcm_id),			\
+		(__spcm)->pcm.pcm_name, __dir,					\
 		##__VA_ARGS__)
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 18e2401152c8..73532fad2cb9 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -775,8 +775,8 @@ static int sof_parse_token_sets(struct snd_soc_component *scomp,
 						       array);
 			break;
 		default:
-			dev_err(scomp->dev, "error: unknown token type %d\n",
-				array->type);
+			dev_err(scomp->dev, "error: unknown token type %u\n",
+				le32_to_cpu(array->type));
 			return -EINVAL;
 		}
 
@@ -880,7 +880,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 			       ARRAY_SIZE(led_tokens), mc->priv.array,
 			       le32_to_cpu(mc->priv.size));
 	if (ret != 0) {
-		dev_err(scomp->dev, "error: parse led tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse led tokens failed %u\n",
 			le32_to_cpu(mc->priv.size));
 		goto err;
 	}
@@ -970,8 +970,8 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 	struct snd_sof_control *scontrol;
 	int ret;
 
-	dev_dbg(scomp->dev, "tplg: load control type %d name : %s\n",
-		hdr->type, hdr->name);
+	dev_dbg(scomp->dev, "tplg: load control type %u name : %s\n",
+		le32_to_cpu(hdr->type), hdr->name);
 
 	scontrol = kzalloc_obj(*scontrol);
 	if (!scontrol)
@@ -1015,8 +1015,10 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 	case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
 	case SND_SOC_TPLG_DAPM_CTL_PIN:
 	default:
-		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
-			 hdr->ops.get, hdr->ops.put, hdr->ops.info);
+		dev_warn(scomp->dev, "control type not supported %u:%u:%u\n",
+			 le32_to_cpu(hdr->ops.get),
+			 le32_to_cpu(hdr->ops.put),
+			 le32_to_cpu(hdr->ops.info));
 		kfree(scontrol->name);
 		kfree(scontrol);
 		return 0;
@@ -1523,8 +1525,8 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		break;
 	case snd_soc_dapm_pga:
 		if (!le32_to_cpu(tw->num_kcontrols)) {
-			dev_err(scomp->dev, "invalid kcontrol count %d for volume\n",
-				tw->num_kcontrols);
+			dev_err(scomp->dev, "invalid kcontrol count %u for volume\n",
+				le32_to_cpu(tw->num_kcontrols));
 			ret = -EINVAL;
 			break;
 		}
@@ -1772,7 +1774,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(stream_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret) {
-		dev_err(scomp->dev, "error: parse stream tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse stream tokens failed %u\n",
 			le32_to_cpu(private->size));
 		return ret;
 	}
-- 
2.37.2.352.g3c44437643


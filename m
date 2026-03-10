Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FFB40DFA7;
	Tue, 10 Mar 2026 12:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147084; cv=none; b=jUCVLmZUKqDcU2OS/4gqC3DQhDC8Q0LP0N84gFUhwdPKhHFrp4Azf57Q3SMuvWpaCAeb8HpSaQSfCOgYwcKwspcNmMRl7iu6Whq4KL5FKiPLZzQCf+iJTlT/JknLWIce0o4BT9ki3HhsSzMip4/mNARQD4Dxvv04Bo9Y4F9PiYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147084; c=relaxed/simple;
	bh=JiCmO26M6kszqtQ5+7APB3y1WkedCsxjHuw6X9h19mo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qetz8IFJNfLqPOOzcI14waURvIMXBUnySyzSUQD50hpWRiOE95cFjQxKilMoqDvktpCk3DeYJuCgyTXykxuQ69S746/TtjSG/UNpqCiBWMOU4Jro0WszxZH6of2KkHKGtfNadfzuvGCXmPvQz0qmiTdWa1pOOXi3TmfYsUz5A1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=utERhQ0q; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="utERhQ0q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=wucwdrSqtfli6/6UBILh1XncwCQCqabud6OYCevZpYw=; b=utERhQ0q6iRMq2
	L4F+l4kuu9qKv/qBoPTihhISzmVI/hG+5FSmk9lrvj1dcIYJk+q7MsCwfJ7ITmCyAU3GdFehYqi9x
	8jyvhlF0OYwrE30ELDCaJoxdxmk7wylRo+SxO+/bXTD/qojqSEDF9pH726a+rYRjxKw3WeDyCYUhA
	N/ymTs7gxrzOZ4uuLx2creaoSNSeqcynV8oOUAW9cbMcHm4MfbSul2t6ptFlv3wyYS4KCGq23w+gE
	9iJUn4HV26/hS9YOTBYfoxa40gWZGEZixOquc+rJyLhWR45AGmpLnSRZ44AzpFrZ8hYmXNa3XZphf
	qz9yKvj27OwzWiu6vZYw==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vzwYH-00CrPZ-12; Tue, 10 Mar 2026 12:51:09 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1vzwYG-00000000kYP-1Oy4;
	Tue, 10 Mar 2026 12:51:08 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	pierre-louis.bossart@linux.dev,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	sound-open-firmware@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kai.vehmanen@linux.intel.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v3] ASoC: SOF: sof-audio: pcm_id is __le32
Date: Tue, 10 Mar 2026 12:51:06 +0000
Message-Id: <20260310125106.178944-1-ben.dooks@codethink.co.uk>
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
---
 sound/soc/sof/compress.c      |  2 +-
 sound/soc/sof/ipc4-topology.c | 13 +++++++------
 sound/soc/sof/pcm.c           |  4 ++--
 sound/soc/sof/sof-audio.h     | 11 +++++++----
 sound/soc/sof/topology.c      | 10 ++++++----
 5 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 96570121aae0..c6c19df29035 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -248,7 +248,7 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 					     ipc_params_reply.posn_offset);
 	if (ret < 0) {
 		dev_err(component->dev, "Invalid stream data offset for Compr %d\n",
-			spcm->pcm.pcm_id);
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
index 5b598d0940eb..16c194b4851b 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -361,7 +361,7 @@ static int sof_pcm_prepare(struct snd_soc_component *component,
 	ret = sof_widget_list_setup(sdev, spcm, params, platform_params, dir);
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed widget list set up for pcm %d dir %d\n",
-			spcm->pcm.pcm_id, dir);
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
index 18e2401152c8..2740f24cd1d3 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -776,7 +776,7 @@ static int sof_parse_token_sets(struct snd_soc_component *scomp,
 			break;
 		default:
 			dev_err(scomp->dev, "error: unknown token type %d\n",
-				array->type);
+				le32_to_cpu(array->type));
 			return -EINVAL;
 		}
 
@@ -971,7 +971,7 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 	int ret;
 
 	dev_dbg(scomp->dev, "tplg: load control type %d name : %s\n",
-		hdr->type, hdr->name);
+		le32_to_cpu(hdr->type), hdr->name);
 
 	scontrol = kzalloc_obj(*scontrol);
 	if (!scontrol)
@@ -1016,7 +1016,9 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 	case SND_SOC_TPLG_DAPM_CTL_PIN:
 	default:
 		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
-			 hdr->ops.get, hdr->ops.put, hdr->ops.info);
+			 le32_to_cpu(hdr->ops.get),
+			 le32_to_cpu(hdr->ops.put),
+			 le32_to_cpu(hdr->ops.info));
 		kfree(scontrol->name);
 		kfree(scontrol);
 		return 0;
@@ -1524,7 +1526,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	case snd_soc_dapm_pga:
 		if (!le32_to_cpu(tw->num_kcontrols)) {
 			dev_err(scomp->dev, "invalid kcontrol count %d for volume\n",
-				tw->num_kcontrols);
+				le32_to_cpu(tw->num_kcontrols));
 			ret = -EINVAL;
 			break;
 		}
-- 
2.37.2.352.g3c44437643


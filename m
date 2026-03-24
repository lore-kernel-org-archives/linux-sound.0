Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17833E3C74;
	Tue, 24 Mar 2026 10:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349459; cv=none; b=T8rv+IDHcG+k8ciKLCVetsbwiWmH/0FGH/7UEJVxcm83SmTi49cNGEF6K3+X7HRajOxL/TPXqyU3dBmHXipaSGdlSNQRox1ZCuWJkO2Mj0/poYGygi+lqqcqbDcfv+sb+OjwKLelu98qhsXXaj8VE789G8Vfe7M3QBQKUYAV6sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349459; c=relaxed/simple;
	bh=VPEEfvfhbbibvyfUZerlyIS7h6fTTCMSZissG/29gxY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cb78qFLBWSe2FtLvZ7wU8XdM55oNhdv4hWrJP0yGIR/1V5sMimoVpGJFTfQzbtIL7Cbu6aO3tFGfdguOXdMk1+qeoPwrZoUyIHKz5VJOSI7flVcWXcRbrRD8XbTOk9c3TSxoclwNyucUFBxZU415KsP6qE6Bxj7rXWnTL/x0+B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=Z/x0RxOr; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="Z/x0RxOr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=48Pi96z23t2gYmpMmdR01/+vfDXhEQD8xG6PINj+Vq4=; b=Z/x0RxOrd6Xk/S
	oKdLXcduIFRXa7n3qquKASUa5VB2QmUoSUGB8IyReHgCVuhHJ1Ptue+JzYPjgt7otmGRhguTlm/TX
	uiRkLsT1s/1JFRekx3pEDY9EPneY1wGboeDI1IVDgNui7hvrXxOr72eWh9iHc6XYoXgpg2IGwt3Qn
	o9MYdCEekXMGfDeBEylylLJtTbTA2a099UDXEYHxU3SUISSgTQiMxsXlzflDvabktk3bQ5r2IWraI
	Gk+ky0C+Th9XD2HAR8QHRfT3GtezanmehgDGlDFBlElAKXM7e8nejPIhbNkM6Dzd3b3+iQRBUZk8a
	fHXtTgy3oXwESQQrsAlw==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1w4zLG-0077XE-Mp; Tue, 24 Mar 2026 10:50:34 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1w4zLF-00000000Puy-2xR4;
	Tue, 24 Mar 2026 10:50:33 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RESEND v4] ASoC: SOF: sof-audio: pcm_id is __le32
Date: Tue, 24 Mar 2026 10:50:27 +0000
Message-Id: <20260324105027.99586-1-ben.dooks@codethink.co.uk>
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
 sound/soc/sof/compress.c |  2 +-
 sound/soc/sof/pcm.c      |  2 +-
 sound/soc/sof/topology.c | 12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index c6c19df29035..3dbc05bf3b79 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -247,7 +247,7 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 	ret = snd_sof_set_stream_data_offset(sdev, &spcm->stream[cstream->direction],
 					     ipc_params_reply.posn_offset);
 	if (ret < 0) {
-		dev_err(component->dev, "Invalid stream data offset for Compr %d\n",
+		dev_err(component->dev, "Invalid stream data offset for Compr %u\n",
 			le32_to_cpu(spcm->pcm.pcm_id));
 		goto out;
 	}
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index d3af30398305..b2071edeaea6 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -360,7 +360,7 @@ static int sof_pcm_prepare(struct snd_soc_component *component,
 	platform_params = &spcm->platform_params[substream->stream];
 	ret = sof_widget_list_setup(sdev, spcm, params, platform_params, dir);
 	if (ret < 0) {
-		dev_err(sdev->dev, "failed widget list set up for pcm %d dir %d\n",
+		dev_err(sdev->dev, "failed widget list set up for pcm %d dir %u\n",
 			le32_to_cpu(spcm->pcm.pcm_id), dir);
 		spcm->stream[dir].list = NULL;
 		snd_soc_dapm_dai_free_widgets(&list);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 63d637db7053..907f9b1e9d1b 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -775,7 +775,7 @@ static int sof_parse_token_sets(struct snd_soc_component *scomp,
 						       array);
 			break;
 		default:
-			dev_err(scomp->dev, "error: unknown token type %d\n",
+			dev_err(scomp->dev, "error: unknown token type %u\n",
 				le32_to_cpu(array->type));
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
@@ -970,7 +970,7 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 	struct snd_sof_control *scontrol;
 	int ret;
 
-	dev_dbg(scomp->dev, "tplg: load control type %d name : %s\n",
+	dev_dbg(scomp->dev, "tplg: load control type %u name : %s\n",
 		le32_to_cpu(hdr->type), hdr->name);
 
 	scontrol = kzalloc_obj(*scontrol);
@@ -1015,7 +1015,7 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 	case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
 	case SND_SOC_TPLG_DAPM_CTL_PIN:
 	default:
-		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
+		dev_warn(scomp->dev, "control type not supported %u:%u:%u\n",
 			 le32_to_cpu(hdr->ops.get),
 			 le32_to_cpu(hdr->ops.put),
 			 le32_to_cpu(hdr->ops.info));
@@ -1525,7 +1525,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		break;
 	case snd_soc_dapm_pga:
 		if (!le32_to_cpu(tw->num_kcontrols)) {
-			dev_err(scomp->dev, "invalid kcontrol count %d for volume\n",
+			dev_err(scomp->dev, "invalid kcontrol count %u for volume\n",
 				le32_to_cpu(tw->num_kcontrols));
 			ret = -EINVAL;
 			break;
@@ -1774,7 +1774,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
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


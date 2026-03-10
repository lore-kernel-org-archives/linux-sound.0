Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F6C2ED141;
	Tue, 10 Mar 2026 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142842; cv=none; b=tTJA7EpEmhVWhJ0DDsXmDrsnhd7h6JPKGHTqs6h4lpE13XqqxIxGh9VnOcOmIVk+MU19BAjejd7xNpELKlx8dBOhlbM+gn5rb8fFDYzmEQ9LJJ25YZKvHsDtZfhAemjI8ad0AIY33bj9PwreSKTuZ2CraKYVvxW030B9+vNNRME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142842; c=relaxed/simple;
	bh=ByXX0bq5yTcyYa23NDVm4jRrNRmDSUDGRrQpyjEEg/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sxxCfbelMYd+xsqWl6d/ejaCwGVeGXedLoz4UXLAx/bx3/8pVSLMJ8sFrYgnBjXkkKdWll1fhYRKdKXAP3d7rNFLsZpPULUyl1WTndjibF8p14+Jg6vTY/VLwTf6lIuJt3cz05Fm0+iDakKRUTMXmF12R5AJ/geN4yWM6iSUBDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=2oKJJye/; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="2oKJJye/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=ASKo6DVfW24ZV4k0Ic5cNq9ZkD8KQ8JTXMRcjJwXna8=; b=2oKJJye/8WZ7aT
	LhxhQENDc8W+T1cEEJbBJ5KuhRA8iDLKQZUKi+ciVmaGypwvd6DUh6zReq3xD6KG8PFflatQtW9/0
	pJv9E+ZuDt0iVNKdN1nRCqzzzZGqpa5t7BdRWnN+K9zyDihvaTblcFE9YFSilP+seT18oTFmfES9D
	kCcTMsHkjP9ODjcJeKIeYlRH2lT/AFh7qbam37Aq+DOXHR7PAgIKGZKDEAAFkGRZHH8NxJvAryBrT
	oVMlFy9iHkvn5nz3h3Ag9AWVLSqoTUG2qFZ46gQYUQPijcm2jrQlNsCjgBy90DQ4Ufe1T3TTMf/ZP
	nI70su/NLXoI2j8VICAQ==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vzvRt-00Cd0H-Ab; Tue, 10 Mar 2026 11:40:29 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1vzvRr-00000000cfc-3jSr;
	Tue, 10 Mar 2026 11:40:27 +0000
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
Subject: [PATCH v2] ASoC: SOF: sof-audio: pcm_id is __le32
Date: Tue, 10 Mar 2026 11:40:25 +0000
Message-Id: <20260310114025.148639-1-ben.dooks@codethink.co.uk>
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
function to be printed. Picked up by sparse prototype for variadic and printf
function checking.

Fixes a large number of sparse warnings, such as:

sound/soc/sof/pcm.c:84:25: warning: incorrect type in argument 4 (different base types)
sound/soc/sof/pcm.c:84:25:    expected unsigned int
sound/soc/sof/pcm.c:84:25:    got restricted __le32 [usertype] pcm_id

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
v2: fix missing __le32 conversions
---
 sound/soc/sof/pcm.c       |  4 ++--
 sound/soc/sof/sof-audio.h | 11 +++++++----
 2 files changed, 9 insertions(+), 6 deletions(-)

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
index 36082e764bf9..cf6499464a64 100644
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
+		__func__, le32_to_cpu((__spcm)->pcm.pcm_id)			\
+		, (__spcm)->pcm.pcm_name, __dir,			\
 		##__VA_ARGS__)
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
-- 
2.37.2.352.g3c44437643


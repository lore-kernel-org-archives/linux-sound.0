Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558FC3033F6;
	Sat, 14 Feb 2026 06:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771051395; cv=none; b=Om5qqHbkFabqYgDMYsIIJymhT0AgC0ncNFTYOSA/FJR2OKandXQLhuUtCTT37RNpvgivqQQUYZOc0AHrYUB1MrOjG7RzG7MgVuU1TUlsmM+dDQnu0tYNp9zVfldMtObZi1S8p3bQc91zX53JwauuRVWoMPQqkRpw+O9vx09t/Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771051395; c=relaxed/simple;
	bh=a0m4d/7E0GIkRTEulw3VanhiSAJL6BZRU0LyoE8g72E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ntPGibHIZw+9jaSB8p1T6X3KjsTJdgTPiJX82vdA5FTh6aNvjfORdm/To3JuQJnrE3jHeGvj3Z7XD1D6MyNmIfh0tYol/TWKR7UFB66AI+9uKhTgZPzTwvlAcF6BqaTd5iySiwcteNCF1fBbEEMA9rYQPR3EV6+gK435UI+NdWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
From: Cole Leavitt <cole@unwrap.rs>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cole Leavitt <cole@unwrap.rs>
Subject: [PATCH 2/2] ASoC: SOF: Add platform ops callback for DAI link hardware readiness
Date: Fri, 13 Feb 2026 23:40:54 -0700
Message-ID: <20260214064054.19961-3-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260214064054.19961-1-cole@unwrap.rs>
References: <20260214064054.19961-1-cole@unwrap.rs>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After suspend/resume (D3->D0), the SOF firmware is reloaded fresh and
pipelines are recreated lazily when userspace opens a PCM. However,
SoundWire slave re-enumeration runs asynchronously via a 100ms delayed
work item (SDW_INTEL_DELAYED_ENUMERATION_MS). If userspace attempts to
play audio before SoundWire slaves finish re-enumerating, the firmware
returns error 9 (resource not found) when creating ALH copier modules,
leaving the DSP in an unrecoverable wedged state requiring reboot.

Add a new optional dai_link_hw_ready callback to struct snd_sof_dsp_ops
that allows platform-specific code to wait for DAI link hardware to
become ready before pipeline setup. The generic ipc4-topology.c calls
this callback (when set) in sof_ipc4_prepare_copier_module() before
configuring DAI copiers, maintaining SOF's platform abstraction.

The Intel HDA implementation (hda_sdw_dai_hw_ready) waits for all
attached SoundWire slaves to complete initialization using
wait_for_completion_interruptible_timeout() with a 2-second timeout.
This is safe for multiple waiters since the SoundWire subsystem uses
complete_all() for initialization_complete. Unattached slaves (declared
in ACPI but not physically present) are skipped to avoid false timeouts.

The function returns -ETIMEDOUT on timeout (instead of warn-and-continue)
to prevent the DSP from entering a wedged state. On non-resume paths the
completions are already done, so the wait returns immediately.

Link: https://github.com/thesofproject/sof/issues/8662
Link: https://github.com/thesofproject/sof/issues/9308
Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
 sound/soc/sof/intel/hda-common-ops.c |  1 +
 sound/soc/sof/intel/hda.c            | 44 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h            |  6 ++++
 sound/soc/sof/ipc4-topology.c        |  8 +++++
 sound/soc/sof/sof-priv.h             |  3 ++
 5 files changed, 62 insertions(+)

diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
index 746b426b1329..315cb61426da 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -84,6 +84,7 @@ const struct snd_sof_dsp_ops sof_hda_common_ops = {
 	.unregister_ipc_clients = hda_unregister_clients,
 
 	/* DAI drivers */
+	.dai_link_hw_ready = hda_sdw_dai_hw_ready,
 	.drv		= skl_dai,
 	.num_drv	= SOF_SKL_NUM_DAIS,
 	.is_chain_dma_supported	= hda_is_chain_dma_supported,
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 686ecc040867..956106dc0e02 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -378,6 +378,50 @@ static void hda_dsp_sdw_process_mic_privacy(struct snd_sof_dev *sdev)
 		chip->process_mic_privacy(sdev, true, AZX_REG_ML_LEPTR_ID_SDW);
 }
 
+int hda_sdw_dai_hw_ready(struct snd_sof_dev *sdev, int dai_type)
+{
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+	struct sdw_peripherals *sdw_p;
+	long ret;
+	int idx;
+
+	if (dai_type != SOF_DAI_INTEL_ALH)
+		return 0;
+
+	if (!hdev || !hdev->sdw || !hdev->sdw->peripherals)
+		return 0;
+
+	sdw_p = hdev->sdw->peripherals;
+
+	for (idx = 0; idx < sdw_p->num_peripherals; idx++) {
+		struct sdw_slave *slave = sdw_p->array[idx];
+
+		if (!slave)
+			continue;
+
+		if (slave->status != SDW_SLAVE_ATTACHED)
+			continue;
+
+		ret = wait_for_completion_interruptible_timeout(
+				&slave->initialization_complete,
+				msecs_to_jiffies(2000));
+		if (ret == 0) {
+			dev_err(sdev->dev,
+				"timeout waiting for SoundWire slave %s initialization\n",
+				dev_name(&slave->dev));
+			return -ETIMEDOUT;
+		}
+		if (ret < 0) {
+			dev_dbg(sdev->dev,
+				"interrupted waiting for SoundWire slave %s initialization: %ld\n",
+				dev_name(&slave->dev), ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 #else /* IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE) */
 static inline int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index ac9f76a5ef97..9bd8fe82ae9e 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -830,6 +830,7 @@ bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev);
 void hda_sdw_process_wakeen_common(struct snd_sof_dev *sdev);
 void hda_sdw_process_wakeen(struct snd_sof_dev *sdev);
 bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev);
+int hda_sdw_dai_hw_ready(struct snd_sof_dev *sdev, int dai_type);
 
 #else
 
@@ -879,6 +880,11 @@ static inline bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev)
 	return false;
 }
 
+static inline int hda_sdw_dai_hw_ready(struct snd_sof_dev *sdev, int dai_type)
+{
+	return 0;
+}
+
 #endif
 
 int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index d621e7914a73..a8b107d7e786 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2256,6 +2256,14 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	case snd_soc_dapm_dai_in:
 	case snd_soc_dapm_dai_out:
 	{
+		/* Wait for DAI link hardware (e.g. SoundWire slaves) to be ready */
+		if (sdev->pdata->desc->ops->dai_link_hw_ready) {
+			ret = sdev->pdata->desc->ops->dai_link_hw_ready(
+					sdev, ipc4_copier->dai_type);
+			if (ret)
+				return ret;
+		}
+
 		/*
 		 * Only SOF_DAI_INTEL_ALH needs copier_data to set blob.
 		 * That's why only ALH dai's blob is set after sof_ipc4_init_input_audio_fmt
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 0f624d8cde20..346b5c34c6c8 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -346,6 +346,9 @@ struct snd_sof_dsp_ops {
 	int (*register_ipc_clients)(struct snd_sof_dev *sdev); /* optional */
 	void (*unregister_ipc_clients)(struct snd_sof_dev *sdev); /* optional */
 
+	/* optional: wait for DAI link hardware readiness (e.g. SoundWire slave init) */
+	int (*dai_link_hw_ready)(struct snd_sof_dev *sdev, int dai_type); /* optional */
+
 	/* DAI ops */
 	struct snd_soc_dai_driver *drv;
 	int num_drv;
-- 
2.52.0


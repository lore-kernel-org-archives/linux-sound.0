Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B222343BE;
	Wed, 22 Jul 2026 04:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784693751; cv=none; b=YQfRnK9BOJtrSzKp1xOvkvvJYJrOZzQqM/m5JZf4cXLwBeSzrIAu41C9yDF9KC9vMmaItqIgN3FwHc39syXMwNb/2PxA6zq/LhZmVu8cOb32hHPFSmCUzYhpOq4tEgjfznGSngsoGLFUQWbt5MalF2e+StcbjlyVqzRfrdTG+0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784693751; c=relaxed/simple;
	bh=WGeKs5WpQbeXn0N42VrU0ZYiib72V0Ggj+QJvKEmu10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kdKBeKn5t3A3QIBq991eBnevK8FYomPyCJcVafMEWl7z5m7+JH99Uh2KY6+hUI2O3xUX7wdhdTTb41BU+ftnGkw2z5lh80KhENNdR5UvjS9A/j9JHwt/DckTl+uIcAayZ3caw8Pqbt927IsmMW0xESkq++haABR9DPEZtlFy8d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABXiELkQ2BqPSq7AA--.34673S2;
	Wed, 22 Jul 2026 12:15:32 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] ASoC: SOF: validate topology volume range before allocation
Date: Wed, 22 Jul 2026 12:15:32 +0800
Message-ID: <20260722041532.14085-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXiELkQ2BqPSq7AA--.34673S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF18uFy3ZFy8tryDGFW5trb_yoW5Gw17pF
	s5WrZIgrWFqr45JFnxtwnY9rn3u3y7CFZrJ39Fq3s3ZF13Ar1xuw4Ut34ayFWUCr98tr4a
	kF4Yy3y7Xa1qyFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCV
	W8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUOuc_DUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Topology supplies mixer min and max as unsigned 32-bit values. SOF stores
them in signed fields and passes max + 1 through an int size argument to
the IPC-specific volume-table allocator. An inverted range is invalid,
and a maximal value can wrap or become negative before allocation.

Validate min <= max and require max + 1 to remain representable as an
int before storing the range or allocating the table.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/sof/topology.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 63d582c65891..f4700a500726 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -836,6 +836,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	struct snd_soc_tplg_mixer_control *mc =
 		container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
 	int tlv[SOF_TLV_ITEMS];
+	u32 min, max;
 	unsigned int mask;
 	int ret;
 
@@ -843,6 +844,11 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	if (le32_to_cpu(mc->num_channels) > SND_SOC_TPLG_MAX_CHAN)
 		return -EINVAL;
 
+	min = le32_to_cpu(mc->min);
+	max = le32_to_cpu(mc->max);
+	if (min > max || max >= INT_MAX)
+		return -EINVAL;
+
 	/*
 	 * If control has more than 2 channels we need to override the info. This is because even if
 	 * ASoC layer has defined topology's max channel count to SND_SOC_TPLG_MAX_CHAN = 8, the
@@ -853,12 +859,12 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 		kc->info = snd_sof_volume_info;
 
 	scontrol->comp_id = sdev->next_comp_id;
-	scontrol->min_volume_step = le32_to_cpu(mc->min);
-	scontrol->max_volume_step = le32_to_cpu(mc->max);
+	scontrol->min_volume_step = min;
+	scontrol->max_volume_step = max;
 	scontrol->num_channels = le32_to_cpu(mc->num_channels);
 
-	scontrol->max = le32_to_cpu(mc->max);
-	if (le32_to_cpu(mc->max) == 1)
+	scontrol->max = max;
+	if (max == 1)
 		goto skip;
 
 	/* extract tlv data */
@@ -868,7 +874,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	}
 
 	/* set up volume table */
-	ret = set_up_volume_table(scontrol, tlv, le32_to_cpu(mc->max) + 1);
+	ret = set_up_volume_table(scontrol, tlv, max + 1);
 	if (ret < 0) {
 		dev_err(scomp->dev, "error: setting up volume table\n");
 		return ret;
@@ -901,7 +907,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	return 0;
 
 err:
-	if (le32_to_cpu(mc->max) > 1)
+	if (max > 1)
 		kfree(scontrol->volume_table);
 
 	return ret;
-- 
2.43.0


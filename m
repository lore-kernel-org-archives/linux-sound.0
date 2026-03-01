Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC071244665;
	Sun,  1 Mar 2026 01:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327894; cv=none; b=JLU6dJfkglNfw1qZNsHcoeCKcLh6lG2U8R9JGNehkTrarTNj4E++1BOvENK4T7axJCUlOhn/bo18nYZz+TCdTGitui0OP7WQqrk07VMsMgbJhN5F7dYmONZ9BGem4YiSDwl8zkBXKQovA5ZZvicl8ZehdF/bx8E7eFQDpRQoscc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327894; c=relaxed/simple;
	bh=tWPGPaO57Tx9j/KetH06c+ZplFCQCO7RL0Lz29u/iEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R3yvg0wLWtZLsksw+PK5tPXw6/TYu5Lq4nrH/WaN5LcuMItp3h50ZZFyUKHrIAui+yAUYJPHbxbMIjkkX4f73VwgO9TQbS3NL1dN7ghgGntqoxIT/WuI6XJ7AGue/EoNSb81opKy4xtHtnC+MGhXzXMcMoHY88yZbmm6IhPPqG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKlRM8m8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKlRM8m8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEBAC19421;
	Sun,  1 Mar 2026 01:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327894;
	bh=tWPGPaO57Tx9j/KetH06c+ZplFCQCO7RL0Lz29u/iEM=;
	h=From:To:Cc:Subject:Date:From;
	b=pKlRM8m8N/F+UvNsBHXCvettCWwdYLRx1SCyXxhKzKW7Nji+pcDAnUhPyrxVzn5fF
	 vYU2PU5jBoAQ1OVvs+/UrjDAVhzG1UgnwzOj6LFKtYafoM05YBkl+XyI2OuAymmmw2
	 57iunmekxCviPpUC9u69Gt+avyofMjlZJ4MPlozicTvklD7yS/pD3aBrTRdJXjCFc7
	 FWb4xgexoEc1RSP6dpCTB4y/zGgQ2+hpCMo4SDsiq2TlxqxhV+9Xbsnyq/5auoyvHJ
	 2lyuU9TKE4Op9fqWC+CgQXWfmrV4NxlczEuhcNoAvfb/JJwyNnbJhpJW6k97a5ax86
	 oxSw3UnaNHMAg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	peter.ujfalusi@linux.intel.com
Cc: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: FAILED: Patch "ASoC: SOF: ipc4-control: Keep the payload size up to date" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:18:12 -0500
Message-ID: <20260301011812.1672408-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From ebcfdbe4add923dfb690e6fb9d158da87ae0b6bf Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Date: Wed, 17 Dec 2025 16:39:41 +0200
Subject: [PATCH] ASoC: SOF: ipc4-control: Keep the payload size up to date

When the bytes data is read from the firmware, the size of the payload
can be different than what it was previously.
For example when the topology did not contained payload data at all for the
control, the data size was 0.
For get operation allow maximum size of payload to be read and then update
the sizes according to the completed message.

Similarly, keep the size in sync when updating the data in firmware.

With the change we will be able to read data from firmware for bytes
controls which did not had initial payload defined in topology.

Fixes: a062c8899fed ("ASoC: SOF: ipc4-control: Add support for bytes control get and put")
Cc: stable@vger.kernel.org
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://patch.msgid.link/20251217143945.2667-5-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/ipc4-control.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 80111672c1796..453ed1643b89c 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -426,13 +426,21 @@ static int sof_ipc4_set_get_bytes_data(struct snd_sof_dev *sdev,
 	msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
 
 	msg->data_ptr = data->data;
-	msg->data_size = data->size;
+	if (set)
+		msg->data_size = data->size;
+	else
+		msg->data_size = scontrol->max_size - sizeof(*data);
 
 	ret = sof_ipc4_set_get_kcontrol_data(scontrol, set, lock);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "Failed to %s for %s\n",
 			set ? "set bytes update" : "get bytes",
 			scontrol->name);
+	} else if (!set) {
+		/* Update the sizes according to the received payload data */
+		data->size = msg->data_size;
+		scontrol->size = sizeof(*cdata) + sizeof(*data) + data->size;
+	}
 
 	msg->data_ptr = NULL;
 	msg->data_size = 0;
@@ -448,6 +456,7 @@ static int sof_ipc4_bytes_put(struct snd_sof_control *scontrol,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_abi_hdr *data = cdata->data;
 	size_t size;
+	int ret;
 
 	if (scontrol->max_size > sizeof(ucontrol->value.bytes.data)) {
 		dev_err_ratelimited(scomp->dev,
@@ -469,9 +478,12 @@ static int sof_ipc4_bytes_put(struct snd_sof_control *scontrol,
 	/* copy from kcontrol */
 	memcpy(data, ucontrol->value.bytes.data, size);
 
-	sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
+	ret = sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
+	if (!ret)
+		/* Update the cdata size */
+		scontrol->size = sizeof(*cdata) + size;
 
-	return 0;
+	return ret;
 }
 
 static int sof_ipc4_bytes_get(struct snd_sof_control *scontrol,
@@ -581,6 +593,9 @@ static int sof_ipc4_bytes_ext_put(struct snd_sof_control *scontrol,
 		return -EFAULT;
 	}
 
+	/* Update the cdata size */
+	scontrol->size = sizeof(*cdata) + header.length;
+
 	return sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
 }
 
-- 
2.51.0





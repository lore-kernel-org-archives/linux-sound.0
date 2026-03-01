Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB04C8F0;
	Sun,  1 Mar 2026 01:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327889; cv=none; b=sNzGz/+WM4l0Q4p9K2eib9jp703DkG9XBzP3tCFPa78j0mE5lR89K3YsYDtoPVozsTDB5mxlzm+U5V5r4N84Ubj/t9BJYc3dV/L3qacmRdn8VAClwthIDeJF63/JPBzzyF0MnOdr96x7XM7Hp8AwknNBqqZGc/qNMAQQnnwDVC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327889; c=relaxed/simple;
	bh=SjpllwTUJKDbanF7vmvvp+qHE1c7xeNxVbk61oI0E0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hEe+IylPijSQE/8aGizr1epZto8kPZz2ZyFPWXoBkjgbEW1Q/VM6adZTz5+hXSWMDnVIHupO4/ADoVA6QNe7PRDWK9zBByqpOPv7R4MjQ38gJMPn6LsquIiwGwE9qh3gDx2ZuB/8A3DoWSgmth0y2AKaWhDLcu2/KhSuyBQbzjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EljQcD5z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EljQcD5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECB2C19421;
	Sun,  1 Mar 2026 01:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327889;
	bh=SjpllwTUJKDbanF7vmvvp+qHE1c7xeNxVbk61oI0E0c=;
	h=From:To:Cc:Subject:Date:From;
	b=EljQcD5zOWsyRI8tNDiQJ25jiFCU/S7ZoLSH7KpldlcjuWHIG0RQqFtYfk3bIUwez
	 zaQSpaQlrCKX7RB84zeDOYeHh0iC+tobE4uODoK9O8uPH//eNMgB7Yzg5G499orfRk
	 12ks/xeL9GNEUi39Is1T5DKbEcFywLnGdR9JV0EYWl8ul5BtJy5Vr9zZS0RlTqRmDo
	 K2TiyKM6gqtO//MoPYnmzTLQTunVLQf9MhjhZLbMCs1nDpj3Q79iQGZmOeuQ9QI0DA
	 1rzAsoM2O+8T5Jtu2gntBbe2iSxZXtrZ4IwBv69wIH6+m8ykgzjq5F+12RgsPoSUgW
	 +q2L2CCfkTz6A==
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
Subject: FAILED: Patch "ASoC: SOF: ipc4-control: If there is no data do not send bytes update" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:18:06 -0500
Message-ID: <20260301011807.1672224-1-sashal@kernel.org>
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

From 2fa74713744dc5e908fff851c20f5f89fd665fb7 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Date: Wed, 17 Dec 2025 16:39:38 +0200
Subject: [PATCH] ASoC: SOF: ipc4-control: If there is no data do not send
 bytes update

When the bytes control have no data (payload) then there is no need to send
an IPC message as there is nothing to send.

Fixes: a062c8899fed ("ASoC: SOF: ipc4-control: Add support for bytes control get and put")
Cc: stable@vger.kernel.org
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://patch.msgid.link/20251217143945.2667-2-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/ipc4-control.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 976a4794d6100..0a05f66ec7d92 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -412,8 +412,16 @@ static int sof_ipc4_set_get_bytes_data(struct snd_sof_dev *sdev,
 	int ret = 0;
 
 	/* Send the new data to the firmware only if it is powered up */
-	if (set && !pm_runtime_active(sdev->dev))
-		return 0;
+	if (set) {
+		if (!pm_runtime_active(sdev->dev))
+			return 0;
+
+		if (!data->size) {
+			dev_dbg(sdev->dev, "%s: No data to be sent.\n",
+				scontrol->name);
+			return 0;
+		}
+	}
 
 	msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
 
-- 
2.51.0





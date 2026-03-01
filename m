Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E923C2BE04F;
	Sun,  1 Mar 2026 01:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328603; cv=none; b=Mxf9s2v/W2h3CNaRvat8CRs+a5Ans2ff+yufx09F40ClXZ3lJx4vnhKtT/nkEaGfAbiwf0b7CskEcQDYIFcOm82+o7M7KlXn8X2Jwc8r/AnzmSS0JJOC4Ysp1H+wJdNEhC7Tg8r6FLCLpkNnce5HC+l9oCyqvPkrYM+mvdQQpig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328603; c=relaxed/simple;
	bh=lKiEFljJT/DkYcKJqz5vZvfW4Q3lGoLBaIdI62VM6uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LCqj6TeL3wKWVNa5ZQOwn9R14adwIe2r64Px9n+euNSF55rMs48fHI5Q4A16PLIZV/I0L6ONY/2wg4z8d5LbUcEa9GgmYqFYFCrKk9q8Lxu8gWhdsEoqj8Ws3hN3pPpoPtlFNKKQ4ZoQSVVQ9EaPQzTF6qPJEHwJWzvApJG+5Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1vTG3bV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1vTG3bV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A757C19421;
	Sun,  1 Mar 2026 01:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328602;
	bh=lKiEFljJT/DkYcKJqz5vZvfW4Q3lGoLBaIdI62VM6uQ=;
	h=From:To:Cc:Subject:Date:From;
	b=J1vTG3bVwRQE/PHuZF9vgwkLlmA8YAsMu+Xd2C0bxQH3bsVSttsh8xlYa/AORyXyp
	 Yo8ErFrCD17AVZvVXcnN1g6Ar+HmswLHpGJMUbKHORDxVNg5AZDP6d8E9nQNHiQroq
	 4dTtf/4YSvGrwNfxf/5cQqzRen+xt0jo9LfbI4UrTbX2DUpWu57xoGJggncLbYUjKa
	 tXz4w8N943IMtzUMrnO3eHiKbNa89cVCDvzTvtvf0x4Gx4HHbHPYofDswuJBdTqPUJ
	 DsKAWhu0aBmUIgZHwlWNzOSkmrSW7FSYAEhmCAHEzNnZOwvqH97zNRCeL4+Cjyaqkq
	 YJQ+J+cCEeUgg==
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
Subject: FAILED: Patch "ASoC: SOF: ipc4-control: Use the correct size for scontrol->ipc_control_data" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:29:59 -0500
Message-ID: <20260301013000.1687923-1-sashal@kernel.org>
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From c1876fc33c5976837e4c73719c7582617efc6919 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Date: Wed, 17 Dec 2025 16:39:40 +0200
Subject: [PATCH] ASoC: SOF: ipc4-control: Use the correct size for
 scontrol->ipc_control_data

The size of the data behind scontrol->ipc_control_data is stored in
scontrol->size, use this when copying data for backup/restore.

Fixes: db38d86d0c54 ("ASoC: sof: Improve sof_ipc4_bytes_ext_put function")
Cc: stable@vger.kernel.org
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://patch.msgid.link/20251217143945.2667-4-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/ipc4-control.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 0a05f66ec7d92..80111672c1796 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -66,7 +66,7 @@ static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontrol,
 		 * configuration
 		 */
 		memcpy(scontrol->ipc_control_data, scontrol->old_ipc_control_data,
-		       scontrol->max_size);
+		       scontrol->size);
 		kfree(scontrol->old_ipc_control_data);
 		scontrol->old_ipc_control_data = NULL;
 		/* Send the last known good configuration to firmware */
@@ -567,7 +567,7 @@ static int sof_ipc4_bytes_ext_put(struct snd_sof_control *scontrol,
 	if (!scontrol->old_ipc_control_data) {
 		/* Create a backup of the current, valid bytes control */
 		scontrol->old_ipc_control_data = kmemdup(scontrol->ipc_control_data,
-							 scontrol->max_size, GFP_KERNEL);
+							 scontrol->size, GFP_KERNEL);
 		if (!scontrol->old_ipc_control_data)
 			return -ENOMEM;
 	}
@@ -575,7 +575,7 @@ static int sof_ipc4_bytes_ext_put(struct snd_sof_control *scontrol,
 	/* Copy the whole binary data which includes the ABI header and the payload */
 	if (copy_from_user(data, tlvd->tlv, header.length)) {
 		memcpy(scontrol->ipc_control_data, scontrol->old_ipc_control_data,
-		       scontrol->max_size);
+		       scontrol->size);
 		kfree(scontrol->old_ipc_control_data);
 		scontrol->old_ipc_control_data = NULL;
 		return -EFAULT;
-- 
2.51.0





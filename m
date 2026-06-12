Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0B13EF67B
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270868; cv=none; b=jc4O5Ea5dDs5RPbukfwLFGIaJc8aRd6vQh1Uj1cqjTgZrCPCRLHkPRmJor8lsvlxGrxDdA4xZtrrlm2uTY4S2Sk1OhpBcaUaatlhBTUQ2hsquQcfMUF3RvnZWi05MdqjyjjCDuzqo7EYzia25k1gt/PC5p5FmFcc7oQg6zbvpIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270868; c=relaxed/simple;
	bh=uOa1yOQLFPb3K99MR8srx9ffJSwiq+AfyuufkKgrpzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzWlgMj161fbPFacNPvMmP7uYdrSQMI3yAw01DDV75VLqRcm2j/IxhnZTJaZwv2kS5PJAF6f+aKXFGiMA7cd5EB3717CgtENvdvbCm3HVB3SxXAQ4DFD/d7Yz2RjPjF3QDYqTormXJ+LyjHvsZSB6dNQqVKEkZ+6i1i9p+ufMgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxBMdt7P; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxBMdt7P"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304df7ff4c2so1249924eec.0
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270866; x=1781875666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EUVrIUd9a5W03H8en3F5BUxu9fsoDVhajTiBFAwOuM=;
        b=TxBMdt7PyduPOard+Jtc0G8RdZX368Mx+0j77yis47RABJXmJdKykdgEZIVJhbgYR0
         z8gwfQ1PtyAPnYLbbRqMvfd4RaFD6bntgddx7Wnj/tvmtzZkpWApvpLyWH+9/CLDxF0i
         0f4w0MoU/Napu0cVCk9CIT1o9CYcAhSgEjnatP0m6o4XWg4VciXAKzpw7kopZOIzypXQ
         SQz4WdKGga3dZL8fEShVpth1HkBqOHftz7ItKMoP7JP4OPD3yVSyTll2fSfqPiCJyeL8
         i0caPkUWUTtKSbIGJTGMe9fqlkvvGTZMEx3aJQYUaj5G33LWV8WZE1MYyoplv78GStPE
         0xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270866; x=1781875666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5EUVrIUd9a5W03H8en3F5BUxu9fsoDVhajTiBFAwOuM=;
        b=R45JipGdzDwl8SWqeP2mloA5MIolJ/GAXukvKpZv0LFpu+gc8WTaHzl+kWvh/rzxOh
         tGL71wt5XPN+b5kpKLJ74fCPnm0jzPpHi3G+wbOF5EmmdyrM3gkTgS2tKbJ0zJROJ2Um
         QJUIgpifofZh/46rZvjvIUzREQHFie/5JpWDlCVRVUop/DYYmymXawQW5DBhogyQQz7M
         juFq+wbtTik6PX8TkC5GFWIBZJ0AaA0mXpH6MX76xYMwo4GxIrNSHHisJ1WiYS7Kf1ZV
         B048eet3UDibUGL1M9GOpIcYXBSWM3ULkuqRGLOe7c9Fjwl8p1MC4fuYtzE2lpPeyGNX
         cGBA==
X-Forwarded-Encrypted: i=1; AFNElJ+TSajZ7dNF1bIsNf4ThhH3P12JWtT3ZyRvNgYTHIjxsB1S65XjS3PGvHh1mChRCn7SFz9wp80YRDRAaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0fB3Z3QRnDyjdSus7xeC5Pu2C+CvdtOmH8sBFNal6gQ5aKxQc
	DXlsD1KpsoMgLhpG6qMbWXIvBLSeOqxyQ+fHCd1ha0ofpeEje12fASYn
X-Gm-Gg: Acq92OEFcHXo8g1YteVegJeGDLI4amCqOdgzldYcOZ9C80aKhkcyTssqVphkfMZhFt2
	Lwxubhz2AWIIhTFZjSFUEB4LX/q5oIILdi5Qzq9Woy942pwH63PnHBcz6dDqrWp9Y+/32/c6ARZ
	IAK1p4MKghKfUiM9b7/85b5DkJtFGj09RBpekJrXFlWTotSfFTWc7occS1yBVs0q1SpBYYzDuSj
	ifRSabrGIOsFWW5neiFPPgayIkG0Y70OCuP4rgjwO0HynslodkYGOnQG2ZW+kQgM3KfDZwTQsv2
	O+bwQDuSt9u129ejxgltu6x5pjbdzw7inC+ZA1GXB4SQcOBhSDLd4mX0PAI/BnolP88NRSY+vSO
	k6xEqIRlIUjRys75vbmy5yhtE3nzAWFT/o36ixgWXiqfaUX6AdVX9zew+KDO4sMEXiU/v9XSVBF
	irucE25Kn0VggV5iSwDbLprY7XLrvk+6mpDuWmgWt0H35qQftfGO1DUcwvVA==
X-Received: by 2002:a05:7300:1827:b0:2e7:190:41d6 with SMTP id 5a478bee46e88-30820c07f8emr1497455eec.2.1781270866381;
        Fri, 12 Jun 2026 06:27:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/11] ASoC: fsl_rpmsg: Use guard() for mutex & spin locks
Date: Fri, 12 Jun 2026 20:26:37 +0700
Message-ID: <20260612132639.78086-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 69 +++++++++++++++--------------------
 1 file changed, 30 insertions(+), 39 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 031e5272215d..7210393dfa5d 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -39,10 +39,9 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg *msg,
 	struct rpmsg_device *rpdev = info->rpdev;
 	int ret = 0;
 
-	mutex_lock(&info->msg_lock);
+	guard(mutex)(&info->msg_lock);
 	if (!rpdev) {
 		dev_err(info->dev, "rpmsg channel not ready\n");
-		mutex_unlock(&info->msg_lock);
 		return -EINVAL;
 	}
 
@@ -55,15 +54,12 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg *msg,
 			 sizeof(struct rpmsg_s_msg));
 	if (ret) {
 		dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
-		mutex_unlock(&info->msg_lock);
 		return ret;
 	}
 
 	/* No receive msg for TYPE_C command */
-	if (msg->s_msg.header.type == MSG_TYPE_C) {
-		mutex_unlock(&info->msg_lock);
+	if (msg->s_msg.header.type == MSG_TYPE_C)
 		return 0;
-	}
 
 	/* wait response from rpmsg */
 	ret = wait_for_completion_timeout(&info->cmd_complete,
@@ -71,7 +67,6 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg *msg,
 	if (!ret) {
 		dev_err(&rpdev->dev, "rpmsg_send cmd %d timeout!\n",
 			msg->s_msg.header.cmd);
-		mutex_unlock(&info->msg_lock);
 		return -ETIMEDOUT;
 	}
 
@@ -100,8 +95,6 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg *msg,
 	dev_dbg(&rpdev->dev, "cmd:%d, resp %d\n", msg->s_msg.header.cmd,
 		info->r_msg.param.resp);
 
-	mutex_unlock(&info->msg_lock);
-
 	return 0;
 }
 
@@ -109,14 +102,13 @@ static int imx_rpmsg_insert_workqueue(struct snd_pcm_substream *substream,
 				      struct rpmsg_msg *msg,
 				      struct rpmsg_info *info)
 {
-	unsigned long flags;
 	int ret = 0;
 
 	/*
 	 * Queue the work to workqueue.
 	 * If the queue is full, drop the message.
 	 */
-	spin_lock_irqsave(&info->wq_lock, flags);
+	guard(spinlock_irqsave)(&info->wq_lock);
 	if (info->work_write_index != info->work_read_index) {
 		int index = info->work_write_index;
 
@@ -130,7 +122,6 @@ static int imx_rpmsg_insert_workqueue(struct snd_pcm_substream *substream,
 		info->msg_drop_count[substream->stream]++;
 		ret = -EPIPE;
 	}
-	spin_unlock_irqrestore(&info->wq_lock, flags);
 
 	return ret;
 }
@@ -523,7 +514,6 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 	snd_pcm_sframes_t avail;
 	struct timer_list *timer;
 	struct rpmsg_msg *msg;
-	unsigned long flags;
 	int buffer_tail = 0;
 	int written_num;
 
@@ -553,11 +543,11 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 		msg->s_msg.param.buffer_tail = buffer_tail;
 
 		/* The notification message is updated to latest */
-		spin_lock_irqsave(&info->lock[substream->stream], flags);
-		memcpy(&info->notify[substream->stream], msg,
-		       sizeof(struct rpmsg_s_msg));
-		info->notify_updated[substream->stream] = true;
-		spin_unlock_irqrestore(&info->lock[substream->stream], flags);
+		scoped_guard(spinlock_irqsave, &info->lock[substream->stream]) {
+			memcpy(&info->notify[substream->stream], msg,
+			       sizeof(struct rpmsg_s_msg));
+			info->notify_updated[substream->stream] = true;
+		}
 
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			avail = snd_pcm_playback_hw_avail(runtime);
@@ -640,7 +630,7 @@ static void imx_rpmsg_pcm_work(struct work_struct *work)
 	bool is_notification = false;
 	struct rpmsg_info *info;
 	struct rpmsg_msg msg;
-	unsigned long flags;
+	bool updated;
 
 	work_of_rpmsg = container_of(work, struct work_of_rpmsg, work);
 	info = work_of_rpmsg->info;
@@ -651,25 +641,26 @@ static void imx_rpmsg_pcm_work(struct work_struct *work)
 	 * enough data in M core side, need to let M core know
 	 * data is updated immediately.
 	 */
-	spin_lock_irqsave(&info->lock[TX], flags);
-	if (info->notify_updated[TX]) {
-		memcpy(&msg, &info->notify[TX], sizeof(struct rpmsg_s_msg));
-		info->notify_updated[TX] = false;
-		spin_unlock_irqrestore(&info->lock[TX], flags);
-		info->send_message(&msg, info);
-	} else {
-		spin_unlock_irqrestore(&info->lock[TX], flags);
+	scoped_guard(spinlock_irqsave, &info->lock[TX]) {
+		updated = info->notify_updated[TX];
+		if (updated) {
+			memcpy(&msg, &info->notify[TX], sizeof(struct rpmsg_s_msg));
+			info->notify_updated[TX] = false;
+		}
 	}
-
-	spin_lock_irqsave(&info->lock[RX], flags);
-	if (info->notify_updated[RX]) {
-		memcpy(&msg, &info->notify[RX], sizeof(struct rpmsg_s_msg));
-		info->notify_updated[RX] = false;
-		spin_unlock_irqrestore(&info->lock[RX], flags);
+	if (updated)
 		info->send_message(&msg, info);
-	} else {
-		spin_unlock_irqrestore(&info->lock[RX], flags);
+
+	scoped_guard(spinlock_irqsave, &info->lock[RX]) {
+		updated = info->notify_updated[RX];
+		if (updated) {
+			memcpy(&msg, &info->notify[RX], sizeof(struct rpmsg_s_msg));
+			info->notify_updated[RX] = false;
+		}
 	}
+	if (updated)
+		info->send_message(&msg, info);
+
 
 	/* Skip the notification message for it has been processed above */
 	if (work_of_rpmsg->msg.s_msg.header.type == MSG_TYPE_C &&
@@ -681,10 +672,10 @@ static void imx_rpmsg_pcm_work(struct work_struct *work)
 		info->send_message(&work_of_rpmsg->msg, info);
 
 	/* update read index */
-	spin_lock_irqsave(&info->wq_lock, flags);
-	info->work_read_index++;
-	info->work_read_index %= WORK_MAX_NUM;
-	spin_unlock_irqrestore(&info->wq_lock, flags);
+	scoped_guard(spinlock_irqsave, &info->wq_lock) {
+		info->work_read_index++;
+		info->work_read_index %= WORK_MAX_NUM;
+	}
 }
 
 static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
-- 
2.43.0


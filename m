Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394D220ED
	for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 00:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782605050; cv=none; b=lMRErDIO7Kt5/kvPlt6eib2vXW6XKeuL0ewvQZRjOxjdgJQ1uPFZmRAkKXnLd3s4mnuzZNbbbEP0Lmv24lsT1mthijrjQ+8gl4C3gAjSP3D4W9X0yT5kpAELV8JT5guuzHHQNwkpKb78fJjMmteAWNbfYsZ+OD2NH0XnIs/44Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782605050; c=relaxed/simple;
	bh=TzfXn/B0HtrNsBjRfG4J1uqVZGqphS0f8VS+I4Ipkzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IHARciToYSvQgdZHSvX+M/+0/lcfofkGw/BYQWs7B4+1Qrf6ac5/e6xjmzwwSVYNzimeuHFgMrbk06i+wZT0odTvCtd/vtgQRoeU/JR971XcFt84OCL9f3flUb+n8I4ybxkREIIHt0/KvKifJL389dhlyps19bM4oBsKFm22rB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkjGkrtU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkjGkrtU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4926fe5be4bso13621475e9.0
        for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 17:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782605048; x=1783209848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXI5pGOO47AsbEuvVygk0eroLkgwBwcS+0MxC4aRFsc=;
        b=FkjGkrtUESBpaeZuCisgVTdwLbUo8wfcS8if8DwPXupG04E0e2FYah33EwNeLtJ0HJ
         MjUB4YnbUssd8NgDXUc/V45k6o0qHpYPDFsrZt4BECjHbAVX2vCADvEh0SjuM0UCCtH3
         +chO31jQX9bwAIYCH/y7r9fAvNGEN2zdtX0Ij642r5LrtyMB97X11h7FJDwMvWFRyzzE
         shlMnwmDQYXXwEjWLTeAYx1FXo8KvqwfL6VakJNOVbZQR1ohBIrqQuIy8LXd7rc6eUoM
         G/GF1rW4WCFTgVsLIUJQSPtnMnTBOfwJ1IdKzl3kUYEEN8Wc1lf4orr+jzOOO04/uoUa
         Drag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782605048; x=1783209848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXI5pGOO47AsbEuvVygk0eroLkgwBwcS+0MxC4aRFsc=;
        b=MZuOub4397iKzZAnUhRBQUes6VdXUpd0Rvusytw44pGbH8Q2SugNQ3YqdHojMj/fmD
         KEdsNxZARAce9kkqnAA90s0zpWXG4xWQ9H7AQqlHJ2uGZvy2RZwLJ1/jyc4WCbpNxlbx
         uzkxUGB81lnogkPzkdPZe1CXa5hh7Xkc5ABFVazXRL6+pvVwVnMJpZ0h3uyFpkv/d9g8
         Nxd5Cony4fr9y546GgozGOo4qUTg3IijtPeyYrzDIZJCrcZKwbwdxKxGMu/bEZaormGN
         20XkhosQdtiyHSjRG9a907imo83QvTukiRTiyXsdGCioT+18cs5Xr/vCjOLv6vrTNKtA
         tjow==
X-Forwarded-Encrypted: i=1; AHgh+RrrqpL5Kd52LWt83RkAECqMFEe2EjkO+qn9uU3r6OP/hZMES4z06Ss+lWGGpwXRHfd6bkIDinb4t1AqLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmnCZGQKW5i+PUhWU1tIgICXME/pE8b8qNm6/AI7Xua3SfZpu
	q14cGuf54nJLOeX0ShMCPuo6Q7Trs4wryP66hwtFFmGDZ1Yv65NfXRul
X-Gm-Gg: AfdE7cmwS6cfJE/LrAWg4lKZXglyS6oMfXksQiH88e2OdXMk/F6b7e7PIj7cvv+lUkR
	6rzfGbJCbyRNMeJeCvkXhVkCVM+BhKg0gVEJuexbw1EkgTXnf9BHxArt/m+hAybo+EdjzrXJf6W
	PMkYw5ioHxCg/9V1kF2WzomWOo99aZxE2i2x0BMy8ajtk0LFPb9semC3HGWIfMLAtCL+o3s+PQm
	iU2t3svLn7Ebnh9jxGdlVFxGHzfZAKksQYY2wXoLdD6kTvvVW8NFjBcz343WXw6kNk9RAEU9rcw
	JEUI3sAPKx26khHPhg6RlO3tHmrTKcjxK33p78mXxnGqYyF31Zkto2I5V/8r7a5pq6pwbg9JkYs
	IbJPrTxZ9KgBYWti/sfvHd34Ps4yHfAukVZCwrBupWhr6Q19E0EQKEqAMRekZpYcQ4JX2sCSZex
	GpNDaVp3aHFtmE3FXcUVv2JMDnmmeLRqK16Z8Q
X-Received: by 2002:adf:f7c9:0:b0:46d:2859:4f41 with SMTP id ffacd0b85a97d-46fb6bf2fd5mr8130176f8f.2.1782605047547;
        Sat, 27 Jun 2026 17:04:07 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm8383941f8f.23.2026.06.27.17.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 17:04:07 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] ASoC: SOF: validate probe info element counts
Date: Sun, 28 Jun 2026 02:03:29 +0200
Message-ID: <20260628000329.18606-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe information replies contain a firmware-provided element count. IPC3
uses that count to copy an array, then returns the unchecked count to its
caller. A short reply can therefore make the caller walk beyond the copied
array.

IPC4 similarly uses the count both to allocate the destination array and
to walk the reply. On 32-bit systems the allocation size can wrap, while on
all systems an excessive count reads beyond the reply payload.

Validate each count against the actual reply size before copying or
allocating the array, and use kcalloc() for the IPC4 allocation.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 sound/soc/sof/sof-client-probes-ipc3.c | 23 +++++++++++++++++++----
 sound/soc/sof/sof-client-probes-ipc4.c | 11 ++++++++++-
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes-ipc3.c b/sound/soc/sof/sof-client-probes-ipc3.c
index a78ec0954a61..a3e382d6161f 100644
--- a/sound/soc/sof/sof-client-probes-ipc3.c
+++ b/sound/soc/sof/sof-client-probes-ipc3.c
@@ -107,7 +107,7 @@ static int ipc3_probes_info(struct sof_client_dev *cdev, unsigned int cmd,
 	struct device *dev = &cdev->auxdev.dev;
 	struct sof_ipc_probe_info_params msg = {{{0}}};
 	struct sof_ipc_probe_info_params *reply;
-	size_t bytes;
+	size_t bytes, elem_size, payload_size;
 	int ret;
 
 	*params = NULL;
@@ -128,14 +128,29 @@ static int ipc3_probes_info(struct sof_client_dev *cdev, unsigned int cmd,
 	if (ret < 0 || reply->rhdr.error < 0)
 		goto exit;
 
+	payload_size = reply->rhdr.hdr.size;
+	if (payload_size < offsetof(struct sof_ipc_probe_info_params, dma)) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
 	if (!reply->num_elems)
 		goto exit;
 
 	if (cmd == SOF_IPC_PROBE_DMA_INFO)
-		bytes = sizeof(reply->dma[0]);
+		elem_size = sizeof(reply->dma[0]);
 	else
-		bytes = sizeof(reply->desc[0]);
-	bytes *= reply->num_elems;
+		elem_size = sizeof(reply->desc[0]);
+
+	payload_size -= offsetof(struct sof_ipc_probe_info_params, dma);
+	if (reply->num_elems > payload_size / elem_size) {
+		dev_err(dev, "%s: invalid probe info element count %u\n",
+			__func__, reply->num_elems);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	bytes = reply->num_elems * elem_size;
 	*params = kmemdup(&reply->dma[0], bytes, GFP_KERNEL);
 	if (!*params) {
 		ret = -ENOMEM;
diff --git a/sound/soc/sof/sof-client-probes-ipc4.c b/sound/soc/sof/sof-client-probes-ipc4.c
index 88397c7dc4c3..2eef32b55395 100644
--- a/sound/soc/sof/sof-client-probes-ipc4.c
+++ b/sound/soc/sof/sof-client-probes-ipc4.c
@@ -248,10 +248,19 @@ static int ipc4_probes_points_info(struct sof_client_dev *cdev,
 		return ret;
 	}
 	info = msg.data_ptr;
+	if (msg.data_size < sizeof(*info) ||
+	    info->num_elems > (msg.data_size - sizeof(*info)) /
+			      sizeof(info->points[0])) {
+		dev_err(dev, "%s: invalid probe info element count %u\n",
+			__func__, info->num_elems);
+		kfree(msg.data_ptr);
+		return -EINVAL;
+	}
+
 	*num_desc = info->num_elems;
 	dev_dbg(dev, "%s: got %zu probe points", __func__, *num_desc);
 
-	*desc = kzalloc(*num_desc * sizeof(**desc), GFP_KERNEL);
+	*desc = kcalloc(*num_desc, sizeof(**desc), GFP_KERNEL);
 	if (!*desc) {
 		kfree(msg.data_ptr);
 		return -ENOMEM;
-- 
2.54.0


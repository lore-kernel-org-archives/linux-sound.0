Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FBF3A383A
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362993; cv=none; b=iesz1yLPGIMFWXat7tOtDQBc1bVjFdOSRxzcftucMFSwUwTeb8o2t77cMGoN/7oW7E1qJ/eITG4YX0++D2adITYXbJ8OsPG/rbg6gdM4RcWvjIoxzYi7wiKO9kTUo76D89Jd4A+wmjKdM98Ht8VjcFnI9WjJZkAE0W9cOFuJtEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362993; c=relaxed/simple;
	bh=79qr4PZGozmz1OapJLTrxjaGFUHbFkbRBjumRWtwwNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewvWHrSiFnuBX8RTj6AG/llUhjRe4D8bEWhQQtN45j+rIAE7p4fZoV/LyPyRG3rP5/G8CuMUCQaW09Y+V6HSS+okGoCmdhkY4e+bJSDAgB5iW3hv3NfxNbmnuCKRIcyDp7cJu7Oq5W3jaOiMhE7wsJmlqpmJEZqBY3nZgWiRu4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDQSMSJ0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDQSMSJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791362993; x=1822898993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=79qr4PZGozmz1OapJLTrxjaGFUHbFkbRBjumRWtwwNk=;
  b=JDQSMSJ0IP/BermvOJKe5NhuO4EofvoVUpx4wQgtDlMHAwvZwO0mS2bo
   JNjkm+73mWhhbbc79aHRK1MymWG8yysGOHqx/zKryUWtakR8d7dkO9Kp+
   HYpsgcMMg4gTXCBIvDKMTFuQ3zgvSiPBNYl6nyfmZCTPxaOPmNM5ql/nz
   25hrQcznCLi15tIyzdIKP/6863pEk29nknToaKR0cce8WFRBVBexCalNL
   aFFZ3KzI9t3/shjSLHwcZimu2otVPqqLGElnHOcRsmUAqc/YGoS/MTNub
   hzxZ7xITVEcWumYo97eKrCjQHlIQEpfsDEU4oHS756lYkH/o0Yo1aHva+
   g==;
X-CSE-ConnectionGUID: pBALhDPCTl2hzHoAqbf/Sg==
X-CSE-MsgGUID: FQz3uqjFQsi9ET+lmGcOQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="113852"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="113852"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:49:52 -0700
X-CSE-ConnectionGUID: ArEnpcaMQ4aMqoYA/V0Y8g==
X-CSE-MsgGUID: RmXFIU7VS12EcZ1+0figjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670513"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:49:46 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v5 04/28] ALSA: compress: Set the draining state before the drain trigger
Date: Wed,  7 Oct 2026 11:49:31 +0300
Message-ID: <20261007084955.1256-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The state of the stream is set to SNDRV_PCM_STATE_DRAINING only after the
drain trigger has been sent to the driver.

Drivers can not block in the trigger callback and the drain is completed
asynchronously: snd_compr_drain_notify() can be called either from the
trigger callback itself or from a different context as soon as the
trigger returns. If that happens before the core updates the state then
the notification is lost: the state is overwritten with DRAINING right
after it and the wait for the drain to complete will not be woken up.

Set the state before the trigger is issued and restore it if the trigger
fails. The partial_drain flag is cleared on the error path as well as it
would otherwise be left set for the next drain.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/core/compress_offload.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 89435e4394ef..5c0db178d635 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -947,8 +947,10 @@ static int snd_compress_wait_for_drain(struct snd_compr_stream *stream)
 	 * It is expected that driver will notify the drain completion and then
 	 * stream will be moved to SETUP state, even if draining resulted in an
 	 * error. We can trigger next track after this.
+	 *
+	 * The state has been set to SNDRV_PCM_STATE_DRAINING by the caller,
+	 * before the drain trigger was issued.
 	 */
-	stream->runtime->state = SNDRV_PCM_STATE_DRAINING;
 	mutex_unlock(&stream->device->lock);
 
 	/* we wait for drain to complete here, drain can return when
@@ -973,6 +975,7 @@ static int snd_compress_wait_for_drain(struct snd_compr_stream *stream)
 
 static int snd_compr_drain(struct snd_compr_stream *stream)
 {
+	snd_pcm_state_t state;
 	int retval;
 
 	switch (stream->runtime->state) {
@@ -987,9 +990,20 @@ static int snd_compr_drain(struct snd_compr_stream *stream)
 		break;
 	}
 
+	/*
+	 * The state must be set to draining before the trigger is issued as the
+	 * drain can be completed by the driver either from the trigger callback
+	 * itself or from a different context as soon as the trigger is called.
+	 * A snd_compr_drain_notify() arriving before the state is updated would
+	 * be lost and the wait for the drain to finish would never be woken up.
+	 */
+	state = stream->runtime->state;
+	stream->runtime->state = SNDRV_PCM_STATE_DRAINING;
+
 	retval = stream->ops->trigger(stream, SND_COMPR_TRIGGER_DRAIN);
 	if (retval) {
 		pr_debug("SND_COMPR_TRIGGER_DRAIN failed %d\n", retval);
+		stream->runtime->state = state;
 		wake_up(&stream->runtime->sleep);
 		return retval;
 	}
@@ -1025,6 +1039,7 @@ static int snd_compr_next_track(struct snd_compr_stream *stream)
 
 static int snd_compr_partial_drain(struct snd_compr_stream *stream)
 {
+	snd_pcm_state_t state;
 	int retval;
 
 	switch (stream->runtime->state) {
@@ -1048,9 +1063,16 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
 		return -EPERM;
 
 	stream->partial_drain = true;
+
+	/* See the comment in snd_compr_drain() on the state handling */
+	state = stream->runtime->state;
+	stream->runtime->state = SNDRV_PCM_STATE_DRAINING;
+
 	retval = stream->ops->trigger(stream, SND_COMPR_TRIGGER_PARTIAL_DRAIN);
 	if (retval) {
 		pr_debug("Partial drain returned failure\n");
+		stream->partial_drain = false;
+		stream->runtime->state = state;
 		wake_up(&stream->runtime->sleep);
 		return retval;
 	}
-- 
2.56.0


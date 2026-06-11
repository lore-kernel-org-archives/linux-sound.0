Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1DF3F20FC
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179237; cv=none; b=EihUZkKJ1dZTQvS2ZeYh+k2gdNUoskBWEk4yVj6wmfMIYdeIQQ4l5QoeDDw5lBipSEhbtdObnbyBObCN+nlOasNck7lP+UqPTC4hrMYcuO915UKjOq2W+7i02+jmEV6b0zPLDCJbs2FGCZBOdJxkSqM2cxB17ESgmSJMYLWbAM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179237; c=relaxed/simple;
	bh=HQUipu8YwyUjoPV4UZqMrjK6Hm3ZZlcsJZxoV321Efw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9MYTvJ3ARWFW0oI8gpagwniUUTo7owh/S3ZjHam1nRhcgxSDFtKxUrr+Qz8OxjkVIdZMZ/6XwgEjKllNj5Z8HfgjWrX6UQSrlQ/43Jmb2OeI4zdur87HZc4i5rbSPPBZqaQBzeXmVh/oLaRe0NA5DkRIG0ulzE+ZR7LNb9Rlyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5aPlG9r; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5aPlG9r"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36d5b11201aso5075509a91.2
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 05:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179235; x=1781784035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZV/PFA3SA2yKdBcESIRB5seROA0TnE5wscoRU0eQuk=;
        b=J5aPlG9rG8KYQu57pDv9N+b9nUQ0hMG7/FhscyYayo6ETMZMn4AR14Y0RfhMcZ9bkx
         X6pZgeGYINzcwydbgvCy+NEk/1LW/QmPk5G2kjAl9EN1JQ6KKkTqjEvbb5+nMhV+ZWRM
         6BiPa7pxbX7PMofOg81LcWDHbQ9phNtDpImgqtwSPImWZWevLKHFOsoneQ0+H1R0aLwl
         21QeZK9QwHP4T0WR1Z3nzNJLdtDBjthVvru+SQJ8LC56C0AQ4htSPKVEOC10nIEL/P5i
         QlzzaZylXO4AR0JGZfnSvtamgx9nm4WHykt1AWmfc9B9FnGDAhmSUxSX3Gy8PCKNKMTD
         M+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179235; x=1781784035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZV/PFA3SA2yKdBcESIRB5seROA0TnE5wscoRU0eQuk=;
        b=tQF4DPwV+iAMDGiDnUnhJzxy7MmfMlbD9GDOUIG24jXiEmOGTPzSZgiWfIhWKmcvwF
         ZktOyTj7FdHPYx5pf0JlBKDrEjHPhohKy5auLoVnFPq4+nknrrFbTUBo67j1yoPXKeJa
         oIV8IEd2ETKYbz9i+mECu0KfKQm2RmcEpxUZM93fzvd9Tumhvonr69jTjrISVBjuNS/S
         AcWZvBt3waolallHniGfg3GhqO3qeHSsKTfpIsA2Snyaahas9USAjf4ojsiBuLSMOwHg
         53G9eYHVl06v87kCrLvOBawKtLlQWFNKZAPuOznM1SiXTZ2IUSuyPWXH7qcWoJ6G8g7P
         TnZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BQP4bi6STv+UZ4YgMwImTvOUKYAumQZB9E0/RXz/u+5z2+XXBiR5QwT6MmAWmFS05FWzOl+J0lGo56Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy69zeZmPxtEHX49113dhAb7IJ3O2/iw+/HE0aoMmcmyHfZmFk
	EKjqHgikmuKCdDzdV0fJdmiX6M/hRcEQhyhKOTuVaX0IB3U180nuVvpA
X-Gm-Gg: Acq92OGRyrXN4khzbNSpbsioClXhrEkxQMs8sYunbZyxy3O7XG7w68XQB7l+/2Fl4tR
	uxLXSM3i4aUhcBvikZT4HedEYiZU0/QP2Nkw1EgU+pysrgsvSuK0LIurMm7j/ptJHMB4wAC5AD8
	nZD2NFZmhGi/h3r1k/0qPsv2oO/PFGq2HaNZOf/UFbHjFP3gEmjFDRc6Ic/t8U5HdPZOkM8lQuV
	7qU9jrUZFT8u/6N4llb8NLMkL00anLKiQJgzh2EQvo53FSHaCJPZ86rX/V6kd4gkTjCeQvXKZK7
	n6hT/mJWf5eMc4BHOUCCOJzl9WcFkSUhgwTHQQX0kPI9ZmtLGBJdOpooVAkbL3RdjjiWQD8eqF3
	qDEkgPt3R9iFwhiAypgwHArrMtf3G9+VIIB+EAzPX2jsjz+TK/OjeRH9FD6zr8zXifWXNC3/DLu
	zvC5qx7KQe/IgBzUUXWv4n9Jyl5TGjn0TudwgO4NgD+goUsPtsugAld9ICHcntIbD9zx6r
X-Received: by 2002:a17:90b:3a05:b0:367:d850:6a5f with SMTP id 98e67ed59e1d1-377ac3612b7mr2700354a91.25.1781179233303;
        Thu, 11 Jun 2026 05:00:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.05.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:00:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 18/20] ASoC: Intel: atom: sst-atom-controls: Use guard() for mutex locks
Date: Thu, 11 Jun 2026 18:58:59 +0700
Message-ID: <20260611115901.80438-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611115901.80438-1-phucduc.bui@gmail.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
In sst_algo_control_set() and sst_gain_put(), the mutex release point
moves from immediately before dev_err() to scope exit. However, the
affected path only emits a warning and immediately returns -EINVAL,
without any further processing, so the change does not affect behavior.
This is purely a code refactoring with no intended functional change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-atom-controls.c | 85 +++++++++++-------------
 1 file changed, 37 insertions(+), 48 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 3629ceaaac17..54defde24397 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -75,10 +75,9 @@ static int sst_fill_and_send_cmd(struct sst_data *drv,
 {
 	int ret;
 
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 	ret = sst_fill_and_send_cmd_unlocked(drv, ipc_msg, block,
 					task_id, pipe_id, cmd_data, len);
-	mutex_unlock(&drv->lock);
 
 	return ret;
 }
@@ -167,15 +166,15 @@ static int sst_slot_get(struct snd_kcontrol *kcontrol,
 	unsigned int val, mux;
 	u8 *map = is_tx ? sst_ssp_rx_map : sst_ssp_tx_map;
 
-	mutex_lock(&drv->lock);
-	val = 1 << ctl_no;
-	/* search which slot/channel has this bit set - there should be only one */
-	for (mux = e->max; mux > 0;  mux--)
-		if (map[mux - 1] & val)
-			break;
+	scoped_guard(mutex, &drv->lock) {
+		val = 1 << ctl_no;
+		/* search which slot/channel has this bit set - there should be only one */
+		for (mux = e->max; mux > 0;  mux--)
+			if (map[mux - 1] & val)
+				break;
 
-	ucontrol->value.enumerated.item[0] = mux;
-	mutex_unlock(&drv->lock);
+		ucontrol->value.enumerated.item[0] = mux;
+	}
 
 	dev_dbg(c->dev, "%s - %s map = %#x\n",
 			is_tx ? "tx channel" : "rx slot",
@@ -235,7 +234,7 @@ static int sst_slot_put(struct snd_kcontrol *kcontrol,
 	if (mux > e->max - 1)
 		return -EINVAL;
 
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 	/* first clear all registers of this bit */
 	for (i = 0; i < e->max; i++)
 		map[i] &= ~val;
@@ -244,7 +243,6 @@ static int sst_slot_put(struct snd_kcontrol *kcontrol,
 		/* kctl set to 'none' and we reset the bits so send IPC */
 		ret = sst_check_and_send_slot_map(drv, kcontrol);
 
-		mutex_unlock(&drv->lock);
 		return ret;
 	}
 
@@ -258,7 +256,6 @@ static int sst_slot_put(struct snd_kcontrol *kcontrol,
 
 	ret = sst_check_and_send_slot_map(drv, kcontrol);
 
-	mutex_unlock(&drv->lock);
 	return ret;
 }
 
@@ -354,13 +351,12 @@ static int sst_algo_control_set(struct snd_kcontrol *kcontrol,
 	struct sst_algo_control *bc = (void *)kcontrol->private_value;
 
 	dev_dbg(cmpnt->dev, "control_name=%s\n", kcontrol->id.name);
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 	switch (bc->type) {
 	case SST_ALGO_PARAMS:
 		memcpy(bc->params, ucontrol->value.bytes.data, bc->max);
 		break;
 	default:
-		mutex_unlock(&drv->lock);
 		dev_err(cmpnt->dev, "Invalid Input- algo type:%d\n",
 				bc->type);
 		return -EINVAL;
@@ -368,7 +364,6 @@ static int sst_algo_control_set(struct snd_kcontrol *kcontrol,
 	/*if pipe is enabled, need to send the algo params from here*/
 	if (bc->w && bc->w->power)
 		ret = sst_send_algo_cmd(drv, bc);
-	mutex_unlock(&drv->lock);
 
 	return ret;
 }
@@ -475,7 +470,7 @@ static int sst_gain_put(struct snd_kcontrol *kcontrol,
 	struct sst_gain_mixer_control *mc = (void *)kcontrol->private_value;
 	struct sst_gain_value *gv = mc->gain_val;
 
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 
 	switch (mc->type) {
 	case SST_GAIN_TLV:
@@ -497,7 +492,6 @@ static int sst_gain_put(struct snd_kcontrol *kcontrol,
 		break;
 
 	default:
-		mutex_unlock(&drv->lock);
 		dev_err(cmpnt->dev, "Invalid Input- gain type:%d\n",
 				mc->type);
 		return -EINVAL;
@@ -506,7 +500,6 @@ static int sst_gain_put(struct snd_kcontrol *kcontrol,
 	if (mc->w && mc->w->power)
 		ret = sst_send_gain_cmd(drv, gv, mc->task_id,
 			mc->pipe_id | mc->instance_id, mc->module_id, 0);
-	mutex_unlock(&drv->lock);
 
 	return ret;
 }
@@ -521,10 +514,9 @@ static int sst_send_pipe_module_params(struct snd_soc_dapm_widget *w,
 	struct sst_data *drv = snd_soc_component_get_drvdata(c);
 	struct sst_ids *ids = w->priv;
 
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 	sst_find_and_send_pipe_algo(drv, w->name, ids);
 	sst_set_pipe_gain(ids, drv, 0);
-	mutex_unlock(&drv->lock);
 
 	return 0;
 }
@@ -761,27 +753,27 @@ int sst_handle_vb_timer(struct snd_soc_dai *dai, bool enable)
 			return ret;
 	}
 
-	mutex_lock(&drv->lock);
-	if (enable)
-		timer_usage++;
-	else
-		timer_usage--;
-
-	/*
-	 * Send the command only if this call is the first enable or last
-	 * disable
-	 */
-	if ((enable && (timer_usage == 1)) ||
-	    (!enable && (timer_usage == 0))) {
-		ret = sst_fill_and_send_cmd_unlocked(drv, SST_IPC_IA_CMD,
-				SST_FLAG_BLOCKED, SST_TASK_SBA, 0, &cmd,
-				sizeof(cmd.header) + cmd.header.length);
-		if (ret && enable) {
+	scoped_guard(mutex, &drv->lock) {
+		if (enable)
+			timer_usage++;
+		else
 			timer_usage--;
-			enable  = false;
+
+		/*
+		 * Send the command only if this call is the first enable or last
+		 * disable
+		 */
+		if ((enable && (timer_usage == 1)) ||
+		    (!enable && (timer_usage == 0))) {
+			ret = sst_fill_and_send_cmd_unlocked(drv, SST_IPC_IA_CMD,
+					SST_FLAG_BLOCKED, SST_TASK_SBA, 0, &cmd,
+					sizeof(cmd.header) + cmd.header.length);
+			if (ret && enable) {
+				timer_usage--;
+				enable  = false;
+			}
 		}
 	}
-	mutex_unlock(&drv->lock);
 
 	if (!enable)
 		sst->ops->power(sst->dev, false);
@@ -984,9 +976,8 @@ static int sst_set_be_modules(struct snd_soc_dapm_widget *w,
 	dev_dbg(c->dev, "Enter: widget=%s\n", w->name);
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
-		mutex_lock(&drv->lock);
-		ret = sst_send_slot_map(drv);
-		mutex_unlock(&drv->lock);
+		scoped_guard(mutex, &drv->lock)
+			ret = sst_send_slot_map(drv);
 		if (ret)
 			return ret;
 		ret = sst_send_pipe_module_params(w, k);
@@ -1344,9 +1335,8 @@ int sst_send_pipe_gains(struct snd_soc_dai *dai, int stream, int mute)
 
 				dev_dbg(dai->dev, "send gains for widget=%s\n",
 						p->sink->name);
-				mutex_lock(&drv->lock);
-				sst_set_pipe_gain(ids, drv, mute);
-				mutex_unlock(&drv->lock);
+				scoped_guard(mutex, &drv->lock)
+					sst_set_pipe_gain(ids, drv, mute);
 			}
 		}
 	} else {
@@ -1360,9 +1350,8 @@ int sst_send_pipe_gains(struct snd_soc_dai *dai, int stream, int mute)
 
 				dev_dbg(dai->dev, "send gain for widget=%s\n",
 						p->source->name);
-				mutex_lock(&drv->lock);
-				sst_set_pipe_gain(ids, drv, mute);
-				mutex_unlock(&drv->lock);
+				scoped_guard(mutex, &drv->lock)
+					sst_set_pipe_gain(ids, drv, mute);
 			}
 		}
 	}
-- 
2.43.0


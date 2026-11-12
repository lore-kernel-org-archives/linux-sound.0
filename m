Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511223;
	b=ba7HNPvJUdU19sJDfO3k+sJUwyZ7EahnSoUdTpUNUaSOlPE0SbrB0qcmSoF1qPag/4ML
	 YAMGN3QkhEawtzSYAvEDMH6TVsjiVbkUkG+K5E36kEmDlqeKGuG35Dji/Yu4H4L5kmAZn
	 l71xMvsSKMtZQVGgJzeT6SGOqDRAJWrViJ9CD3/rYFCCV+Pq84T7/mCIIgOSAw+deLgWG
	 QzTafmTw8oDimkAFdRJ39i0G4wZJ5kPF4c0nRJn1BCN0dg1zOUvNgLDPjf+7K9c0w6uAU
	 uMA2SNemZXK0OVEAQTKKbc7IPqLLqdZyN+ClBO5G9BnbcdIE1c014mNBLs7Y6lr1LeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=shpIHoIpuW8NEcMIStzNPtZc+ZJ+NknyxjQZ++Y99Y8=;
	b=yn7jX42oKJ2MKqKuJ9Hknqi3sj7xT4bdCKsO831i/Ps17eSP/x3Z0bpba2mkqw8XWfYz
	 9wMLLRWQIX2Vdzc0L8uhfNH2ndikto0R15i/7RUonW5f+TL/wvo5Mln6ZTD0pZq4jhRRy
	 muVGgKmf6o845bmjB2K7m5J9S5mPTiBlLI8oqijmAVqaDHBSVn6qsDw0R4kjp+Kr4nV2F
	 YKmESr9l3tMr6fHpMt29/0NNrKmnWvIGsjErRpF0zPZNkGAK5QOY4A0dKKeZjorEUrm3g
	 s4XmNegvB51QR084tdePwn2ZcyL9a2jPxy042HZit3F3P1Fh43Ou39FDhkJaNQSpYPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZHJG9udv;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FE1606A33E
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 19:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FE1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZHJG9udv
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37000e7234bso60394eec.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 11:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794511222; x=1795116022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shpIHoIpuW8NEcMIStzNPtZc+ZJ+NknyxjQZ++Y99Y8=;
        b=ZHJG9udvp1IRPSAhP/ZSpTMPUMKLOMI0evX6tE4z698cB54u5bbGg5AxuPfDBmkRbY
         Vsuu2u5QX0XnMkiqVJNCviBqGGojWSdkKqnTaWeFddgTVFrUoeTCe39uMzkotYOgSodu
         xgK1HEoK4Tukkp2A3gkSlmJLmV0u6QRDqkW2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511222; x=1795116022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=shpIHoIpuW8NEcMIStzNPtZc+ZJ+NknyxjQZ++Y99Y8=;
        b=bUzq/swjH3ktbUTXX8lUdD6N7jxHmKvlUZrfEFYNqJtrMlnoU7XnnUgRJ4YvSlj0KY
         VurAa9TWFMtFyj3w2TXzM2zcwGvba2dUTVOh767wpXpKMjjR5NBVIB6NIFJEw017+1ik
         aGT/Zk0VVKC0TNiSW6oMgHF8PHHUcg9LEtqZB+zEUTwL55Tr94APHGxLE4Rd1mzN0eOS
         8YavhSkGsQDjpz/w4c1A2xZKV61GM+bCG0QFpr9TOw1FgqZqxeFw7CTKV2lfox/3sMPj
         myPPVpw/Cu5Xa++2YxFwCUftKSo87euKO4zmTxnjzdicSDjvLMSM1dnFsqWsJGCKsmKb
         w1HA==
X-Forwarded-Encrypted: i=1; AL+hErGN4m/xgE5JnjaaLg9YrQpcQ3WURxmtTKkPgHCIf3YGD0iMVW7PhSoi2f4sSrnre2xVMWcxjHtqlZRgQw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+uxkx4xb+bSCWWtERdC1Gcu3ISFi+G3YYtEHRb+3ACiLQAC2M8
	qhwyHrcqWoK65wjTgn8+wwTCfXzJTI0vPmn7P1sAmxIu/B3cJU+XozDE5xOXFvo36g==
X-Gm-Gg: AYBFou27w2WWFMWh7BJqFTSw/6ZqI0A+r7mety0F6KJpLx2iA2KA68ZCg6UpItifj5g
	2/VvzvGSBMcX/f4cXThkV9Szi/tGEG+ttiWCIzWPGvlWypkwNdCDcp+A3p1zXqzz4bMIy1JSRDv
	YC5vAFhUmApRTgyn/KbSrIA2XIKAMoK+MVmBFbLM9L6czy5XaG1UczerH2vLkutkA/uyq4xR0Jd
	OZIqQ6gbAxUJ1DddOmcx8xmbk4/xY1nzayjzJbXqE4QrRSmJqIvEfbMIn5Ujpm7tWxMgkM75jpS
	tpiP5fX2Q8cWGsAcnME/y+4jI7sAzTx3CVYledefBK8tB48gA8lGvOcPG5krb+hvT2UgVaJxy1z
	6tXaXN+v0mc9ULq4h875pZkZyp9j/9BfngGXIdHZDddItPLVce13XvpCHxdfNA/rXAVpyYei9/0
	dcorgVC+JCsyJjFklnXif2Pq9nJTKazp0ykjySN+UklZYDtAxlL4J2w3trsIAmbRUW79EMj3e5V
	mgKp9o31xgv2JZEMym6sHAWmWTPbtcpRzw6VY7TbBiiffkQkHQAIY/vLNiUdeFhmntGBdsnmYa8
	mUYSOKEtpE1y6aCAzJ2QXMM7S0N18UTQCgRCSrUAl8kjp2gkS9TnKaQ7c33J8W+mfAo7
X-Received: by 2002:a05:7300:828e:b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-37966a5ce93mr98368eec.29.1794511222122;
        Thu, 12 Nov 2026 11:20:22 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:5446:563c:ac92:43a8])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-37955f02ff0sm496854eec.16.2026.11.12.11.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:20:21 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-pm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Brian Norris <briannorris@chromium.org>,
	sound-open-firmware@alsa-project.org
Subject: [RESEND PATCH 3/3] ASoC: SOF: Discard pm_runtime_put_autosuspend() return values
Date: Thu, 12 Nov 2026 11:19:39 -0800
Message-ID: <20261112111937.RESEND.3.I90762189ee6537c5deb0725ede365d641607377e@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261112111937.RESEND.1.I5cd238b1d4516d4d6980565e0a4e1b83d9abce63@changeid>
References: <20261112111937.RESEND.1.I5cd238b1d4516d4d6980565e0a4e1b83d9abce63@changeid>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Printing error messages on pm_runtime_put_autosuspend() returning
negative values is not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

Accordingly, update the SOF driver to simply discard the return value of
pm_runtime_put_autosuspend().

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This patch was originally sent as part of a larger series here:
https://lore.kernel.org/all/20261006161337.11.I90762189ee6537c5deb0725ede365d641607377e@changeid/

I expect it should be merged by subsystem maintainers, and we can make
the return type change later.

 sound/soc/sof/control.c                        |  6 ++----
 sound/soc/sof/sof-client-ipc-flood-test.c      |  5 +----
 sound/soc/sof/sof-client-ipc-kernel-injector.c |  4 +---
 sound/soc/sof/sof-client-ipc-msg-injector.c    |  6 ++----
 sound/soc/sof/sof-client-probes.c              | 18 ++++++------------
 5 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 74d997a4f620..8718c293c5b9 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -185,7 +185,7 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
-	int ret, err;
+	int ret;
 
 	/* ignore the ext_volatile_get call if the callbacks are not provided */
 	if (!tplg_ops || !tplg_ops->control ||
@@ -205,9 +205,7 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 								binary_data,
 								size);
 
-	err = pm_runtime_put_autosuspend(scomp->dev);
-	if (err < 0)
-		dev_err_ratelimited(scomp->dev, "%s: failed to idle %d\n", __func__, err);
+	pm_runtime_put_autosuspend(scomp->dev);
 
 	return ret;
 }
diff --git a/sound/soc/sof/sof-client-ipc-flood-test.c b/sound/soc/sof/sof-client-ipc-flood-test.c
index 0e8a0262b795..b0d8419addc7 100644
--- a/sound/soc/sof/sof-client-ipc-flood-test.c
+++ b/sound/soc/sof/sof-client-ipc-flood-test.c
@@ -157,7 +157,6 @@ static ssize_t sof_ipc_flood_dfs_write(struct file *file, const char __user *buf
 	unsigned long ipc_duration_ms = 0;
 	bool flood_duration_test = false;
 	unsigned long ipc_count = 0;
-	int err;
 	char *string;
 	int ret;
 
@@ -223,9 +222,7 @@ static ssize_t sof_ipc_flood_dfs_write(struct file *file, const char __user *buf
 		ret = sof_debug_ipc_flood_test(cdev, flood_duration_test,
 					       ipc_duration_ms, ipc_count);
 
-	err = pm_runtime_put_autosuspend(dev);
-	if (err < 0)
-		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
+	pm_runtime_put_autosuspend(dev);
 
 	/* return count if test is successful */
 	if (ret >= 0)
diff --git a/sound/soc/sof/sof-client-ipc-kernel-injector.c b/sound/soc/sof/sof-client-ipc-kernel-injector.c
index b5bca9258f42..16deb117b7b9 100644
--- a/sound/soc/sof/sof-client-ipc-kernel-injector.c
+++ b/sound/soc/sof/sof-client-ipc-kernel-injector.c
@@ -66,9 +66,7 @@ static ssize_t sof_kernel_msg_inject_dfs_write(struct file *file, const char __u
 	if (!ret)
 		sof_client_ipc_rx_message(cdev, hdr, priv->kernel_buffer);
 
-	ret = pm_runtime_put_autosuspend(dev);
-	if (ret < 0)
-		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", ret);
+	pm_runtime_put_autosuspend(dev);
 
 	return count;
 };
diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index c98307cf7eee..bd10fb39457a 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -122,7 +122,7 @@ static int sof_msg_inject_send_message(struct sof_client_dev *cdev)
 {
 	struct sof_msg_inject_priv *priv = cdev->data;
 	struct device *dev = &cdev->auxdev.dev;
-	int ret, err;
+	int ret;
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0 && ret != -EACCES) {
@@ -140,9 +140,7 @@ static int sof_msg_inject_send_message(struct sof_client_dev *cdev)
 			dev_err(dev, "IPC message send failed: %d\n", ret);
 	}
 
-	err = pm_runtime_put_autosuspend(dev);
-	if (err < 0)
-		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
+	pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 286486945abd..b3ae232e578a 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -211,7 +211,7 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 	int remaining, offset;
 	size_t num_desc;
 	char *buf;
-	int i, ret, err;
+	int i, ret;
 
 	if (priv->extractor_stream_tag == SOF_PROBES_INVALID_NODE_ID) {
 		dev_warn(dev, "no extractor stream running\n");
@@ -258,9 +258,7 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 	kfree(desc);
 
 pm_error:
-	err = pm_runtime_put_autosuspend(dev);
-	if (err < 0)
-		dev_err_ratelimited(dev, "debugfs read failed to idle %d\n", err);
+	pm_runtime_put_autosuspend(dev);
 
 exit:
 	kfree(buf);
@@ -294,7 +292,7 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
 	struct sof_probe_point_desc *desc;
 	u32 num_elems, *array;
 	size_t bytes;
-	int ret, err;
+	int ret;
 
 	if (priv->extractor_stream_tag == SOF_PROBES_INVALID_NODE_ID) {
 		dev_warn(dev, "no extractor stream running\n");
@@ -327,9 +325,7 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
 			ret = count;
 	}
 
-	err = pm_runtime_put_autosuspend(dev);
-	if (err < 0)
-		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
+	pm_runtime_put_autosuspend(dev);
 exit:
 	kfree(array);
 	return ret;
@@ -360,7 +356,7 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 	struct sof_probes_priv *priv = cdev->data;
 	const struct sof_probes_ipc_ops *ipc = priv->ipc_ops;
 	struct device *dev = &cdev->auxdev.dev;
-	int ret, err;
+	int ret;
 	u32 *array;
 
 	if (priv->extractor_stream_tag == SOF_PROBES_INVALID_NODE_ID) {
@@ -385,9 +381,7 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 			ret = count;
 	}
 
-	err = pm_runtime_put_autosuspend(dev);
-	if (err < 0)
-		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
+	pm_runtime_put_autosuspend(dev);
 exit:
 	kfree(array);
 	return ret;
-- 
2.56.0.611.g1030f0b940-goog


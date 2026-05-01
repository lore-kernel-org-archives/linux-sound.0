Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B45E38759F
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777631172; cv=none; b=S/lE0Ct6VEHYbvPN3AwZYvgRd85KK7SZOLdPCd6HhyPQG0HX4ceZP8FBNLRRQPM1THymOcFTj9z3nkkuyhosm2NKQkjKesB1HFANMTXqqjBR5qUxYjSXg2WqQ5THlwuX8AEkluHoTXRMO0tp55oG0/VsZ6AgCLZw/x9fFCtaYsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777631172; c=relaxed/simple;
	bh=lkrOfQejoOQtc0UD8vdaZKSDo8iZxAifYR7cbfqlCuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTwwHhU3GUraoPYXD7Y+AtV9TolILL7AdMHpo8dzNY6ofdIEKQaW6xlh4o2TBZ3C6eJWvDvF2qL6h3WeXojUlbnyyvsSLgiaueHB3sVzSBrJXE128yzZJv3T462blKaum97hiezx7X22fohIcP3lgX2WR9or+jHF9eFunTW8gCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLnIADKZ; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLnIADKZ"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c156c4a9efso3405214eec.1
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777631170; x=1778235970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/VNZZNNKrMdoG7xQ2QOv9i/OiKP564yp95Gw5x5J8s=;
        b=HLnIADKZQACeiT0YMxFER4T92tT55NJV/TbZBhaUg4xIBJWwOgoV2MMwi6ioHgPVBt
         F9KSWH72I1WjP+rHdmuI8hlw0hVClXwb+/8b+kX4Po3CNHsBc3lQ5vYkE2o4F6ALcY63
         CooPi65olw9WK+DydU4EpzF7/GGnppTyS4DGlIkKmOXeCurxcOn8avgpitQio6sHjZ2s
         /YCR7SFiU0TLSFqEROa8IJR6rYIUN3Nr31LZy9ZtayjRQfndSHJWcPDYjyIPNWIMGF1x
         RbuSH57tLgNdfwk8F5g7+vDue82czEexjmkAumbpz2geN4MDHqco2ebaJrwrqm99ykVm
         DNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777631170; x=1778235970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J/VNZZNNKrMdoG7xQ2QOv9i/OiKP564yp95Gw5x5J8s=;
        b=flSqqtx8yY3zweReNGV3q9JGUElRwpg+ZvV+nlOkQ6t4SvMzl1n5sssDagXbc8Trw0
         dc0+ZlhUiN+ZCJriQem0ubbmsaU3l8ETMaVTtsmP8uLLwGqXvvoSrMHXS5gOWrVOfVLC
         hn6gdSi108CCUKC7SA0tV/SpB1y4ES/MfB6QEh8vw6QYA2P9GBYN/lUDPX/mZxMmSiO8
         mrp0gjFQDvcritBQuwaJo1hC3S98r/PovDx7WNev8VuIx64eBGwItP/Shh43TOIVfdL2
         c3mT3wFUMQipwxNDndv5JQIeZaZMRzWbtxVosf39pwPDsiof0e6e0mQApqsYpObjofVv
         tKiw==
X-Forwarded-Encrypted: i=1; AFNElJ9yBWsDIyqUfRfoPoI3VnMMkt8lAV/Jn3T7qCpTJMsXKkgltw+qeKG9VIjJMPj4qecEHQQgu0HIboAkEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIQh/NpffUvVpHs73a4qfyZGGIXT3mq2x5Wq1KfSe94KGsdSUm
	9dJ/rAVNIHPCx8cBzW8AepeKI1MjTwMUbrwBs+HCWnjBjpVG5/vvQ1EU
X-Gm-Gg: AeBDievM5KBSBTvr57dgnYqHedYZcnNr0uU9phaW857lY1lruET8jmgReOQ+pGLL6iW
	lHs2i5crrM3jUd7CddS579KBtaAAdLq1MPPG394DVSESPr2ipN21IvXpBRwlj/C75vGF2hULXSs
	+bAXSzoZj3uTeJu+/FTBVn30SxE/WITgqvqGHV6+YdQNWRnzDt8+tMdKQ3qF+RTzCOwSo1tx9gs
	eHhMKi+cwtx738I3fZe8p6ZhbBW1+sAnJJK16sfYUWTcTRa5pdqMPxzSDnAZc41XPS+H5ILTyMn
	GJaOv+b4rxXKuPewiw90MIoKTIvGEphYsM/kc0hmeYtRzOzbomWyUQCejdZAWyLhb+4s9J2rADt
	rYv4uDj27YNaol0s8+1yjEvQUSBUaGkzI7B0RILeB0wbJEQF2Q/yY9dJWHuyVeHjTiHUBWkcDn5
	0FcIHsYeKA9C0+19jJ60c+tBsdvA85IvDPDxGdwZU0AlEUqnWAlmsrLnWItABqfsGx+UFaHuzG7
	upbcXB/8OBM
X-Received: by 2002:a05:7022:e17:b0:12d:de3f:f3e6 with SMTP id a92af1059eb24-12dead2545cmr2631963c88.38.1777631170377;
        Fri, 01 May 2026 03:26:10 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84250f1sm2621191c88.11.2026.05.01.03.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 03:26:09 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 01 May 2026 07:22:12 -0300
Subject: [PATCH v3 1/2] firmware_loader: Add cancel helper for async
 requests
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-1-8d9f873b97bd@gmail.com>
References: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-0-8d9f873b97bd@gmail.com>
In-Reply-To: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-0-8d9f873b97bd@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5907;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=lkrOfQejoOQtc0UD8vdaZKSDo8iZxAifYR7cbfqlCuw=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlf6nfYvvoa+8m4+mtj7bnFuRx7vvbsOivC+fha84yFv
 zwMjBxvdJSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBErlxn+J9icWenHFPilZQD
 LrLL3Y+yvVOdkfojzejiDvEZ5U7f+qsYGVadePffOn1mzPMPSfkn65nOX0/bkTtR3mStV1efqaH
 QdxYA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

request_firmware_nowait() keeps the callback module pinned and holds
a device reference until the firmware work completes.

Callers still have no way to cancel or synchronize the queued callback
before tearing down their driver-private state.

Track scheduled async firmware work in an internal list and add
request_firmware_nowait_cancel(). The helper cancels work matching the
device, callback context and callback function. It cancels work that has
not started yet and waits for an already-running callback to return. If
the request has already completed, it is a no-op.

Keep the existing request_firmware_nowait() lifetime model manual. A
devres-managed variant can be layered on top separately if needed.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 drivers/base/firmware_loader/main.c | 71 ++++++++++++++++++++++++++++++++++---
 include/linux/firmware.h            | 10 ++++++
 2 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index a11b30dda23b..bd890f103b2f 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -1132,6 +1132,7 @@ EXPORT_SYMBOL(release_firmware);
 /* Async support */
 struct firmware_work {
 	struct work_struct work;
+	struct list_head list;
 	struct module *module;
 	const char *name;
 	struct device *device;
@@ -1140,21 +1141,37 @@ struct firmware_work {
 	u32 opt_flags;
 };
 
+static LIST_HEAD(firmware_work_list);
+static DEFINE_SPINLOCK(firmware_work_lock);
+
+static void firmware_work_free(struct firmware_work *fw_work)
+{
+	put_device(fw_work->device); /* taken in request_firmware_nowait() */
+	module_put(fw_work->module);
+	kfree_const(fw_work->name);
+}
+
 static void request_firmware_work_func(struct work_struct *work)
 {
 	struct firmware_work *fw_work;
 	const struct firmware *fw;
+	unsigned long flags;
 
 	fw_work = container_of(work, struct firmware_work, work);
 
 	_request_firmware(&fw, fw_work->name, fw_work->device, NULL, 0, 0,
 			  fw_work->opt_flags);
 	fw_work->cont(fw, fw_work->context);
-	put_device(fw_work->device); /* taken in request_firmware_nowait() */
 
-	module_put(fw_work->module);
-	kfree_const(fw_work->name);
-	kfree(fw_work);
+	spin_lock_irqsave(&firmware_work_lock, flags);
+	if (!list_empty(&fw_work->list)) {
+		list_del_init(&fw_work->list);
+		spin_unlock_irqrestore(&firmware_work_lock, flags);
+		firmware_work_free(fw_work);
+		kfree(fw_work);
+		return;
+	}
+	spin_unlock_irqrestore(&firmware_work_lock, flags);
 }
 
 
@@ -1164,6 +1181,7 @@ static int _request_firmware_nowait(
 	void (*cont)(const struct firmware *fw, void *context), bool nowarn)
 {
 	struct firmware_work *fw_work;
+	unsigned long flags;
 
 	fw_work = kzalloc_obj(struct firmware_work, gfp);
 	if (!fw_work)
@@ -1196,7 +1214,12 @@ static int _request_firmware_nowait(
 
 	get_device(fw_work->device);
 	INIT_WORK(&fw_work->work, request_firmware_work_func);
+
+	spin_lock_irqsave(&firmware_work_lock, flags);
+	list_add_tail(&fw_work->list, &firmware_work_list);
 	schedule_work(&fw_work->work);
+	spin_unlock_irqrestore(&firmware_work_lock, flags);
+
 	return 0;
 }
 
@@ -1259,6 +1282,46 @@ int firmware_request_nowait_nowarn(
 }
 EXPORT_SYMBOL_GPL(firmware_request_nowait_nowarn);
 
+/**
+ * request_firmware_nowait_cancel() - cancel an async firmware request
+ * @device: device for which the firmware is being loaded
+ * @context: context passed to request_firmware_nowait()
+ * @cont: callback passed to request_firmware_nowait()
+ *
+ * Cancel a pending request_firmware_nowait() request for @device, @context
+ * and @cont. If the associated work has already started, this function waits
+ * until the callback has returned. If the callback has already completed, this
+ * function does nothing.
+ *
+ * This function may sleep.
+ */
+void request_firmware_nowait_cancel(struct device *device, void *context,
+				    void (*cont)(const struct firmware *fw,
+						 void *context))
+{
+	struct firmware_work *fw_work = NULL;
+	struct firmware_work *tmp;
+	unsigned long flags;
+
+	spin_lock_irqsave(&firmware_work_lock, flags);
+	list_for_each_entry_reverse(tmp, &firmware_work_list, list) {
+		if (tmp->device == device && tmp->context == context &&
+		    tmp->cont == cont) {
+			fw_work = tmp;
+			list_del_init(&fw_work->list);
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&firmware_work_lock, flags);
+
+	if (!fw_work)
+		return;
+	cancel_work_sync(&fw_work->work);
+	firmware_work_free(fw_work);
+	kfree(fw_work);
+}
+EXPORT_SYMBOL_GPL(request_firmware_nowait_cancel);
+
 #ifdef CONFIG_FW_CACHE
 static ASYNC_DOMAIN_EXCLUSIVE(fw_cache_domain);
 
diff --git a/include/linux/firmware.h b/include/linux/firmware.h
index aae1b85ffc10..0fa3b027f02f 100644
--- a/include/linux/firmware.h
+++ b/include/linux/firmware.h
@@ -110,6 +110,9 @@ int request_firmware_nowait(
 	struct module *module, bool uevent,
 	const char *name, struct device *device, gfp_t gfp, void *context,
 	void (*cont)(const struct firmware *fw, void *context));
+void request_firmware_nowait_cancel(struct device *device, void *context,
+				    void (*cont)(const struct firmware *fw,
+						 void *context));
 int request_firmware_direct(const struct firmware **fw, const char *name,
 			    struct device *device);
 int request_firmware_into_buf(const struct firmware **firmware_p,
@@ -157,6 +160,13 @@ static inline int request_firmware_nowait(
 	return -EINVAL;
 }
 
+static inline void request_firmware_nowait_cancel(struct device *device,
+						  void *context,
+						  void (*cont)(const struct firmware *fw,
+							       void *context))
+{
+}
+
 static inline void release_firmware(const struct firmware *fw)
 {
 }

-- 
2.54.0


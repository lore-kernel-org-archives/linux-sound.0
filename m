Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C8D38836F
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979928; cv=none; b=SA7K+pYpj63VuD4bElTv2X7vQO93ksgv471XzRmc9Yl2IilP2e+Xmeb5dHoko4q26OzWVO4g1tnMMYhSiasp1oStPT+JDMuQDYGHQ1m25hpCOkHMcARaridjkwTB3W8pArOCe3Pf9HEnulluI1Wtmqb8lcMYjp5/MUS+KfP3K9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979928; c=relaxed/simple;
	bh=a9fvkD4KH9FZe3Nqu5/OHzOriThojqtxcfZpjbFhSl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FMDjAxvd7ygmwV151BB6/UQYZJ0kJBp1EfMUH5tn16Y1bb1U2A7NLWm3XYk4NqaxdY5hCBqbd0k6lBHI6uSuaov0X34Nei2t0fARMpKepWIKe6NAJMZdzFjRDzNVRIeDTLEEKn3UpsYqQjtNqtfqGI8lZCf4Z3aH4NUPpO3EmAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzxbo2Lf; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzxbo2Lf"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c45281a06so7931883c88.1
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 04:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777979926; x=1778584726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MSjy81zKyUdXTwr06hbW0c64AcMNVfJ6CrHzTpndtM=;
        b=mzxbo2LfjjWLSaGDL3GszxIdc+69Q5rQoW8ZojCfCnZQk3OAdgQIeon9fQQ8lA9TfK
         TXLAv/fSp+WjIdK4P8vj87MvC0Okr+ce28/NxPN7z29fVqtiykH13AB/QP68TAvKuK+T
         SaA74WPL2/6OAVc/HwEnL2lqB/PnVjrxrmekEvM8GRaOuWUZ9yzgNMA18OeCPgj9CDRZ
         Ba3i4qgkfEbUInZ0U4CieSXlmUUJeRmpvLRbftfPuAsYzdWPl8H/gKDzBYR3yPySCgtK
         FhdSxO2b0Wh9x+69Bx3l0NSNL6LnJv84O36tBENmJI57rCP3xgsxZewxxlbtaJv42nMo
         yJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777979926; x=1778584726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5MSjy81zKyUdXTwr06hbW0c64AcMNVfJ6CrHzTpndtM=;
        b=j+qEL6AyIh6cBoFMv4rXLPwXXi2g9sqp8WiB/jrwaVgN5ysrHolSqlcv2KBdSSe1UC
         GAXvquK37FV7lm7u/cLXyO5b/eJx7gY0dDlfCeoqZHVTR4noqxLDKo1LijmLguMGUd4U
         Pny3QQNFsYbd+fdXc/bK4v/JQrwa+5eFmycgM9KwoDnugXU7tN6LdyDwLpTSW5Siqv6t
         4zfkaJ/0wkEsZqMmabLgBbNQ+FduvnKcFDnMzC1MCTEMgaxZM3/PFn1HxGel+qC5ltSt
         BsrR/IZBOYAR3K8z8DtatPuGvo8fIoz/qvg3C3qM3MukP3ypUcGipgtoe0rPgEfor43v
         8ZRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DYJuJWZ/YVjgKtRzJ0T6qp6gKBc8c4y9PfJ9xlZAbNyV5c3lOdAM485d+ZG8ri48stI36KMvlbVaAhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrxNI5a0t9fRwialJjd3JAS6U0UX94GhNHu04UoTV5ld+A/l9W
	j8DGQnF4NyzecVF+atewBI3dlxYuBqgvuoNL/Lj+xhSNJO+qinS2JaoZ
X-Gm-Gg: AeBDies/oTcwtvnO8Rw4ewzkIYSt5Z15m09DBpvsyjn84mVbiIEdoQZ50y8pULgqzkA
	PRshdC/6Zy3C13wHwyC8eaGIzbAOiuq6YivJ1TDlnan84OnEE/kZt3igH6Nj780/rFDN40pH+A+
	EXCQWye7a0143A8P5kIoNInwLTkol1w+uuf1zejdfwqW36aL1nS2ahLmP3XZ+I9LuLksw+b46lZ
	sDSLDHGqurKwIaZusCUroqrFrOCedm3rfFP9ar0FQ2DmOvMz5rOHVDIvBPlecHzDrUwh6nZtREt
	MVwegJv9B+5ih4yrf5SO+gigvFAoaYe7DrbGeUa5XpXxr/nStnOSSY3SfZOWABPRRUlrQYDq5cU
	kvbs6FEPzMSaFQyddtqx95/SrX8eWnfwpIqlvFMX9MK7HGMPtDg5aXAluhUuZv13gFs2zmtI6TD
	fTc4Pt9TWoEUCTjq7utSK+HCn/Ty4Ixz+GEVAW8pqR6EtgqKaBZPsJ5/99GUgVuaMOVk2/i/XYc
	ySkq5Q5ene+I0PxamGgH4k=
X-Received: by 2002:a05:7022:2387:b0:130:6978:c96 with SMTP id a92af1059eb24-130b194cca5mr1148049c88.19.1777979925927;
        Tue, 05 May 2026 04:18:45 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df828849dsm17247290c88.5.2026.05.05.04.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:18:45 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 05 May 2026 08:18:16 -0300
Subject: [PATCH v4 1/2] firmware_loader: Add cancel helper for async
 requests
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-1-e7c4bf930dc8@gmail.com>
References: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-0-e7c4bf930dc8@gmail.com>
In-Reply-To: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-0-e7c4bf930dc8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5767;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=a9fvkD4KH9FZe3Nqu5/OHzOriThojqtxcfZpjbFhSl8=;
 b=kA0DAAoW0F0/Glr/7oMByyZiAGn50g2gjQO7w5WWhszZoLfXBRF+JeE/Ai0Wa3ZNDfsXBJERj
 oh1BAAWCgAdFiEEq2KiObyK4NV/XqhI0F0/Glr/7oMFAmn50g0ACgkQ0F0/Glr/7oMSIgD/bmKi
 o2ek+IV6qnTy6EjSnksJ3C1lP8gXpxHHSSmDMY8BALp0JCs7AQo+7zUYSEhzV/UTffRlLFB2Rvn
 y5rkEZgAI
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
 drivers/base/firmware_loader/main.c | 68 ++++++++++++++++++++++++++++++++++---
 include/linux/firmware.h            | 10 ++++++
 2 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index a11b30dda23b..78c5f05a2ec1 100644
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
@@ -1140,6 +1141,17 @@ struct firmware_work {
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
+	kfree(fw_work);
+}
+
 static void request_firmware_work_func(struct work_struct *work)
 {
 	struct firmware_work *fw_work;
@@ -1150,11 +1162,15 @@ static void request_firmware_work_func(struct work_struct *work)
 	_request_firmware(&fw, fw_work->name, fw_work->device, NULL, 0, 0,
 			  fw_work->opt_flags);
 	fw_work->cont(fw, fw_work->context);
-	put_device(fw_work->device); /* taken in request_firmware_nowait() */
 
-	module_put(fw_work->module);
-	kfree_const(fw_work->name);
-	kfree(fw_work);
+	spin_lock_irq(&firmware_work_lock);
+	if (!list_empty(&fw_work->list)) {
+		list_del_init(&fw_work->list);
+		spin_unlock_irq(&firmware_work_lock);
+		firmware_work_free(fw_work);
+		return;
+	}
+	spin_unlock_irq(&firmware_work_lock);
 }
 
 
@@ -1164,6 +1180,7 @@ static int _request_firmware_nowait(
 	void (*cont)(const struct firmware *fw, void *context), bool nowarn)
 {
 	struct firmware_work *fw_work;
+	unsigned long flags;
 
 	fw_work = kzalloc_obj(struct firmware_work, gfp);
 	if (!fw_work)
@@ -1196,7 +1213,12 @@ static int _request_firmware_nowait(
 
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
 
@@ -1259,6 +1281,44 @@ int firmware_request_nowait_nowarn(
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
+
+	spin_lock_irq(&firmware_work_lock);
+	list_for_each_entry_reverse(tmp, &firmware_work_list, list) {
+		if (tmp->device == device && tmp->context == context &&
+		    tmp->cont == cont) {
+			fw_work = tmp;
+			list_del_init(&fw_work->list);
+			break;
+		}
+	}
+	spin_unlock_irq(&firmware_work_lock);
+
+	if (!fw_work)
+		return;
+	cancel_work_sync(&fw_work->work);
+	firmware_work_free(fw_work);
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


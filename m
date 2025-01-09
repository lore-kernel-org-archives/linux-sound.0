Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1094D15573F
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 03:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736395002; cv=none; b=qO7FAZqkmP49fWG7BNwkoLzCPzPgqU+VhH4R8CxRcL8U5LdJszfhHI9/TV5d5F0ClGXlSNPar2ihjW4ufu1ebnCxH+A9qTS/sSZUP4WzLwfBnVNvIkAIQ8U9UNQ6EMncdI5E2dr1hGy4UJ/p/xe14Sh5MOwDGYangekeNwBIx8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736395002; c=relaxed/simple;
	bh=KfAu+/Q9zgHYQiNdpnwbI68oYIXktrQNbrxwqoISvl0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XU/1/bHgqcGZuwCiIMQKBTxQCrCgP8TBKZwJY5PNAVEl5AHXZuCbXjLkLPQq/7IZG3bcoHN0CiCXNwGI2vkcoI6K0ThFybFfl/PCWEiq0x000G237Z7mOnyhRVl6Wq3H2qY6MUfIzvd9lQtxGzVR4cW6okc6Ni0lekyKqGwO9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iHY9UXW4; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iHY9UXW4"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-216311faa51so8611085ad.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jan 2025 19:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736394998; x=1736999798; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1bqpoVW3vY/Vp4JhJHrnaJZTqoC1FMmiLXRADQekEsQ=;
        b=iHY9UXW4RmrRfKaK9/G/dxMouHOZFKSWkRr1IXso3lXpJD1x3RwdP2MnwW1hDACS+Q
         gUyXoAC2/9II+YQc607nO9qjxJlhUS0YbGDAasTMCjHl83CV/RgMQcC1WXN44CWni8ht
         4NsAYuWvv05GnGNAFcsGFXthLdhery7D4K1RUrbU0qKB0omWounsb0kL0wXaz0glp06v
         7ZI1oPDZymUQkTU+1Xe6cdGa/dsh+ddJuzgJGeKx0tNCNeFRXKyKyX6H62opAhbumFBj
         oLrOoHeRAZHJNy9TS7q5eqfvdbIhTR/Fmlx5tMEfyQsbRV4ReZto7eU+p9Pnm2Qm0m09
         uL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736394998; x=1736999798;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1bqpoVW3vY/Vp4JhJHrnaJZTqoC1FMmiLXRADQekEsQ=;
        b=KbP4uQDPVJWqVL8dQLYFhIoz83OLApmHucsczKcdxOm7DKMa4ARiwiabUp2Ehu7H7X
         OgVEUyp3Of1Epd9ROw3kHCpBuiQQXMP16XNINMtg0U4weUEpk5lVfThmnQTUZ0t9INpT
         4VWD7kYzSDpJu2BneIKN5iSSMiqNVhiahjDSgY2Rd+gHmYjkJhe2i4SqwA7BlRhsOooh
         Iw6xfcjHcN+aGrhTUT/H7BHVUcXWq/v2UkBXtIQEShRv1c68IK2FycVaUxQ+K6dX0t5l
         Y8FIPtgcOcGCfiuv570/qrKAJzD/dfGnTz5bEOFq21bQ/kXtxxcsAtz5nTLBcz2dEZlK
         Oi5A==
X-Forwarded-Encrypted: i=1; AJvYcCUOS5WXq46VBydCHawwfma/PLbIYn5HQ2xT5ZvTnrIZgj8dnzqXYBAapA05JN7y2zPaVNddaRzNeHoIGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydqyDfynFAtTVPov90r9C+N0cYA8MXNqVJI87zaMu5BRgIYzTp
	f9h+9FN7RNd2/K1UOk+cswHNLuGipBmurdLL/O08WdFKupfXdWkN3IAaxwoT1xn3MyfOkdaH5ui
	5SBHWIZITEjBFIw==
X-Google-Smtp-Source: AGHT+IFVJIqG3yFsoeHkU0ahRDewZcWXAEwQdrSTVFc9DwLmOYW/hNR1O09jqREMSRezVrFqq1pb58ualnh7MVc=
X-Received: from pldp13.prod.google.com ([2002:a17:902:eacd:b0:21a:807a:3652])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:aa85:b0:21a:7e04:7021 with SMTP id d9443c01a7336-21a8d6b903amr22214385ad.24.1736394998346;
 Wed, 08 Jan 2025 19:56:38 -0800 (PST)
Date: Thu,  9 Jan 2025 03:55:05 +0000
In-Reply-To: <20250109035605.1486717-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109035605.1486717-1-guanyulin@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109035605.1486717-2-guanyulin@google.com>
Subject: [PATCH v7 1/5] usb: dwc3: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Separate dev_pm_ops for different power events such as suspend, thaw,
and hibernation. This is crucial when dwc3 driver needs to adapt its
behavior based on different power state changes.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/dwc3/core.c | 77 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 6c960ff30c92..0735881d4650 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2632,6 +2632,76 @@ static int dwc3_resume(struct device *dev)
 	return ret;
 }
 
+static int dwc3_freeze(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	int		ret;
+
+	ret = dwc3_suspend_common(dwc, PMSG_FREEZE);
+	if (ret)
+		return ret;
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	return 0;
+}
+
+static int dwc3_thaw(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	int		ret;
+
+	pinctrl_pm_select_default_state(dev);
+
+	pm_runtime_disable(dev);
+	pm_runtime_set_active(dev);
+
+	ret = dwc3_resume_common(dwc, PMSG_THAW);
+	if (ret) {
+		pm_runtime_set_suspended(dev);
+		return ret;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static int dwc3_poweroff(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	int		ret;
+
+	ret = dwc3_suspend_common(dwc, PMSG_HIBERNATE);
+	if (ret)
+		return ret;
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	return 0;
+}
+
+static int dwc3_restore(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	int		ret;
+
+	pinctrl_pm_select_default_state(dev);
+
+	pm_runtime_disable(dev);
+	pm_runtime_set_active(dev);
+
+	ret = dwc3_resume_common(dwc, PMSG_RESTORE);
+	if (ret) {
+		pm_runtime_set_suspended(dev);
+		return ret;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
 static void dwc3_complete(struct device *dev)
 {
 	struct dwc3	*dwc = dev_get_drvdata(dev);
@@ -2649,7 +2719,12 @@ static void dwc3_complete(struct device *dev)
 #endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops dwc3_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(dwc3_suspend, dwc3_resume)
+	.suspend = pm_sleep_ptr(dwc3_suspend),
+	.resume = pm_sleep_ptr(dwc3_resume),
+	.freeze = pm_sleep_ptr(dwc3_freeze),
+	.thaw = pm_sleep_ptr(dwc3_thaw),
+	.poweroff = pm_sleep_ptr(dwc3_poweroff),
+	.restore = pm_sleep_ptr(dwc3_restore),
 	.complete = dwc3_complete,
 
 	/*
-- 
2.47.1.613.gc27f4b7a9f-goog


Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A092322B8AB
	for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737035677; cv=none; b=RANAGcq3DOaUiKvxodAY5B5UnzifS8cC21ZJxD7YXDyX88vwzI9n7UlGF3FOKvobnONoart/WAorAz26MWEKutc0FxYqcfuMZSxqOnnWcNNWieDG328gKwDuK1k7iW3bSmIa5puvjmFy1dWVFtggjJqpB658tfBB6dwbqLlgDZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737035677; c=relaxed/simple;
	bh=0NycYGu5HX5HIzAcJbBdr0cNDobK1Lk+gWnlktNiraE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZIlbxZbEa99JqMbk5h5qqUh1j9ZbunV5m2nO/IBAYLxyJAgeZXWimEGX5Q6ZnEZfAo7bugl9PbdVhfmPkRPHp8dDrmAIl2DRfAUGbB/MvCDypbGd0+KGSR9CTrD88a9T57LTpbFK/fk6mjL4K8to+VD/1msldn1vUqIH1JzehNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tG72xwNg; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tG72xwNg"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2162f80040aso18280215ad.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 05:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737035674; x=1737640474; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RCJkWTokxKqqVc3PnxwU+b4mjlCy0+MI0S9WquV+jXU=;
        b=tG72xwNgpCNUc77WEbnoHqP/PsDRN6jp32u3HWgMpEOtpX6g71Q0y+qrfBoPnMKBZt
         zfqkbbmgMYV+GosaHNrPOwOos3gNVoRhAJlFfS9suIoCzdr6kpUeZ9MrRPhMFs71R2aY
         3WrG4PDdYmxXmMyZcC/kjH2N+M3X/H6uIGGlZYSYCmn+nL3MS5dWkku7s4LDBEjfH8vj
         0/RmEE2XA8a0xiN4ixfEulae+C1huonY40hKamPRidJetDiEa3YIBSyCsjFn4FOsFZ5+
         s33ssgPgsRFsYd/ugGJuFsQ7c5F+DhPvymZ3Oi/euJ4mBYZAz9hzjdOF8AF8x9ErNbqh
         pdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737035674; x=1737640474;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCJkWTokxKqqVc3PnxwU+b4mjlCy0+MI0S9WquV+jXU=;
        b=i+zWGUlaZqX0CFinYkTUlEG8S+3seRZSW9ncBxPTU01lpY4CoHuJyP+drDSAH72KjK
         rOjOOh898cV9VjW5mnOAniJ6oAYzM+bWy8Umny4j8dF05gNNXrFYf75z8pSDE5kQER/2
         U+ynymYAJLRGR9jy5ChSpBv05l6wOl8qmlQqWDtn9qDxaBQK6ykqS/8w7CEoWwcwzTHt
         haVLpXp2ZSnvawMV76l9V0pMoiWG9oNPBCACzdhocz51CG3Z9XmjFI9zgaylODmbmBgM
         0QP40bRQXpn98mVKmHM6JdUcojpMmxnbnUQbVWh7NG5Ch7mBnNxqTsKrvkX1gk715KBt
         ckKA==
X-Forwarded-Encrypted: i=1; AJvYcCWrYdp7lOcUtrtybVfwabkysCiImMevLa3qM03AJKn5WAjB0tMqbciPcuiS2WHZKxNXaKPvqAitXbpb1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfQmOxkUFFz593gdrHOJLPTzESv80ELScg9PND1n6hvrPWNPSJ
	ZKBko2r0Fomw6M0gRXfj59ixvzdC3emqwhBfhOHNV3ja0LlSvOUaHLSF68LhwnxqbxXOtbBRk6D
	Wtz+RM3sPLpV+mA==
X-Google-Smtp-Source: AGHT+IEkH31TPDocapE0PpSLmzIIe3ly9TWrLnZP68uAj+iMOBcC23frOUBvtBRsh3pTGeGl/9K/82zsf9tEAEw=
X-Received: from pgvi5.prod.google.com ([2002:a65:61a5:0:b0:7fd:558c:c660])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:840a:b0:1e3:e77d:1431 with SMTP id adf61e73a8af0-1e88d10ccbbmr53259101637.23.1737035673983;
 Thu, 16 Jan 2025 05:54:33 -0800 (PST)
Date: Thu, 16 Jan 2025 13:50:14 +0000
In-Reply-To: <20250116135358.2335615-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250116135358.2335615-1-guanyulin@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250116135358.2335615-3-guanyulin@google.com>
Subject: [PATCH v8 2/5] usb: xhci-plat: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Separate dev_pm_ops for different power events such as suspend, thaw,
and hibernation. This is crucial when xhci-plat driver needs to adapt
its behavior based on different power state changes.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/host/xhci-plat.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3acdbbd9aea3..b676d4dbcec1 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -450,7 +450,7 @@ void xhci_plat_remove(struct platform_device *dev)
 }
 EXPORT_SYMBOL_GPL(xhci_plat_remove);
 
-static int xhci_plat_suspend(struct device *dev)
+static int xhci_plat_suspend_common(struct device *dev, struct pm_message pmsg)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
@@ -478,6 +478,21 @@ static int xhci_plat_suspend(struct device *dev)
 	return 0;
 }
 
+static int xhci_plat_suspend(struct device *dev)
+{
+	return xhci_plat_suspend_common(dev, PMSG_SUSPEND);
+}
+
+static int xhci_plat_freeze(struct device *dev)
+{
+	return xhci_plat_suspend_common(dev, PMSG_FREEZE);
+}
+
+static int xhci_plat_poweroff(struct device *dev)
+{
+	return xhci_plat_suspend_common(dev, PMSG_HIBERNATE);
+}
+
 static int xhci_plat_resume_common(struct device *dev, struct pm_message pmsg)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
@@ -524,6 +539,11 @@ static int xhci_plat_resume(struct device *dev)
 	return xhci_plat_resume_common(dev, PMSG_RESUME);
 }
 
+static int xhci_plat_thaw(struct device *dev)
+{
+	return xhci_plat_resume_common(dev, PMSG_THAW);
+}
+
 static int xhci_plat_restore(struct device *dev)
 {
 	return xhci_plat_resume_common(dev, PMSG_RESTORE);
@@ -553,9 +573,9 @@ static int __maybe_unused xhci_plat_runtime_resume(struct device *dev)
 const struct dev_pm_ops xhci_plat_pm_ops = {
 	.suspend = pm_sleep_ptr(xhci_plat_suspend),
 	.resume = pm_sleep_ptr(xhci_plat_resume),
-	.freeze = pm_sleep_ptr(xhci_plat_suspend),
-	.thaw = pm_sleep_ptr(xhci_plat_resume),
-	.poweroff = pm_sleep_ptr(xhci_plat_suspend),
+	.freeze = pm_sleep_ptr(xhci_plat_freeze),
+	.thaw = pm_sleep_ptr(xhci_plat_thaw),
+	.poweroff = pm_sleep_ptr(xhci_plat_poweroff),
 	.restore = pm_sleep_ptr(xhci_plat_restore),
 
 	SET_RUNTIME_PM_OPS(xhci_plat_runtime_suspend,
-- 
2.48.0.rc2.279.g1de40edade-goog


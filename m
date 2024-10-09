Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C931166307
	for <linux-sound@vger.kernel.org>; Wed,  9 Oct 2024 05:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728452729; cv=none; b=FtmnXoWB0GLtDKi3AvtS3sjYtlbo5ZEdrt8auJs1bhW8ULG05e6agj25J2+mYyzxso64NppZhIqq86alImFt0LVXpLD4UhS5FmCEfkiqpzY/cpOe0lQju7pM2vnoFPBh+g1BzqWINn9ctDUnJfw/z/+RK1YVBaUCTzXZMIZD1NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728452729; c=relaxed/simple;
	bh=jIbnaTHgtuirgsNY3ISWXJAyFgcWfdkjNgjVzXsbgbQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bc781fR8k+7ehKbzsbE5KvYUHzHyifkq29TvGiRduIbec78jx82ybcdiRMKi2DEQZpGtCGw/qQVfDidYjdmLc6bD1BgAMLHRPBatD9vVYncKmuVp9Pm1rKwuUmwatSdo/HSakfIyfY+atsgXqxhz0myD52FUmGqEr6ezzhk2+sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D4S93nn1; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D4S93nn1"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e284982a31so105609727b3.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Oct 2024 22:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728452726; x=1729057526; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oXpWvPQ3Bnbo8Iave6r4WAuwxHNQGna3l+dWKXVRiGs=;
        b=D4S93nn1hJvti164pjPBATy+uOB5J1c6DCP3+HRKOaORY+3bEx0G1py5NsaNYqIJNL
         S6O2cTxCTSMYh0oebwGJ7VlPXov0OHUctUKdW5vDFNct9aHd0MFLyE1lvERR2YPdtgNl
         K4qlDaPHVwXU7Jhpqd0FjcWEvv6Fk0//Of6W0NJmF+QfrOzNS0+HeTiTU4VcLxhpzyg5
         CLhNKbxno2y7Muf8ZYRi7eQiIu8rz1ZpQIsbdw9nC5v06AO8gIwdeJ/xKh0Sju7liiSN
         B629DURzgxTfrdFld8jpF3qzzWkvo0UO56sn/AqYJhBFu1AVHmEA/mvyhkTTa141iSmu
         qKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728452726; x=1729057526;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXpWvPQ3Bnbo8Iave6r4WAuwxHNQGna3l+dWKXVRiGs=;
        b=JgqNJoaKneWh/oAiA/ae3iBW/rypjPFkF5HQJVqf3mJEJR1ElxWh418Sn3DnoaJc0/
         F02IYLQWEb92I6CU+6/aus3M7FCkChk+VR3wV8Fpk94DDMUjYA8ZtvbATkPKRTBuJueQ
         SSjd7ZKWXinyfqg8Fga1Wluj8XpNHxTKX8u+6oEM1MV+PxXp/mXNyV4gspPsKy4rRNE3
         2s2U52M6dVjU2DExf1VRz4QKi4TYSlsq85tvn6DjQIfsPd8e0L+VoUhhyq9HvFDHgZSQ
         0/hxeTMWrheBJj+92yQHtv8LNCzRVErInRVbtxk34TTwFQKn97RuiEa3fpb2Bhd0oA9l
         9YWw==
X-Forwarded-Encrypted: i=1; AJvYcCVPkevt1VF03XuhGooWrMw/Apv38WXo+LG2xqflDQYWd8TS6Zu81VZtC62vKYfNNSTU++w5VakY7qbfwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTg1AtBi8tA35M0tmXGh7HkSyW9sO6F0FW9fT0ky0+aXIy0BVH
	I/7dAmhV/DyrRUIYnEApsP1F7MClSqMCvM9B42YGL3/0sYuoc3f9GAu6wDQi6bTiOCoRFi8/a35
	gze9UaEIGYrdBAw==
X-Google-Smtp-Source: AGHT+IEZQJLvdxSgG+wQehShtlfb17MEExjWTQ9LAcpQa9gV63RRjMiR64ZdHK5dbdoEiPGh+XtCBQ9/Q4uVKpE=
X-Received: from guanyulin.c.googlers.com ([fda3:e722:ac3:cc00:131:cd17:ac11:19c7])
 (user=guanyulin job=sendgmr) by 2002:a25:69c5:0:b0:e28:e6a1:fc53 with SMTP id
 3f1490d57ef6-e28fe4bc5f0mr17350276.5.1728452725953; Tue, 08 Oct 2024 22:45:25
 -0700 (PDT)
Date: Wed,  9 Oct 2024 05:42:55 +0000
In-Reply-To: <20241009054429.3970438-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241009054429.3970438-1-guanyulin@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241009054429.3970438-2-guanyulin@google.com>
Subject: [PATCH v4 1/5] usb: dwc3: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, elder@kernel.org, 
	oneukum@suse.com, yajun.deng@linux.dev, dianders@chromium.org, 
	kekrby@gmail.com, perex@perex.cz, tiwai@suse.com, tj@kernel.org, 
	stanley_chang@realtek.com, andreyknvl@gmail.com, 
	christophe.jaillet@wanadoo.fr, quic_jjohnson@quicinc.com, 
	ricardo@marliere.net, grundler@chromium.org, niko.mauno@vaisala.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, badhri@google.com, albertccwang@google.com, 
	quic_wcheng@quicinc.com, pumahsu@google.com, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Separate dev_pm_ops for different power events such as suspend, thaw,
and hibernation. This is crucial when dwc3 driver needs to adapt its
behavior based on different power state changes.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/dwc3/core.c | 77 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index b25d80f318a9..2fdafbcbe44c 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2582,6 +2582,76 @@ static int dwc3_resume(struct device *dev)
 	return 0;
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
@@ -2599,7 +2669,12 @@ static void dwc3_complete(struct device *dev)
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
 	SET_RUNTIME_PM_OPS(dwc3_runtime_suspend, dwc3_runtime_resume,
 			dwc3_runtime_idle)
-- 
2.47.0.rc0.187.ge670bccf7e-goog


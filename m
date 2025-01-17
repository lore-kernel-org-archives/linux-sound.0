Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5E178F37
	for <linux-sound@vger.kernel.org>; Fri, 17 Jan 2025 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737125567; cv=none; b=flYbikN9Uv/sMjoW/QuChuPMvtVx9egVvoUPa38pjJACGf0uxHvB6Qo+S/3g+RMqj8XytfsUKcbYtuKeYk0wANMBMvQP2MUTqzmHv94UipUcvMSLJWavwcxJKAAYJqALhBZnY4ZuHPC9enWpNSGD23pUsXUj5IIixFp3Ql698Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737125567; c=relaxed/simple;
	bh=FNJJD9zaL9tYqwWTeIV7vxHf0s0Y2Sf04iiJXfVPKQo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BHEF+9mMouX/WaPz9SknNgTlJdlfszo3+EuQ7rxshjLIBDZS+YebbjJvu2yW6MpPoSDD+8ECOJ1GARlecQ2njSKR3RCg8k62odVcTciCeGYAmze9UwlXV/kBwTDNnnRD3VzwDShgsN8bTjUtsSN1tK2lkPkfnOZKINKQB5mdceo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OFrJ+Ltf; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OFrJ+Ltf"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2162f80040aso39820375ad.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Jan 2025 06:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737125565; x=1737730365; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBcwJTu+fcJiwVaAq8fITjD7AnDF8kvfA86ysnCa1q4=;
        b=OFrJ+LtfTzgZrjtMaAVZclJCBsi3EsDrrXojY+L5nFlKrIuDJ6spu8eCWkUN8DhNqH
         kN7wWRGi4qYCRkaUiNBY3kHcOxW1snohWrXcckWU32X63kakAd5zWR5sbSrfFQfFBqPA
         e8s2gWvUgFoEotnxX+DolR6hB1vV1Xuz65dhGFDMzr4pqaF4H7gFJTb/8LVhGcnmTyKy
         WhIhCaqbLbFbYfFKaocbibIFwIHnwqLJZ8NtLa2oq/lOcA6KUIO5j6NgJhnPo2a8Tepn
         lzp18wSrqre3RzswG0VBYC0N7PEfdGOrB/yzHgaz/TIKNaeJMVuNk55UV4IMVUPx9GiY
         AzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737125565; x=1737730365;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBcwJTu+fcJiwVaAq8fITjD7AnDF8kvfA86ysnCa1q4=;
        b=UYeGvEpX7qzWfAykog1K6QPZCytodP2nhHeSEkCHzNQgIDMN0br8kLNObywjFXBTIQ
         nNfDvPUCdXEsEYvfXiMYMXqnVM05A8Snqti+RraisQrOH0zVPqdnNJNaVn1dW0X7TWcZ
         63N95kItpyRoShGRsKwa0RXRfTXSgk+bV1vyR+Pq8abC8b8iPzNzmmYPS+FWYrq6dTkE
         HMkAd/z7jyelmyPHDlymVqWgVgB9quBBQUrdhCA4sCxef45jWTo6YY7hFT8QxlBH+rKe
         TO1pjdmW7CcI2lbJwDoptIdfOm5vNY9PIbvCQQCPY58w+9itmPqRoneuO+37hG6OyLIZ
         NFnw==
X-Forwarded-Encrypted: i=1; AJvYcCUX07gnQDIA/ECR4HoQ0R0d9rtBnrNckhHTRSyM4Cgddgva4CxUl5xyT4XFHiVc8Et7Hy9oirdOKytBhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWx8lo5SjTkaogF5l83kqG1SaxIWMkxxN+MuaiFtkVEqq1d12X
	tgXuTqWVu0842+rw9MQcOL0ECV9zxQ8d3ZOPMn8eu31HrQW2GkTXfZSgyM+FDuP4STZyuVi/c+Z
	cfS71TCVYWAC5Rw==
X-Google-Smtp-Source: AGHT+IEoQgeczoM7fP36NuD2loQcNHOykfJKRvojEFPOft+QuArtSr1uer2ouUY/qHidSyvb/ZEyaw9Woj6DI6A=
X-Received: from plu4.prod.google.com ([2002:a17:903:3684:b0:216:6463:1a1f])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:11c3:b0:215:af12:b61a with SMTP id d9443c01a7336-21c35629a68mr39854665ad.50.1737125565203;
 Fri, 17 Jan 2025 06:52:45 -0800 (PST)
Date: Fri, 17 Jan 2025 14:48:01 +0000
In-Reply-To: <20250117145145.3093352-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250117145145.3093352-1-guanyulin@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117145145.3093352-2-guanyulin@google.com>
Subject: [PATCH v9 1/5] usb: dwc3: separate dev_pm_ops for each pm_event
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
2.48.0.rc2.279.g1de40edade-goog


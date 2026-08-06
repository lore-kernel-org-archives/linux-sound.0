Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2200C30FF08;
	Thu,  6 Aug 2026 06:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996361; cv=none; b=CD/E0Azb/pMyAI1sVRN5NPyYK95G5uOIyNHot9Fv7OWBFmO8mzDgiv7/z0ZeIVikeRvUdNM+vVGKAR6dUFtKDrivWgUyPzP+WyX9vQ7QcJhlqTd8BHxaS+KFJPlArSC9YdxhF/CEARUFsBbttN5TZXC11eClZ6yfV8ZhOqZ9+l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996361; c=relaxed/simple;
	bh=7Jy76+/tvbVo05J4sqwocfbNxzFnGXo8WBA4w86kuuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LP3z+guAExovpvoUkw6ZbwjFAqTHN2BgE+fEhA7GAuHHhlayv7ywW8WZPxbrepmzzsFn8JFEbueoEMVDwUf/Zn13SFHWr22IV1xz3hpt9VTRahUphS/2zLqfj9dNwQO0NVt8YUIboywxSkMcCRpC6TOlIATiYnd64MYIYovhO/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=W6ljugTR; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="W6ljugTR"
Received: from LAPTOP-99KJFSET (unknown [36.153.54.46])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48fb94a1e;
	Thu, 6 Aug 2026 14:05:54 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH] soc: qcom: apr: clean up failed service registrations
Date: Thu,  6 Aug 2026 14:05:40 +0800
Message-ID: <20260806060541.820-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fd5ad929903a1kunm5d97831428930d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTEsaVh4aHhkZSU1IHUNLTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKTkhVTk9VT01ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=W6ljugTRiDwUwwNMy0YNlkXxT3Eny0Oy/U4LAYr7BOcrXZWv2EsGLRB9qKaVdiwDNuVA9ghheZ0MOcRC/pI3Z8K6ABd8jByjtZpHEgtE6ZNUkzGhk+GWZ2WB7aA3d6fEOVSsZ4soAGlJcG6SrzGLJBc0M66Ig3DEXxxY6y0NTb4=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=vbvnEWDJpsJyWbAxQ0Srw0uA8bU/056MQ8UQvijqeSg=;
	h=date:mime-version:subject:message-id:from;

apr_add_device() publishes a service in svcs_idr before parsing the
optional protection domain and registering the device. If device
registration fails, put_device() frees the apr_device while its service
remains in the IDR. A received packet can then dereference that stale
entry. The property error path also leaves the service and allocation
behind.

Split device_register() into device_initialize() and device_add() so every
pre-registration error can safely drop the device reference. Remove the
service from the IDR on all failures after publication, then drain the RX
workqueue before dropping the device reference. This prevents an in-flight
lookup from outliving the device.

Fixes: 6adba21eb434 ("soc: qcom: Add APR bus driver")
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/soc/qcom/apr.c | 44 +++++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index ea7f83916d8d..d72628ac09f1 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -434,31 +434,35 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 	if (np)
 		snprintf(adev->name, APR_NAME_SIZE, "%pOFn", np);
 
+	adev->dev.bus = &aprbus;
+	adev->dev.parent = dev;
+	adev->dev.of_node = np;
+	adev->dev.release = apr_dev_release;
+	adev->dev.driver = NULL;
+	device_initialize(&adev->dev);
+
 	switch (apr->type) {
 	case PR_TYPE_APR:
-		dev_set_name(&adev->dev, "aprsvc:%s:%x:%x", adev->name,
-			     domain_id, svc_id);
+		ret = dev_set_name(&adev->dev, "aprsvc:%s:%x:%x", adev->name,
+				   domain_id, svc_id);
 		break;
 	case PR_TYPE_GPR:
-		dev_set_name(&adev->dev, "gprsvc:%s:%x:%x", adev->name,
-			     domain_id, svc_id);
+		ret = dev_set_name(&adev->dev, "gprsvc:%s:%x:%x", adev->name,
+				   domain_id, svc_id);
 		break;
 	default:
+		ret = -EINVAL;
 		break;
 	}
-
-	adev->dev.bus = &aprbus;
-	adev->dev.parent = dev;
-	adev->dev.of_node = np;
-	adev->dev.release = apr_dev_release;
-	adev->dev.driver = NULL;
+	if (ret)
+		goto out_put_device;
 
 	spin_lock(&apr->svcs_lock);
 	ret = idr_alloc(&apr->svcs_idr, svc, svc_id, svc_id + 1, GFP_ATOMIC);
 	spin_unlock(&apr->svcs_lock);
 	if (ret < 0) {
 		dev_err(dev, "idr_alloc failed: %d\n", ret);
-		goto out;
+		goto out_put_device;
 	}
 
 	/* Protection domain is optional, it does not exist on older platforms */
@@ -466,18 +470,26 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 					    1, &adev->service_path);
 	if (ret < 0 && ret != -EINVAL) {
 		dev_err(dev, "Failed to read second value of qcom,protection-domain\n");
-		goto out;
+		goto out_remove_idr;
 	}
 
 	dev_info(dev, "Adding APR/GPR dev: %s\n", dev_name(&adev->dev));
 
-	ret = device_register(&adev->dev);
+	ret = device_add(&adev->dev);
 	if (ret) {
-		dev_err(dev, "device_register failed: %d\n", ret);
-		put_device(&adev->dev);
+		dev_err(dev, "device_add failed: %d\n", ret);
+		goto out_remove_idr;
 	}
 
-out:
+	return 0;
+
+out_remove_idr:
+	spin_lock(&apr->svcs_lock);
+	idr_remove(&apr->svcs_idr, svc_id);
+	spin_unlock(&apr->svcs_lock);
+	flush_workqueue(apr->rxwq);
+out_put_device:
+	put_device(&adev->dev);
 	return ret;
 }
 
-- 
2.50.1.windows.1


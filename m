Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9846309DCD;
	Wed, 26 Nov 2025 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168850; cv=none; b=ZoScgXGzEEn6ov8wl3WHcdaKQIW8av+Xp+qFR73lnpvtOTa97erZn+iEHhRK5e6c4Y1pKnv7dlW3xMA0JsQP5xdiJvaD/YfDVCTPiO050OEmvD4ujL9k6hyAYGQxv2My2+xOEfXs/F6FdQORhQqqIb1nDf0byL1hRFqLj2xyJ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168850; c=relaxed/simple;
	bh=slWTP5BAFKhmyOpFq6S8rFhHy+d8mlfbAi6/HHhx2J4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KrDiMnBQrmt8U/Fmom7ilhBt+b2Hw+yzHWHrbxySH6GLzMuLbrJJZfIQKkhvToluahlxQMmsXmAX0WiS7NzrqsDzt61HyuMgAzLWHwPopgjYxqjTufjshxnnJKgEreS7B3WYnWzABStxTOcCEswQhelNy2qDpq9jj0gGW2MYgQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7AG7O1O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7AG7O1O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A66AC19425;
	Wed, 26 Nov 2025 14:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764168850;
	bh=slWTP5BAFKhmyOpFq6S8rFhHy+d8mlfbAi6/HHhx2J4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K7AG7O1O6IGebiP/OPFKOKrDeDLBH4g5Avbaa5qBuRHsqcGyhYc2k0v7pTWPhfIQe
	 8/SZl1RJ1Hmx7mK+/9SyUa54xtf8rYVlakVtXxlz3WMEAY7oeyhc23E2IsVcoZtN2C
	 h+BzBhLm2fwdp+xCm1aPbjC8BpnCmonkrKczSbruqoWuMJFkKXIX7xotOf2/bBG9TX
	 9sOmQfoxnzZwwuOuytJRdtRoVm1XpnO2OCD4GMbcvPVeMWzh0Iakv79LvcU594C1iW
	 KkyPIvXFH3Iu55hybxVOjL6R7a/6Qi7oegkwH/Hpa8rodunVGdLzQ9gMD0VHdl5jYl
	 NC1+VsQarDqnQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vOGuJ-000000001KE-3VcW;
	Wed, 26 Nov 2025 15:54:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 6/6] slimbus: core: clean up of_slim_get_device()
Date: Wed, 26 Nov 2025 15:53:29 +0100
Message-ID: <20251126145329.5022-7-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251126145329.5022-1-johan@kernel.org>
References: <20251126145329.5022-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up of_find_slim_device() by folding in the of_find_slim_device()
helper.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/slimbus/core.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index a2c243e3ad52..5079d3271ee8 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -390,21 +390,6 @@ struct slim_device *slim_get_device(struct slim_controller *ctrl,
 }
 EXPORT_SYMBOL_GPL(slim_get_device);
 
-static struct slim_device *of_find_slim_device(struct slim_controller *ctrl,
-					       struct device_node *np)
-{
-	struct slim_device *sbdev;
-	struct device *dev;
-
-	dev = device_find_child(ctrl->dev, np, device_match_of_node);
-	if (dev) {
-		sbdev = to_slim_device(dev);
-		return sbdev;
-	}
-
-	return NULL;
-}
-
 /**
  * of_slim_get_device() - get handle to a device using dt node.
  *
@@ -419,7 +404,16 @@ static struct slim_device *of_find_slim_device(struct slim_controller *ctrl,
 struct slim_device *of_slim_get_device(struct slim_controller *ctrl,
 				       struct device_node *np)
 {
-	return of_find_slim_device(ctrl, np);
+	struct slim_device *sbdev;
+	struct device *dev;
+
+	dev = device_find_child(ctrl->dev, np, device_match_of_node);
+	if (dev) {
+		sbdev = to_slim_device(dev);
+		return sbdev;
+	}
+
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(of_slim_get_device);
 
-- 
2.51.2


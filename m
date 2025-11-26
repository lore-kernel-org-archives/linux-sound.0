Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F052304BCA;
	Wed, 26 Nov 2025 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168850; cv=none; b=Dr2lQtfYAvSw9nzFgHggSgy4w4oi3F1W/QJKqjg2bjo0eqV2JdD22/4Ky6Dl2op5cgToy1sfMSmRuIGLH6/JOdTVl4YJ5HNc/UMVIyy3CLgDh4MxfnuCgcYlXcDd6GX7ZpSJjN21Y+0Izon7MyX5jVkJ815VzNEVs5a0Y5EwAg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168850; c=relaxed/simple;
	bh=XPrBoIMoV/gub0WvLQa0dq6M5sXoUt8lsULGPBHQsC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYldQKNL/dnMMEZ5tYC7HnZ1oaA+U59d9OBsyS90P+u0jdzPMDFyFNaIAxbUjGdggbGRHQm8XwlNZF1JH6hvKzygHp70JViwtZI9qTEPSOBZG0qbDTZFezBk188/L9BprDxC3CMnlUQLZR9HHxusnP6xtrl2OXow2k+kAVYJxoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+4myihp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+4myihp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F3BC19422;
	Wed, 26 Nov 2025 14:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764168850;
	bh=XPrBoIMoV/gub0WvLQa0dq6M5sXoUt8lsULGPBHQsC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f+4myihp6DNzi3sKOzkfZLCj2nLKZeVm+II2QzmB0I+j+sCyx23jhs6kxVN98HEnB
	 M451SDGFVBBBZOTBxqyMhxLA6adLSDLMSe4D1Znh5qpXJtqlEdg/Evd1qKLxhC3jnP
	 EGFxVDdWxo6Ba80MotaiaQo73VI5cy/zcb0plRyo2dSQWQrYNuf+KOMf/om3Vdibcw
	 oO0SQmLpqr1eehMUY137S5bA+wso6fIH39nuMVohq3a3Psg10tVVjNjVRCq5y2GcrP
	 gFJ85k7B4AurBn6I8LJ67PX3KEmbHVb66Y5nKSyhKc7kpK28mSARnK55nKqpztS4JR
	 WN2Uh5Soqx6qg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vOGuJ-000000001Jy-1dqG;
	Wed, 26 Nov 2025 15:54:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Subject: [PATCH 1/6] slimbus: core: fix OF node leak on registration failure
Date: Wed, 26 Nov 2025 15:53:24 +0100
Message-ID: <20251126145329.5022-2-johan@kernel.org>
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

Make sure to drop the OF node reference taken when initialising and
registering the slimbus device also on registration failure by releasing
it in the destructor as expected.

Fixes: 7588a511bdb4 ("slimbus: core: add support to device tree helper")
Fixes: 01360857486c ("slimbus: core: Fix mismatch in of_node_get/put")
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/slimbus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index 005fa2ef100f..c808233692ee 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -146,6 +146,7 @@ static void slim_dev_release(struct device *dev)
 {
 	struct slim_device *sbdev = to_slim_device(dev);
 
+	of_node_put(sbdev->dev.of_node);
 	kfree(sbdev);
 }
 
@@ -280,7 +281,6 @@ EXPORT_SYMBOL_GPL(slim_register_controller);
 /* slim_remove_device: Remove the effect of slim_add_device() */
 static void slim_remove_device(struct slim_device *sbdev)
 {
-	of_node_put(sbdev->dev.of_node);
 	device_unregister(&sbdev->dev);
 }
 
-- 
2.51.2


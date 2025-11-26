Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5776F30504C;
	Wed, 26 Nov 2025 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168850; cv=none; b=EbzYKyrFI68Y7affZhYbu454s+Obm0mUrTbcST4+YRhC+xWAn2a4Ejvz78kGWIzGgmLNtqrph4+Y7hdSEtxWUoSLB8xwhyVUB4YI6iOx2fLsVLPt8GpuIWmRz58nIyWjwGU9gjLaYS+UHbbrwwhB1L0QjHN5me+ytsl9MabV5Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168850; c=relaxed/simple;
	bh=GE9/tRQbAigOoX2Jm3C6MzvxaRrMJAsG2DD+F2OfW7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAqD8GNNuTstfmZwhOv2dmTj+DTYcfhwHkJboIbdem1trWZAWZkPiZH7Qj4gTLabLhJeZSzGgdDu05X3atGYdcpVwL/EOuPLEzZVJjXyG+X/q0jHg2jGeb995qljQ2XY/1qZDJg4E/H7M5A+LaDNOn5yqPm7Qjjro7S+Zbh+GZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qKgen2bu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qKgen2bu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188E7C116B1;
	Wed, 26 Nov 2025 14:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764168850;
	bh=GE9/tRQbAigOoX2Jm3C6MzvxaRrMJAsG2DD+F2OfW7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qKgen2bu1DVV7aGAC4WL4oifcatzx0KL0lFbbCsJgUMssT+cSTWyWPZWx1Jf3hTg+
	 84badzTrqH8KbwBg9QS2JysHKBWNcrNCJEXRyJ0BG+ihfy0lA6S7NSbk3Bazg47aDM
	 0T+dAm03CXQbW1+URCOL1GDCuZnscZPNg8SPqEKDMrXyPtTpvMOk7gAwdo/Eodopfw
	 RmyatbB3Wyqn+XzTpGTHvv+YYIgf/d7keXLuhitD9Xq6Jm1u1yEYRFK3MB9M5Ad32G
	 xkK0ZByG5yUIvmM+7W3h5BnNrzR97PuP0MEJTXzNcHcm6A7FUaTYVKu7Lam1Jbspqw
	 iDXW5p3+gviQA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vOGuJ-000000001K9-35rj;
	Wed, 26 Nov 2025 15:54:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/6] slimbus: core: fix of_slim_get_device() kernel doc
Date: Wed, 26 Nov 2025 15:53:28 +0100
Message-ID: <20251126145329.5022-6-johan@kernel.org>
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

Unlike slim_get_device() the of_slim_get_device() helper does not
allocate and register any slimbus devices in case lookup fails.

Update the of_slim_get_device() kernel doc to reflect this and add a
comment about the helper taking a reference to the returned device.

Fixes: e0772de8a48b ("slimbus: core: add of_slim_device_get() helper")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/slimbus/core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index 9402950e7ebd..a2c243e3ad52 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -408,11 +408,13 @@ static struct slim_device *of_find_slim_device(struct slim_controller *ctrl,
 /**
  * of_slim_get_device() - get handle to a device using dt node.
  *
- * @ctrl: Controller on which this device will be added/queried
+ * @ctrl: Controller on which this device will be queried
  * @np: node pointer to device
  *
- * Return: pointer to a device if it has already reported. Creates a new
- * device and returns pointer to it if the device has not yet enumerated.
+ * Takes a reference to the embedded struct device which needs to be dropped
+ * after use.
+ *
+ * Return: pointer to a device if it has been registered, otherwise NULL.
  */
 struct slim_device *of_slim_get_device(struct slim_controller *ctrl,
 				       struct device_node *np)
-- 
2.51.2


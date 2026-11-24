Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795560412;
	b=kZDx0dHEh2Ssnrw8JVAUc8g8vllSYlGOjj+JTF4/kwvvenGtrmR2OKUqALyP9eyd/ygt
	 o/VRrwwxN+91sCOGj5PiWkaDqrjbh3A3iGgZUM2T4CoCc++Dsco8CRQTdgN+dC+2YuDUp
	 TRjqGZBW/F1wVpcEdp+0U7hVmvGiy6gxU/ph9SWv3PI2ytlpq9qVPFUw6fhFdBSdfd3on
	 yb8HQ5eiqhKWODLTqrOi2dJOh4lLi8eziH60U1j11MR1qXfL1D+0GRMC6aVDciBNzjQyS
	 n+pFLv/N29sd/jZLY8dk91O4Qc7irFD61B4/PDhTW7v85Rp0lFZ4ANKRA9hcpZJCIfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560412;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=P1vmFLW8Trf7KPUYhuvAYw5AWIFsslviiSSCBriFog4=;
	b=yp7Zx/wBqW26+A6fmbU9nSUMMFZ4Z0wF8WN6Ola+cSbv83mZqj7OZNtdBsDzbZqi1R3u
	 6CeDFP71K19R/x6VLFbXb/NP81AtxKWI/Nupd82omqY1jhfACr5nxPkC+MYC+vo4Map2i
	 02rBJZVgIpwB/9TonUA2WXdC30xmfC3AdayIOABX+78v1WqvgEbIqmHcHYW/uqk+D9P6r
	 Fwx7gpK1m+25hM3RYqkDgSKgbl5GpnQox564xmtOxw7EiPY4j8IoI2Yu0pFf52aaxYLbC
	 gVnfvqe4MbLBb8klJBaTkXpuD3WqKZrGx2Q7Qv1cvhhwKIuGGbpamYHDNRJ+k++MAeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UO0h7U97;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EFF606A31E;
	Tue, 24 Nov 2026 22:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UO0h7U97
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795560411;
	b=S1UrI5AkuEWoLJF/KW1chMzUDlhRdAbsqxuisMH0/gsG85ZH1BTn6luEqb2mp72XohD7
	 jiA6qNd5s6nsA7KFlq9Yw2YbvBmKAUOXigeWwcZQL5UFV+PLtddfE7h/Sj1ssGLcHg9BS
	 0lF7lJg3IclfBQ4Bla7JXz8uUmwYaA5zum5adxVJ4sWBqCpkc1Bv5OsQ1d8OKwCKTvzQy
	 C1JM5UN7xK/+3LDYW8+xCs1hzqVcWGCtvs6FonxAd3lVgGJs7h0SGZqDE6Z50lI3+ykpA
	 KcRoy1LDxhW4M/Ncujz9r6bJbXsgz6bQVNBMQtkFGK8+R9Nf2hZCePf5Q4GuhjgYNeg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795560411;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=P1vmFLW8Trf7KPUYhuvAYw5AWIFsslviiSSCBriFog4=;
	b=kuQckzt3pYg+hCIXzpYx2zELQtJ/y0pILgXgRJI/MZULieGnJ5hMrwznr7Y5nYKPA4ni
	 DaVSred62Nezz51g7sqbC8mhAENOKrUfjXVvwbhVpAkGGBDkr3Fp/sTiMta9vPB9+Uogz
	 ygE1CeqCpB0uuNDB0gHLd6oOzU6mTE4uBihAAsYWioncdpXZQYs3Xi/gE9EwHqjBPqzHk
	 w07jhNUcCmnmMJ0kH/J3MEVAdd/NVJfRvoytBgDwFXnMaDWleN0SUm53uFeFN8072dNRq
	 IWiLV61Fpbc89pL1uTsGVeIrfaJA7QYxHzTkkmjpO9fOVdCo/mY5tPRVsy50Opn3k9w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CEB381F000D0;
	Tue, 24 Nov 2026 22:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795560411;
	bh=P1vmFLW8Trf7KPUYhuvAYw5AWIFsslviiSSCBriFog4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UO0h7U97LyxCGwnnVyG0lD14+/NQkl1jqKWK0z/1aGbgJWak7rMZGb0frjSLQXXMB
	 6EGM6V1jXm+z9IBAIxxZBLzVinJVSGomUWSsdfW3v3zc5f7Nrek8tzskSMZnOOJWAm
	 7OZ/9ZyFfaZZp7JJQBLNtRrECgte4GQ2Ize2jeg7GPrZ/+0vMUZOCPdAq5H7K0jNyK
	 JON4MDk+uRxrlSRckE4DXI4LVFsXXrTTTQswpggTeYQMul7trdtrOkM4mTj5URiC3+
	 jtOhh1bg/p6ekxZJOqFfw4epSJuywUYZIPNMCKkbS8OpM9nWPs+O//swU+0RCrcZyH
	 nNRUnod0Up93A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 54A9F4CBFD;
	Tue, 24 Nov 2026 22:46:47 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 23:46:46 +0100
Subject: [PATCH 1/2] soundwire: qcom: serialize WCD AHB bridge transactions
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-qcom-soundwire-fixes-v1-1-8ca94d60ddd6@gmail.com>
References: <20261124-qcom-soundwire-fixes-v1-0-8ca94d60ddd6@gmail.com>
In-Reply-To: <20261124-qcom-soundwire-fixes-v1-0-8ca94d60ddd6@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795560406; l=3025;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=seKITjD52g3wa0NvgJltN4epkXUV8cHeix7iGN/p92s=;
 b=PK2gUqlFU6DD8vPsRfN4klIBZoNkLXSQDBwnYArD2JhvQnDg19gmRbUrbiMj4hV59qpxORz3F
 /9rB3bG1H1pBJNbxU+SF+3IN0GKH/B1LtFBQ81JpPHF9HXathULbIcf
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

On SLIMbus-hosted WCD934x Qualcomm SoundWire controllers, each AHB
bridge register access spans two separate regmap_bulk_*() transfers
(SWRM_AHB_BRIDGE_RD_ADDR_0 followed by SWRM_AHB_BRIDGE_RD_DATA_0, or
SWRM_AHB_BRIDGE_WR_DATA_0 followed by SWRM_AHB_BRIDGE_WR_ADDR_0).

Without controller-level serialization across each pair, concurrent
accesses from the threaded IRQ handler and bus/init callers can
interleave on the shared AHB bridge registers and corrupt reads or
writes.

Add ahb_lock to struct qcom_swrm_ctrl to serialize each two-step AHB
bridge register transaction.

Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/soundwire/qcom.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index c31d921..368f511 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -202,6 +202,8 @@ struct qcom_swrm_ctrl {
 	struct completion enumeration;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
+	/* Serialize two-step WCD AHB bridge address/data accesses */
+	struct mutex ahb_lock;
 	struct clk *hclk;
 	int irq;
 	u32 ee;
@@ -388,18 +390,18 @@ static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
 	struct regmap *wcd_regmap = ctrl->regmap;
 	int ret;
 
+	mutex_lock(&ctrl->ahb_lock);
 	/* pg register + offset */
 	ret = regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_RD_ADDR_0,
-			  (u8 *)&reg, 4);
+				(u8 *)&reg, 4);
 	if (ret < 0)
-		return SDW_CMD_FAIL;
+		goto out;
 
 	ret = regmap_bulk_read(wcd_regmap, SWRM_AHB_BRIDGE_RD_DATA_0,
 			       val, 4);
-	if (ret < 0)
-		return SDW_CMD_FAIL;
-
-	return SDW_CMD_OK;
+out:
+	mutex_unlock(&ctrl->ahb_lock);
+	return ret < 0 ? SDW_CMD_FAIL : SDW_CMD_OK;
 }
 
 static int qcom_swrm_ahb_reg_write(struct qcom_swrm_ctrl *ctrl,
@@ -407,19 +409,20 @@ static int qcom_swrm_ahb_reg_write(struct qcom_swrm_ctrl *ctrl,
 {
 	struct regmap *wcd_regmap = ctrl->regmap;
 	int ret;
+
+	mutex_lock(&ctrl->ahb_lock);
 	/* pg register + offset */
 	ret = regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_WR_DATA_0,
-			  (u8 *)&val, 4);
+				(u8 *)&val, 4);
 	if (ret)
-		return SDW_CMD_FAIL;
+		goto out;
 
 	/* write address register */
 	ret = regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_WR_ADDR_0,
-			  (u8 *)&reg, 4);
-	if (ret)
-		return SDW_CMD_FAIL;
-
-	return SDW_CMD_OK;
+				(u8 *)&reg, 4);
+out:
+	mutex_unlock(&ctrl->ahb_lock);
+	return ret ? SDW_CMD_FAIL : SDW_CMD_OK;
 }
 
 static int qcom_swrm_cpu_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
@@ -1680,6 +1683,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->dev = dev;
 	dev_set_drvdata(&pdev->dev, ctrl);
 	mutex_init(&ctrl->port_lock);
+	mutex_init(&ctrl->ahb_lock);
 	init_completion(&ctrl->broadcast);
 	init_completion(&ctrl->enumeration);
 

-- 
2.56.0


